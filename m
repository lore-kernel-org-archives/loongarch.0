Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227014;
	b=bCW+/Hwy6wwFmVBkNaOC6N/nmYpzs+psawPJxbZtpBSi7SSECbj57vQiIkIuJHgdSlrI
	 Cq14iQyzdF937Cf6b8468Wm7Ip/LMLKudOXBjsc+Gd5awi6AcnIcCdNLbJ3vumRKsPido
	 3x2tmKQpxfYqzOjhUnFB7qxghdg0GTQkvrIDbwEuUPzC6NTF6szr8wtr/VfAynVdzy1NT
	 p1RFmWIZ5k+/DLVQML4ucAea4UCr9Bg0icXQNyNRbfbiAwyeBNTmKyxYt8TvitA2l6dLw
	 p/cLJiie2jwGJnsqW3j2gNbitf7SYlI5SJNbVDGDfBNdo+1+6JOBNXtoKRxWzCqRXpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+tF8l8wiFwVnoygmXpYnREIWubWMOLu/o49/XwgRJmA=;
	b=IsTPz9i+Em+J7cCLgyU7bgWGRifOIIMi7D6onwYI1Y0/eNHLOSO8DFf9WY4xj3MzsxYL
	 qFDgkrd1wpmmzCVAq2UfEJUBL1V412ntWbEKQEwbIqz3jTilxlBUEV/HLzVqmcmbNTkUz
	 Fxm89V6hHQgx+HWU8jkUF9w+Vdc6tFIQ0CH8F3uu96LwDBgDp90G2OX9u/4ySl5M52qR3
	 u7llitZdZMIaBQWk9xBXXvN5MXsOHOLjV3RRRCJ9Kbaz+s1xZ0TZxpFhmlm6++xxbG5MH
	 x4g841BA3/yV9eLyqu9lgF8rvGLeYuceX2B6MD+gSA6EFSqDPKCXDabcIDxZGCuIt/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDTLuzuR;
	arc=none smtp.remote-ip=74.125.227.203
