Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF363C5
	for <loongarch@lists.linux.dev>; Tue, 28 Feb 2023 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677599795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
	b=L7YliKV/d3202CCEuU9Fu2ac86tPOoUC+750FU1UZiFNnKKVsSvv9T7SgjZOSG/zn0wRsS
	KY458A7FWA74fitA5SLEBpgpLgM7VD7z6cx4ectDFvde8wsW2gXG2GVzJ6wVslmhqI/Rb1
	YK4AHB1E0McrSW3VjATaBEavJpoDBjY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-yjgbTuwsMmCUBB-6Zu172Q-1; Tue, 28 Feb 2023 10:56:34 -0500
X-MC-Unique: yjgbTuwsMmCUBB-6Zu172Q-1
Received: by mail-wm1-f69.google.com with SMTP id 4-20020a05600c024400b003eb2e295c05so3791656wmj.0
        for <loongarch@lists.linux.dev>; Tue, 28 Feb 2023 07:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
        b=ep+p9mG7d2NMqS/9TWyR4V0CsefsOFKMFFyW6yVxQEM6x1syWN44T89t3RgnaylTLn
         M5cRJczCQz+7fNCtZmB0hBthcS+0K31sMxHO+wcwm2L/0jpZbLlvQzUK+eKfQy8yIPX7
         wCawHTsKGd24szAsiPCbfFMQlkDEinRGjrkBs8mXa6vZ1u/cHRedjqInYQ6waAiHrGKE
         LersbxOHCsYUaJLpPwLPbElVTfCUuGMtrr5f6Vv9mnqIk8nvKoBpBhGRtFtwj0mCR8JZ
         T2dWjQ4B5Zk5TgfjszeCcjcLDpez9BVacXGApXeqE6AuawBaoaY0PjT97Qfq++xSZTvV
         o41g==
X-Gm-Message-State: AO0yUKUd+j/Yt8H/GZPE6fHJqKb6JXYWRkXTBo2KK2yxYMQLUNklZFtj
	83Giap75gYoeVWZar7QjwCTtonHx+aV6tKUXHBJ8YauvZAWCJyxokAx7cENpw3J84u0kRJRlYs3
	gRM4C0qFRn6p0jIBDYJSn
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985235wmb.12.1677599793385;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/U2v9f8GltbBAhuiD5VLcyopD+EwumVs1dLk0qMzdF/fI8DkaFn74NX3LW8zhnIM6FtbCCQg==
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985221wmb.12.1677599793078;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac? (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de. [2003:cb:c706:b800:3757:baed:f95e:20ac])
        by smtp.gmail.com with ESMTPSA id hn6-20020a05600ca38600b003e21f01c426sm13465165wmb.9.2023.02.28.07.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:56:32 -0800 (PST)
Message-ID: <bd656b2c-9a20-dea9-dcef-9cc965bccc9e@redhat.com>
Date: Tue, 28 Feb 2023 16:56:30 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH mm-unstable v1 19/26] riscv/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 hughd@google.com, jhubbard@nvidia.com, jgg@nvidia.com, rppt@linux.ibm.com,
 shy828301@gmail.com, vbabka@suse.cz, namit@vmware.com, aarcange@redhat.com,
 peterx@redhat.com, linux-mm@kvack.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
References: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.02.23 16:50, Palmer Dabbelt wrote:
> On Fri, 13 Jan 2023 09:10:19 PST (-0800), david@redhat.com wrote:
>> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
>> from the offset. This reduces the maximum swap space per file: on 32bit
>> to 16 GiB (was 32 GiB).
> 
> Seems fine to me, I doubt anyone wants a huge pile of swap on rv32.

Patch is already upstream, so we can't add tags unfortunately. Thanks 
for the review!

-- 
Thanks,

David / dhildenb

