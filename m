Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38408F49
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 06:15:27 +0000 (UTC)
X-UUID: 06f546de48c44ad099634202a5a5558d-20230725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:5ca60565-7f43-4364-9457-75cadd98427e,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.28,REQID:5ca60565-7f43-4364-9457-75cadd98427e,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:cebc4ad2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:230725141514N0X3POC0,BulkQuantity:0,Recheck:0,SF:44|38|24|17|19|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_ULS
X-UUID: 06f546de48c44ad099634202a5a5558d-20230725
X-User: lienze@kylinos.cn
Received: from ubuntu.. [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1695958714; Tue, 25 Jul 2023 14:15:11 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	glider@google.com,
	elver@google.com,
	akpm@linux-foundation.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Cc: zhangqing@loongson.cn,
	yangtiezhu@loongson.cn,
	dvyukov@google.com,
	Enze Li <lienze@kylinos.cn>
Subject: [PATCH 1/4 v2] LoongArch: mm: Add page table mapped mode support
Date: Tue, 25 Jul 2023 14:14:48 +0800
Message-Id: <20230725061451.1231480-2-lienze@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725061451.1231480-1-lienze@kylinos.cn>
References: <20230725061451.1231480-1-lienze@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to LoongArch documentation online, there are two types of address
translation modes: direct mapped address translation mode (direct mapped mode)
and page table mapped address translation mode (page table mapped mode).

Currently, the upstream kernel only supports direct mapped mode.
This patch adds a function that determines whether page table mapped
mode should be used, and also adds the corresponding handler functions
for both modes.

For more details on the two modes, see [1].

[1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#virtual-address-space-and-address-translation-mode

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/include/asm/page.h    | 19 ++++++++++++++++++-
 arch/loongarch/include/asm/pgtable.h |  2 ++
 arch/loongarch/mm/pgtable.c          |  6 ++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index 26e8dccb6619..e43a2385b2cd 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -32,6 +32,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pfn.h>
+#include <asm/cpu-features.h>
 
 /*
  * It's normally defined only for FLATMEM config but it's
@@ -84,7 +85,23 @@ typedef struct { unsigned long pgprot; } pgprot_t;
 #define sym_to_pfn(x)		__phys_to_pfn(__pa_symbol(x))
 
 #define virt_to_pfn(kaddr)	PFN_DOWN(PHYSADDR(kaddr))
-#define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
+
+static inline bool is_tlb_addr(unsigned long kaddr)
+{
+	if (unlikely((kaddr & GENMASK(BITS_PER_LONG - 1, cpu_vabits)) ==
+		     GENMASK(BITS_PER_LONG - 1, cpu_vabits)))
+		return true;
+	return false;
+}
+
+#define dwm_virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
+
+#define virt_to_page(kaddr)						\
+({									\
+	is_tlb_addr((unsigned long)kaddr) ?				\
+	tlb_virt_to_page((unsigned long)kaddr) :			\
+	dwm_virt_to_page((unsigned long)kaddr);				\
+})
 
 extern int __virt_addr_valid(volatile void *kaddr);
 #define virt_addr_valid(kaddr)	__virt_addr_valid((volatile void *)(kaddr))
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 38afeb7dd58b..98a0c98de9d1 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -353,6 +353,8 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
 #define PMD_T_LOG2	(__builtin_ffs(sizeof(pmd_t)) - 1)
 #define PTE_T_LOG2	(__builtin_ffs(sizeof(pte_t)) - 1)
 
+inline struct page *tlb_virt_to_page(unsigned long kaddr);
+
 extern pgd_t swapper_pg_dir[];
 extern pgd_t invalid_pg_dir[];
 
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 36a6dc0148ae..20e7425d235d 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -9,6 +9,12 @@
 #include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
+inline struct page *tlb_virt_to_page(unsigned long kaddr)
+{
+	return pte_page(*virt_to_kpte(kaddr));
+}
+EXPORT_SYMBOL_GPL(tlb_virt_to_page);
+
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *ret, *init;
-- 
2.34.1

