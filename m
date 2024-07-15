Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B410923B1
	for <loongarch@lists.linux.dev>; Mon, 15 Jul 2024 04:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721016064; cv=none; b=FGgAeT9jtojMdaCcDHQZM7JcjtRUzB2UdKZrdy+q+eFcKHIHTI4ES3j9SZMUIDDFAW1BC5zq/FPcoM9LIe0BBi7jSIpd9Tnh5VCl6PzH3PMhv84FF6uM8S++GAjF3V7YQncoNHInJkO5NKIfRyikhvJTHTCplnyIUAWfcmiXRuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721016064; c=relaxed/simple;
	bh=Y36iKDFghyfh/pTNpcEkPX0rKqj4MzQJFHwvYvmnBaQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=L0IxPf0XEN88ClXNdHJAsGgv479TJczwkttvto1eooSKC2dsKy6i6GbIB7/wnZ0Ntv240sPTxLLMdjpT8CQgA0HfeORqm+2APXl7oR2SFwl8dHrlYS8kFQN/Iv9j1R0CaI+0Kc3c7BOY5hXMWUptFrY1dnq1/LdB0shT9EIJBvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxjPD6npRmMngEAA--.12398S3;
	Mon, 15 Jul 2024 12:00:59 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxnsf3npRmAEVJAA--.34933S3;
	Mon, 15 Jul 2024 12:00:57 +0800 (CST)
Subject: Re: [PATCH 07/11] LoongArch: KVM: Add EXTIOI user mode read and write
 functions
To: Xianglai Li <lixianglai@loongson.cn>, linux-kernel@vger.kernel.org
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, Min Zhou <zhoumin@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, WANG Xuerui <kernel@xen0n.name>
References: <20240705023854.1005258-1-lixianglai@loongson.cn>
 <20240705023854.1005258-8-lixianglai@loongson.cn>
From: maobibo <maobibo@loongson.cn>
Message-ID: <51594e6c-6ab0-4476-3623-1fa2fd3db654@loongson.cn>
Date: Mon, 15 Jul 2024 12:00:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240705023854.1005258-8-lixianglai@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxnsf3npRmAEVJAA--.34933S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Wr4fJF4fJw4fArWrCFyfuFX_yoW7Ww4UpF
	WUCa4fCr48Gr17GryDta4Dury7Jrsagr12vFyaqa4fCr1q9ryrGrykKr9FvFyYk34kG3Wv
	qFn3t3WY9F4qyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU88Ma5UUUUU==



