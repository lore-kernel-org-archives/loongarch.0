Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED4682899
	for <loongarch@lists.linux.dev>; Tue, 25 Mar 2025 02:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742868878; cv=none; b=fuJs7tIhCaNBQ5UWW/E57Xut+U+PZkqikZskNCho3xBOdZ55FHwPHcS4speapOFBRABOy7aVKppyYsgA+enKBmp3mxSu8hpCBj/HzdwRj43Sebqo/RrQ3eIsA51DdgDD9vNrlaLmCkWU/NAtlJFnR2i5pO0t9djrYGq153E+QOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742868878; c=relaxed/simple;
	bh=jqUSCzJ3m/V47PgBm4XDMGM6+4BqyAaqVaAF0z8nO50=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ew0LEuhHxp173fA02JsxbfqPY4AECNR2Nvvt543f9//QTrZyu639AglXfghnAw4VaqEIw5PmSevl9svo2shMlgA9k4PqXDtH4VWMxhPruTqcZF94rf+SK0nIz+pE/iUoRPdRhoQMAcYPzWY/bT+fGIFqfSgMLGMpGvJfb4/G9OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxvnOBEeJn8gWlAA--.48007S3;
	Tue, 25 Mar 2025 10:14:25 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMCxbsV9EeJnzKJeAA--.19172S3;
	Tue, 25 Mar 2025 10:14:25 +0800 (CST)
Subject: Re: [RFC V2] LoongArch: KVM: Handle interrupt early before enabling
 irq
From: bibo mao <maobibo@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20250311074737.3160546-1-maobibo@loongson.cn>
Message-ID: <c220d043-2314-85bb-e99d-dc2c609aa739@loongson.cn>
Date: Tue, 25 Mar 2025 10:13:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250311074737.3160546-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbsV9EeJnzKJeAA--.19172S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxur4kGrW5Jry5ZF18ZF4kKrX_yoWrZr18pF
	W7CanYkrs5JFyxXwnrtw4v9r13WrZ3Kry3Z3s7J3ySyw4ayFy8tr4kK39IqF1rK3ykJ3WI
	qFyFkw1qk3Z8twcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJU
	UUUU=

Hi Paolo, Sean

This idea comes from x86, do you have any guidance or suggestion about it?

Also I notice that there is such irq_enable()/irq_disable() pair on x86, 
I do not know why it is so.
     local_irq_enable();
     ++vcpu->stat.exits;
     local_irq_disable();
     guest_timing_exit_irqoff();
     local_irq_enable();

Regards
Bibo Mao

On 2025/3/11 下午3:47, Bibo Mao wrote:
> If interrupt arrive when vCPU is running, vCPU will exit because of
> interrupt exception. Currently interrupt exception is handled after
> local_irq_enable() is called, and it is handled by host kernel rather
> than KVM hypervisor. It will introduce extra another interrupt
> exception and then host will handle irq.
> 
> If KVM hypervisor detect that it is interrupt exception, interrupt
> can be handle early in KVM hypervisor before local_irq_enable() is
> called.
> 
> On 3C5000 dual-way machine, there will be 10% -- 15% performance
> improvement with netperf UDP_RR option with 10G ethernet card.
>                     original     with patch    improvement
>    netperf UDP_RR     7200          8100           +12%
> 
> The total performance is low because irqchip is emulated in qemu VMM,
> however from the same testbed, there is performance improvement
> actually.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
> v1 ... v2:
>    1. Move guest_timing_exit_irqoff() after host interrupt handling like
>       other architectures.
>    2. Construct interrupt context pt_regs from guest entering context
>    3. Add cond_resched() after irq enabling
> ---
>   arch/loongarch/kernel/traps.c |  1 +
>   arch/loongarch/kvm/vcpu.c     | 36 ++++++++++++++++++++++++++++++++++-
>   2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
> index 2ec3106c0da3..eed0d8b02ee3 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -1114,6 +1114,7 @@ asmlinkage void noinstr do_vint(struct pt_regs *regs, unsigned long sp)
>   
>   	irqentry_exit(regs, state);
>   }
> +EXPORT_SYMBOL(do_vint);
>   
>   unsigned long eentry;
>   unsigned long tlbrentry;
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 9e1a9b4aa4c6..bab7a71eb965 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/kvm_host.h>
>   #include <linux/entry-kvm.h>
> +#include <asm/exception.h>
>   #include <asm/fpu.h>
>   #include <asm/lbt.h>
>   #include <asm/loongarch.h>
> @@ -304,6 +305,23 @@ static int kvm_pre_enter_guest(struct kvm_vcpu *vcpu)
>   	return ret;
>   }
>   
> +static void kvm_handle_irq(struct kvm_vcpu *vcpu)
> +{
> +	struct pt_regs regs, *old;
> +
> +	/*
> +	 * Construct pseudo pt_regs, only necessary registers is added
> +	 * Interrupt context coming from guest enter context
> +	 */
> +	old = (struct pt_regs *)(vcpu->arch.host_sp - sizeof(struct pt_regs));
> +	/* Disable preemption in irq exit function irqentry_exit() */
> +	regs.csr_prmd = 0;
> +	regs.regs[LOONGARCH_GPR_SP] = vcpu->arch.host_sp;
> +	regs.regs[LOONGARCH_GPR_FP] = old->regs[LOONGARCH_GPR_FP];
> +	regs.csr_era = old->regs[LOONGARCH_GPR_RA];
> +	do_vint(&regs, (unsigned long)&regs);
> +}
> +
>   /*
>    * Return 1 for resume guest and "<= 0" for resume host.
>    */
> @@ -321,8 +339,23 @@ static int kvm_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
>   
>   	kvm_lose_pmu(vcpu);
>   
> -	guest_timing_exit_irqoff();
>   	guest_state_exit_irqoff();
> +
> +	/*
> +	 * VM exit because of host interrupts
> +	 * Handle irq directly before enabling irq
> +	 */
> +	if (!ecode && intr)
> +		kvm_handle_irq(vcpu);
> +
> +	/*
> +	 * Wait until after servicing IRQs to account guest time so that any
> +	 * ticks that occurred while running the guest are properly accounted
> +	 * to the guest. Waiting until IRQs are enabled degrades the accuracy
> +	 * of accounting via context tracking, but the loss of accuracy is
> +	 * acceptable for all known use cases.
> +	 */
> +	guest_timing_exit_irqoff();
>   	local_irq_enable();
>   
>   	trace_kvm_exit(vcpu, ecode);
> @@ -331,6 +364,7 @@ static int kvm_handle_exit(struct kvm_run *run, struct kvm_vcpu *vcpu)
>   	} else {
>   		WARN(!intr, "vm exiting with suspicious irq\n");
>   		++vcpu->stat.int_exits;
> +		cond_resched();
>   	}
>   
>   	if (ret == RESUME_GUEST)
> 
> base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
> 

