Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E28C39903E
	for <loongarch@lists.linux.dev>; Thu,  7 May 2026 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143712; cv=none; b=jgDVPJjUkuNXuzDV4lOexbH/BvRdU/l7eip98lSEKq0ZZgrO5+Ege0ue62yGVcAXupFLFAh0WjioN1OvzBHaHpRf409S2nNH9VV3wc8PFm+lvI9QHb2UgCfk6kucGOfG4X7x0h6SDe6s7x/bpYm/KVUAPBq/7dG95+DdNFIsJ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143712; c=relaxed/simple;
	bh=JIGuETpivY+tMqhUXN4t4Bny+zQtYhvsCkl/N+OUQDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbPVq+RApM9KWl9+KTnkrwvEcexGAja6A3fLjWqW9/GAkl4Cv0W9B7mtqYJicrRmf4dnaYLOZLq5BMbM9plazg2ZPAjzFwiildK6XZ8dSTV/Y6U0PNtnKR5I4dvp+hvpZRBZwubxfhgbDrD+dKmb9rQeim4nFs2kF3eJ9k8qOxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hduZsI6K; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hduZsI6K"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2aaed195901so2970465ad.0
        for <loongarch@lists.linux.dev>; Thu, 07 May 2026 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143700; x=1778748500; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2g4HOatV1Ssugu2qkDT6I/dNGmnk+MzQNypIG54pufk=;
        b=hduZsI6KedAW3W71pQsp6Yr+WOUQzjWla36aHY+ijG+dExmzOQBvFdGWcRt7q+pyPR
         Kfn+fRNogOtb1nq9DuYJ5quxNhs2xcdpAozICZQH4FheRzvVotV4XCFM+SCd5YS+ysCm
         vZjZCOeuSRtq/xN0nk4Ldys9PmchHRAJ/PiWwlWntBFQ+4D/TwfRguo9/ks3lU9DFpLV
         nb5dfSkDA8KJKt4IlcUkHmeSP11Vjjp2Pj4qNCfGdM3ScQdDKYVVA147tKaE0DpQbcCk
         B5t6ojOvyv7OdGdEgMLQ0F+TyqZf2yGZ3mx0PZYQs8EsWHZHlJez6Eg+1l8tmSjzkSCz
         BOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143700; x=1778748500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g4HOatV1Ssugu2qkDT6I/dNGmnk+MzQNypIG54pufk=;
        b=j9W6tDSM3AONXevsJjKo1v6/pO7kU5ECbZJQPygtvWaZdYuw0UdhswnsNLok7gBBUh
         jmAXFF2+jaLWaa6jAjDmfSi1f36BTy0ApURN6lYPjlJ65dDb07uURUAOn8gVnfujoc32
         CNGQUKHjFqL3AjqQzkPGbrwPolPEwXsIp50MXGVT5E0UMA1FvlFAmVdAlGFsF8QQZwrZ
         DZ8T42nyGs4/w0AaqqRibTaQN7eBEYlnLhPYpwyIXEosSO8ueC14obm595LeSGJgBn/c
         BdCJLI1XbAgI7XSIbZoWb4t+Jh/ilb7gBfhuhqB+n66SPY/OpgSt1b6J8Yqar/MWKClB
         IUKw==
X-Forwarded-Encrypted: i=1; AFNElJ+uW5btC77qbzRBpYUr748m5UWkC67EZxa9VPnEzzChHVQ+u//XKhbb2Z9Oy0ZOA7SRIjY1bhcuPuM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvuE6z3YXEEqAnWTiZYF8fXjuyxHoo3IWHEIlzZB5dpWRegXEA
	gPE+RT1XH60cMUf6ukmFAvmXL3PASD3SkbpoNsvlSoO9XQemftgR1Nb6
X-Gm-Gg: AeBDieuxo5quMlzlv5RDlwKAQyi5qxRmytFAV7ftDiPsx7grmUhU3Gib6dWH9cJfcG0
	Ph+MPW2vo6HbBwzAuJP/4dcJ6YAk84tnxpcwYp0Rc7XXncQIKvnIiOW3XclO0js50qUpYQsGcJ+
	+F5KivQyfItAeSkZLw3aPzJNQ0R7Y7+FzjztYfeyq6ix/HJeWsnPzJuLX/4CViOFXe8VcHCGhKL
	B2cVHcqRWquLSAxgEmuM987TEmC/NJlI6kVa3xVVxoqNPokDnok8QlQW7G5+kvNjIcdemCvEbTW
	L0deI/OThsmpVAuI3QFykm0+OrC/iID7TP19V6do8qhbOc9a8g+o9oUDVRgy9m6plK68r3n7z4E
	W1QqydOLXJz+gSvfiJ6b8PnDFFgjXIBbuBKwFT5FbFCH2qPoX/jT+jwlAm9HPWQLeeynksr7xgt
	Xl2lybLfEHUCeL/ts4Qwzc5F3Dbth7tLzDFK5IjTAzpw==
