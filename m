Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C43237180
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 03:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147375; cv=none; b=f72gdHaBOU5mEi7CDoky4SWACkBnVQ1oMysQFCLu8jaXdu7S2xBxRJFCJ3hX5oPFG60VYUfnwuwmZEs+hg8GXthuT5a+Mh2DsN/5NebALnUCBbCQLwsd41C7ffMbOxq+U9uWqx5kt0NE9ze5+utxLnx/El2Z2Gf3pNXV2DSbw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147375; c=relaxed/simple;
	bh=oKZuciULY9JBG2l4enUy3YkyVqstZ1dofPhvmB1PDVk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=E3+i7GZGOlmZErdB8Td7N3Z1p5+mrlU2gijYXSBtciEXthOhigeF2SBCv8YJ0L2PT6d09tiIs6kK2VmvEkxnS0+M/3gmOm/mN0QoYCv7xWrglNBmzbmOW1LUrRAtEpP6Kn6PTPjxrZK6R7EwsfSaL7r70tQhJAoTnBz5TawZlR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsronQRh; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsronQRh"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-36d8b644473so6920411a91.3
        for <loongarch@lists.linux.dev>; Wed, 10 Jun 2026 20:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781147373; x=1781752173; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYAsuub7tjh5DE2NtRU43cs+1enZX+YMETetqa3OJBs=;
        b=hsronQRhavmpXWFjgTJ2pMPNjEapZBgMrOPSEERZn5u10Vf38St3ARU4Rcog9G3Knz
         Nx7i2RtVrTScpx2UH3Vzi31HwjVcUFs4vIpKHjNhyOPlSLA6lRNIH7bPshQCcjBfVlUE
         R8clFKudQcXD+QhvHcpRPky+AFACHPl6Oo1c8322YoVFr1wFit3+7TF1qDhIfzngMauS
         3R7RWU2K1ncJIjmSMPA3ebA7TY1bI6Ai3kqVH1rq4vfLZouKOisBXpLbXnepTUG9Nl5U
         uss7upViAADLdQJWsCl7zOoJN9o8cx5gOovQfQXWIzoZilQhN3N/brO4rPmwUg51YEUn
         HdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781147373; x=1781752173;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYAsuub7tjh5DE2NtRU43cs+1enZX+YMETetqa3OJBs=;
        b=bpPIzxpD8jG4Q22Z10i/0RLbyVc3Tko4kAoOyPH1s9iUCoeGT/Av89eqppd36/rdfS
         L11s0+TexgbzZHYyGkpV8FKfdLhUxs55QuYUVqvgSvOxiZsFzHrkFTcbfYEDoVkEc4uO
         ExaGgWBpZ+byqC8/0hGS2kuRFMi1dvpufwVYCfGYh5IGSxTR4B3qVa4dK3MIFnWS52xf
         7Yix0W9WkabAsCW2ZI6+c68+/pjdMbkNyFek0kyCJHacGQoLe7BwsGuTlSlMcWWPKngP
         o9WpPG2EK3041OqvzhJ1M8WzLtxuaVOwODLywBzohTEXka8GZtvkbS82ylPhLo5teUYh
         1pAw==
X-Forwarded-Encrypted: i=1; AFNElJ99qGLxBD4ECYYWgb7MuzxNKJ7cUoxY1hbQYHVyUDRnLPjEk+is1xN27qfghljamxu9HjcF2uc0Pg0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyheEl8nO+9O9B2mnS0xaQvwDECrhtsp17QAyWHrpUdG+o+8i6F
	iSU2kaJiyR3g+AMQT5+DDKephXey+fausVQEyUF//KRTBf5XhHwhwmE3
X-Gm-Gg: Acq92OFzLnsn/emznz+NgUBE7xT5HaHVY9Mu7zKLzATGaILuZvQbTX89VK7PCJ+lgJ5
	URYxpVsxPc0mGFKPGZEH0iQRUmuRyBoAjiXMSv5mgOShJyGSyaOefIfvG8sP2Ob0RNBLKDBnplH
	yhLarGJ3lBi8Ih3vIRREN+Jl1M7Il7R4/LTqIsQ97aj7TLk+knYRFKt5bc2te+RXkh+MRYfX+cK
	VjGsqorPQmqMTOYN3OKhGkOQmd6XmQmIkcOZYwp6xUha3/ldnPebpaf+vX9HmGvUUuaztqp3lBW
	5SSwrWgKhvXKeiTCvBHlH0mmh21pYABWILETPFh6IZr/Gp20OpcCKO2CDU3T34L7bMncT7mhDxu
	sjInMSHnP5n8fa1h1dMWKHyUzbEtCMV68asEUnT+/l/Q6V7rXeCxSo5MBzMz5D1TsmqqGuUs8jB
	BE+wHIxVtDlmja1B1ndErzhwn1YCm134r1SZnulTy9Xg==
X-Received: by 2002:a17:90b:570e:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-377a75cc2b7mr1151650a91.13.1781147373379;
        Wed, 10 Jun 2026 20:09:33 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86585b5356sm107409a12.14.2026.06.10.20.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 20:09:32 -0700 (PDT)
