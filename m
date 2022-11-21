Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E607E
	for <loongarch@lists.linux.dev>; Mon, 21 Nov 2022 06:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC29C433D6;
	Mon, 21 Nov 2022 06:51:07 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Set _PAGE_DIRTY only if _PAGE_MODIFIED is set in {pmd,pte}_mkwrite()
Date: Mon, 21 Nov 2022 14:48:26 +0800
Message-Id: <20221121064826.2115193-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set _PAGE_DIRTY only if _PAGE_MODIFIED is set in {pmd,pte}_mkwrite().
Otherwise, _PAGE_DIRTY silences the TLB modify exception and make us
have no chance to mark a pmd/pte dirty (_PAGE_MODIFIED) for software.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/pgtable.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index debbe116f105..aa0e0e0d4ee5 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -357,7 +357,9 @@ static inline pte_t pte_mkdirty(pte_t pte)
 
 static inline pte_t pte_mkwrite(pte_t pte)
 {
-	pte_val(pte) |= (_PAGE_WRITE | _PAGE_DIRTY);
+	pte_val(pte) |= _PAGE_WRITE;
+	if (pte_val(pte) & _PAGE_MODIFIED)
+		pte_val(pte) |= _PAGE_DIRTY;
 	return pte;
 }
 
@@ -457,7 +459,9 @@ static inline int pmd_write(pmd_t pmd)
 
 static inline pmd_t pmd_mkwrite(pmd_t pmd)
 {
-	pmd_val(pmd) |= (_PAGE_WRITE | _PAGE_DIRTY);
+	pmd_val(pmd) |= _PAGE_WRITE;
+	if (pmd_val(pmd) & _PAGE_MODIFIED)
+		pmd_val(pmd) |= _PAGE_DIRTY;
 	return pmd;
 }
 
-- 
2.31.1

