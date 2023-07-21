Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F3C7F
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 03:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B9EC433CA
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 03:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689909564;
	bh=V/OXNG6zPguF5qEXosea/5A6BJp3v4nag/2pRCLc2+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rJMBGazvmlP0TdSDaKPYbCDFevCHREuL6Y3GIPYynjYg8ApPxaJxgVUUusYw5ww3k
	 YfEkygf8jbyB7sKSb+LUcjf0lVys3HWMUQkQXvJhOAuLDes7sUAXo+fQBX7EmXiyNm
	 jcZkwCui1kDcm2H8XwuOjx5+LqrYZ4Dwk+OcVeBliVtt8stEoicyR69v3glmBA4Uz1
	 q/R3/ayODCAUGF+RzdL9TDkg5sTqc8n6+7bItUYFXeNenIXcCst5pPohmx0GkT3OTN
	 LKqI4DpYyjy/WfdZWU40GTKzlRKrOm8CdXWXDsCiKOsuGTeUkWbHSeV4eZj2OoDI60
	 9ZmfFkk4ypwZg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5216569f9e3so2059001a12.0
        for <loongarch@lists.linux.dev>; Thu, 20 Jul 2023 20:19:24 -0700 (PDT)
X-Gm-Message-State: ABy/qLYOwbuRQYogsmS8k1CyyBiRaxyFXVvkIEYXptZuC60mu63H515M
	iIlYk6USZi1FdI8fgGQS/2WHPabyU3krjsCobJQ=
X-Google-Smtp-Source: APBJJlHtcQArfaoivwJcVMJUjBCPE2XGcT7dnhNaBhtR09ldTNaYe3BWrdF9AiL0C8O3ki6SeK6xXf45KZRMwmzqOcM=
X-Received: by 2002:aa7:dcc7:0:b0:515:1e50:5498 with SMTP id
 w7-20020aa7dcc7000000b005151e505498mr505713edu.15.1689909562263; Thu, 20 Jul
 2023 20:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-5-lienze@kylinos.cn>
 <CAAhV-H71sv+VeLfNzuiqitYcuB4rHnho=dRYQftwo1__3bLZSQ@mail.gmail.com> <87lefaez31.fsf@kylinos.cn>
In-Reply-To: <87lefaez31.fsf@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 21 Jul 2023 11:19:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6FoC1v9f9Vkq9rzk=0j88RczLgiYTiBUBNDwx3B=3tYA@mail.gmail.com>
Message-ID: <CAAhV-H6FoC1v9f9Vkq9rzk=0j88RczLgiYTiBUBNDwx3B=3tYA@mail.gmail.com>
Subject: Re: [PATCH 4/4] LoongArch: Add KFENCE support
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

