Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13213B2A0
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263013; cv=none; b=HpwhK2Af+lUFqFNr+jriTpwLfU0RoWslDHFlqWS2PgHaDhhPiEtdBiyIT0N0XYBh6xC9Aa9UH3FCQpCcFht5cnNu+3fXWV0cK8nAS1D2EG7bHL5GKV2b2ReH2Sd72yfHRR3Pk9zeR0FTA/aFJRP2MRIOg7cfobHxic+30CpvtqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263013; c=relaxed/simple;
	bh=uZZ0pxvUudvGaQrFvHsY/MGGWPShLhBfmN2ecn70snU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N64Buk0T3igT4yzYN7M17B6pRni5l8uRPYJKoLjRva89H0VCysVDdrrjpbm6Oogf36D2eVoqSgnv9V6ThZ9wjop8ltz6uCav4U5EN90+8/Av9A9yez7qql4DoU/wSeecFbmKJ88/rJ/DsA+UExfhtYhh2MYJ5CzO4q7fDlU1jZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuBrG4OL; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuBrG4OL"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e5a232fe80so45149b3a.0;
        Tue, 12 Mar 2024 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263012; x=1710867812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgfFEM0oJIh4ATTR993DWw0sPyKQH24EY/4/QOUPczo=;
        b=QuBrG4OLN3rGok+5ieAjftM8aaAuuxe8a7G/JMRYPrS3mmLZV7NcYtuxEkb5HpF9qE
         oJuxAh87FluDzMPQXwyZZP9e+FTcEyNwqBKQf8m4/wx9kYMqdxn7C2mD/Ua6PlnQnBtB
         ldGk2GIR2n7nsBsCttKaT+D6B3Ar/yC11n9C9PjTW2PGYy8qk9cHx7ohb2CTZMi7UftD
         IQGAxuhyWkl60y3qF/W0GkubG0wpiZXlHjanWogUNVft++IpOfNG+eGVMA0qagM/hXC7
         89Sx/m+GAgBmkt+5Pu05+XIVSPaKhv/bFPm7UCvC/5jki098OGQidCf/b30oihI5JoIN
         4gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263012; x=1710867812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgfFEM0oJIh4ATTR993DWw0sPyKQH24EY/4/QOUPczo=;
        b=bPdTW+flsuk1Ownz+uTtK7K1//+g0DSyaFQB6i5phAWnWT3CoskGNariOm5jfRIgN9
         C1wD6VvgYzXVaLJlxagAuJTArvFfVYPog+50Kil7KvOIYFeUs1lhw+DPD9yb4jHTJS0M
         TPsPhhQ6dg79WNaJY7NZU3En1f9TntGEVqDtA6ycd33/FHWGa6Lxd5Xl+kDBKZ7KeCYZ
         NcCG4rMF20z1UHv36PJD9/3dbewwgr9AOETwNtVJ4wMbN8VJ93FU0slcxXqG+me6n+m8
         qnuK9oO0sS2wvjuV1Etht/h0qIv0JOUnBXCDw0yHfBQRTJiMnGjxvPba0Pu/ZOcfM9pf
         CeNg==
X-Forwarded-Encrypted: i=1; AJvYcCWiA9lz7UNIOryP+qVqN15xQ7XsI+VmpypLMdL6t67lF1WQwwOGLUpz6B/64m6blMcLTcNSL3bhJgETo+llH3MkvoyZfB9nHHCoaRr9c2jcIMbprOYL3Bt3E2ZMJMuq17oa
X-Gm-Message-State: AOJu0Yzv9UXtagaet1dOEi36Wvn924mDZ4KzgDPSMI24+aqxwReDP1MA
	81Q/82QFAobgQNZipS3ueIAIZCW1xetVN7xo7fsSD6ZqDLEdO9tt
X-Google-Smtp-Source: AGHT+IFq2CL0ds18qlKLUiBCru+tEydVmq2O3jl6A2X5cUl3NOOBJhsozkjJ4JcvCmlm7vgxw0hJ7g==
X-Received: by 2002:a05:6a00:3a0c:b0:6e6:96cb:3ab8 with SMTP id fj12-20020a056a003a0c00b006e696cb3ab8mr29726pfb.10.1710263011492;
        Tue, 12 Mar 2024 10:03:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 29-20020a63125d000000b005dc98d9114bsm6228742pgs.43.2024.03.12.10.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:30 -0700 (PDT)
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
Subject: [PATCH 08/14] arm64: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:03 -0700
Message-Id: <20240312170309.2546362-9-linux@roeck-us.net>
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
 arch/arm64/include/asm/asm-bug.h | 29 +++++++++++++++++++----------
 arch/arm64/include/asm/bug.h     |  8 +++++++-
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index c762038ba400..6884089a7191 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -8,36 +8,45 @@
 #include <asm/brk-imm.h>
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
-#define __BUGVERBOSE_LOCATION(file, line)			\
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)	.long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
+
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
+#define __BUGVERBOSE_LOCATION(file, func, line)		\
 		.pushsection .rodata.str,"aMS",@progbits,1;	\
 	14472:	.string file;					\
 		.popsection;					\
 								\
 		.long 14472b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
 #else
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
 
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY(flags, func)			\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)		\
+		.short flags;				\
 		.popsection;				\
 	14471:
 #else
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #endif
 
-#define ASM_BUG_FLAGS(flags)				\
-	__BUG_ENTRY(flags)				\
+#define ASM_BUG_FLAGS(flags, func)			\
+	__BUG_ENTRY(flags, func)			\
 	brk	BUG_BRK_IMM
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
 
 #endif /* __ASM_ASM_BUG_H */
diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
index 28be048db3f6..044c5e24a17d 100644
--- a/arch/arm64/include/asm/bug.h
+++ b/arch/arm64/include/asm/bug.h
@@ -11,8 +11,14 @@
 
 #include <asm/asm-bug.h>
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)				\
-	asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
 
 #define BUG() do {					\
 	__BUG_FLAGS(0);					\
-- 
2.39.2

