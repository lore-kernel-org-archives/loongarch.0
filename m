Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CEC6FA5
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nl60v+tB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d0bcc0c313so12829165ad.3
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 21:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014908; x=1702619708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y10I6kBvaoBdzCYCMFFIBpivZ4OdHpoiZkoWcSRPSMo=;
        b=nl60v+tBnZj8n5TrsG1dfJUqAJiCYIGExIBw6G6RfIGPwmvfQQJxuEvRiBY9avEnU4
         jdaIXl2o8VIevZe4kHzhkkp4nGHjJnhHpSuLRhoYA0KogxfMmjorM/i1fbAclSWwr6BV
         qwapWLHPIEwoFkShGcVC3ESTFuM/zaGW5a/uPvyg+LawB2hEg3DMCG5qnnZ3QugT4Tg3
         yN3y7CLriZFRzuaFQiEtLFtwdhBc2mdyGmXDR0yHfrREX4VhTJvk3yAdUenAy48rUACE
         WUac5NhLYexjaIOOE4GNfSh2bewgt9dB2eeCUsJNErriDa2620Jp6U5SGeW8NM2zd3mG
         ZF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014908; x=1702619708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y10I6kBvaoBdzCYCMFFIBpivZ4OdHpoiZkoWcSRPSMo=;
        b=FgD//Go4dYP6mvQY+o07c2sZPerY5piQLZn8MwU+uVUJqbqu55l2HsRx/bMyMH/Y9m
         5QdjDcgML1UMDVeeUX9SwGfIbF2U9WRszTrgE0bJspZ9SIo7ZSraP2Im2eYcTZUvCZz8
         dtCzuvmCBOuh85eECbx5knYfkbgFkeJW5mwFZjdYoLzAMrbQphopNJSu6NZiyRVAIVfN
         wBnnFZxWUmMqlxJTKvbFNrmknWxGFYsUgESnkFCIKL5WrJCDgUv8DsMq2POPztPEjsyB
         z9+CUXaWfnOJi8U95nLGKco1CX8bCcVfe9GM0eXBf4C8dX1NfgDwA0r5NBBKTDLHSRgB
         XSQQ==
X-Gm-Message-State: AOJu0YwkeFybIGfZoDu7S5GIyRuK6Coxh5fWMkvDutG9eGWCTHUih+Z0
	g+0+HrU2RoeMv5AvZxd9s8xO5Q==
X-Google-Smtp-Source: AGHT+IEV61WWeWMu7V3217Zpahk/hLH31IwX3YH3+NDaZQD5K6JU/sf2eERQjPEIU9FeQqZ//wlz9w==
X-Received: by 2002:a17:903:983:b0:1d0:bba1:57c1 with SMTP id mb3-20020a170903098300b001d0bba157c1mr3658032plb.78.1702014907827;
        Thu, 07 Dec 2023 21:55:07 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:07 -0800 (PST)
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
Subject: [RFC PATCH 04/12] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:34 -0800
Message-ID: <20231208055501.2916202-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm64 provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/arm64/Kconfig           |  1 +
 arch/arm64/Makefile          |  9 ++++++++-
 arch/arm64/include/asm/fpu.h | 17 +++++++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/fpu.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b071a00425d..485ac389ac11 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -30,6 +30,7 @@ config ARM64
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 9a2d3723cd0f..4a65f24c7998 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -36,7 +36,14 @@ ifeq ($(CONFIG_BROKEN_GAS_INST),y)
 $(warning Detected assembler with broken .inst; disassembly will be unreliable)
 endif
 
-KBUILD_CFLAGS	+= -mgeneral-regs-only	\
+# The GCC option -ffreestanding is required in order to compile code containing
+# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
+CC_FLAGS_FPU	:= -ffreestanding
+# Enable <arm_neon.h>
+CC_FLAGS_FPU	+= -isystem $(shell $(CC) -print-file-name=include)
+CC_FLAGS_NO_FPU	:= -mgeneral-regs-only
+
+KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
 		   $(compat_vdso) $(cc_has_k_constraint)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)
diff --git a/arch/arm64/include/asm/fpu.h b/arch/arm64/include/asm/fpu.h
new file mode 100644
index 000000000000..664c0a192ab1
--- /dev/null
+++ b/arch/arm64/include/asm/fpu.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * linux/arch/arm64/include/asm/fpu.h
+ *
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

