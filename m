Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A743F1FA859
	for <loongarch@lists.linux.dev>; Sat, 28 Mar 2026 04:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774672172; cv=none; b=nyzakA0xmXJ76IRC0CP9c6wnjm8qUevH9H9cMurcXoADS70v7Hf2nCfLbWoRQld2R9tUhj66IoWsi2qL1MNm9DDlX5P9ZYu6fps29lLXX2Oe6CEmDc52uRD9Zs5DerwkyF2O0iyQlEa9OAIk3GtELCQG0e/pH/vma/DqcrzfgkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774672172; c=relaxed/simple;
	bh=sL2oOMZ5oVS1ouIdDJ5qLzY4EaJkwfIfjze0HdhjJZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qkspj/cVgRz3BkkAT4MqXBXbhmAWA1uoV49o3un+5VWfG+Q+pnlpkmQIjvLTZM9E79GUlp2h//vIUhH4mrBt14AMC/oQS7fc809j4M6fqo8bkIFeLZ+upRN5otkDEJs3kbMjYF9DASMH5jGsQxq84eFDA62+Mak35raqwfxpamQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8DxssAfWcdpIYQfAA--.30640S3;
	Sat, 28 Mar 2026 12:29:19 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJAxVcAbWcdpDUZfAA--.30335S2;
	Sat, 28 Mar 2026 12:29:18 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Add HIGHMEM (PKMAP and FIX_KMAP) support
Date: Sat, 28 Mar 2026 12:29:08 +0800
Message-ID: <20260328042908.3184541-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxVcAbWcdpDUZfAA--.30335S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Kw1kZw1xKw4DCw4fCF48GrX_yoWDAF1UpF
	nrCwn5Wr4rG34IyrZxtas5urn8Jan7Kr12qFy2va4UZ3W2qr1DZr1kWrZxXFy8Xa95JFWf
	WryfGw1agFs8XwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==

Add HIGHMEM (High Memory) support for LoongArch, mostly needed by 32BIT
kernel because the size of kernel virtual memory space is only 512MB and
the size of usable physical memory is only 256MB in this case.

HIGHMEM adds permanent kernel mapping (PKMAP) and fixed kernel mapping
(FIX_KMAP), which increase usable physical memory up to 2.25GB (2304MB).

We can just use the generic copy_user_highpage(), so remove the custom
version.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig               |  5 +++
 arch/loongarch/include/asm/fixmap.h  | 14 +++++++
 arch/loongarch/include/asm/highmem.h | 43 ++++++++++++++++++++
 arch/loongarch/include/asm/page.h    |  4 --
 arch/loongarch/include/asm/pgtable.h | 12 ++++++
 arch/loongarch/mm/Makefile           |  1 +
 arch/loongarch/mm/highmem.c          | 12 ++++++
 arch/loongarch/mm/init.c             | 61 +++++++++++++++++++++-------
 arch/loongarch/mm/pgtable.c          | 27 ++++++++++++
 9 files changed, 161 insertions(+), 18 deletions(-)
 create mode 100644 arch/loongarch/include/asm/highmem.h
 create mode 100644 arch/loongarch/mm/highmem.c

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 2cdabdde3588..b7f827237f71 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -348,6 +348,11 @@ config RUSTC_HAS_ANNOTATE_TABLEJUMP
 
 source "kernel/Kconfig.hz"
 
+config HIGHMEM
+	bool "High Memory Support"
+	depends on 32BIT
+	select KMAP_LOCAL
+
 choice
 	prompt "Page Table Layout"
 	default 16KB_2LEVEL if 32BIT
diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/include/asm/fixmap.h
index d2e55ae55bb9..dce2da6ba787 100644
--- a/arch/loongarch/include/asm/fixmap.h
+++ b/arch/loongarch/include/asm/fixmap.h
@@ -8,10 +8,19 @@
 #ifndef _ASM_FIXMAP_H
 #define _ASM_FIXMAP_H
 
+#ifdef CONFIG_HIGHMEM
+#include <linux/threads.h>
+#include <asm/kmap_size.h>
+#endif
+
 #define NR_FIX_BTMAPS 64
 
 enum fixed_addresses {
 	FIX_HOLE,
+#ifdef CONFIG_HIGHMEM
+	FIX_KMAP_BEGIN,
+	FIX_KMAP_END = FIX_KMAP_BEGIN + (KM_MAX_IDX * NR_CPUS) - 1,
+#endif
 	FIX_EARLYCON_MEM_BASE,
 	__end_of_fixed_addresses
 };
