Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3DD4B829C
	for <loongarch@lists.linux.dev>; Thu, 17 Sep 2026 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639907; cv=none; b=JuTfj4aBxzP1+gncAHfi+1Uh370Yl1ohQehsg/7ZwPGu6oLVCxG5K2JKU2KaRwkFV/x0k6hAwVqSSCp+NQqLlODDa4bDumtfFqo/PnH4P6Sn5AnsFpEgzaH1iWDX45jtrfjymZI87WvLfxH+AYuNF3iGvxydOqUHL+5xYjep84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639907; c=relaxed/simple;
	bh=V2X7xD/GjLqVuvFr4bX+8ftBerhGdvxIaBxeRjHK7Zo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=p3om6oDuDTC1/JLaTIRj9ssaFcUgf+KJCX88bxKpcIIa5e9OcBboPKGQYCg5CeBx8dp3ZvkwqkhrHIQAyPKB9OJBs6LthJvHeKyWntTNcq5yTL52CU9UsMg1PU6UHS0p/SDCr0q0zHiInzvOjNdJ7a7vdjl/5KgVercR2gwf5Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 277793e8b28011f19a56ed5b684f684d-20260917
X-CTIC-Tags:
	HR_CTE_8B, HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8467a3bc-6078-492a-9b5a-528ba9013925,IP:10,
	URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:30
X-CID-INFO: VERSION:1.3.19,REQID:8467a3bc-6078-492a-9b5a-528ba9013925,IP:10,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-META: VersionHash:7db8b62,CLOUDID:6e75c9addc2cd7f871ac66d8e12f6b8b,BulkI
	D:260917181136MJ3TVDTJ,BulkQuantity:0,SF:10|38|66|78|102|127|850|865|898,T
	C:nil,Content:0|15|50|99,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 277793e8b28011f19a56ed5b684f684d-20260917
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(39.156.73.11)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1713455119; Thu, 17 Sep 2026 18:11:31 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	loongarch@lists.linux.dev
Subject: [PATCH] Loongarch: mm: add check W&X
Date: Thu, 17 Sep 2026 18:10:50 +0800
Message-Id: <20260917101050.1002944-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If there are both writable and executable permissions in the memory,
it can be dangerous as attackers may exploit this vulnerability to execute
illegal programs. Therefore, it is necessary to scan the memory space
and list the memory addresses that have both writable and executable
permissions.
This patch will list the flag bits:
0xffffff8000000000-0xffffff8000008000  32K PTE . . . . . G . . .   .   .    .   .   .    .
0xffffff8000008000-0xffffff8000018000  64K PTE P V D A . G . W .   NX .    .   .   .    .
0xffffff8000018000-0xffffff8002008000  32704K PTE . . . . . G . . .   .   .    .   .   .    .
0xffffff8002008000-0xffffff8002208000  2M PTE P V . A . G . . .   .   .    .   CC .    .
0xffffff8002208000-0xffffff800220c000  16K PTE . . . . . G . . .   .   .    .   .   .    .
0xffffff800220c000-0xffffff8002214000  32K PTE P V D A . G . W .   .   .    .   CC .    .

the 'NX' is that '_PAGE_NO_EXEC' flag be set,
the 'W'  is thet '_PAGE_WRITE' flag be set,
the more flag, see the code.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
Changlogs:
-Add check the '_PAGE_NO_EXEC' and '_PAGE_WRITE' in mem, and list them.
---
 arch/loongarch/Kconfig     |   2 +
 arch/loongarch/mm/Makefile |   2 +
 arch/loongarch/mm/ptdump.c | 467 +++++++++++++++++++++++++++++++++++++
 3 files changed, 471 insertions(+)
 create mode 100644 arch/loongarch/mm/ptdump.c

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 0aad0004b010..c47575559bab 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -25,10 +25,12 @@ config LOONGARCH
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTE_SPECIAL if 64BIT
+	select ARCH_HAS_PTDUMP if 64BIT
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
+	select ARCH_HAS_DEBUG_WX if 64BIT
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_INLINE_READ_LOCK if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
diff --git a/arch/loongarch/mm/Makefile b/arch/loongarch/mm/Makefile
index 2aae3773de77..8928c36ef5a8 100644
--- a/arch/loongarch/mm/Makefile
+++ b/arch/loongarch/mm/Makefile
@@ -7,6 +7,8 @@ obj-y				+= init.o cache.o tlb.o tlbex.o extable.o \
 				   fault.o ioremap.o maccess.o mmap.o pgtable.o \
 				   page.o pageattr.o
 
