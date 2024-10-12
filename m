Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808FD15E96
	for <loongarch@lists.linux.dev>; Sat, 12 Oct 2024 02:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728700833; cv=none; b=mckd20CL9+Q2M9EFNpVnZNKsTHY+ClV8Yfoy5cAtWFSPffOw2dKSw/zYrOfwpxuCKUhzqTFg+E3fQL72EIvKD2osZDpCgJjkOyfzuyn0sk6LzH+In4Muwzi9TKcMz7gaL+k70hJ3I0thaXaApM1U5aZaasIQJXah/em9r9iHciI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728700833; c=relaxed/simple;
	bh=MZoGFxD0+h1bTVN1oZ1B2Ra3agFKg88pWhWyB3aZYDk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JT3Uvi+fV0gKF7qVvdMzrTyg8mKexGOtI9ajCIJMbmA8l+ni5xWxBJqXjScXdfBTD/JAxZ4ikqxqut1jKrCD9BxWC8vRQ/YxyaUxYd7avTfeQYi+nhALkFi9M4VbnWOd0VMDAY0jPU8u9NFhuKsn5L/t2z2+cQL3KfQDGcHxqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxHLOZ4QlnQWgUAA--.31359S3;
	Sat, 12 Oct 2024 10:40:25 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMBxXuSV4QlnS54kAA--.51895S3;
	Sat, 12 Oct 2024 10:40:23 +0800 (CST)
Subject: Re: [PATCH 1/4] LoongArch: Set pte entry with PAGE_GLOBAL for kernel
 space
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20241010035048.3422527-1-maobibo@loongson.cn>
 <20241010035048.3422527-2-maobibo@loongson.cn>
 <CAAhV-H4q_P1HL74k5k+er9QEvZjMaa2kTYz8N+7aJ1vDii=GKQ@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <56c7ae02-1426-b503-9afa-5a87a2b4bd21@loongson.cn>
Date: Sat, 12 Oct 2024 10:40:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4q_P1HL74k5k+er9QEvZjMaa2kTYz8N+7aJ1vDii=GKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXuSV4QlnS54kAA--.51895S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW3XryDZrW3Cr4kCr48Kw1UCFX_yoW7ZrWDpr
	9rAFn5WF48Wr97Aa97tF1qgr15Xws3KF42gF1akFWrAFnF9r1kWr1kG3sxuFy8XayUCayF
	9r1rKa43XF4UtagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jepB-UUUUU=

Huacai,

On 2024/10/12 上午10:15, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Thu, Oct 10, 2024 at 11:50 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> Unlike general architectures, there are two pages for one TLB entry
>> on LoongArch system. For kernel space, it requires both two pte
>> entries with PAGE_GLOBAL set, else HW treats it as non-global tlb,
>> there will be potential problems if tlb entry for kernel space is
>> not global. Such as fail to flush kernel tlb with function
>> local_flush_tlb_kernel_range() which only flush tlb with global bit.
>>
>> Here function kernel_pte_init() is added, it can be used to init
>> pte table when it is created, so the default inital pte is
>> PAGE_GLOBAL rather than zero at beginning.
> I think kernel_pte_init() is also needed in zero_pmd_populate() in
> mm/kasan/init.c. And moreover, the second patch should be squashed in
yes, it is needed in zero_pmd_populate() in mm/kasan/init.c, will add it
in next version.

> this one because they should be as a whole. Though the second one
> touches the common code, I can merge it with mm maintainer's acked-by.
Sure, will merge it with the second one into one patch.

