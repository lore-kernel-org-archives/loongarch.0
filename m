Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F00243954
	for <loongarch@lists.linux.dev>; Mon,  8 Dec 2025 04:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765166485; cv=none; b=SweVTimYXULJJ2K+lYYzsJaF70nKXKJ7D6FLlx5s7husrLD8rpJ0RrbkOBH91HJcQDTTiLUrjJIa3dNd0Mr9T9WY0Wke9SILSyLWF909ctiVdzGufGUEOMFGBCxKHGOxdnlHYKc7doiDrDrGALuVk2ay4/0reXDlQRXDoZCB234=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765166485; c=relaxed/simple;
	bh=MPaPohkwagFvTn67+fzIqSnaH4ZsJHsUxo9DwOAP6UY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UZ0pJKKzwWMK+6QXcNgVoQS50dx5YSq0iLvEW5VlHl9fb+TN5jp70RyK8ORL4EF/W/hkIExqdVgkraS+VgnhXI5x2Q3o34czPPs7TGM5O4GzvSnCUFss+lx0lJJFo75N1QNKh3EBPTdOyd/4sZAnIBylfrxe5ZKhxhHOecw+3gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bx2tGPTTZplCgsAA--.30637S3;
	Mon, 08 Dec 2025 12:01:20 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxrcGNTTZpcuZGAQ--.29986S3;
	Mon, 08 Dec 2025 12:01:19 +0800 (CST)
Subject: Re: [PATCH v3 3/4] LongArch: KVM: Add irqfd set dintc msi
To: Song Gao <gaosong@loongson.cn>, chenhuacai@kernel.org
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev, kernel@xen0n.name,
 linux-kernel@vger.kernel.org, lixianglai@loongson.cn
References: <20251206064658.714100-1-gaosong@loongson.cn>
 <20251206064658.714100-4-gaosong@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <58ebb829-1edd-1c89-3947-a19e4e3cef17@loongson.cn>
Date: Mon, 8 Dec 2025 11:58:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251206064658.714100-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxrcGNTTZpcuZGAQ--.29986S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCrW7WFWrCry7Zry8WF43CFX_yoWrCryrpF
	srAws8Cr4rJrn7XF9aqa9YvryfZwn2gr12qFy29asYkFnFqr1UJr1kWr9rZFyrKay8WF4S
	g3Z8KF45ua1UtwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5GYJUUUUU=



