Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D8B14A4F4
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150400; cv=none; b=NXPz+521/m1dKR6Vs2zwD4wKLHEyRS4wnpvMGnI4QtILUlXesDGZXz4t/386Ch0PBppJprWMoKd24SW5ldG3L+w36rW02CKayz5IWCVZSd3oDSQf42lB/LPzw/EHvbAob44NTWJarULRqLrTWFFLOCTwjPvu65MX9xLMMd8+e24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150400; c=relaxed/simple;
	bh=0fLvUVIM8hMnJqHuv9ZzGmXuFPtZa8t4XuuwICdw7MQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g8i7EeXdMGywb3CJO3hA7A9zF2kyEXQd0iZUIVRYF8t1GfqOk8YWJ6C6DtMrsnoGShyz+CHlNKfcnE/MO8niTz3IKqZ2bI1VUjLjhrCngUpWWYUetiSZVVfXGbseSSmTSnxeOm4iMGMXatEaSj1J1Zbe+PGsdsVkGF5pgrrpluk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwXvJi86; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwXvJi86"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0d8403257so49723995ad.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150398; x=1712755198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4Cw0LtOjrrGR/zeu8wuFTPQ/EpLq4I/3itsXmN/APU=;
        b=lwXvJi864yJZDLf8sIt5ETd3Y2AGYB4Xb7/XalwDP1U9TZ8FkYjZ7CV2sHsNaLR9cC
         EWDVmyLQfD2LHmfQ+VmteSZiT0bPa2l6iAEraYtu4hMtWNjTgCXsIKZnkzpS527HudEJ
         EQLM3xT2FM1kJIhkFTZ8vT19QceuMIwXq8CbYlbRWJD+Hufm+9hFcvKgzV6lZZCEYKPg
         b4DMB4idz9psWPsJr0D6pLHaKivZ4lGzSWWI1Q7aRxY4OlnfRFumrwLXRaCkRPi+OcSg
         dvLijnheJDERMtj9bbZ5VAzPlzL86FYwGSEGIkVNjoBFY54R1JWJURiqeYzlxLaSmdnP
         wcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150398; x=1712755198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4Cw0LtOjrrGR/zeu8wuFTPQ/EpLq4I/3itsXmN/APU=;
        b=qMfrHCG16W4craBv5zJKZHJduy3EzxgfSESaKu8h1QNjaRLAF2tZ1Ol1Zc/NtPPWwm
         cNvMyTJt3/7UTDQUOfNneAzhrdEHbCRaZ5CCM2bhk28dEKLM9NpA+wn0qWE21Lf+9KUF
         a2iiVkuBy2685LYb6K5Jj4DPvBpKPCArwHTIpn/pqNQ1XD6O53skdFhVK2SbelTMKzpH
         2B13TF8MXkLw5sqqMZIZZ4Qu1Ez2L0wO2Z9soqMrXA/SYb4damg/j5EOlViiEMc5XgT9
         5yd5nkgdTzaYeI/h//haokNcc/R5REIYUJxGTjoPILT8turvoUy+EBJxpz2sPAvFKcS4
         5nZw==
X-Forwarded-Encrypted: i=1; AJvYcCWYq4z/fMO1o7ukaomquNLSQWOrWRT1x7DltFiXGhh+lXTs/ahAlriDnv4PSVdYFM9FxBm2HyQDUTzF1O7+/4UMl25T4BBnklIw
X-Gm-Message-State: AOJu0YySo/JNov7DjoaY64z6a0oNCv+NH8xuxFtcIRXSt5YynOkgMLgK
	TLYghvSL07UqmpdPRgomVKOty6HWTmp9xi2G0QF9z5x3T+7WST/G
X-Google-Smtp-Source: AGHT+IFWFkTPmr0egylKtq40e/om3PfbjESX8Y3agDhfM9FAMg7tTYjJ0Fk7T/XrXLnOhqzCRkHQ4g==
X-Received: by 2002:a17:903:41c4:b0:1e0:a0d5:1d23 with SMTP id u4-20020a17090341c400b001e0a0d51d23mr17965782ple.29.1712150397884;
        Wed, 03 Apr 2024 06:19:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090332ca00b001e0f504a74csm13199577plr.269.2024.04.03.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:57 -0700 (PDT)
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
	netdev@vger.kernel.org,
	x86@kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 09/15] loongarch: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:30 -0700
Message-Id: <20240403131936.787234-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
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
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1; resolved context conflict
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2; resolved context conflict

 arch/loongarch/include/asm/bug.h | 38 +++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 08388876ade4..193f396d81a0 100644
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
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)  .long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
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
 	annotate_reachable();					\
 	instrumentation_end();					\
 } while (0)
-- 
2.39.2

