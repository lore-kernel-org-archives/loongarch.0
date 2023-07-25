Received: from out-36.mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0712F1F192
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 14:35:08 +0000 (UTC)
Message-ID: <fa3dcc1b-03b2-567c-b143-8e3a100af9f6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690295707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKHakHn9VkLzs6aBbGqhzrbFWR3GMi6GzUkvu6NHQbY=;
	b=tX0LnmXrHX46kDroiw9rAl0gnUtUTizhEhDGBmIdolWp4MIqe1c5sYj9JE3/wz3T4Hdye1
	uKKBip6WHyjV02LD82Oku0xajQhruLinLae3sZH+l2fMnGo6MwU0o6PikiSIvd/FqOWoAs
	+9l7hQBXCNbEoE4dF9SUOd0PnXw3zV0=
Date: Tue, 25 Jul 2023 22:34:50 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4 v2] LoongArch: Add KFENCE support
To: Enze Li <lienze@kylinos.cn>, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, glider@google.com, elver@google.com,
 akpm@linux-foundation.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Cc: zhangqing@loongson.cn, yangtiezhu@loongson.cn, dvyukov@google.com
References: <20230725061451.1231480-1-lienze@kylinos.cn>
 <20230725061451.1231480-5-lienze@kylinos.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jackie Liu <liu.yun@linux.dev>
In-Reply-To: <20230725061451.1231480-5-lienze@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



在 2023/7/25 14:14, Enze Li 写道:
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
> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#virtual-address-space-and-address-translation-mode
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>   arch/loongarch/Kconfig               |  1 +
>   arch/loongarch/include/asm/kfence.h  | 62 ++++++++++++++++++++++++++++
>   arch/loongarch/include/asm/pgtable.h | 14 ++++++-
>   arch/loongarch/mm/fault.c            | 22 ++++++----
>   4 files changed, 90 insertions(+), 9 deletions(-)
>   create mode 100644 arch/loongarch/include/asm/kfence.h
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 70635ea3d1e4..5b63b16be49e 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -91,6 +91,7 @@ config LOONGARCH
>   	select HAVE_ARCH_AUDITSYSCALL
>   	select HAVE_ARCH_JUMP_LABEL
>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE
> +	select HAVE_ARCH_KFENCE
>   	select HAVE_ARCH_MMAP_RND_BITS if MMU
>   	select HAVE_ARCH_SECCOMP_FILTER
>   	select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/loongarch/include/asm/kfence.h b/arch/loongarch/include/asm/kfence.h
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
> +	char *kfence_pool = __kfence_pool;
> +	struct vm_struct *area;
> +	int err;
> +
> +	area = __get_vm_area_caller(KFENCE_POOL_SIZE, VM_IOREMAP,
> +				    KFENCE_AREA_START, KFENCE_AREA_END,
> +				    __builtin_return_address(0));
> +	if (!area)
> +		return false;
> +
> +	__kfence_pool = (char *)area->addr;

I think there should be something wrong here.

