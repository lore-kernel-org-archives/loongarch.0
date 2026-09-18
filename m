Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9E23C81A9
	for <loongarch@lists.linux.dev>; Fri, 18 Sep 2026 02:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700004; cv=none; b=uxirzdquEcEibUauCV+sIJdRu7wOIXiJr9RlpyhqYAM7O36O2jCtjVRShQC1ClpV+dGBTiK88F98gNHDoevRunWDDhKmAc04Tgkj04mHTpdG4u6IXZLWfTYOkycgJ6GPU74fSA1y75c0l0O6pad+ZXIh7cIGPT7IGcYlhbS6YcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700004; c=relaxed/simple;
	bh=851Vt4DmzVd02LRyjQTVGbAt4g3VD6roFxvEaDvSZXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jyi0zwbqWJ06RL4cKqf6DZpZXFsmnUQhbQ5DJznnAtSpEKmyLrrCkn8MCkKMyIU/2OBnSvkV9/iZF0TqHrCjnm7J4HYMgDT+/pyl+6/gjjpUpll0MPQHB/G1hkj/tyVHU/2RmJpqU+dsgId6hOzuPfvwgkAF4uaDMXLilOoaPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVeuwnfz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVeuwnfz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5532B1F000FF
	for <loongarch@lists.linux.dev>; Fri, 18 Sep 2026 02:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789699992;
	bh=2taYixvNPdeAOWVxpVJnnKQZWXavQBLxwXhMMhSa5O8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oVeuwnfze0ze1W1qxG3hwKY3wBD81xiGnIks2smdolZBUiwqcDlIHjaeZwwHVn6Cs
	 4M+PfWRaghSFnVtrak1l82I9/5jj1RdGrE4dJW4nnE2OXu/9XC4XhqMFfN2vUmEbF9
	 CFWdJ5V6PHgv9SbRlccZobKMlNBMWM1ZO7L5Co/qkCsPdaLGYUeKataW4Ye9B2Psnr
	 5IxKab9jAr8bPvLTd1qW/Og/m1fLXmYD1fq0BmMndBcnJtosHqc4rJQAnhDrbxoUp2
	 9ZzV7solqSm6Ef0B2AyZ26qdXUtHX7ji/Y97iBUQYpez5TBdpmPQYQA/BVd/qnfI+D
	 bRCq6OBJzBsGg==
Received: by mail-ed2-f26.google.com with SMTP id 4fb4d7f45d1cf-6aa13e194easo392361a12.1
        for <loongarch@lists.linux.dev>; Thu, 17 Sep 2026 19:53:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZD0rxoHy7j7r0u5yOYqvYli9qCv8iR5KZmxKOL5EAK/zgJzjtFaFuAOGf6uiqhBI49i93H3xqbdg=@lists.linux.dev
X-Gm-Message-State: AFuF++nf7JI256QjtdqytPRZBNffiK2SnOooyQzkEANfTfCnY16u8H4D
	AzPO75cPSumdzq2jP8ON9B8MyAinF6FGXwFAaQB46AMFYESmOMAqo4r7IBE+0eRQMeT2MnDxu/s
	jOJIgBzIAbz6E5ppNp2/LSRw7XWGaRd0=
X-Received: by 2002:a05:6402:23d1:b0:6a9:a2b9:5907 with SMTP id
 4fb4d7f45d1cf-6aa577f5832mr7903a12.4.1789699990905; Thu, 17 Sep 2026 19:53:10
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917101050.1002944-1-lijun01@kylinos.cn>
In-Reply-To: <20260917101050.1002944-1-lijun01@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 18 Sep 2026 10:52:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Rgf-k0ys6mDSr_UOz83BsSsZKSFJYgJTrbSH2Jfco1A@mail.gmail.com>
X-Gm-Features: AcwNN1XybKdTmPrxSNrjyOZILL5gwi99oOE7KW_SeD7u_3-msXp0V3rK5GmQNV4
Message-ID: <CAAhV-H4Rgf-k0ys6mDSr_UOz83BsSsZKSFJYgJTrbSH2Jfco1A@mail.gmail.com>
Subject: Re: [PATCH] Loongarch: mm: add check W&X
To: Li Jun <lijun01@kylinos.cn>
Cc: kernel@xen0n.name, yangtiezhu@loongson.cn, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jun,

