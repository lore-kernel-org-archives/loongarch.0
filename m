Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080593;
	b=O1oIBdeV5G0gfRepnQCejMZfHNwLwR88pA1fwzaaFZdWUaBgm1H37qcbIxO4Msa2cl2l
	 QKzZulodDOvUUWYvtqLTPF4wSpFP38GrHHLRBA18Q5bRlJjn+zB/pTLdQnCu+1NFPm+w5
	 ILWnZIaIW8S24QnMQTPPUxBt7/igVRyFs5znoQ/wlNl2DkOL5gIR95yMycTKUpuY/xlo7
	 UzxretVX1A+0iu21khGtNIPhj5VISDt/1/LXYeRYodpsF2BusfhT5reDE9EkGQUjPot/5
	 dNMyNLNCyXJ6B6M9/bL9liGmPmml2w9w+hOamJlzTT5xBv3QEhSMzq1BiPnpuqRcwfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080593;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=txYCjJfs5j4XwLL4ieXlwJE0ytwCERxwgKbZ/g1qp7A=;
	b=Jym+mPU1M2RqOJ3xMu1PoDjhZ28jN84Us68u+s6T5pk6YrW4UZH6LSMexbhwikWiIeWN
	 116IaSGj7Cr+9w7wlSUbcDgev9ly+e7EZeGBviaWCmmix2rhfQvzg+SyQs71L3KD0kHOK
	 ayyMDYocV95tXsrMkSLuOiTZtiTR+3BgKnvd7ZlYEDTP9e3rUqG6qrFGsqTUXabJZ5QzL
	 CqR5fw51BK1zSg4GOun2cgB2slEJPgQH/1OFLjqIVWqR4d4RWptGbDHH+kXHJEehfHwmU
	 PmwXFrMKSU5StV/ottJuqmVnQlqZv2+jcXeZtAJX8v2qT0Gn1sYud2V84tj7ndjFSnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.101
Received: from mta0.migadu.com (out-101.mta0.migadu.com [91.218.175.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE638606A31A
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 05:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE638606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=wlCicRN9cuHjOxPs8rS9lWuBJyi1Vu+zv5R/KmTZ9js=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793080586; v=1; x=1793685386;
 b=VJCcFYdo1nRSDR/w8u+DmH4B+WSed9w1J6N3LKuH5TTubx/j44KhXfSFVEXrtpq1zy2otagt
 F1t2OOvixi4oADZsGSgDcwWrmdzEup6Z7USFP83BnfN3D8oYCDkfrmilKjGn1xmMt6GdZB8UhZ4
 vT+6fopoepzAwTFU4/lG1RAA=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b5e50496e140431c;
	Tue, 27 Oct 2026 05:56:26 +0000
X-Mizu-Trace-ID: b5e50496e140431c
X-Migadu-Flow: FLOW_OUT
From: haoran.jiang@linux.dev
To: chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	kernel@xen0n.name,
	Haoran Jiang <jianghaoran@kylinos.cn>
Subject: [PATCH v2] LoongArch: add KASAN_VMALLOC support
Date: Tue, 27 Oct 2026 13:55:45 +0800
Message-Id: <20261027055545.381445-1-haoran.jiang@linux.dev>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Haoran Jiang <jianghaoran@kylinos.cn>

For the page table of the VMALLOC and MODULES
shadow regions, only partial page table needs
to be established, allowing the complete page
table entries to be populated on demand during use.

---
1,Add shallow parameter to kasan_pgd/p4d/pud/pmd/pte_populate,
page tables are established for the modules and vmalloc regions,
but the page tables are not fully populated; the complete page
tables are established automatically when vmalloc is used.
If the address is pgd-aligned, the page table is established
down to the pgd level; if it is pud-aligned, it is established
down to the pud level, and so on. While establishing the
/pgd/pud/pmd/pte levels, the page table entries must be initialized
to none. For example, a pmd entry of none is an invalid_pte_table.
Only in this way can the correct page tables be established at
use time. At the same time, boundary issues must be considered.
For example, mem_to_shadow(MALLOC_END) and mem_to_shadow(vmemmap)
are in the same pte, and the region [mem_to_shadow(vmemmap), mem_to_shadow(VMEMMAP_END)]
needs to be mapped to page 0. To avoid affecting the mem_to_shadow(vmemmap) region,
only the pte entries for [mem_to_shadow(MALLOC_END) & PMD_MASK, mem_to_shadow(MALLOC_END)]
need to be initialized to none. The remaining pte entries are left as they are.

2,The removal of kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_START),
mem_to_shadow((void *)KFENCE_AREA_END)) achieves the same effect as
kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE, true);
 both map this region to a shared zero page. (KASAN_SHADOW_START, KASAN_SHADOW_END)
