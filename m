Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361F6470438;
	Tue, 21 Jul 2026 16:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651126; cv=none; b=PtkLQKpb9TJVt3JRuQQGKaXY11KO/SG3zrAKqrgnOk1vDhkiqsf/FjaYeCKF0AfkaOcOt3Bxgpoe3YV2A9oefc9fj45fz0Dg6gyH4CR64ZoPEK18s+DEQPt/0DrtDCLe5njM8P1r1DgrMuiBxeStO1ySoPEMGP4iWlI0IH99QG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651126; c=relaxed/simple;
	bh=VN67kahu7smIlQgbkxz+e/Uztz/RvGdPhzHNwj0VDAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sr/q+nqfOPyIlDgCg1PlLnkRbFI1Ijio3879+DW5IepdCQja9UcHDZH7K7TekQDuNsxH3qfJysMcJVq+6UbBZnrg9tCUZ7bAzDovTgsdrnliSnR103mbKFCLeCmah3ed61xs6U5MIkFAuIPjTiypU/pyNmpiKjyTV3IzctxOFgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLni4VuK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLni4VuK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3D01F00A3E;
	Tue, 21 Jul 2026 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651124;
	bh=VjpDzJ3i9u3zE78UYDB1KK1C2chGKDWZsx0GiqfetuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DLni4VuK+TnbWvWiZGnd+O/JA38k1Vsc4zUU8sneGUQBoQmsQM0n3sxN5b1aL/hEM
	 xni9znaFGYwQia7UpePydjoZlMlAEnkQiLqYr1wzKOuA1Xb/mdMX37EWvNdJKq90Bz
	 MWGtbT9gP+L2i5Gt9dNTXwk3DHUKWDSI2NgPvOnQIzzl6asZZnBg/1pHQA8typwUJJ
	 /41pcCH153m7mXLMhJGHAnWxtLAjYTEBoMob5r1Uw2Qoa07juEIuSyf1lcbPx07nD8
	 td1aewpX5nV97qRntXg+gBCK3CtZ9v8mDR99oh5FUsJ2RL/4Qb3hGS8kfU8q+HM/Uv
	 4WgnN2o1LKaGg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:38 +0300
Subject: [PATCH RFC 15/18] riscv: convert set_memory to the generic CPA
 implementation
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-15-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev

Replace the pageattr_ops based page table walk in
arch/riscv/mm/pageattr.c with the common change_page_attr() loop,
implement the required architecture hooks and opt-in for
CONFIG_GENERIC_SET_MEMORY.

Instead if pre-splitting large pages with split_linear_mapping() use
riscv-specific implementation of arch_should_split_large_page() and
arch_split_large_page().

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/Kconfig                  |   1 +
 arch/riscv/include/asm/pgtable.h    |  36 +++
 arch/riscv/include/asm/set_memory.h |   7 +
 arch/riscv/mm/pageattr.c            | 465 +++++++++++-------------------------
 include/linux/set_memory.h          |   6 +
 5 files changed, 183 insertions(+), 332 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3f0a647218e4..5d069bf290ce 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -48,6 +48,7 @@ config RISCV
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
+	select GENERIC_SET_MEMORY if MMU
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU
 	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d5756bda82e..027b3e7e4f17 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -819,6 +819,42 @@ static inline int pud_write(pud_t pud)
 	return pte_write(pud_pte(pud));
 }
 
