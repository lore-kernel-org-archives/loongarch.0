Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBFB14A0A8
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150398; cv=none; b=Ye7rEXPSb62wy/nDJxBAjawKtf1o/n25/HTU3MbzlJuFc1RS5xGPvxyrh2Ijd8TI6uT+UpMVb1XjBlPug3rkXnT/+pcqutbPFVTgbuUUWVo0OvQXJQN82PjNb0NY+kENdZLuPUyUgX4jijGhbnXWj6Ju9pR4FnSDOp9W3U7/ByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150398; c=relaxed/simple;
	bh=B/NNlS2N17miXcHeSXZpo3PO1m06tpCq1/6642pEKOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KN7PuMDbhThfsc1qe70a39snnCDQQsaqHXQkxX8N6d/RWvvA5BKJaG8VMnYHFMCMPGB/7BUPniepd1BRl/vmmaYr5S0tbtTZEnJG1BuYZC5zDuLGroOomJuLAcBtnRnh1llmmD4CIh4OOUG3bRsAJ3yKlvKkPSlaAsonFKjWw1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liCKNHHR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liCKNHHR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e0411c0a52so54170705ad.0
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150396; x=1712755196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkb1tQP+RY53Yd+dTVS3E48OfxPMmEiIEhGf0kaureE=;
        b=liCKNHHRIgKq3juYd8wmGUW5ONyOY7OjfFSJTwjF5Xeg36xSgoD3013bKHv+Uy+mhT
         TLbkcaBMsf3EM+21tB5qFZL4kFjN8I3PIz4UaNpHceVx3nqWph7yezmbGnoO3Ds/xLIV
         G4e6gu1Iq+QXTeXv5UaedtCs3AUwMvPnX3mmyCLB2+G7pOmAsGBMZ7fTq/yHPGpJtDcB
         QbtILShSNxAEeg1+jrEUvVIt+IqDBtGU5OBglXayaRZD7GNbwFqYXRGa0znuAnULq4yQ
         /FWmLcEchoRu4CyXgCsm2PXrZrVDAPERDMMRbD/fVIJ5h7dk6eFG1S8ALztPdoBOpp8C
         XELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150396; x=1712755196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xkb1tQP+RY53Yd+dTVS3E48OfxPMmEiIEhGf0kaureE=;
        b=cbfqI+WjQb0flWZJaIaR9xq6gXuuIzCRxl/k9qNPW16bIICtDhNXk6KOc8kxKvzAeh
         UcyjlwAREu4+BS14QeZWOKYP7v2oqZbfoqo90kReLGfenZK7rWTjYJ2k8nG6zEQa2KsA
         RCYbt+jylDQ5C9xijQIusSiTPQ+iZdpiIxdct9pZv/lUukEx1AmXUAEvOFmbY4P17kdF
         uobGkwyWVLE6tO1cgJEFIqR8cAlViP+59+jDVbzuNDJYRmYXzEHyjJ3Dx2cWKpvj+lNq
         4SmfVYHS3Mu2lS9//jPBSVUXxY9Iut7LANSDJJZILlDtUv5sYyJWeR8Ed/uPIDQ46CjL
         1viA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Yx9hCY/WLeskzVFY/NlrQMJ1w+msS+CS8vrGakqt1A6Sae4R5FaY2TA0324tv6KMN1/h0nO8MYBLTQ4shvvnYn277SPSqV1/
X-Gm-Message-State: AOJu0YxhhH73B6lRiaL9Z4yfIzbEmuyUE5Fb/3yMF++a2VLu4n0o/2NV
	TO8Rtv/qwuWciplNylJx2QxmrSI94t1x3iNa05U5L6t+5SchWm8+
X-Google-Smtp-Source: AGHT+IEFIYqOYVWwVKGxmRZLqxD45VjqdbvtvChfTBAzSn1B79yxhWl03nHs5HLMNlC5fEEyMMkQQQ==
X-Received: by 2002:a17:903:249:b0:1e0:1486:e808 with SMTP id j9-20020a170903024900b001e01486e808mr16191679plh.13.1712150396344;
        Wed, 03 Apr 2024 06:19:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001e02875930asm13195748plh.25.2024.04.03.06.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:55 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 08/15] arm64: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:29 -0700
Message-Id: <20240403131936.787234-9-linux@roeck-us.net>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

 arch/arm64/include/asm/asm-bug.h | 29 +++++++++++++++++++----------
 arch/arm64/include/asm/bug.h     |  8 +++++++-
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index c762038ba400..c6d22e3cd840 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -8,36 +8,45 @@
 #include <asm/brk-imm.h>
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
-#define __BUGVERBOSE_LOCATION(file, line)			\
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
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