Message-ID: <a3993db0-6975-455d-9674-4fd7cfcf80fc@gmail.com>
Date: Thu, 11 Jun 2026 11:09:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] kdump: reduce vmcore size and capture time
From: Wandun <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, Rob Herring
 <robh@kernel.org>, saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 chenhuacai@kernel.org, kernel@xen0n.name
Cc: catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <7ed207fa-4c86-426a-8570-495902ce04c3@gmail.com>
Content-Language: en-US
In-Reply-To: <7ed207fa-4c86-426a-8570-495902ce04c3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/11/26 10:09, Wandun wrote:
> 
> 
> On 5/27/26 11:29, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU
>> firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
>> those carveouts as part of system RAM even though their contents are
>> firmware state that is not useful for kernel crash analysis.
>>
>> This series introduces an opt-in 'dumpable' flag [1] on struct
>> reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
>> DT-based architectures (arm64, riscv, loongarch). By default reserved
>> regions are treated as non-dumpable; CMA regions are explicitly opted
>> in because their pages are returned to the buddy allocator and may
>> carry key crash-analysis data.
>>
>> The series is organized as follows:
>> Patches 1-3: Pre-existing fixes and a small prep change.
>> Patches 4-5: Restructure to allow appending /memreserve/ entries.
>> Patches 6-7: Add a dumpable flag and append /memreserve/ entries.
>> Patch 8: Add generic kdump helpers.
>> Patches 9-11: Wire the helpers into arm64, riscv and loongarch kdump
>>                elfcorehdr preparation.
> Hi,
> 
> Gentle ping on this series.
> 
> Status summary:
> -patch 03: respun separately per Rob's suggestion, picked up for 7.2
> -patch 06: Acked-by: Marek Szyprowski -patch 09: Acked-by: Will Deacon
> The remaining patches (01, 02, 04, 05, 07, 08, 10, 11) are still
> awaiting review. your feedback would be greately appreciated. I know we
> are at the end of 7.1 -rc cycle, I don't want to rush this series, just
> collecting more feedback, and will send next version based on 7.2-rc1.
> If spliting the series into smaller logical group would make review
> easier, please let me know. Best regards, Wandun

Apologies for the formatting issue in my previous email.
Here is the properly formatted version.

Gentle ping on this series.

Status summary:
- patch 03: respun separately per Rob's suggestion, picked up for 7.2
- patch 06: Acked-by: Marek Szyprowski
- patch 09: Acked-by: Will Deacon

The remaining patches (01, 02, 04, 05, 07, 08, 10, 11) are still
awaiting review. Your feedback would be greatly appreciated.

I know we are at the end of 7.1-rc cycle, I don't want to rush this
series, just collecting more feedback, and will send next version based
on 7.2-rc1.

If splitting the series into smaller logical groups would make review
easier, please let me know.

Best regards,
Wandun


>>
>> v2 --> v3:
>> 1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.[2]
>> 2. Fix UAF issue when alloc_reserved_mem_array() fails.
>> 3. Add some prepare patches.
>>
>> v1 --> v2:
>> 1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
>>     feedback [1], v2 drop that property and exclude reserve memory
>>     by default.
>> 2. Split some prepared patches from the original patches.
>> 3. Address coding-style comments on patch 5 from Rob.
>>
>> [1] https://lore.kernel.org/lkml/20260506144542.GA2072596-
>> robh@kernel.org/
>> [2] https://sashiko.dev/#/patchset/20260520091844.592753-1-
>> chenwandun%40lixiang.com?part=4
>>
>> Wandun Chen (11):
>>    of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
>>    kexec/crash: provide crash_exclude_mem_range() stub when
>>      CONFIG_CRASH_DUMP=n
>>    of: reserved_mem: avoid post-init UAF when alloc_reserved_mem_array()
>>      fails
>>    of: reserved_mem: zero total_reserved_mem_cnt if no valid
>>      /reserved-memory entry
>>    of: reserved_mem: split alloc_reserved_mem_array() from
>>      fdt_scan_reserved_mem_late()
>>    of: reserved_mem: add dumpable flag to opt-in vmcore
>>    of: reserved_mem: save /memreserve/ entries into the reserved_mem
>>      array
>>    of: reserved_mem: add kdump helpers to exclude non-dumpable regions
>>    arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
>>    riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
>>    loongarch: kdump: exclude non-dumpable reserved memory regions from
>>      vmcore
>>
>>   arch/arm64/kernel/machine_kexec_file.c     |   6 ++
>>   arch/loongarch/kernel/machine_kexec_file.c |   6 ++
>>   arch/riscv/kernel/machine_kexec_file.c     |   4 +
>>   drivers/of/fdt.c                           |  11 +-
>>   drivers/of/of_private.h                    |   3 +
>>   drivers/of/of_reserved_mem.c               | 117 +++++++++++++++++++--
>>   include/linux/crash_core.h                 |   6 ++
>>   include/linux/of_reserved_mem.h            |  15 +++
>>   kernel/dma/contiguous.c                    |   1 +
>>   9 files changed, 157 insertions(+), 12 deletions(-)
>>
> 