+#define pgd_write pgd_write
+static inline int pgd_write(pgd_t pgd)
+{
+	return pgd_val(pgd) & _PAGE_WRITE;
+}
+
+#define p4d_write p4d_write
+static inline int p4d_write(p4d_t p4d)
+{
+	return p4d_val(p4d) & _PAGE_WRITE;
+}
+
+#define pgd_exec pgd_exec
+static inline int pgd_exec(pgd_t pgd)
+{
+	return !!(pgd_val(pgd) & _PAGE_EXEC);
+}
+
+#define p4d_exec p4d_exec
+static inline int p4d_exec(p4d_t p4d)
+{
+	return !!(p4d_val(p4d) & _PAGE_EXEC);
+}
+
+#define pud_exec pud_exec
+static inline int pud_exec(pud_t pud)
+{
+	return !!(pud_val(pud) & _PAGE_EXEC);
+}
+
+#define pmd_exec pmd_exec
+static inline int pmd_exec(pmd_t pmd)
+{
+	return !!(pmd_val(pmd) & _PAGE_EXEC);
+}
+
 #define pmd_dirty pmd_dirty
 static inline int pmd_dirty(pmd_t pmd)
 {
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index ef59e1716a2c..4ba46a331034 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -7,6 +7,8 @@
 #define _ASM_RISCV_SET_MEMORY_H
 
 #ifndef __ASSEMBLER__
+#include <asm/page.h>
+#include <asm/pgtable.h>
 /*
  * Functions to change memory attributes.
  */
@@ -26,6 +28,11 @@ static __always_inline int set_kernel_memory(char *startp, char *endp,
 
 	return set_memory(start, num_pages);
 }
+
+static inline bool cpa_should_update_alias(unsigned long vaddr, unsigned long pfn)
+{
+	return !is_linear_mapping(vaddr);
+}
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d2769..677f42a6750d 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -3,391 +3,217 @@
  * Copyright (C) 2019 SiFive
  */
 
-#include <linux/pagewalk.h>
+#include <linux/mm.h>
 #include <linux/pgtable.h>
-#include <linux/vmalloc.h>
+#include <linux/set_memory.h>
 #include <asm/tlbflush.h>
-#include <asm/bitops.h>
 #include <asm/set_memory.h>
 
-struct pageattr_masks {
-	pgprot_t set_mask;
-	pgprot_t clear_mask;
-};
-
-static unsigned long set_pageattr_masks(unsigned long val, struct mm_walk *walk)
+int arch_should_split_large_page(struct cpa_data *cpa, struct cpa_split_data *sd)
 {
-	struct pageattr_masks *masks = walk->private;
-	unsigned long new_val = val;
-
-	new_val &= ~(pgprot_val(masks->clear_mask));
-	new_val |= (pgprot_val(masks->set_mask));
+	pte_t old = ptep_get(sd->kpte);
+	pgprot_t old_prot = __pgprot(pte_val(old) & ~_PAGE_PFN_MASK);
+	pgprot_t new_prot = old_prot;
+	unsigned long old_pfn = pte_pfn(old);
+	unsigned long lpaddr, numpages;
 
-	return new_val;
-}
-
-static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
-			      unsigned long next, struct mm_walk *walk)
-{
-	p4d_t val = p4dp_get(p4d);
+	pgprot_val(new_prot) &= ~pgprot_val(cpa->mask_clr);
+	pgprot_val(new_prot) |= pgprot_val(cpa->mask_set);
 
-	if (p4d_leaf(val)) {
-		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
-		set_p4d(p4d, val);
-	}
+	/*
+	 * Record the pfn mapped at @address so the alias check can locate the
+	 * matching linear map entry.
+	 */
+	cpa->pfn = old_pfn + ((sd->address & (sd->psize - 1)) >> PAGE_SHIFT);
 
-	return 0;
-}
+	/* If the protections do not change, keep the large page intact. */
+	if (pgprot_val(new_prot) == pgprot_val(old_prot))
+		return 0;
 
-static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
-			      unsigned long next, struct mm_walk *walk)
-{
-	pud_t val = pudp_get(pud);
+	/* If the request does not cover the whole large page, split it. */
+	lpaddr = sd->address & sd->pmask;
+	numpages = sd->psize >> PAGE_SHIFT;
+	if (sd->address != lpaddr || cpa->numpages != numpages)
+		return 1;
 
-	if (pud_leaf(val)) {
-		val = __pud(set_pageattr_masks(pud_val(val), walk));
-		set_pud(pud, val);
-	}
+	/* The whole large page is covered: update it in place. */
+	set_pte(sd->kpte, pfn_pte(old_pfn, new_prot));
+	cpa->flags |= CPA_FLUSHTLB;
 
 	return 0;
 }
 
-static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
-			      unsigned long next, struct mm_walk *walk)
+static void split_set_ptes(pte_t *ptep, unsigned long pfn, unsigned long pfninc,
+			   pgprot_t prot)
 {
-	pmd_t val = pmdp_get(pmd);
-
-	if (pmd_leaf(val)) {
-		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
-		set_pmd(pmd, val);
-	}
+	unsigned int i;
 
-	return 0;
+	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pfn += pfninc)
+		set_pte(ptep, pfn_pte(pfn, prot));
 }
 
