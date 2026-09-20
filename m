Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C26C331EB4
	for <loongarch@lists.linux.dev>; Sun, 20 Sep 2026 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891254; cv=none; b=JE0QCWP9TJSzagK42AGsCV1r0Co2zocFGnK2U7pLRoZ7dIz2uR8wC5m/D3LzLghDuztt0QCi1cLLT2PFizsKITzLx3/L+67Jr9JWR/ewrgM2Nx1d5hLdZQn9X+dfIJ0+aO/rqONO0iN4dT5qWpLqc2yvxEbcSrX+AhFQ0ff9M3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891254; c=relaxed/simple;
	bh=PYjoRnzoFTLZF653qo+HDOrzFXvuX00dh48RUmFUdyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQOjLubiNRFS1K5Zgblh2Yqq3MLJ03GlgjdKDwlGXaR3JURVOn/+N2j7Fb8oGmaxTIy4lVLpNiOA6GKsV2gYaiuK7bVDBgD/OqYRsldjSU5Pl26+RPNFCRrBCmvtqI7+r1DUWlGy2xWbAsCoxIXR4vbQ73TchXnwMmlM+33mAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zt0LLrxj; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zt0LLrxj"
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2d74bbdc61fso2160685ad.0
        for <loongarch@lists.linux.dev>; Sun, 20 Sep 2026 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789891251; x=1790496051; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=;
        b=Zt0LLrxjPKgPepUASLpYwPLS+5ohZyz+N/gET/MAG/uRSy1u/qT3V4bBWurBrl2Zw4
         nlWMbkJCy2dkBjrTrkmsyn3HdDNi2TCLtNODDRDkLnLiemC41qWjqSyFpjwv6Ho95e3l
         WTwUeK9n4qXbGsVPXzmYQuXZs/yeUB3jX/Nuw4Ly3zFWPGkLhVA1GmmLHxXBkzrinjsq
         wckmfSyzDUtZ/KzKxLbNWLAny/x9FcX5UVRt4Lut1HmSvz8T8HwX5yPwfk7dskbHVp7Q
         i5ecwTZysfimhNHXDxyJ0TWkxvBkK5erCeke+jO0ywYYRJJxApvW4uU0POfNaacS9ydb
         zlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891251; x=1790496051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8CTYyRXY2aAud9otm1AgJf6WMdrU7YgSbJhEbsEEJg=;
        b=BxmowNjFESRqiBj6HRm2EQAo+9tGWFGlO2dKoG9iBCeo+DtOv7niENJ4NtEXZIekcM
         /WHfUVRZ1GfXNf8Y7PnancFC4PjzmEeo7xCwam9y0KKnNwFcj165UdPALDbUKYc0Btsa
         hRh7qIDJCYWDyIb2ZBdxvEF7+qxdn35mdZLk3lEtFrsGCkHMiRm6S6paLQQO8+zOuCEc
         m4YXAEBWIx5WN8yGT9M2wzGNTEaeJJz2uknUfBVQRnZb9UD+jTsmxFEQi+Zw79Tgwl6s
         O18PH80pov0xYBD0WsDgLdLMYoRklSjwLEYlcl9sXoFEWj2PhjXcMBPt1ut1XIaYVXEQ
         PpcA==
X-Forwarded-Encrypted: i=1; AKwUvBzTpIQuKqsicuCoIbtpcLbGg1/vcWiJJVn4fqTbsMrwgCF9VpxzkFF7JuUvvNCOCDCptwV2dEdlhOs=@lists.linux.dev
X-Gm-Message-State: AFuF++mrZYlvxZ1IHCT15xUY2bfj5XnaxWRcwLZGmnI/y1Y12R8rkCcc
	b8w+/vui1xqnHT4WlT7zOBRaepQoR3zk0LbnyF0jGzmb+sNF0HaVQ/U0
