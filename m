Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25E739D6F3
	for <loongarch@lists.linux.dev>; Wed,  8 Apr 2026 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636031; cv=none; b=ttGq+elZXl9u0aEq+7kI0DiXvdsjX1V0jlStp3JvQoREMmRoqN1chvyg8AkqfH6/3aZSIDc0M4yVNDTJ48AvlULWdT13ruhLLlJ50XxA7I4O4bS7BeYeWEsPHfklpEZpfjotz6Sj7Fv/7b++rApLzVLWO+wyRG7VlOC/Bg6fMm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636031; c=relaxed/simple;
	bh=Lnqr7sAzLl9Ie7mV04dY7VkFNIFbJ7Lcq82XNDP+5F0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=A4x1wQtRaLnO8TyOdJ4N6Z2wrwFXkpdvexY/iM8rRNo4qoZFRSyDIa1CLFovbo/dhTnNOxmTFjhzUikOQelZbbHqRQWxkJ6J021IrlrqiVrccHiI7Fp/zEuhf7YbN/6y05CEZcem7NhxrsXY1CTXEobhDk4HEXDwHpEewo/wls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Axy8I6DtZpJBEjAA--.32001S3;
	Wed, 08 Apr 2026 16:13:46 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxHOE5DtZp0k1oAA--.2100S3;
	Wed, 08 Apr 2026 16:13:46 +0800 (CST)
Subject: Re: [PATCH] Loongarch:Make pte/pmd_modify can set _PAGE_MODIFIED
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, akpm@linux-foundation.org, willy@infradead.org,
 david@redhat.com, linmag7@gmail.com, thuth@redhat.com, apopple@nvidia.com
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Liupu Wang <wangliupu@loongson.cn>
References: <20251104073006.1764241-1-zhangtianyang@loongson.cn>
 <48f8f2d8-e6e0-ec2a-7323-11551c66dac2@loongson.cn>
 <721fdf6e-61c4-2e31-c584-04d8380f2952@loongson.cn>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <db75dcb9-25ab-ddea-f00f-c4322c867a63@loongson.cn>
Date: Wed, 8 Apr 2026 16:10:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <721fdf6e-61c4-2e31-c584-04d8380f2952@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxHOE5DtZp0k1oAA--.2100S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJF4UXr1DKF1DJrWkCw1ruFX_yoWrGF18pF
	ykAFyUZFW5Jr1kJa4UtF17JryUAw47J3WDJr1DJF1UJr9rtr1jqr1UXr909r15Jr48Jr18
	Jr1UJrsxZF47JrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU



On 2025/11/6 下午5:53, Tianyang Zhang wrote:
> 
> 在 2025/11/6 下午3:07, Bibo Mao 写道:
>>
>>
>> On 2025/11/4 下午3:30, Tianyang Zhang wrote:
>>> In the current pte_modify operation, _PAGE_DIRTY might be cleared. Since
>>> the hardware-page-walk does not have a predefined _PAGE_MODIFIED flag,
>>> this could lead to loss of valid data in certain scenarios.
>>>
>>> The new modification involves checking whether the original PTE has the
>>> _PAGE_DIRTY flag. If it exists, the _PAGE_MODIFIED bit is set, ensuring
>>> that the pte_dirty interface can return accurate information.
>>>
>>> Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
>>> Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
>>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>>> ---
>>>   arch/loongarch/include/asm/pgtable.h | 17 +++++++++++++----
>>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/loongarch/include/asm/pgtable.h 
>>> b/arch/loongarch/include/asm/pgtable.h
>>> index bd128696e96d..106abfa5183b 100644
>>> --- a/arch/loongarch/include/asm/pgtable.h
>>> +++ b/arch/loongarch/include/asm/pgtable.h
>>> @@ -424,8 +424,13 @@ static inline unsigned long 
>>> pte_accessible(struct mm_struct *mm, pte_t a)
>>>     static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>>>   {
>>> -    return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
>>> -             (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
>>> +    unsigned long val = (pte_val(pte) & _PAGE_CHG_MASK) |
>>> +             (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
>>> +
>>> +    if (pte_val(pte) & _PAGE_DIRTY)
>>> +        val |= _PAGE_MODIFIED;
>> Since ptep_get_and_clear() is not atomic operation on LoongArch like 
>> other architectures, considering this scenery with HW PTW enabled:
>>     CPU 0:                         CPU1
>>                              old_pte = ptep_modify_prot_start();
>>                                   old_pte = ptep_get(ptep);
>>
>>     write(buf);
>> *HW will set _PAGE_DIRTY bit*
>>                                   pte_clear(mm, address, ptep);
>> ^^^^^^^^^^ For CPU1, bit _PAGE_DIRTY is no set in old_pte, _PAGE_DIRTY 
>> will be lost also. ^^^^^^^^^^^
>>                              pte = pte_modify(old_pte,)
>>                              ptep_modify_prot_commit(.., pte)
> 
> There does appear to be an issue here. It seems we should use 
> `__HAVE_ARCH_PTEP_GET_AND_CLEAR` and implement ptep_get_and_clear via 
> `atomic_xchg`.
> 
> However, I believe this change should be submitted in a new patch.
What is the status about API ptep_get_and_clear() on LoongArch?

Regards
Bibo Mao

> 
> Thanks
> 
> Tianyang
> 
>>
>> Regards
>> Bibo Mao
>>> +
>>> +    return __pte(val);
>>>   }
>>>     extern void __update_tlb(struct vm_area_struct *vma,
>>> @@ -547,9 +552,13 @@ static inline struct page *pmd_page(pmd_t pmd)
>>>     static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>>>   {
>>> -    pmd_val(pmd) = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>>> +    unsigned long val = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>>>                   (pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
>>> -    return pmd;
>>> +
>>> +    if (pmd_val(pmd) & _PAGE_DIRTY)
>>> +        val |= _PAGE_MODIFIED;
>>> +
>>> +    return __pmd(val);
>>>   }
>>>     static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>>>