Received: from mail-pi2-f11.google.com (mail-pi2-f11.google.com [74.125.227.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3599606D81E
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 12:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3599606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDTLuzuR
Received: by mail-pi2-f11.google.com with SMTP id 41be03b00d2f7-cdb56646435so122344a12.0
        for <loongarch@lists.linux.dev>; Mon, 09 Nov 2026 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794227013; x=1794831813; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tF8l8wiFwVnoygmXpYnREIWubWMOLu/o49/XwgRJmA=;
        b=bDTLuzuRhnF13cZK5Naxg6nD1/T6X0Tz3msgLgrO0QsK/HAjIuVtVNLNV497yN+r/S
         7CInX+ja7a1l1MF/jGwKFLIWf9gVN3GWu69GEZlLvA5mLle/gUfpkhI2xEzh14CXtO1e
         /ACvM5get8OI1s23bxCV+1CB77NQsJ/b2pxvsQ410pQGXUaiEOZVXFOkaneVOQMd7JkF
         aYE5QmPFkEuBF20hGnVTHKS0dWHUoSrkLLnb2dmOJiWElJa2bTlVEn2p2cjc2FW6tyJx
         LVpSKGViUz1aaVrpj/owpp+RoeTnk7UI9owkk3UkTC+7O3DFO8rllC0cTa5wY/sNWjXO
         /6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227013; x=1794831813;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tF8l8wiFwVnoygmXpYnREIWubWMOLu/o49/XwgRJmA=;
        b=Fft2ju1nkX8hRVTCj+JRrU9w8z+8lpuQsAenSJV0/OepGpchENy2OW4tRyWMN0Pnjr
         eF9Z4AtYEkal3Bmmb/FvaovcfXnpBR3Bc5SjKPFy+Z3dwPyQb4xeLuIMySch5jpYP98j
         kKpnSEKqqPNROvT/BRbCTkiO/OPam3WMB/T0G8Dt97pfOwG+1oYzpCJBmD9ap/tBpVil
         sTvggEzZKIadniOtP/hOS7BDfDtzYJRARwwhGSlj/fYAu/0XD5+XSulrdkm5BMY4M0xu
         IYtoP1jdVWE7DK8i5AWMEkufZL1bET4JtM1BxWBMfI14IfTKBxkMqtuzOrRbLAWz8HYi
         mkyQ==
X-Forwarded-Encrypted: i=1; AL+hErEbpdg75xOtRouoKv33DfPk5tkmz770k0b06BtT9zl9w/+O/1/A4xRv8YMQi6ePEhtbUcRajBpg7Qc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8um4flXtiVgpS51aHHlemKpdde619kqsByVAt3e5PMRbiVFEY1
	Q8oonbYQkiKcK5FBp8UgdCxNgZGTTYFudp5uoGPGrN0bYze/DkrcEAGT
X-Gm-Gg: AYBFou30chHqF1P4gjIZjdFPihiztVwuIhF/D9icqOoH7Hm5XUGwWUsGD2ILHSdxYWK
	qHNbY6MPhSQi+pcAm0lblleFd7gEIz5s08+wBBOLnGQ7nfBsVp2SSpWixgGAKXxlQjbk+jn0lKT
	zFqvCuLLajWMT/DE9+NTpSeBzdIZ6K4ivx5xT1uMKAH1Bb1JwCwDu5Nfsq7/dfnMgDbmll6m1ZZ
	3Sktdmv9tGAWQop6e0GQtmj/CoKlpoPE9Wdh6n0CP+DXOegtRQfzqqoPAhy0UojP79asL3XUzWA
	ZiHFiZhiz+qGmcd4OwMZKZo81/YR0MRFDwpxq84BMW/TQb08lkPqrgRD2rL+u+JrC3N9jppwUmi
	C8glP3RaTgamozLhk1AlT9p95aWOQul5YaWM2sTD6OG5l8VagwYpn5EusdnGnmfc3iQP2zDqiQ+
	7Z+04wvS5SbPU/Jl/VkRMd4cX4sSFIoRZQkcRWJ7ytN4vb6U8LNYoZjje4OKTAQb86L10+wB1yq
	LQwoh+L82kXjhJvBtVuXPjJudhUuYuJZl6L0lkBe8JJnXBET0kXUG9zgXNBFgCRxyD76AMNR8F6
	0Ro2L24DiZvocHsNRPROtpVfX8pDRhH3V0k=
X-Received: by 2002:a05:6a20:7f89:b0:3eb:afe0:20aa with SMTP id adf61e73a8af0-3eed2e06bb1mr3837559637.20.1794227012895;
        Mon, 09 Nov 2026 04:23:32 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96816fc6sm1622392a12.5.2026.11.09.04.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:23:31 -0800 (PST)
Message-ID: <7773d026-4aef-4169-866a-71ec9a91da21@gmail.com>
Date: Mon, 9 Nov 2026 20:23:16 +0800
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
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
Content-Language: en-US
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/21/26 16:30, Wandun Chen wrote:
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

Hi all,

A gentle ping on this series.

I'd appreciate any further feedback, particularly on the
MEMBLOCK_NODUMP discussion and the issues raised in the Sashiko
review.

Please let me know if there are any other concerns or suggestions
before I prepare the next revision.

Thanks,
Wandun

> 
> v8 --> v9:
> 1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
>    memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
>    neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
>    both are disabled.
> 
> v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
> that approach is superseded here):
> 1. Stop marking /memreserve/ regions with NODUMP. v6 marked
>    /memreserve/ regions with NODUMP. But a bootloader may specify
>    a /memreserve/ entry for memory that the kernel later frees
>    (e.g. the initrd), and those pages would then be wrongly
>    filtered out of the vmcore after being reused as normal memory.
>    The v7 fix (clearing the flag in free_reserved_area()) caused
>    a lockless runtime mutation of memblock.memory [2]. Better solutions
>    exist but need extra preparation, so temporarily dropped the patch
>    that introduced the problem to keep this series simple in v8.
> 2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
>    MEMORY_HOTPLUG are unset. There the memblock arrays live in
>    .init.data, and the weak defaults referencing them create section
>    mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
>    is also unset.
> 3. RISCV recently gained crash hotplug support, so adapt its handler
>    like x86 in patch 3: use __crash_prepare_headers() instead of
>    crash_prepare_headers() to avoid self-deadlock.
> 4. Update the cover letter per review feedback: describe how ACPI
>    systems filter reserved memory and why a new flag is needed
>    instead of reusing NOMAP.
> 
> v6 --> v7:
> 1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
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
> [1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
> [2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
> [3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org
> 
> v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
> v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/
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
>  drivers/of/of_reserved_mem.c               | 18 ++++++++
>  include/linux/crash_core.h                 |  2 +
>  include/linux/memblock.h                   |  9 ++++
>  include/linux/of_reserved_mem.h            |  1 +
>  kernel/crash_core.c                        | 53 +++++++++++++++++++++-
>  kernel/dma/contiguous.c                    |  1 +
>  mm/memblock.c                              | 16 +++++++
>  15 files changed, 103 insertions(+), 94 deletions(-)
> 