> +	err = ioremap_page_range((unsigned long)__kfence_pool,
> +				 (unsigned long)__kfence_pool + KFENCE_POOL_SIZE,
> +				 virt_to_phys((void *)kfence_pool),
> +				 PAGE_KERNEL);
> +	if (err) {
> +		free_vm_area(area);

If err > 0, return area->addr here, It's not correct.

-- 
Jackie Liu

> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* Protect the given page and flush TLB. */
> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
> +{
> +	pte_t *pte = virt_to_kpte(addr);
> +
> +	if (WARN_ON(!pte) || pte_none(*pte))
> +		return false;
> +
> +	if (protect)
> +		set_pte(pte, __pte(pte_val(*pte) & ~(_PAGE_VALID | _PAGE_PRESENT)));
> +	else
> +		set_pte(pte, __pte(pte_val(*pte) | (_PAGE_VALID | _PAGE_PRESENT)));
> +
> +	/* Flush this CPU's TLB. */
> +	preempt_disable();
> +	local_flush_tlb_one(addr);
> +	preempt_enable();
> +
> +	return true;
> +}
> +
> +#endif /* _ASM_LOONGARCH_KFENCE_H */
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> index 98a0c98de9d1..2702a6ba7122 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -77,6 +77,13 @@ extern unsigned long zero_page_mask;
>   	(virt_to_page((void *)(empty_zero_page + (((unsigned long)(vaddr)) & zero_page_mask))))
>   #define __HAVE_COLOR_ZERO_PAGE
>   
> +#ifdef CONFIG_KFENCE
> +#define KFENCE_AREA_SIZE \
> +	(((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 + 2) * PAGE_SIZE)
> +#else
> +#define KFENCE_AREA_SIZE	0
> +#endif
> +
>   /*
>    * TLB refill handlers may also map the vmalloc area into xkvrange.
>    * Avoid the first couple of pages so NULL pointer dereferences will
> @@ -88,11 +95,16 @@ extern unsigned long zero_page_mask;
>   #define VMALLOC_START	MODULES_END
>   #define VMALLOC_END	\
>   	(vm_map_base +	\
> -	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, (1UL << cpu_vabits)) - PMD_SIZE - VMEMMAP_SIZE)
> +	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, (1UL << cpu_vabits)) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SIZE)
>   
>   #define vmemmap		((struct page *)((VMALLOC_END + PMD_SIZE) & PMD_MASK))
>   #define VMEMMAP_END	((unsigned long)vmemmap + VMEMMAP_SIZE - 1)
>   
> +#ifdef CONFIG_KFENCE
> +#define KFENCE_AREA_START	VMEMMAP_END
> +#define KFENCE_AREA_END		(KFENCE_AREA_START + KFENCE_AREA_SIZE)
> +#endif
> +
>   #define pte_ERROR(e) \
>   	pr_err("%s:%d: bad pte %016lx.\n", __FILE__, __LINE__, pte_val(e))
>   #ifndef __PAGETABLE_PMD_FOLDED
> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
> index da5b6d518cdb..c0319128b221 100644
> --- a/arch/loongarch/mm/fault.c
> +++ b/arch/loongarch/mm/fault.c
> @@ -23,6 +23,7 @@
>   #include <linux/kprobes.h>
>   #include <linux/perf_event.h>
>   #include <linux/uaccess.h>
> +#include <linux/kfence.h>
>   
>   #include <asm/branch.h>
>   #include <asm/mmu_context.h>
> @@ -30,7 +31,8 @@
>   
>   int show_unhandled_signals = 1;
>   
> -static void __kprobes no_context(struct pt_regs *regs, unsigned long address)
> +static void __kprobes no_context(struct pt_regs *regs, unsigned long address,
> +				 unsigned long write)
>   {
>   	const int field = sizeof(unsigned long) * 2;
>   
> @@ -38,6 +40,9 @@ static void __kprobes no_context(struct pt_regs *regs, unsigned long address)
>   	if (fixup_exception(regs))
>   		return;
>   
> +	if (kfence_handle_page_fault(address, write, regs))
> +		return;
> +
>   	/*
>   	 * Oops. The kernel tried to access some bad page. We'll have to
>   	 * terminate things with extreme prejudice.
> @@ -51,14 +56,15 @@ static void __kprobes no_context(struct pt_regs *regs, unsigned long address)
>   	die("Oops", regs);
>   }
>   
> -static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned long address)
> +static void __kprobes do_out_of_memory(struct pt_regs *regs, unsigned long address,
> +				       unsigned long write)
>   {
>   	/*
>   	 * We ran out of memory, call the OOM killer, and return the userspace
>   	 * (which will retry the fault, or kill us if we got oom-killed).
>   	 */
>   	if (!user_mode(regs)) {
> -		no_context(regs, address);
> +		no_context(regs, address, write);
>   		return;
>   	}
>   	pagefault_out_of_memory();
> @@ -69,7 +75,7 @@ static void __kprobes do_sigbus(struct pt_regs *regs,
>   {
>   	/* Kernel mode? Handle exceptions or die */
>   	if (!user_mode(regs)) {
> -		no_context(regs, address);
> +		no_context(regs, address, write);
>   		return;
>   	}
>   
> @@ -90,7 +96,7 @@ static void __kprobes do_sigsegv(struct pt_regs *regs,
>   
>   	/* Kernel mode? Handle exceptions or die */
>   	if (!user_mode(regs)) {
> -		no_context(regs, address);
> +		no_context(regs, address, write);
>   		return;
>   	}
>   
> @@ -149,7 +155,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
>   	 */
>   	if (address & __UA_LIMIT) {
>   		if (!user_mode(regs))
> -			no_context(regs, address);
> +			no_context(regs, address, write);
>   		else
>   			do_sigsegv(regs, write, address, si_code);
>   		return;
> @@ -211,7 +217,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
>   
>   	if (fault_signal_pending(fault, regs)) {
>   		if (!user_mode(regs))
> -			no_context(regs, address);
> +			no_context(regs, address, write);
>   		return;
>   	}
>   
> @@ -232,7 +238,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
>   	if (unlikely(fault & VM_FAULT_ERROR)) {
>   		mmap_read_unlock(mm);
>   		if (fault & VM_FAULT_OOM) {
> -			do_out_of_memory(regs, address);
> +			do_out_of_memory(regs, address, write);
>   			return;
>   		} else if (fault & VM_FAULT_SIGSEGV) {
>   			do_sigsegv(regs, write, address, si_code);

