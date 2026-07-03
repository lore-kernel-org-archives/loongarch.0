Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD363955FD
	for <loongarch@lists.linux.dev>; Fri,  3 Jul 2026 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073899; cv=none; b=ShOH5RhCQkEDvzzS6P42fB5RkN6unCUS4w0Cqoxxq4LK/56FDPv/6L+Ae9JZnoid+QMh0XQvrCj+kjOaMmYZvTVhTY5RJaj6ZFXvzcujJKvVdCngHwC6ZP3ghRsiYe80n85bo6zqq/fn+TZBNuu1iVkbFXbW/gctZKqOnfVa5vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073899; c=relaxed/simple;
	bh=/TWgAJJh2hLc5muuO1RGdxy0EtW/9tp8D8gJGvhhlyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geDkhRGkauMUFSrauAEMj6cwvssKoOn+ikcfgO9/oDDERdj727ITPBcUqfniCn5QlQCWmie1G1DpG87EespTZD4fRXHK5ExMQ6RgFWrohWo1aeX4gnjqGAGXINtSq7KaLWq2LG4nwXnStW3J7GRMGs3PweFQ4NwMZYDn43IgjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zp8JFiMT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zp8JFiMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743C71F00ACA
	for <loongarch@lists.linux.dev>; Fri,  3 Jul 2026 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783073897;
	bh=weoku3AZeacb5lGrR8e1K3JUcJ96NXSuwGcnJjGURL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zp8JFiMT1QyyiWzRmsvkvw1PfvcLERgDfvtDAgIHlLLvlZFGCmU9B5wwtMrfij8DA
	 RZx8F9N0e2CDItvGn/l+JiGxNKx5IpvqL/ki8k8L8WOM9NV7zfrtp2kM1AC6Vj3XJw
	 pbIPNdUT9kxV4ZYL4q7txwxn1M47/k77q0s6g/M2cAuC9ZSD1ke23SLl/tg7Ks//R/
	 sFxCq10ZeEkeRLEtULAMhzPu+2kpBUdbuJi4FjBGzOb8U/lMuVfPbDOLr+JWLDbFfd
	 RnZKdy6M2e6hy6ppArSBNTyKICdCiLocywXHDCV3FDTekQHvQyoTli3upZdhvwdhz/
	 drYJ221wX3yzA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so539059a12.3
        for <loongarch@lists.linux.dev>; Fri, 03 Jul 2026 03:18:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YxhpJTYWdzW7Yx1181qXJSut7rL2/417pyu28L/oVisus0y15jd
	jiteMY7T7TuZH396NNvR1OsB0zkGVZO3mbwkbBkHETCJGM+uH5B3/70M4kcIsGoHnKOw2uMjyOr
	xn17oekUd7g3veQKE8OkeBVonsxGsScs=
X-Received: by 2002:a05:6402:1357:b0:698:415d:318b with SMTP id
 4fb4d7f45d1cf-698a2c70b79mr2875934a12.13.1783073895920; Fri, 03 Jul 2026
 03:18:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629074335.448256-1-haoran.jiang@linux.dev>
 <CAAhV-H6MTP_eU-8CeHzChvBGmjxP3KFcZDMypiFH4EsF4F3u_A@mail.gmail.com> <c26214ada1e531dc7fabb51c65a19b3fbf60a997@linux.dev>
In-Reply-To: <c26214ada1e531dc7fabb51c65a19b3fbf60a997@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 3 Jul 2026 18:18:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4McAYU3dcZpTJk6ChrBxFnyzXqg_QYJ=Od_AkaAApiRQ@mail.gmail.com>
X-Gm-Features: AVVi8CekjcsPWDprjz6GqsRZg-00wwiJtLVdSSV2M4UW-tFvJnlF0NJDEiQebZU
Message-ID: <CAAhV-H4McAYU3dcZpTJk6ChrBxFnyzXqg_QYJ=Od_AkaAApiRQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add support to dump the kernel page tables
To: haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@xen0n.name, 
	yangtiezhu@loongson.cn, Haoran Jiang <jianghaoran@kylinos.cn>, 
	Xiujie Jiang <jiangxiujie@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 8:10=E2=80=AFPM <haoran.jiang@linux.dev> wrote:
>
> 2026=E5=B9=B46=E6=9C=8829=E6=97=A5 22:00, "Huacai Chen" <chenhuacai@kerne=
l.org mailto:chenhuacai@kernel.org?to=3D%22Huacai%20Chen%22%20%3Cchenhuacai=
%40kernel.org%3E > =E5=86=99=E5=88=B0:
>
>
> >
> > Hi, Haoran,
> >
> > On Mon, Jun 29, 2026 at 3:44 PM <haoran.jiang@linux.dev> wrote:
> >
> > >
> > > From: Haoran Jiang <jianghaoran@kylinos.cn>
> > >
> > >  In a similar manner to riscv,arm64,x86 etc.,this patch allows
> > >  dumping the page tables of the LoongArch page-mapped virtual memory
> > >  region via a debugfs file, which is useful for kernel developers to
> > >  inspect page table layouts and verify permissions and type settings.
> > >
> > I like the RISC-V version that put everything in ptdump.c.
> >
> > Huacai
> >
> 1=EF=BC=8CThe ptdump functionality can be enabled via either CONFIG_PTDUM=
P_DEBUGFS
> or CONFIG_DEBUG_WX. For example, RISC-V enables it through DEBUG_WX,
> while other architectures support both options.
>
> CONFIG_DEBUG_WX performs a kernel page table permission check at boot
> time to enforce the W^X principle. It depends on CONFIG_STRICT_KERNEL_RWX=
;
> debug_checkwx() is only invoked when CONFIG_STRICT_KERNEL_RWX is enabled.
>
> However, on LoongArch, the kernel text segment resides in the direct
> mapping region, where permission control cannot be enforced via page
> tables. Therefore, CONFIG_STRICT_KERNEL_RWX is not necessary to
> implement, and enabling DEBUG_WX is also unnecessary. Instead, this
> patch adopts CONFIG_PTDUMP_DEBUGFS to enable the ptdump feature for
> LoongArch.
OK, then CONFIG_PTDUMP_DEBUGFS is the only way to enable
CONFIG_PTDUMP, right? This is a strong signal that we should merge
ptdump.c and ptdump_debugfs.c, because there is no way to build them
separately.

>
>
> 2=EF=BC=8CHowever, for page-mapped regions, the page table permissions sh=
ould conform to the W^X principle. The MODULES region can meet this require=
ment via `CONFIG_STRICT_MODULE_RWX`.But other regions, such as vmalloc, cur=
rently still do not comply with the W^X principle (as can be verified by ch=
ecking `cat /sys/kernel/debug/check_wx_pages`). I intend to add `PAGE_NO_EX=
EC` to the `PAGE_KERNEL` definition=E3=80=82
>
>  #define PAGE_KERNEL    __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE=
 | \___
>
> __ PAGE_GLOBAL | _PAGE_KERN | _CACHE_CC | _PAGE_NO_EXEC)
>
>
>  #define PAGE_KERNEL_SUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABL=
E | \
>
> _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_SUC | _PAGE_NO_EXEC)
>
>
>  #define PAGE_KERNEL_WUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABL=
E | \
>
> PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WUC | _PAGE_NO_EXEC)
If needed, PAGE_NONE, PAGE_SHARED and PAGE_READONLY should be modified
together, but they shouldn't belong this patch, maybe belong to the
TRICT_MODULE_RWX patch.


Huacai