What's wrong with you? Haoran Jiang has submit several versions of this:
https://lore.kernel.org/loongarch/CAAhV-H7GwHp1q-c5igf82h5gk1G5uDx+-gcrtqZs=
YHn_vbnR1g@mail.gmail.com/T/#t

You are colleagues but zero communications? This is not a healthy manner.

Huacai

On Thu, Sep 17, 2026 at 6:11=E2=80=AFPM Li Jun <lijun01@kylinos.cn> wrote:
>
> If there are both writable and executable permissions in the memory,
> it can be dangerous as attackers may exploit this vulnerability to execut=
e
> illegal programs. Therefore, it is necessary to scan the memory space
> and list the memory addresses that have both writable and executable
> permissions.
> This patch will list the flag bits:
> 0xffffff8000000000-0xffffff8000008000  32K PTE . . . . . G . . .   .   . =
   .   .   .    .
> 0xffffff8000008000-0xffffff8000018000  64K PTE P V D A . G . W .   NX .  =
  .   .   .    .
> 0xffffff8000018000-0xffffff8002008000  32704K PTE . . . . . G . . .   .  =
 .    .   .   .    .
> 0xffffff8002008000-0xffffff8002208000  2M PTE P V . A . G . . .   .   .  =
  .   CC .    .
> 0xffffff8002208000-0xffffff800220c000  16K PTE . . . . . G . . .   .   . =
   .   .   .    .
> 0xffffff800220c000-0xffffff8002214000  32K PTE P V D A . G . W .   .   . =
   .   CC .    .
>
> the 'NX' is that '_PAGE_NO_EXEC' flag be set,
> the 'W'  is thet '_PAGE_WRITE' flag be set,
> the more flag, see the code.
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
> Changlogs:
> -Add check the '_PAGE_NO_EXEC' and '_PAGE_WRITE' in mem, and list them.
> ---
>  arch/loongarch/Kconfig     |   2 +
>  arch/loongarch/mm/Makefile |   2 +
>  arch/loongarch/mm/ptdump.c | 467 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 471 insertions(+)
>  create mode 100644 arch/loongarch/mm/ptdump.c
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 0aad0004b010..c47575559bab 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -25,10 +25,12 @@ config LOONGARCH
>         select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>         select ARCH_HAS_PREEMPT_LAZY
>         select ARCH_HAS_PTE_SPECIAL if 64BIT
> +       select ARCH_HAS_PTDUMP if 64BIT
>         select ARCH_HAS_SET_MEMORY
>         select ARCH_HAS_SET_DIRECT_MAP
>         select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>         select ARCH_HAS_UBSAN
> +       select ARCH_HAS_DEBUG_WX if 64BIT
>         select ARCH_HAS_VDSO_ARCH_DATA
>         select ARCH_INLINE_READ_LOCK if !PREEMPTION
>         select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
> diff --git a/arch/loongarch/mm/Makefile b/arch/loongarch/mm/Makefile
> index 2aae3773de77..8928c36ef5a8 100644
> --- a/arch/loongarch/mm/Makefile
> +++ b/arch/loongarch/mm/Makefile
> @@ -7,6 +7,8 @@ obj-y                           +=3D init.o cache.o tlb.o=
 tlbex.o extable.o \
