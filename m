Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108F629B200
	for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788139541; cv=none; b=N+XUj3EqpJLqAX0JSOW6oAWlRcCojzo50UBgu9o0ny3ek/djfOGLvELq+2mIXtihXzDqpY2xQzTMBVlNZvvCaVQBphCjlM9SNN8O6k/i+Hm+24D+NHh1QL58tSuXytTy1aevTgWQ4vkhRCDPNlAYFrt1UflkObDl+oOkSPwIsLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788139541; c=relaxed/simple;
	bh=XaqnCwdhgDmYD/S2No8eMMChvlbE82HANc0N3Le4skM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uMyOOCBGxhnTryiq0MW9gnB4gWTie5cAKgDcps+YZohoXVvwWabhrEbcD44BBXGhPxBkEk6vQee1QKZKdrCJ0NjYeeFIt1ayuwWLciNm+yWk/BzaU9NxE0j/xHPipQawE6J7JAWBuUG367f8ayjfRpEFG+H79nzN5YP5GKE692k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxTNIM2JRqY7oGAA--.18732S3;
	Mon, 31 Aug 2026 09:25:32 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxX88K2JRq8+4XAA--.50431S2;
	Mon, 31 Aug 2026 09:25:30 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Validate MSI data before routing it to
 EIOINTC
To: Zeng Chi <zeng_chi911@163.com>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org
Cc: yury.norov@gmail.com, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, zengchi@kylinos.cn, stable@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20260828093604.56622-1-zeng_chi911@163.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <4acbeb32-ea18-19c6-5231-636604ab7e86@loongson.cn>
Date: Mon, 31 Aug 2026 09:25:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260828093604.56622-1-zeng_chi911@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxX88K2JRq8+4XAA--.50431S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr1UJr1rGrWfGFW7Aw4rXrc_yoW8Zr1fpF
	W5uw4DtF1rGr17JrWkW34Ut3y5Aa1fXFsagF1a9a45Crn0yF15CF18ZFsrW3Z0k3y5Kr40
	qFnIga4Yva4UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==



On 2026/8/28 下午5:36, Zeng Chi wrote:
> From: Zeng Chi <zengchi@kylinos.cn>
> 
> pch_msi_set_irq() passes e->msi.data straight into eiointc_set_irq() as
> the irq number.  The MSI data comes from userspace, either via a
> KVM_IRQ_ROUTING_MSI entry set with KVM_SET_GSI_ROUTING (used by irqfd
> and KVM_IRQ_LINE) or directly via KVM_SIGNAL_MSI, and is never checked
> against EIOINTC_IRQS.
> 
> eiointc_set_irq() uses the value with __set_bit()/__clear_bit() on the
> 256-bit isr bitmap, eiointc_update_irq() then indexes sw_coremap[] and
> the per-cpu coreisr/sw_coreisr bitmaps with it.  A data value >= 256
> therefore reads and writes memory past the end of those arrays, i.e.
> any process holding a VM fd can corrupt kernel memory beyond the
> loongarch_eiointc allocation.
> 
> Reject MSI data that doesn't fit in the EIOINTC irq space.  The DMSINTC
> path is unaffected as it decodes the vector from the address and masks
> it.
> 
> Fixes: 1928254c5ccb ("LoongArch: KVM: Add irqfd support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260531140921.1B1181F00893@smtp.kernel.org/
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---
>   arch/loongarch/kvm/intc/pch_pic.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
> index e7b77705c516..81fb534ce8dd 100644
> --- a/arch/loongarch/kvm/intc/pch_pic.c
> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> @@ -78,6 +78,9 @@ int pch_msi_set_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e, int
>   		return dmsintc_set_irq(kvm, msg_addr, e->msi.data, level);
>   	}
>   
> +	if (e->msi.data >= EIOINTC_IRQS)
> +		return -EINVAL;
> +
>   	eiointc_set_irq(kvm->arch.eiointc, e->msi.data, level);
>   
>   	return 0;
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

