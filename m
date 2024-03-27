Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E43152526
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569723; cv=none; b=uP/XSaXvqqlfQ4flJcA/eEyfTCHaqQh+n/c+Yoxw0N3qugcAUeWlrs9kEd2pMwR72p6I8Gj+Y3yRUxpjd/7LOb1X9I8xiJbV4HYZmjPQ6PkLhYUxPy5cS3oC4fVP1WOgAruR5ofw+rJ2qnT/y/AkeSfb2D2x2fo6X3S5cxi60xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569723; c=relaxed/simple;
	bh=i2lJ+jD1bLDg/bvc+g8utHsarI18UNXJm0eesaXfmls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HClZwuzJHvm8wqgUuM5le0HmaU+MlpGvarRrGMw2tQJFERRF7l/DMD4ZUcjzaPbvXP63O7kbWwdEFJ/FaCre+Fr0Er9i27x7+0al/iKe45tui3FhxKqs+WV5At387lsjBAlltmp6IyvqRkwLNK2tjSMlKFzzELMOYMBq7x4/fE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Jnijh12b; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Jnijh12b"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dee5ef2a7bso1953895ad.1
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569721; x=1712174521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im7zmQeDt7pZodE0p+VySjAa7DBv0KaW+gKoLu+LS/g=;
        b=Jnijh12bUYyo7mLzCprssBWuRO4a1olBWkFRBm4+HLLey/btXHG6WhIKdrTaQoYyPs
         gvP2TpnD9vwORJYxRgccbTHyj/Q+ZqfOSK+k4E34UlPQe+dfw0F3ZaqycDH05gLqIOea
         SYhahMhiqKuSYKBuqC4b2vpOlohFQyP+6gmcnbIm1V/OI2W/GeSA0TVJfMLd/KdMCf8x
         12rltViD6NSHDui13KuPzxG7BzsWE+M5exV0Ivpb/16ROVPBK3raazOW3hX83Es9ugK2
         d+mlnQw84TVnNSG3Ja4MvIUgp8JXCcucE7j+rY76WF4H2xJLUPyeIustn72LPSJY/ROW
         gc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569721; x=1712174521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=im7zmQeDt7pZodE0p+VySjAa7DBv0KaW+gKoLu+LS/g=;
        b=IR0zHNiJAP/KDs+6r4FJTcTHWqdxQ0mHmfq6gy7VGbLEXB5Chq/piDxwnGKq7UpaT5
         nqQZpux9jCNEGAUisoV3e/4qWmtbL8AuccC5wPzsXQEJhKjetNdhOinvyOCkFwI1eQXV
         cXR9xYOAkroDp3UnzGcapiSXc1AOrt0P45008rdjdnz3xoGkUflKCC1+njqSdRG/dS3E
         vwIvIlaOSA6WX0i9x0dmsKGoewjKROPwEJ0AI5KmXiWvA5AIlJ/4HmUi+EBNA9l43uyF
         1q+EdgFrwBsRfKWes0114y1UzLrMik8gdEhjbuYebO0eyyJ8EKO5gsHFw3+fze2I+sQy
         /A3g==
X-Forwarded-Encrypted: i=1; AJvYcCWvLtNbR5CoUjM5quiK4LzUeHTKoketfFrXNn9EvF4F9Lva+BY0fji28MUX4VMCdjLjKzyHvXonK9OkyLAyRlh8bWSUfuYMLErB
X-Gm-Message-State: AOJu0YwaC5+mHQtt0znASrcimEI/W0ntjdjcYVaXPL//MPWbh0NDCQEG
	GCwwbPQctouXu/s044xfPqZ4LVuAQzEMvpJOn049IC8oDBLQpqajibuqjlmTNyM=
X-Google-Smtp-Source: AGHT+IF+ykWlXq/2p9fLdxe5qiT+fQJVLXU8yD1cTqgZWIiJ9yzpflW/8jhLl1LVX7Yz7XdGYJsgng==
X-Received: by 2002:a17:903:28e:b0:1e0:d6ce:7e16 with SMTP id j14-20020a170903028e00b001e0d6ce7e16mr805365plr.15.1711569721663;
        Wed, 27 Mar 2024 13:02:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:01 -0700 (PDT)
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
Subject: [PATCH v3 02/14] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:33 -0700
Message-ID: <20240327200157.1097089-3-samuel.holland@sifive.com>
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
2.43.1

