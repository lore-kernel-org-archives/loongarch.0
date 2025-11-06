Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A539218845
	for <loongarch@lists.linux.dev>; Thu,  6 Nov 2025 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422881; cv=none; b=kR1UichdWYKEU6CXT0U3wLx2VLyOCYv/Dy/StJeXdhf5+421nfi/UKTg9C4GuRPZD7jLAtT50vWmenWmx2RwkTT8IB5PoSyvOFhNsFWlx1YKg4G1TD7cz3xyzjKGw52uuN0IvRjrf6xdOYny5hvmW5IHF0mG8ncge1ngXA6CdAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422881; c=relaxed/simple;
	bh=9qjHSty0byUHU5tZYNvEbUSL79HOCA8d/vcmVI7Wd3w=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CID0B6iP64asDe3scRIQ8SxfZN/SM1zqf5+XKS2ihwX+jWT/GDaxIZprQ9D2Z2PoEeuTeY9WNImglwpBarAyWiYAfe3+gyPB6kCktV+1DZ5fLEGM1gSomrXrSXNuhSPdJGJBesTx99D2u1ioQSNaLYnkRAJMzvF/B1FeKn/HczA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8AxP_BccAxp26QfAA--.2858S3;
	Thu, 06 Nov 2025 17:54:36 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJBxjcFZcAxpkYEpAQ--.5449S3;
	Thu, 06 Nov 2025 17:54:35 +0800 (CST)
Subject: Re: [PATCH] Loongarch:Make pte/pmd_modify can set _PAGE_MODIFIED
To: Bibo Mao <maobibo@loongson.cn>, chenhuacai@kernel.org, kernel@xen0n.name,
 akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
 linmag7@gmail.com, thuth@redhat.com, apopple@nvidia.com
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Liupu Wang <wangliupu@loongson.cn>
References: <20251104073006.1764241-1-zhangtianyang@loongson.cn>
 <48f8f2d8-e6e0-ec2a-7323-11551c66dac2@loongson.cn>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <721fdf6e-61c4-2e31-c584-04d8380f2952@loongson.cn>
Date: Thu, 6 Nov 2025 17:53:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <48f8f2d8-e6e0-ec2a-7323-11551c66dac2@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBxjcFZcAxpkYEpAQ--.5449S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFW3GFWUGFyxJw1fJw1kZwc_yoW5KF1kpF
	1kAFyUZFWUtrn7JayUJr17Xry5Aw47J3WDJr1DJF1UJryUtryjqr1UXrn09r15Jr48Xr1U
	Jr1UXrs8ZF47JrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8vApUUUUUU==


在 2025/11/6 下午3:07, Bibo Mao 写道:
>
>
> On 2025/11/4 下午3:30, Tianyang Zhang wrote:
>> In the current pte_modify operation, _PAGE_DIRTY might be cleared. Since
>> the hardware-page-walk does not have a predefined _PAGE_MODIFIED flag,
>> this could lead to loss of valid data in certain scenarios.
>>
>> The new modification involves checking whether the original PTE has the
>> _PAGE_DIRTY flag. If it exists, the _PAGE_MODIFIED bit is set, ensuring
>> that the pte_dirty interface can return accurate information.
>>
>> Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
>> Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/pgtable.h | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/pgtable.h 
>> b/arch/loongarch/include/asm/pgtable.h
>> index bd128696e96d..106abfa5183b 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -424,8 +424,13 @@ static inline unsigned long 
>> pte_accessible(struct mm_struct *mm, pte_t a)
>>     static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>>   {
>> -    return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
>> -             (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
>> +    unsigned long val = (pte_val(pte) & _PAGE_CHG_MASK) |
>> +             (pgprot_val(newprot) & ~_PAGE_CHG_MASK);
>> +
>> +    if (pte_val(pte) & _PAGE_DIRTY)
>> +        val |= _PAGE_MODIFIED;
> Since ptep_get_and_clear() is not atomic operation on LoongArch like 
> other architectures, considering this scenery with HW PTW enabled:
>     CPU 0:                         CPU1
>                              old_pte = ptep_modify_prot_start();
>                                   old_pte = ptep_get(ptep);
>
>     write(buf);
> *HW will set _PAGE_DIRTY bit*
>                                   pte_clear(mm, address, ptep);
> ^^^^^^^^^^ For CPU1, bit _PAGE_DIRTY is no set in old_pte, _PAGE_DIRTY 
> will be lost also. ^^^^^^^^^^^
>                              pte = pte_modify(old_pte,)
>                              ptep_modify_prot_commit(.., pte)

There does appear to be an issue here. It seems we should use 
`__HAVE_ARCH_PTEP_GET_AND_CLEAR` and implement ptep_get_and_clear via 
`atomic_xchg`.

However, I believe this change should be submitted in a new patch.

Thanks

Tianyang

>
> Regards
> Bibo Mao
>> +
>> +    return __pte(val);
>>   }
>>     extern void __update_tlb(struct vm_area_struct *vma,
>> @@ -547,9 +552,13 @@ static inline struct page *pmd_page(pmd_t pmd)
>>     static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>>   {
>> -    pmd_val(pmd) = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>> +    unsigned long val = (pmd_val(pmd) & _HPAGE_CHG_MASK) |
>>                   (pgprot_val(newprot) & ~_HPAGE_CHG_MASK);
>> -    return pmd;
>> +
>> +    if (pmd_val(pmd) & _PAGE_DIRTY)
>> +        val |= _PAGE_MODIFIED;
>> +
>> +    return __pmd(val);
>>   }
>>     static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>>