-static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
-			      unsigned long next, struct mm_walk *walk)
+int arch_split_large_page(struct cpa_data *cpa, struct cpa_split_data *sd)
 {
-	pte_t val = ptep_get(pte);
-
-	val = __pte(set_pageattr_masks(pte_val(val), walk));
-	set_pte(pte, val);
-
-	return 0;
-}
-
-static int pageattr_pte_hole(unsigned long addr, unsigned long next,
-			     int depth, struct mm_walk *walk)
-{
-	/* Nothing to do here */
-	return 0;
-}
-
-static const struct mm_walk_ops pageattr_ops = {
-	.p4d_entry = pageattr_p4d_entry,
-	.pud_entry = pageattr_pud_entry,
-	.pmd_entry = pageattr_pmd_entry,
-	.pte_entry = pageattr_pte_entry,
-	.pte_hole = pageattr_pte_hole,
-	.walk_lock = PGWALK_RDLOCK,
-};
-
 #ifdef CONFIG_64BIT
-static int __split_linear_mapping_pmd(pud_t *pudp,
-				      unsigned long vaddr, unsigned long end)
-{
-	pmd_t *pmdp;
-	unsigned long next;
-
-	pmdp = pmd_offset(pudp, vaddr);
-
-	do {
-		next = pmd_addr_end(vaddr, end);
-
-		if (next - vaddr >= PMD_SIZE &&
-		    vaddr <= (vaddr & PMD_MASK) && end >= next)
-			continue;
-
-		if (pmd_leaf(pmdp_get(pmdp))) {
-			struct page *pte_page;
-			unsigned long pfn = _pmd_pfn(pmdp_get(pmdp));
-			pgprot_t prot = __pgprot(pmd_val(pmdp_get(pmdp)) & ~_PAGE_PFN_MASK);
-			pte_t *ptep_new;
-			int i;
-
-			pte_page = alloc_page(GFP_KERNEL);
-			if (!pte_page)
-				return -ENOMEM;
+	struct page *base = ptdesc_page(sd->ptdesc);
+	pte_t old = ptep_get(sd->kpte);
+	pgprot_t prot = __pgprot(pte_val(old) & ~_PAGE_PFN_MASK);
+	unsigned long pfn = pte_pfn(old);
+	unsigned long pfninc;
+
+	switch (sd->level) {
+	case PGTABLE_LEVEL_PMD:
+		pfninc = 1;
+		break;
+	case PGTABLE_LEVEL_PUD:
+		pfninc = PMD_SIZE >> PAGE_SHIFT;
+		break;
+	case PGTABLE_LEVEL_P4D:
+		pfninc = PUD_SIZE >> PAGE_SHIFT;
+		break;
+	default:
+		return -EINVAL;
+	}
 
-			ptep_new = (pte_t *)page_address(pte_page);
-			for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
-				set_pte(ptep_new, pfn_pte(pfn + i, prot));
+	split_set_ptes((pte_t *)page_address(base), pfn, pfninc, prot);
 
-			smp_wmb();
+	smp_wmb();
+	set_pte(sd->kpte, pfn_pte(page_to_pfn(base), PAGE_TABLE));
 
-			set_pmd(pmdp, pfn_pmd(page_to_pfn(pte_page), PAGE_TABLE));
-		}
-	} while (pmdp++, vaddr = next, vaddr != end);
+	cpa->flags |= CPA_FLUSHTLB;
+	cpa->force_flush_all = 1;
 
 	return 0;
+#else
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+#endif
 }
 
-static int __split_linear_mapping_pud(p4d_t *p4dp,
-				      unsigned long vaddr, unsigned long end)
+void arch_change_pte(struct cpa_data *cpa, unsigned long address,
+		     pte_t *kpte, pte_t old_pte, bool nx, bool rw)
 {
-	pud_t *pudp;
-	unsigned long next;
-	int ret;
-
-	pudp = pud_offset(p4dp, vaddr);
-
-	do {
-		next = pud_addr_end(vaddr, end);
-
-		if (next - vaddr >= PUD_SIZE &&
-		    vaddr <= (vaddr & PUD_MASK) && end >= next)
-			continue;
-
-		if (pud_leaf(pudp_get(pudp))) {
-			struct page *pmd_page;
-			unsigned long pfn = _pud_pfn(pudp_get(pudp));
-			pgprot_t prot = __pgprot(pud_val(pudp_get(pudp)) & ~_PAGE_PFN_MASK);
-			pmd_t *pmdp_new;
-			int i;
+	pgprot_t new_prot = __pgprot(pte_val(old_pte) & ~_PAGE_PFN_MASK);
+	unsigned long pfn = pte_pfn(old_pte);
+	pte_t new_pte;
 
-			pmd_page = alloc_page(GFP_KERNEL);
-			if (!pmd_page)
-				return -ENOMEM;
+	pgprot_val(new_prot) &= ~pgprot_val(cpa->mask_clr);
+	pgprot_val(new_prot) |= pgprot_val(cpa->mask_set);
 
-			pmdp_new = (pmd_t *)page_address(pmd_page);
-			for (i = 0; i < PTRS_PER_PMD; ++i, ++pmdp_new)
-				set_pmd(pmdp_new,
-					pfn_pmd(pfn + ((i * PMD_SIZE) >> PAGE_SHIFT), prot));
+	new_pte = pfn_pte(pfn, new_prot);
+	cpa->pfn = pfn;
 
-			smp_wmb();
-
-			set_pud(pudp, pfn_pud(page_to_pfn(pmd_page), PAGE_TABLE));
-		}
-
-		ret = __split_linear_mapping_pmd(pudp, vaddr, next);
-		if (ret)
-			return ret;
-	} while (pudp++, vaddr = next, vaddr != end);
-
-	return 0;
+	if (pte_val(old_pte) != pte_val(new_pte)) {
+		set_pte(kpte, new_pte);
+		cpa->flags |= CPA_FLUSHTLB;
+	}
 }
 
