Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082113B2B8
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263016; cv=none; b=Gy8vXPZR7bJ70mYbiRawwU1gmXwE6zA4SEK9TzTQDs+hT3pZSfOLLLu+BzsOHKsKagPDKhnDdk1T0tpVKphSLVPq7SFaF1+U8WoZ5whyuhnXYO/0Tc17X5ST4XmTCyJc1VGoqXpitzbF6z2G/BVyV1hIqiiBiulfFUTFwQPOW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263016; c=relaxed/simple;
	bh=g8p6Ru/ffP1jzehPrw/CRaeaF2IOojZZQLAZrCdrRdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sN7OOfe+JLG0KKU0aJnM919UFfiRXeRqc8B4yQiTZV2bMEyKsEFgGmRmfdaWa1UT2dm2hkcQGve3asUCHAuoh6O4DHB033V6NKhpf23JLdfFpFyT8QTxW5xA4EMyzJSqB6N8NjY1rD1ps6ovYYYE5kd+yF3/ZduQnObcyvw2UFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI61zz1n; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI61zz1n"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29c52a90417so23564a91.1;
        Tue, 12 Mar 2024 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263014; x=1710867814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaoPploMqkrEWkpIzUU4wfevhj/fOj8xGNuIym5RM4g=;
        b=jI61zz1nxG7r2gzUSCHFR+HVATg4zZtioa85iifcrquk62mctXpg6gAd5D8itoGeet
         hNmi1nQlKwenK5CGBCaN5yuSQ6VG/KdwunonBpL/cskocquSHg0oO1fVBMdT1UP710dN
         o/ygdVpkgdpW7DLpi4KbBBs4DHbbJ0x3jJYKp558ujLnzuxi70uwixOzIohylk8YN6cZ
         FpQsOLBgoE2VHngJGfwHxfMX1JaXUTixsdwDEhaxz6KXyY66M8fRpHjcxQ+IUUIirj71
         v8mWON6SSCPANQ+PlMQZkxljD9w5W5F+gQk1lgsP6al/MmgBFUCusx7UizoV0PkJxzsQ
         J26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263014; x=1710867814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QaoPploMqkrEWkpIzUU4wfevhj/fOj8xGNuIym5RM4g=;
        b=OZ0P/oqI1dfughsSfu42dEpa6c93c7M9+bc8XP+p6J/eEZ02CFCrRNcWKGefC3j4yG
         ASgD/uub4cQKltYlTQFEw5L6pfjpFnAcriZcPgHm2BPR45FY+qMdeTGNfSD7rtu5TF2g
         KAbMHVDFBwRTYjoUME6J9xOUUhRdVFbdDOupi1Ku31yvKdY/znYAPJczlFAC0sqcLHhl
         FZDUwHCyJTgbLXdx6jGfDorcaZsujx4D8OZnRuvMieWAeV1+8GLov7fuyM1ts9fCMXwv
         IM7/XtFVa7oMbNx+BB82lBv33CFqGi2hclzVdCSj4CnA3M06jmeQ8v5bTYmQJ8iCkxxv
         Jxhg==
X-Forwarded-Encrypted: i=1; AJvYcCVaHtDLkIr22tukHRXOQHX0XudfR214HhqLUmtRktcVR80fVRaaRCrvSSdE4dekx+btjDJ9YccM689UQSqUyR5c+LzCqYUr+CYfDlGJtLQGnCMeyjzUI2FnNIQGNlaneWBs
X-Gm-Message-State: AOJu0Yw1o7/V7hbSxKpzAbcruIxGA++QpJari5/cgzI+J1etThLyQeo8
	w5VQfPKv+LKmBtIKSYUbeTOP6ZuFPz0Tb4Xh2THIo7GWMgDf+H5N
X-Google-Smtp-Source: AGHT+IGp1mJ0KTZ+LQYMSXPX4xCWLkAXoeTNJUTBRzyrNk3iCGaW03oMbFoz7IlCFWta+THFx92xXA==
X-Received: by 2002:a17:90a:e514:b0:29a:9dd1:d45b with SMTP id t20-20020a17090ae51400b0029a9dd1d45bmr194372pjy.3.1710263013769;
        Tue, 12 Mar 2024 10:03:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090a77cb00b0029bf32b524esm4052208pjs.13.2024.03.12.10.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/14] loongarch: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:04 -0700
Message-Id: <20240312170309.2546362-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/loongarch/include/asm/bug.h | 38 +++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index d4ca3ba25418..25f2b5ae7702 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -3,47 +3,63 @@
 #define __ASM_BUG_H
 
 #include <asm/break.h>
+#include <kunit/bug.h>
 #include <linux/stringify.h>
 
 #ifndef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #else
-#define __BUGVERBOSE_LOCATION(file, line)			\
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)  .long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
+
+#define __BUGVERBOSE_LOCATION(file, func, line)			\
 		.pushsection .rodata.str, "aMS", @progbits, 1;	\
 	10002:	.string file;					\
 		.popsection;					\
 								\
 		.long 10002b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifndef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #else
-#define __BUG_ENTRY(flags) 					\
+#define __BUG_ENTRY(flags, func)				\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)	\
 		.short flags; 					\
 		.popsection;					\
 	10001:
 #endif
 
-#define ASM_BUG_FLAGS(flags)					\
-	__BUG_ENTRY(flags)					\
+#define ASM_BUG_FLAGS(flags, func)				\
+	__BUG_ENTRY(flags, func)				\
 	break		BRK_BUG
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
+
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC    __func__
+#else
+# define __BUG_FUNC    NULL
+#endif
 
 #define __BUG_FLAGS(flags)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags, %0)) : : "i" (__BUG_FUNC));
 
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags));			\
+	if (!IS_SUPPRESSED_WARNING(__func__))			\
+		__BUG_FLAGS(BUGFLAG_WARNING|(flags));		\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.39.2

