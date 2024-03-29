Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D542654FA2
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697107; cv=none; b=FCWnEOI7nhsDx2twGxz9NXi2wZDPSyHhG/B0bRYtDIiO+blUE4LMNzGuOT98GYEh9eAOE7LGZysSCbitqt60p8vozgL74QPn+mcKWjIDj0fzr9CAfoCexuBEaDa7iXbxtAlWW5r5zdWxc6xiDX9NWRrMA6vNI+GKCcoUnwRUlOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697107; c=relaxed/simple;
	bh=I+0r4Hpg2AV+IR63hJ4eeztxsB3ij6IQ6g/vrbDtN2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GEn9di71C1cBA2hU4Hzz94Tea2OMDqelzRHmXodQVg86SdTLpG1CFyVuuY+Pch2bbVprdvJMb1urXeoOwBKwzNUgjCdAv2tmDchy0yZnlPGTZ8v1nKFGlA6jyXpdImjnOAyOr9a0hGd9jkLwsmaPTvmaPNbgYbBNvswHsoaZ8GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=HHwfakHe; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HHwfakHe"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29f749b6667so1266603a91.0
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697105; x=1712301905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTLgc+w86CIzWS7wXUfx6m7PM9/cP8vcHn3CMtfjbTw=;
        b=HHwfakHeB++QrFSUtGnK/EatRg4ECRoHt3Lv4nOqUIFzrMFyZ8Fs8MxRArI+e+f2PR
         zRqjkXwDPTuiDyhesZvg+p/KEZCH2+Eh581bGhVgoYQo5h+ELx2rSWonVn6agX3FPUjq
         doW1aGkCwUAgMDwgstoXthFz9qwPblcELsAuR0DFr6/c+LXa6GGjmIbk7cqHyoTsN7zK
         43jjoB/2MYwAKvbGFKeXty+/1L+SZM47sOxXhkxX/h5qxvefsnX9Vp1RkW0DUVfY3xEY
         v3zG+bjr++Pevmi9KY2tzCMiaV5sim/1ZZ11cmaev5rf80NV9qZwidQVjUjBUPLN2QXB
         91DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697105; x=1712301905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTLgc+w86CIzWS7wXUfx6m7PM9/cP8vcHn3CMtfjbTw=;
        b=bE9rl7OKUuicP62WS0mOiXdw6X5FbBCvjkNufzj4uGNh5t1lsX+Y8ZVuPH+f9067mn
         fWRCA/E+DBRR64i0Otit48NGcCAoDUL7HMJJd1dHI/k8ITD0I4dRKBiOUxzzX2ipdB3N
         i71OUdaA7YxrvYCqJb0dM5qb+/NbrG1qwXC6+OLLA0K0YBtDhk2m/kOsLxJQDLlI3t0m
         WjCfkd/dcn8JDFlp5o243GuzCktKi0wiuiZD9fBHUIxEx6T4PrCSvHbNZbnsStGGxhOv
         hggeuz5rl+0y9/dj5P5wDMQahOfzQn4rfRa/rtliu6rOteSfbcwITmREfr0a1Dd7hvNa
         ozXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4qSmfqZ4xnZPatbbfutPU+JlAgqG+RyniwtNmiHgg7myB7p8jMpuItFDvQ//IlJWTHqg1P9Rf8JcPeIlIDfInVENPnCsSG1/r
X-Gm-Message-State: AOJu0YxQgX9rBZP5vYLNY7hTJyuFGgL2K+xlyIRqmu13BmjNa7abTBIv
	3UmzPeLC6QXNlejYwBGiS48g6mP8yYL8s1mBxWCwkYTpNGerqXHvpkWUwvBvcSA=
