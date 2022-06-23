Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD643CB
	for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 02:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88831C34114;
	Thu, 23 Jun 2022 02:50:38 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Fix the !THP build
Date: Thu, 23 Jun 2022 10:52:00 +0800
Message-Id: <20220623025200.1824399-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the !THP build by making pmd_pfn() available in all configurations.
Because pmd_pfn() is used in mm/page_vma_mapped.c whether or not THP is
configured.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/pgtable.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 5dc84d8f18d6..d9e86cfa53e2 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -426,6 +426,11 @@ static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 
 #define kern_addr_valid(addr)	(1)
 
+static inline unsigned long pmd_pfn(pmd_t pmd)
+{
+	return (pmd_val(pmd) & _PFN_MASK) >> _PFN_SHIFT;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
@@ -497,11 +502,6 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pmd;
 }
 
-static inline unsigned long pmd_pfn(pmd_t pmd)
-{
-	return (pmd_val(pmd) & _PFN_MASK) >> _PFN_SHIFT;
-}
-
 static inline struct page *pmd_page(pmd_t pmd)
 {
 	if (pmd_trans_huge(pmd))
-- 
2.27.0

