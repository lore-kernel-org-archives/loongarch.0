Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEEC156D1
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA871C433C8
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689780482;
	bh=VuCIRy30W6NNEm320JJ7plTAIxo9dj/XurZfZt2DCh4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z97JdpsC8B5qqtam1ATSM/L8vaw3Oon+cL4aUIeI52X0HqPcdH0owYllEQJ9JB6fW
	 vnOJob3VZgRQ/9vaHzS01vaNJUqaHuiWEUs5mQQVBo7beFj2I3Fi5Ey7Urci7rtJD+
	 AUC7MrSLRGOJv9OthL9WcUFLcFMZpDSEedikNWoNGRGQGc/p9dVdDd2OdN/yRM9Gbp
	 Tp9OyxvjEj///bIafSmQOFrh0eC8c0uXxOfK1t8ntxJ6pw38hwW5B0vifev70vH/Ls
	 cJN+2qv3HngSZmGAfkRQ5vhJtz6Ilc2xnVOFGaBt0yTlq51sw+w7X/ZF0QhlenhgyE
	 NCaf5G2KRoJ+w==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51fdf291330so9931166a12.2
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:28:02 -0700 (PDT)
X-Gm-Message-State: ABy/qLYlsIrh17C2+4mvnnCOFO/BsrBM7zuP0GX7O+twdwjcsDmnMKl9
	ktlqe/TyFTTyLhYg2FYpN8WCPJ4omoq6N+LC4BY=
X-Google-Smtp-Source: APBJJlHG0pkNH/YXhGZaVStnyW7GW9Y2592NfB65Ub2jKLxCDPnKF7iV3fhEYdGxGKrF64EsYUhie/NQYmuSetP6bGo=
X-Received: by 2002:a05:6402:2037:b0:51e:293b:e1ce with SMTP id
 ay23-20020a056402203700b0051e293be1cemr2706511edb.31.1689780480858; Wed, 19
 Jul 2023 08:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-5-lienze@kylinos.cn>
In-Reply-To: <20230719082732.2189747-5-lienze@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Jul 2023 23:27:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H71sv+VeLfNzuiqitYcuB4rHnho=dRYQftwo1__3bLZSQ@mail.gmail.com>
Message-ID: <CAAhV-H71sv+VeLfNzuiqitYcuB4rHnho=dRYQftwo1__3bLZSQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] LoongArch: Add KFENCE support
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
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
> Tested this patch by using the testcases and all passed.
>
> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.=
html#virtual-address-space-and-address-translation-mode
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  arch/loongarch/Kconfig               |  1 +
>  arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
>  arch/loongarch/include/asm/pgtable.h |  6 +++
>  arch/loongarch/mm/fault.c            | 22 ++++++----
>  4 files changed, 83 insertions(+), 8 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/kfence.h
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 5411e3a4eb88..db27729003d3 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -93,6 +93,7 @@ config LOONGARCH
>         select HAVE_ARCH_JUMP_LABEL
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>         select HAVE_ARCH_KASAN
> +       select HAVE_ARCH_KFENCE if 64BIT
"if 64BIT" can be dropped here.

>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>         select HAVE_ARCH_SECCOMP_FILTER
>         select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/include=
/asm/kfence.h
> new file mode 100644
> index 000000000000..2a85acc2bc70
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
> +static inline char *arch_kfence_init_pool(void)
> +{
> +       char *__kfence_pool_orig =3D __kfence_pool;
I prefer kfence_pool than __kfence_pool_orig here.

> +       struct vm_struct *area;
> +       int err;
> +
> +       area =3D __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
> +                                   KFENCE_AREA_START, KFENCE_AREA_END,
> +                                   __builtin_return_address(0));
> +       if (!area)
> +               return NULL;
> +
> +       __kfence_pool =3D (char *)area->addr;
> +       err =3D ioremap_page_range((unsigned long)__kfence_pool,
> +                                (unsigned long)__kfence_pool + KFENCE_PO=
OL_SIZE,
> +                                virt_to_phys((void *)__kfence_pool_orig)=
,
> +                                PAGE_KERNEL);
> +       if (err) {
> +               free_vm_area(area);
> +               return NULL;
> +       }
> +
> +       return __kfence_pool;
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
> index 0fc074b8bd48..5a9c81298fe3 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -85,7 +85,13 @@ extern unsigned long zero_page_mask;
>  #define MODULES_VADDR  (vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
>  #define MODULES_END    (MODULES_VADDR + SZ_256M)
>
> +#ifdef CONFIG_KFENCE
> +#define KFENCE_AREA_START      MODULES_END
> +#define KFENCE_AREA_END                (KFENCE_AREA_START + SZ_512M)
Why you choose 512M here?

> +#define VMALLOC_START          KFENCE_AREA_END
> +#else
>  #define VMALLOC_START  MODULES_END
> +#endif
I don't like to put KFENCE_AREA between module and vmalloc range (it
may cause some problems), can we put it after vmemmap?

Huacai
>
>  #ifndef CONFIG_KASAN
>  #define VMALLOC_END    \
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
