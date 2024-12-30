Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4614AD20
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 03:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735528337; cv=none; b=CKvoyKwzakYvr8nmc+CS+FrSPjgGvZuXBAT5RKAB82YxN0PQHRd7HhXpxMb+nzgRxtAS/WGyeZ6nj0YgDuk6B9pEltcKzUlK08Y3vCSa/8doy8TWJQLEKMvdhnZTPvwPt3Dxjds4yOZoU+4jQM3dxHS7EZD+AiM4XQAY6GOI6J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735528337; c=relaxed/simple;
	bh=RByHVD3bvwf9OBgmvjYl7zmyuddvG3+m7GzmELh8Ojk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsCwKjsXLpGGkDYJ5gq8uLy4xJBoxzFTeN7NPwAioKmxD+QZUtzN1Y6s8GmMVlXV4JLQrUjJoABv8SgSbbTuFnTRKjAh8KtivgTKZwxNJYmRiY+Aw/MxB3iwmUhw7zsif05MLHyGrORRd4nrm9VaNyULb89Bfr9iVE6SMvePiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kAgX77uK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kAgX77uK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21a1e6fd923so54931385ad.1
        for <loongarch@lists.linux.dev>; Sun, 29 Dec 2024 19:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735528335; x=1736133135; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=kAgX77uKbBf4xg5uz4bjhfIn6ppyXms8PmJ7FKkAyRRKw1Gb3CeB95Sf93oeZrdR9t
         jrXIOlDEEIGCCLjIne9sYURvfyyOPBMnBiM2ru9ds82R/1AX9fp4xdZBEGc69vVzs8P8
         THsKP4brq6BmfeyLakiqyoKWBKnNqPfD5KPUPB9IHGNtnbq7ylzMjkyR24vtP5KvQ0ry
         3AmXqG50rZQuLxC5liVtya6LM05EyTq4DZMrcr7+5FQpnC5wQOXLiD51x2mijhRkW7TI
         I9RAczKS2MP/rNxtZwugBN4/2hscGzXR9ad6VGhadIpBed96uDEDCp43bUwWlzMBq9dB
         5NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735528335; x=1736133135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=fnPcXGa6Xf9eL13HrpKwJgdoqTEgrkvY3dxS/qVaIuqrSE5GZZBX+4DLtTEmyzU0Xr
         LsjUHMwswOrhrCsZoOmYlFpy4KbZT4VJ+YrN6eAANNEOa5Qi6FCnWHhxaxRltvrx0Zi2
         B/7/fovqpNs4UXPeQGWqrUNxFsy5tRYDl4aREpQgl09+522Xw4d3nWBZFZhmVtbaND8s
         QFYZpuGNb5ywovxH2eAyzDWoV1k9KVWlOxMLi4BHv3KmWQYiIgvwGN6gVpETN8aG0Y6v
         lCU8SQkMXyKW+C24negwog13lQssE25XkF8nT3QEDjb1Ruw7XOShn4taN8aiarmKosFP
         1LNg==
X-Forwarded-Encrypted: i=1; AJvYcCVqyiHxPAOvKX4tSduSKID1LbTIQVMUxQtp4XTsGiz1ycI++cUeY9KrRkWJ5SVyWTye+OhMNqPOwlk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb2qF04zVWv14bmIDF8DbnSiv/OGrHznRWR+rRj0z+5dZGs6xR
	rBWygMxD4jsGLYKIfPyUA3Qi0U9MO41Ob8qaFrjDmy6EbvtP29XlrjBzkdikmf0=
X-Gm-Gg: ASbGncsk3bPflNSt2e91TIHlnq8/ItQKlOMk/kqakTWw0kg25ZqBnpmQu0HGxydfq1M
	VvaVw3PtIwPhsZPgxL/QyYia3v2CCbfx4nwg/LnuAbwpCXWAGtoYalwlz5A/wc5m0DTa9OmJbjZ
	TWDpVxaTnI0LtZxxh7QgjL4gpMccck7e+hG2tm2tjmaKUL17YpwKt+KmfizNlR7tRa8GtXfk1lx
	XyLdYoBsqsXWfkD0imjJANjBgPvAzpw8a+C07GVbFOYEDhZb/hnNnE5i8sQqIp9jDs5su72unyy
	TOx9xg==
X-Google-Smtp-Source: AGHT+IHVtuGTDJKnXgo1JS5AtVrvj0I/cg1dyieo6seko5BYBtWvsXqnYPIAVAFKhaTndzKmWg8VgQ==
X-Received: by 2002:a05:6a20:9185:b0:1e5:7db5:d6e7 with SMTP id adf61e73a8af0-1e5e083f019mr66304616637.46.1735528334820;
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb45sm18191842b3a.88.2024.12.29.19.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Message-ID: <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
Date: Mon, 30 Dec 2024 11:12:00 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org,
 kevin.brodsky@arm.com, peterz@infradead.org
Cc: agordeev@linux.ibm.com, tglx@linutronix.de, david@redhat.com,
 jannh@google.com, hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z2_EPmOTUHhcBegW@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mike,

On 2024/12/28 17:26, Mike Rapoport wrote:
> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>> Here we are explicitly dealing with struct page, and the following logic
>> semms strange:
>>
>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>
>> tlb_remove_page_ptdesc
>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>
>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>> directly.
> 
> Please don't. The ptdesc wrappers are there as a part of reducing the size
> of struct page project [1].
> 
> For now struct ptdesc overlaps struct page, but the goal is to have them
> separate and always operate on struct ptdesc when working with page tables.

OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
intermediate products of the project.

Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
[PATCH v3 17/17] from the mm-unstable branch?

For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
can help do this in his patch series. ;)

Thanks,
Qi

> 
> [1] https://kernelnewbies.org/MatthewWilcox/Memdescs
>   

