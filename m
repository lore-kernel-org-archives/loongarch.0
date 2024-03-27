Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B73152DFB
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569733; cv=none; b=dfoTiLiKkKmqvH19nG7S37UWW0LDdmM5bUaHgMO0WPVb1dtwD+GQTTf2JY7Ka/h3B2vOH6UTyS8zygr0tkO+1eB1QSfYtQTMuuuAcU4rdqGWZ5Zs6ABuYud5IZUDN6xxAvWECxL6q3NgMz7ZlRLvYfFp4HLlFGxZapZn7hORnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569733; c=relaxed/simple;
	bh=u3gLe8mn9KzvJCWJ9YuG1b0TOQTZ68daTmfzwdg2XXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ch84SXS3BxRPDzntnrQW8TId12ItKIkns3989+WXFx+iVr/QgrIYOO/kEplxLLc5VuKTHS2MpbsTuZ7f4c/S6vb6mF2LsGHhE9Y4vlD6U1K4nhfKRAUDBYb4T4JT0L99ctA5i6doh/1QAYLXXbI4fraRw6cAWwUQmDzHbKTmlDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=eE18depv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eE18depv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dffa5e3f2dso1835875ad.2
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569731; x=1712174531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnfcb5HAvzgd9XZtKey8r+Hj1U7B+/pwxPGR+srUxos=;
        b=eE18depvN4dikDBgWZvq7Kuk50tn6mnmmpm5mdernOOEZcS4gzs8QHGRQXYKN6I93f
         5UVaL/3sayZbG7oM3gpRgRYeeEDLPGWNfMjj2KfSmxV7Yjrmb0hfOYzWKih/i+hzjOcI
         XSomqsBCgvRawRGP9SLOYxbCTcIQ9U6PI/qairQ0ms+QLC87WUDIEcNhDS4b19VFMtMt
         tRyxPjJ7sqwYBE8Ew6sv5wckpZdZQgXOK5nnjWtNc3Hxzy5h1cry2O7G3JTT5YLN+Lsq
         DbiHFYtDlWCoI0MQfcAUGSfoacFBsppJzpj6R35MVNdW1rCdYYoNyLWaQxllWAW5qS0e
         U7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569731; x=1712174531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnfcb5HAvzgd9XZtKey8r+Hj1U7B+/pwxPGR+srUxos=;
        b=PhjcU2PnmCDe8a8SGSghIy9fR3o3v2IJxq9V6ccW4wyF/0zxduFkdme/5j3VIFRhjw
         hRG9quccXTn3cylPESnp6M4x2uy7V3sEQQLPErVbf12hrtgvILvQo7+ptrqYpcu3e7m1
         8fNV5UfFmKS8zv1ZpPcOukKgF/8jhZ3Eamb6ypVdWlRr+xz0JnoJXX/SsVqkAGMiprp2
         GYlWi0bvp4wWqseyGkPe/CioqE+d5r2uUqD/x6XI06ESmn0lhYE1j0JWWmf74aX2xSR1
         Pt9STorCpHn2k3ThIcn+EpNu/wufOuaXoJL+bjzt60dHLo1CLxHAcBYrY8ekEYlMcJNL
         7GUg==
X-Forwarded-Encrypted: i=1; AJvYcCXt624mL8WGdBe2HzzLsd4QzQp6RtOAfLIcfpXft5Ldr1tS/7bU1w52ey08RRROrtqtvJ32+Hz2OX/Kp9prKBCUjxnJuVQDDmaw
X-Gm-Message-State: AOJu0YwhSA8PNIjypfolrN4D1hz6jtz1BY3qVZK5llMVw0AzBYzeK+A0
	YVjizE6G3U9lcnsqMuKanBaLy+7ETcivyO/hVEAk3sQEc2Fhio2FlvglCCiOIIA=
X-Google-Smtp-Source: AGHT+IGwHWClv4VHwAUMeRko9/IrGC0nK3n3EBnq+VQl6LUZXOQ24ITW9JUdRJyNTiGgpBBFPtyemA==
X-Received: by 2002:a17:902:f545:b0:1dd:73ba:cd7f with SMTP id h5-20020a170902f54500b001dd73bacd7fmr731731plf.47.1711569731200;
        Wed, 27 Mar 2024 13:02:11 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:10 -0700 (PDT)
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
Subject: [PATCH v3 09/14] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:40 -0700
Message-ID: <20240327200157.1097089-10-samuel.holland@sifive.com>
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
2.43.1

