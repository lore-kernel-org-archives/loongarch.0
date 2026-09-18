Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3043DB328
	for <loongarch@lists.linux.dev>; Fri, 18 Sep 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719744; cv=none; b=iWlzb5V8X49ZzR0ebTnQt9vA27UKaWzP8LQQNQGV1vKkiUvMp1YZqonLDJVR3eiNwjhpScs8Mj1I3QZunxehNUXDY9rEP5hKPM+esWdx0s8TVCyJnc0IfJYczSlzAkcm7XzxooceXhI1ftIsppwqZBDTT9dDfX2L/wlTzFiBggU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719744; c=relaxed/simple;
	bh=b7SZRiTdPjaH75CaQCp3RCsjKZl29SheZjvophXkDdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seId2t549pSzdd6Es/ORFlRb4yd/MpD+hfguIGbHtBMyvRv9NJuxu+MangSWpHjErJpX7TxjjXLr7QocWjBExRddJbWptyh1rHznqZu76MxHUNT9tJkNlbX1yRMEPNIe0iEP+qhZlJOOYx98KgEiBqPkay1qA86g5/uoV04P7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6wlATQd; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6wlATQd"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6fbdc8772so2518715ad.0
        for <loongarch@lists.linux.dev>; Fri, 18 Sep 2026 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789719742; x=1790324542; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjigVRuOlpSLvwuFF0kw47lERwh/eIzaGM/o/mwNyVQ=;
        b=G6wlATQdPLVthtrFU35bxQtX1iBLG34+ombHSnIr96H604L2ngLzr/6RucqA3c7L3B
         YLMR1DzukvY5nlbna+aGOPKyM4E6mqVF+Ki2vpjCS1N+KwXTLXSermRjJLzC+XWRmNk2
         FQZLT0JJnS/qUhEZVRJyK5kMZ55Z0NNmgAY/1+mgkQuICkcsfJTrdKGHgc0MwJCjS/xa
         plz4NaYBEqseIPRGZfsQewuJVcj9g32zLh+M4Ct086htVAYxIBu2tDfg8eBVMQR+Hw4p
         A4BEbq6AQuJf/RqIqqPLAusKDZixMTGBGJv638PeZ8VfPHSjqhMsgXKThVpM0QQ1EcDv
         nJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719742; x=1790324542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjigVRuOlpSLvwuFF0kw47lERwh/eIzaGM/o/mwNyVQ=;
        b=qM+JIGulmtpprq/reRZRixiYGq4j+1wGqC0Ry69umjxX6glyVqC2j23CIi5sDJseN4
         k8ofPIILQexyUZtLK5Qa77ywnGXJcKh8/HuW+f+FtIK+tLTEK393zQAuhrYes+W5NSNF
         AJfwbC1U50CEATZfa4CaCsQAlFLN73pfeYcgQAF2MAMEsLgHmr+kJO6xUX4b9d8gqmWW
         VPqhqBUGsfBandzR11m1VdqXCJpfS6+PxF85cqwGaInfs3JGBcRpughE9OqE/ssEPI6Z
         IUDH9lSOzqdd6BHvN8/dePU/H3rQBGPEvcAVSVLlQUH9pdABy+XO0zymarUZ2MPXjRfI
         +StA==
X-Forwarded-Encrypted: i=1; AKwUvBwtATWU+8hy8g7RTzk4Bf/Q9CaFuObKkaP8paWHnKxAJsNe05TsVjFz2umyc/MDsSmsLbUvWz+Qw+8=@lists.linux.dev
X-Gm-Message-State: AFuF++lxK1K2tYSUcASDDv35+UJ36wtDRZ6jLm7Qjy+1oeAfzeoLvOiW
	Fw283RSkFWMuZfjca76EU4bL72Sy3vIVyDCAy9Ae6D0d9abEAcXIwens
