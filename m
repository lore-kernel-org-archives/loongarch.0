Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6A11F9402
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896950; cv=none; b=tUZccea4ZVhom1Ktk9Qs/miPmto/jTd0GqFifpmfhlihamW3vxy3NYNm9KwfKBPg0TztwEPcR/u8bqPe8nNVa5cKBWpxrV2+91cnwx94UPIRR4fYQxl6VjelrgIj+tEN/1Szui1XsoOPdjxyW97N3bARNOXrPZ8Api4C1TGKy94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896950; c=relaxed/simple;
	bh=z3KUSQuQ6fUzdXdRu0kLqVdkc9nzsYb+5BilIA5WCiM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KZkkzcx3HjXhfx/Wsslhk1BlJvkTS8/oiUSRMYEmOUVvDJR31aLT+9dcTD343L2AfNVvjVBmGBI+3kPCRWH0pJJDWiLcR732zsxyx+ELKW9BZLlFFx/LlrcSOE9azwZX1+gUg5IfJAcex1IDJfjU2Q/L4s8x3YWii4XtlDdRyuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GQV3+cz+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GQV3+cz+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2166022c5caso147469185ad.2
        for <loongarch@lists.linux.dev>; Fri, 03 Jan 2025 01:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735896946; x=1736501746; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
        b=GQV3+cz+e5mrkmLyLZYYazVDQkzthrjD0LblwSfuoKfcinH6TPFf/P4Zipr7RgZEZX
         rrc5OtIzHyEo+76yEUjuem7ZFl1fkX7AcxI9HIY+wK5AWZvjzhPoFnq+VMrYozyYS+17
         ijrHXNaQTNJeZHi7vMhZ0UvPcgrCWal2Qd6m/DsGwHcn9KY2gZzT1mBJqP+FkuSbtgud
         K7R3HOazObZT++s6L+I95QzyklTcW4fs3G5I/Kbg+1qFxTj2H0x4wAE+Y3IWS2TlTfjH
         ZKvz0s+jjKepJ7Titx0psi5LCqAYc3InjfYtktQZWF0YOqyYBlgvWx86McPfSt2FF83r
         0w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896946; x=1736501746;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWtjK5g4BM/SvEXkEBPomhMpQ0cOqD61cD7+kwN1xqo=;
        b=NetOQ/QtNwWhqR5qWuQSscSBt2XWXRrJUxM03Uz0BkwFjbb49FJFjzYRbE5AHy/RwL
         RNhMcHyuNbH5wvGavn2F9Vs19VuT4hvXRO4mpOy2cEEU+ZeN34v7GQjbdHOpCID981ze
         wDNXarkjoD/yWUfKETWp3gvME9mVbJ3l+nhXbUNCXLyJM5faQEYLDlb4X3+7sPWULzYT
         HRfAUd1eJcidNKRExwzNNYAsEKkfxC/r5mKNXVAGvD/WV2/OEJcMgr44/GfDchPfBniy
         zDf8bhsLfJFTBJrWbHeivdR3qy6I5zZaTkSR8lONRXx5OBoe0Ee9P4+rk7qD/B9s9+Kr
         tA5A==
X-Forwarded-Encrypted: i=1; AJvYcCVH1besq6skW+aXZcv2OBVkJmdncIJhEk+TtFV3GinUbt0UAJ3u3Hw2sBMqtNRznPzZCidx3IpsIbU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9/rvlVoOGf3PskAUWGfZFC4j9fpixP/gCjh//4uAitZm3RN3D
	3s6jPiTlPu53ApYV5gNloBa9QIuaLXEPAo38WSU6xzjM6sT9yxjgmqYuXUHRnSg=
X-Gm-Gg: ASbGncuwmOi2/QByqHkTOmPZ8bq4a5C5P+gd22gAoYzZKJeXA4S42NjJ6vCJHk6UenK
	yRfGhZJGDcJy2E+XBIsT7lE/52b2b/44S9FoWXTp/G2fdbLZS6/yqBIACauQIHckDWzqaahF2e3
	xZLfS1r/wojPRxGys88/UDBXEtGuwontNd1QeaQEYlil5sOL6C6OmfTKQH0DmTJsIk1I610CCDC
	OKT/95jr9UjVg+QTmRLCtWhTvW3ED3lUCwLCQxyrU9ztVzdTAvNaMn5sUJFKgl/JLw+4QZ355Y9
	DlBpCg==