On 2025/12/6 下午2:46, Song Gao wrote:
> Add irqfd choice dintc to set msi irq by the msg_addr and
> implement dintc set msi irq.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   arch/loongarch/include/asm/kvm_dintc.h |  1 +
>   arch/loongarch/kvm/intc/dintc.c        |  6 ++++
>   arch/loongarch/kvm/irqfd.c             | 45 ++++++++++++++++++++++----
>   3 files changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/kvm_dintc.h b/arch/loongarch/include/asm/kvm_dintc.h
> index d980d39c0344..f87fb802a7bf 100644
> --- a/arch/loongarch/include/asm/kvm_dintc.h
> +++ b/arch/loongarch/include/asm/kvm_dintc.h
> @@ -11,6 +11,7 @@ struct loongarch_dintc  {
>   	struct kvm *kvm;
>   	uint64_t msg_addr_base;
>   	uint64_t msg_addr_size;
> +	uint32_t cpu_mask;
>   };
>   
>   struct dintc_state {
> diff --git a/arch/loongarch/kvm/intc/dintc.c b/arch/loongarch/kvm/intc/dintc.c
> index cd6cc9392adc..15e2ccd25a63 100644
> --- a/arch/loongarch/kvm/intc/dintc.c
> +++ b/arch/loongarch/kvm/intc/dintc.c
> @@ -15,6 +15,7 @@ static int kvm_dintc_ctrl_access(struct kvm_device *dev,
>   	void __user *data;
>   	struct loongarch_dintc *s = dev->kvm->arch.dintc;
>   	u64 tmp;
> +	u32 cpu_bit;
>   
>   	data = (void __user *)attr->addr;
>   	switch (addr) {
> @@ -30,6 +31,11 @@ static int kvm_dintc_ctrl_access(struct kvm_device *dev,
>   				s->msg_addr_base = tmp;
>   			else
>   				return  -EFAULT;
> +			s->msg_addr_base = tmp;
> +			cpu_bit = find_first_bit((unsigned long *)&(s->msg_addr_base), 64)
> +						- AVEC_CPU_SHIFT;
> +			cpu_bit = min(cpu_bit, AVEC_CPU_BIT);
> +			s->cpu_mask = GENMASK(cpu_bit - 1, 0) & AVEC_CPU_MASK;
>   		}
>   		break;
>   	case KVM_DEV_LOONGARCH_DINTC_MSG_ADDR_SIZE:
> diff --git a/arch/loongarch/kvm/irqfd.c b/arch/loongarch/kvm/irqfd.c
> index 9a39627aecf0..d49a6c6471df 100644
> --- a/arch/loongarch/kvm/irqfd.c
> +++ b/arch/loongarch/kvm/irqfd.c
> @@ -6,6 +6,7 @@
>   #include <linux/kvm_host.h>
>   #include <trace/events/kvm.h>
>   #include <asm/kvm_pch_pic.h>
> +#include <asm/kvm_vcpu.h>
>   
>   static int kvm_set_pic_irq(struct kvm_kernel_irq_routing_entry *e,
>   		struct kvm *kvm, int irq_source_id, int level, bool line_status)
> @@ -16,6 +17,41 @@ static int kvm_set_pic_irq(struct kvm_kernel_irq_routing_entry *e,
>   	return 0;
>   }
>   
> +static int kvm_dintc_set_msi_irq(struct kvm *kvm, u32 addr, int data, int level)
> +{
> +	unsigned int virq, dest;
> +	struct kvm_vcpu *vcpu;
> +
> +	virq = (addr >> AVEC_VIRQ_SHIFT) & AVEC_VIRQ_MASK;
> +	dest = (addr >> AVEC_CPU_SHIFT) & kvm->arch.dintc->cpu_mask;
> +	if (dest > KVM_MAX_VCPUS)
> +		return -EINVAL;
> +	vcpu = kvm_get_vcpu_by_cpuid(kvm, dest);
> +	if (!vcpu)
> +		return -EINVAL;
> +	return kvm_loongarch_deliver_msi_to_vcpu(kvm, vcpu, virq, level);
> +}
> +
> +static int loongarch_set_msi(struct kvm_kernel_irq_routing_entry *e,
> +			struct kvm *kvm, int level)
> +{
> +	u64 msg_addr;
> +
> +	if (!level)
> +		return -1;
> +
> +	msg_addr = (((u64)e->msi.address_hi) << 32) | e->msi.address_lo;
> +	if (cpu_has_msgint && kvm->arch.dintc &&
> +		msg_addr >= kvm->arch.dintc->msg_addr_base &&
> +		msg_addr < (kvm->arch.dintc->msg_addr_base  + kvm->arch.dintc->msg_addr_size)) {
> +		return kvm_dintc_set_msi_irq(kvm, msg_addr, e->msi.data, level);
> +	} else {
> +		pch_msi_set_irq(kvm, e->msi.data, level);
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * kvm_set_msi: inject the MSI corresponding to the
>    * MSI routing entry
> @@ -26,12 +62,7 @@ static int kvm_set_pic_irq(struct kvm_kernel_irq_routing_entry *e,
>   int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
>   		struct kvm *kvm, int irq_source_id, int level, bool line_status)
>   {
> -	if (!level)
> -		return -1;
> -
> -	pch_msi_set_irq(kvm, e->msi.data, level);
> -
> -	return 0;
> +	return loongarch_set_msi(e, kvm, level);
>   }
>   
>   /*
> @@ -76,7 +107,7 @@ int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
>   		pch_pic_set_irq(kvm->arch.pch_pic, e->irqchip.pin, level);
>   		return 0;
>   	case KVM_IRQ_ROUTING_MSI:
> -		pch_msi_set_irq(kvm, e->msi.data, level);
> +		loongarch_set_msi(e, kvm, level);
>   		return 0;
>   	default:
>   		return -EWOULDBLOCK;
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

