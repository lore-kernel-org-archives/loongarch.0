Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E77EC5
	for <loongarch@lists.linux.dev>; Thu,  8 Jun 2023 02:12:34 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.185])
	by gateway (Coremail) with SMTP id _____8CxPusKOYFkFVIAAA--.1210S3;
	Thu, 08 Jun 2023 10:12:26 +0800 (CST)
Received: from [10.180.13.185] (unknown [10.180.13.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxluQJOYFkgDoGAA--.20361S3;
	Thu, 08 Jun 2023 10:12:25 +0800 (CST)
Subject: Re: [PATCH] LoongArch: let pmd_present return true when splitting pmd
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Feiyang Chen
 <chenfeiyang@loongson.cn>, Qi Zheng <zhengqi.arch@bytedance.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
References: <20230524074132.10916-1-zhanghongchen@loongson.cn>
 <CAAhV-H4CC0S7ciLCqdb_AoQ+3-24uo6TZb9Pz7H1yu+mvspFDw@mail.gmail.com>
From: Hongchen Zhang <zhanghongchen@loongson.cn>
Message-ID: <a8479383-a0d4-0c0a-20ef-d3c64d9ea192@loongson.cn>
Date: Thu, 8 Jun 2023 10:12:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4CC0S7ciLCqdb_AoQ+3-24uo6TZb9Pz7H1yu+mvspFDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxluQJOYFkgDoGAA--.20361S3
X-CM-SenderInfo: x2kd0w5krqwupkhqwqxorr0wxvrqhubq/1tbiAQAQB2SAc4ELCwAAsA
X-Coremail-Antispam: 1Uk129KBj93XoWxJw48CFWUJF18CFW7Zw15ZFc_yoW5ur15p3
	Z7CF1kCrW5KFyfC34aqF13ZFyUZrsrKFn2gryqgw1UAF9xX397Xrn5Krn8AFyrXayvyFy8
	Wr4qgw15WFW3t3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0b6pPUUUU
	U==

Hi Anshuman,

On 2023/5/27 下午1:32, Huacai Chen wrote:
> Hi, Anshuman,
> 
> Excuse me, but could you please tell me something that why commit
> b65399f6111b ("arm64/mm: Change THP helpers to comply with generic MM
> semantics") needn't be backported to 5.4LTS and 4.19LTS series. The
> discussion link you referred is as early as in 2018, before 4.19
> released. I think this information is important for us because we want
> to know how to handle our 4.19-loongarch codebase.

What's your opinion about huacai's question? In my opinion,your commit
should be backported to 5.4LTS and 4.19LTS.

> 
> Huacai
> 
> On Wed, May 24, 2023 at 3:42 PM Hongchen Zhang
> <zhanghongchen@loongson.cn> wrote:
>>
>> when we split a pmd into ptes, pmd_present() and pmd_trans_huge() should
>> return true,otherwise it would be treated as a swap pmd.
>> As arm64 does in
>> commit b65399f6111b ("arm64/mm: Change THP helpers to comply with generic MM semantics")
>> we add a _PAGE_PRESENT_INVALID bit for LoongArch.
>>
>> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/pgtable-bits.h | 2 ++
>>   arch/loongarch/include/asm/pgtable.h      | 3 ++-
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
>> index 8b98d22a145b..a7469d28d9d0 100644
>> --- a/arch/loongarch/include/asm/pgtable-bits.h
>> +++ b/arch/loongarch/include/asm/pgtable-bits.h
>> @@ -22,12 +22,14 @@
>>   #define        _PAGE_PFN_SHIFT         12
>>   #define        _PAGE_SWP_EXCLUSIVE_SHIFT 23
>>   #define        _PAGE_PFN_END_SHIFT     48
>> +#define _PAGE_PRESENT_INVALID_SHIFT 60
>>   #define        _PAGE_NO_READ_SHIFT     61
>>   #define        _PAGE_NO_EXEC_SHIFT     62
>>   #define        _PAGE_RPLV_SHIFT        63
>>
>>   /* Used by software */
>>   #define _PAGE_PRESENT          (_ULCAST_(1) << _PAGE_PRESENT_SHIFT)
>> +#define _PAGE_PRESENT_INVALID  (_ULCAST_(1) << _PAGE_PRESENT_INVALID_SHIFT)
>>   #define _PAGE_WRITE            (_ULCAST_(1) << _PAGE_WRITE_SHIFT)
>>   #define _PAGE_ACCESSED         (_ULCAST_(1) << _PAGE_ACCESSED_SHIFT)
>>   #define _PAGE_MODIFIED         (_ULCAST_(1) << _PAGE_MODIFIED_SHIFT)
>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
>> index d28fb9dbec59..9a9f9ff9b709 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -213,7 +213,7 @@ static inline int pmd_bad(pmd_t pmd)
>>   static inline int pmd_present(pmd_t pmd)
>>   {
>>          if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
>> -               return !!(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE));
>> +               return !!(pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROTNONE | _PAGE_PRESENT_INVALID));
>>
>>          return pmd_val(pmd) != (unsigned long)invalid_pte_table;
>>   }
>> @@ -558,6 +558,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>>
>>   static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>>   {
>> +       pmd_val(pmd) |= _PAGE_PRESENT_INVALID;
>>          pmd_val(pmd) &= ~(_PAGE_PRESENT | _PAGE_VALID | _PAGE_DIRTY | _PAGE_PROTNONE);
>>
>>          return pmd;
>>
>> base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
>> --
>> 2.31.1
>>
>>

Best Regards
Hongchen Zhang

