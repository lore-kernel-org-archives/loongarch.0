Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1301D7404E
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252740; cv=none; b=iXoG3KGb+67nQ/DNeiDbWF6sOWW9Ui8IvLIDPuFT5YVzS4PmsUO+ZPVRo4T/DgxQ3QnGtpIn+EilOLNeBZJ76CNJPD3G57llC4LsGsGAwzXLucHhgDYSejOvCYCalKYkYKJTGv4BzNae5Tb1QHr4r8eEKECs/yxpYXeF0y3x1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252740; c=relaxed/simple;
	bh=7QH3BsorKQIJ3a//5qucPyumwc4GWWuOSUjOOpVHDw4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=D+JENER41F4ML6xOGvCUjVqeElRUDgLclHMCSRQkrosunZ9S8LeTEgZEU59a4Taf9zXH3Q/NhW8dBqADga8Tw5t4A/r5/oD/+s48GrbgNCCPu7y6thamrbkn0C4s3DTjnDaH2l4zr4NOuEN/BbgmQ12I/42Bl8v/tY1gZuGIHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxnsPA8sBphrYdAA--.20440S3;
	Mon, 23 Mar 2026 15:58:56 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxpsC08sBpATJbAA--.8525S3;
	Mon, 23 Mar 2026 15:58:44 +0800 (CST)
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
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <696c5177-4a89-f0d0-c305-c1581e72aa3d@loongson.cn>
Date: Mon, 23 Mar 2026 15:56:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7rFtju3k=NYkAy6-O7f8U=CTNiryu2_Kr57pScjeH-yQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpsC08sBpATJbAA--.8525S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWUtr4fKFWrCFWfWrWfWFX_yoWrJrWUp3
	yDAa98J3yrGr4xWrW0q3WkJF4UKrnrWr4DZayYga4Y9r4qqw1rCr1vyryDuFyUuw4kAF1I
	gFy3Jw1avF1UJ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==



On 2026/3/23 下午3:08, Huacai Chen wrote:
> On Mon, Mar 23, 2026 at 11:16 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2026/3/22 下午9:53, Huacai Chen wrote:
>>> kvm_get_vcpu_by_cpuid() takes a cpuid parameter whose type is int, so
>>> cpuid can be negative. Let kvm_get_vcpu_by_cpuid() return NULL for this
>>> case so as to make it more robust.
>>>
>>> This fix an out-of-bounds access to kvm_arch::phyid_map::phys_map[].
>>>
>>> Cc: <stable@vger.kernel.org>
>>> Fixes: 73516e9da512adc ("LoongArch: KVM: Add vcpu mapping from physical cpuid")
>>> Reported-by: Aurelien Jarno <aurel32@debian.org>
>>> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131431
>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>> ---
>>>    arch/loongarch/kvm/vcpu.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
>>> index 8ffd50a470e6..831f381a8fd1 100644
>>> --- a/arch/loongarch/kvm/vcpu.c
>>> +++ b/arch/loongarch/kvm/vcpu.c
>>> @@ -588,6 +588,9 @@ struct kvm_vcpu *kvm_get_vcpu_by_cpuid(struct kvm *kvm, int cpuid)
>>>    {
>>>        struct kvm_phyid_map *map;
>>>
>>> +     if (cpuid < 0)
>>> +             return NULL;
>>> +
>>>        if (cpuid >= KVM_MAX_PHYID)
>>>                return NULL;
>>>
>>>
>>
>> if (cpuid < 0 || cpuid >= KVM_MAX_PHYID)?
>> however both are OK for me.
> I use a similar style as kvm_get_vcpu_by_id(). :)
> 
> But there is another warning which can't be solved by this series (and
> I doubt whether it can be solved unless revert 01a8e68396a6d51f5b).
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131431

what is the kernel config file with bug
    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131431

kvm_eiointc_regs_access() seems has problem, it need convert to void * 
before arithmetic operation. I do not know whether this patch can solve 
this bug.

diff --git a/arch/loongarch/kvm/intc/eiointc.c 
b/arch/loongarch/kvm/intc/eiointc.c
index d2acb4d09e73..71bd67b57338 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -472,34 +472,34 @@ static int kvm_eiointc_regs_access(struct 
kvm_device *dev,
         switch (addr) {
         case EIOINTC_NODETYPE_START ... EIOINTC_NODETYPE_END:
                 offset = (addr - EIOINTC_NODETYPE_START) / 4;
-               p = s->nodetype + offset * 4;
+               p = (void *)s->nodetype + offset * 4;
                 break;
         case EIOINTC_IPMAP_START ... EIOINTC_IPMAP_END:
                 offset = (addr - EIOINTC_IPMAP_START) / 4;
-               p = &s->ipmap + offset * 4;
+               p = (void *)&s->ipmap + offset * 4;
                 break;
         case EIOINTC_ENABLE_START ... EIOINTC_ENABLE_END:
                 offset = (addr - EIOINTC_ENABLE_START) / 4;
-               p = s->enable + offset * 4;
+               p = (void *)s->enable + offset * 4;
                 break;
         case EIOINTC_BOUNCE_START ... EIOINTC_BOUNCE_END:
                 offset = (addr - EIOINTC_BOUNCE_START) / 4;
-               p = s->bounce + offset * 4;
+               p = (void *)s->bounce + offset * 4;
                 break;
         case EIOINTC_ISR_START ... EIOINTC_ISR_END:
                 offset = (addr - EIOINTC_ISR_START) / 4;
-               p = s->isr + offset * 4;
+               p = (void *)s->isr + offset * 4;
                 break;
         case EIOINTC_COREISR_START ... EIOINTC_COREISR_END:
                 if (cpu >= s->num_cpu)
                         return -EINVAL;

                 offset = (addr - EIOINTC_COREISR_START) / 4;
-               p = s->coreisr[cpu] + offset * 4;
+               p = (void *)s->coreisr[cpu] + offset * 4;
                 break;
         case EIOINTC_COREMAP_START ... EIOINTC_COREMAP_END:
                 offset = (addr - EIOINTC_COREMAP_START) / 4;
-               p = s->coremap + offset * 4;
+               p = (void *)s->coremap + offset * 4;
                 break;
         default:
                 kvm_err("%s: unknown eiointc register, addr = %d\n", 
__func__, addr);


Regards
Bibo Mao
> 
> Huacai
> 
>>
>> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
>>

