Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB20B350298
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 03:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120867; cv=none; b=FaK61IR6VYBeuKpkApV90gnp1E+8Qv71DWc8Vwub+vfhXzAImFhNeuKOOtbNhd9l2qiQBOnb01AhKZkSE1USecIhLZ+XeXb4gHJKee5fBF1SY70nITLvGPf/XVJuIpbjNmkg72Vu7R3TkNUwMfxwRjk76pnKKJsHhAvnnSJc4Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120867; c=relaxed/simple;
	bh=T1hXkWwf1Ky3PIGLKl38skTFM/Wejn1S9poV/mkIkiY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=h7Hcc4yAEnTwWLoOMpp2FnGiomUAqfysp21PcbCEVcDe0b6LlH7SMLYsbZf44D6k6K9vOYqZW/kcClMjcZz2sAspoQbnMRPplsRKGtnvQJ5UhlX3sXL47kL07Dd4bfR6VDuOmBkMTs4oZBtq+oKXP94vyDJcBSZ4wPYdxpJlY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC6mePwh; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC6mePwh"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3ab37ea4798so1984761a91.0
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 20:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120865; x=1792725665; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLv1jdYPShZUl6WRXA2OAAq/MQ9I53lb2Im743pbZNE=;
        b=BC6mePwhOob/el5wt3JQT7qRnBGpcCp856DgdbKRCUpRldrVmGSZhcD51n3CeEfaZE
         7E1tE9uc10cZoxaKOCd58/TC1rRbe7JQevmtQX9kzR4S5hceOkpNRsH2c8sIr0icoEZE
         x3AgzzR+Kb3erzzkixNQ9q7riM1BrEx45UeoG8dHrqmAvjTxnR9CLTaZuoR1H+c+iF0e
         hdQtvwHPvqnKPdF5kJM+gSp1T8yLM4t2J8nJ42gN2it1nATuPv+2Ei5QKIToZsZUapj3
         k0yz0s6k7rLLu1gUzc4hZ/TK4eiNVuqnW85UvYnl76RQhAPGXFnCkEe3frkhtc/8NLYD
         JGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120865; x=1792725665;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLv1jdYPShZUl6WRXA2OAAq/MQ9I53lb2Im743pbZNE=;
        b=BxPZlFd4Qs2DwKfvZvdETN3YpLWslYi54laKo27UfDABtIDvBpLCLO8rhpy/b7Z755
         MDhPK33qNtS4HB6HgAmxfbjs1/XzsVsWSrzPxoZ15AR0XqL2Lk9JSd2OGugg5xW5xTsT
         Uhuk5/n+QM9405K8+6Rr+AYt+KZMHE6+CE0j0qzlmanHHZE/yaMBlPTCt7gO/zzbGcpJ
         spiWV0sQ028X2H/f9WiTHzTdhfvVBtqWBIcoXZI4D6l7Ubv9mTVDI1P/dgli/2YvPzRN
         xkSsyCxqPodrMnCcLhK2fwHgsUQEIPCGE3EOEovJchYLGxRz+yKvdMSCGF09M35+jZPP
         dLNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsrBrVk+sD+6qjgjjwen2iz4EzIIvW/vM44MLI1yVMuh+MxCdC2qDv8Azcgvhx2OitXrPgQXUbP30=@lists.linux.dev
X-Gm-Message-State: AFq9FYLvg3sxnpxHuNKSa92gBFGh4cn32/GaoOdwvJ99iu9Ra3S6vWVS
	oFi74lWMLQT8pL73cdrIJg+Nt5G5maWNUp++llX++R1zKlJtCsFBDGA8
X-Gm-Gg: AYBFou2B/oPl4kzRdh5qnGH8338R2m4tGPFhoQGOYTEgLV5qW9Jz53/5MbPX39FECQQ
	bx/isUcI/RTX0NoLwc9mNXU6FiBaeJtTsXZcS6+VLvpcTDqSmNYzfVHoZFhYNCrx7t+i0ByeCIy
	Hdi7jm6hMh2/0KgbjdFrfixO23xPddm6HlPAAvLpkG3QE/Gmk3xtCcRz30NMOPMhXuzb875qGfI
	iVRol6IBfUVuh51aWJPXOstGFDnAG+uInkYHQC/qmotZo/hbzAzKztHloeqgea//rxc6la2sYvt
	AaiR4nGPIowtGCXEdJ/Alf23RrU1K1yXSV4QRI6HjjHB/jrkOuNafIfXVKSXxBDNPxqxtBzMjVe
	jKEjjjHOeR27niJu06kEQmSSUBsOmyRLi7CDEHd02u+IFWdI8u/S7otVotjnPjnSbBxD4Dw5MGW
	+dl2NgioV6P453bGWQDC09TkiSXd+SkqLRXCW7JlsGeie1tkhE+sJkQE9kkMTsPcv9buLjXbEoE
	1krSQ==
X-Received: by 2002:a17:90b:1801:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3aca11a7d89mr3638559a91.16.1792120865028;
        Thu, 15 Oct 2026 20:21:05 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm7959974a91.9.2026.10.15.20.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 20:21:03 -0700 (PDT)
Message-ID: <643bbd4c-1041-43b9-9362-17c5330fc06a@gmail.com>
Date: Fri, 16 Oct 2026 11:20:45 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] kdump: reduce vmcore size and capture time
From: Wandun <chenwandun1@gmail.com>
To: robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org,
 m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
Content-Language: en-US
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi all,