-static int __split_linear_mapping_p4d(pgd_t *pgdp,
-				      unsigned long vaddr, unsigned long end)
+int arch_cpa_process_fault(struct cpa_data *cpa, unsigned long vaddr,
+			   int primary)
 {
-	p4d_t *p4dp;
-	unsigned long next;
-	int ret;
-
-	p4dp = p4d_offset(pgdp, vaddr);
-
-	do {
-		next = p4d_addr_end(vaddr, end);
-
-		/*
-		 * If [vaddr; end] contains [vaddr & P4D_MASK; next], we don't
-		 * need to split, we'll change the protections on the whole P4D.
-		 */
-		if (next - vaddr >= P4D_SIZE &&
-		    vaddr <= (vaddr & P4D_MASK) && end >= next)
-			continue;
-
-		if (p4d_leaf(p4dp_get(p4dp))) {
-			struct page *pud_page;
-			unsigned long pfn = _p4d_pfn(p4dp_get(p4dp));
-			pgprot_t prot = __pgprot(p4d_val(p4dp_get(p4dp)) & ~_PAGE_PFN_MASK);
-			pud_t *pudp_new;
-			int i;
-
-			pud_page = alloc_page(GFP_KERNEL);
-			if (!pud_page)
-				return -ENOMEM;
-
-			/*
-			 * Fill the pud level with leaf puds that have the same
-			 * protections as the leaf p4d.
-			 */
-			pudp_new = (pud_t *)page_address(pud_page);
-			for (i = 0; i < PTRS_PER_PUD; ++i, ++pudp_new)
-				set_pud(pudp_new,
-					pfn_pud(pfn + ((i * PUD_SIZE) >> PAGE_SHIFT), prot));
-
-			/*
-			 * Make sure the pud filling is not reordered with the
-			 * p4d store which could result in seeing a partially
-			 * filled pud level.
-			 */
-			smp_wmb();
-
-			set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
-		}
-
-		ret = __split_linear_mapping_pud(p4dp, vaddr, next);
-		if (ret)
-			return ret;
-	} while (p4dp++, vaddr = next, vaddr != end);
+	cpa->numpages = 1;
 
-	return 0;
-}
-
-static int __split_linear_mapping_pgd(pgd_t *pgdp,
-				      unsigned long vaddr,
-				      unsigned long end)
-{
-	unsigned long next;
-	int ret;
+	if (!primary)
+		return 0;
 
-	do {
-		next = pgd_addr_end(vaddr, end);
-		/* We never use PGD mappings for the linear mapping */
-		ret = __split_linear_mapping_p4d(pgdp, vaddr, next);
-		if (ret)
-			return ret;
-	} while (pgdp++, vaddr = next, vaddr != end);
+	/* The linear map is expected to have holes */
+	if (is_linear_mapping(vaddr)) {
+		cpa->pfn = PFN_DOWN(__pa(vaddr));
+		return 0;
+	}
 
-	return 0;
-}
+	WARN(1, "CPA: called for zero pte. vaddr = %lx cpa->vaddr = %lx\n",
+	     vaddr, *cpa->vaddr);
 
-static int split_linear_mapping(unsigned long start, unsigned long end)
-{
-	return __split_linear_mapping_pgd(pgd_offset_k(start), start, end);
+	return -EFAULT;
 }
