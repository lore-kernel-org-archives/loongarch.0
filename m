Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750403ABD90
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 06:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406872; cv=none; b=WMgDHWUslLxijcoRZH0smpkFPvcKfZ8aEWRWpTlOhIOO0lPKFPE8fzAA04ieOyoFTGYs7weI8YI3xV9IDP1EWjlIIhiK/HiSFS0e4HkqF3aTlAaE5Dl9HAmMhU2PTlyI7ND2jqovSdlqTz1MhGkwHZ8Mk4OdfNVUb33p57MMgqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406872; c=relaxed/simple;
	bh=SsZpmwGPyG/d5MkuvyqBSVwYAx4Vkr8Q3+3h+a5P+rY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LwatlLSCOFXvveUo6c80Y09Rwfk1d/2fRQtETsgC3aeHxfQ1AVeJVd1jiS86j+vuoE5DmiwJR8WzAkFmK/wHKyQS/2oaPilwu1JDYhYJnFyAQvGLsMa5qyhWWpd91q/mFhZ+Jkwo4DO7Cxxg1zq+3VseCIrl98AaW4XPL3SDY24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XDp4osp2; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XDp4osp2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783406868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+ZbaHB8r4c4OtxkmyaRaJ+GF9AV1trwxBbCUaJXsoI=;
	b=XDp4osp2qthRNLpT4rK7vqUjlRYnLRKOU+jN6Rcv4dUa+h4bTZdzG01zUEHpf0E3pcWmIg
	cR2RGjTp9aZ/nRmWCaenAhtwLl1Hn+919dDO6IXTMJQ9ooAUy/3oiIfoGulGV63KVroDQ+
	2ASttmAgNICXUsWXug5rswDNqwWG4mc=
From: haoran.jiang@linux.dev
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	Haoran Jiang <jianghaoran@kylinos.cn>,
	Xiujie Jiang <jiangxiujie@kylinos.cn>
Subject: [PATCH 2/2] LoongArch: Add support to dump the kernel page tables
Date: Tue,  7 Jul 2026 14:45:56 +0800
Message-Id: <20260707064556.371881-3-haoran.jiang@linux.dev>
In-Reply-To: <20260707064556.371881-1-haoran.jiang@linux.dev>
References: <20260707064556.371881-1-haoran.jiang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Haoran Jiang <jianghaoran@kylinos.cn>

In a similar manner to riscv,arm64,x86 etc.,this patch allows
dumping the page tables of the LoongArch page-mapped virtual memory
region via a debugfs file, which is useful for kernel developers to
inspect page table layouts and verify permissions and type settings.

Co-developed-by: Xiujie Jiang <jiangxiujie@kylinos.cn>
Signed-off-by: Xiujie Jiang <jiangxiujie@kylinos.cn>
Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
---
 arch/loongarch/Kconfig     |   1 +
 arch/loongarch/mm/Makefile |   1 +
 arch/loongarch/mm/ptdump.c | 474 +++++++++++++++++++++++++++++++++++++
 3 files changed, 476 insertions(+)
 create mode 100644 arch/loongarch/mm/ptdump.c

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 2c5de66bf047..632998c64a74 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -25,6 +25,7 @@ config LOONGARCH
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTE_SPECIAL if 64BIT
+	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_STRICT_MODULE_RWX
diff --git a/arch/loongarch/mm/Makefile b/arch/loongarch/mm/Makefile
index 2aae3773de77..0be8ee87fc5b 100644
--- a/arch/loongarch/mm/Makefile
+++ b/arch/loongarch/mm/Makefile
@@ -10,5 +10,6 @@ obj-y				+= init.o cache.o tlb.o tlbex.o extable.o \
 obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_KASAN)		+= kasan_init.o
+obj-$(CONFIG_PTDUMP_DEBUGFS)            += ptdump.o
 
 KASAN_SANITIZE_kasan_init.o     := n
