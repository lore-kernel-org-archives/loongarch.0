Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A245EED6
	for <loongarch@lists.linux.dev>; Wed,  6 Sep 2023 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693987712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jpgfei2mfNvSiBZbRRCl7P6mieU8IYIrOksXh8s484g=;
	b=PWEhUvHwAMI2jAggA2m0GAjhWmJ7ObBOk8MJxIyoCLo9xXeuzNXeGoa2l5KbsMZJFpLFhM
	guIASIf9oqy+rAXjc1xZPfqjlasmwbU4ojY6qjMXRccks3J/ruqWUmdKP//wIhkWhQEvZx
	RIqO7T8I4z/EWnZyOT/nbrtetSqqZzQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-56jeK8fTNpKiAghNFtJpeg-1; Wed, 06 Sep 2023 04:08:31 -0400
X-MC-Unique: 56jeK8fTNpKiAghNFtJpeg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-402493650c6so2637245e9.1
        for <loongarch@lists.linux.dev>; Wed, 06 Sep 2023 01:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987710; x=1694592510;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpgfei2mfNvSiBZbRRCl7P6mieU8IYIrOksXh8s484g=;
        b=Ddd3WFWzWHMr9Ggw8j8bPaoVRBaWJf4320p0I7KijI2dfuwLDLqe7XPQKqJBuUx41y
         8DFrZkW76JnzGud7RE1i+y4mJDPwo7cfGcqBq5KrqecEGTRXAP0y9ggCSiYbJbmon+LC
         gZRHBBLFVp+9al+zdBYa2hdHUnb/QKBCWh2BHS9cU61orDf01psr1zBPz5w1ffarW0tL
         SX6CEMk6Ktqs3/TUikvCM2dMZEECyu/ZXOjstEyVYiIkzlmf/prZJYZ9HciBMsUbMkJV
         a82lnXt1JpI4knXLTkmtRiJwqKBrBAhw9KcOzRFCN1ZM6ItRQpYPLrG7nhaSa3F+pQhs
         xmMg==
X-Gm-Message-State: AOJu0YxtF862PgHbh7OAc1KY+ZCCCvO5oCmVwqPupXwpT16sFmU5zykn
	aqdlN5zdI8+ZE7dS2q81TGCITqSdMZyznr/HBXrURaXAwna2kB7M45+1623xZZwMs8iGFegVouA
	1ZIZnZqE2ipWvDnJ0qZKl
X-Received: by 2002:a7b:c3d4:0:b0:401:b0f2:88d3 with SMTP id t20-20020a7bc3d4000000b00401b0f288d3mr1770321wmj.19.1693987709926;
        Wed, 06 Sep 2023 01:08:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgKRZGg24VAJlwi+mt8CWKv31c7AYMp2iY70qBNPHox6O/y3ikwfE9JXwExw0xYtzhhTh2sQ==
X-Received: by 2002:a7b:c3d4:0:b0:401:b0f2:88d3 with SMTP id t20-20020a7bc3d4000000b00401b0f288d3mr1770306wmj.19.1693987709595;
        Wed, 06 Sep 2023 01:08:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:6c00:92a4:6f8:ff7e:6853? (p200300cbc70c6c0092a406f8ff7e6853.dip0.t-ipconnect.de. [2003:cb:c70c:6c00:92a4:6f8:ff7e:6853])
        by smtp.gmail.com with ESMTPSA id p6-20020adfce06000000b0031ad2f9269dsm19826639wrn.40.2023.09.06.01.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 01:08:29 -0700 (PDT)
Message-ID: <a371b120-5536-1054-7f09-957b427e46ff@redhat.com>
Date: Wed, 6 Sep 2023 10:08:28 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] LoongArch: add p?d_leaf() definitions
To: Hongchen Zhang <zhanghongchen@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport IBM)" <rppt@kernel.org>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Qi Zheng
 <zhengqi.arch@bytedance.com>, "Matthew Wilcox Oracle)"
 <willy@infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
References: <20230905064955.16316-1-zhanghongchen@loongson.cn>
 <d6012fe0-9d06-f5ac-857c-c38034bf0758@redhat.com>
 <4a06f415-281f-b76f-ed03-211b07ccd6a4@loongson.cn>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <4a06f415-281f-b76f-ed03-211b07ccd6a4@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.09.23 10:06, Hongchen Zhang wrote:
> Hi David,
> 
> On 2023/9/6 pm 3:42, David Hildenbrand wrote:
>> On 05.09.23 08:49, Hongchen Zhang wrote:
>>> When I do LTP test, LTP test case ksm06 caused panic at
>>>      break_ksm_pmd_entry
>>>        -> pmd_leaf (Huge page table but False)
>>>        -> pte_present (panic)
>>>
>>
>> Probably there are other problematic bits without that can trigger that?
>> I suspect walk_page_range*() callers might be affected,
> I rechecked the code and found that other architectures that support
> THP have defined pmd_leaf.
> So there is not problem on other architectures.

I meant other walk_page_range*() callers on loongarch might similarly be 
affected. IOW, KSM might not be the only bit being able to trigger such 
panics on loongarch.

-- 
Cheers,

David / dhildenb

