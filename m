Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24D5130AF0
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389192; cv=none; b=iLuM2qUN5t3GgQE7e+Ave3g1iZGCocT+luI3n1c43av6SdQ4xJ81y5PRVBAOA61gQayPdSkUdMSW7nST4Lpn0JB1AqycZYljym9nGjsBuLOLSFU7Kcaw4GKr9KC2ECQSMfKAfn1zg7RHnFngK9E54Cgdk0lNwkYkivzIOgBfpDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389192; c=relaxed/simple;
	bh=gXmhoSugTMNNbGcVNtnGx4y/QKbSNifMSyDkE7Ry1VI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kFEzuRrk+IvB5CqwuykxG90CU1tFNcQ98J/zFV2bqFcKLHDOBF85t1AKkqw8LCk7IxRoBRYr0hrz4L7MEfOMzw7/zkOxWd1EgXRNImPixHI3NmeuhYsK8emq3cIz39SICNr4U4QDxU16DrsWPAFRQnB7Ke34KEstApmpEcbMYqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ9FAN8F; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ9FAN8F"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5a56a5f597dso208627eaf.2
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389190; x=1711993990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F30AvGE946RVy95xtPHKquJN7yP343T7iOtn6SBetHs=;
        b=kJ9FAN8F08/TR3xraOnnz96R9dpL6X/PYhpYCx+lDdRGHwiI9UQ2v0yphb+AFRYI1U
         VUvLuqh4lpaH5jAlm3wwMHdJnqTLABsTjB1uQsVS8GwZbsUyF8X0OOy5CYDpfWZjvl09
         v4Unjpk/szNc0K1rb7IxU8cos5f9nT0x4GU0s2OUdYo9Y8/Tt0drQDd7FPhMl5XfoE4f
         3nGPzgeqYeavqlb/ghnf0RCXzV+vV6BZQi4wFHd1df6phmP3D19vhdKtPaEzBuqZ8sKL
         rpGjm+8Hhtn/jQfNub6LcfLbyOnBF3402I7NoQK2EYYO6JAlbcZ6v2dzWSUV6rnQY3Xa
         yRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389190; x=1711993990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F30AvGE946RVy95xtPHKquJN7yP343T7iOtn6SBetHs=;
        b=DJhCIc3Sj0vwPmPIhzJtw8fedbZYokXPm9kR7Pj+bm89jB6uMDZ09kr/A8x4fK7aA7
         S/p3Uys/yfdOvoozA7p4f9DtBoQCPtWKrufQyCwoSebIcGnnn9XRPzE/GuJPLZCEz7za
         r/cbBtQvOug6PjpUATKk/CvPRyDWBX3nkuD27GRNtDKePMCx4yPi3G8Yoj69a4uVrUzW
         HWleUEikJ/KEu2U1xNfQ3xu3+33to7ei8ZF7zbCJCyKAJprApNrHs25nPX5kAQgpPV7o
         gEarYiO7ZMsplQjDLFkzDYBTBUA+bABraCN439o3UwCA/2gr+9YKYAJLNZ4ElEBosNlk
         Vdpw==
X-Forwarded-Encrypted: i=1; AJvYcCUd4TiHKRqZyIQyhJkST/ogLWNNijqR3r/IkZGOoblE4DWznO+DyT2F4V11VkNfawRQp545pBKDKj1+Z5zjBh0gtlvaDTwlN9t9
X-Gm-Message-State: AOJu0YzRkkOUjneOAzMoFI1z6YkxhOH5eA2yRwS8jjCwxdZ5bbIQVtH1
	knL7Q2GCjAo2G/L3lMu7ShUbphezWd6HEdwrzrIHV5xEUelaW73G
X-Google-Smtp-Source: AGHT+IGEgVL6INIMyDJU0IaAEGEaDLUMgFRfTdxKfmOhvRWOloE0bqtXSOQ5POYMBfg/SxiyshOSnA==
X-Received: by 2002:a05:6358:2922:b0:17e:4cad:a11b with SMTP id y34-20020a056358292200b0017e4cada11bmr9108706rwb.19.1711389189758;
        Mon, 25 Mar 2024 10:53:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w62-20020a638241000000b005e485fbd455sm6068607pgd.45.2024.03.25.10.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:09 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2 09/14] loongarch: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:43 -0700
Message-Id: <20240325175248.1499046-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
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
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1; resolved context conflict
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

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