X-Received: by 2002:a17:903:903:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2ba78f7320amr72637805ad.16.1778143700446;
        Thu, 07 May 2026 01:48:20 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babab0152csm19143165ad.35.2026.05.07.01.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:48:19 -0700 (PDT)
Message-ID: <6056bd1f-3998-44ff-8c4f-972704e0b896@gmail.com>
Date: Thu, 7 May 2026 16:48:09 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] of: reserved_mem: add no-dump crash_mem exclusion
 helpers
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
 <20260429065831.1510858-8-chenwandun@lixiang.com>
 <20260506145022.GA2084721-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506145022.GA2084721-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/6/26 22:50, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:27PM +0800, Chen Wandun wrote:
>> Provide two kdump-oriented helpers so that arch kexec_file code does
>> not have to open-code the no-dump filtering loop:
>>
>>   - of_reserved_mem_no_dump_nr_ranges() returns the number of reserved
>>     regions flagged with linux,no-dump. Each exclusion may split one
>>     existing crash_mem range into two, so callers use this count to
>>     pre-size their crash_mem allocation.
>>
>>   - of_reserved_mem_exclude_no_dump() walks the reserved_mem[] array
>>     and calls crash_exclude_mem_range() for each no-dump region.
>>
>> Both helpers are guarded by CONFIG_KEXEC_FILE; empty inline stubs are
>> provided for the !KEXEC_FILE case so architecture code can call them
>> unconditionally.
>>
>> The consumers are added in the following arm64, riscv and loongarch
>> patches in this series.
>>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c    | 54 +++++++++++++++++++++++++++++++++
>>   include/linux/of_reserved_mem.h | 15 +++++++++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 4b80420da2d2..038056a6408a 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -27,6 +27,10 @@
>>   
>>   #include "of_private.h"
>>   
>> +#ifdef CONFIG_KEXEC_FILE
>> +#include <linux/crash_core.h>
>> +#endif
> You shouldn't need ifdef around includes.
>
>> +
>>   static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
>>   static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
>>   static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
>> @@ -916,6 +920,56 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
>>   }
>>   EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
>>   
>> +#ifdef CONFIG_KEXEC_FILE
> Use 'if (IS_ENABLED())' within the function.
Get it, thanks.
>
>> +/**
>> + * of_reserved_mem_no_dump_nr_ranges() - count reserved regions flagged
>> + * with the linux,no-dump property.
>> + *
>> + * Each such region may split an existing crash_mem range into two when
>> + * it is excluded, so callers can use this count to pre-size their
>> + * crash_mem allocation.
>> + */
>> +unsigned int of_reserved_mem_no_dump_nr_ranges(void)
>> +{
>> +	unsigned int i, n = 0;
>> +
>> +	for (i = 0; i < reserved_mem_count; i++)
>> +		if (reserved_mem[i].no_dump)
>> +			n++;
>> +	return n;
>> +}
>> +
>> +/**
>> + * of_reserved_mem_exclude_no_dump() - exclude no-dump reserved regions
>> + * from a crash_mem list.
>> + * @cmem: crash memory list to modify
>> + *
>> + * Walks the reserved_mem[] array and calls crash_exclude_mem_range() for
>> + * every region with no_dump set. Intended to be called from arch kdump
>> + * code when constructing the elfcorehdr.
>> + *
>> + * Returns 0 on success, or a negative error returned by
>> + * crash_exclude_mem_range() on the first failure.
>> + */
>> +int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
>> +{
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	for (i = 0; i < reserved_mem_count; i++) {
>> +		struct reserved_mem *r = &reserved_mem[i];
>> +
>> +		if (!r->no_dump || !r->size)
>> +			continue;
>> +		ret = crash_exclude_mem_range(cmem, r->base,
>> +					      r->base + r->size - 1);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return 0;
>> +}
>> +#endif /* CONFIG_KEXEC_FILE */