>
>
> eBPF memory allocated from the MODULES region is not affected by this cha=
nge, because it already gets executable permissions via `set_memory_rox`.
>
> The vmalloc, PCI I/O, vmemmap, KFENCE, KASAN, and Fixmap regions should a=
ll be non-executable by default.
>
> Would this modification have any other side effects?
>
>
> thanks!
>
> > >
> > > Co-developed-by: Xiujie Jiang <jiangxiujie@kylinos.cn>
> > >  Signed-off-by: Xiujie Jiang <jiangxiujie@kylinos.cn>
> > >  Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> > >  ---
> > >  arch/loongarch/Kconfig | 1 +
> > >  arch/loongarch/include/asm/ptdump.h | 61 ++++
> > >  arch/loongarch/mm/Makefile | 2 +
> > >  arch/loongarch/mm/ptdump.c | 417 ++++++++++++++++++++++++++++
> > >  arch/loongarch/mm/ptdump_debugfs.c | 22 ++
> > >  5 files changed, 503 insertions(+)
> > >  create mode 100644 arch/loongarch/include/asm/ptdump.h
> > >  create mode 100644 arch/loongarch/mm/ptdump.c
> > >  create mode 100644 arch/loongarch/mm/ptdump_debugfs.c
> > >
> > >  diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > >  index bec7cc1d72ee..e97fe97e1955 100644
> > >  --- a/arch/loongarch/Kconfig
> > >  +++ b/arch/loongarch/Kconfig
> > >  @@ -25,6 +25,7 @@ config LOONGARCH
> > >  select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> > >  select ARCH_HAS_PREEMPT_LAZY
> > >  select ARCH_HAS_PTE_SPECIAL if 64BIT
> > >  + select ARCH_HAS_PTDUMP
> > >  select ARCH_HAS_SET_MEMORY
> > >  select ARCH_HAS_SET_DIRECT_MAP
> > >  select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> > >  diff --git a/arch/loongarch/include/asm/ptdump.h b/arch/loongarch/in=
clude/asm/ptdump.h
> > >  new file mode 100644
> > >  index 000000000000..4590ea56abe6
> > >  --- /dev/null
> > >  +++ b/arch/loongarch/include/asm/ptdump.h
> > >  @@ -0,0 +1,61 @@
> > >  +/* SPDX-License-Identifier: GPL-2.0-only */
> > >  +
> > >  +#ifndef __ASM_PTDUMP_H
> > >  +#define __ASM_PTDUMP_H
> > >  +
> > >  +#include <linux/ptdump.h>
> > >  +#include <linux/mm_types.h>
> > >  +#include <linux/seq_file.h>
> > >  +
> > >  +/*
> > >  + * The page dumper groups page table entries of the same type into =
a single
> > >  + * description. It uses pg_state to track the range information whi=
le
> > >  + * iterating over the pte entries. When the continuity is broken it=
 then
> > >  + * dumps out a description of the range.
> > >  + */
> > >  +struct pg_state {
> > >  + struct ptdump_state ptdump;
> > >  + struct seq_file *seq;
> > >  + const struct addr_marker *marker;
> > >  + unsigned long start_address;
> > >  + unsigned long start_pa;
> > >  + unsigned long last_pa;
> > >  + int level;
> > >  + u64 current_prot;
> > >  + bool check_wx;
> > >  + unsigned long wx_pages;
> > >  +};
> > >  +
> > >  +/* Address marker */
> > >  +struct addr_marker {
> > >  + unsigned long start_address;
> > >  + const char *name;
> > >  +};
> > >  +
> > >  +/* Private information for debugfs */
> > >  +struct ptd_mm_info {
> > >  + struct mm_struct *mm;
> > >  + const struct addr_marker *markers;
> > >  + unsigned long base_addr;
> > >  + unsigned long end;
> > >  +};
> > >  +
> > >  +/* Page Table Entry */
> > >  +struct prot_bits {
> > >  + u64 mask;
> > >  + u64 val;
> > >  + const char *set;
> > >  + const char *clear;
> > >  +};
> > >  +
> > >  +/* Page Level */
> > >  +struct pg_level {
> > >  + const char *name;
> > >  + u64 mask;
> > >  +};
> > >  +
> > >  +void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo);
> > >  +void __init ptdump_debugfs_register(struct ptd_mm_info *info, const=
 char *name);
