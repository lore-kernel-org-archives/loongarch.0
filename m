Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471156;
	b=kdKEui4dBfakAaAq+oc6Ld+SKpGplD6hJGUUEbDdsJA0sIWKuy0HoT6dirzoBxdBE7gV
	 63K/DY66IQ/z5s0a6F8rxU7WV2B3OtMhHXlai/ySsDCoJoEKC4BrTm6mzJ+wxFivO7Q22
	 9aj2JZM5GkcFcud/OPsj7EymDTNxkP2aDNY5aHY43HuWIuHpacEOI/BJA1RI5dDDSn4H8
	 LQQhrwEJjm7n65TMh5h/qj7HhkyS8MkIQPm6JXzPcJvQ+cw6SdCrPee0YvrGyfNoi7A7Z
	 fx0UQZ3wjO6xNhaTTe2uYt45BPeU9cgiQlSEkCgePLmyHuqI7UAfLbsTzBXMmWo3a7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i4Usv198qCvT1xdnr9OKW5ZLVCsGku8RkLVQlQ2znC0=;
	b=2PtZkp6WIUb7RhAcXhuMDpZBdrrrZLczvLwmClfxYRsJyIrq2w+BYB154JUyhbXuninL
	 x8vgUO4/sg/LW8K20m+a2BMTJXCN0TdfOG6OJsJPAkEOXIlaI6PTYCtIMVJOiUdXc6I5b
	 yMSKmGolQfeFmsNvjmPcXqghB89pf08nPszE+KxLwQA2iykjaYVYYMfXHLquefkoB0z1C
	 EOloPtRzXbvjOkaAR4G5Fg2ssL3Fgfn/AG3tbCkXokjNvsL66KTp8LDn4CV7CL2E1AkB8
	 MPybJxinw+WKBQFViZpdNGNOFBAVGyXud7jQNP5fBu7hVfLCqEYt4xlQoUkjDf98p8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZZYkLvR;
	arc=none smtp.remote-ip=74.125.227.198
