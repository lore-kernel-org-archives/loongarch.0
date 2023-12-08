Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D026FA5
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 05:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fZH/KgKl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d0bb7ff86cso21343245ad.1
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 21:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014903; x=1702619703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIC4glHzB+IOAGM7YCu4gQFdGXeLpWj/I7OZVSGOh7k=;
        b=fZH/KgKly7t9b6TF3XflzXuKFuHgM2ywDXw2ygVmrJJA8asgRRM6MVwsl8QCYR+LsF
         kwmWEsoxovMaNSlugTn+jbEZ2oiRn/5v64gFD6jexxEBq086si/nd2OTvApuqa2PUoT7
         CeU3t7/5YFlGGTXPMGwEWndHMgGQ4u5PmfbC29PKA2sv2/xEC2ZGT4p8sxFgzrqk0Cf6
         XbeIhro3/mAQLfDFRyYFeIXsVVqaYA6wJjkjpOGcVNB7Fx3De9R74rW9ZJi+7movPGQ5
         yEwg5HdulNFiBDz8/VL/Jlt2XUY+vQ0wdOWQRQnhUCLPNzFy0O1sL9wzlcWSNlxUl/J+
         A65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014903; x=1702619703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIC4glHzB+IOAGM7YCu4gQFdGXeLpWj/I7OZVSGOh7k=;
        b=XnjMFB9BLtq7xx1jp6sqiZ4li+/BLaCwq3j5hBVd9P6o6FIRaUCDTuWn6msM88zwVt
         eq5JbdJAPQjNJ1QDS0Wz8qMC+U1ct2h8Dev15Q1PnsOisV3pLIgXZWrv9xA/ma/blkJI
         whgw+ZDg3CURiQZpqz0DgKq7qb/m2ejk9+VDeMWrIbOK/mV1hCRCkrShgBK/0l8O/y/d
         6gb96+7fXSTs+DOWWUG/SsWR0uGRodc/FHNcFZJrz1d7HXxvDMlW5m8jDhR0pwlhaeMp
         L0+dQhheWPWhEKV0fMQP8OHL99ZZo9yV5LrFTaxq1HS34kiL6B2cA9PAXlibPAUSIx80
         tVlQ==
X-Gm-Message-State: AOJu0YxfTByIR8J8VyomtBkBHDYsx0iJNMOUu1c3vR/WawMQZ7E5IHHA
	Qxg6O1Uw5daPcSJj2K0zE16P/2jBXvhu/skShfE=
X-Google-Smtp-Source: AGHT+IHobgnIbAqUwh0qy5g87XS9Ops6tA3mZ0Tbbi2vny+WXvVENlMrplaMBh4oGzh2rC3HGh0NRQ==
X-Received: by 2002:a17:902:c20c:b0:1d0:6ffd:610c with SMTP id 12-20020a170902c20c00b001d06ffd610cmr481032pll.46.1702014902890;
        Thu, 07 Dec 2023 21:55:02 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:02 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 00/12] Unified cross-architecture kernel-mode FPU API
Date: Thu,  7 Dec 2023 21:54:30 -0800
Message-ID: <20231208055501.2916202-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series supersedes my earier RISC-V specific series[1].

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

[1]: https://lore.kernel.org/linux-riscv/20231122030621.3759313-1-samuel.holland@sifive.com/


Samuel Holland (12):
  arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
  LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  riscv: Add support for kernel-mode FPU
  drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
  selftests/fpu: Move FP code to a separate translation unit
  selftests/fpu: Allow building on other architectures

 Makefile                                      |  4 ++
 arch/Kconfig                                  |  9 +++++
 arch/arm/Kconfig                              |  1 +
 arch/arm/Makefile                             |  7 ++++
 arch/arm/include/asm/fpu.h                    | 17 +++++++++
 arch/arm/lib/Makefile                         |  3 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/Makefile                           |  9 ++++-
 arch/arm64/include/asm/fpu.h                  | 17 +++++++++
 arch/loongarch/Kconfig                        |  1 +
 arch/loongarch/Makefile                       |  5 ++-
 arch/loongarch/include/asm/fpu.h              |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/Makefile                         |  5 ++-
 arch/powerpc/include/asm/fpu.h                | 28 ++++++++++++++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/Makefile                           |  3 ++
 arch/riscv/include/asm/fpu.h                  | 26 +++++++++++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c           | 28 ++++++++++++++
 arch/x86/Kconfig                              |  1 +
 arch/x86/Makefile                             | 20 ++++++++++
 arch/x86/include/asm/fpu.h                    | 13 +++++++
 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 33 +----------------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +-----------------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +-----------------
 lib/Kconfig.debug                             |  2 +-
 lib/Makefile                                  | 26 ++-----------
 lib/raid6/Makefile                            | 31 ++++------------
 lib/{test_fpu.c => test_fpu_glue.c}           | 37 +++----------------
 lib/test_fpu_impl.c                           | 35 ++++++++++++++++++
 32 files changed, 255 insertions(+), 185 deletions(-)
 create mode 100644 arch/arm/include/asm/fpu.h
 create mode 100644 arch/arm64/include/asm/fpu.h
 create mode 100644 arch/powerpc/include/asm/fpu.h
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
 create mode 100644 arch/x86/include/asm/fpu.h
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

-- 
2.42.0