+obj-$(CONFIG_PTDUMP)		+= ptdump.o
+
 obj-$(CONFIG_HIGHMEM)		+= highmem.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_KASAN)		+= kasan_init.o
diff --git a/arch/loongarch/mm/ptdump.c b/arch/loongarch/mm/ptdump.c
new file mode 100644
index 000000000000..e92ef21ac9ca
--- /dev/null
+++ b/arch/loongarch/mm/ptdump.c
@@ -0,0 +1,467 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Derived from RISC-V:
+ * Copyright (C) 2019 SiFive
+ */
+
+#include <linux/efi.h>
+#include <linux/init.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/string.h>
+#include <linux/ptdump.h>
+
+#include <linux/pgtable.h>
+#include <asm/kasan.h>
+#include <asm/fixmap.h>
+#include <asm/io.h>
+#include <asm/pgtable-bits.h>
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
+	struct mm_struct		*mm;
+	const struct addr_marker	*markers;
+	unsigned long base_addr;
+	unsigned long end;
+};
+
+enum address_markers_idx {
+	PCI_IO_START_NR,
+	PCI_IO_END_NR,
+#ifdef CONFIG_64BIT
+	MODULES_VADDR_NR,
+	MODULES_END_NR,
+#endif
+	VMALLOC_START_NR,
+	VMALLOC_END_NR,
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	VMEMMAP_START_NR,
+	VMEMMAP_END_NR,
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
+static struct addr_marker address_markers[] = {
+
+	{0, "PCI I/O start"},
+	{0, "PCI I/O end"},
+#ifdef CONFIG_64BIT
+	{0, "Modules start"},
+	{0, "Modules end"},
+#endif
+	{0, "vmalloc() area"},
+	{0, "vmalloc() end"},
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	{0, "vmemmap start"},
+	{0, "vmemmap end"},
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
+static struct ptd_mm_info kernel_ptd_info = {
+	.mm		= &init_mm,
+	.markers	= address_markers,
+	.base_addr	= 0,
+	.end		= ULONG_MAX,
+};
+
+#ifdef CONFIG_EFI
+static struct addr_marker efi_addr_markers[] = {
+	{ 0,		"UEFI runtime start" },
+	{ SZ_1G,	"UEFI runtime end" },
+	{ -1,		NULL }
+};
+
+static struct ptd_mm_info efi_ptd_info = {
+	.mm		= &efi_mm,
+	.markers	= efi_addr_markers,
+	.base_addr	= 0,
+	.end		= SZ_2G,
+};
+#endif
+
+/* Page Table Entry */
+struct prot_bits {
+	u64 mask;
+	const char *set;
+	const char *clear;
+};
+
+static const struct prot_bits pte_bits[] = {
+	{
+		.mask = _PAGE_PRESENT,
+		.set = "P",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_VALID,
+		.set = "V",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_DIRTY,
+		.set = "D",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_ACCESSED,
+		.set = "A",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_MODIFIED,
+		.set = "M",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_GLOBAL,
+		.set = "G",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_USER,
+		.set = "U",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_WRITE,
+		.set = "W",
+		.clear = ".",
+	},
+#ifdef CONFIG_64BIT
+	{
+		.mask = _PAGE_NO_READ,
+		.set = "NR",
+		.clear = ".  ",
+	}, {
+		.mask = _PAGE_NO_EXEC,
+		.set = "NX",
+		.clear = ".  ",
+	}, {
+		.mask = _PAGE_RPLV,
+		.set = "RPLV",
+		.clear = ".   ",
+	}, {
+		.mask = _PAGE_PROTNONE,
+		.set = "PN",
+		.clear = ".  ",
+	},
+#endif
+	{
+		.mask = _CACHE_CC,
+		.set = "CC",
+		.clear = ".  ",
+	}, {
+		.mask = _CACHE_SUC,
+		.set = "SUC",
+		.clear = ".   ",
+	}, {
+		.mask = _CACHE_WUC,
+		.set = "WUC",
+		.clear = ".   ",
+	},
+};
+
+/* Page Level */
+struct pg_level {
+	const char *name;
+	u64 mask;
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
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pte_bits); i++) {
+		char s[8];
+
+		if (st->current_prot & pte_bits[i].mask)
+			strscpy(s, pte_bits[i].set);
+		else
+			strscpy(s, pte_bits[i].clear);
+
+		pt_dump_seq_printf(st->seq, " %s", s);
+	}
+}
+
+static void dump_addr(struct pg_state *st, unsigned long addr)
+{
+	static const char units[] = "KMGTPE";
+	const char *unit = units;
+	unsigned long delta;
+
+	pt_dump_seq_printf(st->seq, "0x%016lx-0x%016lx   ",
+			   st->start_address, addr);
+
+	pt_dump_seq_printf(st->seq, "0x%016lx ", st->start_pa);
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
+
+#ifdef CONFIG_64BIT
+	if ((st->current_prot & _PAGE_WRITE) &&
+	    !(st->current_prot & _PAGE_NO_EXEC))
+		return;
+#else
+	/* 32-bit LoongArch has no NX bit, so W+X is always present */
+	return;
+#endif
+
+	WARN_ONCE(1, "loongarch/mm: Found insecure W+X mapping at address %p/%pS\n",
+		  (void *)st->start_address, (void *)st->start_address);
+
+	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
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
+		pr_warn("loongarch/mm: Checked W+X mappings: FAILED, %lu W+X pages found\n",
+			st.wx_pages);
+
+		return false;
+	} else {
+		pr_info("loongarch/mm: Checked W+X mappings: passed, no W+X pages found\n");
+
+		return true;
+	}
+}
+
+static int ptdump_show(struct seq_file *m, void *v)
+{
+	ptdump_walk(m, m->private);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(ptdump);
+
+static int __init ptdump_init(void)
+{
+	unsigned int i, j;
+
+
+	address_markers[PCI_IO_START_NR].start_address = (unsigned long)PCI_IOBASE;
+	address_markers[PCI_IO_END_NR].start_address = (unsigned long)PCI_IOBASE + PCI_IOSIZE;
+
+#ifdef CONFIG_64BIT
+	address_markers[MODULES_VADDR_NR].start_address = MODULES_VADDR;
+	address_markers[MODULES_END_NR].start_address = MODULES_END;
+#endif
+	address_markers[VMALLOC_START_NR].start_address = VMALLOC_START;
+	address_markers[VMALLOC_END_NR].start_address = VMALLOC_END;
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	address_markers[VMEMMAP_START_NR].start_address = (unsigned long)vmemmap;
+	address_markers[VMEMMAP_END_NR].start_address = VMEMMAP_END;
+#endif
+#ifdef CONFIG_KASAN
+	address_markers[KASAN_SHADOW_START_NR].start_address = KASAN_SHADOW_START;
+	address_markers[KASAN_SHADOW_END_NR].start_address = KASAN_SHADOW_END;
+#endif
+	address_markers[FIXMAP_START_NR].start_address = FIXADDR_START;
+	address_markers[FIXMAP_END_NR].start_address = FIXADDR_TOP;
+	kernel_ptd_info.base_addr = vm_map_base;
+
+	pg_level[1].name = (CONFIG_PGTABLE_LEVELS > 4) ? "P4D" : "PGD";
+	pg_level[2].name = (CONFIG_PGTABLE_LEVELS > 3) ? "PUD" : "PGD";
+
+	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
+		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
+			pg_level[i].mask |= pte_bits[j].mask;
+
+	debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd_info,
+			    &ptdump_fops);
+
+	return 0;
+}
+
+device_initcall(ptdump_init);
-- 
2.25.1