already covers (mem_to_shadow((void *)VMALLOC_START), mem_to_shadow((void *)KFENCE_AREA_END)).
Other architectures such as arm64/riscv need kasan_populate_early_shadow
because clear_shadow(KASAN_SHADOW_START, KASAN_SHADOW_END) is performed before
 kasan_populate_early_shadow, so the reserved region must be mapped to the zero
page again. On LoongArch, however, the entire shadow space is first mapped to
page 0 via kasan_pgd_populate, and then page tables are established for the
required regions, which is simpler and clearer.

3,pgd_none/p4d_none/pmd_none/pte_none were added to the definitions of
__pgd_none/__p4d_none/__pud_none/__pmd_none/__pte_none respectively
because kasan_populate_early_vm_area_shadow requires them.
kasan_populate_early_vm_area_shadow establishes complete KASAN shadow
page table mappings for the early vmalloc regions before vmalloc_init.
At this point, complete page tables need to be established, but
kasan_populate_early_vm_area_shadow is called after kasan_shallow_populate,
at which time only incomplete page tables have been established for the
vmalloc region.The condition for a page table entry to be none requires the
pgd_none/p4d_none/pmd_none/pte_none checks. Only by correctly determining
whether an entry is none can the complete page tables be established properly.

Test：

https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git

CONFIG_KUNIT=y

CONFIG_KASAN_KUNIT_TEST=m

Add `kunit.enable=1 kasan_multi_shot` to the cmdline.

Test with 3-level 16K pages and 4-level 4K pages respectively.

before this patch:

...

[  502.760009]     ok 68 vmalloc_oob # SKIP Test requires CONFIG_KASAN_VMALLOC=y

...

[  504.016000] # kasan: pass:49 fail:0 skip:26 total:75
[  504.016092] # Totals: pass:49 fail:0 skip:26 total:75
[  504.016171] ok 1 kasan

after this patch:

...

[  531.630760]     ok 68 vmalloc_oob

...

[  532.891057] # kasan: pass:50 fail:0 skip:25 total:75
[  532.891142] # Totals: pass:50 fail:0 skip:25 total:75
[  532.891219] ok 1 kasan

V2:

1, Add a shallow parameter to kasan_pgd/p4d/pud/pmd/pte_populate to create incomplete page tables.

2，select HAVE_ARCH_KASAN_VMALLOC -> select HAVE_ARCH_KASAN_VMALLOC if 64BIT.

Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>

---
 arch/loongarch/Kconfig         |   2 +
 arch/loongarch/mm/kasan_init.c | 132 ++++++++++++++++++++++++---------
 2 files changed, 101 insertions(+), 33 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 2067d1f2ad7a..9cdb80ee58a1 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -119,6 +119,7 @@ config LOONGARCH
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if 64BIT
+	select HAVE_ARCH_KASAN_VMALLOC if 64BIT
 	select HAVE_ARCH_KFENCE if 64BIT
 	select HAVE_ARCH_KGDB if PERF_EVENTS
 	select HAVE_ARCH_KSTACK_ERASE
@@ -187,6 +188,7 @@ config LOONGARCH
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_FORCED_THREADING
 	select IRQ_LOONGARCH_CPU
