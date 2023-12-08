Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E176FA5
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 05:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Hcwji8pc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d03bcf27e9so14678575ad.0
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 21:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014916; x=1702619716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlkhIfYEZ3lvxXxXZeJnWgi8rztsMBcyR5bRnlna3ss=;
        b=Hcwji8pc+RrrmGgUmcSQuU+CncBTIkf1tiTNnWfCH9zQm3RXy5W03YTWQuZEL7Gs1k
         UReMqHo95y5rpQWVg4zr6HlPYGs7aQX6MFNsz48tVdy6jEb2Ybgj/2FppWJWV7Uc+gM1
         shhqUuO/RQvEWqF8+rjxLoT0cMu2na/zHvVHqLFkvn2AdY7OOKUPhE9Vp7gaR5YEKvue
         K2rqB+xP6098pws7Qqge+LHd93NwiPX7eATWQfCC09oCahxkEQvMd6gEfge+yevu8e8k
         xEG4qPpLORFek8qUhVfMo3db9lb4s2FvuKblbwTYn5iS4w4MIlTPvbL4tooq6WncLvzi
         Ra4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014916; x=1702619716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlkhIfYEZ3lvxXxXZeJnWgi8rztsMBcyR5bRnlna3ss=;
        b=O1/AICrDlL+Rfe3dGCrJifr5d0iKDXTV4V+gJysPC0Ml7MDKO4LOI/8/hZRi6N8MEe
         DK0RXjcxaHQ6YYabJBNsaXKNdF+yPgEc+VA+jHEXrRv7py49aZ2mO3/enOyPr33MNn4k
         YGargjR+w8agWAIrIoS2TxMkMobrB6jA85cVWVUbrDiYsfzvYYNqabbV+i5yY4HkLvsD
         vjTWJ/WSWkOYcDasynKfVk22K8SygBBVDl9lgbsdQzXQEU4eHGQO1HwKJNrUK+PGujZ5
         DnFD/ksDrYceORNhY1T1DAwZt4iBxiR/1Uk7hrW0foFSSY6JuQgAcE/BxWpLH14zAgeT
         aX5A==
X-Gm-Message-State: AOJu0YzP74KH8oHCi1IueptS8TMx4Q8/MKFrSaTVaTMEzNhIm7YEZqt6
	sZCo/VZajBekKO0biCkkDVYtrA==
X-Google-Smtp-Source: AGHT+IFq3S7FmJealx+s/zAc0NWuz2K3VM/cjjAkpGlz2K3tHlLviwkN/+BPcQyJZRioERW0JqTrBw==
X-Received: by 2002:a17:902:b60f:b0:1d0:c7e0:c82c with SMTP id b15-20020a170902b60f00b001d0c7e0c82cmr2930083pls.8.1702014916347;
        Thu, 07 Dec 2023 21:55:16 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:16 -0800 (PST)
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
Subject: [RFC PATCH 11/12] selftests/fpu: Move FP code to a separate translation unit
Date: Thu,  7 Dec 2023 21:54:41 -0800
Message-ID: <20231208055501.2916202-12-samuel.holland@sifive.com>
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

This ensures no compiler-generated floating-point code can appear
outside kernel_fpu_{begin,end}() sections, and some architectures
enforce this separation.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/Makefile                        |  3 ++-
 lib/{test_fpu.c => test_fpu_glue.c} | 32 +-------------------------
 lib/test_fpu_impl.c                 | 35 +++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 32 deletions(-)
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

diff --git a/lib/Makefile b/lib/Makefile
index 6b09731d8e61..e7cbd54944a2 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -132,7 +132,8 @@ FPU_CFLAGS += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-st
 endif
 
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
-CFLAGS_test_fpu.o += $(FPU_CFLAGS)
+test_fpu-y := test_fpu_glue.o test_fpu_impl.o
+CFLAGS_test_fpu_impl.o += $(FPU_CFLAGS)
 
 obj-$(CONFIG_TEST_LIVEPATCH) += livepatch/
 
diff --git a/lib/test_fpu.c b/lib/test_fpu_glue.c
similarity index 71%
rename from lib/test_fpu.c
rename to lib/test_fpu_glue.c
index e82db19fed84..2761b51117b0 100644
--- a/lib/test_fpu.c
+++ b/lib/test_fpu_glue.c
@@ -19,37 +19,7 @@
 #include <linux/debugfs.h>
 #include <asm/fpu/api.h>
 
-static int test_fpu(void)
-{
-	/*
-	 * This sequence of operations tests that rounding mode is
-	 * to nearest and that denormal numbers are supported.
-	 * Volatile variables are used to avoid compiler optimizing
-	 * the calculations away.
-	 */
-	volatile double a, b, c, d, e, f, g;
-
-	a = 4.0;
-	b = 1e-15;
-	c = 1e-310;
-
-	/* Sets precision flag */
-	d = a + b;
-
-	/* Result depends on rounding mode */
-	e = a + b / 2;
-
-	/* Denormal and very large values */
-	f = b / c;
-
-	/* Depends on denormal support */
-	g = a + c * f;
-
-	if (d > a && e > a && g > a)
-		return 0;
-	else
-		return -EINVAL;
-}
+int test_fpu(void);
 
 static int test_fpu_get(void *data, u64 *val)
 {
diff --git a/lib/test_fpu_impl.c b/lib/test_fpu_impl.c
new file mode 100644
index 000000000000..2ff01980bc22
--- /dev/null
+++ b/lib/test_fpu_impl.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/errno.h>
+
+int test_fpu(void)
+{
+	/*
+	 * This sequence of operations tests that rounding mode is
+	 * to nearest and that denormal numbers are supported.
+	 * Volatile variables are used to avoid compiler optimizing
+	 * the calculations away.
+	 */
+	volatile double a, b, c, d, e, f, g;
+
+	a = 4.0;
+	b = 1e-15;
+	c = 1e-310;
+
+	/* Sets precision flag */
+	d = a + b;
+
+	/* Result depends on rounding mode */
+	e = a + b / 2;
+
+	/* Denormal and very large values */
+	f = b / c;
+
+	/* Depends on denormal support */
+	g = a + c * f;
+
+	if (d > a && e > a && g > a)
+		return 0;
+	else
+		return -EINVAL;
+}
-- 
2.42.0

