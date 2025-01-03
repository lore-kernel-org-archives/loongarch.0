Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413679E1
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 03:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876610; cv=none; b=Se+R3nQY3LMaibW2jU2/AWyRCnRGyjDIMPyRjvn18yBqWv0M8iEStoiSDt9eyxhL1spdyuYYzbOOd0B6+9oHnF9RwiICGaLA5uApM/wosgy7/oTjRcjAGsrRL8el2qj+05Ue194OXFXv6rCzJSd/tqZB3ej36B3YS9Q+MJJy6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876610; c=relaxed/simple;
	bh=1jkG8vOEuzvlWn7ntVxS/sK5whSZ5XgibAKAEgNYiaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0xj5ErjgvTzysEl+a17wtiTvsxfYtWkQ0Gqju1M8npTCDp8v/Rj1CBj8awlRF5O0xGbiKGyiK8iN5LUjIr6UXxpLU/SqgGzrO3nYvPMC6DKVUoi0XdeE4p0VRsvAwnFJED7enZ6cc2Ba04S119gbzZKv1LkNMKNen9DqkGj1YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hC8uwXJH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hC8uwXJH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216401de828so154144355ad.3
        for <loongarch@lists.linux.dev>; Thu, 02 Jan 2025 19:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876607; x=1736481407; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
        b=hC8uwXJHEIcjyy/zALi2Ial7HRh4+zYuuDHqOGbLixM9CQNYccjDxsTuHIjzZT1sPH
         Q7XIYEuatCGRP4ziCAVmXzPNXHFcc1+IbMm/ZywJI1Xj7V1ZH1Q8o/H0qsB7JAMu8Pu6
         FQmx8JqNuWKZdvnufER1I3+WRjNV5P+rLDEG6bUW42I0tt8iEMITMyRRv3g3GmhfhQIY
         fqW1HsgMYW9NtTuWceyJkFHNz1mb+e+F7ccX45K+OJO4Tzvw0cMoErWYfu8g/2OpYMeG
         pO/xI376y+Vbf2TvLCh1Umo60RYmk32TCRXDyzB8b+q8H3BGlWetQ3BRlHDzGVd5+8Gm
         l6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876607; x=1736481407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
        b=wHEiopFxDj05Tpet96VB3GdbCQ29yIJphMMLtWxu1c0AoQPmAYiHkvK8ziSFeKuvkC
         606nEWyRDX3S5I+BFVWttYQI8r/VFHw1Nu5PJaaEAewhCPIaC1g+fnImvhtdWGOYCNc2
         ilRBWQmEaUvpwonz2ifS3p6vyvhvAJ0DR7A1myn2sSTD+oHEnj1+iMWtG+1WXFiCmd8e
         VOsG0VeXvHEnWLsOW/CceeBXeoKm3SEk+U2zE1FLcFJeH8FGwFGXa/RBasVdsL/751xW
         EA9lo6BKdjiJbi6uvanmaAkvG8Tm4riqNTfu1D5kMXAwhee/Hges5foDuopN9y2Wh16X
         Ll1w==
X-Forwarded-Encrypted: i=1; AJvYcCUaD/bIWNyeCMdsjg0MhClMS7xQUqmfvLZx9MGxRHgjKVId1mwgW7DZL/FHcPnCXMlgiofv1paQ1G0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpMI4gMoY5ATnWIVJ62np6nPPjOmdqPG+0NDGaMez+dOa0lN6I
	Q2qe8yr4pV/5x9wszLnqqlMlROz3u8xMhwBNZ/Y94RjQ+a/7pyiDGle6Q+UJXX4=
X-Gm-Gg: ASbGncsNNdv+vjPDgrv2oihqgvG+cgZirlEJ0/I3GbdOwCCrkPnKLQnyjvO19el7s/L
	q4paE0wWMUyYb8xFuENruUzqLBHXnL5EqaK4sEl2z3bfnA8HLMZQlk4oOyB188NK0Os3nR6abc/
	ZAKXAQSxHhpxxqnGFloqMYTBDZiXxWN4rZ8rGKzEaMs42C8NfP7E5jg8xT9juxBpqmfEjuJTef4
	aiANGUL7sPMmwZWTl/NAHpCDcyFWS/Gz8SHt98iaGU3u0y7/RyAUD8zou1IXmHf5lhMG7sGw5m0
	10LWSA==
X-Google-Smtp-Source: AGHT+IEc/ggyHLTYoMeUluV4bigOVwXpofNkIsaBMCcId3pHP1FalWdw/+NGvDWYCJeax838Cotn8g==
X-Received: by 2002:a05:6a21:158d:b0:1e1:ca91:b0e3 with SMTP id adf61e73a8af0-1e5e0800420mr68823527637.36.1735876606776;
        Thu, 02 Jan 2025 19:56:46 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbafesm25847661b3a.128.2025.01.02.19.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:56:46 -0800 (PST)
Message-ID: <1cea8c66-626e-434f-aafd-9d44d37f5cc4@bytedance.com>
Date: Fri, 3 Jan 2025 11:56:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] move pagetable_*_dtor() to __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/3 01:00, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> Qi Zheng (13):
>>    Revert "mm: pgtable: make ptlock be freed by RCU"
>>    mm: pgtable: add statistics for P4D level page table
>>    arm64: pgtable: use mmu gather to free p4d level page table
>>    s390: pgtable: add statistics for PUD and P4D level page table
>>    mm: pgtable: introduce pagetable_dtor()
>>    arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    s390: pgtable: also move pagetable_dtor() of PxD to
>>      __tlb_remove_table()
>>    mm: pgtable: introduce generic __tlb_remove_table()
>>    mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
>>    mm: pgtable: introduce generic pagetable_dtor_free()
> 
> Aside from the nit on patch 4 and the request for clarification on patch
> 10, this is looking good to me, so for the whole series (aside from my
> own patches of course):
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

Thanks for your review!

> 
> And happy new year!

Happy New Year!! :)

> 
> Cheers,
> - Kevin
