Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EF43DD869
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798408; cv=none; b=SgFZHRjCArsbbnH19HkfhfsuutF+bOdPv73cxW4+6/qfRDZwnGOAqKsJREsASJ9hSR9+O5+2B4W5FuxY+KkLsJo7pogigpABJleU6yqNRyUoN6pFEmk2JH8EN5VYGJ03AC5N7eblFkvaIaGmLVMHhF7IhcQ3/rSwAMDbaYu6jWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798408; c=relaxed/simple;
	bh=M6eV2gDFufj+raT94/jpzFyGoczKtXbzXFq1i+7Isd4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=inKceQFV/36WMThIjBx6FlgCm1jYABRM9e+8e7nBMsb9O6vN9WDvkBiyZX7ZgDCccH3vLW9nVJs1DT0237Noeirj8Mj8A+k0ERaqhckkIb1yDiTbep3lhDq1hJc6aAZMiydwlDUoOExF+I1xbZ9a2ZbYdZRjoWM+r427YZQH110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxHuqEkRVqQWYNAA--.37485S3;
	Tue, 26 May 2026 20:26:44 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxaeCDkRVqAZSRAA--.14562S3;
	Tue, 26 May 2026 20:26:43 +0800 (CST)
Subject: Re: [PATCH 3/4] LoongArch: KVM: Implement guest-side PV TLB flush
To: Tao Cui <cuitao@kylinos.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name
References: <20260526111837.2090768-1-cuitao@kylinos.cn>
 <20260526111837.2090768-4-cuitao@kylinos.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <4d65fdfd-a3e4-a54a-7665-96eb63529484@loongson.cn>
Date: Tue, 26 May 2026 20:23:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260526111837.2090768-4-cuitao@kylinos.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxaeCDkRVqAZSRAA--.14562S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr4rXF13CF4rKFWDZryxJFc_yoW3tw4kpr
	yUAwsYgan5Wrn2y343Z3yYkr15Zw4kK3WIva13uFWFyFnrWFyUKr93GryvqF1kWa95WF4F
	gFyrCrsF9FyUJ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jO
	b18UUUUU=