On Fri, Jul 21, 2023 at 11:14=E2=80=AFAM Enze Li <lienze@kylinos.cn> wrote:
>
> On Wed, Jul 19 2023 at 11:27:50 PM +0800, Huacai Chen wrote:
>
> > Hi, Enze,
> >
> > On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wro=
te:
> >>
> >> The LoongArch architecture is quite different from other architectures=
.
> >> When the allocating of KFENCE itself is done, it is mapped to the dire=
ct
> >> mapping configuration window [1] by default on LoongArch.  It means th=
at
> >> it is not possible to use the page table mapped mode which required by
> >> the KFENCE system and therefore it should be remapped to the appropria=
te
> >> region.
> >>
> >> This patch adds architecture specific implementation details for KFENC=
E.
> >> In particular, this implements the required interface in <asm/kfence.h=
>.
> >>
> >> Tested this patch by using the testcases and all passed.
> >>
> >> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-=
EN.html#virtual-address-space-and-address-translation-mode
> >>
> >> Signed-off-by: Enze Li <lienze@kylinos.cn>
> >> ---
> >>  arch/loongarch/Kconfig               |  1 +
> >>  arch/loongarch/include/asm/kfence.h  | 62 +++++++++++++++++++++++++++=
+
> >>  arch/loongarch/include/asm/pgtable.h |  6 +++
> >>  arch/loongarch/mm/fault.c            | 22 ++++++----
> >>  4 files changed, 83 insertions(+), 8 deletions(-)
> >>  create mode 100644 arch/loongarch/include/asm/kfence.h
> >>
> >> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >> index 5411e3a4eb88..db27729003d3 100644
> >> --- a/arch/loongarch/Kconfig
> >> +++ b/arch/loongarch/Kconfig
> >> @@ -93,6 +93,7 @@ config LOONGARCH
> >>         select HAVE_ARCH_JUMP_LABEL
> >>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >>         select HAVE_ARCH_KASAN
> >> +       select HAVE_ARCH_KFENCE if 64BIT
> > "if 64BIT" can be dropped here.
> >
>
> Fixed.
>
> >>         select HAVE_ARCH_MMAP_RND_BITS if MMU
> >>         select HAVE_ARCH_SECCOMP_FILTER
> >>         select HAVE_ARCH_TRACEHOOK
> >> diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/incl=
ude/asm/kfence.h
> >> new file mode 100644
> >> index 000000000000..2a85acc2bc70
> >> --- /dev/null
> >> +++ b/arch/loongarch/include/asm/kfence.h
> >> @@ -0,0 +1,62 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * KFENCE support for LoongArch.
> >> + *
> >> + * Author: Enze Li <lienze@kylinos.cn>
> >> + * Copyright (C) 2022-2023 KylinSoft Corporation.
> >> + */
> >> +
> >> +#ifndef _ASM_LOONGARCH_KFENCE_H
> >> +#define _ASM_LOONGARCH_KFENCE_H
> >> +
> >> +#include <linux/kfence.h>
> >> +#include <asm/pgtable.h>
> >> +#include <asm/tlb.h>
> >> +
> >> +static inline char *arch_kfence_init_pool(void)
> >> +{
> >> +       char *__kfence_pool_orig =3D __kfence_pool;
> > I prefer kfence_pool than __kfence_pool_orig here.
> >
>
> Fixed.
>
> >> +       struct vm_struct *area;
> >> +       int err;
> >> +
> >> +       area =3D __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
> >> +                                   KFENCE_AREA_START, KFENCE_AREA_END=
,
> >> +                                   __builtin_return_address(0));
> >> +       if (!area)
> >> +               return NULL;
> >> +
> >> +       __kfence_pool =3D (char *)area->addr;
> >> +       err =3D ioremap_page_range((unsigned long)__kfence_pool,
> >> +                                (unsigned long)__kfence_pool + KFENCE=
_POOL_SIZE,
> >> +                                virt_to_phys((void *)__kfence_pool_or=
ig),
> >> +                                PAGE_KERNEL);
> >> +       if (err) {
> >> +               free_vm_area(area);
> >> +               return NULL;
> >> +       }
> >> +
> >> +       return __kfence_pool;
> >> +}
> >> +
> >> +/* Protect the given page and flush TLB. */
> >> +static inline bool kfence_protect_page(unsigned long addr, bool prote=
ct)
> >> +{
> >> +       pte_t *pte =3D virt_to_kpte(addr);
> >> +
> >> +       if (WARN_ON(!pte) || pte_none(*pte))
> >> +               return false;
> >> +
> >> +       if (protect)
> >> +               set_pte(pte, __pte(pte_val(*pte) & ~(_PAGE_VALID | _PA=
GE_PRESENT)));
> >> +       else
> >> +               set_pte(pte, __pte(pte_val(*pte) | (_PAGE_VALID | _PAG=
E_PRESENT)));
> >> +
> >> +       /* Flush this CPU's TLB. */
> >> +       preempt_disable();
> >> +       local_flush_tlb_one(addr);
> >> +       preempt_enable();
> >> +
> >> +       return true;
> >> +}
> >> +
> >> +#endif /* _ASM_LOONGARCH_KFENCE_H */
> >> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/inc=
lude/asm/pgtable.h
> >> index 0fc074b8bd48..5a9c81298fe3 100644
> >> --- a/arch/loongarch/include/asm/pgtable.h
> >> +++ b/arch/loongarch/include/asm/pgtable.h
> >> @@ -85,7 +85,13 @@ extern unsigned long zero_page_mask;
> >>  #define MODULES_VADDR  (vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
> >>  #define MODULES_END    (MODULES_VADDR + SZ_256M)
> >>
> >> +#ifdef CONFIG_KFENCE
> >> +#define KFENCE_AREA_START      MODULES_END
> >> +#define KFENCE_AREA_END                (KFENCE_AREA_START + SZ_512M)
> > Why you choose 512M here?
> >
>
> One day I noticed that 512M can hold 16K (default 255) KFENCE objects,
> which should be more than enough and I think this should be appropriate.
>
> As far as I see, KFENCE system does not have the upper limit of this
> value(CONFIG_KFENCE_NUM_OBJECTS), which could theoretically be any
> number.  There's another way, how about setting this value to be
> determined by the configuration, like this,
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  +#define KFENCE_AREA_END \
>  + (KFENCE_AREA_START + (CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 * PAGE_SIZE)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
How does other archs configure the size?

>
> >> +#define VMALLOC_START          KFENCE_AREA_END
> >> +#else
> >>  #define VMALLOC_START  MODULES_END
> >> +#endif
> > I don't like to put KFENCE_AREA between module and vmalloc range (it
> > may cause some problems), can we put it after vmemmap?
>
> I found that there is not enough space after vmemmap and that these
> spaces are affected by KASAN. As follows,
>
> Without KASAN
> ###### module 0xffff800002008000~0xffff800012008000
> ###### malloc 0xffff800032008000~0xfffffefffe000000
> ###### vmemmap 0xffffff0000000000~0xffffffffffffffff
>
> With KASAN
> ###### module 0xffff800002008000~0xffff800012008000
> ###### malloc 0xffff800032008000~0xffffbefffe000000
> ###### vmemmap 0xffffbf0000000000~0xffffbfffffffffff
>
> What about put it before MODULES_START?
I temporarily drop KASAN in linux-next for you. You can update a new
patch version without KASAN (still, put KFENCE after vmemmap), and
then we can improve further.

