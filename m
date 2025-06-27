Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5494430
	for <loongarch@lists.linux.dev>; Fri, 27 Jun 2025 02:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750990437; cv=none; b=BLw93bQzJCj3+XmqACGVJ+C+Hewxgol9DzeoFF1KpIWHTISJypqEiUgiUacWztcunxpTycUZePufuuWEvPh2wxmI6n0JCVpx4ameoh+ipnXYkkI3d9Z4NlcW9WXX1beBUQ9oPBloBRvvlL5NZ6YibgB5Acvu5jUkyFHLcOR7AJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750990437; c=relaxed/simple;
	bh=oX1+/bEP2JkZNHL+Cgz3QMSSFl5NYS8vyK8F/jstr64=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CwELdVkT9KMGQb+GgPm5hgOIAo688Q9PBagm7pwBbKfGXiCZoodpsmbhexfSGoSI8xuLlMNB3LUFdUKyvzvPgZson0/jpCo7TDl23l02rHvPcm9pVSVNWLBR5pnVz1kdwn92b4yl1OjuC5lPGx3YJW6AQJsBeovM+Ci3Hbn6pE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxPOJd_l1oBgEeAQ--.25576S3;
	Fri, 27 Jun 2025 10:13:50 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMBx3MRZ_l1oCEksAQ--.1461S3;
	Fri, 27 Jun 2025 10:13:48 +0800 (CST)
Subject: Re: [PATCH v3 9/9] LoongArch: KVM: INTC: Add address alignment check
To: Huacai Chen <chenhuacai@kernel.org>,
 David Laight <david.laight.linux@gmail.com>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250611014651.3042734-1-maobibo@loongson.cn>
 <20250611015145.3042884-1-maobibo@loongson.cn>
 <CAAhV-H6Eru5e6+_i+4DY9qwshibY43hjbS-QC-fhLD04-4mOGw@mail.gmail.com>
 <20250621122059.6caf299a@pumpkin>
 <CAAhV-H7Wnk7j1ukDLT+KZ6+tJuxMFv5qG-YGsJsXfB=2-eC=Ow@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <5b9ed28a-8c25-520b-0663-844c7014d078@loongson.cn>
Date: Fri, 27 Jun 2025 10:12:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7Wnk7j1ukDLT+KZ6+tJuxMFv5qG-YGsJsXfB=2-eC=Ow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx3MRZ_l1oCEksAQ--.1461S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGr1fuF4DGr43Zw4UKr17Jwc_yoWrXF4rpr
	WUAFs8Ca15Xry7Jw1qqwn0g3Zrt39Ygr18Xw1Dtaya9F1vvF17try8C3yj9Fy0k3WfKF40
	qF4YqrWfuF4Yy3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ewZ7UUUUU==

That is a little different with x86/arm64 kvm.
With iocsr address space, there is access size with 1/2/4/8. With IO 
memory address space, there is generic access size with 1/2/4/8, however 
if irqchip driver of VM is deployed in user space, it will be possible 
with 16/32 bytes with SIMD instruction.

Regards
Bibo Mao

On 2025/6/21 下午9:04, Huacai Chen wrote:
> Hi, David,
> 
> On Sat, Jun 21, 2025 at 7:21 PM David Laight
> <david.laight.linux@gmail.com> wrote:
>>
>> On Thu, 19 Jun 2025 16:47:22 +0800
>> Huacai Chen <chenhuacai@kernel.org> wrote:
>>
>>> Hi, Bibo,
>>>
>>> On Wed, Jun 11, 2025 at 9:51 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>>>
>>>> IOCSR instruction supports 1/2/4/8 bytes access, the address should
>>>> be naturally aligned with its access size. Here address alignment
>>>> check is added in eiointc kernel emulation.
>>>>
>>>> At the same time len must be 1/2/4/8 bytes from iocsr exit emulation
>>>> function kvm_emu_iocsr(), remove the default case in switch case
>>>> statements.
>>> Robust code doesn't depend its callers do things right, so I suggest
>>> keeping the default case, which means we just add the alignment check
>>> here.
>>
>> kernel code generally relies on callers to DTRT - except for values
>> that come from userspace.
>>
>> Otherwise you get unreadable and slow code that continuously checks
>> for things that can't happen.
> Generally you are right - but this patch is not the case.
> 
> Adding a "default" case here doesn't make code slower or unreadable,
> and the code becomes more robust.
> 
> Huacai
> 
>>
>>          David
>>
>>>
>>> And I think this patch should also Cc stable and add a Fixes tag.
>>>
>>>
>>> Huacai
>>>
>>>>
>>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>>> ---
>>>>   arch/loongarch/kvm/intc/eiointc.c | 21 +++++++++++++--------
>>>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
>>>> index 8b0d9376eb54..4e9d12300cc4 100644
>>>> --- a/arch/loongarch/kvm/intc/eiointc.c
>>>> +++ b/arch/loongarch/kvm/intc/eiointc.c
>>>> @@ -311,6 +311,12 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
>>>>                  return -EINVAL;
>>>>          }
>>>>
>>>> +       /* len must be 1/2/4/8 from function kvm_emu_iocsr() */
>>>> +       if (addr & (len - 1)) {
>>>> +               kvm_err("%s: eiointc not aligned addr %llx len %d\n", __func__, addr, len);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>>          vcpu->stat.eiointc_read_exits++;
>>>>          spin_lock_irqsave(&eiointc->lock, flags);
>>>>          switch (len) {
>>>> @@ -323,12 +329,9 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
>>>>          case 4:
>>>>                  ret = loongarch_eiointc_readl(vcpu, eiointc, addr, val);
>>>>                  break;
>>>> -       case 8:
>>>> +       default:
>>>>                  ret = loongarch_eiointc_readq(vcpu, eiointc, addr, val);
>>>>                  break;
>>>> -       default:
>>>> -               WARN_ONCE(1, "%s: Abnormal address access: addr 0x%llx, size %d\n",
>>>> -                                               __func__, addr, len);
>>>>          }
>>>>          spin_unlock_irqrestore(&eiointc->lock, flags);
>>>>
>>>> @@ -682,6 +685,11 @@ static int kvm_eiointc_write(struct kvm_vcpu *vcpu,
>>>>                  return -EINVAL;
>>>>          }
>>>>
>>>> +       if (addr & (len - 1)) {
>>>> +               kvm_err("%s: eiointc not aligned addr %llx len %d\n", __func__, addr, len);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>>          vcpu->stat.eiointc_write_exits++;
>>>>          spin_lock_irqsave(&eiointc->lock, flags);
>>>>          switch (len) {
>>>> @@ -694,12 +702,9 @@ static int kvm_eiointc_write(struct kvm_vcpu *vcpu,
>>>>          case 4:
>>>>                  ret = loongarch_eiointc_writel(vcpu, eiointc, addr, val);
>>>>                  break;
>>>> -       case 8:
>>>> +       default:
>>>>                  ret = loongarch_eiointc_writeq(vcpu, eiointc, addr, val);
>>>>                  break;
>>>> -       default:
>>>> -               WARN_ONCE(1, "%s: Abnormal address access: addr 0x%llx, size %d\n",
>>>> -                                               __func__, addr, len);
>>>>          }
>>>>          spin_unlock_irqrestore(&eiointc->lock, flags);
>>>>
>>>> --
>>>> 2.39.3
>>>>
>>>
>>

