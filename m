Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2094152522
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569722; cv=none; b=a4AymlvYgzpzdzuDJQD5DWZCaL9rBKTwHz5nLoXs0hi+bvd8UNRiWTW43Eh1OHUiJL7y1Yx8eyB/YyEOV7yP9q+HA+nMthek8rsfTlFWakci175JNzarKGexSx4Xb+UG0GMJSHTI9A3WYZMe/qZREpjvkjwg1guJ9T93zr1Aye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569722; c=relaxed/simple;
	bh=MzwBpy2FuowxhCGi0F1on+TpS6xpOXjA8uce1NQoqH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rq09lHwQ6FBQ0Y78q49viKe/8bq/4xGz8xN1J4mrQPxow/0EMRTs+fBmQI1o/STqwFakDaqerzvMIEahB7uZKUfZrP+QjigBuP585sXQaCpe719FX3VF3hM0WzfWiamw4+FUzeOJ6x4+iPlQBTaF29oQPMByEXWq13+IZ/VKuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Y9Qi1Dfp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Y9Qi1Dfp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1def89f0cfdso10667005ad.0
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569719; x=1712174519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfyGhgpaDuL/FUm+Bqequ3n7X/gQ/Scu0/x5tn5zB10=;
        b=Y9Qi1Dfpm5i5UP0+yVabL298QU3AS9qljKIKwUU8mBTEnuFjSoCMgVSJbP+Ud0sWBN
         WMrO8UXjSaVRGBFk/Rb0yVjHk/+OaI3LVjtHpKsLPxCnzAlm5KRYZLk5GUcsxc43b3UE
         uXCRf/rvKyO/A9o630WYQd0XdUvamElsFFi1YyaHt8gWWsfA3EVUF+oFCoqS3xmJLziO
         cH3M5wG+ctEogi2yxtIS8htdmNHuPpJrvwwYHFxjgHCpcb8Dl+KBK1f7ifOyunS7Pwru
         8iyvP5dEUET03Zg6ulKXMIZm8j5oFkWjFUBZGm4gZA8pZcZoRMclfrzDxvZYWVkZmI4U
         DgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569719; x=1712174519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfyGhgpaDuL/FUm+Bqequ3n7X/gQ/Scu0/x5tn5zB10=;
        b=Ve7PPQV3qE2bfn6k34c6IFuWEcyittqsheRSBM7/Tx3Szi0+z2T6pbmYQ7kNjOXwic
         Ds/iEeZy39Js1TH+RWa635Vwj43hKW+5ov9FOpjh82ZLaNMJLjhzz52MSpr4Gk44DHui
         cRgfWKQSlPZdVvW4UXBpRVdccX+8l9CUZ2914VcvdJj5fcites4lruieuyEEAH0XG4uc
         8/x60vKEz+prHUY4wb8+ELr/rGXSng6Q+QKHr3/uSGqTU6UPRAeYawrNgn2kyOOs2cKZ
         D1gW1mgx364fXfN9s3Dp2kK4BvJDLCDZOdz5fQfcfcF/5CsSquo3qMJkQ+bVoEz88iDo
         Ti/w==
X-Forwarded-Encrypted: i=1; AJvYcCXqZ9H0fHdiovZPi8+506IeOXxrHmRvFM8PZ2u3Kveu0ZuzSFI09E2RCGBolrl2dnaDmKkqOMukpc6EbqyevxZUGBTqsNOaOAcS
X-Gm-Message-State: AOJu0YzBPZlhkw1Kf4Y8uKz8VnVLv416HoMqP94F24fS9EhPpIeD1SpI
	LfW9zYgW2lRtVjqxkEq95QKT5LWmXv2//UsyvG6U+reRtDzf8etnVHwHrGG3vN0=
X-Google-Smtp-Source: AGHT+IEARU4E/EcVAHx8vARVbt2kMjNg+KIZramOtQSdDofKvpaWh4CU2DiZjPQFyzvcMxh9ySg0ww==
X-Received: by 2002:a17:902:d2cc:b0:1e0:e011:e3cb with SMTP id n12-20020a170902d2cc00b001e0e011e3cbmr442983plc.15.1711569718923;
        Wed, 27 Mar 2024 13:01:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:01:58 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 00/14] Unified cross-architecture kernel-mode FPU API