@@ -25,4 +34,9 @@ extern void __set_fixmap(enum fixed_addresses idx,
 
 #include <asm-generic/fixmap.h>
 
+/*
+ * Called from pagetable_init()
+ */
+extern void fixrange_init(unsigned long start, unsigned long end, pgd_t *pgd_base);
+
 #endif
diff --git a/arch/loongarch/include/asm/highmem.h b/arch/loongarch/include/asm/highmem.h
new file mode 100644
index 000000000000..e6d7a662d340
--- /dev/null
+++ b/arch/loongarch/include/asm/highmem.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * highmem.h: virtual kernel memory mappings for high memory
+ *
+ * Used in CONFIG_HIGHMEM systems for memory pages which
+ * are not addressable by direct kernel virtual addresses.
+ *
+ * Copyright (C) 2025 Loongson Technology Corporation Limited
+ */
+#ifndef _ASM_HIGHMEM_H
+#define _ASM_HIGHMEM_H
+
+#ifdef __KERNEL__
+
+#include <asm/kmap_size.h>
+
+#ifndef __ASSEMBLER__
+
+extern pte_t *pkmap_page_table;
+
+#define ARCH_HAS_KMAP_FLUSH_TLB
+void kmap_flush_tlb(unsigned long addr);
+
+#endif /* !__ASSEMBLER__ */
+
+/*
+ * Right now we initialize only a single pte table. It can be extended
+ * easily, subsequent pte tables have to be allocated in one physical
+ * chunk of RAM.
+ */
+#define LAST_PKMAP 1024
+#define LAST_PKMAP_MASK (LAST_PKMAP - 1)
+#define PKMAP_NR(virt)	((virt - PKMAP_BASE) >> PAGE_SHIFT)
+#define PKMAP_ADDR(nr)	(PKMAP_BASE + ((nr) << PAGE_SHIFT))
+
+#define flush_cache_kmaps() do {} while (0)
+
+#define arch_kmap_local_post_map(vaddr, pteval)	local_flush_tlb_one(vaddr)
+#define arch_kmap_local_post_unmap(vaddr)	local_flush_tlb_one(vaddr)
+
+#endif /* __KERNEL__ */
+
+#endif /* _ASM_HIGHMEM_H */
diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
index 327bf0bc92bf..8121c0f136da 100644
--- a/arch/loongarch/include/asm/page.h
+++ b/arch/loongarch/include/asm/page.h
@@ -36,10 +36,6 @@ extern unsigned long shm_align_mask;
 
 struct page;
 struct vm_area_struct;
-void copy_user_highpage(struct page *to, struct page *from,
-	      unsigned long vaddr, struct vm_area_struct *vma);
-
-#define __HAVE_ARCH_COPY_USER_HIGHPAGE
 
 typedef struct { unsigned long pte; } pte_t;
 #define pte_val(x)	((x).pte)
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index c33b3bcb733e..cd5e56bfbe7f 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -23,6 +23,10 @@
 #include <asm-generic/pgtable-nop4d.h>
 #endif
 
+#ifdef CONFIG_HIGHMEM
+#include <asm/highmem.h>
+#endif
+
 #if CONFIG_PGTABLE_LEVELS == 2
 #define PGDIR_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT - PTRLOG))
 #elif CONFIG_PGTABLE_LEVELS == 3
@@ -86,7 +90,15 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #ifdef CONFIG_32BIT
 
 #define VMALLOC_START	(vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
+
+#ifdef CONFIG_HIGHMEM
+#define VMALLOC_END	(PKMAP_BASE - (2 * PAGE_SIZE))
+#else
 #define VMALLOC_END	(FIXADDR_START - (2 * PAGE_SIZE))
+#endif
+
+#define PKMAP_BASE	(PKMAP_END - (PAGE_SIZE * LAST_PKMAP))
+#define PKMAP_END	((FIXADDR_START) & ~((LAST_PKMAP << PAGE_SHIFT)-1))
 
 #endif
 
diff --git a/arch/loongarch/mm/Makefile b/arch/loongarch/mm/Makefile
index 278be2c8fc36..2aae3773de77 100644
--- a/arch/loongarch/mm/Makefile
+++ b/arch/loongarch/mm/Makefile
@@ -7,6 +7,7 @@ obj-y				+= init.o cache.o tlb.o tlbex.o extable.o \
 				   fault.o ioremap.o maccess.o mmap.o pgtable.o \
 				   page.o pageattr.o
 
+obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_KASAN)		+= kasan_init.o
 
diff --git a/arch/loongarch/mm/highmem.c b/arch/loongarch/mm/highmem.c
new file mode 100644
index 000000000000..8a5789ee6842
--- /dev/null
+++ b/arch/loongarch/mm/highmem.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/init.h>
+#include <linux/export.h>
+#include <linux/highmem.h>
+#include <asm/fixmap.h>
+#include <asm/tlbflush.h>
+
+void kmap_flush_tlb(unsigned long addr)
+{
+	flush_tlb_one(addr);
+}
+EXPORT_SYMBOL(kmap_flush_tlb);
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index c331bf69d2ec..bf51f4a1b086 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -39,20 +39,6 @@
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
 
