Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D7640847
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697088; cv=none; b=PD4K/QUkGZyo6T/J+g9nMqgDPC95FIPdkEjigHKBApxXjLagqwC0TG/skI5X5jSNgul8TqVrJH+oJr9uk9z2aSOz3vfIZ4PSMCGuM1H5QoAlhx6i40l46wbwFJPxjAXGdAyRh8aJtmwzzBytdBwQ4K7PpgBaH9lNEGS28sOwG+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697088; c=relaxed/simple;
	bh=WqXru62SFMywMewjfUP4xNPknFPzvsORsGQu0rgWXTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHlqAvZx4s/o2c/5XHuR5voHD+MWV/KsxUuhVI2fRjtmGqQm/rvz7q0hBqZfxsuftR15wgPUvQPPh3CZS5daIB+jJ3HSZtQY0aMOjq9uLQ2OQ8jWMyH9BKQFhRTtu9pD0CCO153xbIuKXEuyZT0KhGS3BUYUMstfz1BQ8HwkQJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=iNeNqaP1; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iNeNqaP1"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso1352802a12.2
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697086; x=1712301886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfeToGq8Q96lZ3sXR0xrZDFoq0gdI38cqcIbuzYANg0=;
        b=iNeNqaP1yLkVMO54M+NrwUA1ygTKhuynHBM+H0A+I+TxvzL9bwdTiiCUx9SKM2uueW
         ytkDlbnLo9NcIBnwVWcSnE2HlKhsJhCkzR2zk3TNeBNQtoyz9iYHqGW+6O2Z7fn+ivc0
         V/4qoZlVwib6PHxFTYtoAIWF5EhwmnriiW3gQTI9RHr7Wqii4HTY1MwFE7n/lx+tathb
         dh3at7ahe0rfBCQgIudnbQwR2EMNvjnt8xwgFjfO6LMQCRCBf6rtBYMIEq+Qi3bOfC6w
         VLadzXcSfHtYluHKw3UvDxGtIzmRR3xHyKxKHjdQeiR5wOrPtNJAtzS/07HNK1s5AjOv
         yCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697086; x=1712301886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfeToGq8Q96lZ3sXR0xrZDFoq0gdI38cqcIbuzYANg0=;
        b=mhxAIX20Yy3GZxklJ4rW+yUOdROevNnlClxssMHX7+CvyDtXfWWFz0sM3Lq50k2non
         TE/lEgojJL7TpiH4ee0W196clnivwVwVZRnhTbBvYSQwpyGTfpiT0UHt17+Amx6T/VA6
         pwGVYxyytXLhpGqBc2TU47FGEHYq6j4iLkj7cVCxAheBxjqvIMl1NLibi/PW+gZJHid9
         11qtNOZXaAKoqrLuqTf3i1Cl9rRwJCdHmtr0JHbmpfE/518hOroM+YbHhThrgh9OYDli
         RI8waq18MxLooMdlwkUyB7ecQWHeTge6go20KeP0hQqkV2MEkzC7jBoQC6KOnTakFmJQ
         evRw==
X-Forwarded-Encrypted: i=1; AJvYcCUyV6YkZJD4YQhqm3BuHxgY7o5PK9Jt2aBNsJttBwN2shTPYbs2O8o6lCwIEB5Wz1ERm/W5ZWsFX4xZRAUGmrJx9ztyI/lU2zWw
X-Gm-Message-State: AOJu0YwuJJY2bGVPsrwS0KQHCx9eey2NCQn2/1HImmhCrZxC3V3mNeGT
	gosfB3+oN6hPVex99XkSj/71MosJ62AcBwVfzs1O5rB/4M3+9YcT5ue0sY4s1C8=
X-Google-Smtp-Source: AGHT+IGQfC9gwOMWVs1GDk/ouQ8mrl3lJb1JowaZL6ev/gV/g9creRjfkW6AQIWqS7U8Lf5+l0COxw==
X-Received: by 2002:a17:90a:4594:b0:2a2:88d:cdcb with SMTP id v20-20020a17090a459400b002a2088dcdcbmr1743529pjg.26.1711697086007;
        Fri, 29 Mar 2024 00:24:46 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:45 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:17 -0700
Message-ID: <20240329072441.591471-3-samuel.holland@sifive.com>
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

ARM provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Remove file name from header comment

 arch/arm/Kconfig           |  1 +
 arch/arm/Makefile          |  7 +++++++
 arch/arm/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/arm/include/asm/fpu.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b14aed3a17ab..b1751c2cab87 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index d82908b1b1bb..71afdd98ddf2 100644
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
2.44.0