Received: from mail-pi2-f6.google.com (mail-pi2-f6.google.com [74.125.227.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704C3606A33C
	for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 08:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 704C3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZZYkLvR
Received: by mail-pi2-f6.google.com with SMTP id 41be03b00d2f7-cdb536daf59so2063995a12.0
        for <loongarch@lists.linux.dev>; Thu, 12 Nov 2026 00:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471155; x=1795075955; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4Usv198qCvT1xdnr9OKW5ZLVCsGku8RkLVQlQ2znC0=;
        b=0ZZYkLvR2LyZUN+mbhnEyAiRZFLivEQeVkVLM5Bde5s7XTi3R5h7gGew2zCDtGcCZG
         ZaM7RI/kxsIQvAGUrM+PDAgo8LP4lbyjPjT5QQwjzE4KAZR/COXSHrssMsHwfPjZa7Xz
         QWPeHVsDV6j7VBwvG3zoe4o/v2Ymmo6kmweovVDmm2fomiWmtCzDQhfDTS4JwNrUgZxY
         uLjQXhhUC9DNttwcBIqRuwpXNpa7m/X00MSoi6ma3ynxmBPodv/sBgS8vwHw1iL5YcJW
         dSOhM+TB1sWY0T4lc95/4NxdnHb1y6rh1ZZ/h9HKLIEyQeG1/G6NLVltxy1xjpuXLR6e
         0Kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471155; x=1795075955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4Usv198qCvT1xdnr9OKW5ZLVCsGku8RkLVQlQ2znC0=;
        b=2bv72AdLAsnqOjithWxPXJBkosPrLfllmClekKSCvKA+wfP56WxZXb8CXdhLYNccP/
         ZsGNLUTlOBi+g04rVyFl9Mpu5ZhhuFNO2HbnCUykd9PLd3peiFffY7CGLn6Q5b2T5bT6
         F6weRV/0PEVyifCLsBf5T0jo3ozz+XOBgMsHZZjnwDxLStAeNnSiCJQufUV4kfDpl8C6
         ZR+9efMnNfjREsqKp2jmBJhSqNXXX871/Mmi/Y53ikioKLEfxBvrPXrsZt5gwC2Nd4Fs
         SWWRPx7SESFWQguyN7pzSJPBvMh1BSIdPqCkUXj1WOA1qR9FFQ8NXiSmfz0NCDr+R5j0
         x3CA==
X-Forwarded-Encrypted: i=1; AL+hErFCYKRVkM7vh5rA43vCQ9C7D3aMsT6tf52vrX2XwJjW/F85XbkIPKdBEsm9pYGMStYg6vCUDJyrJdA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Eg5PUjav3rohmGqCALdJsjPGKFispsCyzZev09WV7vRafN30B
	mBOOmoxO34XOLnMELFsF0l4baKKas0u8+c6COZvW2awh4cTCJxMN/78V
X-Gm-Gg: AYBFou1lc7KqsBSrvCUlmbjCwj0t9cGL4h6nTKdgXCd7axXndKsE5nR4lLzzWCE7b0Z
	bH5aEth0i3R5SdtDagDVCHbPbP22pTO+otEfNrebgG48QC20GoxguiTVBtqDNdv2TgiBol9I8VQ
	ZZsObqOOisPwIEmOD7uC5n/C+Xs4VtBDHTFdr9IzMHFDd40ReW8iY4PreVNDh8jiY1dObH+GQls
	IzKln6m0MNQXIhzv5STxJv/GsTrR5q0z8EXYFaxM/VWVKBBbGrmrEYQDHwYVNRcIbTwojel24ms
	NPTa8MrPnF+08yqELhh2C/s7pCzuEWBkGgOaIFjGVan9WMSHOYu2U8H47Ltb+M7hF1mR6ZGwBOP
	UcvR2hUodZ2IunyaiZBwb+CWCBF/oAcSX9Rko6WcUaWVlKQcVyBeHjCetc9VFhjFl8jgh66QCX3
	s011E6dHRTQiIFBK4JgCjNJA2KGm2kOUVVK1wqyCHpMxV2dl3qoP4xPExZoY49BARBoQ4J0a5WD
	CIS9zd9/KIrM7bmYCL4KhkmWA9Znx37TMll3xUdQu9B11ijG0cwKomdHIrhatcQanY1a+iKzV9w
	UFnuqIdDxAXNfpgFxlPb+9LvCrCgcGBIKAjgEw==
X-Received: by 2002:a05:6a00:1893:b0:89e:37b0:d1bc with SMTP id d2e1a72fcca58-8bc1cd62e03mr5111050b3a.28.1794471154695;
        Thu, 12 Nov 2026 00:12:34 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3eecsm3105447b3a.1.2026.11.12.00.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:12:33 -0800 (PST)
Message-ID: <210ff30c-17a1-4bd1-b943-34a1d0688e43@gmail.com>
Date: Thu, 12 Nov 2026 16:12:18 +0800
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
To: Mike Rapoport <rppt@kernel.org>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: robh@kernel.org, baoquan.he@linux.dev, m.szyprowski@samsung.com,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <7773d026-4aef-4169-866a-71ec9a91da21@gmail.com>
 <avLaJxIrrnMQngO9@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <avLaJxIrrnMQngO9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/10/26 16:47, Mike Rapoport wrote:
> Hi Wandun,
> 
> On Mon, Nov 09, 2026 at 08:23:16PM +0800, Wandun wrote:
>>
>> On 10/21/26 16:30, Wandun Chen wrote:
>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>
>>> On SoCs that carve out large firmware-owned reserved memory (GPU,
>>> camera ISP, ...), kdump currently dumps those carveouts as part of
>>> system RAM even though their contents are firmware state that is not
>>> useful for kernel crash analysis.
>>>
>>> ACPI systems already filter reserved memory out of the vmcore through
>>> their existing path: firmware reports those carveouts as unusable in
>>> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
>>> (is_usable_memory(), efi-init.c), and the ELF header builder has
>>> always skipped nomap regions; only DT-based systems currently fail
>>> to filter these regions, which is what this series addresses.
>>>
>>> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
>>> memblock to filter reserved memory on DT-based architectures. A new
>>> flag is needed because MEMBLOCK_NOMAP can only express regions without
>>> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
>>> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
>>> so kdump omits them; reusable CMA regions are different because their
>>> pages are handed back to the buddy allocator and may carry crash-relevant
>>> data.
>>>
>>> Since the reserved memory regions are filtered out, the vmcore is
>>> smaller in size and faster to produce.
>>>
>>> The series is based on linux-next and is organized as follows:
>>>
>>> Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
>>>              memblock, fold the duplicated per-arch memblock walks
>>>              into the weak defaults, and serialize crash header
>>>              preparation against memory hotplug.
>>> Patches 4-7: NODUMP infrastructure: switch crash_core to
>>>              for_each_mem_region(), introduce the MEMBLOCK_NODUMP
>>>              flag, add a dumpable flag to struct reserved_mem, and
>>>              mark /reserved-memory entries with MEMBLOCK_NODUMP.
>>> Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
>>>              ELF header.
>>
>> Hi all,
>>
>> A gentle ping on this series.
>>
>> I'd appreciate any further feedback, particularly on the
>> MEMBLOCK_NODUMP discussion and the issues raised in the Sashiko
>> review.
> 
> I'm fine with MEMBLOCK_NODUMP.
> The issue Sashiko raised about bound check against cmem->max_nr_ranges
> seems valid. 

Hi Mike,

Thanks a lot for the review.

Some analysis and plan about "bound check against cmem->max_nr_ranges":

After patch 3, the remaining race is x86-specific. The weak defaults are
safe: every runtime modification of memblock.memory, hot-add and hot-remove
alike, happens under device_hotplug_lock, so with the lock held the count
and populate passes walk a stable snapshot.

x86 instead walks iomem_resource, and Xen balloon inserts its new System RAM
resource before taking device_hotplug_lock() (reserve_additional_memory),
which is the one remaining hole.

The issue is also pre-existing: before patch 3 there was no locking at all,
every hotplug path could race the two passes.

The proper fix is to switch x86 over to the memblock-based weak defaults,
as patch 2 already did for arm64/loongarch/riscv. Would you prefer to have
it in this series, or as a separate follow-up? Both work fine for me.

> 
> I didn't check the reserved mem one.

The two Sashiko findings on the reserved-mem (patch 7) will also be addressed
in next version.

>  
>> Please let me know if there are any other concerns or suggestions
>> before I prepare the next revision.
> 
> I believe that should be rebased to account for reserved memory changes.

Sure, the next verison will be rebased on latest linux-next.

> The riscv change from resources to memblock needs an Ack from riscv
> maintainers.

Hi Paul, Palmer, Albert,

Patch 1 builds the crash_mem ranges for the vmcore ELF header from
memblock instead of the resource tree, so the later MEMBLOCK_NODUMP
patches can filter reserved memory from the vmcore on the memblock
side. With this, the vmcore size reduction the series brings also
applies to riscv.

Could you take a look when you have a chance?


Best regards,
Wandun

> 
> And with all that I can take the next version via kexec tree.
>  
>> Thanks,
>> Wandun
>>
>>>
>>> v8 --> v9:
>>> 1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
>>>    memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
>>>    neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
>>>    both are disabled.
>>>
>>> v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
>>> that approach is superseded here):
>>> 1. Stop marking /memreserve/ regions with NODUMP. v6 marked
>>>    /memreserve/ regions with NODUMP. But a bootloader may specify
>>>    a /memreserve/ entry for memory that the kernel later frees
>>>    (e.g. the initrd), and those pages would then be wrongly
>>>    filtered out of the vmcore after being reused as normal memory.
>>>    The v7 fix (clearing the flag in free_reserved_area()) caused
>>>    a lockless runtime mutation of memblock.memory [2]. Better solutions
>>>    exist but need extra preparation, so temporarily dropped the patch
>>>    that introduced the problem to keep this series simple in v8.
>>> 2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
>>>    MEMORY_HOTPLUG are unset. There the memblock arrays live in
>>>    .init.data, and the weak defaults referencing them create section
>>>    mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
>>>    is also unset.
>>> 3. RISCV recently gained crash hotplug support, so adapt its handler
>>>    like x86 in patch 3: use __crash_prepare_headers() instead of
>>>    crash_prepare_headers() to avoid self-deadlock.
>>> 4. Update the cover letter per review feedback: describe how ACPI
>>>    systems filter reserved memory and why a new flag is needed
>>>    instead of reusing NOMAP.
>>>
>>> v6 --> v7:
>>> 1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
>>>    marked as NODUMP may later be freed (the initrd, for example),
>>>    so the NODUMP flag must be cleared accordingly. Since the fix is
>>>    part of the NODUMP infrastructure introduced by patch 5, it has
>>>    been folded into that patch.
>>> 2. Drop the "generic" related description in the cover letter.
>>> 3. Collect the Acked-by and Reviewed-by tags received during the v6
>>>    review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
>>>    only one without a tag, as its Reviewed-by was dropped when the
>>>    fix was folded in.
>>> 4. Drop patch 1 of v6, which has been merged separately.
>>>
>>>
>>> v5 --> v6:
>>> 1. Serialize crash header preparation against memory hotplug to avoid
>>>    out-of-bounds or use-after-free issues.
>>> 2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
>>>    avoiding a panic from too few regions before resize is permitted.
>>> 3. Reordered the patches, put pre-existing bugfixes earlier in the series.
>>>
>>> [1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
>>> [2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
>>> [3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
>>>
>>> v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
>>> v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/
>>>
>>> Wandun Chen (8):
>>>   riscv: build crash_mem ranges from memblock instead of resource tree
>>>   crash_core: fold duplicated memblock arch hooks into the weak default
>>>   crash_core: serialize crash header preparation against hotplug
>>>   crash_core: replace for_each_mem_range() with for_each_mem_region()
>>>   memblock: introduce MEMBLOCK_NODUMP flag
>>>   of: reserved_mem: add dumpable flag to opt-in vmcore
>>>   of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
>>>   crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
>>>     header
>>>
>>>  arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
>>>  arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
>>>  arch/riscv/Kconfig                         |  2 +-
>>>  arch/riscv/kernel/crash.c                  |  2 +-
>>>  arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
>>>  arch/x86/kernel/crash.c                    |  2 +-
>>>  drivers/of/fdt.c                           |  1 +
>>>  drivers/of/of_private.h                    |  1 +
>>>  drivers/of/of_reserved_mem.c               | 18 ++++++++
>>>  include/linux/crash_core.h                 |  2 +
>>>  include/linux/memblock.h                   |  9 ++++
>>>  include/linux/of_reserved_mem.h            |  1 +
>>>  kernel/crash_core.c                        | 53 +++++++++++++++++++++-
>>>  kernel/dma/contiguous.c                    |  1 +
>>>  mm/memblock.c                              | 16 +++++++
>>>  15 files changed, 103 insertions(+), 94 deletions(-)
>>>
>>
> 