+	select KASAN_VMALLOC if KASAN
 	select LOCK_MM_AND_FIND_VMA
 	select MMU_GATHER_MERGE_VMAS if MMU
 	select MMU_GATHER_RCU_TABLE_FREE
diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index 92ca0ba86406..08fbdc9aafb4 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -17,28 +17,28 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define __pgd_none(early, pgd) (0)
 #else
 #define __pgd_none(early, pgd) (early ? (pgd_val(pgd) == 0) : \
-(__pa(pgd_val(pgd)) == (unsigned long)__pa(kasan_early_shadow_p4d)))
+((__pa(pgd_val(pgd)) == (unsigned long)__pa(kasan_early_shadow_p4d)) || pgd_none(pgd)))
 #endif
 
 #ifdef __PAGETABLE_PUD_FOLDED
 #define __p4d_none(early, p4d) (0)
 #else
 #define __p4d_none(early, p4d) (early ? (p4d_val(p4d) == 0) : \
-(__pa(p4d_val(p4d)) == (unsigned long)__pa(kasan_early_shadow_pud)))
+((__pa(p4d_val(p4d)) == (unsigned long)__pa(kasan_early_shadow_pud)) || p4d_none(p4d)))
 #endif
 
 #ifdef __PAGETABLE_PMD_FOLDED
 #define __pud_none(early, pud) (0)
 #else
 #define __pud_none(early, pud) (early ? (pud_val(pud) == 0) : \
-(__pa(pud_val(pud)) == (unsigned long)__pa(kasan_early_shadow_pmd)))
+((__pa(pud_val(pud)) == (unsigned long)__pa(kasan_early_shadow_pmd)) || pud_none(pud)))
 #endif
 
 #define __pmd_none(early, pmd) (early ? (pmd_val(pmd) == 0) : \
-(__pa(pmd_val(pmd)) == (unsigned long)__pa(kasan_early_shadow_pte)))
+((__pa(pmd_val(pmd)) == (unsigned long)__pa(kasan_early_shadow_pte)) || pmd_none(pmd)))
 
 #define __pte_none(early, pte) (early ? pte_none(pte) : \
-((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
+(((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)) || pte_none(pte)))
 
 static void *mem_to_shadow(const void *addr)
 {
@@ -117,52 +117,78 @@ static phys_addr_t __init kasan_alloc_zeroed_page(int node)
 	return __pa(p);
 }
 
-static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node, bool early)
+static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr,
+					unsigned long end, int node, bool early, bool shallow)
 {
 	if (__pmd_none(early, pmdp_get(pmdp))) {
 		phys_addr_t pte_phys = early ?
 				__pa_symbol(kasan_early_shadow_pte) : kasan_alloc_zeroed_page(node);
 		if (!early)
 			memcpy(__va(pte_phys), kasan_early_shadow_pte, sizeof(kasan_early_shadow_pte));
+
+		if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >= PMD_SIZE && shallow)
+			kernel_pte_init(__va(pte_phys));
+
 		pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
 	}
 
 	return pte_offset_kernel(pmdp, addr);
 }
 
-static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long addr, int node, bool early)
+static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long addr,
+					unsigned long end, int node, bool early, bool shallow)
 {
 	if (__pud_none(early, pudp_get(pudp))) {
 		phys_addr_t pmd_phys = early ?
 				__pa_symbol(kasan_early_shadow_pmd) : kasan_alloc_zeroed_page(node);
 		if (!early)
 			memcpy(__va(pmd_phys), kasan_early_shadow_pmd, sizeof(kasan_early_shadow_pmd));
+
+		if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >= PUD_SIZE && shallow) {
+#ifndef __PAGETABLE_PMD_FOLDED
+			pmd_init(__va(pmd_phys));
+#endif
+		}
+
 		pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
 	}
 
 	return pmd_offset(pudp, addr);
 }
 
