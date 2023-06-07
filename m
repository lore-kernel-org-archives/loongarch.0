Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0F87C
	for <loongarch@lists.linux.dev>; Wed,  7 Jun 2023 02:57:30 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8CxPusX8n9kCwEAAA--.41S3;
	Wed, 07 Jun 2023 10:57:27 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxluQU8n9knq8DAA--.13597S3;
	Wed, 07 Jun 2023 10:57:24 +0800 (CST)
Message-ID: <a20794ea-856a-8197-d5b5-c3e29f6203ed@loongson.cn>
Date: Wed, 7 Jun 2023 10:57:24 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] LoongArch: let pmd_present return true when splitting pmd
Content-Language: en-US
From: "bibo, mao" <maobibo@loongson.cn>
To: zhanghongchen@loongson.cn
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Feiyang Chen
 <chenfeiyang@loongson.cn>, Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230524074132.10916-1-zhanghongchen@loongson.cn>
 <46ce41a3-16bd-6d92-c8a8-764283859190@loongson.cn>
 <fbe8a1ec-cc81-d4db-8c55-31a60fb9fb58@loongson.cn>
In-Reply-To: <fbe8a1ec-cc81-d4db-8c55-31a60fb9fb58@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxluQU8n9knq8DAA--.13597S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCrW5ur47WrWxKrykuF18tFc_yoWrGryDpw
	n7CFy8CrW5KFn7C34YqFy3XryUArsrG3Wqqr98GF18AFW7X3s2qrn8Wr909ry8Xan5tFy8
	Xr45Ww15uFy3JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j7BMNUUU
	UU=

I suggest to using bit12-bit20 since high weight bits such 63-61 are hw bits, it may
expand for  future hw use, or you had better negotiate with hw guys.

>>> +#define _PAGE_PRESENT_INVALID_SHIFT 60
>>>   #define    _PAGE_NO_READ_SHIFT    61
>>>   #define    _PAGE_NO_EXEC_SHIFT    62
>>>   #define    _PAGE_RPLV_SHIFT    63

Regards
Bibo, Mao

在 2023/6/6 21:49, bibo, mao 写道:
> I do not object to adding sw bit for _PAGE_PRESENT_INVALID,  only that can it use
> bit12--bit20 since it is for pmd entry only?
> 
> Regards
> Bibo, Mao
> 
> 在 2023/6/6 19:38, Hongchen Zhang 写道:
>> Hi,
>>
>> Gentle ping.
>>
>> On 2023/5/24 pm 3:41, Hongchen Zhang wrote:
>>> when we split a pmd into ptes, pmd_present() and pmd_trans_huge() should
>>> return true,otherwise it would be treated as a swap pmd.
>>> As arm64 does in
>>> commit b65399f6111b ("arm64/mm: Change THP helpers to comply with generic MM semantics")
>>> we add a _PAGE_PRESENT_INVALID bit for LoongArch.
>>>
>>> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
>>> ---
>>>   arch/loongarch/include/asm/pgtable-bits.h | 2 ++
>>>   arch/loongarch/include/asm/pgtable.h      | 3 ++-
>>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
>>> index 8b98d22a145b..a7469d28d9d0 100644
>>> --- a/arch/loongarch/include/asm/pgtable-bits.h
>>> +++ b/arch/loongarch/include/asm/pgtable-bits.h
>>> @@ -22,12 +22,14 @@
>>>   #define    _PAGE_PFN_SHIFT        12
>>>   #define    _PAGE_SWP_EXCLUSIVE_SHIFT 23
>>>   #define    _PAGE_PFN_END_SHIFT    48
>>> +#define _PAGE_PRESENT_INVALID_SHIFT 60
>>>   #define    _PAGE_NO_READ_SHIFT    61
>>>   #define    _PAGE_NO_EXEC_SHIFT    62
>>>   #define    _PAGE_RPLV_SHIFT    63
>>>     /* Used by software */
>>>   #define _PAGE_PRESENT        (_ULCAST_(1) << _PAGE_PRESENT_SHIFT)
>>> +#define _PAGE_PRESENT_INVALID    (_ULCAST_(1) << _PAGE_PRESENT_INVALID_SHIFT)
>>>   #define _PAGE_WRITE        (_ULCAST_(1) << _PAGE_WRITE_SHIFT)
>>>   #define _PAGE_ACCESSED        (_ULCAST_(1) << _PAGE_ACCESSED_SHIFT)
>>>   #define _PAGE_MODIFIED        (_ULCAST_(1) << _PAGE_MODIFIED_SHIFT)
>>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
>>> index d28fb9dbec59..9a9f9ff9b709 100644
>>> --- a/arch/loongarch/include/asm/pgtable.h
>>> +++ b/arch/loongarch/include/asm/pgtable.h
>>> @@ -213,7 +213,7 @@ static inline int pmd_bad(pmd_t pmd)
>>>   static inline int pmd_present(pmd_t pmd)
>>>   {
>>>       if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
>>> -        return !!(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE));
>>> +        return !!(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE | _PAGE_PRESENT_INVALID));
>>>         return pmd_val(pmd) != (unsigned long)invalid_pte_table;
>>>   }
>>> @@ -558,6 +558,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>>>     static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>>>   {
>>> +    pmd_val(pmd) |= _PAGE_PRESENT_INVALID;
>>>       pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_DIRTY | _PAGE_PROTNONE);
>>>         return pmd;
>>>
>>> base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
>>>
>>
>> Best Regards
>> Hongchen Zhang
>>
>> _______________________________________________
>> Loongson-kernel mailing list -- loongson-kernel@lists.loongnix.cn
>> To unsubscribe send an email to loongson-kernel-leave@lists.loongnix.cn

