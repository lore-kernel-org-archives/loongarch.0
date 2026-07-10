Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A80324B1F
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692507; cv=none; b=uSXWvpYANA+crvRZxpJz+3VdYu6Q3wz/tBINJMfz2dXQFhcsZ/MIx7JGqXkXRUHHn2mXhYm/a5sZxDOmjHklYGsdsjkUr/JuQcRHN/vZZ8v9bK2slSOTcIH17CNNnQ4xcGsgZj4I7Tf6+Kf9o7MjW5fEx3V2ix6BWxGcBqKyH84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692507; c=relaxed/simple;
	bh=lYSYkDxlp7ehiAWkmrICTsyDzWfuQstpe2YleiOFuls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwqEaopwLs8xX1wKqV/QIIQ/u0Wsr4nFXH28FnTseIJc9O5qkeD3qEmDMoDVwWXohCMBwbIr3NRz1tdqUOnhC0c+8z4O2Lu2vnkyx3ovhU0KxNw4nGRN1zeEdFAXTuWbOb9GmGHAFK9DwSlbvbetxI2eyoQMh3F83VAi6uE8R2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bomYA6vc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bomYA6vc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4FE1F00A3A
	for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783692504;
	bh=k+I2DfU3HVKTHp/YrYllctaFfT59DXjz9ntgjpI/IRY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bomYA6vc1wqvoaFazoygBtegt6HhyLgk60lOcrY6nrwi9xtQP9Thuk+FtKCfT81tH
	 /hpF+HpDyY2t8mGoWJmizEK9D7xqz9C6OqCNC2vuJbZl8qAyR/iy63P5/sqXb0CMZa
	 X1WfcZsJB8mytHvN1Ef4x6cX4GVlVK66pGO/i0sOaWn7GqQ50j7E8Z/t3eN3NNddkT
	 RcxR2DbQU61BGLraO4HNUGyNLP715FdNyqRQdiP3x0DoYXwW0o3N94r6wUc8eW77DV
	 QL9aqmQ/OlEArbjbYrR4PYrWj7mSHDDao0zbWKD18di7iSZjDlkoQkayXj6MvfCXEc
	 KQvksj7eHerjw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6989c0ec3c5so1794878a12.2
        for <loongarch@lists.linux.dev>; Fri, 10 Jul 2026 07:08:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YwT7EHAWaS7is7b5yO5pTZNqb4SWq5o2U47I0753yLQV8rG12HT
	AfXGyyWdzu3TPrwDTnYbejP86RqgamjuBqkMmf6BXVbt3A6B5eTZeyc4TobEOog891YBZONsZbq
	trZmxB704FQPEDBfWUa/qj23Tr6BBz9s=
X-Received: by 2002:a05:6402:280f:b0:698:3fd4:47da with SMTP id
 4fb4d7f45d1cf-69ab44a1ec7mr4722523a12.26.1783692503412; Fri, 10 Jul 2026
 07:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707064556.371881-1-haoran.jiang@linux.dev> <20260707064556.371881-3-haoran.jiang@linux.dev>
In-Reply-To: <20260707064556.371881-3-haoran.jiang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 10 Jul 2026 22:08:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7r1nxUUJvay3nqu6S-JPuW3iDD3HGyvi0uB5hYLF-sQQ@mail.gmail.com>
X-Gm-Features: AUfX_mzcGvXXgvDqkW1IJUdQ_76R457xiULmZMi8yAQndfod_OuO0XmXrFwDi_Y
Message-ID: <CAAhV-H7r1nxUUJvay3nqu6S-JPuW3iDD3HGyvi0uB5hYLF-sQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: Add support to dump the kernel page tables
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	yangtiezhu@loongson.cn, Haoran Jiang <jianghaoran@kylinos.cn>, 
	Xiujie Jiang <jiangxiujie@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Haoran,

