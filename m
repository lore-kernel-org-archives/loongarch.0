Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AA6230981
	for <loongarch@lists.linux.dev>; Tue, 14 Jan 2025 02:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736821634; cv=none; b=iSCdNfmF2+qdgPhVJFtsnO/lS0OEyGdYc5qRExXQmTh7WOI8o9RH5sy3TniKcvkCxtWsyQ6mAhISPeo6nGflB9MUpSov32K4Ti+NmaOKVDtWh2MUNYKN1Xcem/RkmZASBlMGP0ABnrDZemkj6Qh0ednZti6co1T3SL6kr4+t4qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736821634; c=relaxed/simple;
	bh=Hom/cNZrW7mjFJzUlYAAyuZtoR84A5mWMLCiREKQDso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6Xnp1BXw8CFt7p2PfG5L3ZuSuo3/gsTLy2BKD01IHIkHXYnlgmLdtyX/tb0JdX/ZqRw0cdI54snKu+ZM+leyqz+sbh9c+r6tHBW/VFPQr8rJ2nkZwTbFQpvn9QpTdKHYnmGU83xbLO3XCMwW8f578xu3bU4JkKuDrh0RYRsbIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QNqojjEK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QNqojjEK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21a7ed0155cso85186465ad.3
        for <loongarch@lists.linux.dev>; Mon, 13 Jan 2025 18:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736821632; x=1737426432; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3uCzTDF/NUXWi9pKun3Q1ZeVpbVlQmIUTgvJ2reRXQ=;
        b=QNqojjEKao+T0hq2by73Bhv3XxkZywkQplWGfFBqyn441Y/PORlE6q2Uu/IOUCF4Z0
         w0LTcX7lNPoIacC9py/UhwHqvPWrMq36UvdbVxyeNim3i4YiNj2NJl2Ec9fH10A34GuL
         NS03DKRPfERTb10BNfDT1HbzPypb9majlvvFGSHE4LZpv3DSe6hnFGx/XTPNa0Vf1yLy
         d8Q98TCwgXzaR0Ct4zGXwtsCZ/jSXSLeErXRi8doy0VOgEgQspuLGo+MXSczypBT4SWH
         5MXZhRm67v61Z2cpHyqSIOolxPnQ7qQUTWsyKyFi8nH3tMvY/peZtpCBsYqO9fcp2fSL
         DKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736821632; x=1737426432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3uCzTDF/NUXWi9pKun3Q1ZeVpbVlQmIUTgvJ2reRXQ=;
        b=F4cJdWmlFbDPoVN2/YlKZxTCl8LjHy3RkEQD9p/urGc1FapNZACsOMtvxO2O2Eg8F/
         ip3aPbRBI0SZRPOZIEq39keLU+iAQK6nIKi04PhiEvsWXZbuF/LBoOR9IbrQ51RTWdTh
         RzHGmcdAkYJHPkzLlC6Ajy0rwG825KaHzjDPmH8OWpqGFFq+VezrXk+oyNlVW/unLRBN
         +rqB7UUxmZm9ZHdMltfPoH5KYxiIh8vsrptLLYwqw1aOT3tSyf/9V0t5TAOSyDYivr82
         oNcUQZfkFXQue9c/bfD5DiGNYGHHkEZtcNdJgNe+mtkKisoawc0KROgGUYOIY07uVt63
         9dzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGdpf2+34AJHOP/6noivN/sW1Si0l5NjoFtzM4TI2fZXjJwfoiRSX1dn3SVnahJf/MR0D1ylfrKTU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzI/9KDMD4Y5ijAbtQLZNd3Nd6WLiVlErWMKwmmkSEW7KcVS/Vd
	4Zpyz9Q7VZcgpPtbEzC8tC2sS9282j2snFM+1Cmf0boNowK9E2mi9nY3hnBsrTk=
X-Gm-Gg: ASbGncvNgXvtJqUeNtGMKSJlGXwarvbWIscPEo/HR5WBhqj/aqz4L4uFrC5EqBJ1K54
	evZNv/2+gzJR1U/zthu2hh+SB7jblZ6KJGzq5OV8Jr/TISYjpo+iMjRjG19VTMA2+AqcBYHHz2b
	BsTJLV8SPCDpB39DyfsU0aAYOTjOaAh6zMSsm+eYbn6bT3mHhj0s9ISyze/ccDplep+jGn28WLk
	H+NX7xB1OJGZN+KD8S2HZo1DQbvaxDbAHF7X7Tr/iwGEY0GNc8MdVnVnczDft3uYoyd9N2gc8gS
	qIU/
X-Google-Smtp-Source: AGHT+IFszANM2ttg3bHXqwu4kokOxCLHcRwKXlC7FRtBmzrGdqYoySfArdJur+xTrJx3xY86w59zAA==
X-Received: by 2002:a05:6a20:7f8a:b0:1db:de38:294b with SMTP id adf61e73a8af0-1e88d2f6820mr38362107637.38.1736821632027;
        Mon, 13 Jan 2025 18:27:12 -0800 (PST)
Received: from [10.84.148.23] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056a5e8sm6847007b3a.53.2025.01.13.18.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 18:27:11 -0800 (PST)
Message-ID: <a017d072-943f-4008-bb1d-7be438804a44@bytedance.com>
Date: Tue, 14 Jan 2025 10:26:54 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d level
 page table
To: Will Deacon <will@kernel.org>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
 alex@ghiti.fr, andreas@gaisler.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, aneesh.kumar@kernel.org,
 npiggin@gmail.com, dave.hansen@linux.intel.com, rppt@kernel.org,
 ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
 <20250113162600.GA14101@willie-the-truck>
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250113162600.GA14101@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Will,

On 2025/1/14 00:26, Will Deacon wrote:
> On Wed, Jan 08, 2025 at 02:57:21PM +0800, Qi Zheng wrote:
>> Like other levels of page tables, also use mmu gather mechanism to free
>> p4d level page table.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   arch/arm64/include/asm/pgalloc.h |  1 -
>>   arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
>> index 2965f5a7e39e3..1b4509d3382c6 100644
>> --- a/arch/arm64/include/asm/pgalloc.h
>> +++ b/arch/arm64/include/asm/pgalloc.h
>> @@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
>>   	__pgd_populate(pgdp, __pa(p4dp), pgdval);
>>   }
>>   
>> -#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
>>   #else
>>   static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
>>   {
>> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
>> index a947c6e784ed2..445282cde9afb 100644
>> --- a/arch/arm64/include/asm/tlb.h
>> +++ b/arch/arm64/include/asm/tlb.h
>> @@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
>>   }
>>   #endif
>>   
>> +#if CONFIG_PGTABLE_LEVELS > 4
>> +static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
>> +				  unsigned long addr)
>> +{
>> +	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
>> +
>> +	if (!pgtable_l5_enabled())
>> +		return;
>> +
>> +	pagetable_p4d_dtor(ptdesc);
>> +	tlb_remove_ptdesc(tlb, ptdesc);
>> +}
> 
> Should we update p4d_free() to call the destructor, too? It looks like
> it just does free_page() atm.

The patch #3 introduces the generic p4d_free() and lets arm64 to use it.
The patch #4 adds the destructor to generic p4d_free(). So IIUC, there
is no problem here.

Thanks!

> 
> Will
