Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6064642D
	for <loongarch@lists.linux.dev>; Sat, 12 Oct 2024 02:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728701506; cv=none; b=rgmcEbu7ACiORn9tbLpAlyVgKbhhJ6zvCROmfUtvbCByF6KCnyw7050KUCB77GexEFK+S4mA5npLvpLZ//OHcB707fF284N4Pmu6A212PbyzXzzSmW03U3ZgSTSW8niXWajkpgrQ7/vFFXKUsQwaG/ylSuRDOoyefPIh8wbweU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728701506; c=relaxed/simple;
	bh=ZXC/d8T4tbiTX7tmhlUICgHdEmYD+2larjm6u/Qw3i8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=D3n68MH2233hbRiUGSSyIM6YrW3fX7jFoCQQ2QGZ2L2JJo/YSj7i4+cb67Hk/FU3LB2e7mS8fPmwldWvilJKDKlvo/G7EIk+qBQBDpgysbJQbsBDKUdf4Rgh9wY9S0O33phzemp+uNWlwfJe8U7SxShh+ZI/ne0JBA90B1choTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxVek95AlnAWsUAA--.29826S3;
	Sat, 12 Oct 2024 10:51:41 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMBxXuQ85AlnuqAkAA--.51936S3;
	Sat, 12 Oct 2024 10:51:40 +0800 (CST)
Subject: Re: [PATCH 4/4] LoongArch: Use atomic operation with set_pte and
 pte_clear function
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20241010035048.3422527-1-maobibo@loongson.cn>
 <20241010035048.3422527-5-maobibo@loongson.cn>
 <CAAhV-H5DvHcS+apFthMWNNqvvq+VMu--6bcuyGzdMz66K8Bd=g@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <4917e6ac-2874-218c-a3be-f2a1462f11c5@loongson.cn>
Date: Sat, 12 Oct 2024 10:51:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5DvHcS+apFthMWNNqvvq+VMu--6bcuyGzdMz66K8Bd=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXuQ85AlnuqAkAA--.51936S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCF1fKr13Aw47Xw45WrWUJrc_yoW5Zw1Upr
	ZxCF95ZFs7GryIkwsFqFn8tryYv34ava4ktr9IkFy8AFnav3sFqFy0grWayFy5t3yfWw48
	Ja1UKwnxWFsFyacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8N6pPUUUUU==


Huacai,

On 2024/10/12 上午10:16, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Thu, Oct 10, 2024 at 11:50 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> For kernel space area on LoongArch system, both two consecutive page
>> table entries should be enabled with PAGE_GLOBAL bit. So with function
>> set_pte() and pte_clear(), pte buddy entry is checked and set besides
>> its own pte entry. However it is not atomic operation to set both two
>> pte entries, there is problem with test_vmalloc test case.
>>
>> With previous patch, all page table entries are set with PAGE_GLOBAL
>> bit at beginning. Only its own pte entry need update with function
>> set_pte() and pte_clear(), nothing to do with buddy pte entry.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/pgtable.h | 44 ++++++++++------------------
>>   1 file changed, 15 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
>> index 22e3a8f96213..4be3f0dbecda 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -325,40 +325,26 @@ extern void paging_init(void);
>>   static inline void set_pte(pte_t *ptep, pte_t pteval)
>>   {
>>          WRITE_ONCE(*ptep, pteval);
>> +}
>>
>> -       if (pte_val(pteval) & _PAGE_GLOBAL) {
>> -               pte_t *buddy = ptep_buddy(ptep);
>> -               /*
>> -                * Make sure the buddy is global too (if it's !none,
>> -                * it better already be global)
>> -                */
>> -               if (pte_none(ptep_get(buddy))) {
>> -#ifdef CONFIG_SMP
>> -                       /*
>> -                        * For SMP, multiple CPUs can race, so we need
>> -                        * to do this atomically.
>> -                        */
>> -                       __asm__ __volatile__(
>> -                       __AMOR "$zero, %[global], %[buddy] \n"
>> -                       : [buddy] "+ZB" (buddy->pte)
>> -                       : [global] "r" (_PAGE_GLOBAL)
>> -                       : "memory");
>> -
>> -                       DBAR(0b11000); /* o_wrw = 0b11000 */
>> -#else /* !CONFIG_SMP */
>> -                       WRITE_ONCE(*buddy, __pte(pte_val(ptep_get(buddy)) | _PAGE_GLOBAL));
>> -#endif /* CONFIG_SMP */
>> -               }
>> -       }
>> +static inline unsigned long __ptep_get_and_clear(pte_t *ptep)
>> +{
>> +       return atomic64_fetch_and(_PAGE_GLOBAL, (atomic64_t *)&pte_val(*ptep));
>>   }
>>
>>   static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
>>   {
>> -       /* Preserve global status for the pair */
>> -       if (pte_val(ptep_get(ptep_buddy(ptep))) & _PAGE_GLOBAL)
>> -               set_pte(ptep, __pte(_PAGE_GLOBAL));
>> -       else
>> -               set_pte(ptep, __pte(0));
>> +       __ptep_get_and_clear(ptep);
> With the first patch, a kernel pte always take _PAGE_GLOBAL, so we
> don't need an expensive atomic operation, just
> "set_pte(pte_val(ptep_get(ptep)) & _PAGE_GLOBAL)" is OK here. And then
> we don't need a custom ptep_get_and_clear().
Will use non-atomic method and test again, also will remove customed 
function ptep_get_and_clear().

Regards
Bibo Mao
> 
> 
> Huacai
> 
>> +}
>> +
>> +#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
>> +static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>> +                                       unsigned long addr, pte_t *ptep)
>> +{
>> +       unsigned long val;
>> +
>> +       val = __ptep_get_and_clear(ptep);
>> +       return __pte(val);
>>   }
>>
>>   #define PGD_T_LOG2     (__builtin_ffs(sizeof(pgd_t)) - 1)
>> --
>> 2.39.3
>>

