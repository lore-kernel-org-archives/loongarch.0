Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C701E5201
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 01:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762305669; cv=none; b=iLKNdLpDyd0mLDSETmBlOeaNZOr6Ot5Rkt4xlaXEOfsG3emLcqPoV7Iba34zv9msbSAzx2wyjw8HQVR3Ofxne63FUNlhvY9x5Cg9LusQDy72bh5mVXx48CR72PV4acV5eFnFW0KMagypkdJN3LWKtelkT3iU0rQO2yaHWqBGi/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762305669; c=relaxed/simple;
	bh=IpZ+Jlrcxxb2tRknPrC0aFeh/RzV5PaBJ4UMS1eWzKo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PmFJ/FD8eS4zuENOn13LMGKqRSFJeyCNNijPIQlW+mlZFNpo7qsaNkP27ENSnAbWPkGmnsP1jZ/njZw6CB+BYlG7vevKmkHCzG9eZRHlbRLFaqW+0uPA+FWMAOmcKIdWfKcuC1TAUEHdtxNsq1SwkY50wP2ECHd1cFhrruyMa8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Cx6tF_pgpp+PoeAA--.2188S3;
	Wed, 05 Nov 2025 09:21:03 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxM+R8pgppBmsnAQ--.54369S3;
	Wed, 05 Nov 2025 09:21:02 +0800 (CST)
Subject: Re: [PATCH] Loongarch:Make pte/pmd_modify can set _PAGE_MODIFIED
To: Huacai Chen <chenhuacai@kernel.org>,
 Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, akpm@linux-foundation.org, willy@infradead.org,
 david@redhat.com, linmag7@gmail.com, thuth@redhat.com, apopple@nvidia.com,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Liupu Wang <wangliupu@loongson.cn>
References: <20251104073006.1764241-1-zhangtianyang@loongson.cn>
 <CAAhV-H5JnmJqTZ1GnhcgODtjL5FLy8x5HNRJxs6us=gzcFon5Q@mail.gmail.com>
 <95e6f0a6-fd6c-a85f-5983-5a37eaf960a2@loongson.cn>
 <CAAhV-H4WrphWQqW7HoeD7xSvRuHV1KBt7jgESQU7N-y1HrSVVw@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <b839a6a6-3791-ba73-baff-e860aa879bbc@loongson.cn>
Date: Wed, 5 Nov 2025 09:18:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4WrphWQqW7HoeD7xSvRuHV1KBt7jgESQU7N-y1HrSVVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxM+R8pgppBmsnAQ--.54369S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxKw4rur15trWkAF43Wr1UCFX_yoW7uF4UpF
	Z7CF1j9a15tF1xZaySqF17uF9IywsrJFn7Wwn8G3WkG34qq3y7XF1xCrW5uF1rZFW8uw10
	v3y8Kw43WF43JwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU7_MaUUUUU



