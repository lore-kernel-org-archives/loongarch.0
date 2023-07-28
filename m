Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C027148
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 04:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5029BC433C8
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 04:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690518838;
	bh=M1mZwzenvmKH6DDZDPPJb+mXenmdNI5aQ0msINrf9sY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OmQ6Y05jtoSW2UEZFrr5em6iuwOeFYoI2rbiMfB/XdKnGA8TUvZHv94i3Z2trcPbq
	 F1EKVz45INnARygPTbkAk/XfzR9OHN1QGgvpBNb7chlZdndRfVbTwsgBd9+HI8lqYS
	 Dn6Pb6cpzGE1T/I+HT5AAKCdz8I1E2BzRrNjc9rDwh3LDve2vynRIsDbHR5jNHtGSH
	 dCL0TamuGBoDnrohb/u7sJIntJknGOpLYER5M+Rqk++685kbgMHI2jrourFP9eP09i
	 EFBxlIOGi6xfft82CjWu+hyVy3LnwAau5wZ21agADSf1hWLm1d1mSl4fTa2VCb9X0g
	 n1pDW0ywPGnjA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52164adea19so2139844a12.1
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 21:33:58 -0700 (PDT)
X-Gm-Message-State: ABy/qLal4+kTOaSF8NxcWX86W8WNsvXSv7RBXr7uSOWXZQ4tMZ6IPL7R
	V78H1HUqpn08YW9WCLTJXnmvcviaGkizihjLqHA=
X-Google-Smtp-Source: APBJJlFL4aHaCZ8bslAH/Vn6PuRGpsNJaf8/O8MgVqFGkuBP/5N1DkoDIU+/to88AMprTtNrbLM7tQXhcWWFV98C8Ig=
X-Received: by 2002:aa7:d0c8:0:b0:522:3ea4:81a9 with SMTP id
 u8-20020aa7d0c8000000b005223ea481a9mr869403edo.34.1690518836394; Thu, 27 Jul
 2023 21:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230725061451.1231480-1-lienze@kylinos.cn> <20230725061451.1231480-5-lienze@kylinos.cn>
 <CAAhV-H4RB4SDpdozkktq45yRbextEUctXEYy+t+6gKONytwKQA@mail.gmail.com> <87wmykaf6v.fsf@kylinos.cn>