-void copy_user_highpage(struct page *to, struct page *from,
-	unsigned long vaddr, struct vm_area_struct *vma)
-{
-	void *vfrom, *vto;
-
-	vfrom = kmap_local_page(from);
-	vto = kmap_local_page(to);
-	copy_page(vto, vfrom);
-	kunmap_local(vfrom);
-	kunmap_local(vto);
-	/* Make sure this page is cleared on other CPU's too before using it */
-	smp_wmb();
-}
-
 int __ref page_is_ram(unsigned long pfn)
 {
 	unsigned long addr = PFN_PHYS(pfn);
@@ -66,6 +52,9 @@ void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
 	max_zone_pfns[ZONE_DMA32] = MAX_DMA32_PFN;
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+#ifdef CONFIG_HIGHMEM
+	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
+#endif
 }
 
 void __ref free_initmem(void)
@@ -73,6 +62,50 @@ void __ref free_initmem(void)
 	free_initmem_default(POISON_FREE_INITMEM);
 }
 
+#ifdef CONFIG_HIGHMEM
+
+void __init fixrange_init(unsigned long start, unsigned long end, pgd_t *pgd_base)
+{
+	pgd_t *pgd;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+	int i, j, k;
+	int ptrs_per_pgd;
+	unsigned long vaddr;
+
+	vaddr = start;
+	i = pgd_index(vaddr);
+	j = pud_index(vaddr);
+	k = pmd_index(vaddr);
+	pgd = pgd_base + i;
+	ptrs_per_pgd = min((1 << (BITS_PER_LONG - PGDIR_SHIFT)), PTRS_PER_PGD);
+
+	for ( ; (i < ptrs_per_pgd) && (vaddr < end); pgd++, i++) {
+		pud = (pud_t *)pgd;
+		for ( ; (j < PTRS_PER_PUD) && (vaddr < end); pud++, j++) {
+			pmd = (pmd_t *)pud;
+			for (; (k < PTRS_PER_PMD) && (vaddr < end); pmd++, k++) {
+				if (pmd_none(*pmd)) {
+					pte = (pte_t *) memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
+					if (!pte)
+						panic("%s: Failed to allocate %lu bytes align=%lx\n",
+						      __func__, PAGE_SIZE, PAGE_SIZE);
+
+					kernel_pte_init(pte);
+					set_pmd(pmd, __pmd((unsigned long)pte));
+					BUG_ON(pte != pte_offset_kernel(pmd, 0));
+				}
+				vaddr += PMD_SIZE;
+			}
+			k = 0;
+		}
+		j = 0;
+	}
+}
+
+#endif
+
 #ifdef CONFIG_MEMORY_HOTPLUG
 int arch_add_memory(int nid, u64 start, u64 size, struct mhp_params *params)
 {
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 352d9b2e02ab..4ee188e38fed 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -5,6 +5,7 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/mm.h>
+#include <asm/fixmap.h>
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
 #include <asm/tlbflush.h>
@@ -144,6 +145,15 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 
 void __init pagetable_init(void)
 {
+#ifdef CONFIG_HIGHMEM
+	unsigned long vaddr;
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+#endif
+
 	/* Initialize the entire pgd.  */
 	pgd_init(swapper_pg_dir);
 	pgd_init(invalid_pg_dir);
@@ -153,4 +163,21 @@ void __init pagetable_init(void)
 #ifndef __PAGETABLE_PMD_FOLDED
 	pmd_init(invalid_pmd_table);
 #endif
+
+#ifdef CONFIG_HIGHMEM
+	/* Permanent kmaps */
+	vaddr = PKMAP_BASE;
+	fixrange_init(vaddr & PMD_MASK, vaddr + PAGE_SIZE * LAST_PKMAP, swapper_pg_dir);
+
+	pgd = swapper_pg_dir + pgd_index(vaddr);
+	p4d = p4d_offset(pgd, vaddr);
+	pud = pud_offset(p4d, vaddr);
+	pmd = pmd_offset(pud, vaddr);
+	pte = pte_offset_kernel(pmd, vaddr);
+	pkmap_page_table = pte;
+
+	/* Fixed mappings */
+	vaddr = __fix_to_virt(__end_of_fixed_addresses - 1);
+	fixrange_init(vaddr & PMD_MASK, vaddr + FIXADDR_SIZE, swapper_pg_dir);
+#endif
 }
-- 
2.52.0