On 2024/7/5 上午10:38, Xianglai Li wrote:
> Implements the communication interface between the user mode
> program and the kernel in EXTIOI interrupt control simulation,
> which is used to obtain or send the simulation data of the
> interrupt controller in the user mode process, and is used
> in VM migration or VM saving and restoration.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
> ---
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: kvm@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: Min Zhou <zhoumin@loongson.cn>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Tianrui Zhao <zhaotianrui@loongson.cn>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Xianglai li <lixianglai@loongson.cn>
> 
>   arch/loongarch/include/uapi/asm/kvm.h |   2 +
>   arch/loongarch/kvm/intc/extioi.c      | 103 +++++++++++++++++++++++++-
>   2 files changed, 103 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/include/uapi/asm/kvm.h
> index ec39a3cd4f22..9cdcb5e2a731 100644
> --- a/arch/loongarch/include/uapi/asm/kvm.h
> +++ b/arch/loongarch/include/uapi/asm/kvm.h
> @@ -110,4 +110,6 @@ struct kvm_iocsr_entry {
>   
>   #define KVM_DEV_LOONGARCH_IPI_GRP_REGS		1
>   
> +#define KVM_DEV_LOONGARCH_EXTIOI_GRP_REGS	1
> +
>   #endif /* __UAPI_ASM_LOONGARCH_KVM_H */
> diff --git a/arch/loongarch/kvm/intc/extioi.c b/arch/loongarch/kvm/intc/extioi.c
> index dd18b7a7599a..48141823aaa3 100644
> --- a/arch/loongarch/kvm/intc/extioi.c
> +++ b/arch/loongarch/kvm/intc/extioi.c
> @@ -47,6 +47,26 @@ static void extioi_update_irq(struct loongarch_extioi *s, int irq, int level)
>   	kvm_vcpu_ioctl_interrupt(vcpu, &vcpu_irq);
>   }
>   
> +static void extioi_set_sw_coreisr(struct loongarch_extioi *s)
> +{
> +	int ipnum, cpu, irq_index, irq_mask, irq;
> +
> +	for (irq = 0; irq < EXTIOI_IRQS; irq++) {
> +		ipnum = s->ipmap.reg_u8[irq / 32];
> +		ipnum = count_trailing_zeros(ipnum);
> +		ipnum = (ipnum >= 0 && ipnum < 4) ? ipnum : 0;
> +		irq_index = irq / 32;
> +		/* length of accessing core isr is 4 bytes */
> +		irq_mask = 1 << (irq & 0x1f);
> +
> +		cpu = s->coremap.reg_u8[irq];
> +		if (!!(s->coreisr.reg_u32[cpu][irq_index] & irq_mask))
> +			set_bit(irq, s->sw_coreisr[cpu][ipnum]);
> +		else
> +			clear_bit(irq, s->sw_coreisr[cpu][ipnum]);
> +	}
> +}
> +
>   void extioi_set_irq(struct loongarch_extioi *s, int irq, int level)
>   {
>   	unsigned long *isr = (unsigned long *)s->isr.reg_u8;
> @@ -599,16 +619,95 @@ static const struct kvm_io_device_ops kvm_loongarch_extioi_ops = {
>   	.write	= kvm_loongarch_extioi_write,
>   };
>   
> +static int kvm_loongarch_extioi_regs_access(struct kvm_device *dev,
> +					struct kvm_device_attr *attr,
> +					bool is_write)
> +{
> +	int len, addr;
> +	void __user *data;
> +	void *p = NULL;
> +	struct loongarch_extioi *s;
> +	unsigned long flags;
> +
> +	s = dev->kvm->arch.extioi;
> +	addr = attr->attr;
> +	data = (void __user *)attr->addr;
> +
> +	loongarch_ext_irq_lock(s, flags);
What does it protect about 
loongarch_ext_irq_lock/loongarch_ext_irq_unlock here?
> +	switch (addr) {
> +	case EXTIOI_NODETYPE_START:
> +		p = s->nodetype.reg_u8;
> +		len = sizeof(s->nodetype);
> +		break;
> +	case EXTIOI_IPMAP_START:
> +		p = s->ipmap.reg_u8;
> +		len = sizeof(s->ipmap);
> +		break;
> +	case EXTIOI_ENABLE_START:
> +		p = s->enable.reg_u8;
> +		len = sizeof(s->enable);
> +		break;
> +	case EXTIOI_BOUNCE_START:
> +		p = s->bounce.reg_u8;
> +		len = sizeof(s->bounce);
> +		break;
> +	case EXTIOI_ISR_START:
> +		p = s->isr.reg_u8;
> +		len = sizeof(s->isr);
> +		break;
> +	case EXTIOI_COREISR_START:
> +		p = s->coreisr.reg_u8;
> +		len = sizeof(s->coreisr); > +		break;
> +	case EXTIOI_COREMAP_START:
> +		p = s->coremap.reg_u8;
> +		len = sizeof(s->coremap);
> +		break;
> +	case EXTIOI_SW_COREMAP_FLAG:
> +		p = s->sw_coremap;
> +		len = sizeof(s->sw_coremap);
> +		break;
Do we need save/restore SW_COREMAP ? It should be parsed from 
EXTIOI_COREMAP like sw_coreisr.

Regards
Bibo Mao
> +	default:
> +		loongarch_ext_irq_unlock(s, flags);
> +		kvm_err("%s: unknown extioi register, addr = %d\n", __func__, addr);
> +		return -EINVAL;
> +	}
> +
> +	loongarch_ext_irq_unlock(s, flags);
> +
> +	if (is_write) {
> +		if (copy_from_user(p, data, len))
> +			return -EFAULT;
> +	} else {
> +		if (copy_to_user(data, p, len))
> +			return -EFAULT;
> +	}
> +
> +	if ((addr == EXTIOI_COREISR_START) && is_write) {
> +		loongarch_ext_irq_lock(s, flags);
> +		extioi_set_sw_coreisr(s);
> +		loongarch_ext_irq_unlock(s, flags);
> +	}
> +
> +	return 0;
> +}
> +
>   static int kvm_loongarch_extioi_get_attr(struct kvm_device *dev,
>   				struct kvm_device_attr *attr)
>   {
> -	return 0;
> +	if (attr->group == KVM_DEV_LOONGARCH_EXTIOI_GRP_REGS)
> +		return kvm_loongarch_extioi_regs_access(dev, attr, false);
> +
> +	return -EINVAL;
>   }
>   
>   static int kvm_loongarch_extioi_set_attr(struct kvm_device *dev,
>   				struct kvm_device_attr *attr)
>   {
> -	return 0;
> +	if (attr->group == KVM_DEV_LOONGARCH_EXTIOI_GRP_REGS)
> +		return kvm_loongarch_extioi_regs_access(dev, attr, true);
> +
> +	return -EINVAL;
>   }
>   
>   static void kvm_loongarch_extioi_destroy(struct kvm_device *dev)
> 