Regards
Bibo Mao
> 
> 
> Huacai
> 
>>
>> Kernel space areas includes fixmap, percpu, vmalloc and kasan areas
>> set default pte entry with PAGE_GLOBAL set.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/include/asm/pgalloc.h | 13 +++++++++++++
>>   arch/loongarch/include/asm/pgtable.h |  1 +
>>   arch/loongarch/mm/init.c             |  4 +++-
>>   arch/loongarch/mm/kasan_init.c       |  4 +++-
>>   arch/loongarch/mm/pgtable.c          | 22 ++++++++++++++++++++++
>>   5 files changed, 42 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
>> index 4e2d6b7ca2ee..b2698c03dc2c 100644
>> --- a/arch/loongarch/include/asm/pgalloc.h
>> +++ b/arch/loongarch/include/asm/pgalloc.h
>> @@ -10,8 +10,21 @@
>>
>>   #define __HAVE_ARCH_PMD_ALLOC_ONE
>>   #define __HAVE_ARCH_PUD_ALLOC_ONE
>> +#define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
>>   #include <asm-generic/pgalloc.h>
>>
>> +static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>> +{
>> +       pte_t *pte;
>> +
>> +       pte = (pte_t *) __get_free_page(GFP_KERNEL);
>> +       if (!pte)
>> +               return NULL;
>> +
>> +       kernel_pte_init(pte);
>> +       return pte;
>> +}
>> +
>>   static inline void pmd_populate_kernel(struct mm_struct *mm,
>>                                         pmd_t *pmd, pte_t *pte)
>>   {
>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
>> index 9965f52ef65b..22e3a8f96213 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -269,6 +269,7 @@ extern void set_pmd_at(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp, pm
>>   extern void pgd_init(void *addr);
>>   extern void pud_init(void *addr);
>>   extern void pmd_init(void *addr);
>> +extern void kernel_pte_init(void *addr);
>>
>>   /*
>>    * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
>> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
>> index 8a87a482c8f4..9f26e933a8a3 100644
>> --- a/arch/loongarch/mm/init.c
>> +++ b/arch/loongarch/mm/init.c
>> @@ -198,9 +198,11 @@ pte_t * __init populate_kernel_pte(unsigned long addr)
>>          if (!pmd_present(pmdp_get(pmd))) {
>>                  pte_t *pte;
>>
>> -               pte = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
>> +               pte = memblock_alloc_raw(PAGE_SIZE, PAGE_SIZE);
>>                  if (!pte)
>>                          panic("%s: Failed to allocate memory\n", __func__);
>> +
>> +               kernel_pte_init(pte);
>>                  pmd_populate_kernel(&init_mm, pmd, pte);
>>          }
>>
>> diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
>> index 427d6b1aec09..34988573b0d5 100644
>> --- a/arch/loongarch/mm/kasan_init.c
>> +++ b/arch/loongarch/mm/kasan_init.c
>> @@ -152,6 +152,8 @@ static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
>>                  phys_addr_t page_phys = early ?
>>                                          __pa_symbol(kasan_early_shadow_page)
>>                                                : kasan_alloc_zeroed_page(node);
>> +               if (!early)
>> +                       kernel_pte_init(__va(page_phys));
>>                  next = addr + PAGE_SIZE;
>>                  set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
>>          } while (ptep++, addr = next, addr != end && __pte_none(early, ptep_get(ptep)));
>> @@ -287,7 +289,7 @@ void __init kasan_init(void)
>>                  set_pte(&kasan_early_shadow_pte[i],
>>                          pfn_pte(__phys_to_pfn(__pa_symbol(kasan_early_shadow_page)), PAGE_KERNEL_RO));
>>
>> -       memset(kasan_early_shadow_page, 0, PAGE_SIZE);
>> +       kernel_pte_init(kasan_early_shadow_page);
>>          csr_write64(__pa_symbol(swapper_pg_dir), LOONGARCH_CSR_PGDH);
>>          local_flush_tlb_all();
>>
>> diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
>> index eb6a29b491a7..228ffc1db0a3 100644
>> --- a/arch/loongarch/mm/pgtable.c
>> +++ b/arch/loongarch/mm/pgtable.c
>> @@ -38,6 +38,28 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
>>   }
>>   EXPORT_SYMBOL_GPL(pgd_alloc);
>>
>> +void kernel_pte_init(void *addr)
>> +{
>> +       unsigned long *p, *end;
>> +       unsigned long entry;
>> +
>> +       entry = (unsigned long)_PAGE_GLOBAL;
>> +       p = (unsigned long *)addr;
>> +       end = p + PTRS_PER_PTE;
>> +
>> +       do {
>> +               p[0] = entry;
>> +               p[1] = entry;
>> +               p[2] = entry;
>> +               p[3] = entry;
>> +               p[4] = entry;
>> +               p += 8;
>> +               p[-3] = entry;
>> +               p[-2] = entry;
>> +               p[-1] = entry;
>> +       } while (p != end);
>> +}
>> +
>>   void pgd_init(void *addr)
>>   {
>>          unsigned long *p, *end;
>> --
>> 2.39.3
>>