X-Gm-Gg: AYBFou0I2/JEC/hFZdNWpUqCVazSh/z/nEYAkZDhhG4fNbTFwa3BVDCqWy5lk78jyS6
	CDEXN6hl0CqXoPRU4fUMkdY+jzWr+1hqTeKxvdcITdV8D8rnKumnOEC91jElGdk15uBxmVkaDzi
	HjYp4pXijTrTRYLYzYKhvMXh7pgH9braxObRqaUNr2okF5wAbvhlyJbrBjHGTGjiK0GkZD2aTHX
	/jt+wLJC1drWjDoYMCDzZ9Q1Cl9yEMvRnexfJJ9qJvifyt5Hv7M2+Ub4h2NpDNzNsbGU41o5Coo
	MQPOyvBYQ/ueXRuVcbh4MOJZpM6lgyVPbZNDXxmN2CwpjLTab3eWPR/6NwexBllTfEdAkIS5u0Q
	KfLsecciK6lgjaZZ6DgvWemDCitlf2XYDCiOkJxYMZC9tHNpYDffsYUxNwo8pS5Ec6fG9iI6x06
	uB/gHa8l6B494umpimWt9vAF2wYZfBPh+8lkZABPVEsSvKANa+6UyRja0qh3qElyhdkU2ml8wIY
	UP6aw==
X-Received: by 2002:a05:6a00:4196:b0:874:708d:b637 with SMTP id d2e1a72fcca58-874df800839mr3426122b3a.35.1789719741686;
        Fri, 18 Sep 2026 01:22:21 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e79f1sm541488a12.30.2026.09.18.01.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:22:20 -0700 (PDT)
Message-ID: <bc6cf467-84d1-40a0-b570-1b5256a6e2e2@gmail.com>
Date: Fri, 18 Sep 2026 16:22:03 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
To: Baoquan He <baoquan.he@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-7-chenwandun1@gmail.com> <aqzxavL91icLw-Xv@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aqzxavL91icLw-Xv@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/26 16:08, Baoquan He wrote:
> On 09/02/26 at 03:31pm, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> Add MEMBLOCK_NODUMP to mark regions that should be excluded from
>> kdump vmcores.
>>
>> The flag is meant for reserved memory that carries no data useful for
>> crash analysis. Reusable reserved regions such as CMA may hold useful
>> data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
>> patches wire this up for /reserved-memory and /memreserve/ entries.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
>> ---
>>  include/linux/memblock.h |  9 +++++++++
>>  mm/memblock.c            | 16 ++++++++++++++++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
>> index d62db9e776cf..b2fcf11fba2b 100644
>> --- a/include/linux/memblock.h
>> +++ b/include/linux/memblock.h
>> @@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
>>   * kernel that we know is good to use. It is the only memory that
>>   * allocations may happen from in this phase.
>>   * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
>> + * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
>> + * for crash analysis (e.g. firmware carveouts).
>>   */
>>  enum memblock_flags {
>>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
>> @@ -63,6 +65,7 @@ enum memblock_flags {
>>  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
>>  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
>>  	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
>> +	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
>>  };
>>  
>>  /**
>> @@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
>>  int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
>>  int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
>>  int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
>> +int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
>>  
>>  void memblock_free(void *ptr, size_t size);
>>  void reset_all_zones_managed_pages(void);
>> @@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
>>  	return m->flags & MEMBLOCK_KHO_SCRATCH;
>>  }
>>  
>> +static inline bool memblock_is_nodump(struct memblock_region *m)
>> +{
>> +	return m->flags & MEMBLOCK_NODUMP;
>> +}
>> +
>>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>>  			    unsigned long  *end_pfn);
>>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index f2952d725c10..2e87f39826dd 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -1204,6 +1204,21 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
>>  				    MEMBLOCK_KHO_SCRATCH);
>>  }
>>  
>> +/**
>> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
>> + * @base: the base phys addr of the region
>> + * @size: the size of the region
>> + *
>> + * Mark the region as not to be included in crash dumps.
>> + *
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
>       ~~~~~~~~~~~~~~^
> Is it impossible to use at runtime even thought it claims to be generic?
It is currently only used during initialization, so I added __init_memblock.

If other modules need to use this function in the future, this annotation can
be removed.

Best regards,
Wandun>
> 
>> +{
>> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
>> +				    MEMBLOCK_NODUMP);
>> +}
>> +
>>  static bool should_skip_region(struct memblock_type *type,
>>  			       struct memblock_region *m,
>>  			       int nid, int flags)
>> @@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>>  	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
>> +	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
>>  };
>>  
>>  static int memblock_debug_show(struct seq_file *m, void *private)
>> -- 
>> 2.43.0
>>

