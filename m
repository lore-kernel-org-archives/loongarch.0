Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096336FA5
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 05:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BLsfI5KN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d0b2752dc6so15623075ad.3
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 21:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014905; x=1702619705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S9qeMKPrbOjny9ys0DNZnwzZdal5DwwFbQdO5IaRKs=;
        b=BLsfI5KNHujQAmzZwsruUT8qm7kYiFr0rU1+lLloMByNlCjCP1T/MvzDjiTUSpOM2N
         Vwneis0p4usMa7PbC+/lm7Qwj1yJa6E4bdQk7vwK1LGNfUVSdJ8Bd0slvbP4bR87IDzU
         U1q+BMUl24Cwp2qP7CPO92rowxHXMAXQOVM+MtcNIWfylvmUXsPe23zVhxK32uCLLerv
         nArvrdvmbhgwBXcnU5vNfBO61n2ulJshoOpSuR/9H6CbVJ6vAU69zm7hStje7ghnwU3k
         PIA1iagnm7Q+Tjsn5xIpGmdhJCh3SH/crxKnAcs57yNNy6U1FxrKbkiSd9zTEK5UVt3o
         rpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014905; x=1702619705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S9qeMKPrbOjny9ys0DNZnwzZdal5DwwFbQdO5IaRKs=;
        b=ujanbaBhbxZuq941zaWfYxYsJt04fx6Tb95grofEj9WE5/Yxa4nNnvcm+YwBYAuy8x
         vZ6ifBNdgl7eZuKOzrvSe015nLIzjo2JPbrIikVSrMJD1j4hqUNtyeDMCpI3OmLMC0C4
         yjBXqLLvfc+7cBYNGryLUpWi2jz//8ElagPAt5SJ+u7aaxzRn5bJHQR3Q1UUxSpxWwfR
         BoTRmuwhSG7xpU46cPb1bKWXBfGzwVkumqSJPHEujYlsqfQjnu4MLfZ7g5U4qF/bsz9o
         MshZoVdUNCHjxfJ13sMCzuZ0RBwWgu03Te0h5Eixkv3S4+U3HgXafFk39UIhC7P9S85W
         sfrw==
X-Gm-Message-State: AOJu0YxKbb6Iccl3hpVclGAUcZ4rBDiyoqY6NX41dVXUggbjWw+d9mRu
	kxTBnQbTY9nIVTcVIFAI1ErByw==
X-Google-Smtp-Source: AGHT+IHfVmDuQcwcTNkJBCCNyd1od5dj0sgf6cJP7ZkJkjT+CFkpOEIDhByDVUVjY+z9LFISOIDfEQ==
X-Received: by 2002:a17:902:6844:b0:1cf:b190:ea07 with SMTP id f4-20020a170902684400b001cfb190ea07mr2955137pln.21.1702014905389;
        Thu, 07 Dec 2023 21:55:05 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:05 -0800 (PST)
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
Subject: [RFC PATCH 02/12] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:32 -0800
Message-ID: <20231208055501.2916202-3-samuel.holland@sifive.com>
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

ARM provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/arm/Kconfig           |  1 +
 arch/arm/Makefile          |  7 +++++++
 arch/arm/include/asm/fpu.h | 17 +++++++++++++++++
 3 files changed, 25 insertions(+)
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
index 000000000000..d01ca06e700a
--- /dev/null
+++ b/arch/arm/include/asm/fpu.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * linux/arch/arm/include/asm/fpu.h
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