-static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr, int node, bool early)
+static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr,
+					unsigned long end, int node, bool early, bool shallow)
 {
 	if (__p4d_none(early, p4dp_get(p4dp))) {
 		phys_addr_t pud_phys = early ?
 			__pa_symbol(kasan_early_shadow_pud) : kasan_alloc_zeroed_page(node);
 		if (!early)
 			memcpy(__va(pud_phys), kasan_early_shadow_pud, sizeof(kasan_early_shadow_pud));
+
+		if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >= P4D_SIZE && shallow) {
+#ifndef __PAGETABLE_PUD_FOLDED
+			pud_init(__va(pud_phys));
+#endif
+		}
+
 		p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
 	}
 
 	return pud_offset(p4dp, addr);
 }
 
-static p4d_t *__init kasan_p4d_offset(pgd_t *pgdp, unsigned long addr, int node, bool early)
+static p4d_t *__init kasan_p4d_offset(pgd_t *pgdp, unsigned long addr,
+					unsigned long end, int node, bool early, bool shallow)
 {
 	if (__pgd_none(early, pgdp_get(pgdp))) {
 		phys_addr_t p4d_phys = early ?
 			__pa_symbol(kasan_early_shadow_p4d) : kasan_alloc_zeroed_page(node);
+
 		if (!early)
 			memcpy(__va(p4d_phys), kasan_early_shadow_p4d, sizeof(kasan_early_shadow_p4d));
+
+		if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >= PGDIR_SIZE && shallow)
+			pgd_init(__va(p4d_phys));
 		pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
 	}
 
@@ -170,58 +196,77 @@ static p4d_t *__init kasan_p4d_offset(pgd_t *pgdp, unsigned long addr, int node,
 }
 
 static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
-				      unsigned long end, int node, bool early)
+					unsigned long end, int node, bool early, bool shallow)
 {
 	unsigned long next;
-	pte_t *ptep = kasan_pte_offset(pmdp, addr, node, early);
+	pte_t *ptep = kasan_pte_offset(pmdp, addr, end, node, early, shallow);
+
+	if (pte_none(ptep_get(ptep)) && shallow)
+		return;
+
 
 	do {
-		phys_addr_t page_phys = early ?
+		if (shallow) {
+			next = addr + PAGE_SIZE;
+			if (__pte_none(early, ptep_get(ptep)))
+				pte_clear(&init_mm, addr, ptep);
+		} else {
+			phys_addr_t page_phys = early ?
 					__pa_symbol(kasan_early_shadow_page)
 					      : kasan_alloc_zeroed_page(node);
-		next = addr + PAGE_SIZE;
-		set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
+			next = addr + PAGE_SIZE;
+			set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
+		}
 	} while (ptep++, addr = next, addr != end && __pte_none(early, ptep_get(ptep)));
 }
 
 static void __init kasan_pmd_populate(pud_t *pudp, unsigned long addr,
-				      unsigned long end, int node, bool early)
+					unsigned long end, int node, bool early, bool shallow)
 {
 	unsigned long next;
-	pmd_t *pmdp = kasan_pmd_offset(pudp, addr, node, early);
+	pmd_t *pmdp = kasan_pmd_offset(pudp, addr, end, node, early, shallow);
+
+	if (pmd_none(pmdp_get(pmdp)) && shallow)
+		return;
 
 	do {
 		next = pmd_addr_end(addr, end);
-		kasan_pte_populate(pmdp, addr, next, node, early);
+		kasan_pte_populate(pmdp, addr, next, node, early, shallow);
 	} while (pmdp++, addr = next, addr != end && __pmd_none(early, pmdp_get(pmdp)));
 }
 
 static void __init kasan_pud_populate(p4d_t *p4dp, unsigned long addr,
-					    unsigned long end, int node, bool early)
+					unsigned long end, int node, bool early, bool shallow)
 {
 	unsigned long next;
-	pud_t *pudp = kasan_pud_offset(p4dp, addr, node, early);
+	pud_t *pudp = kasan_pud_offset(p4dp, addr, end, node, early, shallow);
+
+	if (pud_none(pudp_get(pudp)) && shallow)
+		return;
 
 	do {
 		next = pud_addr_end(addr, end);
-		kasan_pmd_populate(pudp, addr, next, node, early);
+		kasan_pmd_populate(pudp, addr, next, node, early, shallow);
 	} while (pudp++, addr = next, addr != end && __pud_none(early, READ_ONCE(*pudp)));
 }
 
 static void __init kasan_p4d_populate(pgd_t *pgdp, unsigned long addr,
-					    unsigned long end, int node, bool early)
+					unsigned long end, int node, bool early, bool shallow)
 {
 	unsigned long next;
-	p4d_t *p4dp = kasan_p4d_offset(pgdp, addr, node, early);
+	p4d_t *p4dp = kasan_p4d_offset(pgdp, addr, end, node, early, shallow);
+
+	if (p4d_none(p4dp_get(p4dp)) && shallow)
+		return;
 
 	do {
 		next = p4d_addr_end(addr, end);
-		kasan_pud_populate(p4dp, addr, next, node, early);
+		kasan_pud_populate(p4dp, addr, next, node, early, shallow);
 	} while (p4dp++, addr = next, addr != end && __p4d_none(early, READ_ONCE(*p4dp)));
 }
 
 static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
