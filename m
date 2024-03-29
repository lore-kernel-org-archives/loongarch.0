Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E9552F72
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697103; cv=none; b=lRir8dXe8eJKSMNLN6+n0CpND3Sb/N4/7937sIOuHxpJ3/eFIqNYuveAf7chu3EFONRmx2wFlQHunRYID3kEoxnisW8uo9nzcIzIBChydspvXPkCPHxtRUK5z2aU+fGLUVnnXyS0csWERr7u3Dz4BvVUyYXS7/R7Ee+ge5cFYHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697103; c=relaxed/simple;
	bh=3Jxdlw0MxGrCtqcQU2OdpgNfa0UAfuPKsYPLtYGhH+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2AbGy3HdPb/TQdg/NqyZcqt/7RIVMKWKJYB7FOEotx1YNDDGgO1Yh884fn/kFc8GDQ4mxH2nx97HJ1S5n4FbaysjYe1MV3h2f1kSAhQ3nX7yXeRUB2YlDNN2hPz3vgGy7mcS+PLW1Xz8HZ2HjY+caYLOeoaTh5LFITekZPKvOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=THDaXknp; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="THDaXknp"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2a209b8af12so915237a91.3
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697101; x=1712301901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZUya0v8Oh5iLzX7Kw5hO2ocqVWj9tNi/iu8yR8eYow=;
        b=THDaXknpgBu/oU+1arEbG0WNEl57Dm2voaFkuy8nYGzn3W1GzdFKVtSNcI+sN/374Z
         QPywe3cr2ShFnq9794nQsJuqs0nCctv4oXHQeAjNFWsNqKtU/zP7QnbEE25d4m6OWDQq
         CUp/bF8rWS//GfCTeRZ6udasGnZudHXQKVxwy4Gy0pGEvE2+1tSKhsbN4MkqYnnUaGcv
         wFpsX3INI3RPEG4WIUREyeco49Aal+P/wd2y9V5BbRHQ53tDh071dD7pOEcquMh1MV6M
         TwAdkMI+7QxcopdS77azU6m56iw1g2QSwgAUi+WMwAtO4sB4UfFPl3pKd6aksQE+GrBp
         /otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697101; x=1712301901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZUya0v8Oh5iLzX7Kw5hO2ocqVWj9tNi/iu8yR8eYow=;
        b=JWLqWGb/mAU2omgCu78Q0g2lDeYJb3eQQg9+wk9UXO3rnTTx3a62X1+S2wvtytKrU6
         jiX9G18VzO6kv6d5E+/XyrS2z35AR18UeQk1BEGGo5GkG+5WRG6Q9YOlDvH9IcmUxyv2
         w0UorNJ/bJt0mHSYsiZxIBvVzRwPrjcLoHsIX8wXZbb+4rYKOdgBpCmG+AIsrw/MQA74
         YHfdfDvEr/vVhdJpGDVejCgpALrolm9NGF8ROq+Eg9wap+CvMJM7GDqWCKSmZ9tp/1vc
         jrSaJ43OqFTAee57Yf+BNLxos5Zlqb8iNM6FrWp4klRC1Y1UdZ00T+6t3EiSVKigpqsT
         qoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBC1CF9ZIDjEyMOs6lkI03Z7Qw1flLyX2jrsmZuI6U79TXa2hi0zwTO4NpUSr2/yUfyLo6piWO98dWiI/d02gsFBKqIhl2g1As
X-Gm-Message-State: AOJu0Yx+uQBpt37O5S/ZcXqky/EQ6o2bqzlF4lcGSOlDPexbeQosWnHh
	Kg6l6pMqh8BzXHc6fSegaE3Z3n5/WWDDe+EljcyedzIjNe27Qf4ZC0/utvXoVsU=
X-Google-Smtp-Source: AGHT+IERKMtTUUrMNrNdpmOZyYX6MKtFB7fSH53v9LodH/8MB2comF4l1LxXs3fRZJNBleQgeI68Nw==
X-Received: by 2002:a17:90a:b008:b0:2a0:5339:7751 with SMTP id x8-20020a17090ab00800b002a053397751mr1529473pjq.37.1711697101571;
        Fri, 29 Mar 2024 00:25:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:01 -0700 (PDT)
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
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 10/15] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:25 -0700
Message-ID: <20240329072441.591471-11-samuel.holland@sifive.com>
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
index 39886bab943a..7c9d032ee675 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -83,6 +83,7 @@ config X86
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64
+	select ARCH_HAS_KERNEL_FPU_SUPPORT
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 662d9d4033e6..5a5f5999c505 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -74,6 +74,26 @@ KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
 KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
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
2.44.0

