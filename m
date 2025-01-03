Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7796579E1
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 03:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735876453; cv=none; b=p8yYRbmENxD3dT4ExNHbuqspBJvIbz/F3wccQ+7L9xMOnKI/mIiZ7qpqAq8Qo2UOkXaV0dfO7U37+Nw+FPPKJJQCsT+jVSxkcI/opwIchMjkT4P7F9m0od0g0icMq0RkLwJa2m1itHuf2PqP9lqQV+tAiVxbW3u38882xjRhSdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735876453; c=relaxed/simple;
	bh=FQ5D1Kx+YlPJIwMGyXspAy7bXvtTs/Tb+GWLn9dccaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HT6lh+wPnUxXX8VzLLNBxDmx1osbNZ41Q66yhZPVlcBmQccGltcEXzLiZKsljMtbJmzY0K9PEfsLoloEIgtyYlw3yzM2I2cq8dlEJBKYJoEA08T3u8WYtcAvmZNf2pLeK7AxO2QlmzBlF+sbjZ2OBIwDeD2Lpnginxx0uwplzaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=l4TkHJQ5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="l4TkHJQ5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21670dce0a7so84146735ad.1
        for <loongarch@lists.linux.dev>; Thu, 02 Jan 2025 19:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876451; x=1736481251; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=l4TkHJQ5K7znjybwjyC0YjbRt11YL75p5cgfVvb1QKT3A/gfK+1psynh/n4yhPwnG9
         N48hz/lLKTbr4kL9OGF+007gFCVQuoib06TigcVxTqtc6npUdCwjKF1rWeKn+kauf/GY
         WFdjGG2bkyFQwpLLx9lt5ol9MbstNSdl4fGfxk4+M03Vh/bkivstXSatTL2+QNcYSZje
         7SOmLUhi8NuH0hOIMk6DtKaOEUE/JvHMgVvIiEpR2KWkpCK0NQfWZkcMglBkb0co/tgD
         ra1PA68nq+Y4P44/SfcpXy/2zQ+pbcx7LqFqB/erbaUwYUNQrBuYO3l77SWNaOW8dyf1
         wr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876451; x=1736481251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExtURrdtg4wvz/5S73kPKLfYL+g+cN7JWlBZcDSiUw0=;
        b=VrfPdY8LOAuNnNyPzTUsPzO0cpE47Bu6D+pg9bv8JYkxj1SXXq1DhJ0QaGRbOJYcFS
         CTSwVWK7XHnNSxCP/sal2UIHRkh/BHd3zCzhG2iTtPI5JJl1Edwld77mjVrAQ/WggHt1
         lBawnPLgtlc9pp+pGHxyPa7q1YFEYFhlNHytz56f0Wa8I5Mjj2GBmvzOjxq8LQ9yR8Q0
         OGCPS7b5cPjl/jE3uwCKSrjnyyspOk6UfS65Ob3YiX8JcRrhE0+gpzMTn/tR7qb2jCP+
         E+2r+sR3jFOepRhepW8gcvu1YGFYQc3yzeGTWJ7OLHXtSjNlFBmvwZ5NpIxoS4Oi0mX5
         06Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVlCpQ4hclUOhGC2ctKrAs+5gp/IP9cGTxSWN5ReLmhB9lEb6TBbDfwRMxbJoEOPjLXYCOeGCtdPYs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzejDGeXYcIWiGCQNuUvWwx/ona7GjQScV/mh0eLdLsNpT8JC8M
	Z53fj5R9tDCcSM/a67mlF4APBsfBHw5gyfm48sPR9Vlp2g3c4XL6IMoSDyRQF0A=
X-Gm-Gg: ASbGncuDU1o+C0AeEAqxNCzroiwW6O5dtn2JyhwEqTrysXsTsKIullSBoNZTpsEEjjl
	BB3376yyUak7uQDd49LPeIeOmFI4wh1sVp7fWnPW0BRpH/JkUFe4CzKR7OKzskNhjqohBV6+z7B
	nmcwqh14snmFY4JYL/FUYLiAv7GPIVwftI+ed7kzsJRpUtBFh5nOYpVwWFlDxuZlTDdY84NQp6V
	B3YTpBF276pEBgWmHuVXGdknsLRjpys5Ug1qIMwoZ2JsrbIhxiXWu+5JYyCcbw9FocXyCNl3rbv
	7GE+/Q==
X-Google-Smtp-Source: AGHT+IGRLBberTsNPcVz5fDDiJ496OTTAGvxwwTdPWwuUiji7gMKzctc+wxIQ/Y0LkCE8MhlfHWUlw==
X-Received: by 2002:a05:6a21:6d86:b0:1e0:ae58:2945 with SMTP id adf61e73a8af0-1e5e081179bmr90059001637.31.1735876450877;
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fba98sm25284573b3a.161.2025.01.02.19.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:54:10 -0800 (PST)
Message-ID: <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
Date: Fri, 3 Jan 2025 11:53:56 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page
 table
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
 <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
 <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/3 00:53, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
>> index 551d614d3369c..3466fbe2e508d 100644
>> --- a/arch/riscv/include/asm/pgalloc.h
>> +++ b/arch/riscv/include/asm/pgalloc.h
>> @@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>>   static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>>   				  unsigned long addr)
>>   {
>> -	if (pgtable_l5_enabled)
>> +	if (pgtable_l5_enabled) {
>> +		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
>> +
>> +		pagetable_p4d_dtor(ptdesc);
>>   		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
> 
> Nit: could use the new ptdesc variable here instead of calling
> virt_to_ptdesc().

Right, but we will remove pagetable_p4d_dtor() in patch #10, so this
may not matter.

Thanks!

> 
> - Kevin