Huacai
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -82,7 +82,14 @@ extern unsigned long zero_page_mask;
>   * Avoid the first couple of pages so NULL pointer dereferences will
>   * still reliably trap.
>   */
> +#ifdef CONFIG_KFENCE
> +#define KFENCE_AREA_START      (vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZ=
E))
> +#define KFENCE_AREA_END        \
> +       (KFENCE_AREA_START + (CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 * PAGE_S=
IZE)
> +#define MODULES_VADDR  KFENCE_AREA_END
> +#else
>  #define MODULES_VADDR  (vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
> +#endif
>  #define MODULES_END    (MODULES_VADDR + SZ_256M)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> Best Regards,
> Enze
>
> >>
> >>  #ifndef CONFIG_KASAN
> >>  #define VMALLOC_END    \
> >> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
> >> index da5b6d518cdb..c0319128b221 100644
> >> --- a/arch/loongarch/mm/fault.c
> >> +++ b/arch/loongarch/mm/fault.c
> >> @@ -23,6 +23,7 @@
> >>  #include <linux/kprobes.h>
> >>  #include <linux/perf_event.h>
> >>  #include <linux/uaccess.h>
> >> +#include <linux/kfence.h>
> >>
> >>  #include <asm/branch.h>
> >>  #include <asm/mmu_context.h>
> >> @@ -30,7 +31,8 @@
> >>
> >>  int show_unhandled_signals =3D 1;
> >>
> >> -static void __kprobes no_context(struct pt_regs *regs, unsigned long =
address)
> >> +static void __kprobes no_context(struct pt_regs *regs, unsigned long =
address,
> >> +                                unsigned long write)
> >>  {
> >>         const int field =3D sizeof(unsigned long) * 2;
> >>
> >> @@ -38,6 +40,9 @@ static void __kprobes no_context(struct pt_regs *reg=
s, unsigned long address)
> >>         if (fixup_exception(regs))
> >>                 return;
> >>
> >> +       if (kfence_handle_page_fault(address, write, regs))
> >> +               return;
> >> +
> >>         /*
> >>          * Oops. The kernel tried to access some bad page. We'll have =
to
> >>          * terminate things with extreme prejudice.
> >> @@ -51,14 +56,15 @@ static void __kprobes no_context(struct pt_regs *r=
egs, unsigned long address)
> >>         die("Oops", regs);
> >>  }
> >>
> >> -static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned=
 long address)
> >> +static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned=
 long address,
> >> +                                      unsigned long write)
> >>  {
> >>         /*
> >>          * We ran out of memory, call the OOM killer, and return the u=
serspace
> >>          * (which will retry the fault, or kill us if we got oom-kille=
d).
> >>          */
> >>         if (!user_mode(regs)) {
> >> -               no_context(regs, address);
> >> +               no_context(regs, address, write);
> >>                 return;
> >>         }
> >>         pagefault_out_of_memory();
> >> @@ -69,7 +75,7 @@ static void __kprobes do_sigbus(struct pt_regs *regs=
,
> >>  {
> >>         /* Kernel mode? Handle exceptions or die */
> >>         if (!user_mode(regs)) {
> >> -               no_context(regs, address);
> >> +               no_context(regs, address, write);
> >>                 return;
> >>         }
> >>
> >> @@ -90,7 +96,7 @@ static void __kprobes do_sigsegv(struct pt_regs *reg=
s,
> >>
> >>         /* Kernel mode? Handle exceptions or die */
> >>         if (!user_mode(regs)) {
> >> -               no_context(regs, address);
> >> +               no_context(regs, address, write);
> >>                 return;
> >>         }
> >>
> >> @@ -149,7 +155,7 @@ static void __kprobes __do_page_fault(struct pt_re=
gs *regs,
> >>          */
> >>         if (address & __UA_LIMIT) {
> >>                 if (!user_mode(regs))
> >> -                       no_context(regs, address);
> >> +                       no_context(regs, address, write);
> >>                 else
> >>                         do_sigsegv(regs, write, address, si_code);
> >>                 return;
> >> @@ -211,7 +217,7 @@ static void __kprobes __do_page_fault(struct pt_re=
gs *regs,
> >>
> >>         if (fault_signal_pending(fault, regs)) {
> >>                 if (!user_mode(regs))
> >> -                       no_context(regs, address);
> >> +                       no_context(regs, address, write);
> >>                 return;
> >>         }
> >>
> >> @@ -232,7 +238,7 @@ static void __kprobes __do_page_fault(struct pt_re=
gs *regs,
> >>         if (unlikely(fault & VM_FAULT_ERROR)) {
> >>                 mmap_read_unlock(mm);
> >>                 if (fault & VM_FAULT_OOM) {
> >> -                       do_out_of_memory(regs, address);
> >> +                       do_out_of_memory(regs, address, write);
> >>                         return;
> >>                 } else if (fault & VM_FAULT_SIGSEGV) {
> >>                         do_sigsegv(regs, write, address, si_code);
> >> --
> >> 2.34.1
> >>
> >>
>
