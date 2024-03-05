Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB624A1D
	for <loongarch@lists.linux.dev>; Tue,  5 Mar 2024 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709664051; cv=none; b=mXMRBOx9P4rGeZpuyrbLu8kyTF0PK2B76VwPZ2ZLYgtK+81gMvQymTWHxyJdu5huOaGLgIUkGpjvBOEz871wYrC9QJ7RuKgzqmbScmxX4GxNIOT44/P/VhPfguCvRVHoVFnktxpxNc6FmrwV3Yaa6aWF04WtP0kZRXedyIuA15U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709664051; c=relaxed/simple;
	bh=X+EByhPE4W4zgTIYfKqC/94xGrznhhdQhRd3bhi5ON0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dRNm/THGrNfcwm55akQjzoVdAYBtsl2cjOlz1fdKD87EURulbQNlnHAcGn1TWui3dY+EXdJX3sRW/5DJXsuamE/6gHhiQ7QTLh66aWSMGl95NtflXwGaRmW6fuPx34l/3ewyfr1A/T1IdMqmbM72x7Kxe6MYjCnxNDn3XxgsYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxx3cGNu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxx3cGNu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dc13fb0133so44848505ad.3
        for <loongarch@lists.linux.dev>; Tue, 05 Mar 2024 10:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709664049; x=1710268849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENga0JZ5rPZBACTN6wZjT+Dt35XTgUy/8PrYsu9aECA=;
        b=kxx3cGNuY/YqBpWLatRu8keJn+IJvWtCXTl7RVD5AJ6Zq4jQRsXeUNmOKP7s0rTOaE
         vNoZP1hW+goxtxfCbfHZ42hBOJoSl4/HQgDoL/R4ym1KukaYCGfRgpcr7kPLUjOR3nEN
         lEafCJRZ1yVT57GO/pVnGM7tbdr1AUEorcH15IRrQdzfHjz3ULDwDjBTsDVc4c4yiKVU
         lS8ncuPCJ8MQJVoBmJwkV4msanquMOo3P4pOoew3o7E4cPYlPMxRVkp0+1NZzgDo4xVB
         zqzemeQCd6nc4QEkktgxA2E560k0ohHOksHK9hzo4DdV0JB5//eoSIL9KPw5ghhm8Tlv
         em0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709664049; x=1710268849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENga0JZ5rPZBACTN6wZjT+Dt35XTgUy/8PrYsu9aECA=;
        b=Q+I0eWyySFVZsD007Ex2p0nBC290BXO/VyQgD6k51xJH61AxQOhFB2zKkl2YJ+IWVB
         cIu5RAdEWtaBNf7610Z4VULVbZ56HJZ8S4z8rEEek50OaL9mF3vw490QcO1dnEoCEuk/
         7L7ycg9uOO1XQOocrQM3JHIzr5q64+QJvJl43uuBP07ZC7+gLJoTdD09pX0P/R7V6EjY
         dJhEpJ0YGXM+d2O4aWCmwUgwrBvHeGlnCVKm53VZRlvDNNCTV4rWn7whq6QPO5Z0JHC1
         YP9tsnrFgulxuAPRPavSqcAY0N392Jdv6iTrfP0nxNiErxl7HJ8D7tjAA1D9iRtVQRMe
         kwsA==
X-Forwarded-Encrypted: i=1; AJvYcCWnsgmaZHTj26yw0x2J6r3riNrvbAk9bL5ORUwj1SpecmpDqjwUIzUnZoREqSDVxOxao53wtApUtOVw+a5jx9VsFnMNFj1Y2RUC
X-Gm-Message-State: AOJu0YwvJ9eOLePBzyL5msFuqk7uM3mRY5yrRTiuwrFGC+/K3panp0Lx
	GAHjX+rT8Bv+QebVW+B4QR6BLEsgMuV0VgE3xNnV8ewac8px+nAI
X-Google-Smtp-Source: AGHT+IGaNADSHdFncEfR/LWfbyCwmjp0o5rxbAapZy8J6iNa5dKZ3vsRFEkgrPD+a1CNTYdARh80Yg==
X-Received: by 2002:a17:903:2406:b0:1db:a6b9:a311 with SMTP id e6-20020a170903240600b001dba6b9a311mr3070617plo.41.1709664048799;
        Tue, 05 Mar 2024 10:40:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b001dc6b99af70sm10896612plf.108.2024.03.05.10.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 10:40:47 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 4/5] arm64: Add support for suppressing warning tracebacks
Date: Tue,  5 Mar 2024 10:40:32 -0800
Message-Id: <20240305184033.425294-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305184033.425294-1-linux@roeck-us.net>
References: <20240305184033.425294-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for selectively suppressing WARNING tracebacks to arm64.
This requires adding the function triggering tracebacks to the __bug_table
object section.

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

