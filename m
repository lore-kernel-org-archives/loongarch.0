Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78373C343A
	for <loongarch@lists.linux.dev>; Thu,  7 May 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146546; cv=none; b=NykO4BAStb7UhjEtFa3W0Wh0PSjlNod3BPaudyaynouoyV5/8m5jpLTQF28Fvs03Ip/BdxHDyvcU4fwXscnoaqq034LUweYVg68XoxCSyCJvHDyh0KS7l1T4LQWQ++rKy8sksbpVX04J98USDBJn6pMUnJhe+KxwDW9E7Kvz8VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146546; c=relaxed/simple;
	bh=+3dXKo6HEaUqbiU1d7YF8vYNCW370gD7bBjtPgCjrC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcUkT0Fws5/SqihtveDoCo5/rRM81nYap+CJXlaqDGpX2rVACE0VzzvOUpWI1YfU3CV23SpbWYv+Ng/6B0NnMv1fHZNdsotDc+HfbgemggQNvr20rhHsgy+kvtb9R9atalS/t1Zs3qcuFJ+fOgYWjOReBkp4TbQC4P5A3YzsltI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfsD8dHJ; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfsD8dHJ"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-3658ff4d34dso377009a91.3
        for <loongarch@lists.linux.dev>; Thu, 07 May 2026 02:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146544; x=1778751344; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=GfsD8dHJ5zT25X3zefhUZdUcPgLscA+2rOZWxfKIO/98t1dwalcd+INuYfT69W3Mz5
         7h78msGYdCRnirZd6M6r0XRG0mSSztuYsUW08a6B9dVoZtUMajkkU98Mxz/9bi6KcoJ2
         GCfHyxTfGocDp6XYZZZryT7XYBqWr/9suVXiaUiVQlBMH0hRklUENOmd99h7nKrJ/8cG
         /G5Z9NoHmmu1JhRXA2cC1XYGcFyOLIlKogwdsFhOTm7j5xcgLtNx+PmDQzhIKYdYmdcl
         8noRwwBcwt/CJZDcWz536cBJGCTC6LEO8OdZcQEo2xb1ZQdHBxNQqHZhD1eA/0BsVyUc
         zBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146544; x=1778751344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=tJCOY5iLuEi2Ds+/EAAkU3wJ7HncSIM9R4dLs6I+3N5x4BwnnXIpXueGoVwkpyvKK8
         rD7jmdx7NborcObiGzymVBLTwbyPF2Z2wHIy3Y/LVahtIAkWD3Ztjlf8/EPEwdqgL6G/
         Rdb4Ebc3YJT6JY++lwdjLQ10eljVLcMG9/C1nRmdy68Gf65tD8vs+iklMXFhy3o+tptS
         el3PARAlyaOM4D8XsD7ba1qF5y1249KY2pX3tFGVKVcCnB/UwY1ic+p3O2H4CAQdsTOf
         jidrHsQMsBr835cOfe/Dxu9aIvib40gc441Ymz8zaUTm9EL4rfcilmbrUdhihQr6fSmB
         Pg5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8FaBMOSB0UTbHAfjsUpSUPNK5jW6YsLvs1kx7thmPzoajQSWURwysCWowOgQ63CynyHfYJCRfjQ5s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhpaZ9LiUOAtxgNPI+p6O/MF1BqMVBufHiGWd+qPmgKCNbXdLI
	e9xsXrGmXr1USfPQFS0jImCVDBge0qnDf92rZKxRgzPsyAy3Hq1ICqbt
X-Gm-Gg: AeBDietXNExS33MKuSHzh4uJaWWkvFqxpDFI9zc51nbOwRuLxbkCjfiAO6mTaOwxnHf
	5Nf6lQmG2CZBH+6bU2lQr56+6E+1dl4qbYJqpkPx96nlKgCXKfmSY4iorKzmEh7hCz4nqC94/SJ
	rNrXZX6bbmkAhK/Ne7hJ/K2XFwwPQmwhTCjbi7uE1EPtrywQHCZYii8sRnl/qb2U85OFB9fv4VE
	FcnNLwZfTt8uusGFnNWiOVZ3vmhxW8hxbdPQDnNpLIiTM3Ue7Ahw+HCVDuSg2Ixvkz0Ctz222qs
	XVNARLw0FSA00ssuT28Ipo3Qg3jOYrV6CJhgDbgQUcguRPxfcfW8A9Iy57IQbnFKNnfnjjW6hlJ
	NI19ZmgOe7NaftqESF1T3jsTsg1ZiL8EHmfc5xqkbgo9f6aBMcNaU6qkPLdavhrNratVWRcNkjI
	dcLlKZ860skb6kjVfwceZI0QqvwM5ZrI6HMcqQj1ha2g==
X-Received: by 2002:a17:90b:1c8b:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-365ab9b8e5dmr6393838a91.4.1778146543874;
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c19387sm6651310a91.7.2026.05.07.02.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Message-ID: <1a8af3cf-5edc-4ca4-b340-12ebeb2ed982@gmail.com>
Date: Thu, 7 May 2026 17:35:33 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] of: reserved_mem: reject reserved memory outside
 physical address range
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-3-chenwandun@lixiang.com>
 <20260506015112.GA286568-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506015112.GA286568-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/26 09:51, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:22PM +0800, Chen Wandun wrote:
>> early_init_dt_reserve_memory() does not validate whether the region
>> falls within physical memory. If a device tree incorrectly specifies a
>> reserved memory region outside the physical address range:
>>
>>   - For the non-nomap path, memblock_reserve() blindly adds the region
>>     to memblock.reserved, creating a stale entry that refers to
>>     non-existent memory.
>>
>>   - For the nomap path, memblock_mark_nomap() silently fails to match
>>     any region in memblock.memory, but still returns success.
>>
>> Add a memblock_overlaps_region() check at the entry of
>> early_init_dt_reserve_memory() to reject such regions before any
>> memblock operation takes place. This also simplifies the existing nomap
>> guard: the original "overlaps && is_reserved" condition reduces to just
>> "is_reserved", since the overlap with physical memory is already
>> guaranteed by the new check.
> While I agree, I suspect we already have cases abusing reserved-memory
> like this.
Sashiko reviewed this patch and told me:
"Historically, the reserved-memory binding is often used to describe 
hardware
SRAM, DSP memory, or IOMEM carveouts that reside outside of system RAM."
IIUC, nowdays using mmio-sram DT binding is more appropriate for SRAM or 
IOMEM carveouts.
Should I drop this patch or keep it ?
Thanks.
>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 9d1b0193864c..03c676052dab 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
>>   static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>   					       phys_addr_t size, bool nomap)
>>   {
>> +	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
>> +		phys_addr_t end = base + size - 1;
>> +
>> +		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
>> +			&base, &end);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (nomap) {
>>   		/*
>>   		 * If the memory is already reserved (by another region), we
>> -		 * should not allow it to be marked nomap, but don't worry
>> -		 * if the region isn't memory as it won't be mapped.
>> +		 * should not allow it to be marked nomap. The region being
>> +		 * physical memory is guaranteed by the overlap check above.
>>   		 */
>> -		if (memblock_overlaps_region(&memblock.memory, base, size) &&
>> -		    memblock_is_region_reserved(base, size))
>> +		if (memblock_is_region_reserved(base, size))
>>   			return -EBUSY;
>>   
>>   		return memblock_mark_nomap(base, size);
>> -- 
>> 2.43.0
>>