> > >  +
> > >  +#endif /* __ASM_PTDUMP_H */
> > >  +
> > >  diff --git a/arch/loongarch/mm/Makefile b/arch/loongarch/mm/Makefile
> > >  index 2aae3773de77..da9e6fee0439 100644
> > >  --- a/arch/loongarch/mm/Makefile
> > >  +++ b/arch/loongarch/mm/Makefile
> > >  @@ -10,5 +10,7 @@ obj-y +=3D init.o cache.o tlb.o tlbex.o extable.o =
\
> > >  obj-$(CONFIG_HIGHMEM) +=3D highmem.o
> > >  obj-$(CONFIG_HUGETLB_PAGE) +=3D hugetlbpage.o
> > >  obj-$(CONFIG_KASAN) +=3D kasan_init.o
> > >  +obj-$(CONFIG_PTDUMP) +=3D ptdump.o
> > >  +obj-$(CONFIG_PTDUMP_DEBUGFS) +=3D ptdump_debugfs.o
> > >
> > >  KASAN_SANITIZE_kasan_init.o :=3D n
> > >  diff --git a/arch/loongarch/mm/ptdump.c b/arch/loongarch/mm/ptdump.c
> > >  new file mode 100644
> > >  index 000000000000..cab6dad18150
> > >  --- /dev/null
> > >  +++ b/arch/loongarch/mm/ptdump.c
> > >  @@ -0,0 +1,417 @@
> > >  +// SPDX-License-Identifier: GPL-2.0-only
> > >  +/*
> > >  + * Derived from riscv implementation
> > >  + */
> > >  +
> > >  +#include <linux/init.h>
> > >  +#include <linux/debugfs.h>
> > >  +#include <linux/seq_file.h>
> > >  +#include <linux/ptdump.h>
> > >  +#include <linux/pgtable.h>
> > >  +#include <asm/kasan.h>
> > >  +#include <asm/ptdump.h>
> > >  +
> > >  +#define _PAGE_PLV_VAL 0x0
> > >  +
> > >  +#define pt_dump_seq_printf(m, fmt, args...) \
> > >  +({ \
> > >  + if (m) \
> > >  + seq_printf(m, fmt, ##args); \
> > >  +})
> > >  +
> > >  +#define pt_dump_seq_puts(m, fmt) \
> > >  +({ \
> > >  + if (m) \
> > >  + seq_puts(m, fmt); \
> > >  +})
> > >  +
> > >  +enum address_markers_idx {
> > >  + PCI_IO_START_NR,
> > >  + PCI_IO_END_NR,
> > >  + MODULES_START_NR,
> > >  + MODULES_END_NR,
> > >  + VMALLOC_START_NR,
> > >  + VMALLOC_END_NR,
> > >  +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> > >  + VMEMMAP_START_NR,
> > >  + VMEMMAP_END_NR,
> > >  +#endif
> > >  +#ifdef CONFIG_KFENCE
> > >  + KFENCE_AREA_START_NR,
> > >  + KFENCE_AREA_END_NR,
> > >  +#endif
> > >  +#ifdef CONFIG_KASAN
> > >  + KASAN_SHADOW_START_NR,
> > >  + KASAN_SHADOW_END_NR,
> > >  +#endif
> > >  + FIXMAP_START_NR,
> > >  + FIXMAP_END_NR,
> > >  + END_OF_SPACE_NR
> > >  +};
> > >  +
> > >  +
> > >  +
> > >  +static struct addr_marker address_markers[] =3D {
> > >  + {0, "PCI I/O start"},
> > >  + {0, "PCI I/O end"},
> > >  + {0, "modules start"},
> > >  + {0, "modules end"},
> > >  + {0, "vmalloc() area"},
> > >  + {0, "vmalloc() end"},
> > >  +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> > >  + {0, "vmemmap start"},
> > >  + {0, "vmemmap end"},
> > >  +#endif
> > >  +#ifdef CONFIG_KFENCE
> > >  + {0, "kfence area start"},
> > >  + {0, "kfence area end"},
> > >  +#endif
> > >  +#ifdef CONFIG_KASAN
> > >  + {0, "Kasan shadow start"},
> > >  + {0, "Kasan shadow end"},
> > >  +#endif
> > >  + {0, "Fixmap start"},
> > >  + {0, "Fixmap end"},
> > >  + {-1, NULL},
> > >  +};
> > >  +
> > >  +
> > >  +static struct ptd_mm_info kernel_ptd_info =3D {
> > >  + .mm =3D &init_mm,
> > >  + .markers =3D address_markers,
> > >  + .base_addr =3D 0,
> > >  + .end =3D ULONG_MAX,
> > >  +};
> > >  +
> > >  +static const struct prot_bits pte_bits[] =3D {
> > >  + {
> > >  + .mask =3D _PAGE_VALID,
> > >  + .val =3D _PAGE_VALID,
> > >  + .set =3D "V",
> > >  + .clear =3D " ",
> > >  + }, {
> > >  + .mask =3D _PAGE_DIRTY,
> > >  + .val =3D _PAGE_DIRTY,
> > >  + .set =3D "D",
> > >  + .clear =3D " ",
> > >  + }, {
> > >  + .mask =3D _PAGE_PLV,
> > >  + .val =3D _PAGE_PLV_VAL,
> > >  + .set =3D "KERN",
> > >  + .clear =3D "USR ",
> > >  + }, {
> > >  + .mask =3D _CACHE_MASK,
> > >  + .val =3D _CACHE_MASK,
> > >  + .set =3D " ",
> > >  + .clear =3D "SUC",
> > >  + }, {
> > >  + .mask =3D _PAGE_GLOBAL,
> > >  + .val =3D _PAGE_GLOBAL,
> > >  + .set =3D "G",
> > >  + .clear =3D " ",
> > >  + }, {
> > >  + .mask =3D _PAGE_PRESENT,
> > >  + .val =3D _PAGE_PRESENT,
> > >  + .set =3D "P",
> > >  + .clear =3D " ",
> > >  + }, {
> > >  + .mask =3D _PAGE_WRITE,
> > >  + .val =3D _PAGE_WRITE,
> > >  + .set =3D "W",
> > >  + .clear =3D " ",
> > >  + }, {
> > >  + .mask =3D _PAGE_HGLOBAL,
> > >  + .val =3D _PAGE_HGLOBAL,
> > >  + .set =3D "HG",
> > >  + .clear =3D " ",
> > >  + }, {
> > >  + .mask =3D _PAGE_NO_READ,
> > >  + .val =3D _PAGE_NO_READ,
> > >  + .set =3D "NR",
> > >  + .clear =3D " ",
> > >  + }, {
> > >  + .mask =3D _PAGE_NO_EXEC,
> > >  + .val =3D _PAGE_NO_EXEC,
> > >  + .set =3D "NX",
> > >  + .clear =3D " ",
> > >  + }, {
> > >  + .mask =3D _PAGE_RPLV,
> > >  + .val =3D _PAGE_RPLV,
> > >  + .set =3D "RPLV",
> > >  + .clear =3D " ",
> > >  + }
> > >  +};
> > >  +
> > >  +static struct pg_level pg_level[] =3D {
> > >  + { /* pgd */
> > >  + .name =3D "PGD",
> > >  + }, { /* p4d */
> > >  + .name =3D (CONFIG_PGTABLE_LEVELS > 4) ? "P4D" : "PGD",
> > >  + }, { /* pud */
> > >  + .name =3D (CONFIG_PGTABLE_LEVELS > 3) ? "PUD" : "PGD",
> > >  + }, { /* pmd */
> > >  + .name =3D (CONFIG_PGTABLE_LEVELS > 2) ? "PMD" : "PGD",
> > >  + }, { /* pte */
> > >  + .name =3D "PTE",
> > >  + },
> > >  +};
> > >  +
> > >  +static void dump_prot(struct pg_state *st)
> > >  +{
> > >  +
> > >  + unsigned int i;
> > >  +
> > >  + for (i =3D 0; i < ARRAY_SIZE(pte_bits); i++) {
> > >  + const char *s;
> > >  +
> > >  + if (pte_bits[i].mask =3D=3D _CACHE_MASK) {
> > >  + if ((st->current_prot & pte_bits[i].mask) =3D=3D _CACHE_CC)
> > >  + s =3D "CC ";
> > >  + else if ((st->current_prot & pte_bits[i].mask) =3D=3D _CACHE_WUC)
> > >  + s =3D "WUC";
> > >  + else
> > >  + s =3D pte_bits[i].clear;
> > >  + } else if (pte_bits[i].mask =3D=3D _PAGE_GLOBAL) {
> > >  + if ((st->current_prot & pte_bits[i].mask) =3D=3D pte_bits[i].val) =
{
> > >  + if (st->level !=3D 4)
> > >  + s =3D "PSE";
> > >  + else
> > >  + s =3D pte_bits[i].set;
> > >  + } else {
> > >  + s =3D pte_bits[i].clear;
> > >  + }
> > >  +
> > >  + } else {
> > >  + if ((st->current_prot & pte_bits[i].mask) =3D=3D pte_bits[i].val)
> > >  + s =3D pte_bits[i].set;
> > >  + else
> > >  + s =3D pte_bits[i].clear;
> > >  + }
> > >  +
> > >  +
> > >  + if (s)
> > >  + pt_dump_seq_printf(st->seq, " %s", s);
> > >  + }
> > >  +
> > >  +}
> > >  +
> > >  +
> > >  +#ifdef CONFIG_64BIT
> > >  +#define ADDR_FORMAT "0x%016lx"
> > >  +#else
> > >  +#define ADDR_FORMAT "0x%08lx"
> > >  +#endif
> > >  +static void dump_addr(struct pg_state *st, unsigned long addr)
> > >  +{
> > >  + static const char units[] =3D "KMGTPE";
> > >  + const char *unit =3D units;
> > >  + unsigned long delta;
> > >  +
> > >  + pt_dump_seq_printf(st->seq, ADDR_FORMAT "-" ADDR_FORMAT " ",
> > >  + st->start_address, addr);
> > >  +
> > >  + pt_dump_seq_printf(st->seq, " " ADDR_FORMAT " ", st->start_pa);
> > >  + delta =3D (addr - st->start_address) >> 10;
> > >  +
> > >  + while (!(delta & 1023) && unit[1]) {
> > >  + delta >>=3D 10;
> > >  + unit++;
> > >  + }
> > >  +
> > >  + pt_dump_seq_printf(st->seq, "%9lu%c %s", delta, *unit,
> > >  + pg_level[st->level].name);
> > >  +}
> > >  +
> > >  +static void note_prot_wx(struct pg_state *st, unsigned long addr)
> > >  +{
> > >  + if (!st->check_wx)
> > >  + return;
> > >  + if ((st->current_prot & _PAGE_WRITE) =3D=3D 0)
> > >  + return;
> > >  + if ((st->current_prot & _PAGE_NO_EXEC) =3D=3D _PAGE_NO_EXEC)
> > >  + return;
> > >  +
> > >  + st->wx_pages +=3D (addr - st->start_address) / PAGE_SIZE;
> > >  +
> > >  +}
> > >  +
> > >  +static void note_page(struct ptdump_state *pt_st, unsigned long add=
r,
> > >  + int level, u64 val)
> > >  +{
> > >  + struct pg_state *st =3D container_of(pt_st, struct pg_state, ptdum=
p);
> > >  + u64 pa =3D PFN_PHYS(pte_pfn(__pte(val)));
> > >  + u64 prot =3D 0;
> > >  +
> > >  + if (level >=3D 0)
> > >  + prot =3D val & pg_level[level].mask;
> > >  +
> > >  + if (st->level =3D=3D -1) {
> > >  + st->level =3D level;
> > >  + st->current_prot =3D prot;
> > >  + st->start_address =3D addr;
> > >  + st->start_pa =3D pa;
> > >  + st->last_pa =3D pa;
> > >  + pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
> > >  + } else if (prot !=3D st->current_prot ||
> > >  + level !=3D st->level || addr >=3D st->marker[1].start_address) {
> > >  + if (st->current_prot) {
> > >  + note_prot_wx(st, addr);
> > >  + dump_addr(st, addr);
> > >  + dump_prot(st);
> > >  + pt_dump_seq_puts(st->seq, "\n");
> > >  + }
> > >  +
> > >  + while (addr >=3D st->marker[1].start_address) {
> > >  + st->marker++;
> > >  + pt_dump_seq_printf(st->seq, "---[ %s ]---\n",
> > >  + st->marker->name);
> > >  + }
> > >  +
> > >  + st->start_address =3D addr;
> > >  + st->start_pa =3D pa;
> > >  + st->last_pa =3D pa;
> > >  + st->current_prot =3D prot;
> > >  + st->level =3D level;
> > >  + } else {
> > >  + st->last_pa =3D pa;
> > >  + }
> > >  +}
> > >  +
> > >  +static void note_page_pte(struct ptdump_state *pt_st, unsigned long=
 addr, pte_t pte)
> > >  +{
> > >  + note_page(pt_st, addr, 4, pte_val(pte));
> > >  +}
> > >  +
> > >  +static void note_page_pmd(struct ptdump_state *pt_st, unsigned long=
 addr, pmd_t pmd)
> > >  +{
> > >  + note_page(pt_st, addr, 3, pmd_val(pmd));
> > >  +}
> > >  +
> > >  +static void note_page_pud(struct ptdump_state *pt_st, unsigned long=
 addr, pud_t pud)
> > >  +{
> > >  + note_page(pt_st, addr, 2, pud_val(pud));
> > >  +}
> > >  +
> > >  +static void note_page_p4d(struct ptdump_state *pt_st, unsigned long=
 addr, p4d_t p4d)
> > >  +{
> > >  + note_page(pt_st, addr, 1, p4d_val(p4d));
> > >  +}
> > >  +
> > >  +static void note_page_pgd(struct ptdump_state *pt_st, unsigned long=
 addr, pgd_t pgd)
> > >  +{
> > >  + note_page(pt_st, addr, 0, pgd_val(pgd));
> > >  +}
> > >  +
> > >  +static void note_page_flush(struct ptdump_state *pt_st)
> > >  +{
> > >  + pte_t pte_zero =3D {0};
> > >  +
> > >  + note_page(pt_st, 0, -1, pte_val(pte_zero));
> > >  +}
> > >  +
> > >  +void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
> > >  +{
> > >  + struct pg_state st =3D {
> > >  + .seq =3D s,
> > >  + .marker =3D pinfo->markers,
> > >  + .level =3D -1,
> > >  + .ptdump =3D {
> > >  + .note_page_pte =3D note_page_pte,
> > >  + .note_page_pmd =3D note_page_pmd,
> > >  + .note_page_pud =3D note_page_pud,
> > >  + .note_page_p4d =3D note_page_p4d,
> > >  + .note_page_pgd =3D note_page_pgd,
> > >  + .note_page_flush =3D note_page_flush,
> > >  + .range =3D (struct ptdump_range[]) {
> > >  + {pinfo->base_addr, pinfo->end},
> > >  + {0, 0}
> > >  + }
> > >  + }
> > >  + };
> > >  +
> > >  + ptdump_walk_pgd(&st.ptdump, pinfo->mm, NULL);
> > >  +}
> > >  +
> > >  +bool ptdump_check_wx(void)
> > >  +{
> > >  + struct pg_state st =3D {
> > >  + .seq =3D NULL,
> > >  + .marker =3D (struct addr_marker[]) {
> > >  + {0, NULL},
> > >  + {-1, NULL},
> > >  + },
> > >  + .level =3D -1,
> > >  + .check_wx =3D true,
> > >  + .ptdump =3D {
> > >  + .note_page_pte =3D note_page_pte,
> > >  + .note_page_pmd =3D note_page_pmd,
> > >  + .note_page_pud =3D note_page_pud,
> > >  + .note_page_p4d =3D note_page_p4d,
> > >  + .note_page_pgd =3D note_page_pgd,
> > >  + .note_page_flush =3D note_page_flush,
> > >  + .range =3D (struct ptdump_range[]) {
> > >  + {vm_map_base, ULONG_MAX},
> > >  + {0, 0}
> > >  + }
> > >  + }
> > >  + };
> > >  +
> > >  + ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
> > >  +
> > >  + if (st.wx_pages) {
> > >  + pr_warn("Checked W+X mappings: failed, %lu W+X pages found\n",
> > >  + st.wx_pages);
> > >  +
> > >  + return false;
> > >  + }
> > >  +
> > >  + pr_info("Checked W+X mappings: passed, no W+X pages found\n");
> > >  +
> > >  + return true;
> > >  +}
> > >  +
> > >  +
> > >  +static int __init ptdump_init(void)
> > >  +{
> > >  + unsigned int i, j;
> > >  +
> > >  + address_markers[PCI_IO_START_NR].start_address =3D (unsigned long)=
PCI_IOBASE;
> > >  + address_markers[PCI_IO_END_NR].start_address =3D (unsigned long)PC=
I_IOBASE + IO_SPACE_LIMIT;
> > >  +
> > >  + address_markers[MODULES_START_NR].start_address =3D MODULES_VADDR;
> > >  + address_markers[MODULES_END_NR].start_address =3D MODULES_END;
> > >  +
> > >  + address_markers[VMALLOC_START_NR].start_address =3D VMALLOC_START;
> > >  + address_markers[VMALLOC_END_NR].start_address =3D VMALLOC_END;
> > >  +
> > >  +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> > >  + address_markers[VMEMMAP_START_NR].start_address =3D (unsigned long=
)vmemmap;
> > >  + address_markers[VMEMMAP_END_NR].start_address =3D VMEMMAP_END;
> > >  +#endif
> > >  +
> > >  +#ifdef CONFIG_KFENCE
> > >  + address_markers[KFENCE_AREA_START_NR].start_address =3D KFENCE_ARE=
A_START;
> > >  + address_markers[KFENCE_AREA_END_NR].start_address =3D KFENCE_AREA_=
END;
> > >  +#endif
> > >  +
> > >  +#ifdef CONFIG_KASAN
> > >  + address_markers[KASAN_SHADOW_START_NR].start_address =3D KASAN_SHA=
DOW_START;
> > >  + address_markers[KASAN_SHADOW_END_NR].start_address =3D KASAN_SHADO=
W_END;
> > >  +#endif
> > >  +
> > >  + address_markers[FIXMAP_START_NR].start_address =3D FIXADDR_START;
> > >  + address_markers[FIXMAP_END_NR].start_address =3D FIXADDR_TOP;
> > >  +
> > >  + kernel_ptd_info.base_addr =3D vm_map_base;
> > >  +
> > >  + for (i =3D 0; i < ARRAY_SIZE(pg_level); i++) {
> > >  + for (j =3D 0; j < ARRAY_SIZE(pte_bits); j++)
> > >  + pg_level[i].mask |=3D pte_bits[j].mask;
> > >  + }
> > >  +
> > >  + ptdump_debugfs_register(&kernel_ptd_info, "kernel_page_tables");
> > >  +
> > >  + return 0;
> > >  +}
> > >  +
> > >  +device_initcall(ptdump_init);
> > >  diff --git a/arch/loongarch/mm/ptdump_debugfs.c b/arch/loongarch/mm/=
ptdump_debugfs.c
> > >  new file mode 100644
> > >  index 000000000000..aa6169f6aa3a
> > >  --- /dev/null
> > >  +++ b/arch/loongarch/mm/ptdump_debugfs.c
> > >  @@ -0,0 +1,22 @@
> > >  +// SPDX-License-Identifier: GPL-2.0
> > >  +#include <linux/debugfs.h>
> > >  +#include <linux/seq_file.h>
> > >  +
> > >  +#include <asm/ptdump.h>
> > >  +#include <asm/pgtable.h>
> > >  +#include <asm/kasan.h>
> > >  +
> > >  +static int ptdump_show(struct seq_file *m, void *v)
> > >  +{
> > >  + struct ptd_mm_info *info =3D m->private;
> > >  +
> > >  + ptdump_walk(m, info);
> > >  + return 0;
> > >  +}
> > >  +DEFINE_SHOW_ATTRIBUTE(ptdump);
> > >  +
> > >  +void __init ptdump_debugfs_register(struct ptd_mm_info *info, const=
 char *name)
> > >  +{
> > >  + debugfs_create_file(name, 0400, NULL, info, &ptdump_fops);
> > >  +}
> > >  +
> > >  --
> > >  2.43.0
> > >
> >
