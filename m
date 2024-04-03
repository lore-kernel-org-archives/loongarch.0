Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBFE1487D8
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150387; cv=none; b=dN4G90YdT9a/5y0YIg4w41NO2AdLNYRgY9jHrhyFj9sZrJtO99G6PJrHNwt+/f53WakA3AFw6JEEpDoiyg9RRef+FNvEkyn2SFE5LcN6dOtbgAj0EzJojY07U+P7EPkm3vQakkvrJRQDjrwI9QI0nr0smclque/664GuMtDr3Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150387; c=relaxed/simple;
	bh=qIpKll238/HMKyMj8OXA3kK3I9zyQbT0+DzHrIXJApg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D1ZyV6avSgxn882FRvLk2ORpOeO6fLO72UL+v5kh1r/B4nqSauecmCkk+Y1ziFkV0MpOUHA+nmUInb4ExzAtjoLhM/px81i2YU6oLd3XIBzqp/DIHUHBtyynMiVi5G4pPK56OdIjoddFR1OaNqIrvJ2ANAYKI3ihNLKFu3wXcuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJKZRSgr; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJKZRSgr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e2178b2cf2so48999685ad.0
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150385; x=1712755185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPi3jXYhV/VW7gVgCzBi2KBL1/Xcj6OVJJpN8P4Laxs=;
        b=XJKZRSgrj41MXObrURDNhVdydhnv2xF+6hoojW+KeEgg8dGAf+vz6p83dcfTLiK2ec
         Wggdc2dgltC8wZ4YWPXbFw20J890AaGG7luIyFfOk496PMFx/IfasNFMAMATU3qicTGg
         9DmnKo3Y4hx1+5vVi/JWb+TSEB6evGfMcDDVT55SC09NKWpfYImSkM2lf2vhRETf9snO
         Vdx/jLFwivkTvD4bvDGFjVV8jmBOmg6cf2G206vdwHCBga7qbbdI9j69fq2mLLWDm53Z
         CXjmOcTgCz4CaWHqnCFXR75u/GwlxyQMcmeRkZfAHfW22juNJ+JlnL2OnRKKkTkP0jSs
         6gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150385; x=1712755185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vPi3jXYhV/VW7gVgCzBi2KBL1/Xcj6OVJJpN8P4Laxs=;
        b=r4DdruM+0910/9bxoOZU4IuuWK7VyHIms2RSEMwZvFtYEzKlpEN7zV7apnCq3XWkng
         kEfJitF1rfHhcA1PjxqIA+u+JkOI6UI0BToZGT7jCy+JnaB7umroUdBnPccH22x9WbXC
         559KapS6dXTWV43SLbpxgK7sqIXzSKGB5g9BfIUh2tioPUs4MYCvCpqaYktwqRWO92OG
         rLk/ar7BDxbUJhSdzCncQQ9RpYPt/3RMda9BzG4bartqTo8xiQ008uaaqZN0OI2cPgJQ
         1HmukatJ2rIK9WmmnDMuQbO+t7GroX2pamVFrRWsuW5F1RDPCnrRxKPejXZSwISJfDgd
         RaFA==
X-Forwarded-Encrypted: i=1; AJvYcCVpx7XdKMXIf+9wSUgF0hQvdrrQbpUsort4eNCSEJtAIzKvzdt08C0qPWqOcxnuNZQ7pGW6mrVD9sLClhr5Jx+jxqZ9PSN6jGDp
X-Gm-Message-State: AOJu0YyTuTyjiWSj8ozGPJK5MwXa2c6XhzIRcNl+4R/E6Lv4LS147WSm
	TyW9xqXF6PR2cLmAMWAD2k98zgqTGY9kngZWA4eP+ocPMqyIQEZt
X-Google-Smtp-Source: AGHT+IEBdntNuCJK1g1Qd+nUbBCHvT+g3ANfVkijVSktnMtYlUtgHLeuVpmPgg+o1C+TJMJB0A4+8w==
X-Received: by 2002:a17:902:9004:b0:1e2:5e2f:682 with SMTP id a4-20020a170902900400b001e25e2f0682mr6996194plp.2.1712150385380;
        Wed, 03 Apr 2024 06:19:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e5c200b001d8f81ecea1sm13305095plf.172.2024.04.03.06.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:44 -0700 (PDT)
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
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v3 02/15] kunit: bug: Count suppressed warning backtraces
Date: Wed,  3 Apr 2024 06:19:23 -0700
Message-Id: <20240403131936.787234-3-linux@roeck-us.net>
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

Count suppressed warning backtraces to enable code which suppresses
warning backtraces to check if the expected backtrace(s) have been
observed.

Using atomics for the backtrace count resulted in build errors on some
architectures due to include file recursion, so use a plain integer
for now.

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index bd0fe047572b..72e9fb23bbd5 100644
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
 #else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define START_SUPPRESSED_WARNING(func)
 #define END_SUPPRESSED_WARNING(func)
 #define IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
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

