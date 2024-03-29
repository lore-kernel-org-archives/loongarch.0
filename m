Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2304086E
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697100; cv=none; b=Jnq3UJzofy5s888NY/CxNH6zPQx7Og1Btv6g/c8u4dy+H2tXQxvBx8YdFAIh39M3+sXET7qtwfrBUgJxYzfuiXSJeSmU3HLus/CwjwMhzUqUy4kw07OMIKp5aEnxw/dTmmjo5jMZ3/SDCjzIS7zDz6FXGpo1Hm/S2V8BGxDBfLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697100; c=relaxed/simple;
	bh=b0p3yNyhI4gS1UO6/7FtNHSLtx6SD/wV4pT5We/leTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUF2mW2lv+mKW6f9ylBM3PMYsJfHF8F/j3VmAE2wHDuImZ0Y51LAAcMqWlE0NdnU1OzvbF55wvdHFtA6XW31hX/fxMjXdaM/8FyP4To/h3vwRJgH4gzMf5G4wh6veETLXEVKS2ewOVjlm1fXyisHjPhqc2gTYyUZeNjvmGJF56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Q35v6fCP; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Q35v6fCP"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6eac64f2205so1527683b3a.2
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697099; x=1712301899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miBOSRWGIbztCOf3acmBaICqQz/+WnlSIiHBb+4Rl8M=;
        b=Q35v6fCPz4cKg+E1NnpDYu401VuRQEaZ/KMhhSQph4qGTsVb0u4U5awrpeAoFDsRWh
         XO2zyu37FhChEOw3cDGAE8R4a+7yWeRU0UQtsV9N/2r+u3Wqyod6zOc5Dzsb1X4Ywb/w
         1bGxs0kuCY8sOmJFq4UMYuXMNtbJhP21G1e+LZGhjxmgUAgNf/87aFjy523HwypUG1rN
         keguey/sYeCNRv5ZKxOGE0GZw3dfSYNMN0NVAMv+Las8ND00bdAePJEZWXU6fS7kO5aj
         Mz4ucjfZ4mNjYHaixjT9YONTgjQxKSTG9WGg1a+EcBXhefiVbF0aRwDIhsy8BUvdbT7b
         /D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697099; x=1712301899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miBOSRWGIbztCOf3acmBaICqQz/+WnlSIiHBb+4Rl8M=;
        b=u/bHuFXragu29Ow93hZwxmNu2uCrN7T+z6hMBIxv2R4rOgQiV9TXS3W53LHHMdyEiw
         vz+xMvs1gLCqx5D0AZW+k0kRrRrJk5O169ycmHmYVfBLxjS9S2pzlhXBSvaIi0XGg1aH
         LnejP6naujJ/wLH3AV8/fp6XjM/gHXmMtzWQ061ja82S8/U4duua48V9qwNNNdsyGWIl
         4PEYGQDsQCKdJgRWsngGblmkrtVcLcFAkjEJCd9Wm/IWdubnLpO3M5ylexLkL3wySc9t
         WS7iou0mq5wN9q7mvAy8Zohjs30LLVYAUSmmd6MRnN+YCDGCMtqOD7/NUxveljSnQcHP
         hmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVztzcRISXIZk42lEUMiXc3V01gIWUAXGpEaXTv6D9crfeduOuSXjjmJ7+x2SxYLRCeMavQwq0wyiFj/2PGUaxKUyDKNAWOTvM1
X-Gm-Message-State: AOJu0Yyup2lo2JVeFMpcz6hQ5BTkFCYybdoCmjKFLMFc/mXCo5tZATtA
	e5+h+7eZZDopIOm2bSgboYqZQlAscg8fWTruesdkB3HFBC44UWjXka6REw4QENs=
X-Google-Smtp-Source: AGHT+IHGvAdAnX/0WDZVeXS0a7ZQ/motGWeac64eqKBau0xYaG382zqiN+0tE34St5zugVtRmJL1tg==
X-Received: by 2002:a05:6a20:549c:b0:1a3:baad:d566 with SMTP id i28-20020a056a20549c00b001a3baadd566mr1487303pzk.40.1711697098883;
        Fri, 29 Mar 2024 00:24:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:53 -0700 (PDT)
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
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 08/15] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:23 -0700
Message-ID: <20240329072441.591471-9-samuel.holland@sifive.com>
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

PowerPC provides an equivalent to the common kernel-mode FPU API, but in
a different header and using different function names. The PowerPC API
also requires a non-preemptible context. Add a wrapper header, and
export the CFLAGS adjustments.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/powerpc/Kconfig           |  1 +
 arch/powerpc/Makefile          |  5 ++++-
 arch/powerpc/include/asm/fpu.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/fpu.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..c42a57b6839d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,6 +137,7 @@ config PPC
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC_FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_64S_HASH_MMU
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 65261cbe5bfd..93d89f055b70 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -153,6 +153,9 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
 
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
+CC_FLAGS_FPU		:= $(call cc-option,-mhard-float)
+CC_FLAGS_NO_FPU		:= $(call cc-option,-msoft-float)
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
@@ -174,7 +177,7 @@ asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
 KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
-KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
+KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
 KBUILD_CFLAGS	+= $(CFLAGS-y)
 CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
diff --git a/arch/powerpc/include/asm/fpu.h b/arch/powerpc/include/asm/fpu.h
new file mode 100644
index 000000000000..ca584e4bc40f
--- /dev/null
+++ b/arch/powerpc/include/asm/fpu.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_POWERPC_FPU_H
+#define _ASM_POWERPC_FPU_H
+
+#include <linux/preempt.h>
+
+#include <asm/cpu_has_feature.h>
+#include <asm/switch_to.h>
+
+#define kernel_fpu_available()	(!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+
+static inline void kernel_fpu_begin(void)
+{
+	preempt_disable();
+	enable_kernel_fp();
+}
+
+static inline void kernel_fpu_end(void)
+{
+	disable_kernel_fp();
+	preempt_enable();
+}
+
+#endif /* ! _ASM_POWERPC_FPU_H */
-- 
2.44.0