Date: Wed, 27 Mar 2024 13:00:31 -0700
Message-ID: <20240327200157.1097089-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series unifies the kernel-mode FPU API across several architectures
by wrapping the existing functions (where needed) in consistently-named
functions placed in a consistent header location, with mostly the same
semantics: they can be called from preemptible or non-preemptible task
context, and are not assumed to be reentrant. Architectures are also
expected to provide CFLAGS adjustments for compiling FPU-dependent code.
For the moment, SIMD/vector units are out of scope for this common API.

This allows us to remove the ifdeffery and duplicated Makefile logic at
each FPU user. It then implements the common API on RISC-V, and converts
a couple of users to the new API: the AMDGPU DRM driver, and the FPU
self test.

The underlying goal of this series is to allow using newer AMD GPUs
(e.g. Navi) on RISC-V boards such as SiFive's HiFive Unmatched. Those
GPUs need CONFIG_DRM_AMD_DC_FP to initialize, which requires kernel-mode
FPU support.

Previous versions:
v2: https://lore.kernel.org/linux-kernel/20231228014220.3562640-1-samuel.holland@sifive.com/
v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.holland@sifive.com/
v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.holland@sifive.com/

Changes in v3:
 - Rebase on v6.9-rc1
 - Limit ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT

Changes in v2:
 - Add documentation explaining the built-time and runtime APIs
 - Add a linux/fpu.h header for generic isolation enforcement
 - Remove file name from header comment
 - Clean up arch/arm64/lib/Makefile, like for arch/arm
 - Remove RISC-V architecture-specific preprocessor check
 - Split altivec removal to a separate patch
 - Use linux/fpu.h instead of asm/fpu.h in consumers
 - Declare test_fpu() in a header

Michael Ellerman (1):
  drm/amd/display: Only use hard-float, not altivec on powerpc

Samuel Holland (13):
  arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
  LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  riscv: Add support for kernel-mode FPU
  drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
  selftests/fpu: Move FP code to a separate translation unit
  selftests/fpu: Allow building on other architectures

 Documentation/core-api/floating-point.rst     | 78 +++++++++++++++++++
 Documentation/core-api/index.rst              |  1 +
 Makefile                                      |  5 ++
 arch/Kconfig                                  |  6 ++
 arch/arm/Kconfig                              |  1 +
 arch/arm/Makefile                             |  7 ++
 arch/arm/include/asm/fpu.h                    | 15 ++++
 arch/arm/lib/Makefile                         |  3 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/Makefile                           |  9 ++-
 arch/arm64/include/asm/fpu.h                  | 15 ++++
 arch/arm64/lib/Makefile                       |  6 +-
 arch/loongarch/Kconfig                        |  1 +
 arch/loongarch/Makefile                       |  5 +-
 arch/loongarch/include/asm/fpu.h              |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/Makefile                         |  5 +-
 arch/powerpc/include/asm/fpu.h                | 28 +++++++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/Makefile                           |  3 +
 arch/riscv/include/asm/fpu.h                  | 16 ++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c           | 28 +++++++
 arch/x86/Kconfig                              |  1 +
 arch/x86/Makefile                             | 20 +++++
 arch/x86/include/asm/fpu.h                    | 13 ++++
 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
 include/linux/fpu.h                           | 12 +++
 lib/Kconfig.debug                             |  2 +-
 lib/Makefile                                  | 26 +------
 lib/raid6/Makefile                            | 31 ++------
 lib/test_fpu.h                                |  8 ++
 lib/{test_fpu.c => test_fpu_glue.c}           | 37 ++-------
 lib/test_fpu_impl.c                           | 37 +++++++++
 37 files changed, 343 insertions(+), 190 deletions(-)
 create mode 100644 Documentation/core-api/floating-point.rst
 create mode 100644 arch/arm/include/asm/fpu.h
 create mode 100644 arch/arm64/include/asm/fpu.h
 create mode 100644 arch/powerpc/include/asm/fpu.h
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
 create mode 100644 arch/x86/include/asm/fpu.h
 create mode 100644 include/linux/fpu.h
 create mode 100644 lib/test_fpu.h
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

-- 
2.43.1

