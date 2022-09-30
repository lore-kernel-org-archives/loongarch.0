Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60E5C85
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 23:09:58 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id c24so5158839plo.3
        for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Z4pwa9gyuRqjS+eeSbjJShInrhr7/HchgUX3g2MI7Qo=;
        b=01waiXwd4MZZ3LxATVL4IG9OwNkJnPrCk6JCJfUK6fYGRGtzxqTn80VoU4hkFv5Bvj
         tSDZXiVqNe/DfdolbG41gqqxsKHSkdPeDtbNirtpDDbQBgewyvQyx/p8il0/gl6YLHV6
         2P9sxjONLCnqVVU1NlApiEDi6364RosQmn+8cKQMnqHIOF0Vd+s/HGwmG9DAiuUq1G+z
         K1Bj/0xD69fu+X+CnSbrhW/cKk1+t3KKs40AraRyErM/yQmcMHzdEOnkiGBTMYWc51h9
         oMFtVbwqRzZre/YbhLC4lL5q3pZPgOCrOLcg9/diNqio32s3NwQ2n+wz6jf/C3N6/Zy5
         kawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Z4pwa9gyuRqjS+eeSbjJShInrhr7/HchgUX3g2MI7Qo=;
        b=uVt+iiDQQP+Nsnu/4g/0dSC5XOOpJGQvzwHxW19yvNCnwZpQxIEOf2OHYuCSw4kQIg
         QS+skeGEWVEaxVsYGEMkxStkn++WyuEwxcIhOkRHGzlWe9G+kYwXzce6PpvmmMvd1dRt
         sk0vNagb42i3heYM3de+J7nNHQK32xzJsU4mUKopqHTr3aiSoK7jXv6wiAy8srbidmW2
         SQeNMfIU5hnTJuWB7980y+3vyY1YrQ9N8aXyAuNSwh15enUSrM2kj2vD3n2a3brp77jc
         NQtdghmUP/XF7O6x9Kh0T95Q5RaSB3POvJAT8xYNcEpNgNQMx9KuOBto0a3gM3fbK5fP
         Umgg==
X-Gm-Message-State: ACrzQf0Jt4RbkWuzFdyfXHk8G1saRy4opVJAZHrR4zu5BqCJPgn7M3rm
	EIe0ll9Jv0hPbLgA6ZlrpLY7Gw==
X-Google-Smtp-Source: AMsMyM4TdHJBditr2nIJON4fzX9DhjVKj8xdWhyvXPRvQd0oWhWzm/OKUm1lhy3laeebjv0gu19+kw==
X-Received: by 2002:a17:903:1c5:b0:178:44cd:e9c with SMTP id e5-20020a17090301c500b0017844cd0e9cmr11481864plh.132.1664579398319;
        Fri, 30 Sep 2022 16:09:58 -0700 (PDT)
Received: from [10.4.189.225] ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id m13-20020a65564d000000b00442c70b659esm1261782pgs.91.2022.09.30.16.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 16:09:57 -0700 (PDT)
Message-ID: <1a679784-542f-1ab7-7ba8-3d560c264479@bytedance.com>
Date: Sat, 1 Oct 2022 07:09:50 +0800
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
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, maobibo@loongson.cn,
 chenhuacai@loongson.cn, songmuchun@bytedance.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, loongarch@lists.linux.dev,
 chris@zankel.net, jcmvbkbc@gmail.com
References: <20220929112318.32393-1-zhengqi.arch@bytedance.com>
 <20220929112318.32393-2-zhengqi.arch@bytedance.com>
 <0fecbcdc-7324-2d76-8452-b60b4638d074@redhat.com>
 <32a53a8f-f6f8-6efc-a5f6-a004ffab8c99@bytedance.com>
 <673e494c-eb91-470a-026b-59e414d0916e@redhat.com>
 <20220930153135.164240eadc71ddf94d8200fb@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20220930153135.164240eadc71ddf94d8200fb@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2022/10/1 06:31, Andrew Morton wrote:
> On Fri, 30 Sep 2022 10:44:21 +0200 David Hildenbrand <david@redhat.com> wrote:
> 
>>> Oh, this is better. Hi Andrew, do I need to resend the v4?
>>>
>>
>> I assume he can squash it, most probably no need to resend. :)
> 
> 
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> Subject: mm: use update_mmu_tlb() on the second thread
> Date: Thu, 29 Sep 2022 19:23:17 +0800
> 
> As message in commit 7df676974359 ("mm/memory.c: Update local TLB if PTE
> entry exists") said, we should update local TLB only on the second thread.
> So in the do_anonymous_page() here, we should use update_mmu_tlb()
> instead of update_mmu_cache() on the second thread.
> 
> As David pointed out, this is a performance improvement, not a
> correctness fix.
> 
> Link: https://lkml.kernel.org/r/20220929112318.32393-2-zhengqi.arch@bytedance.com
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Cc: Bibo Mao <maobibo@loongson.cn>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Huacai Chen <chenhuacai@loongson.cn>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>   mm/memory.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/mm/memory.c~mm-use-update_mmu_tlb-on-the-second-thread
> +++ a/mm/memory.c
> @@ -4136,7 +4136,7 @@ static vm_fault_t do_anonymous_page(stru
>   	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
>   			&vmf->ptl);
>   	if (!pte_none(*vmf->pte)) {
> -		update_mmu_cache(vma, vmf->address, vmf->pte);
> +		update_mmu_tlb(vma, vmf->address, vmf->pte);
>   		goto release;
>   	}
>   
> _

Thank you very much! :)

> 

-- 
Thanks,
Qi
