Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05956B70
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697109; cv=none; b=Fth9HugNERYYqmM61n5Z4K0rozSyMJFkC1qDs4A69DmsaH3ikrS1QoHnUioD25gFy8i8uXN8CQg6gHlM3ClKKz9t4jJXRg7c1FokGqDl7EgUtb7F9ez6CVzy+/mnYneE5j7VDrNaJXPAQyNwrfECKmrn3de5pNGrIix7et4k9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697109; c=relaxed/simple;
	bh=/RMV6EvjfbMDeh8AAAKCcDfR7SkW64DSoezNtrIFGmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHoxuzBmNr0LYW3OqKvFLz9quR1Jd8hYWxIRBim7RkzzPgNfJOx2mohDA5GTvavWjG4i4/do9iGDXwb7cUgAwTdpd+hdAT0AslJI4mNiXtSaLAPHd4fbGbRiX0xP7Hu15+llldHwx3hMXUwZW7/UAD0Z3/nHiL8Lnla6e7dXWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=IHWoKsQr; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IHWoKsQr"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29f69710cbbso1237031a91.1
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697108; x=1712301908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd7UwvCa9oMHOiIEhQpk6/wRs60SiO2oLPgpnvXy/o4=;
        b=IHWoKsQrnyYZ/1G0TmEHFYbliraqbPCK1lRMEOCUR34NbgwF09AwfXNULRNENwCDso
         DbGI5L0VZ65mD36HDs/QDTubePSY1FLS1l8MuuOy6uNUexF7M4pohbZjmAtfQXIRNGlO
         mXPJa9Pu22v7u3/CY1mFjY+AsBXWgf6xXKsghCObOT6sWIqjR+g3awB1hmFYdGaEbv+0
         gn59BG8J5kH1ZTDRmtyAdUcDqMksTuOmWy3ybWFfMxfNIOZIVrGz4G91C4r9yTZ6MiCM
         +ngdGQ8zR7dgjhnaYbgV1DnVBd32J/tTbES1WEbOEBKvVw5bGeuUFZLcdYO90yUJIcAd
         odlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697108; x=1712301908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wd7UwvCa9oMHOiIEhQpk6/wRs60SiO2oLPgpnvXy/o4=;
        b=F/MhMnk+3LZthQCRiqR2hz3uHYnLmt0qm5CXGx0aVWVEp8cZJGmBiNum5fnRtO8Fku
         CbdiOojulGisMfVzI7Q6pPWs/e+76ZcG7L/nOCHFVDeAbXJbsRJyiAro08vi30cmqQ9m
         Co2Dl7XZ4nP3/rZNcdI50TY5RA5btqOcmgi9jspS/arlw5WsgbORAKwucRWM6+egpQjz
         LvfsZPl3Wm3KvD4qFu+EoIQW5MVRaxaDZY3RaADo0Ofhf7bynAlQbE2ZaCzcMhtCXEvg
         fhT5+u2rKrUAvTMfaU4wx75jQAcDe+iQY09m0DknmdQz/U4iJqaGtrgWPMyLPMPgS83G
         CyMA==
X-Forwarded-Encrypted: i=1; AJvYcCWSdxItYy3aXLGm3XnM8rzOyJbTNd4wCBFd7/jNoRe6R/BFZ4kZI8jiLi8w29QRM4sBQWG2M6b4vjLXwfxaPms2j3vwh9DxQx3l
X-Gm-Message-State: AOJu0Yw9fQztw8aqtHsTzlDKDVN4JxiKn3DGMYlrX37uuy1cLUOMxWCz
	lfX1iInCFjegtQzbycYJVcH9ZTbo2bCxg9eSPmObJdq1TSpCnNIa+ayjJVWHypI=
X-Google-Smtp-Source: AGHT+IHxypVhChIzRiQ/e47hMPrNYQnLhNujXyM1QCssN6f6ZMhSHIBGzyaKpY86BExy9FwELnwgHw==
X-Received: by 2002:a17:90b:1c06:b0:29d:f52c:5d40 with SMTP id oc6-20020a17090b1c0600b0029df52c5d40mr2496570pjb.15.1711697107768;
        Fri, 29 Mar 2024 00:25:07 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:07 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 15/15] selftests/fpu: Allow building on other architectures
Date: Fri, 29 Mar 2024 00:18:30 -0700
Message-ID: <20240329072441.591471-16-samuel.holland@sifive.com>
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

Now that ARCH_HAS_KERNEL_FPU_SUPPORT provides a common way to compile
and run floating-point code, this test is no longer x86-specific.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/Kconfig.debug   |  2 +-
 lib/Makefile        | 25 ++-----------------------
 lib/test_fpu_glue.c |  5 ++++-
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index c63a5fbf1f1c..f93e778e0405 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2890,7 +2890,7 @@ config TEST_FREE_PAGES
 
 config TEST_FPU
 	tristate "Test floating point operations in kernel space"
-	depends on X86 && !KCOV_INSTRUMENT_ALL
+	depends on ARCH_HAS_KERNEL_FPU_SUPPORT && !KCOV_INSTRUMENT_ALL
 	help
 	  Enable this option to add /sys/kernel/debug/selftest_helpers/test_fpu
 	  which will trigger a sequence of floating point operations. This is used
diff --git a/lib/Makefile b/lib/Makefile
index fcb35bf50979..e44ad11f77b5 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -110,31 +110,10 @@ CFLAGS_test_fprobe.o += $(CC_FLAGS_FTRACE)
 obj-$(CONFIG_FPROBE_SANITY_TEST) += test_fprobe.o
 obj-$(CONFIG_TEST_OBJPOOL) += test_objpool.o
 
-#
-# CFLAGS for compiling floating point code inside the kernel. x86/Makefile turns
-# off the generation of FPU/SSE* instructions for kernel proper but FPU_FLAGS
-# get appended last to CFLAGS and thus override those previous compiler options.
-#
-FPU_CFLAGS := -msse -msse2
-ifdef CONFIG_CC_IS_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
-#
-# The "-msse" in the first argument is there so that the
-# -mpreferred-stack-boundary=3 build error:
-#
-#  -mpreferred-stack-boundary=3 is not between 4 and 12
-#
-# can be triggered. Otherwise gcc doesn't complain.
-FPU_CFLAGS += -mhard-float
-FPU_CFLAGS += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
-endif
-
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
 test_fpu-y := test_fpu_glue.o test_fpu_impl.o
-CFLAGS_test_fpu_impl.o += $(FPU_CFLAGS)
+CFLAGS_test_fpu_impl.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_test_fpu_impl.o += $(CC_FLAGS_NO_FPU)
 
 # Some KUnit files (hooks.o) need to be built-in even when KUnit is a module,
 # so we can't just use obj-$(CONFIG_KUNIT).
diff --git a/lib/test_fpu_glue.c b/lib/test_fpu_glue.c
index 85963d7be826..eef282a2715f 100644
--- a/lib/test_fpu_glue.c
+++ b/lib/test_fpu_glue.c
@@ -17,7 +17,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/debugfs.h>
-#include <asm/fpu/api.h>
+#include <linux/fpu.h>
 
 #include "test_fpu.h"
 
@@ -38,6 +38,9 @@ static struct dentry *selftest_dir;
 
 static int __init test_fpu_init(void)
 {
+	if (!kernel_fpu_available())
+		return -EINVAL;
+
 	selftest_dir = debugfs_create_dir("selftest_helpers", NULL);
 	if (!selftest_dir)
 		return -ENOMEM;
-- 
2.44.0

