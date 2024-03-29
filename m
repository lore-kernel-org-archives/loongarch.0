Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0780B42055
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697090; cv=none; b=tbHM2/VnHcWkrM8Z/Btis1AjD6oanRtMYxtG2RA6LMhQ61iXUoVsfVZZvGpiqUlSPiOUU0pgL+/0EoW5znETk4dwzhCozTZbm4TNyL8HVz+LpRY1oRdsUl3O5uA6AG+Dz3PzfgBE5+EKxeFC/azc/AGxRQWpEupJjjwrW3MB5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697090; c=relaxed/simple;
	bh=D7Uft9YmOHR561uZNDC4DNCSuflFcrKCYb4nSPMUGXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4gFE4RxfDIUK3dJiCnc8tzyeqghl2U5wzx/51/5hhXVAnUtZk/u1SyvXXEGFMiOTr86IxP2EdgRh3vVJb5hipfj6hAIHwQC9+fFK3IpaihGclm1hg9Zj6cdkZaLY7TGaIt5FMZutR0g6SCIxrIASbz/QSd2D2DFUKrpYWLhdMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=BcC519Hg; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BcC519Hg"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so1255919a12.1
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697088; x=1712301888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaG/5r11zMVVbJK9XMgdhlmzZC0nXZGHxxAlEP5YrDw=;
        b=BcC519Hgv+BvaZfXAlq5Us9qGkHyYVf+MzlL7pwGONEIRx+7vdJ5T+Y8zG5//ubm+R
         JIIgdwCwVdhw9rujoHCS07cpkcSAqfZy7+zB8uEyFSoccvgpSWsTzhYK93z9bmG7OLrn
         5FOcjT4s/MVBar8Qf4s1Jg2ueuoNGRFl9bStR/lJ4m/cdyot7CMwELmEH39XwUAvcCTw
         iDYKEaZADcQsYNTTZGapjSP9xYNMBKu8LP8kLxAGQl2FUpWtOllV9DytBW8BrxgJK5O0
         B7x+Uiw8x/vbHsh6EN27ehzoweq/vyncjR1CcQBYyQlivRSwY9/LYJywSEpAtkKw5KRK
         1q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697088; x=1712301888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaG/5r11zMVVbJK9XMgdhlmzZC0nXZGHxxAlEP5YrDw=;
        b=lN52N5ReY8vN9GTiz9mdAg/1k1O5712GGtBP9tC9C5f3b/w1hMinAyzcJ+2t1XoHkx
         g6/RqTymmeKRXQZ/NKLtMIzt0//JESx224mnYw9e6Rz+KVU/FJJTYVRM1TnboCtM6+fe
         j5Z/qZ0avZvoHtqfm2kfSCJP6/VQKclPsX9OBEzfaFVpqLSDPzBcJ6hQPfwxprmIr6Aa
         3SFXGmHU3e/s7YGbAuimosWl2zVOf5kU/vpnkIptzWbm4R7smp2o+oEvdimYYpyrXFya
         +8mcoZ19JfxV07ocsO2Ehgph/9CIKo7GTKYJchwCERACGo/nZTuq7AKFlQTY9yBNiF+T
         Shog==
X-Forwarded-Encrypted: i=1; AJvYcCW73SXRzNmdbX2tu8BiO5DsvaKRBArncg8734L66PNaWHfqrH3sq13DGZDx3Y8/XShhNMk9Qg/9m2BpRbINsFZTKfZtjI5FuMgz
X-Gm-Message-State: AOJu0Yz/UliM1m90cynl+6lvrQHrLlE8LdZvDXVTD7SXdf/r9Y4zDFSA
	+D1CMDtyp//aSQl2UjrmaMUj1IT4TbX2Z4z3NGgp2sB/iNYu1UPea0RkbMR3Y4s=
X-Google-Smtp-Source: AGHT+IHyYuok2TNfdiOcE/l5igRa3fLGWQKdU9IqGK1Jb+NsKkae7YWqfCeB+c37aWtPbJ/1sA02qQ==
X-Received: by 2002:a05:6a21:6d9f:b0:1a3:55d2:1489 with SMTP id wl31-20020a056a216d9f00b001a355d21489mr1432790pzb.7.1711697088383;
        Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
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
Subject: [PATCH v4 04/15] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:19 -0700
Message-ID: <20240329072441.591471-5-samuel.holland@sifive.com>
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
2.44.0

