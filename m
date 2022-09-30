Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7A1FA7
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664527465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5P7WxpX9YzqjSjpN3Cg4iRUb1rI33yeq0uhwQY+XFQ=;
	b=WMhdfp+bgC9eHY4MyuoN+Ak+dBCC85C1pLIxTeCrZVdMryET2lYt2TYY0j4HpNKQifpd9y
	0TB1nys5WypivgqxtqsBRD19BvMkwERfxVof8NY3xktcVb4vEz5U1yEGTZmDbCCt+zv2lm
	VQbQ4ronhI7QbE540uC2cjt2NzS5bRI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-AViVzGEOOgiLVnyWmBcp5w-1; Fri, 30 Sep 2022 04:44:24 -0400
X-MC-Unique: AViVzGEOOgiLVnyWmBcp5w-1
Received: by mail-wr1-f69.google.com with SMTP id p7-20020adfba87000000b0022cc6f805b1so1324524wrg.21
        for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 01:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=+5P7WxpX9YzqjSjpN3Cg4iRUb1rI33yeq0uhwQY+XFQ=;
        b=2QW9sb++PVmDuaVGVHnsuV08ydl2CmcDesZoojyRTleYC4wcw7CS/LprqYfyOOnLOR
         0JPbShO+SEOop3GJNJmJzJegHv8Lox+Ii4+CQMQ8aaqtBviAe35RwxWv50GJy3q+XpjA
         Bcwt93eRbB+5CQFJytdepoCv7YL1470Fb137z1Auh95M6QMehT5/cdDb/8IxES1yaG8m
         6JXONPK177GBZvlDlgPIrmmkb9yPgPwUprPDG2iCoPMfHPR2qfvCFogUT3LiUzMgiwde
         JVVpAVsTY0bHMV8VeBU4WY0MrRk4ad3C1wnhF8yOwXapRCUtNPaoCQAEKG4G5+WQR0ea
         GfKw==
X-Gm-Message-State: ACrzQf3krjudZBGT+gW0OHv4kQoAX63jSeqEmlG0THcPh5LPu1g/Tq57
	kMaeiuNYbZymIvx7SFgRCqSUR2YpvF7oPf73qDK0TBM6X9UHbBxz08EkeJK/k5KiG50VOuXNY4o
	O6m3A6pbg4b95zI2+QkbD
X-Received: by 2002:a05:600c:500d:b0:3b5:234:d7e9 with SMTP id n13-20020a05600c500d00b003b50234d7e9mr5096881wmr.57.1664527463087;
        Fri, 30 Sep 2022 01:44:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4lSPxx9RSmxEw3e5Wn9C1Knh20ngmmeuWzgTOZVepdksSmhhhH7ldVQWOsiUQ6w2s0/Weahg==
X-Received: by 2002:a05:600c:500d:b0:3b5:234:d7e9 with SMTP id n13-20020a05600c500d00b003b50234d7e9mr5096870wmr.57.1664527462765;
        Fri, 30 Sep 2022 01:44:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:c00:48b:b68a:f9e0:ebce? (p200300cbc70c0c00048bb68af9e0ebce.dip0.t-ipconnect.de. [2003:cb:c70c:c00:48b:b68a:f9e0:ebce])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d43ca000000b00228aea99efcsm1456462wrr.14.2022.09.30.01.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:44:22 -0700 (PDT)
Message-ID: <673e494c-eb91-470a-026b-59e414d0916e@redhat.com>
Date: Fri, 30 Sep 2022 10:44:21 +0200
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
 <0fecbcdc-7324-2d76-8452-b60b4638d074@redhat.com>
 <32a53a8f-f6f8-6efc-a5f6-a004ffab8c99@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <32a53a8f-f6f8-6efc-a5f6-a004ffab8c99@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.09.22 10:43, Qi Zheng wrote:
> 
> 
> On 2022/9/30 16:30, David Hildenbrand wrote:
>> On 29.09.22 13:23, Qi Zheng wrote:
>>> As message in commit 7df676974359 ("mm/memory.c: Update local TLB
>>> if PTE entry exists") said, we should update local TLB only on the
>>> second thread. So in the do_anonymous_page() here, we should use
>>> update_mmu_tlb() instead of update_mmu_cache() on the second thread.
>>>
>>
>> Maybe mention here "This only affects performance, but not correctness."
> 
> Oh, this is better. Hi Andrew, do I need to resend the v4?
> 

I assume he can squash it, most probably no need to resend. :)

-- 
Thanks,

David / dhildenb