-				      int node, bool early)
+					int node, bool early, bool shallow)
 {
 	unsigned long next;
 	pgd_t *pgdp;
@@ -230,7 +275,7 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
 
 	do {
 		next = pgd_addr_end(addr, end);
-		kasan_p4d_populate(pgdp, addr, next, node, early);
+		kasan_p4d_populate(pgdp, addr, next, node, early, shallow);
 	} while (pgdp++, addr = next, addr != end);
 
 }
@@ -239,9 +284,34 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
 static void __init kasan_map_populate(unsigned long start, unsigned long end,
 				      int node)
 {
-	kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false);
+	kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false, false);
 }
 
+
+static void __init kasan_shallow_populate(unsigned long start, unsigned long end, int node)
+{
+
+	kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false, true);
+
+}
+
+#ifdef CONFIG_KASAN_VMALLOC
+void __init kasan_populate_early_vm_area_shadow(void *start, unsigned long size)
+{
+	unsigned long shadow_start, shadow_end;
+
+	if (!is_vmalloc_or_module_addr(start))
+		return;
+
+	shadow_start = (unsigned long)mem_to_shadow(start);
+	shadow_start = ALIGN_DOWN(shadow_start, PAGE_SIZE);
+	shadow_end = (unsigned long)mem_to_shadow(start + size);
+	shadow_end = ALIGN(shadow_end, PAGE_SIZE);
+
+	kasan_map_populate(shadow_start, shadow_end, NUMA_NO_NODE);
+}
+#endif
+
 asmlinkage void __init kasan_early_init(void)
 {
 	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
@@ -295,10 +365,7 @@ void __init kasan_init(void)
 	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
 
 	/* Maps everything to a single page of zeroes */
-	kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE, true);
-
-	kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_START),
-					mem_to_shadow((void *)KFENCE_AREA_END));
+	kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE, true, false);
 
 	/* Populate the linear mapping */
 	for_each_mem_range(i, &pa_start, &pa_end) {
@@ -309,9 +376,8 @@ void __init kasan_init(void)
 			(unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
 	}
 
-	/* Populate modules mapping */
-	kasan_map_populate((unsigned long)mem_to_shadow((void *)MODULES_VADDR),
-		(unsigned long)mem_to_shadow((void *)MODULES_END), NUMA_NO_NODE);
+	kasan_shallow_populate((unsigned long)mem_to_shadow((void *)MODULES_VADDR),
+			(unsigned long)mem_to_shadow((void *)VMALLOC_END), NUMA_NO_NODE);
 	/*
 	 * KAsan may reuse the contents of kasan_early_shadow_pte directly, so we
 	 * should make sure that it maps the zero page read-only.
-- 
2.43.0