>                                    fault.o ioremap.o maccess.o mmap.o pgt=
able.o \
>                                    page.o pageattr.o
>
> +obj-$(CONFIG_PTDUMP)           +=3D ptdump.o
> +
>  obj-$(CONFIG_HIGHMEM)          +=3D highmem.o
>  obj-$(CONFIG_HUGETLB_PAGE)     +=3D hugetlbpage.o
>  obj-$(CONFIG_KASAN)            +=3D kasan_init.o
> diff --git a/arch/loongarch/mm/ptdump.c b/arch/loongarch/mm/ptdump.c
> new file mode 100644
> index 000000000000..e92ef21ac9ca
> --- /dev/null
> +++ b/arch/loongarch/mm/ptdump.c
> @@ -0,0 +1,467 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Derived from RISC-V:
> + * Copyright (C) 2019 SiFive
> + */
> +
> +#include <linux/efi.h>
> +#include <linux/init.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/string.h>
> +#include <linux/ptdump.h>
> +
> +#include <linux/pgtable.h>
> +#include <asm/kasan.h>
> +#include <asm/fixmap.h>
> +#include <asm/io.h>
> +#include <asm/pgtable-bits.h>
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
> +};
> +
> +enum address_markers_idx {
> +       PCI_IO_START_NR,
> +       PCI_IO_END_NR,
> +#ifdef CONFIG_64BIT
> +       MODULES_VADDR_NR,
> +       MODULES_END_NR,
> +#endif
> +       VMALLOC_START_NR,
> +       VMALLOC_END_NR,
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +       VMEMMAP_START_NR,
> +       VMEMMAP_END_NR,
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
> +static struct addr_marker address_markers[] =3D {
> +
> +       {0, "PCI I/O start"},
> +       {0, "PCI I/O end"},
> +#ifdef CONFIG_64BIT
> +       {0, "Modules start"},
> +       {0, "Modules end"},
> +#endif
> +       {0, "vmalloc() area"},
> +       {0, "vmalloc() end"},
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +       {0, "vmemmap start"},
> +       {0, "vmemmap end"},
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
> +static struct ptd_mm_info kernel_ptd_info =3D {
> +       .mm             =3D &init_mm,
> +       .markers        =3D address_markers,
> +       .base_addr      =3D 0,
> +       .end            =3D ULONG_MAX,
> +};
> +
> +#ifdef CONFIG_EFI
> +static struct addr_marker efi_addr_markers[] =3D {
> +       { 0,            "UEFI runtime start" },
> +       { SZ_1G,        "UEFI runtime end" },
> +       { -1,           NULL }
> +};
> +
> +static struct ptd_mm_info efi_ptd_info =3D {
> +       .mm             =3D &efi_mm,
> +       .markers        =3D efi_addr_markers,
> +       .base_addr      =3D 0,
> +       .end            =3D SZ_2G,
> +};
> +#endif
> +
> +/* Page Table Entry */
> +struct prot_bits {
> +       u64 mask;
> +       const char *set;
> +       const char *clear;
> +};
> +
> +static const struct prot_bits pte_bits[] =3D {
> +       {
> +               .mask =3D _PAGE_PRESENT,
> +               .set =3D "P",
> +               .clear =3D ".",
> +       }, {
> +               .mask =3D _PAGE_VALID,
> +               .set =3D "V",
> +               .clear =3D ".",
> +       }, {
> +               .mask =3D _PAGE_DIRTY,
> +               .set =3D "D",
> +               .clear =3D ".",
> +       }, {
> +               .mask =3D _PAGE_ACCESSED,
> +               .set =3D "A",
> +               .clear =3D ".",
> +       }, {
> +               .mask =3D _PAGE_MODIFIED,
> +               .set =3D "M",
> +               .clear =3D ".",
> +       }, {
> +               .mask =3D _PAGE_GLOBAL,
> +               .set =3D "G",
> +               .clear =3D ".",
> +       }, {
> +               .mask =3D _PAGE_USER,
> +               .set =3D "U",
> +               .clear =3D ".",
> +       }, {
> +               .mask =3D _PAGE_WRITE,
> +               .set =3D "W",
> +               .clear =3D ".",
> +       },
> +#ifdef CONFIG_64BIT
> +       {
> +               .mask =3D _PAGE_NO_READ,
> +               .set =3D "NR",
> +               .clear =3D ".  ",
> +       }, {
> +               .mask =3D _PAGE_NO_EXEC,
> +               .set =3D "NX",
> +               .clear =3D ".  ",
> +       }, {
> +               .mask =3D _PAGE_RPLV,
> +               .set =3D "RPLV",
> +               .clear =3D ".   ",
> +       }, {
> +               .mask =3D _PAGE_PROTNONE,
> +               .set =3D "PN",
> +               .clear =3D ".  ",
> +       },
> +#endif
> +       {
> +               .mask =3D _CACHE_CC,
> +               .set =3D "CC",
> +               .clear =3D ".  ",
> +       }, {
> +               .mask =3D _CACHE_SUC,
> +               .set =3D "SUC",
> +               .clear =3D ".   ",
> +       }, {
> +               .mask =3D _CACHE_WUC,
> +               .set =3D "WUC",
> +               .clear =3D ".   ",
> +       },
> +};
> +
> +/* Page Level */
> +struct pg_level {
> +       const char *name;
> +       u64 mask;
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
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pte_bits); i++) {
> +               char s[8];
> +
> +               if (st->current_prot & pte_bits[i].mask)
> +                       strscpy(s, pte_bits[i].set);
> +               else
> +                       strscpy(s, pte_bits[i].clear);
> +
> +               pt_dump_seq_printf(st->seq, " %s", s);
> +       }
> +}
> +
> +static void dump_addr(struct pg_state *st, unsigned long addr)
> +{
> +       static const char units[] =3D "KMGTPE";
> +       const char *unit =3D units;
> +       unsigned long delta;
> +
> +       pt_dump_seq_printf(st->seq, "0x%016lx-0x%016lx   ",
> +                          st->start_address, addr);
> +
> +       pt_dump_seq_printf(st->seq, "0x%016lx ", st->start_pa);
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
> +
> +#ifdef CONFIG_64BIT
> +       if ((st->current_prot & _PAGE_WRITE) &&
> +           !(st->current_prot & _PAGE_NO_EXEC))
> +               return;
> +#else
> +       /* 32-bit LoongArch has no NX bit, so W+X is always present */
> +       return;
> +#endif
> +
> +       WARN_ONCE(1, "loongarch/mm: Found insecure W+X mapping at address=
 %p/%pS\n",
> +                 (void *)st->start_address, (void *)st->start_address);
> +
> +       st->wx_pages +=3D (addr - st->start_address) / PAGE_SIZE;
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
> +               pr_warn("loongarch/mm: Checked W+X mappings: FAILED, %lu =
W+X pages found\n",
> +                       st.wx_pages);
> +
> +               return false;
> +       } else {
> +               pr_info("loongarch/mm: Checked W+X mappings: passed, no W=
+X pages found\n");
> +
> +               return true;
> +       }
> +}
> +
> +static int ptdump_show(struct seq_file *m, void *v)
> +{
> +       ptdump_walk(m, m->private);
> +
> +       return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(ptdump);
> +
> +static int __init ptdump_init(void)
> +{
> +       unsigned int i, j;
> +
> +
> +       address_markers[PCI_IO_START_NR].start_address =3D (unsigned long=
)PCI_IOBASE;
> +       address_markers[PCI_IO_END_NR].start_address =3D (unsigned long)P=
CI_IOBASE + PCI_IOSIZE;
> +
> +#ifdef CONFIG_64BIT
> +       address_markers[MODULES_VADDR_NR].start_address =3D MODULES_VADDR=
;
> +       address_markers[MODULES_END_NR].start_address =3D MODULES_END;
> +#endif
> +       address_markers[VMALLOC_START_NR].start_address =3D VMALLOC_START=
;
> +       address_markers[VMALLOC_END_NR].start_address =3D VMALLOC_END;
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +       address_markers[VMEMMAP_START_NR].start_address =3D (unsigned lon=
g)vmemmap;
> +       address_markers[VMEMMAP_END_NR].start_address =3D VMEMMAP_END;
> +#endif
> +#ifdef CONFIG_KASAN
> +       address_markers[KASAN_SHADOW_START_NR].start_address =3D KASAN_SH=
ADOW_START;
> +       address_markers[KASAN_SHADOW_END_NR].start_address =3D KASAN_SHAD=
OW_END;
> +#endif
> +       address_markers[FIXMAP_START_NR].start_address =3D FIXADDR_START;
> +       address_markers[FIXMAP_END_NR].start_address =3D FIXADDR_TOP;
> +       kernel_ptd_info.base_addr =3D vm_map_base;
> +
> +       pg_level[1].name =3D (CONFIG_PGTABLE_LEVELS > 4) ? "P4D" : "PGD";
> +       pg_level[2].name =3D (CONFIG_PGTABLE_LEVELS > 3) ? "PUD" : "PGD";
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pg_level); i++)
> +               for (j =3D 0; j < ARRAY_SIZE(pte_bits); j++)
> +                       pg_level[i].mask |=3D pte_bits[j].mask;
> +
> +       debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd=
_info,
> +                           &ptdump_fops);
> +
> +       return 0;
> +}
> +
> +device_initcall(ptdump_init);
> --
> 2.25.1
>
