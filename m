Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CEF146A99
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712148672; cv=none; b=OTKrpfsBTC00vBYeH1+IGyCy3LAzpEqaaa3mZWboEszT5+8o23WIGa3aj8mB85ELLLyUrgRWksx02+xvNxO/9XH0XZYXJ1BOOCWg39yox6MBLnE9pg+AlmrSnkN3HWmzOTeymsGzNyPiVQdT25higM9cJ4iqHWxy7YuMGUDRCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712148672; c=relaxed/simple;
	bh=zwy5/UeNKw0rdFTNUIENurIiqNiqQ2OzHWaKd+hx69E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCiEOOoSVq06tOmvJQibRuYZv+0GOgQhX2d/F8ktP57j1LvOC2dudHA8xH4n8I2LPnQF1rJiTFFpCE5kQWLxyY6FOe1PDARjrLAP3f0VbNc8FBpELmLg+FwC4uUKATUWzmhw2WmKPeeMfatzTc6IKNlxr8YP4QoTTzH/EuQms1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGoWRLnv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGoWRLnv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-415584360c0so27731095e9.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 05:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712148669; x=1712753469; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29BgQt41fxpDRMixAlECbaCmewv1mm5rdtRovSAulMA=;
        b=BGoWRLnv8rlRLv7GCIimx5HX/ZYSzHIPtmdMG0/vNNAmgb2P6+peoy3/ezza7jet85
         Th0kwFR+GxBssEmmKE1dpO13uLXSDSRlO655q/XKETkTLEpfuojrhO2W4ElKq8FHCplh
         StNm1ty9PEHJxPzV384ioxOmUuLUFGKnY3Zn339T6k7Auhemf3xf0TBqxkKksAvIP9/x
         V+1LsOhPDrthQaYMawbH2EGflcMmSLmaUySyrq2/s8+NXEwqu5XTtKnyLqCe2mqggQGt
         h7I7jNK7o4r7SNpor9oxSpXqP6yrT2Efi+W3SMJNe0PUO8Eff1rIQEyDUIOW6lArQtlY
         wFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712148669; x=1712753469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29BgQt41fxpDRMixAlECbaCmewv1mm5rdtRovSAulMA=;
        b=nNRgCZd21lsVDwsizsmhxq8d6N26WTjhgQ6qSDCy1kvKUFUFdySlMnBOMKbWGzlJ3s
         oLG7H+svSrYVT56K1IhKf0QIELUv9mmynRncVkOCL2c1S86So0OEr5rVhqujXp5qsozP
         5d0UlYwAa9ZVvaBgkV1MkxC5sx2HEdGxevk/8224rlsoF70etk2xS0+CcSIkbq/cZT0D
         rUiplFTnFDDJqV32VJ7VR27pxURsF1Q/m78ufdnTiyK/qgYfz6zNn466m8mv+04NB3L9
         tJJjGLEUgnvC6+VAygG6J+dQJ1Kp+EC4+ljR9F5e5MzqZs2tW7KqGjQM+veW/kBdHjTn
         ai9g==
X-Forwarded-Encrypted: i=1; AJvYcCVwtWLwhCi5Seu9ayrz90Im1xS3Iz0ZS74o0DTVXBUS1/X13HB5WA8PYrVqJ7fZ5uUbNvjTB9l5eK4mqfND07y3LdJnT/58LxYo
X-Gm-Message-State: AOJu0Yz2XfNQg5jKRL9sg/igbSvxImNBre4CiBplGeDjUW711WF4SFQt
	yE/7gxnxJG+xANT5QkKM3j2cJzkdsY3H0aU8ToNMTDqR8eB4zz5y
X-Google-Smtp-Source: AGHT+IGiMxFFkzEMKwErZDGMsEh8QQujgECEb7hAYrnmXSB8PanQ6hfDeg6f6lJ/1vv3KfoIi9fU0w==
X-Received: by 2002:a05:600c:5710:b0:414:9103:e38c with SMTP id jv16-20020a05600c571000b004149103e38cmr10494666wmb.22.1712148669149;
        Wed, 03 Apr 2024 05:51:09 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id dj11-20020a0560000b0b00b003437799a373sm3724238wrb.83.2024.04.03.05.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 05:51:08 -0700 (PDT)
Message-ID: <0c95aa84-63e6-41be-8c70-3a6dadefd682@gmail.com>
Date: Wed, 3 Apr 2024 14:51:04 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] Unified cross-architecture kernel-mode FPU API
To: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, "Wentland, Harry" <Harry.Wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I only skimmed over the platform patches and spend only a few minutes on 
the amdgpu stuff.

 From what I've seen this series seems to make perfect sense to me, I 
just can't fully judge everything.

So feel free to add Acked-by: Christian König <christian.koenig@amd.com> 
but I strongly suggest that Harry and Rodrigo take a look as well.

Regards,
Christian.