X-Google-Smtp-Source: AGHT+IFao8s2x1qXqbSOjOiMcaW8BXkO3qbDPzR4wBp4ZGBo4Mov4EtcdN3TNOFfEQHizvd+vN9IZw==
X-Received: by 2002:a17:90a:be04:b0:2a2:1415:723d with SMTP id a4-20020a17090abe0400b002a21415723dmr1167790pjs.42.1711697105239;
        Fri, 29 Mar 2024 00:25:05 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:04 -0700 (PDT)
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
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:28 -0700
Message-ID: <20240329072441.591471-14-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that all previously-supported architectures select
ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
of the existing list of architectures. It can also take advantage of the
common kernel-mode FPU API and method of adjusting CFLAGS.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Split altivec removal to a separate patch
 - Use linux/fpu.h instead of asm/fpu.h in consumers

 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 27 ++------------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 ++-----------------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 ++-----------------
 4 files changed, 7 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 901d1961b739..5fcd4f778dc3 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!ARM64 || !CC_IS_CLANG)
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 0de16796466b..e46f8ce41d87 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -26,16 +26,7 @@
 
 #include "dc_trace.h"
 
-#if defined(CONFIG_X86)
-#include <asm/fpu/api.h>
-#elif defined(CONFIG_PPC64)
-#include <asm/switch_to.h>
-#include <asm/cputable.h>
-#elif defined(CONFIG_ARM64)
-#include <asm/neon.h>
-#elif defined(CONFIG_LOONGARCH)
-#include <asm/fpu.h>
-#endif
+#include <linux/fpu.h>
 
 /**
  * DOC: DC FPU manipulation overview
@@ -87,16 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
 	WARN_ON_ONCE(!in_task());
 	preempt_disable();
 	depth = __this_cpu_inc_return(fpu_recursion_depth);
-
 	if (depth == 1) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
+		BUG_ON(!kernel_fpu_available());
 		kernel_fpu_begin();
-#elif defined(CONFIG_PPC64)
-		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
-			enable_kernel_fp();
-#elif defined(CONFIG_ARM64)
-		kernel_neon_begin();
-#endif
 	}
 
 	TRACE_DCN_FPU(true, function_name, line, depth);
@@ -118,14 +102,7 @@ void dc_fpu_end(const char *function_name, const int line)
 
 	depth = __this_cpu_dec_return(fpu_recursion_depth);
 	if (depth == 0) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
-#elif defined(CONFIG_PPC64)
-		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
-			disable_kernel_fp();
-#elif defined(CONFIG_ARM64)
-		kernel_neon_end();
-#endif
 	} else {
 		WARN_ON_ONCE(depth < 0);
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 59d3972341d2..a94b6d546cd1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -25,40 +25,8 @@
 # It provides the general basic services required by other DAL
 # subcomponents.
 
-ifdef CONFIG_X86
-dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
-dml_ccflags := $(dml_ccflags-y) -msse
-endif
-
-ifdef CONFIG_PPC64
-dml_ccflags := -mhard-float
-endif
-
-ifdef CONFIG_ARM64
-dml_rcflags := -mgeneral-regs-only
-endif
-
-ifdef CONFIG_LOONGARCH
-dml_ccflags := -mfpu=64
-dml_rcflags := -msoft-float
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifneq ($(call gcc-min-version, 70100),y)
-IS_OLD_GCC = 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-dml_ccflags += -mpreferred-stack-boundary=4
-else
-dml_ccflags += -msse2
-endif
-endif
+dml_ccflags := $(CC_FLAGS_FPU)
+dml_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 7b51364084b5..4f6c804a26ad 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -24,40 +24,8 @@
 #
 # Makefile for dml2.
 
-ifdef CONFIG_X86
-dml2_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
-dml2_ccflags := $(dml2_ccflags-y) -msse
-endif
-
-ifdef CONFIG_PPC64
-dml2_ccflags := -mhard-float
-endif
-
-ifdef CONFIG_ARM64
-dml2_rcflags := -mgeneral-regs-only
-endif
-
-ifdef CONFIG_LOONGARCH
-dml2_ccflags := -mfpu=64
-dml2_rcflags := -msoft-float
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
-IS_OLD_GCC = 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-dml2_ccflags += -mpreferred-stack-boundary=4
-else
-dml2_ccflags += -msse2
-endif
-endif
+dml2_ccflags := $(CC_FLAGS_FPU)
+dml2_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-- 
2.44.0

