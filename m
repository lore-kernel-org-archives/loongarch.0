Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887E4386C3B
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259029; cv=none; b=MWu2TQ65ohRXkIk199pr6WUJ9Z2v6uQZtWH/sIIpAqGSF6kkhv8eYmcplAEbdxbRzAsDPQfvKi/oQWYrNiELts0RrWRdeYhep2zSYawvg1NzsI5e0oHdEl/SL9lysm/GPAugj6XmL5MRk/nvdGn9gR7n6okZP13Y9erig6eOTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259029; c=relaxed/simple;
	bh=7KYvyCCikdDKG4hHpc4BcGJc8BqrgUaiJZNMZuspKIA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mFNpDJetC3MFgeDizVdBuZtrG9poIJIzNdi+vztJt6qaRu6CIMTjfAjEmssKTxnktQs61a5I9+F3/WyQlFWd1JTMGjLpzep2XZAHHW/7xu5zo7mZPZnVsZYl+jG7FhbQEaAt+k1nvkAAfF4Dw46xPvKZEuEoGPNlkFp85DDF4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxJMFQC8Fplb8dAA--.38401S3;
	Mon, 23 Mar 2026 17:43:44 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxGMFEC8FpmUJbAA--.29160S3;
	Mon, 23 Mar 2026 17:43:34 +0800 (CST)
Subject: Re: [PATCH 1/2] LoongArch: KVM: Make kvm_get_vcpu_by_cpuid() more
 robust
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
 Aurelien Jarno <aurel32@debian.org>
References: <20260322135346.3720577-1-chenhuacai@loongson.cn>
 <676198e5-78e4-ab41-e447-4a9d24655890@loongson.cn>
 <CAAhV-H7rFtju3k=NYkAy6-O7f8U=CTNiryu2_Kr57pScjeH-yQ@mail.gmail.com>
 <696c5177-4a89-f0d0-c305-c1581e72aa3d@loongson.cn>
 <CAAhV-H43BrbWseejgrmtsBRbkbsMVOX0FaHvYOXfr-R9Y2g1Fw@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <40a172b3-1b8c-3cd6-97dd-64abb7502555@loongson.cn>
Date: Mon, 23 Mar 2026 17:40:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H43BrbWseejgrmtsBRbkbsMVOX0FaHvYOXfr-R9Y2g1Fw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxGMFEC8FpmUJbAA--.29160S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWUtr4fKFWrAFyfur1UXFc_yoWrCFy8p3
	yjyayDArWrKr4IgrW0q3WkXF4aqrnrWr1kZF1Yga4Fyr1qvw1rAr1kAr1DCFyUuw1qkF40
	gF15Jw1avF1UXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jY
	SoJUUUUU=



On 2026/3/23 下午4:14, Huacai Chen wrote:
> On Mon, Mar 23, 2026 at 3:59 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2026/3/23 下午3:08, Huacai Chen wrote:
>>> On Mon, Mar 23, 2026 at 11:16 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>>
>>>>
>>>> On 2026/3/22 下午9:53, Huacai Chen wrote:
>>>>> kvm_get_vcpu_by_cpuid() takes a cpuid parameter whose type is int, so
>>>>> cpuid can be negative. Let kvm_get_vcpu_by_cpuid() return NULL for this
>>>>> case so as to make it more robust.
>>>>>
>>>>> This fix an out-of-bounds access to kvm_arch::phyid_map::phys_map[].
>>>>>
>>>>> Cc: <stable@vger.kernel.org>
>>>>> Fixes: 73516e9da512adc ("LoongArch: KVM: Add vcpu mapping from physical cpuid")
>>>>> Reported-by: Aurelien Jarno <aurel32@debian.org>
>>>>> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131431
>>>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>>>> ---
>>>>>     arch/loongarch/kvm/vcpu.c | 3 +++
>>>>>     1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
>>>>> index 8ffd50a470e6..831f381a8fd1 100644
>>>>> --- a/arch/loongarch/kvm/vcpu.c
>>>>> +++ b/arch/loongarch/kvm/vcpu.c
>>>>> @@ -588,6 +588,9 @@ struct kvm_vcpu *kvm_get_vcpu_by_cpuid(struct kvm *kvm, int cpuid)
>>>>>     {
>>>>>         struct kvm_phyid_map *map;
>>>>>
>>>>> +     if (cpuid < 0)
>>>>> +             return NULL;
>>>>> +
>>>>>         if (cpuid >= KVM_MAX_PHYID)
>>>>>                 return NULL;
>>>>>
>>>>>
>>>>
>>>> if (cpuid < 0 || cpuid >= KVM_MAX_PHYID)?
>>>> however both are OK for me.
>>> I use a similar style as kvm_get_vcpu_by_id(). :)
>>>
>>> But there is another warning which can't be solved by this series (and
>>> I doubt whether it can be solved unless revert 01a8e68396a6d51f5b).
>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131431
>>
>> what is the kernel config file with bug
>>      https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131431
> I don't know exactly, but it needs CONFIG_FORTIFY_SOURCE.
With CONFIG_FORTIFY_SOURCE enabled, this bug can be reproduced. It seems 
that it actually need be converted to void * before arithmetic operation.

