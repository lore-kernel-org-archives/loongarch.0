Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DED054BE4
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697109; cv=none; b=uIow7fTkIhldiX6MVVHlpxd4yIohFx+2Nthmj890rOtZbIfOoOQD/TrfeYPth9HvBTQDf78U6sD/+qb1FZa3J9tA2pG099YXPg+BK1EVj2mbhsbD0tgW4NJqjhpWp/u9P5k++hzo41q3vjnm5d12+4p0+So4/WkN1/G40EkBMzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697109; c=relaxed/simple;
	bh=sDSM8SzyTSBzvwgCVM/QtpZk9UVDm9MyzCcLceVlwvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tdx/M1syf/uo2gPRnlRlUGuDhynQmm6EcauCubIm6WXKv11SX/U6UnuR/IAiumUkix/cx0hZBaHnlBD5rxOanAcfnYvWKXoEJK0EE6jB2McTw/n2NbsBfQNiKW6hdPg+mp3enR6jNye1Up7JlfaEfzHNuoLuxrciW4eQHgrFR7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=YCQjoy0L; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YCQjoy0L"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29fb12a22afso1334852a91.3
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697106; x=1712301906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IERaZRfF/9oogZdizMupzfKIm+UO6QVYkIeFwIsamZU=;
        b=YCQjoy0LUVEQfasFe0qDAlT0e21hDVwXiOs3SHt8eYNcWw6fABcqhbqSoMbqlGfZDg
         sWQQxq2efyH3HAEVKgnXv52llHppihFwsS71s+C5CDJjUgc07g6B1/uGeoRFHFqZSY2c
         kzKtXwIarBr4rYURLr5X6i/m6LhRdXIvOIB61ws4eY3SxzwFmtfRYpAw6QMP44g1b5qp
         n1KAXcVz1fnYaLW5iiIoq1YzcDmi3JR7dpmJO54SCCRgrEdl6ZRnJzdp/OYvC9Z0Wp/V
         7yI+Yn1dSyJe7yHdaFBPODDWtxESI1qtBusMbEHvPJdWcVjY0c7HG/POP4T+nV3cHKF0
         +v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697106; x=1712301906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IERaZRfF/9oogZdizMupzfKIm+UO6QVYkIeFwIsamZU=;
        b=fwsf+mqEZZuDBg5qtEb5XjyBY2VlWzrfP/hj/3pLRpwquXtpfRqnyoEHZiZIQwZ2gv
         FSmV1ZqIbtZ/B8UmUe906RGvJxnyYRJBicV5SvzX8z2PKIWR2YT2GrooFAQl8NwqefIa
         PaEkfldh7vhm6b4L/sAHrIvogqPcA8UBZKajsLFDm1oVqa33BPGwKSB8ZXAWZ5BdGHiv
         dJP8rr3MDqctDxJV1z6Givbv9bAHumvdGmbpVZivVbCP2msXH+dhrZBc7lEjUhtQMdc+
         0mTXtk6C6FLXMDi4vBKYXsGHPQzmENJCyZl6hzTlR+xzD1ScRWFMGOeKlhLZAmPFHvKV
         S/fw==
X-Forwarded-Encrypted: i=1; AJvYcCUPyXUWkedi3sfpyj0jeu9Nxx80uYHSqbmoUu8SAZRRy6lblRr9UY6kXFOzjhEXxn3KlLKZ3b+nke17TvuLG7TEdkSz82fuPzUz
X-Gm-Message-State: AOJu0YzawYdnbAr9XnEbU8/iumQHwFAlIxhw5VrU3UmLHkVA3zjmBLkU
	mMsj3Zmkwthk3B+57O57E/H2n1V4SACvWOe1LfrfRsCQnHH43dYohvd3yjsNzf8=
X-Google-Smtp-Source: AGHT+IEgFbP2oHNJWaGrzpoC9/WKXB2wk7z5kOFJSRoINaDHcY2EGHO1B7+JnkXlN7mfRYkSUpJEAg==
X-Received: by 2002:a17:90a:3ee6:b0:2a0:3a16:7489 with SMTP id k93-20020a17090a3ee600b002a03a167489mr1460482pjc.44.1711697106489;
        Fri, 29 Mar 2024 00:25:06 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:06 -0700 (PDT)
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
Subject: [PATCH v4 14/15] selftests/fpu: Move FP code to a separate translation unit
Date: Fri, 29 Mar 2024 00:18:29 -0700
Message-ID: <20240329072441.591471-15-samuel.holland@sifive.com>
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

This ensures no compiler-generated floating-point code can appear
outside kernel_fpu_{begin,end}() sections, and some architectures
enforce this separation.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

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
index ffc6b2341b45..fcb35bf50979 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -133,7 +133,8 @@ FPU_CFLAGS += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-st
 endif
 
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
-CFLAGS_test_fpu.o += $(FPU_CFLAGS)
+test_fpu-y := test_fpu_glue.o test_fpu_impl.o
+CFLAGS_test_fpu_impl.o += $(FPU_CFLAGS)
 
 # Some KUnit files (hooks.o) need to be built-in even when KUnit is a module,
 # so we can't just use obj-$(CONFIG_KUNIT).
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
2.44.0