X-Google-Smtp-Source: AGHT+IE9O96BS3RyGLgD9ozZE9cvlEJyEf8vCWPZNZOt2fNtD1RyepOtwaueaYCtTF24hvZZQqYEyw==
X-Received: by 2002:a17:902:d481:b0:215:6fcd:6cd1 with SMTP id d9443c01a7336-219e6e8c508mr551854195ad.7.1735896945927;
        Fri, 03 Jan 2025 01:35:45 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cddf2sm241537305ad.166.2025.01.03.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:35:45 -0800 (PST)
Message-ID: <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
Date: Fri, 3 Jan 2025 17:35:30 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, peterz@infradead.org
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
In-Reply-To: <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/1/3 17:13, Qi Zheng wrote:
> 
> 
> On 2025/1/3 16:02, Kevin Brodsky wrote:
>> On 03/01/2025 04:48, Qi Zheng wrote:
>>> Hi Kevin,
>>>
>>> On 2025/1/3 00:53, Kevin Brodsky wrote:
>>>> On 30/12/2024 10:07, Qi Zheng wrote:
>>>>>    static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb,
>>>>> void *pt)
>>>>>    {
>>>>> -    if (riscv_use_sbi_for_rfence())
>>>>> +    if (riscv_use_sbi_for_rfence()) {
>>>>>            tlb_remove_ptdesc(tlb, pt);
>>>>> -    else
>>>>> +    } else {
>>>>> +        pagetable_dtor(pt);
>>>>>            tlb_remove_page_ptdesc(tlb, pt);
>>>>
>>>> I find the imbalance pretty confusing: pagetable_dtor() is called
>>>> explicitly before using tlb_remove_page() but not tlb_remove_ptdesc().
>>>> Doesn't that assume that CONFIG_MMU_GATHER_HAVE_TABLE_FREE is selected?
>>>> Could we not call pagetable_dtor() from 
>>>> __tlb_batch_free_encoded_pages()
>>>> to ensure that the dtor is always called just before freeing, and 
>>>> remove
>>>
>>> In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
>>> and call pagetable_dtor() to dtor the page table pages.
>>> But __tlb_batch_free_encoded_pages() is also used to free normal pages
>>> (not page table pages), so I don't want to add overhead there.
>>
>> Interesting, can a tlb batch refer to pages than are not PTPs then?
> 
> Yes, you can see the caller of __tlb_remove_folio_pages() or 
> tlb_remove_page_size().
> 
>>
>>>
>>> But now I think maybe we can do this in tlb_remove_page_ptdesc(), like
>>> this:
>>>
>>> diff --git a/arch/csky/include/asm/pgalloc.h
>>> b/arch/csky/include/asm/pgalloc.h
>>> index f1ce5b7b28f22..e45c7e91dcbf9 100644
>>> --- a/arch/csky/include/asm/pgalloc.h
>>> +++ b/arch/csky/include/asm/pgalloc.h
>>> @@ -63,7 +63,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>>>
>>>   #define __pte_free_tlb(tlb, pte, address)              \
>>>   do {                                                   \
>>> -       pagetable_dtor(page_ptdesc(pte));               \
>>>          tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
>>>   } while (0)
>>>
>>> [...]
>>>
>>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>>> index a96d4b440f3da..a59205863f431 100644
>>> --- a/include/asm-generic/tlb.h
>>> +++ b/include/asm-generic/tlb.h
>>> @@ -506,6 +506,7 @@ static inline void tlb_remove_ptdesc(struct
>>> mmu_gather *tlb, void *pt)
>>>   /* Like tlb_remove_ptdesc, but for page-like page directories. */
>>>   static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb,
>>> struct ptdesc *pt)
>>>   {
>>> +       pagetable_dtor(pt);
>>>          tlb_remove_page(tlb, ptdesc_page(pt));
>>>   }
>>
>> I think this is an interesting idea, it does make arch code easier to
>> follow. OTOH it would have been more natural to me to call
>> pagetable_dtor() from tlb_remove_page(). I can however see that this
>> doesn't work, because tlb_remove_table() is defined as tlb_remove_page()
>> if CONFIG_MMU_GATHER_HAVE_TABLE_FREE isn't selected. Which brings me
>> back to my earlier question: in that case, aren't we missing a call to
>> pagetable_dtor() when using tlb_remove_table() (or tlb_remove_ptdesc())?
> 
> Thank you for pointing this out!
> 
> Now, there are the following architectures selected 
> CONFIG_MMU_GATHER_RCU_TABLE_FREE:
> 
> 1. arm: select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
> 2. arm64: select MMU_GATHER_RCU_TABLE_FREE
> 3. powerpc: select MMU_GATHER_RCU_TABLE_FREE
> 4. riscv: select MMU_GATHER_RCU_TABLE_FREE if SMP && MMU
> 5. s390: select MMU_GATHER_RCU_TABLE_FREE
> 6. sparc: select MMU_GATHER_RCU_TABLE_FREE if SMP
> 7. x86: select MMU_GATHER_RCU_TABLE_FREE    if PARAVIRT
> 
> If CONFIG_MMU_GATHER_TABLE_FREE is selected, an architecture is expected
> to provide __tlb_remove_table(). This patch series modifies the
> __tlb_remove_table() in arm, arm64, riscv, s390 and x86. Among them,
> arm64 and s390 unconditionally select MMU_GATHER_RCU_TABLE_FREE, so we
> only need to double-check arm, riscv and x86.
> 
> For x86, it was called tlb_remove_page() in the non-PARAVIRT case, and I
> added pagetable_dtor() for it explicitly (see patch #11), so this should
> be no problem.
> 
> For riscv, it will only call tlb_remove_ptdesc() in the case of
> SMP && MMU, so this should be no problem.
> 
> For arm, the call to pagetable_dtor() is indeed missed in the
> non-MMU_GATHER_RCU_TABLE_FREE case. This needs to be fixed. But we
> can't fix this by adding pagetable_dtor() to tlb_remove_table(),
> because some architectures call tlb_remove_table() but don't support
> page table statistics, like sparc.
> 
> So a more direct fix might be:
> 
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index a59205863f431..0a131444a18ca 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -500,6 +500,9 @@ static inline void tlb_remove_page(struct mmu_gather 
> *tlb, struct page *page)
> 
>   static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
>   {
> +#ifndef CONFIG_MMU_GATHER_TABLE_FREE
> +       pagetable_dtor(pt);
> +#endif
>          tlb_remove_table(tlb, pt);
>   }
> 
> Or fix it directly in arm? Like the following:
> 
> diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
> index ea4fbe7b17f6f..cf5d0ca021440 100644
> --- a/arch/arm/include/asm/tlb.h
> +++ b/arch/arm/include/asm/tlb.h
> @@ -43,6 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, 
> unsigned long addr)
>          __tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
>   #endif
> 
> +#ifndef CONFIG_MMU_GATHER_TABLE_FREE
> +       pagetable_dtor(ptdesc);
> +#endif
>          tlb_remove_ptdesc(tlb, ptdesc);
>   }

Or can we just not let tlb_remove_table() fall back to
tlb_remove_page()? Like the following:

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index a59205863f431..354ffaa4bd120 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -195,8 +195,6 @@
   *  various ptep_get_and_clear() functions.
   */

-#ifdef CONFIG_MMU_GATHER_TABLE_FREE
-
  struct mmu_table_batch {
  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
         struct rcu_head         rcu;
@@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)

  extern void tlb_remove_table(struct mmu_gather *tlb, void *table);

-#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
-
-/*
- * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have 
page based
- * page directories and we can use the normal page batching to free them.
- */
-#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
-
-#endif /* CONFIG_MMU_GATHER_TABLE_FREE */
-
  #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
  /*
   * This allows an architecture that does not use the linux page-tables for

> 
> Thanks,
> Qi
> 
>>
>> - Kevin
