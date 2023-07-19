Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6134D8832
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:33:51 +0000 (UTC)
X-UUID: 62e820fc96cc4d168ad342c21586d40f-20230719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:44c8e872-f164-4bb8-b9de-1fc0090e6674,IP:25,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:10
X-CID-INFO: VERSION:1.1.28,REQID:44c8e872-f164-4bb8-b9de-1fc0090e6674,IP:25,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-META: VersionHash:176cd25,CLOUDID:f917c5dc-dc79-4898-9235-1134b97257a8,B
	ulkID:230719161451G22TEPAY,BulkQuantity:1,Recheck:0,SF:24|17|19|44|38|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_FSI
X-UUID: 62e820fc96cc4d168ad342c21586d40f-20230719
X-User: lienze@kylinos.cn
Received: from ubuntu.. [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1370030671; Wed, 19 Jul 2023 16:28:18 +0800
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
Subject: [PATCH 1/4] LoongArch: mm: Add page table mapped mode support
Date: Wed, 19 Jul 2023 16:27:29 +0800
Message-Id: <20230719082732.2189747-2-lienze@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719082732.2189747-1-lienze@kylinos.cn>
References: <20230719082732.2189747-1-lienze@kylinos.cn>
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

Currently, the upstream code only supports DMM (Direct Mapped Mode).
This patch adds a function that determines whether PTMM (Page Table
Mapped Mode) should be used, and also adds the corresponding handler
funcitons for both modes.

For more details on the two modes, see [1].

[1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#virtual-address-space-and-address-translation-mode

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/include/asm/page.h    | 10 ++++++++++
 arch/loongarch/include/asm/pgtable.h |  6 ++++++
 arch/loongarch/mm/pgtable.c          | 25 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index 26e8dccb6619..05919be15801 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -84,7 +84,17 @@ typedef struct { unsigned long pgprot; } pgprot_t;
 #define sym_to_pfn(x)		__phys_to_pfn(__pa_symbol(x))
 
 #define virt_to_pfn(kaddr)	PFN_DOWN(PHYSADDR(kaddr))
+
+#ifdef CONFIG_64BIT
+#define virt_to_page(kaddr)						\
+({									\
+	is_PTMM_addr((unsigned long)kaddr) ?				\
+	PTMM_virt_to_page((unsigned long)kaddr) :			\
+	DMM_virt_to_page((unsigned long)kaddr);				\
+})
+#else
 #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
+#endif
 
 extern int __virt_addr_valid(volatile void *kaddr);
 #define virt_addr_valid(kaddr)	__virt_addr_valid((volatile void *)(kaddr))
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index ed6a37bb55b5..0fc074b8bd48 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -360,6 +360,12 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
 #define PMD_T_LOG2	(__builtin_ffs(sizeof(pmd_t)) - 1)
 #define PTE_T_LOG2	(__builtin_ffs(sizeof(pte_t)) - 1)
 
+#ifdef CONFIG_64BIT
+struct page *DMM_virt_to_page(unsigned long kaddr);
+struct page *PTMM_virt_to_page(unsigned long kaddr);
+bool is_PTMM_addr(unsigned long kaddr);
+#endif
+
 extern pgd_t swapper_pg_dir[];
 extern pgd_t invalid_pg_dir[];
 
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 36a6dc0148ae..4c6448f996b6 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -9,6 +9,31 @@
 #include <asm/pgtable.h>
 #include <asm/tlbflush.h>
 
+#ifdef CONFIG_64BIT
+/* DMM stands for Direct Mapped Mode. */
+struct page *DMM_virt_to_page(unsigned long kaddr)
+{
+	return pfn_to_page(virt_to_pfn(kaddr));
+}
+EXPORT_SYMBOL_GPL(DMM_virt_to_page);
+
+/* PTMM stands for Page Table Mapped Mode. */
+struct page *PTMM_virt_to_page(unsigned long kaddr)
+{
+	return pte_page(*virt_to_kpte(kaddr));
+}
+EXPORT_SYMBOL_GPL(PTMM_virt_to_page);
+
+bool is_PTMM_addr(unsigned long kaddr)
+{
+	if (unlikely((kaddr & GENMASK(BITS_PER_LONG - 1, cpu_vabits)) ==
+		     GENMASK(BITS_PER_LONG - 1, cpu_vabits)))
+		return true;
+	return false;
+}
+EXPORT_SYMBOL_GPL(is_PTMM_addr);
+#endif
+
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *ret, *init;
-- 
2.34.1

