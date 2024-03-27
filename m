Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DD91514F7
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569726; cv=none; b=oWRnqfjW0ZItAirGr2m9BbriXx06jzv8gz1ozYge5firsWH7ZupeA5nCLuur+yUAr+U2YVcE/d5UTlaTBrijOh0Way8ImJ1bApgILAZ4my/AHrbFB1pFXP56EgZ/f/IwXEpgR2uvlkkPgKzR8alkrJ79xrs7EIiSAXvv80u7SmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569726; c=relaxed/simple;
	bh=wYz6G8q6oWeJ4Uvu53c3haCJoG+yI+ujZ5wIFjhs26U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ee1iZF+ISOax9c2gLMLOOFRiZH/UFlSYDSza412dG8lNkIWwUTFOW69WdLWZUSzJF3h+D1j+P1mWxfJVEQlaZrolWbQazKcHwCEPoRY7TfYnnFQbBLZ2nJO0dZeqtno2bc6iIEjeJF/fCq/hu6xwgaXPboNeNUJ976eYxq/cCi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=cQfcxBps; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cQfcxBps"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e00d1e13acso1824535ad.0
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569724; x=1712174524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YKNt/WF/wnD0YRJEikw0HuScFyU0745kXYQrNfvXV8=;
        b=cQfcxBpswFFnfR37rbmrMu6V6amqiw6UQKPkcnZUI98AqpJkA6Cq6dlEGIQ5d1fZce
         Lol+CVGpd36UoyMWk70bwm9q+v4eurX8JkPebT0p6gzBcgEGTK844slKeZbWXpRQVNfO
         N92Xr5JQrKm86IBW555mfXxNK6bdxebO330OjYyGfcZeEzooV0XkpKjUuX292pNEYYnd
         eBv9Ar4rOVZjn0pv3SuVwxi41cdyPCjd1KuOjTKMdJBluGokn59GchJBcxnEX0f6Fx1F
         ZKCE5IDGPqzMcVfCGXC1E7tFfBueLeim1cje+g/NbqgS1GEl4LHOMjn50FV6jd8/pvEt
         VYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569724; x=1712174524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YKNt/WF/wnD0YRJEikw0HuScFyU0745kXYQrNfvXV8=;
        b=lciAV6AWWGrmhj4jiYOniaItrno8Xez1UXGI5f1oRir34pOy27Bf7q3hBXh9no3fEM
         P8Clnmb9Wz7YYRzxIPwvijrx69Ayywb9KGpFR9NqbVi25hUi82Ez7HSW86oJplNrUG5P
         UUyrY80mHEMi59bSFgL5WEQza7jEHdXIfCznaDykvBsoUHR5diz2X79MweoqL1ct7YfG
         DffoPj6eeS4p8SkQxWPFatcN8xwlrc8deLZkzfs/EdFDBEW/tFG2cVd2S4OrK1IqULJr
         DpTflDg3V7783QTrlndfEEzOHMm5C1H1J4NaCiAtlaZ1dc8cyNWZpnf416RtQb76suoy
         FwTw==
X-Forwarded-Encrypted: i=1; AJvYcCXMuhSe8EipaHfRMWGLo/4owg9j+Nq02j1L3N5YMUZoZwELlgy4kI6nICwfkVv9KA0JX3YEVhyrJu8GaG0TpnSIhQA1BYbH0Qd8
X-Gm-Message-State: AOJu0YwnGBJIcU2wYf+9Ipny1C60NPd+I0UXf3IhKVCAoid+0F53/RIP
	0khDnI26Yik8/O7dkejmHkE+MrJGe+BkTLTxYw5ufIr9ySQYLjgT+lzN4NIEvbg=
X-Google-Smtp-Source: AGHT+IFfqF0zaQyhJG4fHFNgO9YCVd9dAMtKWVHSa8WQRo1J9B12INfMAAQOQNi7OQwx6x82eCY8tA==
X-Received: by 2002:a17:903:8c3:b0:1e0:b874:1e5f with SMTP id lk3-20020a17090308c300b001e0b8741e5fmr850196plb.65.1711569724329;
        Wed, 27 Mar 2024 13:02:04 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:03 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 04/14] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:35 -0700
Message-ID: <20240327200157.1097089-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Remove file name from header comment

 arch/arm64/Kconfig           |  1 +
 arch/arm64/Makefile          |  9 ++++++++-
 arch/arm64/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/fpu.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b11c98b3e84..67f0d3b5b7df 100644
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
index 0e075d3c546b..3e863e5b0169 100644
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
index 000000000000..2ae50bdce59b
--- /dev/null
+++ b/arch/arm64/include/asm/fpu.h
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
2.43.1