diff --git a/arch/loongarch/mm/ptdump.c b/arch/loongarch/mm/ptdump.c
new file mode 100644
index 000000000000..003ed1d55615
--- /dev/null
+++ b/arch/loongarch/mm/ptdump.c
@@ -0,0 +1,474 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Derived from riscv implementation
+ */
+
+#include <linux/init.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/ptdump.h>
+#include <linux/pgtable.h>
+#include <asm/kasan.h>
+
+#define _PAGE_PLV_VAL 0x0
+
+#define pt_dump_seq_printf(m, fmt, args...)	\
+({						\
+	if (m)					\
+		seq_printf(m, fmt, ##args);	\
+})
+
+#define pt_dump_seq_puts(m, fmt)	\
+({					\
+	if (m)				\
+		seq_puts(m, fmt);	\
+})
+
+/*
+ * The page dumper groups page table entries of the same type into a single
+ * description. It uses pg_state to track the range information while
+ * iterating over the pte entries. When the continuity is broken it then
+ * dumps out a description of the range.
+ */
+struct pg_state {
+	struct ptdump_state ptdump;
+	struct seq_file *seq;
+	const struct addr_marker *marker;
+	unsigned long start_address;
+	unsigned long start_pa;
+	unsigned long last_pa;
+	int level;
+	u64 current_prot;
+	bool check_wx;
+	unsigned long wx_pages;
+};
+
+/* Address marker */
+struct addr_marker {
+	unsigned long start_address;
+	const char *name;
+};
+
+/* Private information for debugfs */
+struct ptd_mm_info {
+	struct mm_struct                *mm;
+	const struct addr_marker        *markers;
+	unsigned long base_addr;
+	unsigned long end;
+};
+
+/* Page Table Entry */
+struct prot_bits {
+	u64 mask;
+	u64 val;
+	const char *set;
+	const char *clear;
+};
+
+/* Page Level */
+struct pg_level {
+	const char *name;
+	u64 mask;
+};
+
+enum address_markers_idx {
+	PCI_IO_START_NR,
+	PCI_IO_END_NR,
+	MODULES_START_NR,
+	MODULES_END_NR,
+	VMALLOC_START_NR,
+	VMALLOC_END_NR,
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	VMEMMAP_START_NR,
+	VMEMMAP_END_NR,
+#endif
+#ifdef CONFIG_KFENCE
+	KFENCE_AREA_START_NR,
+	KFENCE_AREA_END_NR,
+#endif
+#ifdef CONFIG_KASAN
+	KASAN_SHADOW_START_NR,
+	KASAN_SHADOW_END_NR,
+#endif
+	FIXMAP_START_NR,
+	FIXMAP_END_NR,
+	END_OF_SPACE_NR
+};
+
+
+
+static struct addr_marker address_markers[] = {
+	{0, "PCI I/O start"},
+	{0, "PCI I/O end"},
+	{0, "modules start"},
+	{0, "modules end"},
+	{0, "vmalloc() area"},
+	{0, "vmalloc() end"},
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	{0, "vmemmap start"},
+	{0, "vmemmap end"},
+#endif
+#ifdef CONFIG_KFENCE
+	{0, "kfence area start"},
+	{0, "kfence area end"},
+#endif
+#ifdef CONFIG_KASAN
+	{0, "Kasan shadow start"},
+	{0, "Kasan shadow end"},
+#endif
+	{0, "Fixmap start"},
+	{0, "Fixmap end"},
+	{-1, NULL},
+};
+
+
+static struct ptd_mm_info kernel_ptd_info = {
+	.mm		= &init_mm,
+	.markers	= address_markers,
+	.base_addr	= 0,
+	.end		= ULONG_MAX,
+};
+
+static const struct prot_bits pte_bits[] = {
+	{
+		.mask = _PAGE_VALID,
+		.val = _PAGE_VALID,
+		.set = "V",
+		.clear = " ",
+	}, {
+		.mask = _PAGE_DIRTY,
+		.val = _PAGE_DIRTY,
+		.set = "D",
+		.clear = " ",
+	}, {
+		.mask = _PAGE_PLV,
+		.val = _PAGE_PLV_VAL,
+		.set = "KERN",
+		.clear = "USR ",
+	}, {
+		.mask = _CACHE_MASK,
+		.val = _CACHE_MASK,
+		.set = "  ",
+		.clear = "SUC",
+	}, {
+		.mask = _PAGE_GLOBAL,
+		.val = _PAGE_GLOBAL,
+		.set = "G",
+		.clear = " ",
+	}, {
+		.mask = _PAGE_PRESENT,
+		.val = _PAGE_PRESENT,
+		.set = "P",
+		.clear = " ",
+	}, {
+		.mask = _PAGE_WRITE,
+		.val = _PAGE_WRITE,
+		.set = "W",
+		.clear = " ",
+	}, {
+		.mask = _PAGE_HGLOBAL,
+		.val = _PAGE_HGLOBAL,
+		.set = "G",
+		.clear = "  ",
+	}, {
+		.mask = _PAGE_NO_READ,
+		.val = _PAGE_NO_READ,
+		.set = "NR",
+		.clear = "  ",
+	}, {
+		.mask = _PAGE_NO_EXEC,
+		.val = _PAGE_NO_EXEC,
+		.set = "NX",
+		.clear = "  ",
+	}, {
+		.mask = _PAGE_RPLV,
+		.val = _PAGE_RPLV,
+		.set = "RPLV",
+		.clear = "    ",
+	}
+};
+
+static struct pg_level pg_level[] = {
+	{ /* pgd */
+		.name = "PGD",
+	}, { /* p4d */
+		.name = (CONFIG_PGTABLE_LEVELS > 4) ? "P4D" : "PGD",
+	}, { /* pud */
+		.name = (CONFIG_PGTABLE_LEVELS > 3) ? "PUD" : "PGD",
+	}, { /* pmd */
+		.name = (CONFIG_PGTABLE_LEVELS > 2) ? "PMD" : "PGD",
+	}, { /* pte */
+		.name = "PTE",
+	},
+};
+
+static void dump_prot(struct pg_state *st)
+{
+
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pte_bits); i++) {
+		const char *s;
+
+		if (pte_bits[i].mask == _CACHE_MASK) {
+			if ((st->current_prot & pte_bits[i].mask) == _CACHE_CC)
+				s = "CC ";
+			else if ((st->current_prot & pte_bits[i].mask) == _CACHE_WUC)
+				s = "WUC";
+			else
+				s = pte_bits[i].clear;
+		} else if (pte_bits[i].mask == _PAGE_GLOBAL) {
+			if ((st->current_prot & pte_bits[i].mask) == pte_bits[i].val) {
+				if (st->level != 4)
+					s = "PSE";
+				else
+					s = pte_bits[i].set;
+			} else {
+				s = pte_bits[i].clear;
+			}
+
+		} else {
+			if ((st->current_prot & pte_bits[i].mask) == pte_bits[i].val)
+				s = pte_bits[i].set;
+			else
+				s = pte_bits[i].clear;
+		}
+
+
+		if (s)
+			pt_dump_seq_printf(st->seq, " %s", s);
+	}
+
+}
+
+
+#ifdef CONFIG_64BIT
+#define ADDR_FORMAT	"0x%016lx"
+#else
+#define ADDR_FORMAT	"0x%08lx"
+#endif
+static void dump_addr(struct pg_state *st, unsigned long addr)
+{
+	static const char units[] = "KMGTPE";
+	const char *unit = units;
+	unsigned long delta;
+
+	pt_dump_seq_printf(st->seq, ADDR_FORMAT "-" ADDR_FORMAT "   ",
+			   st->start_address, addr);
+
+	pt_dump_seq_printf(st->seq, " " ADDR_FORMAT " ", st->start_pa);
+	delta = (addr - st->start_address) >> 10;
+
+	while (!(delta & 1023) && unit[1]) {
+		delta >>= 10;
+		unit++;
+	}
+
+	pt_dump_seq_printf(st->seq, "%9lu%c %s", delta, *unit,
+			   pg_level[st->level].name);
+}
+
+static void note_prot_wx(struct pg_state *st, unsigned long addr)
+{
+	if (!st->check_wx)
+		return;
+	if ((st->current_prot & _PAGE_WRITE) == 0)
+		return;
+	if ((st->current_prot & _PAGE_NO_EXEC) == _PAGE_NO_EXEC)
+		return;
+
+	WARN_ONCE(1, "loongarch/mm: Found insecure W+X mapping at address %p/%pS\n",
+			(void *)st->start_address, (void *)st->start_address);
+
+	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
+
+}
+
+static void note_page(struct ptdump_state *pt_st, unsigned long addr,
+		      int level, u64 val)
+{
+	struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
+	u64 pa = PFN_PHYS(pte_pfn(__pte(val)));
+	u64 prot = 0;
+
+	if (level >= 0)
+		prot = val & pg_level[level].mask;
+
+	if (st->level == -1) {
+		st->level = level;
+		st->current_prot = prot;
+		st->start_address = addr;
+		st->start_pa = pa;
+		st->last_pa = pa;
+		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
+	} else if (prot != st->current_prot ||
+		   level != st->level || addr >= st->marker[1].start_address) {
+		if (st->current_prot) {
+			note_prot_wx(st, addr);
+			dump_addr(st, addr);
+			dump_prot(st);
+			pt_dump_seq_puts(st->seq, "\n");
+		}
+
+		while (addr >= st->marker[1].start_address) {
+			st->marker++;
+			pt_dump_seq_printf(st->seq, "---[ %s ]---\n",
+					   st->marker->name);
+		}
+
+		st->start_address = addr;
+		st->start_pa = pa;
+		st->last_pa = pa;
+		st->current_prot = prot;
+		st->level = level;
+	} else {
+		st->last_pa = pa;
+	}
+}
+
+static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
+{
+	note_page(pt_st, addr, 4, pte_val(pte));
+}
+
+static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
+{
+	note_page(pt_st, addr, 3, pmd_val(pmd));
+}
+
+static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
+{
+	note_page(pt_st, addr, 2, pud_val(pud));
+}
+
+static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
+{
+	note_page(pt_st, addr, 1, p4d_val(p4d));
+}
+
+static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
+{
+	note_page(pt_st, addr, 0, pgd_val(pgd));
+}
+
+static void note_page_flush(struct ptdump_state *pt_st)
+{
+	pte_t pte_zero = {0};
+
+	note_page(pt_st, 0, -1, pte_val(pte_zero));
+}
+
+static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
+{
+	struct pg_state st = {
+		.seq = s,
+		.marker = pinfo->markers,
+		.level = -1,
+		.ptdump = {
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
+			.note_page_flush = note_page_flush,
+			.range = (struct ptdump_range[]) {
+				{pinfo->base_addr, pinfo->end},
+				{0, 0}
+			}
+		}
+	};
+
+	ptdump_walk_pgd(&st.ptdump, pinfo->mm, NULL);
+}
+
+bool ptdump_check_wx(void)
+{
+	struct pg_state st = {
+		.seq = NULL,
+		.marker = (struct addr_marker[]) {
+			{0, NULL},
+			{-1, NULL},
+		},
+		.level = -1,
+		.check_wx = true,
+		.ptdump = {
+			.note_page_pte = note_page_pte,
+			.note_page_pmd = note_page_pmd,
+			.note_page_pud = note_page_pud,
+			.note_page_p4d = note_page_p4d,
+			.note_page_pgd = note_page_pgd,
+			.note_page_flush = note_page_flush,
+			.range = (struct ptdump_range[]) {
+				{vm_map_base, ULONG_MAX},
+				{0, 0}
+			}
+		}
+	};
+
+	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
+
+	if (st.wx_pages) {
+		pr_warn("Checked W+X mappings: failed, %lu W+X pages found\n",
+			st.wx_pages);
+
+		return false;
+	}
+
+	pr_info("Checked W+X mappings: passed, no W+X pages found\n");
+
+	return true;
+}
+
+static int ptdump_show(struct seq_file *m, void *v)
+{
+	struct ptd_mm_info *info = m->private;
+
+	ptdump_walk(m, info);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ptdump);
+
+static int __init ptdump_init(void)
+{
+	unsigned int i, j;
+
+	address_markers[PCI_IO_START_NR].start_address = (unsigned long)PCI_IOBASE;
+	address_markers[PCI_IO_END_NR].start_address = (unsigned long)PCI_IOBASE + IO_SPACE_LIMIT;
+
+	address_markers[MODULES_START_NR].start_address = MODULES_VADDR;
+	address_markers[MODULES_END_NR].start_address = MODULES_END;
+
+	address_markers[VMALLOC_START_NR].start_address = VMALLOC_START;
+	address_markers[VMALLOC_END_NR].start_address = VMALLOC_END;
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	address_markers[VMEMMAP_START_NR].start_address = (unsigned long)vmemmap;
+	address_markers[VMEMMAP_END_NR].start_address = VMEMMAP_END;
+#endif
+
+#ifdef CONFIG_KFENCE
+	address_markers[KFENCE_AREA_START_NR].start_address = KFENCE_AREA_START;
+	address_markers[KFENCE_AREA_END_NR].start_address = KFENCE_AREA_END;
+#endif
+
+#ifdef CONFIG_KASAN
+	address_markers[KASAN_SHADOW_START_NR].start_address = KASAN_SHADOW_START;
+	address_markers[KASAN_SHADOW_END_NR].start_address = KASAN_SHADOW_END;
+#endif
+
+	address_markers[FIXMAP_START_NR].start_address = FIXADDR_START;
+	address_markers[FIXMAP_END_NR].start_address = FIXADDR_TOP;
+
+	kernel_ptd_info.base_addr = vm_map_base;
+
+	for (i = 0; i < ARRAY_SIZE(pg_level); i++) {
+		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
+			pg_level[i].mask |= pte_bits[j].mask;
+	}
+
+	debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd_info, &ptdump_fops);
+
+	return 0;
+}
+
+device_initcall(ptdump_init);
-- 
2.43.0

