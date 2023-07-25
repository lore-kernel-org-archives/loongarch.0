Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B74134A1
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 07:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B66C433CA
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690271342;
	bh=dX+VPQmke9zzpXA4ZaA5DPIXx5I7r20GjVudAX3lC4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WybcbO8maYmdaugiZEag8QO7nLXquwsb6clBBSjQ2Xv5kN4Bog4hnneltUn5+7iSQ
	 WAnUipowmp7kCISfBQZPSA6iW3LS6wtQ5zsBbRjcfJV8alZaSEV8yqZZ+enll/zioX
	 Vecf8zJfyconZAFtIn1+AOFkxKgwO00d4MX3QzIZeibBTQ0vFrMsMx5NvnHC0awqKW
	 8e5HuYlcCHwX9gNxEtPjLqOgh/PhSutm0qUebpOh8VkjKwIvHgFpYDVcYAmGaQG+ov
	 c9/Ad15DMgwNy4JtBM9WVFErbf9J/CoBqt3DEaIqAhXU3jrPjumGSnOLwxZzl2Zonb
	 k4Abk1O8R95jg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so7767676e87.2
        for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 00:49:02 -0700 (PDT)
X-Gm-Message-State: ABy/qLYHt05p/Ip02I7h0Jeetqlz1KRSvfsqGU/yYxAy4Ursdg4q8dY+
	jHbfG+/MzFf1K3uKqh8suVzuL25XSEYJHQGTPJo=
X-Google-Smtp-Source: APBJJlFcguhzjxkSC7PeabXtndYmHz0/4adKWBHqT1/aKRuIe+CfEpQ1bOfBfDnZPyR89TaKAqcucsZVaKxWgxAObR0=
X-Received: by 2002:a05:6512:2523:b0:4f7:6966:36fb with SMTP id
 be35-20020a056512252300b004f7696636fbmr7905252lfb.12.1690271340083; Tue, 25
 Jul 2023 00:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230725061451.1231480-1-lienze@kylinos.cn> <20230725061451.1231480-5-lienze@kylinos.cn>
In-Reply-To: <20230725061451.1231480-5-lienze@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Jul 2023 15:48:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7j6R5zWvXuLucnq0Xvu=1Q-pxQzG1DavTAx63AL+GzbA@mail.gmail.com>
Message-ID: <CAAhV-H7j6R5zWvXuLucnq0Xvu=1Q-pxQzG1DavTAx63AL+GzbA@mail.gmail.com>
Subject: Re: [PATCH 4/4 v2] LoongArch: Add KFENCE support
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