X-Gm-Gg: AYBFou3VX5hqNPveGS/5uRoDEhLbWGABgFckm349XT0RubT9/WD/olj3MtT5iPF3DAh
	Tmwt9Z5+iUdsW0tLdZOLC+hxoCQTkKIBBZFemcgUZ+PKOIF/JnpJTYOx//57g2bckAZJbuatmAq
	/NkafkYs+E0Q5LwavrP81DBRD84JUmDw3PfIzHkNuF8OwAbsyhpKWpYGA6vTkyp8Ymp81h3G22S
	YPA1TfuUrzF8SNCGOvMQZhHR5yShsSLOlBvXx2WoxIR9GmCiw4ZBJTwZSGTC1bAq9YlPFIxkruY
	hJ504U1kSH4ikW4hYeoY/mI3lg7AG7clW712/RGmKYGG1X5Mr4Cb8GoEHkSd9otcd48UrNzlXgj
	kA8jVrhxIZ81lSppT4J+hZKfJeqHDHAR5l2d3m4xLLE+TRb+R4DoKTY/8TDanSJ6e+3EO7zn/0V
	heiNqjwDqeP5kvc50Bjx2Q7x6HMmK42T/XdegFlEL6BsElzrKpdRe9YolzurlWhlzFfNzm5ZAoa
	eiOWA==
X-Received: by 2002:a17:90a:fc4b:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a02900f85dmr2402815a91.29.1789891251509;
        Sun, 20 Sep 2026 01:00:51 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm7876986a91.11.2026.09.20.01.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 01:00:49 -0700 (PDT)
Message-ID: <32b00102-0961-49e3-b780-74d6db182809@gmail.com>
Date: Sun, 20 Sep 2026 16:00:30 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] memblock: introduce MEMBLOCK_NODUMP flag
To: Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, m.szyprowski@samsung.com,
 mark.rutland@arm.com, kernel@xen0n.name, alex@ghiti.fr, hpa@zytor.com,
 ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-7-chenwandun1@gmail.com> <aqzxavL91icLw-Xv@fedora>
 <aq41nFRPtRWTQ7cK@kernel.org> <aq9UGXeqmCfuPHdD@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aq9UGXeqmCfuPHdD@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/20/26 11:33, Baoquan He wrote:
> On 09/19/26 at 10:11am, Mike Rapoport wrote:
>> On Fri, Sep 18, 2026 at 04:08:10PM +0800, Baoquan He wrote:
>>> On 09/02/26 at 03:31pm, Wandun Chen wrote:
> ...snip... 
>>>> +/**
>>>> + * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
>>>> + * @base: the base phys addr of the region
>>>> + * @size: the size of the region
>>>> + *
>>>> + * Mark the region as not to be included in crash dumps.
>>>> + *
>>>> + * Return: 0 on success, -errno on failure.
>>>> + */
>>>> +int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
>>>       ~~~~~~~~~~~~~~^
>>> Is it impossible to use at runtime even thought it claims to be generic?
>>
>> This should only happen at boot.
>>
>> Allowing modifications of memblock properties in runtime is a can of worms
>> I don't want to open.
> 
> Thank you. This is why I said this can't be claimed as a generic way to
> mark memory region as no dump. The generic way I'd like to see is
> at any time of system we can mark any unwanted memory region as no dump.
> And it won't impact the behaviour of the current system.

Thanks Mike for the explanation and Baoquan for the suggestion.
I'll drop the "generic" related description in the next version.


Baoquan, by the way, patch 2 is still awaiting review. It rewrites
the riscv side of the code that patch 3 (which you've acked) then
folds into the weak defaults, if you could take a look at it too,
that would be very helpful.

Best regards,
Wandun


> 
>>  
>>>> +{
>>>> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
>>>> +				    MEMBLOCK_NODUMP);
>>>> +}
>>>> +
>>>>  static bool should_skip_region(struct memblock_type *type,
>>>>  			       struct memblock_region *m,
>>>>  			       int nid, int flags)
>>>> @@ -2887,6 +2902,7 @@ static const char * const flagname[] = {
>>>>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>>>>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
>>>>  	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
>>>> +	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
>>>>  };
>>>>  
>>>>  static int memblock_debug_show(struct seq_file *m, void *private)
>>>> -- 
>>>> 2.43.0
>>>>
>>
>> -- 
>> Sincerely yours,
>> Mike.

