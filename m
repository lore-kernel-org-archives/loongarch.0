Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116D111D
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 12:11:15 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id v10-20020a17090a634a00b00205e48cf845so5731165pjs.4
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Z7XuW+AFa1zSdV3jkS4YCJs3LGjfYYr9+c27k89oPls=;
        b=ehoboS0QQDoxfak0jPEZuzA6PZYtVRrkQiUBPgrw1TWIXkHRVuJTacrYPNeuT0fv+f
         2SkQyOApLpapjcC5SwNjwgidU91fRWv8xo2sml/vgKFpTkc1sN9hP0qCYNo5namMrn1/
         EPWZx25C0+DTo9Pl4F2rUU9MRu8DJZkxMaAS1y1gJog9EujlF/oHXOIIJU9QQK2oZpMH
         GTESFbtkmdmDj1gQ6isyQswTXd/4AQFDyR6VnUVuJg8CaVItvENWm1Y9IzFlNbnSxeDE
         KfnUxYWLWsCmYhYArA3mi0HzpE4Gu5qtnugXtkRT9gZwENIPfRy91DyWsaM1bTstBtLu
         wJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Z7XuW+AFa1zSdV3jkS4YCJs3LGjfYYr9+c27k89oPls=;
        b=fYaCD/l5n+Iy/S//8HB/gG5nduAtCNm1mdzphRq7MOW78v/xnckfGuIqpCdCWETe4o
         +/pSwBnzniPT2J2NbCf+qgIoRKa4v6ipV9OhJg71qK9lz+O3gt5r983CT66KBMSnbUKD
         qfkA2HfqOn+FY8yIxj8vCbtyAkIgY8nfBH2+glwxOp+SRh9EkNmnSSHceG8AJ4ZmDgju
         xOTtE/ZLzj7tRdAHhDwyjkaBOYJ4LgOYijEXVY/mcEEfyZKmyO1cu0ywjd799xNgD3PB
         mgko8V94tG2a2lgv+I+ynGKn7j041K4F5gGr+nJ78TzhNYBJT/88n8koinEJZF+4wWE5
         hZFg==
X-Gm-Message-State: ACrzQf0XF1sfkaLotnzmLm9M1QXwD9bc1nhm1IC3GwukS1h8ElMY7fba
	wd2aNsNTwkQVlLxoIPK70w658w==
X-Google-Smtp-Source: AMsMyM7EwImswx7nxZ3yFvW+mGYZbG+faPF83VvMPRxgDAtIWY4pVSQysYvPcLUq3C9ilt8FacfQeA==
X-Received: by 2002:a17:902:e74c:b0:177:f3be:2812 with SMTP id p12-20020a170902e74c00b00177f3be2812mr3097627plf.123.1664453474898;
        Thu, 29 Sep 2022 05:11:14 -0700 (PDT)
Received: from [10.4.189.225] ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id n26-20020a63971a000000b0043b565cb57csm5389706pge.73.2022.09.29.05.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 05:11:06 -0700 (PDT)
Message-ID: <1755ade9-9333-4dc2-dd06-eb1f87d6b30d@bytedance.com>
Date: Thu, 29 Sep 2022 20:10:42 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v3 2/2] LoongArch: update local TLB if PTE entry exists
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: maobibo@loongson.cn, chenhuacai@loongson.cn, songmuchun@bytedance.com,
 david@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, chris@zankel.net, jcmvbkbc@gmail.com
References: <20220929112318.32393-1-zhengqi.arch@bytedance.com>
 <20220929112318.32393-3-zhengqi.arch@bytedance.com>
 <CAAhV-H76pOCs2uAA6y1JB+-uwASDBTWk-zaheGdG+ap-4HUZxA@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAAhV-H76pOCs2uAA6y1JB+-uwASDBTWk-zaheGdG+ap-4HUZxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2022/9/29 19:42, Huacai Chen wrote:
> Hi, all,
> 
> Should this patch go via mm tree or loongarch tree? If via mm tree, then

Both are fine for me. Hi Andrew, can you help to apply this patch
series?

> 
> Acked-by: Huacai Chen <chenhuacai@loongson.cn>

Thanks. :)

> 
> On Thu, Sep 29, 2022 at 7:23 PM Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> Currently, the implementation of update_mmu_tlb() is empty if
>> __HAVE_ARCH_UPDATE_MMU_TLB is not defined. Then if two threads
>> concurrently fault at the same page, the second thread that did
>> not win the race will give up and do nothing. In the LoongArch
>> architecture, this second thread will trigger another fault,
>> and only updates its local TLB.
>>
>> Instead of triggering another fault, it's better to implement
>> update_mmu_tlb() to directly update the local TLB of the second
>> thread. Just do it.
>>
>> Suggested-by: Bibo Mao <maobibo@loongson.cn>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   arch/loongarch/include/asm/pgtable.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
>> index 8ea57e2f0e04..946704bee599 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -412,6 +412,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>>          __update_tlb(vma, address, ptep);
>>   }
>>
>> +#define __HAVE_ARCH_UPDATE_MMU_TLB
>> +#define update_mmu_tlb update_mmu_cache
>> +
>>   static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>>                          unsigned long address, pmd_t *pmdp)
>>   {
>> --
>> 2.20.1
>>
>>

-- 
Thanks,
Qi
