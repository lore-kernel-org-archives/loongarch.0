Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5A8353A65
	for <loongarch@lists.linux.dev>; Wed, 30 Sep 2026 01:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790732498; cv=none; b=iufO7ATWQNXfewHmcoqdfKZiF9XstSXhrPtqqU1LaLF9JDP7D4NnHVeSCbv61TPxVFQmIK+TCrH5TKDUXf06DpZi/B9nhaYppmTnbpEuKOWped0UuWoybgojljZXfTpn6FVFge5tHlkAtTTYyU13keEuIsmoM5a+TASBqYD/Hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790732498; c=relaxed/simple;
	bh=2gM7y0+4sK0mdtBX5GDwmAp644yuVjVUy1TdsXQY3eY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=A1ZmvapBLi6Yo3Sw3fO1Hz8o6pwNMLoHR/SZr3kh7ihqHaOI2UHvMEjh48ExD3ZW1dkVks5CLVynJCnu8A2FwY/ysrQaOpObWIkXzLvo2t5BzPa4SVQ4lCVK7wrC+sSvTI348eRomRpei7KRwyFg4b2qKWILSM7q/PO0LzsRNRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxYdHHaLxqyjARAA--.50813S3;
	Wed, 30 Sep 2026 09:41:27 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAx2c3CaLxqCs0mAA--.16544S2;
	Wed, 30 Sep 2026 09:41:25 +0800 (CST)
Subject: Re: [PATCH v2 2/4] LoongArch: KVM: Load dmsintc pointer once in
 pch_msi_set_irq
To: Tao Cui <cui.tao@linux.dev>, gaosong@loongson.cn, zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 nagachaithanya9911@gmail.com, Tao Cui <cuitao@kylinos.cn>
References: <20260929102821.36112-1-cui.tao@linux.dev>
 <20260929102821.36112-3-cui.tao@linux.dev>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <6bc45b7c-88d8-f134-426a-b556fb867b41@loongson.cn>
Date: Wed, 30 Sep 2026 09:42:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260929102821.36112-3-cui.tao@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx2c3CaLxqCs0mAA--.16544S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWry8JFy8ArWktry8AF48Xwc_yoW5CFyrpF
	W3uws09r4rXryUJws7Wa4q9ryIyrs7Wr1agFy29FyjkFn0qr1Yyry8twnrXF90ga18Gr40
	g3W3Ga4Fva1UAacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
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



On 2026/9/29 下午6:28, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> pch_msi_set_irq() reads kvm->arch.dmsintc several times: the non-NULL
> check and the address-window comparison each reload the pointer, so a
> concurrent device removal can be observed between them and the
> following dereference hits a freed object.
> 
> Load the pointer once at the top of pch_msi_set_irq() and add a NULL
> check with a local snapshot in dmsintc_set_irq().  Both loads use
> READ_ONCE() so the compiler keeps them single.  This closes the
> reload race; a narrower window where removal happens right after the
> load remains, as the injection path takes no lock against destroy.
> 
> Fixes: 03de5eecb0f0 ("LoongArch: KVM: Add DMSINTC inject msi to vCPU")
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>   arch/loongarch/kvm/intc/dmsintc.c | 6 +++++-
>   arch/loongarch/kvm/intc/pch_pic.c | 7 ++++---
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/intc/dmsintc.c b/arch/loongarch/kvm/intc/dmsintc.c
> index 41c8b597b5bd..91a163698c3c 100644
> --- a/arch/loongarch/kvm/intc/dmsintc.c
> +++ b/arch/loongarch/kvm/intc/dmsintc.c
> @@ -69,9 +69,13 @@ int dmsintc_set_irq(struct kvm *kvm, u64 addr, int data, int level)
>   {
>   	unsigned int irq, cpu;
>   	struct kvm_vcpu *vcpu;
> +	struct loongarch_dmsintc *s = READ_ONCE(kvm->arch.dmsintc);
> +
> +	if (!s)
> +		return -EINVAL;
NULL check with kvm->arch.dmsintc is already done in its caller function 
pch_msi_set_irq(). It is not necessary here.
>   
>   	irq = (addr >> AVEC_IRQ_SHIFT) & AVEC_IRQ_MASK;
> -	cpu = (addr >> AVEC_CPU_SHIFT) & kvm->arch.dmsintc->cpu_mask;
> +	cpu = (addr >> AVEC_CPU_SHIFT) & s->cpu_mask;
>   	if (cpu >= KVM_MAX_VCPUS)
>   		return -EINVAL;
>   	vcpu = kvm_get_vcpu_by_cpuid(kvm, cpu);
> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
> index 62c09b5f3937..30a8c65c7609 100644
> --- a/arch/loongarch/kvm/intc/pch_pic.c
> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> @@ -71,10 +71,11 @@ void pch_pic_set_irq(struct loongarch_pch_pic *s, int irq, int level)
>   int pch_msi_set_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e, int level)
>   {
>   	u64 msg_addr = (((u64)e->msi.address_hi) << 32) | e->msi.address_lo;
> +	struct loongarch_dmsintc *dmsintc = READ_ONCE(kvm->arch.dmsintc);
what is usage of READ_ONCE() here?

If you want to simple the usage of kvm->arch.dmsintc in multiple places, 
just *struct loongarch_dmsintc *dmsintc = kvm->arch.dmsintc* is enough. 
And it is not fixup patch, it is code cleanup.

Regards
Bibo Mao
>   
> -	if (cpu_has_msgint && kvm->arch.dmsintc &&
> -		msg_addr >= kvm->arch.dmsintc->msg_addr_base &&
> -		msg_addr < (kvm->arch.dmsintc->msg_addr_base + kvm->arch.dmsintc->msg_addr_size)) {
> +	if (cpu_has_msgint && dmsintc &&
> +		msg_addr >= dmsintc->msg_addr_base &&
> +		msg_addr < (dmsintc->msg_addr_base + dmsintc->msg_addr_size)) {
>   		return dmsintc_set_irq(kvm, msg_addr, e->msi.data, level);
>   	}
>   
> 

