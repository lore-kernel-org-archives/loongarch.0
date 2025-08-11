Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA823274FE8
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909639; cv=none; b=DWKG/AzjWh3wMBfl4vxtPypxFeXcn2deIInSRToha634uTcpBYEMTI7WuHAH5IfW5QrimuLT3EzPksmiaAcRscK0R6N9Q94pkLrCGe9zLSr+QCwkpbpl1v0MdV1kHAUjkEpPae0I/2//gxQDPII8jHeLANtNcPQK0InZ2OnmZ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909639; c=relaxed/simple;
	bh=vJQcxWyCX9l7OqDOSHtvrU2iqhP0VQlYrfz9ssM0TSI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=t85arMMmnON4vIi8CgYjeVaRobJOF0Wq4MQZJZWFqS6n7vOW3kolS1Z5ef1PhYsBOPBrMYl9tVaPb2BxcQARe1ClL6CSBewNYdu2XFEXinB/RamAzPrwT4hWXch48xneAm8fqC/9Q0MvARBlVHGx6bJsgrinqOqO3Ar7z6eTpVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bx7eLCy5loTXA+AQ--.17722S3;
	Mon, 11 Aug 2025 18:53:54 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxM+S_y5loszlDAA--.54630S3;
	Mon, 11 Aug 2025 18:53:53 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Use kvm_get_vcpu_by_id() instead of
 kvm_get_vcpu()
To: Song Gao <gaosong@loongson.cn>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, lixianglai@loongson.cn
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250811025544.458422-1-gaosong@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <c5f2a6d5-d793-94f0-8d8c-5cc5b7d142b8@loongson.cn>
Date: Mon, 11 Aug 2025 18:52:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250811025544.458422-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxM+S_y5loszlDAA--.54630S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFW5Gr18JrykCFykXr18Zwc_yoW8Ar1fpF
	y7C3ZYvF4rKryUG34Dtas8ZF4qkrZ5tryIgF9aya45CrnxXF1rGryrur98XFyjk34xAFW0
	qr1rKF4Yva1UAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1q2_U
	UUUU=



On 2025/8/11 上午10:55, Song Gao wrote:
> Use kvm_get_vcpu() may can't get vcpu context, use kvm_get_vcpu_by_id()
> instead of kvm_get_vcpu().
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   arch/loongarch/kvm/intc/eiointc.c | 5 ++++-
>   arch/loongarch/kvm/intc/ipi.c     | 2 +-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
> index a3a12af9ecbf..5180da91d2e6 100644
> --- a/arch/loongarch/kvm/intc/eiointc.c
> +++ b/arch/loongarch/kvm/intc/eiointc.c
> @@ -45,7 +45,10 @@ static void eiointc_update_irq(struct loongarch_eiointc *s, int irq, int level)
>   	}
>   
>   	cpu = s->sw_coremap[irq];
> -	vcpu = kvm_get_vcpu(s->kvm, cpu);
> +	vcpu = kvm_get_vcpu_by_id(s->kvm, cpu);
> +	if (unlikely(vcpu == NULL)) {
> +		return;
> +	}
Brace {} is unnecessary with kernel coding style :), just something like 
this:
	if (unlikely(vcpu == NULL))
		return;

The other looks good to me.

Regards
Bibo Mao
>   	if (level) {
>   		/* if not enable return false */
>   		if (!test_bit(irq, (unsigned long *)s->enable.reg_u32))
> diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
> index e658d5b37c04..0348a83a7ed7 100644
> --- a/arch/loongarch/kvm/intc/ipi.c
> +++ b/arch/loongarch/kvm/intc/ipi.c
> @@ -298,7 +298,7 @@ static int kvm_ipi_regs_access(struct kvm_device *dev,
>   	cpu = (attr->attr >> 16) & 0x3ff;
>   	addr = attr->attr & 0xff;
>   
> -	vcpu = kvm_get_vcpu(dev->kvm, cpu);
> +	vcpu = kvm_get_vcpu_by_id(dev->kvm, cpu);
>   	if (unlikely(vcpu == NULL)) {
>   		kvm_err("%s: invalid target cpu: %d\n", __func__, cpu);
>   		return -EINVAL;
> 

