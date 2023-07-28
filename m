Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4948E17EC
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 03:27:47 +0000 (UTC)
X-UUID: 19dc9f5dff3d431c92d5a1cc6d843c4c-20230728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:ccc37edf-59fd-4d48-9685-43112f1925cc,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.28,REQID:ccc37edf-59fd-4d48-9685-43112f1925cc,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:d1798b42-d291-4e62-b539-43d7d78362ba,B
	ulkID:230728112732139381RX,BulkQuantity:0,Recheck:0,SF:24|17|19|44|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_ULS,
	TF_CID_SPAM_SNR
X-UUID: 19dc9f5dff3d431c92d5a1cc6d843c4c-20230728
Received: from ubuntu [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1069411927; Fri, 28 Jul 2023 11:27:30 +0800
From: Enze Li <lienze@kylinos.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,  loongarch@lists.linux.dev,  glider@google.com,
  elver@google.com,  akpm@linux-foundation.org,
  kasan-dev@googlegroups.com,  linux-mm@kvack.org,  zhangqing@loongson.cn,
  yangtiezhu@loongson.cn,  dvyukov@google.com
Subject: Re: [PATCH 4/4 v2] LoongArch: Add KFENCE support
In-Reply-To: <CAAhV-H4RB4SDpdozkktq45yRbextEUctXEYy+t+6gKONytwKQA@mail.gmail.com>
	(Huacai Chen's message of "Thu, 27 Jul 2023 09:26:04 +0800")
References: <20230725061451.1231480-1-lienze@kylinos.cn>
	<20230725061451.1231480-5-lienze@kylinos.cn>
	<CAAhV-H4RB4SDpdozkktq45yRbextEUctXEYy+t+6gKONytwKQA@mail.gmail.com>
Date: Fri, 28 Jul 2023 11:27:20 +0800
Message-ID: <87wmykaf6v.fsf@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27 2023 at 09:26:04 AM +0800, Huacai Chen wrote:

> On Tue, Jul 25, 2023 at 2:15=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>>
>> The LoongArch architecture is quite different from other architectures.
>> When the allocating of KFENCE itself is done, it is mapped to the direct
>> mapping configuration window [1] by default on LoongArch.  It means that
>> it is not possible to use the page table mapped mode which required by
>> the KFENCE system and therefore it should be remapped to the appropriate
>> region.
>>
>> This patch adds architecture specific implementation details for KFENCE.
>> In particular, this implements the required interface in <asm/kfence.h>.
>>
>> Tested this patch by running the testcases and all passed.
>>
>> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN=
.html#virtual-address-space-and-address-translation-mode
>>
>> Signed-off-by: Enze Li <lienze@kylinos.cn>
>> ---
>>  arch/loongarch/Kconfig               |  1 +
>>  arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
>>  arch/loongarch/include/asm/pgtable.h | 14 ++++++-
>>  arch/loongarch/mm/fault.c            | 22 ++++++----
>>  4 files changed, 90 insertions(+), 9 deletions(-)
>>  create mode 100644 arch/loongarch/include/asm/kfence.h
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 70635ea3d1e4..5b63b16be49e 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -91,6 +91,7 @@ config LOONGARCH
>>         select HAVE_ARCH_AUDITSYSCALL
>>         select HAVE_ARCH_JUMP_LABEL
>>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>> +       select HAVE_ARCH_KFENCE
>>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>>         select HAVE_ARCH_SECCOMP_FILTER
>>         select HAVE_ARCH_TRACEHOOK
>> diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/includ=
e/asm/kfence.h
>> new file mode 100644
>> index 000000000000..fb39076fe4d7
>> --- /dev/null
>> +++ b/arch/loongarch/include/asm/kfence.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * KFENCE support for LoongArch.
>> + *
>> + * Author: Enze Li <lienze@kylinos.cn>
>> + * Copyright (C) 2022-2023 KylinSoft Corporation.
>> + */
>> +
>> +#ifndef _ASM_LOONGARCH_KFENCE_H
>> +#define _ASM_LOONGARCH_KFENCE_H
>> +
>> +#include <linux/kfence.h>
>> +#include <asm/pgtable.h>
>> +#include <asm/tlb.h>
>> +
>> +static inline bool arch_kfence_init_pool(void)
>> +{
>> +       char *kfence_pool =3D __kfence_pool;
>> +       struct vm_struct *area;
>> +       int err;
>> +
>> +       area =3D __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
>> +                                   KFENCE_AREA_START, KFENCE_AREA_END,
>> +                                   __builtin_return_address(0));
>> +       if (!area)
>> +               return false;
>> +
>> +       __kfence_pool =3D (char *)area->addr;
>> +       err =3D ioremap_page_range((unsigned long)__kfence_pool,
>> +                                (unsigned long)__kfence_pool + KFENCE_P=
OOL_SIZE,
>> +                                virt_to_phys((void *)kfence_pool),
>> +                                PAGE_KERNEL);
>> +       if (err) {
>> +               free_vm_area(area);
>> +               return false;
>> +       }
>> +
>> +       return true;
>> +}
>> +
>> +/* Protect the given page and flush TLB. */
>> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
>> +{
>> +       pte_t *pte =3D virt_to_kpte(addr);
>> +
>> +       if (WARN_ON(!pte) || pte_none(*pte))
>> +               return false;
>> +
>> +       if (protect)
>> +               set_pte(pte, __pte(pte_val(*pte) & ~(_PAGE_VALID | _PAGE=
_PRESENT)));
>> +       else
>> +               set_pte(pte, __pte(pte_val(*pte) | (_PAGE_VALID | _PAGE_=
PRESENT)));
>> +
>> +       /* Flush this CPU's TLB. */
>> +       preempt_disable();
>> +       local_flush_tlb_one(addr);
>> +       preempt_enable();
>> +
>> +       return true;
>> +}
>> +
>> +#endif /* _ASM_LOONGARCH_KFENCE_H */
>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/inclu=
de/asm/pgtable.h
>> index 98a0c98de9d1..2702a6ba7122 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -77,6 +77,13 @@ extern unsigned long zero_page_mask;
>>         (virt_to_page((void *)(empty_zero_page + (((unsigned long)(vaddr=
)) & zero_page_mask))))
>>  #define __HAVE_COLOR_ZERO_PAGE
>>
>> +#ifdef CONFIG_KFENCE
>> +#define KFENCE_AREA_SIZE \
>> +       (((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)

Hi Huacai,

> Another question: Why define KFENCE_AREA_SIZE while there is already
> KFENCE_POOL_SIZE?

The KFENCE_POOL_SIZE macro is defined in linux/kfence.h.  When I trying
to include this header file, I see the following error,

----------------------------------------------------------------------
  CC      arch/loongarch/kernel/asm-offsets.s
In file included from ./arch/loongarch/include/asm/pgtable.h:64,
                 from ./include/linux/pgtable.h:6,
                 from ./include/linux/mm.h:29,
                 from arch/loongarch/kernel/asm-offsets.c:9:
./include/linux/kfence.h:93:35: warning: =E2=80=98struct kmem_cache=E2=80=
=99 declared inside parameter list will not be visible outside of this defi=
nition or declaration
   93 | void kfence_shutdown_cache(struct kmem_cache *s);
      |                                   ^~~~~~~~~~
./include/linux/kfence.h:99:29: warning: =E2=80=98struct kmem_cache=E2=80=
=99 declared inside parameter list will not be visible outside of this defi=
nition or declaration
   99 | void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags=
);
      |                             ^~~~~~~~~~
./include/linux/kfence.h:117:50: warning: =E2=80=98struct kmem_cache=E2=80=
=99 declared inside parameter list will not be visible outside of this defi=
nition or declaration
  117 | static __always_inline void *kfence_alloc(struct kmem_cache *s, siz=
e_t size, gfp_t flags)
      |                                                  ^~~~~~~~~~
./include/linux/kfence.h: In function =E2=80=98kfence_alloc=E2=80=99:
./include/linux/kfence.h:128:31: error: passing argument 1 of =E2=80=98__kf=
ence_alloc=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-=
pointer-types]
  128 |         return __kfence_alloc(s, size, flags);
      |                               ^
      |                               |
      |                               struct kmem_cache *
--------------------------------------------------------------------

The root cause of this issue is that linux/kfence.h should be expanded
after linux/mm.h, not before.  That said, we can not put any
"high-level" header files in the "low-level" ones.

> And why is KFENCE_AREA_SIZE a little larger than
> KFENCE_POOL_SIZE? If we can reuse KFENCE_POOL_SIZE,
> KFENCE_AREA_START/KFENCE_AREA_END can be renamed to
> KFENCE_POOL_START/KFENCE_POOL_END.

+#define KFENCE_AREA_SIZE \
+       (((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
                                              ^^^^^
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Here I've added two extra pages, that's due to working with
__get_vm_area_caller() to request the space correctly.

1. arch_kfence_init_pool
     __get_vm_area_caller
       __get_vm_area_node
         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
           if (!(flags & VM_NO_GUARD))
                   size +=3D PAGE_SIZE;
         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If we do not set VM_NO_GUARD, we would get one more page as "GUARD".
Setting VM_NO_GUARD is dangerous behavior and I suggest we keep this
page.

2. arch_kfence_init_pool
     __get_vm_area_caller
       __get_vm_area_node                        !!!This is my comment--
           =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                     |
           if (flags & VM_IOREMAP)                                     |
                   align =3D 1ul << clamp_t(int, ...                     |
           *** We got "align=3D=3D0x200000" here.  Based on the default  <--
               KFENCE objects of 255, we got the maximum align here. ***
           =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

           alloc_vmap_area
             __alloc_vmap_area
               =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
               nva_start_addr =3D ALIGN(vstart, align);
               *** When running here, the starting address will be
                   moved forward one byte due to alignment
                   requirements.  If we do not give enough space, we'll
                   fail on the next line. ***
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
               if (nva_start_addr + size > vend)
                       return vend;
               =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Theoretically, this alignment requires at most 2MB of space.  However,
considering that the starting address is fixed (the starting position is
determined by VMEMMAP_END), I think that adding another page will be
enough.

Best Regards,
Enze

>> +#else
>> +#define KFENCE_AREA_SIZE       0
>> +#endif
>> +
>>  /*
>>   * TLB refill handlers may also map the vmalloc area into xkvrange.
>>   * Avoid the first couple of pages so NULL pointer dereferences will
>> @@ -88,11 +95,16 @@ extern unsigned long zero_page_mask;
>>  #define VMALLOC_START  MODULES_END
>>  #define VMALLOC_END    \
>>         (vm_map_base +  \
>> -        min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE *=
 PAGE_SIZE, (1UL << cpu_vabits)) - PMD_SIZE - VMEMMAP_SIZE)
>> +        min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE *=
 PAGE_SIZE, (1UL << cpu_vabits)) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SI=
ZE)
>>
>>  #define vmemmap                ((struct page *)((VMALLOC_END + PMD_SIZE=
) & PMD_MASK))
>>  #define VMEMMAP_END    ((unsigned long)vmemmap + VMEMMAP_SIZE - 1)
>>
>> +#ifdef CONFIG_KFENCE
>> +#define KFENCE_AREA_START      VMEMMAP_END
>> +#define KFENCE_AREA_END                (KFENCE_AREA_START + KFENCE_AREA=
_SIZE)
>> +#endif
>> +
>>  #define pte_ERROR(e) \
>>         pr_err("%s:%d: bad pte %016lx.\n", __FILE__, __LINE__, pte_val(e=
))
>>  #ifndef __PAGETABLE_PMD_FOLDED
>> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
>> index da5b6d518cdb..c0319128b221 100644
>> --- a/arch/loongarch/mm/fault.c
>> +++ b/arch/loongarch/mm/fault.c
>> @@ -23,6 +23,7 @@
>>  #include <linux/kprobes.h>
>>  #include <linux/perf_event.h>
>>  #include <linux/uaccess.h>
>> +#include <linux/kfence.h>
>>
>>  #include <asm/branch.h>
>>  #include <asm/mmu_context.h>
>> @@ -30,7 +31,8 @@
>>
>>  int show_unhandled_signals =3D 1;
>>
>> -static void __kprobes no_context(struct pt_regs *regs, unsigned long ad=
dress)
>> +static void __kprobes no_context(struct pt_regs *regs, unsigned long ad=
dress,
>> +                                unsigned long write)
>>  {
>>         const int field =3D sizeof(unsigned long) * 2;
>>
>> @@ -38,6 +40,9 @@ static void __kprobes no_context(struct pt_regs *regs,=
 unsigned long address)
>>         if (fixup_exception(regs))
>>                 return;
>>
>> +       if (kfence_handle_page_fault(address, write, regs))
>> +               return;
>> +
>>         /*
>>          * Oops. The kernel tried to access some bad page. We'll have to
>>          * terminate things with extreme prejudice.
>> @@ -51,14 +56,15 @@ static void __kprobes no_context(struct pt_regs *reg=
s, unsigned long address)
>>         die("Oops", regs);
>>  }
>>
>> -static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned l=
ong address)
>> +static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned l=
ong address,
>> +                                      unsigned long write)
>>  {
>>         /*
>>          * We ran out of memory, call the OOM killer, and return the use=
rspace
>>          * (which will retry the fault, or kill us if we got oom-killed).
>>          */
>>         if (!user_mode(regs)) {
>> -               no_context(regs, address);
>> +               no_context(regs, address, write);
>>                 return;
>>         }
>>         pagefault_out_of_memory();
>> @@ -69,7 +75,7 @@ static void __kprobes do_sigbus(struct pt_regs *regs,
>>  {
>>         /* Kernel mode? Handle exceptions or die */
>>         if (!user_mode(regs)) {
>> -               no_context(regs, address);
>> +               no_context(regs, address, write);
>>                 return;
>>         }
>>
>> @@ -90,7 +96,7 @@ static void __kprobes do_sigsegv(struct pt_regs *regs,
>>
>>         /* Kernel mode? Handle exceptions or die */
>>         if (!user_mode(regs)) {
>> -               no_context(regs, address);
>> +               no_context(regs, address, write);
>>                 return;
>>         }
>>
>> @@ -149,7 +155,7 @@ static void __kprobes __do_page_fault(struct pt_regs=
 *regs,
>>          */
>>         if (address & __UA_LIMIT) {
>>                 if (!user_mode(regs))
>> -                       no_context(regs, address);
>> +                       no_context(regs, address, write);
>>                 else
>>                         do_sigsegv(regs, write, address, si_code);
>>                 return;
>> @@ -211,7 +217,7 @@ static void __kprobes __do_page_fault(struct pt_regs=
 *regs,
>>
>>         if (fault_signal_pending(fault, regs)) {
>>                 if (!user_mode(regs))
>> -                       no_context(regs, address);
>> +                       no_context(regs, address, write);
>>                 return;
>>         }
>>
>> @@ -232,7 +238,7 @@ static void __kprobes __do_page_fault(struct pt_regs=
 *regs,
>>         if (unlikely(fault & VM_FAULT_ERROR)) {
>>                 mmap_read_unlock(mm);
>>                 if (fault & VM_FAULT_OOM) {
>> -                       do_out_of_memory(regs, address);
>> +                       do_out_of_memory(regs, address, write);
>>                         return;
>>                 } else if (fault & VM_FAULT_SIGSEGV) {
>>                         do_sigsegv(regs, write, address, si_code);
>> --
>> 2.34.1
>>
>>
