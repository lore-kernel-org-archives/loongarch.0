Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC81107
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664526644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CdgI6o1JPgGkTG2jpG4T+E2PTeCFnRXsC1gUO71n9I=;
	b=dD7fr+tJnkexZPMtfY4/LScqcl1+FoheTFb2vNRDCa5oiztBSLlpvaAhlq7rR0xt3NGB/i
	n7avFQBiHUZvX42Vrae+leBAJB99SyXR6rCx3eERgHQJlvKJvw9OCC1zSNTTYmKvMLk0zO
	R2mQNx//W+VxWbUSEUxFNdG61mGpZUc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-QwNGo629N6OI4bMCdX6y6Q-1; Fri, 30 Sep 2022 04:30:41 -0400
X-MC-Unique: QwNGo629N6OI4bMCdX6y6Q-1
Received: by mail-wr1-f72.google.com with SMTP id r23-20020adfb1d7000000b002286358a916so1299410wra.3
        for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 01:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=8CdgI6o1JPgGkTG2jpG4T+E2PTeCFnRXsC1gUO71n9I=;
        b=SFbqe5NwXXzd4cYAQGeLIMGz0TCAf8PKLBW2pbcg+uTolZnQo68XFoQab7iShHFbYT
         IhdkqLBR5r7NZajJCCTxj8D/nCcfVZNn32OBIJ6HRGJls56dyYRD7GIvELm+5Am/OrLZ
         mNgHD94uZn0fw+wDwl+l7KCOTqVXA382wGpjDg55h4sfegOcJHNkuu2lolg9cn1Vk4+c
         CTezfDcplBPWFH93wsoTuKNrlnXJgB3BTPSHRSEVwwwOPgiT1h2Iqp4X0KzHOblCpQI4
         G5zmDoKvzPzQ2bjX6GS5eKl9Fxji5/nnI9Q1FNanZNWQQiUsjHQ/0UNhubkwl2c3EZ89
         trcA==
X-Gm-Message-State: ACrzQf3Tj5iUa1yIjHTAYbfyYwzRdMChOuNVss4yY4UPAfYc//aJ7fu4
	s0B68KgXyis26aorF9weKIH5+P9S4oHuKit0D5/wCU4P7gqk9/+QLsLF/fXywtAzP5e1/ez5geo
	F12sIs7eLrfNDNPL5XLR2
X-Received: by 2002:a05:600c:4606:b0:3b4:62b3:150b with SMTP id m6-20020a05600c460600b003b462b3150bmr5203337wmo.3.1664526640614;
        Fri, 30 Sep 2022 01:30:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4kmodJuSR/XONK5ttvI7YsCPMg21LO5DNNlzVaGbZhkWg+ApaqDuIWh4iZiTNEO8Ds1O8B1A==
X-Received: by 2002:a05:600c:4606:b0:3b4:62b3:150b with SMTP id m6-20020a05600c460600b003b462b3150bmr5203316wmo.3.1664526640331;
        Fri, 30 Sep 2022 01:30:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:c00:48b:b68a:f9e0:ebce? (p200300cbc70c0c00048bb68af9e0ebce.dip0.t-ipconnect.de. [2003:cb:c70c:c00:48b:b68a:f9e0:ebce])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b003a2f2bb72d5sm8546677wmq.45.2022.09.30.01.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:30:39 -0700 (PDT)
Message-ID: <0fecbcdc-7324-2d76-8452-b60b4638d074@redhat.com>
Date: Fri, 30 Sep 2022 10:30:38 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 1/2] mm: use update_mmu_tlb() on the second thread
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
 maobibo@loongson.cn, chenhuacai@loongson.cn, songmuchun@bytedance.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, chris@zankel.net, jcmvbkbc@gmail.com
References: <20220929112318.32393-1-zhengqi.arch@bytedance.com>
 <20220929112318.32393-2-zhengqi.arch@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220929112318.32393-2-zhengqi.arch@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.09.22 13:23, Qi Zheng wrote:
> As message in commit 7df676974359 ("mm/memory.c: Update local TLB
> if PTE entry exists") said, we should update local TLB only on the
> second thread. So in the do_anonymous_page() here, we should use
> update_mmu_tlb() instead of update_mmu_cache() on the second thread.
> 

Maybe mention here "This only affects performance, but not correctness."

Acked-by: David Hildenbrand <david@redhat.com>

> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/memory.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 118e5f023597..9e11c783ba0e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4122,7 +4122,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>   	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>   			&vmf->ptl);
>   	if (!pte_none(*vmf->pte)) {
> -		update_mmu_cache(vma, vmf->address, vmf->pte);
> +		update_mmu_tlb(vma, vmf->address, vmf->pte);
>   		goto release;
>   	}
>   

-- 
Thanks,

David / dhildenb