On Tue, Jul 25, 2023 at 2:15=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>
> The LoongArch architecture is quite different from other architectures.
> When the allocating of KFENCE itself is done, it is mapped to the direct
> mapping configuration window [1] by default on LoongArch.  It means that
> it is not possible to use the page table mapped mode which required by
> the KFENCE system and therefore it should be remapped to the appropriate
> region.
>
> This patch adds architecture specific implementation details for KFENCE.
> In particular, this implements the required interface in <asm/kfence.h>.
>
> Tested this patch by running the testcases and all passed.
>
> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.=
html#virtual-address-space-and-address-translation-mode
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  arch/loongarch/Kconfig               |  1 +
>  arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
>  arch/loongarch/include/asm/pgtable.h | 14 ++++++-
>  arch/loongarch/mm/fault.c            | 22 ++++++----
>  4 files changed, 90 insertions(+), 9 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/kfence.h
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 70635ea3d1e4..5b63b16be49e 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -91,6 +91,7 @@ config LOONGARCH
>         select HAVE_ARCH_AUDITSYSCALL
>         select HAVE_ARCH_JUMP_LABEL
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
> +       select HAVE_ARCH_KFENCE
>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>         select HAVE_ARCH_SECCOMP_FILTER
>         select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/include=
/asm/kfence.h
> new file mode 100644
> index 000000000000..fb39076fe4d7
> --- /dev/null
> +++ b/arch/loongarch/include/asm/kfence.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KFENCE support for LoongArch.
> + *
> + * Author: Enze Li <lienze@kylinos.cn>
> + * Copyright (C) 2022-2023 KylinSoft Corporation.
> + */
> +
> +#ifndef _ASM_LOONGARCH_KFENCE_H
> +#define _ASM_LOONGARCH_KFENCE_H
> +
> +#include <linux/kfence.h>
> +#include <asm/pgtable.h>
> +#include <asm/tlb.h>
> +
> +static inline bool arch_kfence_init_pool(void)
> +{
> +       char *kfence_pool =3D __kfence_pool;
> +       struct vm_struct *area;
> +       int err;
> +
> +       area =3D __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
> +                                   KFENCE_AREA_START, KFENCE_AREA_END,
> +                                   __builtin_return_address(0));
> +       if (!area)
> +               return false;
> +
> +       __kfence_pool =3D (char *)area->addr;
> +       err =3D ioremap_page_range((unsigned long)__kfence_pool,
> +                                (unsigned long)__kfence_pool + KFENCE_PO=
OL_SIZE,
> +                                virt_to_phys((void *)kfence_pool),
> +                                PAGE_KERNEL);
> +       if (err) {
> +               free_vm_area(area);
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
> +/* Protect the given page and flush TLB. */
> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
> +{
> +       pte_t *pte =3D virt_to_kpte(addr);
> +
> +       if (WARN_ON(!pte) || pte_none(*pte))
> +               return false;
> +
> +       if (protect)
> +               set_pte(pte, __pte(pte_val(*pte) & ~(_PAGE_VALID | _PAGE_=
PRESENT)));
> +       else
> +               set_pte(pte, __pte(pte_val(*pte) | (_PAGE_VALID | _PAGE_P=
RESENT)));
> +
> +       /* Flush this CPU's TLB. */
This comment can be removed since the logic is obvious.

> +       preempt_disable();
> +       local_flush_tlb_one(addr);
> +       preempt_enable();
> +
> +       return true;
> +}
> +
> +#endif /* _ASM_LOONGARCH_KFENCE_H */
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index 98a0c98de9d1..2702a6ba7122 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -77,6 +77,13 @@ extern unsigned long zero_page_mask;
>         (virt_to_page((void *)(empty_zero_page + (((unsigned long)(vaddr)=
) & zero_page_mask))))
>  #define __HAVE_COLOR_ZERO_PAGE
>
> +#ifdef CONFIG_KFENCE
> +#define KFENCE_AREA_SIZE \
> +       (((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
Needn't change to a new line.

Others look good to me.

Huacai

> +#else
> +#define KFENCE_AREA_SIZE       0
> +#endif
> +
>  /*
>   * TLB refill handlers may also map the vmalloc area into xkvrange.
>   * Avoid the first couple of pages so NULL pointer dereferences will
> @@ -88,11 +95,16 @@ extern unsigned long zero_page_mask;
>  #define VMALLOC_START  MODULES_END
>  #define VMALLOC_END    \
>         (vm_map_base +  \
> -        min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * =
PAGE_SIZE, (1UL << cpu_vabits)) - PMD_SIZE - VMEMMAP_SIZE)
> +        min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * =
PAGE_SIZE, (1UL << cpu_vabits)) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SIZ=
E)
>
>  #define vmemmap                ((struct page *)((VMALLOC_END + PMD_SIZE)=
 & PMD_MASK))
>  #define VMEMMAP_END    ((unsigned long)vmemmap + VMEMMAP_SIZE - 1)
>
> +#ifdef CONFIG_KFENCE
> +#define KFENCE_AREA_START      VMEMMAP_END
> +#define KFENCE_AREA_END                (KFENCE_AREA_START + KFENCE_AREA_=
SIZE)
> +#endif
> +
>  #define pte_ERROR(e) \
>         pr_err("%s:%d: bad pte %016lx.\n", __FILE__, __LINE__, pte_val(e)=
)
>  #ifndef __PAGETABLE_PMD_FOLDED
> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
> index da5b6d518cdb..c0319128b221 100644
> --- a/arch/loongarch/mm/fault.c
> +++ b/arch/loongarch/mm/fault.c
> @@ -23,6 +23,7 @@
>  #include <linux/kprobes.h>
>  #include <linux/perf_event.h>
>  #include <linux/uaccess.h>
> +#include <linux/kfence.h>
>
>  #include <asm/branch.h>
>  #include <asm/mmu_context.h>
> @@ -30,7 +31,8 @@
>
>  int show_unhandled_signals =3D 1;
>
> -static void __kprobes no_context(struct pt_regs *regs, unsigned long add=
ress)
> +static void __kprobes no_context(struct pt_regs *regs, unsigned long add=
ress,
> +                                unsigned long write)
>  {
>         const int field =3D sizeof(unsigned long) * 2;
>
> @@ -38,6 +40,9 @@ static void __kprobes no_context(struct pt_regs *regs, =
unsigned long address)
>         if (fixup_exception(regs))
>                 return;
>
> +       if (kfence_handle_page_fault(address, write, regs))
> +               return;
> +
>         /*
>          * Oops. The kernel tried to access some bad page. We'll have to
>          * terminate things with extreme prejudice.
> @@ -51,14 +56,15 @@ static void __kprobes no_context(struct pt_regs *regs=
, unsigned long address)
>         die("Oops", regs);
>  }
>
> -static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned lo=
ng address)
> +static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned lo=
ng address,
> +                                      unsigned long write)
>  {
>         /*
>          * We ran out of memory, call the OOM killer, and return the user=
space
>          * (which will retry the fault, or kill us if we got oom-killed).
>          */
>         if (!user_mode(regs)) {
> -               no_context(regs, address);
> +               no_context(regs, address, write);
>                 return;
>         }
>         pagefault_out_of_memory();
> @@ -69,7 +75,7 @@ static void __kprobes do_sigbus(struct pt_regs *regs,
>  {
>         /* Kernel mode? Handle exceptions or die */
>         if (!user_mode(regs)) {
> -               no_context(regs, address);
> +               no_context(regs, address, write);
>                 return;
>         }
>
> @@ -90,7 +96,7 @@ static void __kprobes do_sigsegv(struct pt_regs *regs,
>
>         /* Kernel mode? Handle exceptions or die */
>         if (!user_mode(regs)) {
> -               no_context(regs, address);
> +               no_context(regs, address, write);
>                 return;
>         }
>
> @@ -149,7 +155,7 @@ static void __kprobes __do_page_fault(struct pt_regs =
*regs,
>          */
>         if (address & __UA_LIMIT) {
>                 if (!user_mode(regs))
> -                       no_context(regs, address);
> +                       no_context(regs, address, write);
>                 else
>                         do_sigsegv(regs, write, address, si_code);
>                 return;
> @@ -211,7 +217,7 @@ static void __kprobes __do_page_fault(struct pt_regs =
*regs,
>
>         if (fault_signal_pending(fault, regs)) {
>                 if (!user_mode(regs))
> -                       no_context(regs, address);
> +                       no_context(regs, address, write);
>                 return;
>         }
>
> @@ -232,7 +238,7 @@ static void __kprobes __do_page_fault(struct pt_regs =
*regs,
>         if (unlikely(fault & VM_FAULT_ERROR)) {
>                 mmap_read_unlock(mm);
>                 if (fault & VM_FAULT_OOM) {
> -                       do_out_of_memory(regs, address);
> +                       do_out_of_memory(regs, address, write);
>                         return;
>                 } else if (fault & VM_FAULT_SIGSEGV) {
>                         do_sigsegv(regs, write, address, si_code);
> --
> 2.34.1
>
>
