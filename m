Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33562BE74
	for <loongarch@lists.linux.dev>; Thu, 28 Dec 2023 01:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gPJ3YlSO"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-594c7241fa9so894488eaf.0
        for <loongarch@lists.linux.dev>; Wed, 27 Dec 2023 17:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727759; x=1704332559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNUGRAFHmKzY6lG9DcfUZlQ4QTwCBjkCL5t9hP4xKAE=;
        b=gPJ3YlSOb+SSWxqMaTW5flOsS3XuDJ5ZskLExvuKUn5qj117wo2xIIFUpg2Ep6CPQ2
         VYtNmpL6wbtTfzozoNRerquk57JOfvfoCrIJ60Am/lEYC2i9OsjCf2VZBVsx5DkdNrA8
         UoLUurqm0fx1HR9X/oPuKb5npY8iODHyc7iCMfnKjgHJE0FMMv1qW2gYdDYuGulq7VGb
         9Q1zTIf111yfewyaObCgiakgG4c5s+H4BRujYY2sQhsPzNqav9cOJ0K3CchvPefkaaRw
         Tdw0tne3vb/c7MUgn3ZdBEmxc7PLRhKUxrz1AmN90bMvzLZPFLGYJdCFuqGa8oGndECh
         Rr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727759; x=1704332559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNUGRAFHmKzY6lG9DcfUZlQ4QTwCBjkCL5t9hP4xKAE=;
        b=NtFWkuERhq38n1AlMpbzCIAHhuPQo0TQA/gh3Ff4J43hhTaDJMkz6cFIVYJvcp8re6
         FIIMo/AvBWb7rHEaNwkHE5/bmr+hEgQe9KGlcuQnp35+Vw45XiMsn51/DWByv7RbxfyI
         m98wXuhvgmDcCd1UYXUwxSuwgsFgoaAjQJtQrLgzGE6eFOcElYjmgc4mCh6G0qF/5ExB
         IMWvKvApmGs3poMelAHZgZDDyY2Z07yMy3nu/DRyppCTTWXs1o5Y6eN0y7CPtYfBTib1
         YfqPZZOlp9gp1tohf5UELQ4VBbLe/V0qPrxIw1I3RlA2JqvZiIjSRSDCAv5BKD8dgm7p
         2g9g==
X-Gm-Message-State: AOJu0YyYz3IWFr1E6n7hSejBzDMBDJZp8FbKJc7GZoyZvzCdnmean1uL
	Kv/VReG71O4F5k/vKh8mowbPC/olGBrNmg==
X-Google-Smtp-Source: AGHT+IGvfqTB3x7wwPMxp1qNsfQvBXkwAH7kyz4he4Bu1Z+L46cvb1psldcQ6vV6De8969ozhHXwqQ==
X-Received: by 2002:a05:6358:3a1b:b0:172:c06c:fce3 with SMTP id g27-20020a0563583a1b00b00172c06cfce3mr5190091rwe.58.1703727759326;
        Wed, 27 Dec 2023 17:42:39 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:39 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 13/14] selftests/fpu: Move FP code to a separate translation unit
Date: Wed, 27 Dec 2023 17:42:03 -0800
Message-ID: <20231228014220.3562640-14-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
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

Changes in v2:
 - Declare test_fpu() in a header

 lib/Makefile                        |  3 ++-
 lib/test_fpu.h                      |  8 +++++++
 lib/{test_fpu.c => test_fpu_glue.c} | 32 +------------------------
 lib/test_fpu_impl.c                 | 37 +++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 32 deletions(-)
 create mode 100644 lib/test_fpu.h
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
 
diff --git a/lib/test_fpu.h b/lib/test_fpu.h
new file mode 100644
index 000000000000..4459807084bc
--- /dev/null
+++ b/lib/test_fpu.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _LIB_TEST_FPU_H
+#define _LIB_TEST_FPU_H
+
+int test_fpu(void);
+
+#endif
diff --git a/lib/test_fpu.c b/lib/test_fpu_glue.c
similarity index 71%
rename from lib/test_fpu.c
rename to lib/test_fpu_glue.c
index e82db19fed84..85963d7be826 100644
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
+#include "test_fpu.h"
 
 static int test_fpu_get(void *data, u64 *val)
 {
diff --git a/lib/test_fpu_impl.c b/lib/test_fpu_impl.c
new file mode 100644
index 000000000000..777894dbbe86
--- /dev/null
+++ b/lib/test_fpu_impl.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/errno.h>
+
+#include "test_fpu.h"
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