-#endif	/* CONFIG_64BIT */
 
-static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
-			pgprot_t clear_mask)
+int arch_cpa_process_alias(struct cpa_data *cpa)
 {
-	int ret;
-	unsigned long start = addr;
-	unsigned long end = start + PAGE_SIZE * numpages;
-	unsigned long __maybe_unused lm_start;
-	unsigned long __maybe_unused lm_end;
-	struct pageattr_masks masks = {
-		.set_mask = set_mask,
-		.clear_mask = clear_mask
-	};
-
-	if (!numpages)
-		return 0;
-
-	mmap_write_lock(&init_mm);
+	struct cpa_data alias_cpa;
+	unsigned long laddr;
 
-#ifdef CONFIG_64BIT
 	/*
-	 * We are about to change the permissions of a kernel mapping, we must
-	 * apply the same changes to its linear mapping alias, which may imply
-	 * splitting a huge mapping.
+	 * cpa_should_update_alias() only lets non linear map primaries reach
+	 * here, so @cpa->pfn always has a linear map alias that must receive
+	 * the same protection change.
 	 */
+	laddr = (unsigned long)__va(PFN_PHYS(cpa->pfn));
 
-	if (is_vmalloc_or_module_addr((void *)start)) {
-		struct vm_struct *area = NULL;
-		int i, page_start;
-
-		area = find_vm_area((void *)start);
-		page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
-
-		for (i = page_start; i < page_start + numpages; ++i) {
-			lm_start = (unsigned long)page_address(area->pages[i]);
-			lm_end = lm_start + PAGE_SIZE;
-
-			ret = split_linear_mapping(lm_start, lm_end);
-			if (ret)
-				goto unlock;
-
-			ret = walk_kernel_page_table_range(lm_start, lm_end,
-						    &pageattr_ops, NULL, &masks);
-			if (ret)
-				goto unlock;
-		}
-	} else if (is_kernel_mapping(start) || is_linear_mapping(start)) {
-		if (is_kernel_mapping(start)) {
-			lm_start = (unsigned long)lm_alias(start);
-			lm_end = (unsigned long)lm_alias(end);
-		} else {
-			lm_start = start;
-			lm_end = end;
-		}
-
-		ret = split_linear_mapping(lm_start, lm_end);
-		if (ret)
-			goto unlock;
-
-		ret = walk_kernel_page_table_range(lm_start, lm_end,
-					    &pageattr_ops, NULL, &masks);
-		if (ret)
-			goto unlock;
-	}
-
-	ret =  walk_kernel_page_table_range(start, end, &pageattr_ops, NULL,
-				     &masks);
+	alias_cpa = *cpa;
+	alias_cpa.vaddr = &laddr;
+	alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_ARRAY);
+	alias_cpa.curpage = 0;
 
-unlock:
-	mmap_write_unlock(&init_mm);
+	/* The linear map alias must never be made executable */
+	alias_cpa.mask_set = __pgprot(pgprot_val(alias_cpa.mask_set) & ~_PAGE_EXEC);
+	alias_cpa.mask_clr = __pgprot(pgprot_val(alias_cpa.mask_clr) & ~_PAGE_EXEC);
 
-	/*
-	 * We can't use flush_tlb_kernel_range() here as we may have split a
-	 * hugepage that is larger than that, so let's flush everything.
-	 */
-	flush_tlb_all();
-#else
-	ret =  walk_kernel_page_table_range(start, end, &pageattr_ops, NULL,
-				     &masks);
+	cpa->force_flush_all = 1;
 
-	mmap_write_unlock(&init_mm);
+	return __change_page_attr_set_clr(&alias_cpa, 0);
+}
 
