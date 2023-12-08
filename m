Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C406FA5
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 05:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SLDyJFev"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ce28faa92dso12880455ad.2
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 21:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014914; x=1702619714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYvZSY93/xrjeeL5ETwAXbtukKNXxCCQ4+T0woOWU40=;
        b=SLDyJFevXw5gmJD6YA9X/Mue+UJF8GoIU7MHMYbfZK+ebAgVEBG6BDJZqk6EBBgJ4D
         D2Hin7GVcGWn3k+Ug4ZJHeKO9C0Nar+P1EL9EZvtSTzBIDFyMwSDdpkfHdOz51k3+sI0
         Blx99QFvBhJssvDqjhCj4wxm1ZzqfO2BFmsaKldF1YBaWp5wvvZgt8DXOdUnMRA6sa18
         oBQLRvLWnYe5viB8QPJNKyl+GEZXSS4I5dLFNB3jKYs076iKvLFLl8jFWXm+TgYrDOFa
         i1rFCkDSBBegiplOsMVKuZ5gX9akZCS+syKgFqdgTy0AzHhXUrRRO380+kYhshnXS9Pb
         mGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014914; x=1702619714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYvZSY93/xrjeeL5ETwAXbtukKNXxCCQ4+T0woOWU40=;
        b=jMxwvkdCZDe7wk47p4b4jOgweBhZwML6CJWiQMtoigbA41tLFr7ulOgSFSgMNKJN0J
         KJDJk4meqPhu2ogi85BomsUnNDAG1u7eOzgUvZKgHJHht+BMGOzn/h3QMnkQD6pyIZZd
         oA4eWGsQNnSW5f9aksxHx+nkbGWgVfi/FXihlcjvc9NJT3imOkiDAnIKsGC7Q8Kyjp07
         0AwEI4fKF17/JPLSGh4+4kLXvXAVywjPqnxpHS8ehHXbkPIP1mADSDbidasB6hh1aEjz
         iAKGY0VWF7Gf3itHi84eSGtDStgU6VbHL+YNPKRFLYzdBWrs85rB6MxW2iCV1ADrYluQ
         7YZQ==
X-Gm-Message-State: AOJu0Yz1yQlySb4so7Sk+pM1eUkcoNZzz0VRWU/BWRksAALx46v3DVY9
	K/nqwNfiAwsZTFesHpiYWTLIuA==
X-Google-Smtp-Source: AGHT+IEX6fsur3fhby/cWKLu/7STh1pjdXEZxMWOcghK1shSxSRPNcFQAcmIt0ejFquarrBp9mMVPA==
X-Received: by 2002:a17:902:e541:b0:1d0:a084:affd with SMTP id n1-20020a170902e54100b001d0a084affdmr3001010plf.73.1702014913936;
        Thu, 07 Dec 2023 21:55:13 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:13 -0800 (PST)
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
Subject: [RFC PATCH 09/12] riscv: Add support for kernel-mode FPU
Date: Thu,  7 Dec 2023 21:54:39 -0800
Message-ID: <20231208055501.2916202-10-samuel.holland@sifive.com>
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

This is motivated by the amdgpu DRM driver, which needs floating-point
code to support recent hardware. That code is not performance-critical,
so only provide a minimal non-preemptible implementation for now.

Use a similar trick as ARM to force placing floating-point code in a
separate translation unit, so it is not possible for compiler-generated
floating-point code to appear outside kernel_fpu_{begin,end}().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/Makefile                 |  3 +++
 arch/riscv/include/asm/fpu.h        | 26 ++++++++++++++++++++++++++
 arch/riscv/kernel/Makefile          |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c | 28 ++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..cf0967928e6d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -27,6 +27,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if FPU
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index a74be78678eb..2e719c369210 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -81,6 +81,9 @@ KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
 
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
+# For C code built with floating-point support, exclude V but keep F and D.
+CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
diff --git a/arch/riscv/include/asm/fpu.h b/arch/riscv/include/asm/fpu.h
new file mode 100644
index 000000000000..8cd027acc015
--- /dev/null
+++ b/arch/riscv/include/asm/fpu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_RISCV_FPU_H
+#define _ASM_RISCV_FPU_H
+
+#include <asm/switch_to.h>
+
+#define kernel_fpu_available()	has_fpu()
+
+#ifdef __riscv_f
+
+#define kernel_fpu_begin() \
+	static_assert(false, "floating-point code must use a separate translation unit")
+#define kernel_fpu_end() kernel_fpu_begin()
+
+#else
+
+void kernel_fpu_begin(void);
+void kernel_fpu_end(void);
+
+#endif
+
+#endif /* ! _ASM_RISCV_FPU_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fee22a3d1b53..662c483e338d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_FPU)		+= kernel_mode_fpu.o
 obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
new file mode 100644
index 000000000000..9b2024cc056b
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_fpu.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#include <linux/export.h>
+#include <linux/preempt.h>
+
+#include <asm/csr.h>
+#include <asm/fpu.h>
+#include <asm/processor.h>
+#include <asm/switch_to.h>
+
+void kernel_fpu_begin(void)
+{
+	preempt_disable();
+	fstate_save(current, task_pt_regs(current));
+	csr_set(CSR_SSTATUS, SR_FS);
+}
+EXPORT_SYMBOL_GPL(kernel_fpu_begin);
+
+void kernel_fpu_end(void)
+{
+	csr_clear(CSR_SSTATUS, SR_FS);
+	fstate_restore(current, task_pt_regs(current));
+	preempt_enable();
+}
+EXPORT_SYMBOL_GPL(kernel_fpu_end);
-- 
2.42.0