Am 29.03.24 um 08:18 schrieb Samuel Holland:
> This series unifies the kernel-mode FPU API across several architectures
> by wrapping the existing functions (where needed) in consistently-named
> functions placed in a consistent header location, with mostly the same
> semantics: they can be called from preemptible or non-preemptible task
> context, and are not assumed to be reentrant. Architectures are also
> expected to provide CFLAGS adjustments for compiling FPU-dependent code.
> For the moment, SIMD/vector units are out of scope for this common API.
>
> This allows us to remove the ifdeffery and duplicated Makefile logic at
> each FPU user. It then implements the common API on RISC-V, and converts
> a couple of users to the new API: the AMDGPU DRM driver, and the FPU
> self test.
>
> The underlying goal of this series is to allow using newer AMD GPUs
> (e.g. Navi) on RISC-V boards such as SiFive's HiFive Unmatched. Those
> GPUs need CONFIG_DRM_AMD_DC_FP to initialize, which requires kernel-mode
> FPU support.
>
> Previous versions:
> v3: https://lore.kernel.org/linux-kernel/20240327200157.1097089-1-samuel.holland@sifive.com/
> v2: https://lore.kernel.org/linux-kernel/20231228014220.3562640-1-samuel.holland@sifive.com/
> v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.holland@sifive.com/
> v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.holland@sifive.com/
>
> Changes in v4:
>   - Add missed CFLAGS changes for recov_neon_inner.c
>     (fixes arm build failures)
>   - Fix x86 include guard issue (fixes x86 build failures)
>
> Changes in v3:
>   - Rebase on v6.9-rc1
>   - Limit riscv ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT
>
> Changes in v2:
>   - Add documentation explaining the built-time and runtime APIs
>   - Add a linux/fpu.h header for generic isolation enforcement
>   - Remove file name from header comment
>   - Clean up arch/arm64/lib/Makefile, like for arch/arm
>   - Remove RISC-V architecture-specific preprocessor check
>   - Split altivec removal to a separate patch
>   - Use linux/fpu.h instead of asm/fpu.h in consumers
>   - Declare test_fpu() in a header
>
> Michael Ellerman (1):
>    drm/amd/display: Only use hard-float, not altivec on powerpc
>
> Samuel Holland (14):
>    arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
>    ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
>    arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
>    lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
>    LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    x86/fpu: Fix asm/fpu/types.h include guard
>    x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    riscv: Add support for kernel-mode FPU
>    drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
>    selftests/fpu: Move FP code to a separate translation unit
>    selftests/fpu: Allow building on other architectures
>
>   Documentation/core-api/floating-point.rst     | 78 +++++++++++++++++++
>   Documentation/core-api/index.rst              |  1 +
>   Makefile                                      |  5 ++
>   arch/Kconfig                                  |  6 ++
>   arch/arm/Kconfig                              |  1 +
>   arch/arm/Makefile                             |  7 ++
>   arch/arm/include/asm/fpu.h                    | 15 ++++
>   arch/arm/lib/Makefile                         |  3 +-
>   arch/arm64/Kconfig                            |  1 +
>   arch/arm64/Makefile                           |  9 ++-
>   arch/arm64/include/asm/fpu.h                  | 15 ++++
>   arch/arm64/lib/Makefile                       |  6 +-
>   arch/loongarch/Kconfig                        |  1 +
>   arch/loongarch/Makefile                       |  5 +-
>   arch/loongarch/include/asm/fpu.h              |  1 +
>   arch/powerpc/Kconfig                          |  1 +
>   arch/powerpc/Makefile                         |  5 +-
>   arch/powerpc/include/asm/fpu.h                | 28 +++++++
>   arch/riscv/Kconfig                            |  1 +
>   arch/riscv/Makefile                           |  3 +
>   arch/riscv/include/asm/fpu.h                  | 16 ++++
>   arch/riscv/kernel/Makefile                    |  1 +
>   arch/riscv/kernel/kernel_mode_fpu.c           | 28 +++++++
>   arch/x86/Kconfig                              |  1 +
>   arch/x86/Makefile                             | 20 +++++
>   arch/x86/include/asm/fpu.h                    | 13 ++++
>   arch/x86/include/asm/fpu/types.h              |  6 +-
>   drivers/gpu/drm/amd/display/Kconfig           |  2 +-
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
>   drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
>   drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
>   include/linux/fpu.h                           | 12 +++
>   lib/Kconfig.debug                             |  2 +-
>   lib/Makefile                                  | 26 +------
>   lib/raid6/Makefile                            | 33 +++-----
>   lib/test_fpu.h                                |  8 ++
>   lib/{test_fpu.c => test_fpu_glue.c}           | 37 ++-------
>   lib/test_fpu_impl.c                           | 37 +++++++++
>   38 files changed, 348 insertions(+), 193 deletions(-)
>   create mode 100644 Documentation/core-api/floating-point.rst
>   create mode 100644 arch/arm/include/asm/fpu.h
>   create mode 100644 arch/arm64/include/asm/fpu.h
>   create mode 100644 arch/powerpc/include/asm/fpu.h
>   create mode 100644 arch/riscv/include/asm/fpu.h
>   create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
>   create mode 100644 arch/x86/include/asm/fpu.h
>   create mode 100644 include/linux/fpu.h
>   create mode 100644 lib/test_fpu.h
>   rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
>   create mode 100644 lib/test_fpu_impl.c
>

