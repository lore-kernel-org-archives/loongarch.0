Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C02E1384A4
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263000; cv=none; b=GkcFC/bzreVdZ/Xm2yvCZeTxs/bdWbChjxSiGhGGrDkJA3UOYxoGWTtdDhSL6+NKM5l6yccc0q8tX7ARikosJ0oijqAYoJgnRZ8SLoM/aIWPvseiwoMdJerrdSqwQuM3QcFncD9V/AjyzQX6gdkC4ogP0bHOOIqxj0dgatmG9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263000; c=relaxed/simple;
	bh=Xkzz7frE9nvSTNzSTAYavYlAajmFMh+XRJNWZiXH5+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X9FYKDaoeEzWelMbeqXLgcheHj3SNheceE4k+f8HnYpnjmfWul6XUj7kJjuUiE4icyKylTb7OKOLp/4NwKm2qdbGKkZTQvWG7i2yCPF/uyLFj8vLbBzx8EIIEgROTyTcIWURSriQHFH3fZpNYonxqXtXcTsf4SrPlBRoqwNDd8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkvyoEVI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkvyoEVI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dd955753edso23090345ad.1;
        Tue, 12 Mar 2024 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710262999; x=1710867799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3Kc+Yh+XQ4llosDDGAwX/2k1FGi6g14GWlRJRORANM=;
        b=PkvyoEVIeXNzrbwfjXTnIzubmmmACQfu/zEzYN6qslt+GWDmwtUK6PUpP6RKyiQv8C
         B86oZki2mJR1xzOyX1dlfRgesVafXkek5x3kEPLhs3XyLOJJsnk3LlcIoIBHz4lnYv1i
         UyGXRLqH5b0ApkBWHOVGVkpHfKlyhxjEFGAvnARhAiXwyRvo/U6iSIvGYMTvnfzmNubb
         ewJM3aAernYKqFIElQ0ClDY7T71CY7hY74NCjJCmqfJ5KD0KLfbNCHQG/wrQjgOqE2vM
         DTErUGeJjsTZzlhy4JzJ74QW1QTipCt14HIdysW8IfmmbPaKTI1t36XRoWxPkhbokkDM
         uPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710262999; x=1710867799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R3Kc+Yh+XQ4llosDDGAwX/2k1FGi6g14GWlRJRORANM=;
        b=lYD9MLSx1nbGzcU/y53/Io93c30IYTW7nWUdh8bdwwJs2j0i3PWp/apjiRSP2J/Kcw
         XpGaVX3GEh5uUCFeySU0jE+xPO4pqU6oCTiEx5QIfGiPwuPk4kWzkaceptegyNn6gfUE
         Hk4r9UGUzL9jf6IdSjIQEHstg2jnb90iWAqrnC5032rMAnK+16Aj+W9V3/HyybC0AjvQ
         sscwLAqiF90EncR384eddShKlVKpegtEoWgBT0gY+1XdUpGtAfZ11FTVic/yQwLMs4pw
         5AAxK/Zji1tFbMp7QEBIfiGBMDlaOgNypAb9Q1L3c0t/b8EyWAyH06ZrVFqJzOTbqRcX
         uiFg==
X-Forwarded-Encrypted: i=1; AJvYcCVy/vik2RnxeP5sVzMIhR+CDrJ343NByuo7anp5CY4hL+vv9ADRI7XngLH464hiCEecjrqgmvFRrVQW/o53j2kNsXrFtfX+siHSJl5t9PDxHc6wNCYZ5c2DFcLXbYcoZu+D
X-Gm-Message-State: AOJu0Yy1oWr/GnaszyVHiVOJZ3y3VUt4N17OCRXMNxkGbheyBbaK7WwB
	XdHOMFsBkP3Mr8uWulINPWsBRTrhjFqm/kMlyImWpEzoeLEO7yLY
X-Google-Smtp-Source: AGHT+IEtMqO0igDV/OJPl9l/q0X7vf8EgJ9VbKv7ARIuPeUFcb0gEvMyJN5DQCEgr2SoDMnFKNIL1A==
X-Received: by 2002:a17:902:7b95:b0:1dc:418f:890b with SMTP id w21-20020a1709027b9500b001dc418f890bmr8936395pll.40.1710262998624;
        Tue, 12 Mar 2024 10:03:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902b78400b001dcc3a46a6bsm6883069pls.262.2024.03.12.10.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:18 -0700 (PDT)
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
Subject: [PATCH 02/14] kunit: bug: Count suppressed warning backtraces
Date: Tue, 12 Mar 2024 10:02:57 -0700
Message-Id: <20240312170309.2546362-3-linux@roeck-us.net>
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

Count suppressed warning backtraces to enable code which suppresses
warning backtraces to check if the expected backtrace(s) have been
observed.

Using atomics for the backtrace count resulted in build errors on some
architectures due to include file recursion, so use a plain integer
for now.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index 1e34da961599..2097a854ac8c 100644
--- a/include/kunit/bug.h
+++ b/include/kunit/bug.h
@@ -20,6 +20,7 @@
 struct __suppressed_warning {
 	struct list_head node;
 	const char *function;
+	int counter;
 };
 
 void __start_suppress_warning(struct __suppressed_warning *warning);
@@ -28,7 +29,7 @@ bool __is_suppressed_warning(const char *function);
 
 #define DEFINE_SUPPRESSED_WARNING(func)	\
 	struct __suppressed_warning __kunit_suppress_##func = \
-		{ .function = __stringify(func) }
+		{ .function = __stringify(func), .counter = 0 }
 
 #define START_SUPPRESSED_WARNING(func) \
 	__start_suppress_warning(&__kunit_suppress_##func)
@@ -39,12 +40,16 @@ bool __is_suppressed_warning(const char *function);
 #define IS_SUPPRESSED_WARNING(func) \
 	__is_suppressed_warning(func)
 
+#define SUPPRESSED_WARNING_COUNT(func) \
+	(__kunit_suppress_##func.counter)
+
 #else /* CONFIG_KUNIT */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define START_SUPPRESSED_WARNING(func)
 #define END_SUPPRESSED_WARNING(func)
 #define IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT */
 #endif /* __ASSEMBLY__ */
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
index f93544d7a9d1..13b3d896c114 100644
--- a/lib/kunit/bug.c
+++ b/lib/kunit/bug.c
@@ -32,8 +32,10 @@ bool __is_suppressed_warning(const char *function)
 		return false;
 
 	list_for_each_entry(warning, &suppressed_warnings, node) {
-		if (!strcmp(function, warning->function))
+		if (!strcmp(function, warning->function)) {
+			warning->counter++;
 			return true;
+		}
 	}
 	return false;
 }
-- 
2.39.2