On Tue, Jul 7, 2026 at 2:47=E2=80=AFPM <haoran.jiang@linux.dev> wrote:
>
> From: Haoran Jiang <jianghaoran@kylinos.cn>
>
> In a similar manner to riscv,arm64,x86 etc.,this patch allows
> dumping the page tables of the LoongArch page-mapped virtual memory
> region via a debugfs file, which is useful for kernel developers to
> inspect page table layouts and verify permissions and type settings.
>
> Co-developed-by: Xiujie Jiang <jiangxiujie@kylinos.cn>
> Signed-off-by: Xiujie Jiang <jiangxiujie@kylinos.cn>
> Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> ---
>  arch/loongarch/Kconfig     |   1 +
>  arch/loongarch/mm/Makefile |   1 +
>  arch/loongarch/mm/ptdump.c | 474 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 476 insertions(+)
>  create mode 100644 arch/loongarch/mm/ptdump.c
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 2c5de66bf047..632998c64a74 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -25,6 +25,7 @@ config LOONGARCH
>         select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>         select ARCH_HAS_PREEMPT_LAZY
>         select ARCH_HAS_PTE_SPECIAL if 64BIT
> +       select ARCH_HAS_PTDUMP
>         select ARCH_HAS_SET_MEMORY
>         select ARCH_HAS_SET_DIRECT_MAP
>         select ARCH_HAS_STRICT_MODULE_RWX
> diff --git a/arch/loongarch/mm/Makefile b/arch/loongarch/mm/Makefile
> index 2aae3773de77..0be8ee87fc5b 100644
> --- a/arch/loongarch/mm/Makefile
> +++ b/arch/loongarch/mm/Makefile
> @@ -10,5 +10,6 @@ obj-y                         +=3D init.o cache.o tlb.o=
 tlbex.o extable.o \
