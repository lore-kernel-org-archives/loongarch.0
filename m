Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F18214A9B
	for <loongarch@lists.linux.dev>; Sat,  6 Jun 2026 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780752136; cv=none; b=A67rXyPv1bz05SNJ5TvyZ5s6UudwzVHS+0A1h5NUyt0qxsxY+bR9t0v1UDsyzHK6Iy7PL0Diu6asT49hK6X71mScdW0rv59Hrb4rkTXsTJZqD4+KwlffRueGkMOjYyOaLgt0OQKoAYrN0KK8wwfehIwxioAaxC8dWxQ+/ndv2sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780752136; c=relaxed/simple;
	bh=YIgr/dfUitpAIGyrCeaAZGqybSo3r1gid59+ebeXEUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SRGIYi0AKTd9gj8RCPGZVDqXPkS+8aZK+m1PsvvSv9XajRBuAsV3mbZAt2gV9HfL4/IrfWDmMwqv50xAFZ35B70qi5zeZpilVZi6LAnVWSbBatElktwlZd4ZZKvlyABFcjY4mMZ5kyV3g3zLRdR0MfnlFjDUvwI6e8SVotCk9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g+6HDHxG; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g+6HDHxG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780752133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFxVxYHIFN149JVmey/A/yRZIp9tC2WDA/G0gT2sg40=;
	b=g+6HDHxGrvGzzxOUMk1Cl+/leL9T5DZKWqByOIV3DQ7zjTp++tuMlrC0ZSz6pSNdHVUgS4
	DJf+Ye4QM8yk9bXPmdLoPZFCi4ALfM39h+/8F5waPW+u/1GkY6/211SLvolvlaE2nHEfnJ
	9wCplMQP4W6NbfjMeYCwNcLW1yLY6iA=
From: haoran.jiang@linux.dev
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	akpm@linux-foundation.org,
	jbohac@suse.cz,
	kees@kernel.org,
	yangtiezhu@loongson.cn,
	Haoran Jiang <jianghaoran@kylinos.cn>
Subject: [PATCH 1/2] LoongArch: Move fixmap page tables to BSS segment
Date: Sat,  6 Jun 2026 21:21:25 +0800
Message-Id: <20260606132126.562034-2-haoran.jiang@linux.dev>
In-Reply-To: <20260606132126.562034-1-haoran.jiang@linux.dev>
References: <20260606132126.562034-1-haoran.jiang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Haoran Jiang <jianghaoran@kylinos.cn>

__set_fixmap() is not only used during initialization
but may also be invoked after the kernel is up.
Before this change, fixmap page tables resided in memblock.
After the change, they are placed in the BSS segment.
Thus, the fixmap becomes usable both during early boot and
after kernel startup.

Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
---
 arch/loongarch/include/asm/fixmap.h |  1 +
 arch/loongarch/kernel/setup.c       |  1 +
 arch/loongarch/mm/init.c            | 71 ++++++++++++++++++++++++++---
 3 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/include/asm/fixmap.h
index dce2da6ba787..5a9b04c720bf 100644
--- a/arch/loongarch/include/asm/fixmap.h
+++ b/arch/loongarch/include/asm/fixmap.h
@@ -31,6 +31,7 @@ enum fixed_addresses {
 
 extern void __set_fixmap(enum fixed_addresses idx,
 			 phys_addr_t phys, pgprot_t flags);
+void __init early_fixmap_init(void);
 
 #include <asm-generic/fixmap.h>
 
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 839b23edee87..2724d67a96cc 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -599,6 +599,7 @@ void __init setup_arch(char **cmdline_p)
 	fdt_setup();
 	memblock_init();
 	pagetable_init();
+	early_fixmap_init();
 	bootcmdline_init(cmdline_p);
 	parse_early_param();
 	reserve_initrd_mem();
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 031b39eb081c..4046d31f0266 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -36,6 +36,69 @@
 #include <asm/pgalloc.h>
 #include <asm/tlb.h>
 
+#define SPAN_NR_ENTRIES(vstart, vend, shift) \
+	((((vend) - 1) >> (shift)) - ((vstart) >> (shift)) + 1)
+
+#define NR_BM_PTE_TABLES \
+	SPAN_NR_ENTRIES(FIXADDR_START, FIXADDR_TOP, PMD_SHIFT)
+
+#define __BM_TABLE_IDX(addr, shift) \
+	(((addr) >> (shift)) - (FIXADDR_START >> (shift)))
+
+#define BM_PTE_TABLE_IDX(addr)  __BM_TABLE_IDX(addr, PMD_SHIFT)
+
+static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
+static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
+
+static inline pte_t *fixmap_pte(unsigned long addr)
+{
+	return &bm_pte[BM_PTE_TABLE_IDX(addr)][pte_index(addr)];
+}
+
+void __init early_fixmap_init(void)
+{
+	unsigned long addr = FIXADDR_START;
+	unsigned long end = FIXADDR_TOP;
+
+	pgd_t *pgd = pgd_offset_k(addr);
+	p4d_t *p4d = p4d_offset(pgd, addr);
+	pud_t *pud;
+	pmd_t *pmd;
+
+	unsigned long next;
+
+	if (p4d_none(p4dp_get(p4d))) {
+		pud = bm_pud;
+		p4d_populate(&init_mm, p4d, pud);
+#ifndef __PAGETABLE_PUD_FOLDED
+		pud_init(pud);
+#endif
+}
+
+	pud = pud_offset(p4d, addr);
+	if (pud_none(pudp_get(pud))) {
+		pmd = bm_pmd;
+		pud_populate(&init_mm, pud, pmd);
+#ifndef __PAGETABLE_PMD_FOLDED
+		pmd_init(pmd);
+#endif
+}
+
+	pmd = pmd_offset(pud, addr);
+	do {
+		next = pmd_addr_end(addr, end);
+		if (!pmd_present(pmdp_get(pmd))) {
+			pte_t *pte;
+
+			pte = bm_pte[BM_PTE_TABLE_IDX(addr)];
+			pmd_populate_kernel(&init_mm, pmd, pte);
+			kernel_pte_init(pte);
+		}
+	} while (pmd++, addr = next, addr != end);
+
+}
+
 int __ref page_is_ram(unsigned long pfn)
 {
 	unsigned long addr = PFN_PHYS(pfn);
@@ -203,7 +266,7 @@ pte_t * __init populate_kernel_pte(unsigned long addr)
 	return pte_offset_kernel(pmd, addr);
 }
 
-void __init __set_fixmap(enum fixed_addresses idx,
+void  __set_fixmap(enum fixed_addresses idx,
 			       phys_addr_t phys, pgprot_t flags)
 {
 	unsigned long addr = __fix_to_virt(idx);
@@ -211,11 +274,7 @@ void __init __set_fixmap(enum fixed_addresses idx,
 
 	BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);
 
-	ptep = populate_kernel_pte(addr);
-	if (!pte_none(ptep_get(ptep))) {
-		pte_ERROR(*ptep);
-		return;
-	}
+	ptep = fixmap_pte(addr);
 
 	if (pgprot_val(flags))
 		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
-- 
2.25.1

