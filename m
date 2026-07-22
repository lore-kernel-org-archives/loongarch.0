Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F5E1D7E5C
	for <loongarch@lists.linux.dev>; Wed, 22 Jul 2026 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722080; cv=none; b=GmeQba0kqZUbkqTPekuv9D32kYpmFMFi1zhXcLX5Hz7U5jgjRGAl1/PX6izi9GwFje9WJ4lXnG0H4xVLfhgrJ9EQ1pI1javHhA3mWwGJEXVYAX107AwjeVPNxmAHPMtIxP9XU71y/EmHztBTsr11oxglQbk+TiHxVUnNWusSU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722080; c=relaxed/simple;
	bh=ASD+IxhVsEqGVpEQnk06k0SDPLwoub74YeqJT+y8Q4M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XTmKYFpvTDU2g0ERcYPXI/KQV5ogiQs2j3bxBi7RYTxE5L1E7DRY98/dD7Fly/O5NTVWDYZJ5dwx6OHccaXnXFY64aSBfjGtZR8hIj/iUTionZzUvUilVQfRI/AwQwq+ueYEi0fKnAiIyrnccFtIJhtnqlsJRxh46Y9kExGnCY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmK6KtqD; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmK6KtqD"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so3678481a91.1
        for <loongarch@lists.linux.dev>; Wed, 22 Jul 2026 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784722075; x=1785326875; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9Z7oDiKdtFczxQKch+yVvuNvhzSOS2efy5d+XjmEE4=;
        b=EmK6KtqDXOS965dgq+AWmTwMM5/D2tFjUnADWSwoaO38mpjYYomPw3dAnBBE7uXtY4
         Tb6wUKA5Sd+cf/m3GaDQknvE+H/KiVyluvEWUnUxzOIJ7aogyb427i81G/LHK19hFhvF
         uz6hQVjBWXpzem6cMF1OMOWQfDYiJiF233APIhpARjTavoCmb4f9CQtVcRpb7bkDVyBI
         5U8N4u/N0YxsGk2oETC3aAzTqMqcXSU9xiRsdGQA+qa6F0dsFJKOp5qqQChIvEo1iuWg
         zq14jBifVqHTYSZAFXY9B8a6o0lwrK817F+ANXZhiLZEv7W/xUyF59ba9JAm0ZHzOrkJ
         l6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722075; x=1785326875;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9Z7oDiKdtFczxQKch+yVvuNvhzSOS2efy5d+XjmEE4=;
        b=D/oTIcvEq12f3kzKdEE5urkJiy8hNxh48/nbqTHdKUnZKrOeMj1sSO1+HqezPhnCX3
         zHm3XK5rZlrtauJQiO3+5HHT9a8W357vMpYIam3VNmSIwndnWN2oYdGlqb0vBfp7T73D
         zBnUIlPah8f73ZvsSZ0tWoCWm2wol+rHHLxPp/cDUZPB9kQP2Kv0eXELC1KN703oXjaK
         xVukNACiczrFSo9QWeaXesxkrIGUFbUZ2WSlrMqT/HKqD5nevZ5AM9fTZZ6iqYKiPqsG
         xLCtFbugQMF/iXVsEQEkEDxvA8yPOWiDgWKMYWWk3Uetg2JaKapVrYUNRSOV1Khyfdvd
         d0pA==
X-Forwarded-Encrypted: i=1; AHgh+RpCFgDEvAq/A9k2HRIr69tMpQVR28Sy4EGHCT/xziC1ljKCiqskSTdmKL1imlrM9kt4q+95A3fMO9c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfGN+DT49aZpr3+5+XLc5Y+y/IaWf0URFnEg80sx2LFG/p8Ygh
	YkN84Y0ycnYs1JlMpFM7q5nO6qTMIXbIwa+j9jtzFYSzOoMRXRAwQMCm
X-Gm-Gg: AR+sD12A65VvgcjVv7CLUilv42mnjJOgDmmfBhDCChcaEkQzghb1BfRPX8S4LLZVXkT
	AeslZlX3tp7P7yXD3WChQbt84IfK0li0yaLxvLwBIlS85kQHbSRFaKSHjYU71KNzkUlB101ggme
	UgS3Ssi+hc+sI8NTG5L7HMoI7tFvT3Q8uellMwz0GV/5pF+JX+2vbAK1AIlwJ/Z9YH+LXVPuRAx
	hLgqUHXJcN7zaT9pbpyNYo3HM3jAGVHexUjUJQoXkmtALGZTDaI5jB0Sbksj/OcWFwNJEVoxGJ0
	ytZobp9d5CNP8CBiWDnsdEg/IhI4KsiKVxewKfLl78qMnO65WPgyOlw6RaqiSEasyhLgPT0DV3a
	P76zrXoc0w54lrK/wnt45W5wHc74qxwtqT5Tgv6o5CK488WvUvE8ZjWKkJ5vvHwy6zAEYxvQPwN
	7UW2UdFmVloA==