On 2026/5/26 下午7:18, Tao Cui wrote:
> Add the guest-side implementation of PV TLB flush for LoongArch KVM
> guests, complementing the host-side support added in the previous commit.
> 
> When running as a KVM guest, remote TLB flushes are optimized by
> avoiding IPIs to preempted vCPUs:
> 
> - kvm_flush_tlb_mask() checks each target vCPU's steal-time
>    preempted flag. If a vCPU is preempted, it atomically sets
>    KVM_VCPU_FLUSH_TLB in the shared preempted byte via cmpxchg
>    and removes that CPU from the IPI mask.
> - Only non-preempted vCPUs receive IPIs via on_each_cpu_mask().
> - When the host schedules a deferred-flush vCPU back in, it
>    invalidates the VPID and flushes the TLB automatically.
> 
> All six SMP TLB flush functions (flush_tlb_all, flush_tlb_mm,
> flush_tlb_range, flush_tlb_kernel_range, flush_tlb_page,
> flush_tlb_one) are updated to use the PV path when the static
> key pv_tlb_flush_key is enabled.
> 
> The feature is gated by KVM_FEATURE_PV_TLB_FLUSH and requires
> KVM_FEATURE_STEAL_TIME (for the shared memory page). Per-CPU
> cpumask buffers are allocated via arch_initcall.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>   arch/loongarch/include/asm/kvm_para.h |  8 +++++
>   arch/loongarch/include/asm/paravirt.h | 21 ++++++++++++
>   arch/loongarch/kernel/paravirt.c      | 47 +++++++++++++++++++++++++++
>   arch/loongarch/kernel/smp.c           | 30 +++++++++++++----
>   4 files changed, 100 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/kvm_para.h b/arch/loongarch/include/asm/kvm_para.h
> index 28e3fa3b4c0e..7956aeff2436 100644
> --- a/arch/loongarch/include/asm/kvm_para.h
> +++ b/arch/loongarch/include/asm/kvm_para.h
> @@ -187,4 +187,12 @@ static inline bool kvm_check_and_clear_guest_paused(void)
>   	return false;
>   }
>   
> +static inline bool kvm_pv_tlb_flush_supported(void)
> +{
> +	unsigned int feat = kvm_arch_para_features();
> +
> +	return (feat & (1U << KVM_FEATURE_PV_TLB_FLUSH)) &&
> +	       (feat & (1U << KVM_FEATURE_STEAL_TIME));
> +}
> +
>   #endif /* _ASM_LOONGARCH_KVM_PARA_H */
> diff --git a/arch/loongarch/include/asm/paravirt.h b/arch/loongarch/include/asm/paravirt.h
> index acae1c5e5f88..6ce62b555a5d 100644
> --- a/arch/loongarch/include/asm/paravirt.h
> +++ b/arch/loongarch/include/asm/paravirt.h
> @@ -5,15 +5,26 @@
>   #ifdef CONFIG_PARAVIRT
>   
>   #include <linux/jump_label.h>
> +#include <linux/cpumask.h>
> +#include <linux/smp.h>
>   
>   DECLARE_STATIC_KEY_FALSE(virt_preempt_key);
>   DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
> +DECLARE_STATIC_KEY_FALSE(pv_tlb_flush_key);
>   DECLARE_PER_CPU(struct kvm_steal_time, steal_time);
>   
>   int __init pv_ipi_init(void);
>   int __init pv_time_init(void);
>   int __init pv_spinlock_init(void);
>   
> +void kvm_flush_tlb_mask(const struct cpumask *cpumask,
> +			smp_call_func_t func, void *info);
> +
> +static inline bool pv_tlb_flush_enabled(void)
> +{
> +	return static_branch_unlikely(&pv_tlb_flush_key);
> +}
> +
>   #else
>   
>   static inline int pv_ipi_init(void)
> @@ -31,5 +42,15 @@ static inline int pv_spinlock_init(void)
>   	return 0;
>   }
>   
> +static inline bool pv_tlb_flush_enabled(void)
> +{
> +	return false;
> +}
> +
> +static inline void kvm_flush_tlb_mask(const struct cpumask *cpumask,
> +				       smp_call_func_t func, void *info)
> +{
> +}
> +
>   #endif // CONFIG_PARAVIRT
>   #endif
> diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
> index 10821cce554c..934015970179 100644
> --- a/arch/loongarch/kernel/paravirt.c
> +++ b/arch/loongarch/kernel/paravirt.c
> @@ -12,7 +12,9 @@
>   static int has_steal_clock;
>   DEFINE_STATIC_KEY_FALSE(virt_preempt_key);
>   DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
> +DEFINE_STATIC_KEY_FALSE(pv_tlb_flush_key);
>   DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
> +static DEFINE_PER_CPU(cpumask_var_t, __pv_cpu_mask);
>   
>   static bool steal_acc = true;
>   
> @@ -208,6 +210,51 @@ int __init pv_ipi_init(void)
>   	return 0;
>   }
>   
> +#ifdef CONFIG_SMP
> +void kvm_flush_tlb_mask(const struct cpumask *cpumask,
> +			       smp_call_func_t func, void *info)
> +{
> +	int cpu;
> +	struct kvm_steal_time *src;
> +	struct cpumask *flushmask = this_cpu_cpumask_var_ptr(__pv_cpu_mask);
> +
> +	cpumask_copy(flushmask, cpumask);
> +
> +	for_each_cpu(cpu, flushmask) {
> +		src = &per_cpu(steal_time, cpu);
> +		if (READ_ONCE(src->preempted) & KVM_VCPU_PREEMPTED) {
> +			u8 old = READ_ONCE(src->preempted);
here maybe has potential problems, at the first time 
READ_ONCE(src->preempted) == KVM_VCPU_PREEMPTED, vCPU may clear this at 
the same time.  so  old = READ_ONCE(src->preempted), the value of old 
may be 0.

> +
> +			if (try_cmpxchg(&src->preempted, &old,
sizeof preempted is byte, cmpxchg with byte/halfword size is slow on 
some LoongArch platforms.

Regards
Bibo Mao

> +					old | KVM_VCPU_FLUSH_TLB))
> +				__cpumask_clear_cpu(cpu, flushmask);
> +		}
> +	}
> +
> +	on_each_cpu_mask(flushmask, func, info, 1);
> +}
> +
> +static int __init pv_tlb_flush_init(void)
> +{
> +	int cpu;
> +
> +	if (!kvm_pv_tlb_flush_supported())
> +		return 0;
> +
> +	for_each_possible_cpu(cpu) {
> +		if (!zalloc_cpumask_var_node(per_cpu_ptr(&__pv_cpu_mask, cpu),
> +					    GFP_KERNEL, cpu_to_node(cpu)))
> +			return -ENOMEM;
> +	}
> +
> +	static_branch_enable(&pv_tlb_flush_key);
> +	pr_info("KVM setup pv remote TLB flush\n");
> +
> +	return 0;
> +}
> +arch_initcall(pv_tlb_flush_init);
> +#endif
> +
>   static int pv_enable_steal_time(void)
>   {
>   	int cpu = smp_processor_id();
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index 64a048f1b880..174391de8926 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -727,7 +727,10 @@ static void flush_tlb_all_ipi(void *info)
>   
>   void flush_tlb_all(void)
>   {
> -	on_each_cpu(flush_tlb_all_ipi, NULL, 1);
> +	if (pv_tlb_flush_enabled())
> +		kvm_flush_tlb_mask(cpu_online_mask, flush_tlb_all_ipi, NULL);
> +	else
> +		on_each_cpu(flush_tlb_all_ipi, NULL, 1);
>   }
>   
>   static void flush_tlb_mm_ipi(void *mm)
> @@ -743,7 +746,10 @@ void flush_tlb_mm(struct mm_struct *mm)
>   	preempt_disable();
>   
>   	if ((atomic_read(&mm->mm_users) != 1) || (current->mm != mm)) {
> -		on_each_cpu_mask(mm_cpumask(mm), flush_tlb_mm_ipi, mm, 1);
> +		if (pv_tlb_flush_enabled())
> +			kvm_flush_tlb_mask(mm_cpumask(mm), flush_tlb_mm_ipi, mm);
> +		else
> +			on_each_cpu_mask(mm_cpumask(mm), flush_tlb_mm_ipi, mm, 1);
>   	} else {
>   		unsigned int cpu;
>   
> @@ -782,7 +788,10 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start, unsigned l
>   			.addr2 = end,
>   		};
>   
> -		on_each_cpu_mask(mm_cpumask(mm), flush_tlb_range_ipi, &fd, 1);
> +		if (pv_tlb_flush_enabled())
> +			kvm_flush_tlb_mask(mm_cpumask(mm), flush_tlb_range_ipi, &fd);
> +		else
> +			on_each_cpu_mask(mm_cpumask(mm), flush_tlb_range_ipi, &fd, 1);
>   	} else {
>   		unsigned int cpu;
>   
> @@ -809,7 +818,10 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>   		.addr2 = end,
>   	};
>   
> -	on_each_cpu(flush_tlb_kernel_range_ipi, &fd, 1);
> +	if (pv_tlb_flush_enabled())
> +		kvm_flush_tlb_mask(cpu_online_mask, flush_tlb_kernel_range_ipi, &fd);
> +	else
> +		on_each_cpu(flush_tlb_kernel_range_ipi, &fd, 1);
>   }
>   
>   static void flush_tlb_page_ipi(void *info)
> @@ -828,7 +840,10 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
>   			.addr1 = page,
>   		};
>   
> -		on_each_cpu_mask(mm_cpumask(vma->vm_mm), flush_tlb_page_ipi, &fd, 1);
> +		if (pv_tlb_flush_enabled())
> +			kvm_flush_tlb_mask(mm_cpumask(vma->vm_mm), flush_tlb_page_ipi, &fd);
> +		else
> +			on_each_cpu_mask(mm_cpumask(vma->vm_mm), flush_tlb_page_ipi, &fd, 1);
>   	} else {
>   		unsigned int cpu;
>   
> @@ -851,6 +866,9 @@ static void flush_tlb_one_ipi(void *info)
>   
>   void flush_tlb_one(unsigned long vaddr)
>   {
> -	on_each_cpu(flush_tlb_one_ipi, (void *)vaddr, 1);
> +	if (pv_tlb_flush_enabled())
> +		kvm_flush_tlb_mask(cpu_online_mask, flush_tlb_one_ipi, (void *)vaddr);
> +	else
> +		on_each_cpu(flush_tlb_one_ipi, (void *)vaddr, 1);
>   }
>   EXPORT_SYMBOL(flush_tlb_one);
> 

