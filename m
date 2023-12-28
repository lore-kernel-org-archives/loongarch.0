Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8CE15CE
	for <loongarch@lists.linux.dev>; Thu, 28 Dec 2023 01:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="j4OBkZk3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6d98ce84e18so3891033b3a.3
        for <loongarch@lists.linux.dev>; Wed, 27 Dec 2023 17:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727745; x=1704332545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuiZ+dA63qa6KuTRM/9EMSF12UiDXQURMhZ59hCd4g8=;
        b=j4OBkZk3PIxVQXsTD53JiBAIXv3LuZczVDRwdVHiREfKHp1quTM0MnMIjC9QzvqsLs
         5SpZqOunMngOUWgjqM/P+0TvTvlGraqL2mTrWWOJsEjT/UnKnsxkif5qMeSgepeHwyQ2
         CB8lBjSZzPpRaq2Q+ycWJfLlKmfR8YSAvEIuGV3qm3ibvZ4P+sYTc1rtqZqHGeP2iDvT
         b4CVcMcS0z5e29wXhgFsZHWIqiOiUYyPKPUO/NYLhCNJ4VEBDzmEpRc92of7iNwXkzu3
         k9Sy/u4BbQcLLE5N5aK6Jgv0wVa2O8m037go7Mic2y5nhDhEadjB8HZOpO+SgqezPqsQ
         wJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727745; x=1704332545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuiZ+dA63qa6KuTRM/9EMSF12UiDXQURMhZ59hCd4g8=;
        b=vhhdrwi2fKJGEajN1d52AaGkMahBZxbOmeby379JpPd5zW//EaYs8HB5yIlqCrQjCD
         3sgS/5LkWB1/a6+w6F8Bttr0ljaUjMoe8osw5QI50kD82Pf+CJiU4vWLsAyMmTN7loGN
         GNoI7LSeE/aCFCbwlzL8TNGiHc88tnPABRDrITNuNosim2UFJdrLnHpez00GLEEJd02y
         qTSboxsFhEDy6kwai84JR1qkgWDko9wKPxBfAA6Y/uv8O/DoY0+1voYEiII64BcCXnOv
         irJfF8nsGIhOsEDxS7380KvZLf2XwWpIV4+rWF32RHKsWmRC2b2xeHqEvDGR6wBE/xaj
         5lxQ==
X-Gm-Message-State: AOJu0YycE+ZSapu4BrcoNR6nStHiDWvvqZvWFL6h7THov329ALT9G82O
	E9DpXcqlV4A65A1aWL3rerulDiA7LJmorg==
X-Google-Smtp-Source: AGHT+IEILlR72JmnZxJTq7QER4Rq98IUb8qZ6aLblKynPh8gjQmZYjrM9YnZu6dduDjff4jpI/ud3w==
X-Received: by 2002:aa7:9142:0:b0:6d9:cbb1:7818 with SMTP id 2-20020aa79142000000b006d9cbb17818mr4021989pfi.20.1703727745150;
        Wed, 27 Dec 2023 17:42:25 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:24 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 02/14] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:52 -0800
Message-ID: <20231228014220.3562640-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Remove file name from header comment

 arch/arm/Kconfig           |  1 +
 arch/arm/Makefile          |  7 +++++++
 arch/arm/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/arm/include/asm/fpu.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f8567e95f98b..92e21a4a2903 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -14,6 +14,7 @@ config ARM
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 5ba42f69f8ce..1dd860dba5f5 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -130,6 +130,13 @@ endif
 # Accept old syntax despite ".syntax unified"
 AFLAGS_NOWARN	:=$(call as-option,-Wa$(comma)-mno-warn-deprecated,-Wa$(comma)-W)
 
+# The GCC option -ffreestanding is required in order to compile code containing
+# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
+CC_FLAGS_FPU	:= -ffreestanding
+# Enable <arm_neon.h>
+CC_FLAGS_FPU	+= -isystem $(shell $(CC) -print-file-name=include)
+CC_FLAGS_FPU	+= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
+
 ifeq ($(CONFIG_THUMB2_KERNEL),y)
 CFLAGS_ISA	:=-Wa,-mimplicit-it=always $(AFLAGS_NOWARN)
 AFLAGS_ISA	:=$(CFLAGS_ISA) -Wa$(comma)-mthumb
diff --git a/arch/arm/include/asm/fpu.h b/arch/arm/include/asm/fpu.h
new file mode 100644
index 000000000000..2ae50bdce59b
--- /dev/null
+++ b/arch/arm/include/asm/fpu.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef __ASM_FPU_H
+#define __ASM_FPU_H
+
+#include <asm/neon.h>
+
+#define kernel_fpu_available()	cpu_has_neon()
+#define kernel_fpu_begin()	kernel_neon_begin()
+#define kernel_fpu_end()	kernel_neon_end()
+
+#endif /* ! __ASM_FPU_H */
-- 
2.42.0