In-Reply-To: <87wmykaf6v.fsf@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Jul 2023 12:33:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Hu-NT54G8_JuU1+Qi6OsnjTr14Ohc3-qHf7-mcNK6aw@mail.gmail.com>
Message-ID: <CAAhV-H4Hu-NT54G8_JuU1+Qi6OsnjTr14Ohc3-qHf7-mcNK6aw@mail.gmail.com>
Subject: Re: [PATCH 4/4 v2] LoongArch: Add KFENCE support
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 11:28=E2=80=AFAM Enze Li <lienze@kylinos.cn> wrote:
>
> On Thu, Jul 27 2023 at 09:26:04 AM +0800, Huacai Chen wrote:
>
> > On Tue, Jul 25, 2023 at 2:15=E2=80=AFPM Enze Li <lienze@kylinos.cn> wro=
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
> >> Tested this patch by running the testcases and all passed.
> >>
> >> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-=
EN.html#virtual-address-space-and-address-translation-mode
> >>
> >> Signed-off-by: Enze Li <lienze@kylinos.cn>
> >> ---
> >>  arch/loongarch/Kconfig               |  1 +
> >>  arch/loongarch/include/asm/kfence.h  | 62 +++++++++++++++++++++++++++=
+
> >>  arch/loongarch/include/asm/pgtable.h | 14 ++++++-
> >>  arch/loongarch/mm/fault.c            | 22 ++++++----
> >>  4 files changed, 90 insertions(+), 9 deletions(-)
> >>  create mode 100644 arch/loongarch/include/asm/kfence.h
> >>
> >> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >> index 70635ea3d1e4..5b63b16be49e 100644
> >> --- a/arch/loongarch/Kconfig
> >> +++ b/arch/loongarch/Kconfig
> >> @@ -91,6 +91,7 @@ config LOONGARCH
> >>         select HAVE_ARCH_AUDITSYSCALL
> >>         select HAVE_ARCH_JUMP_LABEL
> >>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >> +       select HAVE_ARCH_KFENCE
> >>         select HAVE_ARCH_MMAP_RND_BITS if MMU
> >>         select HAVE_ARCH_SECCOMP_FILTER
> >>         select HAVE_ARCH_TRACEHOOK
> >> diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/incl=
ude/asm/kfence.h
> >> new file mode 100644
> >> index 000000000000..fb39076fe4d7
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
> >> +static inline bool arch_kfence_init_pool(void)
> >> +{
> >> +       char *kfence_pool =3D __kfence_pool;
> >> +       struct vm_struct *area;
> >> +       int err;
> >> +
> >> +       area =3D __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
> >> +                                   KFENCE_AREA_START, KFENCE_AREA_END=
,
> >> +                                   __builtin_return_address(0));
> >> +       if (!area)
> >> +               return false;
> >> +
> >> +       __kfence_pool =3D (char *)area->addr;
> >> +       err =3D ioremap_page_range((unsigned long)__kfence_pool,
> >> +                                (unsigned long)__kfence_pool + KFENCE=
_POOL_SIZE,
> >> +                                virt_to_phys((void *)kfence_pool),
> >> +                                PAGE_KERNEL);
> >> +       if (err) {
> >> +               free_vm_area(area);
> >> +               return false;
> >> +       }
> >> +
> >> +       return true;
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
> >> index 98a0c98de9d1..2702a6ba7122 100644
> >> --- a/arch/loongarch/include/asm/pgtable.h
> >> +++ b/arch/loongarch/include/asm/pgtable.h
> >> @@ -77,6 +77,13 @@ extern unsigned long zero_page_mask;
> >>         (virt_to_page((void *)(empty_zero_page + (((unsigned long)(vad=
dr)) & zero_page_mask))))
> >>  #define __HAVE_COLOR_ZERO_PAGE
> >>
> >> +#ifdef CONFIG_KFENCE
> >> +#define KFENCE_AREA_SIZE \
> >> +       (((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
>
> Hi Huacai,
>
> > Another question: Why define KFENCE_AREA_SIZE while there is already
> > KFENCE_POOL_SIZE?
>
> The KFENCE_POOL_SIZE macro is defined in linux/kfence.h.  When I trying
> to include this header file, I see the following error,
>
> ----------------------------------------------------------------------
>   CC      arch/loongarch/kernel/asm-offsets.s
> In file included from ./arch/loongarch/include/asm/pgtable.h:64,
>                  from ./include/linux/pgtable.h:6,
>                  from ./include/linux/mm.h:29,
>                  from arch/loongarch/kernel/asm-offsets.c:9:
> ./include/linux/kfence.h:93:35: warning: =E2=80=98struct kmem_cache=E2=80=
=99 declared inside parameter list will not be visible outside of this defi=
nition or declaration
>    93 | void kfence_shutdown_cache(struct kmem_cache *s);
>       |                                   ^~~~~~~~~~
> ./include/linux/kfence.h:99:29: warning: =E2=80=98struct kmem_cache=E2=80=
=99 declared inside parameter list will not be visible outside of this defi=
nition or declaration
>    99 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t fla=
gs);
>       |                             ^~~~~~~~~~
> ./include/linux/kfence.h:117:50: warning: =E2=80=98struct kmem_cache=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
>   117 | static __always_inline void *kfence_alloc(struct kmem_cache *s, s=
ize_t size, gfp_t flags)
>       |                                                  ^~~~~~~~~~
> ./include/linux/kfence.h: In function =E2=80=98kfence_alloc=E2=80=99:
> ./include/linux/kfence.h:128:31: error: passing argument 1 of =E2=80=98__=
kfence_alloc=E2=80=99 from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
>   128 |         return __kfence_alloc(s, size, flags);
>       |                               ^
>       |                               |
>       |                               struct kmem_cache *
> --------------------------------------------------------------------
>
> The root cause of this issue is that linux/kfence.h should be expanded
> after linux/mm.h, not before.  That said, we can not put any
> "high-level" header files in the "low-level" ones.
>
> > And why is KFENCE_AREA_SIZE a little larger than
> > KFENCE_POOL_SIZE? If we can reuse KFENCE_POOL_SIZE,
> > KFENCE_AREA_START/KFENCE_AREA_END can be renamed to
> > KFENCE_POOL_START/KFENCE_POOL_END.
>
> +#define KFENCE_AREA_SIZE \
> +       (((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
>                                               ^^^^^
>
> Here I've added two extra pages, that's due to working with
> __get_vm_area_caller() to request the space correctly.
>
> 1. arch_kfence_init_pool
>      __get_vm_area_caller
>        __get_vm_area_node
>          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            if (!(flags & VM_NO_GUARD))
>                    size +=3D PAGE_SIZE;
>          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> If we do not set VM_NO_GUARD, we would get one more page as "GUARD".
> Setting VM_NO_GUARD is dangerous behavior and I suggest we keep this
> page.
>
> 2. arch_kfence_init_pool
>      __get_vm_area_caller
>        __get_vm_area_node                        !!!This is my comment--
>            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                  =
   |
>            if (flags & VM_IOREMAP)                                     |
>                    align =3D 1ul << clamp_t(int, ...                     =
|
>            *** We got "align=3D=3D0x200000" here.  Based on the default  =
<--
>                KFENCE objects of 255, we got the maximum align here. ***
>            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>            alloc_vmap_area
>              __alloc_vmap_area
>                =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>                nva_start_addr =3D ALIGN(vstart, align);
>                *** When running here, the starting address will be
>                    moved forward one byte due to alignment
>                    requirements.  If we do not give enough space, we'll
>                    fail on the next line. ***
>
>                if (nva_start_addr + size > vend)
>                        return vend;
>                =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Theoretically, this alignment requires at most 2MB of space.  However,
> considering that the starting address is fixed (the starting position is
> determined by VMEMMAP_END), I think that adding another page will be
> enough.
OK, that makes sense.

Huacai
>
> Best Regards,
> Enze
>
> >> +#else
> >> +#define KFENCE_AREA_SIZE       0
> >> +#endif
> >> +
> >>  /*
> >>   * TLB refill handlers may also map the vmalloc area into xkvrange.
> >>   * Avoid the first couple of pages so NULL pointer dereferences will
> >> @@ -88,11 +95,16 @@ extern unsigned long zero_page_mask;
> >>  #define VMALLOC_START  MODULES_END
> >>  #define VMALLOC_END    \
> >>         (vm_map_base +  \
> >> -        min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE=
 * PAGE_SIZE, (1UL << cpu_vabits)) - PMD_SIZE - VMEMMAP_SIZE)
> >> +        min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE=
 * PAGE_SIZE, (1UL << cpu_vabits)) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_=
SIZE)
> >>
> >>  #define vmemmap                ((struct page *)((VMALLOC_END + PMD_SI=
ZE) & PMD_MASK))
> >>  #define VMEMMAP_END    ((unsigned long)vmemmap + VMEMMAP_SIZE - 1)
> >>
> >> +#ifdef CONFIG_KFENCE
> >> +#define KFENCE_AREA_START      VMEMMAP_END
> >> +#define KFENCE_AREA_END                (KFENCE_AREA_START + KFENCE_AR=
EA_SIZE)
> >> +#endif
> >> +
> >>  #define pte_ERROR(e) \
> >>         pr_err("%s:%d: bad pte %016lx.\n", __FILE__, __LINE__, pte_val=
(e))
> >>  #ifndef __PAGETABLE_PMD_FOLDED
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
