Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F5E1F3FE8
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104020; cv=none; b=FQ5lGmmnrunk4lgGeEAzwvl8espcXwHZ5KkeVPxDE71vFJL+IxAJeFVjs/joWlFAis3cXg5Ii3A0iM5iD9hvIZus/4L7E2ZcLqpAiRnokPFcsy6t7qeRzeLCrtfYHMj5voPHQ350CW3PrOFP1ObI6RuEzhPXhbnwMx0DQIAXKFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104020; c=relaxed/simple;
	bh=bzeFKix16H6AR7c25plvNC6hswXve1/a+mJcJ3UZEJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhF2KNLPjhzE67sWxwBERwebl0lJfbsQhPfq0y3fxuWzamDPo+FtDF2v+/32A9IXnLozNypegSopICjGua1j2nOMaJEVZnX1QZVGBJoMZ4M/vtcH83haSUdoNc8cjaaVUljD+siuRyuMz4CPuA+Z45iI/oN/ZIxd8LAjlSXz+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=B3CiM7lM; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="B3CiM7lM"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so392974a12.3
        for <loongarch@lists.linux.dev>; Wed, 04 Jun 2025 23:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749104018; x=1749708818; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn7NBr5TJWjNI8T2dY/UzcUhiHMyl/nutXcvd+GUfmM=;
        b=B3CiM7lMQFYS12V/BEYZ6zpOnWiE5Ke/qUooWywfOjB8PfDsTpHzAjCHQHNlrF/V7w
         XaGVskJf2K1Vqetu4N2Tak1EOG1M7fzSFnooSzU02VM6mzcgNCOtubB5vDEgVg1vngZ6
         wosVVwpLb5vFsIE3CKJmnTJ44SdUHCeEG4/nJhnKOc/4AKmep1BBkcUv3f5CxGaUo+uv
         ErgzrOqboCAtI2v0NcfkOXpQaFmvxwF23u63AEk5pwG8GaPMVHOeNj8M/5FUY3hk2fWw
         zLQL00p1ns936goe3Qf56wwfEKw6P6YmOtxeWMNn1N3aYBm6k+Dok+V4gm1AYU1bE+Xw
         66eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104018; x=1749708818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hn7NBr5TJWjNI8T2dY/UzcUhiHMyl/nutXcvd+GUfmM=;
        b=rZS9Fq9KO4Bkpd615r92HkPYSQOeLUaWiWP6vv7/y3JhDsjx3poBOr7hNmKfDjQqwh
         4A9GqGBU7yO/0UNA4ow0iewGRTSIUEqjt595nBtwkOsQ4zA+1+NUnOUMXFRwCGiXieCZ
         yLJDqd74wPgLkIAlNYUACz14qCvqcXpsfIEEHtst9nPmLZorHtOFCKbsr5nMcDi7o5iW
         C8qCkpfps5kQBF5TXtawB9H1FN2Kgqosj9Kr9VKutgoXlv8cvjfLxZeACV4zvNX0Hpf/
         Qe3MiMahDrLMssIzp8vVjux2yePmXQkbKmq3LQ1Ad1FUqv2V4Tg/f4nAbgxMhnPwnZK4
         IpOw==
X-Forwarded-Encrypted: i=1; AJvYcCV4vMzb+1UIl+lN9924zPf3BnEttfmozGmP5DnGl1eKClZBhdA2esNAPd7VVfGbcab+lVQrjJm1wm8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Ux7EvGcQTHyr1JDsxE9BbR98ko5qCE+DrZ28snpLX7entdK6
	4Unjo5Hyq+4/HKse/49aBMLmzEFTlvIcfpoQ/dPEVh3rcB6T13oLdb+YTweHT/hRFMA=
