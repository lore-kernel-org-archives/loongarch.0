Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596151FA7
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 08:43:16 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id c6-20020a17090a4d0600b0020958fcd9acso2370142pjg.4
        for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wJbYKGc9rVUqC784z1spy0gAYeIDAs7Zl7uyV0usPeU=;
        b=dVJtM1Aj+b/YJoEcHR+iLQPF1IwnZn9xe3IyYIvrAU2BZJASRsOmVWFRUX4ZgVCJby
         mK1boO8SEZe3oxZwDpzDSE9RwTirdRfJN3UNgrv0VzuLOMsQiw8q62dbQhVLkrDCVARH
         OuokrEP/EUvhrCEJLkeMJuJ5DIVSqVWa0vlDPXb5V37ay71s7+ZJoLkFdJW6XHPiNDvP
         x6qWgGFzO88wmfh3b00w4MXwO/OCdU0BFToopTHf3pnp/5vnrrlFcQcz2hleWdN0x7j7
         UAk4jFJLjWFahBTKKQbndcV9x+qDAsf0gZVtrbaKGd3RYIJylfEvQ0FqMKxTqBPvOwVK
         ZmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wJbYKGc9rVUqC784z1spy0gAYeIDAs7Zl7uyV0usPeU=;
        b=zwSpJMZ13y3NLAJ/PfWVFF3W4Dkd3M4IKpxihGhCQ4gpSAFhphgT5m/QlUMLs5/PEh
         SDjElbG8tuadIKAGOr3ANQwOoJgVkX7vFjuj/DfFwMBD7SJFXpTLL4ynNTEIM6IkQBBz
         3OTyo6h4X/XxnaNRD6uK0AxN8xxFxU1Z8QzjJeoqjaGX1uEzvldrRWfyCJENBp6Hl21Y
         d426l2FPGpjz5KKjp/NHJKS24n4HZuhILuCv4QCii0rz98FhU0eZMwc0K5548awBEtZo
         qNkhljOWOEuD8t3v6reeRhWGlaUNyM816+SwfCyocCZEPKhfemm4Mh/k/EIH/kUBOs5p
         BUdQ==
X-Gm-Message-State: ACrzQf3ahwWPFTxrsgndO6rnIJ3GY0kYlQatOoKSrlpvmb9D7qrXxxOR
	ADJmgockYF4bOtIaASO/XVhGMQ==
X-Google-Smtp-Source: AMsMyM4lfwpOYmzvjyE5qd/xRccqM4+9nhG8g9eMBg9vtMrkoILmi7ik1MCnu54/dTokJkSS4cr3Lw==
X-Received: by 2002:a17:902:ef93:b0:178:93cf:d267 with SMTP id iz19-20020a170902ef9300b0017893cfd267mr7757706plb.123.1664527395563;
        Fri, 30 Sep 2022 01:43:15 -0700 (PDT)
Received: from [10.4.189.225] ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id x10-20020a17090a2b0a00b001fd8316db51sm1170168pjc.7.2022.09.30.01.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:43:14 -0700 (PDT)
Message-ID: <32a53a8f-f6f8-6efc-a5f6-a004ffab8c99@bytedance.com>
Date: Fri, 30 Sep 2022 16:43:07 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v3 1/2] mm: use update_mmu_tlb() on the second thread
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 maobibo@loongson.cn, chenhuacai@loongson.cn, songmuchun@bytedance.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, chris@zankel.net, jcmvbkbc@gmail.com
References: <20220929112318.32393-1-zhengqi.arch@bytedance.com>
 <20220929112318.32393-2-zhengqi.arch@bytedance.com>
 <0fecbcdc-7324-2d76-8452-b60b4638d074@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <0fecbcdc-7324-2d76-8452-b60b4638d074@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2022/9/30 16:30, David Hildenbrand wrote:
> On 29.09.22 13:23, Qi Zheng wrote:
>> As message in commit 7df676974359 ("mm/memory.c: Update local TLB
>> if PTE entry exists") said, we should update local TLB only on the
>> second thread. So in the do_anonymous_page() here, we should use
>> update_mmu_tlb() instead of update_mmu_cache() on the second thread.
>>
> 
> Maybe mention here "This only affects performance, but not correctness."

Oh, this is better. Hi Andrew, do I need to resend the v4?

> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks.

> 
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>   mm/memory.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 118e5f023597..9e11c783ba0e 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -4122,7 +4122,7 @@ static vm_fault_t do_anonymous_page(struct 
>> vm_fault *vmf)
>>       vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>>               &vmf->ptl);
>>       if (!pte_none(*vmf->pte)) {
>> -        update_mmu_cache(vma, vmf->address, vmf->pte);
>> +        update_mmu_tlb(vma, vmf->address, vmf->pte);
>>           goto release;
>>       }
> 

-- 
Thanks,
Qi
