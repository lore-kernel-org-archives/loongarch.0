Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE07EB07
	for <loongarch@lists.linux.dev>; Thu, 17 Nov 2022 04:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369D6C433D6;
	Thu, 17 Nov 2022 04:28:23 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"David S . Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH 04/47] LoongArch: Set _PAGE_DIRTY only if _PAGE_WRITE is set in {pmd,pte}_mkdirty()
Date: Thu, 17 Nov 2022 12:25:32 +0800
Message-Id: <20221117042532.4064448-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now {pmd,pte}_mkdirty() set _PAGE_DIRTY bit unconditionally, this causes
random segmentation fault after commit 0ccf7f168e17bb7e ("mm/thp: carry
over dirty bit when thp splits on pmd").

The reason is: when fork(), parent process use pmd_wrprotect() to clear
huge page's _PAGE_WRITE and _PAGE_DIRTY (for COW); then pte_mkdirty() set
_PAGE_DIRTY as well as _PAGE_MODIFIED while splitting dirty huge pages;
once _PAGE_DIRTY is set, there will be no tlb modify exception so the COW
machanism fails; and at last memory corruption occurred between parent
and child processes.

So, we should set _PAGE_DIRTY only when _PAGE_WRITE is set in {pmd,pte}_
mkdirty().

Cc: stable@vger.kernel.org
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
Note: CC sparc maillist because they have similar issues.
 
 arch/loongarch/include/asm/pgtable.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 946704bee599..debbe116f105 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -349,7 +349,9 @@ static inline pte_t pte_mkclean(pte_t pte)
 
 static inline pte_t pte_mkdirty(pte_t pte)
 {
-	pte_val(pte) |= (_PAGE_DIRTY | _PAGE_MODIFIED);
+	pte_val(pte) |= _PAGE_MODIFIED;
+	if (pte_val(pte) & _PAGE_WRITE)
+		pte_val(pte) |= _PAGE_DIRTY;
 	return pte;
 }
 
@@ -478,7 +480,9 @@ static inline pmd_t pmd_mkclean(pmd_t pmd)
 
 static inline pmd_t pmd_mkdirty(pmd_t pmd)
 {
-	pmd_val(pmd) |= (_PAGE_DIRTY | _PAGE_MODIFIED);
+	pmd_val(pmd) |= _PAGE_MODIFIED;
+	if (pmd_val(pmd) & _PAGE_WRITE)
+		pmd_val(pmd) |= _PAGE_DIRTY;
 	return pmd;
 }
 
-- 
2.31.1