On 2025/11/5 上午9:07, Huacai Chen wrote:
> On Wed, Nov 5, 2025 at 8:57 AM Tianyang Zhang <zhangtianyang@loongson.cn> wrote:
>>
>> Hi, Huacai
>>
>> 在 2025/11/4 下午4:00, Huacai Chen 写道:
>>> Hi, Tianyang,
>>>
>>> The subject line can be:
>>> LoongArch: Let {pte,pmd}_modify() record the status of _PAGE_DIRTY (If
>>> I'm right in the later comments).
>> Ok. I got it
>>>
>>> On Tue, Nov 4, 2025 at 3:30 PM Tianyang Zhang <zhangtianyang@loongson.cn> wrote:
>>>> In the current pte_modify operation, _PAGE_DIRTY might be cleared. Since
>>>> the hardware-page-walk does not have a predefined _PAGE_MODIFIED flag,
>>>> this could lead to loss of valid data in certain scenarios.
>>>>
>>>> The new modification involves checking whether the original PTE has the
>>>> _PAGE_DIRTY flag. If it exists, the _PAGE_MODIFIED bit is set, ensuring
>>>> that the pte_dirty interface can return accurate information.
>>> The description may be wrong here. Because pte_dirty() returns
>>> pte_val(pte) & (_PAGE_DIRTY | _PAGE_MODIFIED).
>>> If _PAGE_DIRTY isn't lost, pte_dirty() is always right, no matter
>>> whether there is or isn't _PAGE_MODIFIED.
>>>
>>> I think the real reason is we need to set _PAGE_MODIFIED in
>>> pte/pmd_modify to record the status of _PAGE_DIRTY, so that we can
>>> recover _PAGE_DIRTY afterwards, such as in pte/pmd_mkwrite().
>> Ok, I will adjust the description
> After some thinking, your original description may be right. Without
> this patch the scenario maybe like this:
> The pte is dirty _PAGE_DIRTY but without _PAGE_MODIFIED, after
> pte_modify() we lose _PAGE_DIRTY, then pte_dirty() returns false. So
> we need _PAGE_MODIFIED to record _PAGE_DIRTY here.
In theory pte_modify() is to modify RWX attribute. I think that it is a 
tricky to remove _PAGE_DIRTY and add _PAGE_MODIFIED with HW PTW system.

Also _PAGE_ACCESSED is lost with pte_modify() API, is there any 
influence with HW PTW system, or wait until possible problems coming out.

Regards
Bibo Mao
> 
> But the description also needs to be updated.
> 
>>>
>>>> Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
>>>> Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
>>>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>>>> ---
>>>>    arch/loongarch/include/asm/pgtable.h | 17 +++++++++++++----
>>>>    1 file changed, 13 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
>>>> index bd128696e96d..106abfa5183b 100644
>>>> --- a/arch/loongarch/include/asm/pgtable.h
>>>> +++ b/arch/loongarch/include/asm/pgtable.h
>>>> @@ -424,8 +424,13 @@ static inline unsigned long pte_accessible(struct mm_struct *mm, pte_t a)
>>>>
>>>>    static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>>>>    {
>>>> -       return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
>>>> -                    (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
>>>> +       unsigned long val = (pte_val(pte) & _PAGE_CHG_MASK) |
>>>> +                    (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
>>>> +
>>>> +       if (pte_val(pte) & _PAGE_DIRTY)
>>>> +               val |= _PAGE_MODIFIED;
>>>> +
>>>> +       return __pte(val);
>>>>    }
>>>>
>>>>    extern void __update_tlb(struct vm_area_struct *vma,
>>>> @@ -547,9 +552,13 @@ static inline struct page *pmd_page(pmd_t pmd)
>>>>
>>>>    static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>>>>    {
>>>> -       pmd_val(pmd) = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>>>> +       unsigned long val = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>>>>                                   (pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
>>>> -       return pmd;
>>>> +
>>>> +       if (pmd_val(pmd) & _PAGE_DIRTY)
>>>> +               val |= _PAGE_MODIFIED;
>>>> +
>>>> +       return __pmd(val);
>>>>    }
>>> A minimal modification can be:
>>> diff --git a/arch/loongarch/include/asm/pgtable.h
>>> b/arch/loongarch/include/asm/pgtable.h
>>> index 1f20e9280062..907ece0199e0 100644
>>> --- a/arch/loongarch/include/asm/pgtable.h
>>> +++ b/arch/loongarch/include/asm/pgtable.h
>>> @@ -448,8 +448,13 @@ static inline unsigned long pte_accessible(struct
>>> mm_struct *mm, pte_t a)
>>>
>>>    static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>>>    {
>>> -       return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
>>> -                    (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
>>> +       pte_val(pte) = (pte_val(pte) & _PAGE_CHG_MASK) |
>>> +                       (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
>>> +
>>> +       if (pte_val(pte) & _PAGE_DIRTY)
>>> +               pte_val(pte) |= _PAGE_MODIFIED;
>>> +
>>> +       return pte;
>>>    }
>>
>> +       pte_val(pte) = (pte_val(pte) & _PAGE_CHG_MASK) |
>> +                       (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
>>
>> After this step, _PAGE_DIRTY may have already disappeared,
>> If no new variables are added, they can be modified in follow way:
>>
>>    static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>>    {
>> +       if (pte_val(pte) & _PAGE_DIRTY)
>> +               pte_val(pte) |= _PAGE_MODIFIED;
>> +
>>          return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
>>           (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
>>
>>    }
> OK, it makes sense.
> 
> Huacai
>>
>>>
>>>    extern void __update_tlb(struct vm_area_struct *vma,
>>> @@ -583,7 +588,11 @@ static inline struct page *pmd_page(pmd_t pmd)
>>>    static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>>>    {
>>>           pmd_val(pmd) = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>>> -                               (pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
>>> +                       (pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
>>> +
>>> +       if (pmd_val(pmd) & _PAGE_DIRTY)
>>> +               pmd_val(pmd) |= _PAGE_MODIFIED;
>>> +
>>>           return pmd;
>>>    }
>>>
>>> You needn't define a new variable.
>>>
>>>
>>> Huacai
>>>
>>>>    static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>>>> --
>>>> 2.41.0
>>>>
>>>>
>> Thanks
>>
>> Tianyang
>>

