Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19227F
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 03:13:50 +0000 (UTC)
X-UUID: 2421b45754f94964a3bf6832243c5e1b-20230721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:791aca66-b8cc-4267-8093-0ba519918957,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.28,REQID:791aca66-b8cc-4267-8093-0ba519918957,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:ba75de87-44fb-401c-8de7-6a5572f1f5d5,B
	ulkID:230721111347J28IJWE1,BulkQuantity:0,Recheck:0,SF:19|44|24|17|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_ULS,
	TF_CID_SPAM_SNR
X-UUID: 2421b45754f94964a3bf6832243c5e1b-20230721
X-User: lienze@kylinos.cn
Received: from ubuntu [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1140526717; Fri, 21 Jul 2023 11:13:44 +0800
From: Enze Li <lienze@kylinos.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,  loongarch@lists.linux.dev,  glider@google.com,
  elver@google.com,  akpm@linux-foundation.org,
  kasan-dev@googlegroups.com,  linux-mm@kvack.org,  zhangqing@loongson.cn,
  yangtiezhu@loongson.cn,  dvyukov@google.com
Subject: Re: [PATCH 4/4] LoongArch: Add KFENCE support
In-Reply-To: <CAAhV-H71sv+VeLfNzuiqitYcuB4rHnho=dRYQftwo1__3bLZSQ@mail.gmail.com>
	(Huacai Chen's message of "Wed, 19 Jul 2023 23:27:50 +0800")
References: <20230719082732.2189747-1-lienze@kylinos.cn>
	<20230719082732.2189747-5-lienze@kylinos.cn>
	<CAAhV-H71sv+VeLfNzuiqitYcuB4rHnho=dRYQftwo1__3bLZSQ@mail.gmail.com>
Date: Fri, 21 Jul 2023 11:13:38 +0800
Message-ID: <87lefaez31.fsf@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19 2023 at 11:27:50 PM +0800, Huacai Chen wrote:

> Hi, Enze,
>
> On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
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
>> Tested this patch by using the testcases and all passed.
>>
>> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN=
.html#virtual-address-space-and-address-translation-mode
>>
>> Signed-off-by: Enze Li <lienze@kylinos.cn>
>> ---
>>  arch/loongarch/Kconfig               |  1 +
>>  arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
>>  arch/loongarch/include/asm/pgtable.h |  6 +++
>>  arch/loongarch/mm/fault.c            | 22 ++++++----
>>  4 files changed, 83 insertions(+), 8 deletions(-)
>>  create mode 100644 arch/loongarch/include/asm/kfence.h
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 5411e3a4eb88..db27729003d3 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -93,6 +93,7 @@ config LOONGARCH
>>         select HAVE_ARCH_JUMP_LABEL
>>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>>         select HAVE_ARCH_KASAN
>> +       select HAVE_ARCH_KFENCE if 64BIT
> "if 64BIT" can be dropped here.
>

Fixed.

>>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>>         select HAVE_ARCH_SECCOMP_FILTER
>>         select HAVE_ARCH_TRACEHOOK
>> diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/includ=
e/asm/kfence.h
>> new file mode 100644
>> index 000000000000..2a85acc2bc70
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
>> +static inline char *arch_kfence_init_pool(void)
>> +{
>> +       char *__kfence_pool_orig =3D __kfence_pool;
> I prefer kfence_pool than __kfence_pool_orig here.
>

Fixed.

>> +       struct vm_struct *area;
>> +       int err;
>> +
>> +       area =3D __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
>> +                                   KFENCE_AREA_START, KFENCE_AREA_END,
>> +                                   __builtin_return_address(0));
>> +       if (!area)
>> +               return NULL;
>> +
>> +       __kfence_pool =3D (char *)area->addr;
>> +       err =3D ioremap_page_range((unsigned long)__kfence_pool,
>> +                                (unsigned long)__kfence_pool + KFENCE_P=
OOL_SIZE,
>> +                                virt_to_phys((void *)__kfence_pool_orig=
),
>> +                                PAGE_KERNEL);
>> +       if (err) {
>> +               free_vm_area(area);
>> +               return NULL;
>> +       }
>> +
>> +       return __kfence_pool;
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
>> index 0fc074b8bd48..5a9c81298fe3 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -85,7 +85,13 @@ extern unsigned long zero_page_mask;
>>  #define MODULES_VADDR  (vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
>>  #define MODULES_END    (MODULES_VADDR + SZ_256M)
>>
>> +#ifdef CONFIG_KFENCE
>> +#define KFENCE_AREA_START      MODULES_END
>> +#define KFENCE_AREA_END                (KFENCE_AREA_START + SZ_512M)
> Why you choose 512M here?
>

One day I noticed that 512M can hold 16K (default 255) KFENCE objects,
which should be more than enough and I think this should be appropriate.

As far as I see, KFENCE system does not have the upper limit of this
value(CONFIG_KFENCE_NUM_OBJECTS), which could theoretically be any
number.  There's another way, how about setting this value to be
determined by the configuration, like this,

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 +#define KFENCE_AREA_END \
 + (KFENCE_AREA_START + (CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 * PAGE_SIZE)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

>> +#define VMALLOC_START          KFENCE_AREA_END
>> +#else
>>  #define VMALLOC_START  MODULES_END
>> +#endif
> I don't like to put KFENCE_AREA between module and vmalloc range (it
> may cause some problems), can we put it after vmemmap?

I found that there is not enough space after vmemmap and that these
spaces are affected by KASAN. As follows,

Without KASAN
###### module 0xffff800002008000~0xffff800012008000
###### malloc 0xffff800032008000~0xfffffefffe000000=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
###### vmemmap 0xffffff0000000000~0xffffffffffffffff

With KASAN
###### module 0xffff800002008000~0xffff800012008000
###### malloc 0xffff800032008000~0xffffbefffe000000
###### vmemmap 0xffffbf0000000000~0xffffbfffffffffff

What about put it before MODULES_START?

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -82,7 +82,14 @@ extern unsigned long zero_page_mask;
  * Avoid the first couple of pages so NULL pointer dereferences will
  * still reliably trap.
  */
+#ifdef CONFIG_KFENCE
+#define KFENCE_AREA_START      (vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
+#define KFENCE_AREA_END        \
+       (KFENCE_AREA_START + (CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 * PAGE_SIZ=
E)
+#define MODULES_VADDR  KFENCE_AREA_END
+#else
 #define MODULES_VADDR  (vm_map_base + PCI_IOSIZE + (2 * PAGE_SIZE))
+#endif
 #define MODULES_END    (MODULES_VADDR + SZ_256M)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Best Regards,
Enze

>>
>>  #ifndef CONFIG_KASAN
>>  #define VMALLOC_END    \
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