X-Gm-Gg: ASbGnctbYgVewcA9/9heqPido/Z9ppy/XV3zYxTeEAliwT+JAmse8GtFm2du/s3uvoU
	nEfHqMj8bb3KbNLG4Le031R7vlkCXqFueV8hPAJwt1pvbxg4vcueC67y/K5YI5kTBaFTEGJVpz/
	4J9FNekNAFiBiOKMQ3BfKBnWxKGDaBE2sxH3fOkKyEZkoawIOvqGkaTOdBcwboA4k06LrdojTxQ
	5eTFgX0tlKBmCcDo/aR8BzvjCCaBnNnGYN8l9iDXijgkGptfv7DQx3dZZPJzBEjCs0cmBzrVRNU
	e0nfSiT1qhDBuN1151+qMi9c+RbgFhuxBMmnNFnahzXBVS7w1FhrENIUwRrpxfli7UbAWm4bB9Q
	=
X-Google-Smtp-Source: AGHT+IHDy86FEw+vzJcbrf39p87S4pydRZ7lyu+1r5y5V92k7PKGXeaSlNE+WkPTO7jTgdMiiqKipg==
X-Received: by 2002:a17:90b:5290:b0:311:9c9a:58c5 with SMTP id 98e67ed59e1d1-3130cd146e2mr10841635a91.12.1749104018411;
        Wed, 04 Jun 2025 23:13:38 -0700 (PDT)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313319020e0sm477078a91.12.2025.06.04.23.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 23:13:37 -0700 (PDT)
Message-ID: <1fd82421-90ad-4952-8fc0-77859f861570@bytedance.com>
Date: Thu, 5 Jun 2025 14:13:27 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Barry Song <baohua@kernel.org>, David Hildenbrand <david@redhat.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jann Horn <jannh@google.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/25 10:19 PM, Lorenzo Stoakes wrote:
> The walk_page_range_novma() function is rather confusing - it supports two
> modes, one used often, the other used only for debugging.
> 
> The first mode is the common case of traversal of kernel page tables, which
> is what nearly all callers use this for.
> 
> Secondly it provides an unusual debugging interface that allows for the
> traversal of page tables in a userland range of memory even for that memory
> which is not described by a VMA.
> 
> It is far from certain that such page tables should even exist, but perhaps
> this is precisely why it is useful as a debugging mechanism.
> 
> As a result, this is utilised by ptdump only. Historically, things were
> reversed - ptdump was the only user, and other parts of the kernel evolved
> to use the kernel page table walking here.
> 
> Since we have some complicated and confusing locking rules for the novma
> case, it makes sense to separate the two usages into their own functions.
> 
> Doing this also provide self-documentation as to the intent of the caller -
> are they doing something rather unusual or are they simply doing a standard
> kernel page table walk?
> 
> We therefore establish two separate functions - walk_page_range_debug() for
> this single usage, and walk_kernel_page_table_range() for general kernel
> page table walking.
> 
> We additionally make walk_page_range_debug() internal to mm.
> 
> Note that ptdump uses the precise same function for kernel walking as a
> convenience, so we permit this but make it very explicit by having
> walk_page_range_novma() invoke walk_kernel_page_table_range() in this case.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
> v2:
> * Renamed walk_page_range_novma() to walk_page_range_debug() as per David.
> * Moved walk_page_range_debug() definition to mm/internal.h as per Mike.
> * Renamed walk_page_range_kernel() to walk_kernel_page_table_range() as
>    per David.
> 
> v1 resend:
> * Actually cc'd lists...
> * Fixed mistake in walk_page_range_novma() not handling kernel mappings and
>    update commit message to referene.
> * Added Mike's off-list Acked-by.
> * Fixed up comments as per Mike.
> * Add some historic flavour to the commit message as per Mike.
> https://lore.kernel.org/all/20250603192213.182931-1-lorenzo.stoakes@oracle.com/
> 
> v1:
> (accidentally sent off-list due to error in scripting)
> 
>   arch/loongarch/mm/pageattr.c |  2 +-
>   arch/openrisc/kernel/dma.c   |  4 +-
>   arch/riscv/mm/pageattr.c     |  8 +--
>   include/linux/pagewalk.h     |  7 ++-
>   mm/hugetlb_vmemmap.c         |  2 +-
>   mm/internal.h                |  4 ++
>   mm/pagewalk.c                | 98 ++++++++++++++++++++++++------------
>   mm/ptdump.c                  |  3 +-
>   8 files changed, 82 insertions(+), 46 deletions(-)
> 

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks.


