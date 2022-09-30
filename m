Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E81FA7
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 08:46:58 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id bh13so3620893pgb.4
        for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8hK7dYqCKStIL8sNiRk1FpqChl0J32g8Nhctqg2nLuU=;
        b=0tjV8GrNIcboxZN4wrH7rM15rjMbLej1jbDVZn20VtYLNd94oVs8Ee8H7+Ja75Egbn
         eTGagY4VmQjDZUY1at7dEC4QKmyxPYV883Lfw3mFEN6+0nfwAJHn+hyF4AL/jiHU8aVQ
         wM46ngsECs1F+RXc/M4v48VjBLAqpoAWeRjuBQFJ9F/2F8Lcw/fHYHpXuzEIAzrv0c/B
         E0vbYefd+CZ47jSUtCMnP0adCr3cz+qQxbdkbV9AhMtTI2QtnVNByShqp9PQjwIfi2nr
         794otsl6AIoTr5szIeDhsdumZtzEtHjLmVUDSGNuOZ/BTc9467/MYPRdne+owNmq+11r
         pXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8hK7dYqCKStIL8sNiRk1FpqChl0J32g8Nhctqg2nLuU=;
        b=08NqXzmIJTVgzCBtAinBfZkctJhetus1qyqftS2Vn8RBnHsygIZgmig3rS28Pnzu20
         GdxbCczSsrgdos10LeyqUvx55MNi9VvuqyguC6IIaxHxT2g5X5o/XinU9NDm3tiAN9dK
         dmL6/VIrln48/9RogthKtlW+USWLoWzfSq4uPRcE42FFuvvoR4r7Lym9RTFrofryviwn
         7IEag/qh9IYOOZe3g0xgMQO30SU/Q7XSfgkVa75Y6W6dlMnuwl+Fsyns/vug34G8r7vK
         4V54P3F3P5vQNdoTqBGIWFeIPey7ZNpLGHioQLfup3AuYp0KG65+cLnmpVyy8UXb3Upw
         byAQ==
X-Gm-Message-State: ACrzQf2mfoI6DUY5Z2yt17HtPhnA5WQ1KxO2AJP7eAEGZjBIzW5RNDgx
	6ikrCWzmeQ9Zvnt5GXebVlU4Lg==
X-Google-Smtp-Source: AMsMyM5MsO7lJsf7zGV/70Gzqt+lyeK5x5cmUlNE18x3/SJYJwP6ccURIbPeCdRwNciVnzOezHod6g==
X-Received: by 2002:a63:df18:0:b0:43c:dbdb:2f24 with SMTP id u24-20020a63df18000000b0043cdbdb2f24mr6512793pgg.226.1664527617903;
        Fri, 30 Sep 2022 01:46:57 -0700 (PDT)
Received: from [10.4.189.225] ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902eb8c00b0016bf5557690sm1338450plg.4.2022.09.30.01.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:46:56 -0700 (PDT)
Message-ID: <ade0363a-3075-4410-62c2-4eaaa7cb3b76@bytedance.com>
Date: Fri, 30 Sep 2022 16:46:49 +0800
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
 <32a53a8f-f6f8-6efc-a5f6-a004ffab8c99@bytedance.com>
 <673e494c-eb91-470a-026b-59e414d0916e@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <673e494c-eb91-470a-026b-59e414d0916e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2022/9/30 16:44, David Hildenbrand wrote:
> On 30.09.22 10:43, Qi Zheng wrote:
>>
>>
>> On 2022/9/30 16:30, David Hildenbrand wrote:
>>> On 29.09.22 13:23, Qi Zheng wrote:
>>>> As message in commit 7df676974359 ("mm/memory.c: Update local TLB
>>>> if PTE entry exists") said, we should update local TLB only on the
>>>> second thread. So in the do_anonymous_page() here, we should use
>>>> update_mmu_tlb() instead of update_mmu_cache() on the second thread.
>>>>
>>>
>>> Maybe mention here "This only affects performance, but not correctness."
>>
>> Oh, this is better. Hi Andrew, do I need to resend the v4?
>>
> 
> I assume he can squash it, most probably no need to resend. :)

Got it. Both are fine for me. :)

> 

-- 
Thanks,
Qi