>  obj-$(CONFIG_HIGHMEM)          +=3D highmem.o
>  obj-$(CONFIG_HUGETLB_PAGE)     +=3D hugetlbpage.o
>  obj-$(CONFIG_KASAN)            +=3D kasan_init.o
> +obj-$(CONFIG_PTDUMP_DEBUGFS)            +=3D ptdump.o
>
>  KASAN_SANITIZE_kasan_init.o     :=3D n
> diff --git a/arch/loongarch/mm/ptdump.c b/arch/loongarch/mm/ptdump.c
> new file mode 100644
> index 000000000000..003ed1d55615
> --- /dev/null
> +++ b/arch/loongarch/mm/ptdump.c
> @@ -0,0 +1,474 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Derived from riscv implementation
> + */
> +
> +#include <linux/init.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/ptdump.h>
> +#include <linux/pgtable.h>
> +#include <asm/kasan.h>
> +
> +#define _PAGE_PLV_VAL 0x0
> +
> +#define pt_dump_seq_printf(m, fmt, args...)    \
> +({                                             \
> +       if (m)                                  \
> +               seq_printf(m, fmt, ##args);     \
> +})
> +
> +#define pt_dump_seq_puts(m, fmt)       \
> +({                                     \
> +       if (m)                          \
> +               seq_puts(m, fmt);       \
> +})
> +
> +/*
> + * The page dumper groups page table entries of the same type into a sin=
gle
> + * description. It uses pg_state to track the range information while
> + * iterating over the pte entries. When the continuity is broken it then
> + * dumps out a description of the range.
> + */
> +struct pg_state {
> +       struct ptdump_state ptdump;
> +       struct seq_file *seq;
> +       const struct addr_marker *marker;
> +       unsigned long start_address;
> +       unsigned long start_pa;
> +       unsigned long last_pa;
> +       int level;
> +       u64 current_prot;
If we want to work on both 32BIT and 64BIT, we should use unsigned
long rather than u64.

> +       bool check_wx;
> +       unsigned long wx_pages;
> +};
> +
> +/* Address marker */
> +struct addr_marker {
> +       unsigned long start_address;
> +       const char *name;
> +};
> +
> +/* Private information for debugfs */
> +struct ptd_mm_info {
> +       struct mm_struct                *mm;
> +       const struct addr_marker        *markers;
> +       unsigned long base_addr;
> +       unsigned long end;
end_addr is a little better than end.

> +};
> +
> +/* Page Table Entry */
> +struct prot_bits {
> +       u64 mask;
> +       u64 val;
If we want to work on both 32BIT and 64BIT, we should use unsigned
long rather than u64.

> +       const char *set;
> +       const char *clear;
> +};
> +
> +/* Page Level */
> +struct pg_level {
> +       const char *name;
> +       u64 mask;
If we want to work on both 32BIT and 64BIT, we should use unsigned
long rather than u64.

> +};
> +
> +enum address_markers_idx {
> +       PCI_IO_START_NR,
> +       PCI_IO_END_NR,
> +       MODULES_START_NR,
> +       MODULES_END_NR,
> +       VMALLOC_START_NR,
> +       VMALLOC_END_NR,
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +       VMEMMAP_START_NR,
> +       VMEMMAP_END_NR,
> +#endif
> +#ifdef CONFIG_KFENCE
> +       KFENCE_AREA_START_NR,
> +       KFENCE_AREA_END_NR,
> +#endif
> +#ifdef CONFIG_KASAN
> +       KASAN_SHADOW_START_NR,
> +       KASAN_SHADOW_END_NR,
> +#endif
> +       FIXMAP_START_NR,
> +       FIXMAP_END_NR,
> +       END_OF_SPACE_NR
> +};
> +
> +
> +
> +static struct addr_marker address_markers[] =3D {
> +       {0, "PCI I/O start"},
> +       {0, "PCI I/O end"},
> +       {0, "modules start"},
> +       {0, "modules end"},
> +       {0, "vmalloc() area"},
> +       {0, "vmalloc() end"},
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +       {0, "vmemmap start"},
> +       {0, "vmemmap end"},
> +#endif
> +#ifdef CONFIG_KFENCE
> +       {0, "kfence area start"},
> +       {0, "kfence area end"},
> +#endif
> +#ifdef CONFIG_KASAN
> +       {0, "Kasan shadow start"},
> +       {0, "Kasan shadow end"},
> +#endif
> +       {0, "Fixmap start"},
> +       {0, "Fixmap end"},
> +       {-1, NULL},
> +};
> +
> +
> +static struct ptd_mm_info kernel_ptd_info =3D {
> +       .mm             =3D &init_mm,
> +       .markers        =3D address_markers,
> +       .base_addr      =3D 0,
> +       .end            =3D ULONG_MAX,
> +};
> +
> +static const struct prot_bits pte_bits[] =3D {
> +       {
> +               .mask =3D _PAGE_VALID,
> +               .val =3D _PAGE_VALID,
> +               .set =3D "V",
> +               .clear =3D " ",
> +       }, {
> +               .mask =3D _PAGE_DIRTY,
> +               .val =3D _PAGE_DIRTY,
> +               .set =3D "D",
> +               .clear =3D " ",
> +       }, {
> +               .mask =3D _PAGE_PLV,
> +               .val =3D _PAGE_PLV_VAL,
> +               .set =3D "KERN",
> +               .clear =3D "USR ",
set means "USER" and clear means "KERN".

> +       }, {
> +               .mask =3D _CACHE_MASK,
> +               .val =3D _CACHE_MASK,
> +               .set =3D "  ",
> +               .clear =3D "SUC",
> +       }, {
> +               .mask =3D _PAGE_GLOBAL,
> +               .val =3D _PAGE_GLOBAL,
> +               .set =3D "G",
> +               .clear =3D " ",
> +       }, {
> +               .mask =3D _PAGE_PRESENT,
> +               .val =3D _PAGE_PRESENT,
> +               .set =3D "P",
> +               .clear =3D " ",
> +       }, {
> +               .mask =3D _PAGE_WRITE,
> +               .val =3D _PAGE_WRITE,
> +               .set =3D "W",
> +               .clear =3D " ",
> +       }, {
> +               .mask =3D _PAGE_HGLOBAL,
> +               .val =3D _PAGE_HGLOBAL,
> +               .set =3D "G",
Use "HG" to distinguish with _PAGE_GLOBAL.

> +               .clear =3D "  ",
> +       }, {
> +               .mask =3D _PAGE_NO_READ,
> +               .val =3D _PAGE_NO_READ,
> +               .set =3D "NR",
> +               .clear =3D "  ",
> +       }, {
> +               .mask =3D _PAGE_NO_EXEC,
> +               .val =3D _PAGE_NO_EXEC,
> +               .set =3D "NX",
> +               .clear =3D "  ",
> +       }, {
> +               .mask =3D _PAGE_RPLV,
> +               .val =3D _PAGE_RPLV,
> +               .set =3D "RPLV",
> +               .clear =3D "    ",
> +       }
NR, NX and RPLV should be guarded by CONFIG_64BIT.

> +};
> +
> +static struct pg_level pg_level[] =3D {
> +       { /* pgd */
> +               .name =3D "PGD",
> +       }, { /* p4d */
> +               .name =3D (CONFIG_PGTABLE_LEVELS > 4) ? "P4D" : "PGD",
> +       }, { /* pud */
> +               .name =3D (CONFIG_PGTABLE_LEVELS > 3) ? "PUD" : "PGD",
> +       }, { /* pmd */
> +               .name =3D (CONFIG_PGTABLE_LEVELS > 2) ? "PMD" : "PGD",
> +       }, { /* pte */
> +               .name =3D "PTE",
> +       },
> +};
> +
> +static void dump_prot(struct pg_state *st)
> +{
> +
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pte_bits); i++) {
> +               const char *s;
> +
> +               if (pte_bits[i].mask =3D=3D _CACHE_MASK) {
> +                       if ((st->current_prot & pte_bits[i].mask) =3D=3D =
_CACHE_CC)
> +                               s =3D "CC ";
> +                       else if ((st->current_prot & pte_bits[i].mask) =
=3D=3D _CACHE_WUC)
> +                               s =3D "WUC";
> +                       else
> +                               s =3D pte_bits[i].clear;
> +               } else if (pte_bits[i].mask =3D=3D _PAGE_GLOBAL) {
> +                       if ((st->current_prot & pte_bits[i].mask) =3D=3D =
pte_bits[i].val) {
> +                               if (st->level !=3D 4)
> +                                       s =3D "PSE";
Use "H" is better, because "PSE" is x86 specific.


Huacai

> +                               else
> +                                       s =3D pte_bits[i].set;
> +                       } else {
> +                               s =3D pte_bits[i].clear;
> +                       }
> +
> +               } else {
> +                       if ((st->current_prot & pte_bits[i].mask) =3D=3D =
pte_bits[i].val)
> +                               s =3D pte_bits[i].set;
> +                       else
> +                               s =3D pte_bits[i].clear;
> +               }
> +
> +
> +               if (s)
> +                       pt_dump_seq_printf(st->seq, " %s", s);
> +       }
> +
> +}
> +
> +
> +#ifdef CONFIG_64BIT
> +#define ADDR_FORMAT    "0x%016lx"
> +#else
> +#define ADDR_FORMAT    "0x%08lx"
> +#endif
> +static void dump_addr(struct pg_state *st, unsigned long addr)
> +{
> +       static const char units[] =3D "KMGTPE";
> +       const char *unit =3D units;
> +       unsigned long delta;
> +
> +       pt_dump_seq_printf(st->seq, ADDR_FORMAT "-" ADDR_FORMAT "   ",
> +                          st->start_address, addr);
> +
> +       pt_dump_seq_printf(st->seq, " " ADDR_FORMAT " ", st->start_pa);
> +       delta =3D (addr - st->start_address) >> 10;
> +
> +       while (!(delta & 1023) && unit[1]) {
> +               delta >>=3D 10;
> +               unit++;
> +       }
> +
> +       pt_dump_seq_printf(st->seq, "%9lu%c %s", delta, *unit,
> +                          pg_level[st->level].name);
> +}
> +
> +static void note_prot_wx(struct pg_state *st, unsigned long addr)
> +{
> +       if (!st->check_wx)
> +               return;
> +       if ((st->current_prot & _PAGE_WRITE) =3D=3D 0)
> +               return;
> +       if ((st->current_prot & _PAGE_NO_EXEC) =3D=3D _PAGE_NO_EXEC)
> +               return;
> +
> +       WARN_ONCE(1, "loongarch/mm: Found insecure W+X mapping at address=
 %p/%pS\n",
> +                       (void *)st->start_address, (void *)st->start_addr=
ess);
> +
> +       st->wx_pages +=3D (addr - st->start_address) / PAGE_SIZE;
> +
> +}
> +
> +static void note_page(struct ptdump_state *pt_st, unsigned long addr,
> +                     int level, u64 val)
> +{
> +       struct pg_state *st =3D container_of(pt_st, struct pg_state, ptdu=
mp);
> +       u64 pa =3D PFN_PHYS(pte_pfn(__pte(val)));
> +       u64 prot =3D 0;
> +
> +       if (level >=3D 0)
> +               prot =3D val & pg_level[level].mask;
> +
> +       if (st->level =3D=3D -1) {
> +               st->level =3D level;
> +               st->current_prot =3D prot;
> +               st->start_address =3D addr;
> +               st->start_pa =3D pa;
> +               st->last_pa =3D pa;
> +               pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker-=
>name);
> +       } else if (prot !=3D st->current_prot ||
> +                  level !=3D st->level || addr >=3D st->marker[1].start_=
address) {
> +               if (st->current_prot) {
> +                       note_prot_wx(st, addr);
> +                       dump_addr(st, addr);
> +                       dump_prot(st);
> +                       pt_dump_seq_puts(st->seq, "\n");
> +               }
> +
> +               while (addr >=3D st->marker[1].start_address) {
> +                       st->marker++;
> +                       pt_dump_seq_printf(st->seq, "---[ %s ]---\n",
> +                                          st->marker->name);
> +               }
> +
> +               st->start_address =3D addr;
> +               st->start_pa =3D pa;
> +               st->last_pa =3D pa;
> +               st->current_prot =3D prot;
> +               st->level =3D level;
> +       } else {
> +               st->last_pa =3D pa;
> +       }
> +}
> +
> +static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr=
, pte_t pte)
> +{
> +       note_page(pt_st, addr, 4, pte_val(pte));
> +}
> +
> +static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr=
, pmd_t pmd)
> +{
> +       note_page(pt_st, addr, 3, pmd_val(pmd));
> +}
> +
> +static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr=
, pud_t pud)
> +{
> +       note_page(pt_st, addr, 2, pud_val(pud));
> +}
> +
> +static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr=
, p4d_t p4d)
> +{
> +       note_page(pt_st, addr, 1, p4d_val(p4d));
> +}
> +
> +static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr=
, pgd_t pgd)
> +{
> +       note_page(pt_st, addr, 0, pgd_val(pgd));
> +}
> +
> +static void note_page_flush(struct ptdump_state *pt_st)
> +{
> +       pte_t pte_zero =3D {0};
> +
> +       note_page(pt_st, 0, -1, pte_val(pte_zero));
> +}
> +
> +static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
> +{
> +       struct pg_state st =3D {
> +               .seq =3D s,
> +               .marker =3D pinfo->markers,
> +               .level =3D -1,
> +               .ptdump =3D {
> +                       .note_page_pte =3D note_page_pte,
> +                       .note_page_pmd =3D note_page_pmd,
> +                       .note_page_pud =3D note_page_pud,
> +                       .note_page_p4d =3D note_page_p4d,
> +                       .note_page_pgd =3D note_page_pgd,
> +                       .note_page_flush =3D note_page_flush,
> +                       .range =3D (struct ptdump_range[]) {
> +                               {pinfo->base_addr, pinfo->end},
> +                               {0, 0}
> +                       }
> +               }
> +       };
> +
> +       ptdump_walk_pgd(&st.ptdump, pinfo->mm, NULL);
> +}
> +
> +bool ptdump_check_wx(void)
> +{
> +       struct pg_state st =3D {
> +               .seq =3D NULL,
> +               .marker =3D (struct addr_marker[]) {
> +                       {0, NULL},
> +                       {-1, NULL},
> +               },
> +               .level =3D -1,
> +               .check_wx =3D true,
> +               .ptdump =3D {
> +                       .note_page_pte =3D note_page_pte,
> +                       .note_page_pmd =3D note_page_pmd,
> +                       .note_page_pud =3D note_page_pud,
> +                       .note_page_p4d =3D note_page_p4d,
> +                       .note_page_pgd =3D note_page_pgd,
> +                       .note_page_flush =3D note_page_flush,
> +                       .range =3D (struct ptdump_range[]) {
> +                               {vm_map_base, ULONG_MAX},
> +                               {0, 0}
> +                       }
> +               }
> +       };
> +
> +       ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
> +
> +       if (st.wx_pages) {
> +               pr_warn("Checked W+X mappings: failed, %lu W+X pages foun=
d\n",
> +                       st.wx_pages);
> +
> +               return false;
> +       }
> +
> +       pr_info("Checked W+X mappings: passed, no W+X pages found\n");
> +
> +       return true;
> +}
> +
> +static int ptdump_show(struct seq_file *m, void *v)
> +{
> +       struct ptd_mm_info *info =3D m->private;
> +
> +       ptdump_walk(m, info);
> +       return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(ptdump);
> +
> +static int __init ptdump_init(void)
> +{
> +       unsigned int i, j;
> +
> +       address_markers[PCI_IO_START_NR].start_address =3D (unsigned long=
)PCI_IOBASE;
> +       address_markers[PCI_IO_END_NR].start_address =3D (unsigned long)P=
CI_IOBASE + IO_SPACE_LIMIT;
> +
> +       address_markers[MODULES_START_NR].start_address =3D MODULES_VADDR=
;
> +       address_markers[MODULES_END_NR].start_address =3D MODULES_END;
> +
> +       address_markers[VMALLOC_START_NR].start_address =3D VMALLOC_START=
;
> +       address_markers[VMALLOC_END_NR].start_address =3D VMALLOC_END;
> +
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +       address_markers[VMEMMAP_START_NR].start_address =3D (unsigned lon=
g)vmemmap;
> +       address_markers[VMEMMAP_END_NR].start_address =3D VMEMMAP_END;
> +#endif
> +
> +#ifdef CONFIG_KFENCE
> +       address_markers[KFENCE_AREA_START_NR].start_address =3D KFENCE_AR=
EA_START;
> +       address_markers[KFENCE_AREA_END_NR].start_address =3D KFENCE_AREA=
_END;
> +#endif
> +
> +#ifdef CONFIG_KASAN
> +       address_markers[KASAN_SHADOW_START_NR].start_address =3D KASAN_SH=
ADOW_START;
> +       address_markers[KASAN_SHADOW_END_NR].start_address =3D KASAN_SHAD=
OW_END;
> +#endif
> +
> +       address_markers[FIXMAP_START_NR].start_address =3D FIXADDR_START;
> +       address_markers[FIXMAP_END_NR].start_address =3D FIXADDR_TOP;
> +
> +       kernel_ptd_info.base_addr =3D vm_map_base;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pg_level); i++) {
> +               for (j =3D 0; j < ARRAY_SIZE(pte_bits); j++)
> +                       pg_level[i].mask |=3D pte_bits[j].mask;
> +       }
> +
> +       debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd=
_info, &ptdump_fops);
> +
> +       return 0;
> +}
> +
> +device_initcall(ptdump_init);
> --
> 2.43.0
>