-	flush_tlb_kernel_range(start, end);
-#endif
+void arch_cpa_flush(struct cpa_data *cpa, int err)
+{
+	if (err || cpa->force_flush_all ||
+	    (cpa->flags & (CPA_ARRAY | CPA_PAGES_ARRAY))) {
+		flush_tlb_all();
+		return;
+	}
 
-	return ret;
+	flush_tlb_kernel_range(*cpa->vaddr,
+			       *cpa->vaddr + cpa->numpages * PAGE_SIZE);
 }
 
 int set_memory_rw_nx(unsigned long addr, int numpages)
 {
-	return __set_memory(addr, numpages, __pgprot(_PAGE_READ | _PAGE_WRITE),
-			    __pgprot(_PAGE_EXEC));
+	return change_page_attr_set_clr(&addr, numpages,
+					__pgprot(_PAGE_READ | _PAGE_WRITE),
+					__pgprot(_PAGE_EXEC), 0, 0, NULL);
 }
 
 int set_memory_ro(unsigned long addr, int numpages)
 {
-	return __set_memory(addr, numpages, __pgprot(_PAGE_READ),
-			    __pgprot(_PAGE_WRITE));
+	return change_page_attr_set_clr(&addr, numpages, __pgprot(_PAGE_READ),
+					__pgprot(_PAGE_WRITE), 0, 0, NULL);
 }
 
 int set_memory_rw(unsigned long addr, int numpages)
 {
-	return __set_memory(addr, numpages, __pgprot(_PAGE_READ | _PAGE_WRITE),
-			    __pgprot(0));
+	return change_page_attr_set(&addr, numpages,
+				    __pgprot(_PAGE_READ | _PAGE_WRITE), 0);
 }
 
 int set_memory_x(unsigned long addr, int numpages)
 {
-	return __set_memory(addr, numpages, __pgprot(_PAGE_EXEC), __pgprot(0));
+	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_EXEC), 0);
 }
 
 int set_memory_nx(unsigned long addr, int numpages)
 {
-	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC));
+	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_EXEC), 0);
 }
 
 int set_direct_map_invalid_noflush(struct page *page)
 {
-	return __set_memory((unsigned long)page_address(page), 1,
-			    __pgprot(0), __pgprot(_PAGE_PRESENT));
+	unsigned long start = (unsigned long)page_address(page);
+
+	return change_page_attr_clear(&start, 1, __pgprot(_PAGE_PRESENT), 0);
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
-	return __set_memory((unsigned long)page_address(page), 1,
-			    PAGE_KERNEL, __pgprot(_PAGE_EXEC));
+	unsigned long start = (unsigned long)page_address(page);
+
+	return change_page_attr_set_clr(&start, 1, PAGE_KERNEL,
+					__pgprot(_PAGE_EXEC), 0, 0, NULL);
 }
 
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 {
+	unsigned long start = (unsigned long)page_address(page);
 	pgprot_t set, clear;
 
 	if (valid) {
@@ -398,7 +224,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 		clear = __pgprot(_PAGE_PRESENT);
 	}
 
-	return __set_memory((unsigned long)page_address(page), nr, set, clear);
+	return change_page_attr_set_clr(&start, nr, set, clear, 0, 0, NULL);
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
@@ -435,36 +261,11 @@ void __kernel_map_pages(struct page *page, int numpages, int enable)
 bool kernel_page_present(struct page *page)
 {
 	unsigned long addr = (unsigned long)page_address(page);
-	pgd_t *pgd;
-	pud_t *pud;
-	p4d_t *p4d;
-	pmd_t *pmd;
-	pte_t *pte;
-
-	pgd = pgd_offset_k(addr);
-	if (!pgd_present(pgdp_get(pgd)))
-		return false;
-	if (pgd_leaf(pgdp_get(pgd)))
-		return true;
-
-	p4d = p4d_offset(pgd, addr);
-	if (!p4d_present(p4dp_get(p4d)))
-		return false;
-	if (p4d_leaf(p4dp_get(p4d)))
-		return true;
-
-	pud = pud_offset(p4d, addr);
-	if (!pud_present(pudp_get(pud)))
-		return false;
-	if (pud_leaf(pudp_get(pud)))
-		return true;
+	unsigned int level;
+	pte_t *pte = lookup_address(addr, &level);
 
-	pmd = pmd_offset(pud, addr);
-	if (!pmd_present(pmdp_get(pmd)))
+	if (!pte)
 		return false;
-	if (pmd_leaf(pmdp_get(pmd)))
-		return true;
 
-	pte = pte_offset_kernel(pmd, addr);
 	return pte_present(ptep_get(pte));
 }
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 86a7bef7cbca..17cbe6e26cb7 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -129,6 +129,12 @@ struct cpa_split_data {
 
 unsigned long cpa_addr(struct cpa_data *cpa, unsigned long idx);
 
+pte_t *lookup_address(unsigned long address, unsigned int *level);
+pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
+			     unsigned int *level);
+pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
+				  unsigned int *level, bool *nx, bool *rw);
+
 int arch_cpa_process_fault(struct cpa_data *cpa, unsigned long vaddr,
 			   int primary);
 int arch_cpa_process_alias(struct cpa_data *cpa);

-- 
2.53.0