My SMTP server hit a temporary error (4.3.0) partway through sending
this series, so some patches did not make it to the list. I will resend
the whole series later. Please ignore the current incomplete set.

Sorry for the noise.


Best regards,
Wandun



On 10/16/26 11:08, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> On SoCs that carve out large firmware-owned reserved memory (GPU,
> camera ISP, ...), kdump currently dumps those carveouts as part of
> system RAM even though their contents are firmware state that is not
> useful for kernel crash analysis.
> 
> ACPI systems already filter reserved memory out of the vmcore through
> their existing path: firmware reports those carveouts as unusable in
> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
> (is_usable_memory(), efi-init.c), and the ELF header builder has
> always skipped nomap regions; only DT-based systems currently fail
> to filter these regions, which is what this series addresses.
> 
> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
> memblock to filter reserved memory on DT-based architectures. A new
> flag is needed because MEMBLOCK_NOMAP can only express regions without
> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
> so kdump omits them; reusable CMA regions are different because their
> pages are handed back to the buddy allocator and may carry crash-relevant
> data.
> 
> Since the reserved memory regions are filtered out, the vmcore is
> smaller in size and faster to produce.
> 
> The series is based on linux-next and is organized as follows:
> 
> Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
>              memblock, fold the duplicated per-arch memblock walks
>              into the weak defaults, and serialize crash header
>              preparation against memory hotplug.
> Patches 4-7: NODUMP infrastructure: switch crash_core to
>              for_each_mem_region(), introduce the MEMBLOCK_NODUMP
>              flag, add a dumpable flag to struct reserved_mem, and
>              mark /reserved-memory entries with MEMBLOCK_NODUMP.
> Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
>              ELF header.
> 
> v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
> that approach is superseded here):
> 
> 1. Stop marking /memreserve/ regions with NODUMP. v6 marked
>    /memreserve/ regions with NODUMP. But a bootloader may specify
>    a /memreserve/ entry for memory that the kernel later frees
>    (e.g. the initrd), and those pages would then be wrongly
>    filtered out of the vmcore after being reused as normal memory.
>    The v7 fix (clearing the flag in free_reserved_area()) caused
>    a lockless runtime mutation of memblock.memory [1]. Better solutions
>    exist but need extra preparation, so they are left out to keep
>    this series simple in v8.
> 
> 2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
>    MEMORY_HOTPLUG are unset. There the memblock arrays live in
>    .init.data, and the weak defaults referencing them create section
>    mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
>    is also unset.
> 
> 3. RISCV recently gained crash hotplug support, so adapt its handler
>    like x86 in patch 3: use __crash_prepare_headers() instead of
>    crash_prepare_headers() to avoid self-deadlock.
> 
> 4. Update the cover letter per review feedback: describe how ACPI
>    systems filter reserved memory and why a new flag is needed
>    instead of reusing NOMAP.
> 
> Every patch in this series now carries an Acked-by or Reviewed-by tag.
> Patches 2 and 3 have changed since v6, but the changes (a build fix and
> a riscv hotplug adaptation) do not alter the logic the tags were given
> for, so their tags are kept. If any tag should not be carried, please
> let me know and I will drop it.
> 
> 
> v6 --> v7:
> 1. Fix a stale MEMBLOCK_NODUMP flag issue [2]. Memory reserved and
>    marked as NODUMP may later be freed (the initrd, for example),
>    so the NODUMP flag must be cleared accordingly. Since the fix is
>    part of the NODUMP infrastructure introduced by patch 5, it has
>    been folded into that patch.
> 2. Drop the "generic" related description in the cover letter.
> 3. Collect the Acked-by and Reviewed-by tags received during the v6
>    review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
>    only one without a tag, as its Reviewed-by was dropped when the
>    fix was folded in.
> 4. Drop patch 1 of v6, which has been merged separately.
> 
> 
> v5 --> v6:
> 1. Serialize crash header preparation against memory hotplug to avoid
>    out-of-bounds or use-after-free issues.
> 2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
>    avoiding a panic from too few regions before resize is permitted.
> 3. Reordered the patches, put pre-existing bugfixes earlier in the series.
> 
> [1] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
> [2] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
> 
> v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
> v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/
> 
> 
> Wandun Chen (8):
>   riscv: build crash_mem ranges from memblock instead of resource tree
>   crash_core: fold duplicated memblock arch hooks into the weak default
>   crash_core: serialize crash header preparation against hotplug
>   crash_core: replace for_each_mem_range() with for_each_mem_region()
>   memblock: introduce MEMBLOCK_NODUMP flag
>   of: reserved_mem: add dumpable flag to opt-in vmcore
>   of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
>   crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
>     header
> 
>  arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
>  arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
>  arch/riscv/Kconfig                         |  2 +-
>  arch/riscv/kernel/crash.c                  |  2 +-
>  arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
>  arch/x86/kernel/crash.c                    |  2 +-
>  drivers/of/fdt.c                           |  1 +
>  drivers/of/of_private.h                    |  1 +
>  drivers/of/of_reserved_mem.c               | 15 ++++++
>  include/linux/crash_core.h                 |  2 +
>  include/linux/memblock.h                   |  9 ++++
>  include/linux/of_reserved_mem.h            |  1 +
>  kernel/crash_core.c                        | 53 +++++++++++++++++++++-
>  kernel/dma/contiguous.c                    |  1 +
>  mm/memblock.c                              | 16 +++++++
>  15 files changed, 100 insertions(+), 94 deletions(-)
> 