Regards
Bibo Mao
> 
> Huacai
> 
>>
>> kvm_eiointc_regs_access() seems has problem, it need convert to void *
>> before arithmetic operation. I do not know whether this patch can solve
>> this bug.
>>
>> diff --git a/arch/loongarch/kvm/intc/eiointc.c
>> b/arch/loongarch/kvm/intc/eiointc.c
>> index d2acb4d09e73..71bd67b57338 100644
>> --- a/arch/loongarch/kvm/intc/eiointc.c
>> +++ b/arch/loongarch/kvm/intc/eiointc.c
>> @@ -472,34 +472,34 @@ static int kvm_eiointc_regs_access(struct
>> kvm_device *dev,
>>           switch (addr) {
>>           case EIOINTC_NODETYPE_START ... EIOINTC_NODETYPE_END:
>>                   offset = (addr - EIOINTC_NODETYPE_START) / 4;
>> -               p = s->nodetype + offset * 4;
>> +               p = (void *)s->nodetype + offset * 4;
>>                   break;
>>           case EIOINTC_IPMAP_START ... EIOINTC_IPMAP_END:
>>                   offset = (addr - EIOINTC_IPMAP_START) / 4;
>> -               p = &s->ipmap + offset * 4;
>> +               p = (void *)&s->ipmap + offset * 4;
>>                   break;
>>           case EIOINTC_ENABLE_START ... EIOINTC_ENABLE_END:
>>                   offset = (addr - EIOINTC_ENABLE_START) / 4;
>> -               p = s->enable + offset * 4;
>> +               p = (void *)s->enable + offset * 4;
>>                   break;
>>           case EIOINTC_BOUNCE_START ... EIOINTC_BOUNCE_END:
>>                   offset = (addr - EIOINTC_BOUNCE_START) / 4;
>> -               p = s->bounce + offset * 4;
>> +               p = (void *)s->bounce + offset * 4;
>>                   break;
>>           case EIOINTC_ISR_START ... EIOINTC_ISR_END:
>>                   offset = (addr - EIOINTC_ISR_START) / 4;
>> -               p = s->isr + offset * 4;
>> +               p = (void *)s->isr + offset * 4;
>>                   break;
>>           case EIOINTC_COREISR_START ... EIOINTC_COREISR_END:
>>                   if (cpu >= s->num_cpu)
>>                           return -EINVAL;
>>
>>                   offset = (addr - EIOINTC_COREISR_START) / 4;
>> -               p = s->coreisr[cpu] + offset * 4;
>> +               p = (void *)s->coreisr[cpu] + offset * 4;
>>                   break;
>>           case EIOINTC_COREMAP_START ... EIOINTC_COREMAP_END:
>>                   offset = (addr - EIOINTC_COREMAP_START) / 4;
>> -               p = s->coremap + offset * 4;
>> +               p = (void *)s->coremap + offset * 4;
>>                   break;
>>           default:
>>                   kvm_err("%s: unknown eiointc register, addr = %d\n",
>> __func__, addr);
>>
>>
>> Regards
>> Bibo Mao
>>>
>>> Huacai
>>>
>>>>
>>>> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
>>>>
>>
>>

