Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5C14BFBB
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150406; cv=none; b=kYIblESAywru96075uSqbw3ap/Mmc/ujttNCYmg0bljW63rJ6OKwWd1bpJ/VP0ChYtHCLThEs2dgJa/m9exbVRlBlEMuC1oHDAlWWMJzfF22D9ffhsDTVN2kC5/5fw+5nBF47J7QYbCLI2FRj6u5CXAgR5xNf8G2Uki2C4K8SPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150406; c=relaxed/simple;
	bh=RCCT/5TpvcROnLQfnurJQ3QCbHt8dW3ImZclXmeu/JA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mtI+R9GhYW39V+aUeLk+B9iMd3aw2BuI3Tr7u7HiPXxxEZCAdTzt/r7WplTVXgso0Po8XK66FVJqZcykU9IeaSWBdOo+GGNCP6m9EjUVST1S1nXP4Ko8AThzHXc834Jpuj4sTkoY2Uv/Tho/t5xVIcaAqKsjchs2vlPVIlkvbIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBAD+dnb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBAD+dnb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e27fadbbe1so13055155ad.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150404; x=1712755204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=;
        b=FBAD+dnbCgqAAxxFIJk4VbAyqVZqOcrTzgHhlJxMwqIIWNT3eO/j79L+TgymMR10cc
         d1olh45Ep8nniHlRiOZg4mPJTD7VOeeSJTXNIyxHxvI3eoYWXS2VfonoQ0oHQ/j7Ydlw
         LBm6a9c7aTCIdLEXp/V/1T/GVHvs88q0/borWg9QKlR+8B/9Dhil2oxvvPzP3m6Ik8Pg
         /Gjo+ifTfJFYKBDjMiH5tJ4BjFpk3BQtr4oN6TpkHtSdBROiUvzL1INaaY4TEfrm1H+L
         9TxFRSZpbr7YCTFSYogmYBgVL4BzcgcTKeekkPQQwca5HSA9liC1ptgh8g1Xxjjg7EWl
         rWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150404; x=1712755204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=;
        b=n/yvWo5DyFSoF624679bvBNhRpFUT7+ZR03qz6DK6gpk9IVMT3xt6CfS3ZOT+CUD/+
         Oj2DglJ6jW5sMdwvUt9i1B4v7QJUOskVP7ESgoF5aIJb2OLIUlXFmuNZDQujjDfj6wme
         O5XWQeG0pjnrKzqspFT1jjZw+YqlGhf7/Abey4xpwKk5ohOgcNzeJwwUwVJ50tQtJHJm
         uxPOps94aruKOpQB+zcQBfg/Sn9tY6CyH/okqEDy5gXbG2DYgy0CX7/N3Dn+ZyvVCWGO
         e/Lfox0iVg3r7hvXyPZENdaHrEete27xIMtVMpCZ8j404ghrrP49WmcolJERY8V9wORY
         8TRg==
X-Forwarded-Encrypted: i=1; AJvYcCUeRdtswQDRfz/ep0OGH6grP9Y5x75DTX/QyJdJSPDS00Wl/RDgdKnrdsnpYNypqdUTBG/Gd/cCAG1YSZWJqFrqUr7eGG7R7Fef
X-Gm-Message-State: AOJu0YwWC0clUUjDNMLbKFGFp7ngIcKfB93QkmeHzRGurSZGwjorQLkc
	aRiFbZAf1H71YAviMlUYLEYHBEhMAEc/kyOPQYn8Aqu53lTlASFq
X-Google-Smtp-Source: AGHT+IGx8oRVikcJmoZrmV6I1PpggSRavr/G5SNCkYR+IkJlaqrk2wHgg+ZazQ8Nymmw82Dh4v/u5A==
X-Received: by 2002:a17:903:32cc:b0:1e2:2d0c:fef0 with SMTP id i12-20020a17090332cc00b001e22d0cfef0mr17310539plr.48.1712150404272;
        Wed, 03 Apr 2024 06:20:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001dd4d0082c8sm3855527plh.216.2024.04.03.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:03 -0700 (PDT)
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
	Simon Horman <horms@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v3 13/15] sh: Move defines needed for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:34 -0700
Message-Id: <20240403131936.787234-14-linux@roeck-us.net>
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

Declaring the defines needed for suppressing warning inside
'#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.

.../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
	Prototype was for HAVE_BUG_FUNCTION() instead

Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
to make kerneldoc happy.

Reported-by: Simon Horman <horms@kernel.org>
Cc: Simon Horman <horms@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Added patch. Possibly squash into previous patch.

 arch/sh/include/asm/bug.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 470ce6567d20..bf4947d51d69 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -11,6 +11,15 @@
 #define HAVE_ARCH_BUG
 #define HAVE_ARCH_WARN_ON
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* CONFIG_DEBUG_BUGVERBOSE */
+
 /**
  * _EMIT_BUG_ENTRY
  * %1 - __FILE__
@@ -25,13 +34,6 @@
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
-# define HAVE_BUG_FUNCTION
-# define __BUG_FUNC_PTR	"\t.long %O2\n"
-#else
-# define __BUG_FUNC_PTR
-#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
-
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-- 
2.39.2

