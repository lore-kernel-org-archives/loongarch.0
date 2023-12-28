Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29079C0
	for <loongarch@lists.linux.dev>; Thu, 28 Dec 2023 01:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="kw8USU2j"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bbb4806f67so1797154b6e.3
        for <loongarch@lists.linux.dev>; Wed, 27 Dec 2023 17:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727754; x=1704332554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eH3LxR+7tKPhQkN8usVAFkK9L6kG8awbjmN4hDMh6eY=;
        b=kw8USU2jA6B8RrvrjrvNBpEX/Dw61WIxDQeybpObUU4ynksz6zi6ag5rxkxjLIVSVF
         f2U3c/VTWVkpXyBu8ReeWB2lNFePsZ+o0Ru4aqv2vFi3pCuFFlLESyDB6/0H99JP5YYG
         bxOoLgJSYzUpZf9A+FHvQ3Vpcg6sKOrG2W/8yAATVcNGEAsnEURCUedjlUZO8CCGKcQB
         ys8+yk/zFay6Z3fhlTeX3/lXPrs3ZilVLYFCFj0N0Ah2scv04wwr7jkcZ3LehWxceNJb
         0m1/ro7klXiYsl7CFHRSWkDCvfpt0TK8GEpQtZosmjYFoOf8bp6/j34sGVFdEbR7h3Vg
         DxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727754; x=1704332554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eH3LxR+7tKPhQkN8usVAFkK9L6kG8awbjmN4hDMh6eY=;
        b=PXrcUdCm16zD7/Wu64zt6fV1UYEkrB7qddev/PP7RPfRpX4H6ZUQhImGrFm8f9wQBj
         F8dI2JJUOTcZxNYKT7rGafswWRGJzUxsFahNK50Q1wHbUPgRGVY7yXxSdcP+bzCVEnzw
         KNj9ppf5cgq7nE+GS44g2X+xwji2ge/L+gwzl1KVIs1g0szj8Qqrx0wKyxLgDPH10eMc
         OWJzDoMqo3hFENayOkmBgkS/Lk0zBrYZ8H+HbJ2m2vcM42CMS77HVXbYNXjxe4Jt/KcD
         PQcUoWB8pfudbxrn0AyFpoPhXRTmhjCBAE8NoscHneUQuQmll6GlklUGOfc2gwqnatFR
         9Vtw==
X-Gm-Message-State: AOJu0Yz1w0fkUf9an7gc622ZEfycLL+awA2xar4jTW/cQ8qQwUUqm/tt
	GvTS5cwc7SnzDn2B4HPCNR/1IprsfgaItg==
X-Google-Smtp-Source: AGHT+IFEpLCvQycB9Oz1224kGaB5IW+nw3w8GCtWHxMOhFrbIq/NPFVjqUIq8RXAsL/B2ql/Y5FiAg==
X-Received: by 2002:a05:6808:2204:b0:3bb:6f23:8244 with SMTP id bd4-20020a056808220400b003bb6f238244mr12160740oib.70.1703727754042;
        Wed, 27 Dec 2023 17:42:34 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:33 -0800 (PST)
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
Subject: [PATCH v2 09/14] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:59 -0800
Message-ID: <20231228014220.3562640-10-samuel.holland@sifive.com>
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

x86 already provides kernel_fpu_begin() and kernel_fpu_end(), but in a
different header. Add a wrapper header, and export the CFLAGS
adjustments as found in lib/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/x86/Kconfig           |  1 +
 arch/x86/Makefile          | 20 ++++++++++++++++++++
 arch/x86/include/asm/fpu.h | 13 +++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/x86/include/asm/fpu.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3762f41bb092..1fe7f2d8d017 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -81,6 +81,7 @@ config X86
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64
+	select ARCH_HAS_KERNEL_FPU_SUPPORT
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1a068de12a56..71576c8dbe79 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -70,6 +70,26 @@ export BITS
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 
+#
+# CFLAGS for compiling floating point code inside the kernel.
+#
+CC_FLAGS_FPU := -msse -msse2
+ifdef CONFIG_CC_IS_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
+#
+# The "-msse" in the first argument is there so that the
+# -mpreferred-stack-boundary=3 build error:
+#
+#  -mpreferred-stack-boundary=3 is not between 4 and 12
+#
+# can be triggered. Otherwise gcc doesn't complain.
+CC_FLAGS_FPU += -mhard-float
+CC_FLAGS_FPU += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
+endif
+
 ifeq ($(CONFIG_X86_KERNEL_IBT),y)
 #
 # Kernel IBT has S_CET.NOTRACK_EN=0, as such the compilers must not generate
diff --git a/arch/x86/include/asm/fpu.h b/arch/x86/include/asm/fpu.h
new file mode 100644
index 000000000000..b2743fe19339
--- /dev/null
+++ b/arch/x86/include/asm/fpu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_X86_FPU_H
+#define _ASM_X86_FPU_H
+
+#include <asm/fpu/api.h>
+
+#define kernel_fpu_available()	true
+
+#endif /* ! _ASM_X86_FPU_H */
-- 
2.42.0

