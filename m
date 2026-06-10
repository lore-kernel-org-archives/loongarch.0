Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1866B1465B4
	for <loongarch@lists.linux.dev>; Wed, 10 Jun 2026 08:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078700; cv=none; b=D4+yhzkyCWAX1NxEZfXTwdJoqWx5bMSIYNgaKtIk4gt3kOeH40VrH3/rcGDUERXkVmafRY9tJ+nZuj3qY4syrWZH//jhac98bc+I0OmmwELWclAhoVjt6SAwbL6ZowAlKaRD7PPrXSAOx0FHaeAFw9kPzu/T3X0ggbqzmmlQ+dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078700; c=relaxed/simple;
	bh=oWBx58YpcW4XdOu8Y84Ai42YSFT8rJK4wbTSYnULfCo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=koZrHA63YCf/8fBzzMSS4MIQPV0UKJ5pS4RaTRfdoFEfpwunedsH8716tgc/Jbo8pN7zJjabQu71BfkS6p4dgvGXEocdC4VmU65kSy/jlsfnEZH1MtRs5ZXL2gfbYwTNuq9QJ7YTx9tsataWVmUOnsTfezXMFTHiORjcaiPGsIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxI_CnGilqwpcSAA--.49190S3;
	Wed, 10 Jun 2026 16:04:55 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxzsKkGilqt7ShAA--.44790S3;
	Wed, 10 Jun 2026 16:04:54 +0800 (CST)
Subject: Re: [PATCH v5 2/6] LoongArch: KVM: Check msgint feature in interrupt
 post
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260526125256.2511876-1-maobibo@loongson.cn>
 <20260526125256.2511876-3-maobibo@loongson.cn>
 <CAAhV-H7RUdVJXOdjktn6vox3crhcXV0cEB1kUgu_zUVV5qpihA@mail.gmail.com>
 <CAAhV-H5X1a96mwTBtpuyTZKWbnV+T9xAnX1CcHQ6EikHJpKJLw@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <3f0d18ae-594c-7ac2-07ce-3ce411ae0192@loongson.cn>
Date: Wed, 10 Jun 2026 16:01:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5X1a96mwTBtpuyTZKWbnV+T9xAnX1CcHQ6EikHJpKJLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxzsKkGilqt7ShAA--.44790S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF13ZrWUZF17AF47JrWfCrX_yoW5XFyDpr
	W8C3WDZFW0qr17G342g3Z0gF4j9r95Kr10gws7Ja4UJr9Iqrn8XF18ArZI9F15u3yrAa1I
	gr1Fka9xua4YyagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-
	e5UUUUU==



On 2026/6/10 下午3:37, Huacai Chen wrote:
> On Sat, Jun 6, 2026 at 5:54 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>
>> Hi, Bibo,
>>
>> On Tue, May 26, 2026 at 8:53 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>>
>>> Interrupt AVEC is valid only if VM has msgint feature, and this feature
>>> is checked in interrupt handling. Since interrupt handling is executing
>>> in VM context switch, and it is hot path, here move the feature checking
>>> in interrupt post rather than interrupt handling.
>>>
>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>> ---
>>>   arch/loongarch/kvm/interrupt.c |  5 -----
>>>   arch/loongarch/kvm/vcpu.c      | 14 +++++++++-----
>>>   2 files changed, 9 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/arch/loongarch/kvm/interrupt.c b/arch/loongarch/kvm/interrupt.c
>>> index a18c60dffbba..48dd56aa4dc5 100644
>>> --- a/arch/loongarch/kvm/interrupt.c
>>> +++ b/arch/loongarch/kvm/interrupt.c
>>> @@ -36,8 +36,6 @@ static int kvm_irq_deliver(struct kvm_vcpu *vcpu, unsigned int priority)
>>>
>>>          switch (priority) {
>>>          case INT_AVEC:
>>> -               if (!kvm_guest_has_msgint(&vcpu->arch))
>>> -                       break;
>>>                  dmsintc_inject_irq(vcpu);
>>>                  fallthrough;
>>>          case INT_TI:
>>> @@ -75,9 +73,6 @@ static int kvm_irq_clear(struct kvm_vcpu *vcpu, unsigned int priority)
>>>
>>>          switch (priority) {
>>>          case INT_AVEC:
>>> -               if (!kvm_guest_has_msgint(&vcpu->arch))
>>> -                       break;
>>> -               fallthrough;
>>>          case INT_TI:
>>>          case INT_IPI:
>>>          case INT_SWI0:
>>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
>>> index df5be9b265e8..ebd432da3ca4 100644
>>> --- a/arch/loongarch/kvm/vcpu.c
>>> +++ b/arch/loongarch/kvm/vcpu.c
>>> @@ -1493,14 +1493,18 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
>>>          if (vector >= EXCCODE_INT_NUM)
>>>                  return -EINVAL;
>>>
>>> -       if (intr > 0)
>>> +       if (!kvm_guest_has_msgint(&vcpu->arch) && (vector == INT_AVEC))
>>> +               return -EINVAL;
>>> +
>>> +       /*
>>> +        * Clear irq with INT_SWI0 (which is 0) is missing from SW side
>>> +        * INT_SWI0 is cleared by guest kernel with the similar instruction
>>> +        * clear_csr_estat(1 << INT_SWI0)
>>> +        */
>>> +       if (intr >= 0)
>>>                  kvm_queue_irq(vcpu, intr);
>>>          else if (intr < 0)
>> I think "else if (intr < 0)" can be simplified as "else".
> Any updates for this series?
Sorry, I do not notice it.
yes, it can be simplified in this way. Will refresh it in next version.

Regards
Bibo Mao
> 
> 
> Huacai
> 
>>
>>
>> Huacai
>>
>>>                  kvm_dequeue_irq(vcpu, -intr);
>>> -       else {
>>> -               kvm_err("%s: invalid interrupt ioctl %d\n", __func__, irq->irq);
>>> -               return -EINVAL;
>>> -       }
>>>
>>>          kvm_vcpu_kick(vcpu);
>>>
>>> --
>>> 2.39.3
>>>
>>>