X-Received: by 2002:a17:90b:1b42:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38e4b57ee22mr21351484a91.40.1784722074599;
        Wed, 22 Jul 2026 05:07:54 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9218a343sm3215461a91.16.2026.07.22.05.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:07:54 -0700 (PDT)
Message-ID: <e3dd16fb-3795-4028-a2f9-00f54882183f@gmail.com>
Date: Wed, 22 Jul 2026 20:07:40 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] kdump: reduce vmcore size and capture time
From: Wandun <chenwandun1@gmail.com>
To: chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, robh@kernel.org,
 saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, m.szyprowski@samsung.com, robin.murphy@arm.com
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/30/26 15:47, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> On SoCs that carve out large firmware-owned reserved memory (GPU
> firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
> those carveouts as part of system RAM even though their contents are
> firmware state that is not useful for kernel crash analysis.
> 
> This series introduces an opt-in 'dumpable' flag [1] on struct
> reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
> DT-based architectures (arm64, riscv, loongarch). By default reserved
> regions are treated as non-dumpable; CMA regions are explicitly opted
> in because their pages are returned to the buddy allocator and may
> carry key crash-analysis data.
> 
> Since the reserved memory regions are filtered out, the vmcore is
> smaller in size and faster to produce. The reserved memory
> has already been filtered out in x86; the optimizations in this series
> apply to systems that use DTS such as arm64/riscv/loongarch.
> 
> The series is organized as follows:
> Patches 1-4: Small prepare changes and cleanups.
> Patches 5: Add dumpable flag to opt-in vmcore.
> Patches 6: Append /memreserve/ entries into reserved_mem[].
> Patch 7: Add generic kdump helpers.
> Patches 8-10: Wire the helpers into arm64, riscv and loongarch kdump
>               elfcorehdr preparation.

Hi Rob,

Gentle ping on this series. Patches 01, 05 and 07-10 have been
acked (thanks Pratyush, Will and Marek), and the comments there
have been addressed in my local tree.

Patch 02/03/04/06 are the core of: reserved_mem changes, they are still
pending review on the devicetree side.

Could you take a look when you have a chance? Happy to respin and
address any feedback.

Best regards,
Wandun


> 
> v3 --> v4:
> 1. Rebase this series on v7.2-rc1.
> 2. Add two cleanup patches (patch 02/03).
> 3. Simplify patch 03 to avoid checking whether initial_boot_params is
>    NULL multiple times, suggested by Rob.
> 
> v2 --> v3:
> 1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.[2]
> 2. Fix UAF issue when alloc_reserved_mem_array() fails.
> 3. Add some prepare patches.
> 
> v1 --> v2:
> 1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
>    feedback [1], v2 drop that property and exclude reserve memory
>    by default.
> 2. Split some prepared patches from the original patches.
> 3. Address coding-style comments on patch 5 from Rob.
> 
> [1] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/
> [2] https://sashiko.dev/#/patchset/20260520091844.592753-1-chenwandun%40lixiang.com?part=4
> 
> 
> Wandun Chen (10):
>   kexec/crash: provide crash_exclude_mem_range() stub when
>     CONFIG_CRASH_DUMP=n
>   of: reserved_mem: dedup and relocate reserved-memory messages
>   of: reserved_mem: skip late scan when no regions are reserved
>   of: reserved_mem: split alloc_reserved_mem_array() from
>     fdt_scan_reserved_mem_late()
>   of: reserved_mem: add dumpable flag to opt-in vmcore
>   of: reserved_mem: save /memreserve/ entries into the reserved_mem
>     array
>   of: reserved_mem: add kdump helpers to exclude non-dumpable regions
>   arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
>   riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
>   loongarch: kdump: exclude non-dumpable reserved memory regions from
>     vmcore
> 
>  arch/arm64/kernel/machine_kexec_file.c     |   6 ++
>  arch/loongarch/kernel/machine_kexec_file.c |   6 ++
>  arch/riscv/kernel/machine_kexec_file.c     |   4 +
>  drivers/of/fdt.c                           |  11 ++-
>  drivers/of/of_private.h                    |   3 +
>  drivers/of/of_reserved_mem.c               | 108 ++++++++++++++++++---
>  include/linux/crash_core.h                 |   6 ++
>  include/linux/of_reserved_mem.h            |  15 +++
>  kernel/dma/contiguous.c                    |   1 +
>  9 files changed, 142 insertions(+), 18 deletions(-)
> 

