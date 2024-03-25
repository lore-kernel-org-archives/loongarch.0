Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1F7F48F
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389182; cv=none; b=JaGS+gVktxJn9wx+Nfgq+bMAE0KErfYxG5NPszw+BqD+K+7veRPaPyMIciAWia4EzuEzLw8efGMb47a6DVfdS8ZFTSxiAX2fbJ+8hOWsRcxryAneiLiCxVDwj7IZnXvSFqmM048M8yNSOTpIzk7HTcHzMMqiQr+7KCAxulZeoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389182; c=relaxed/simple;
	bh=Q4GDe2OF/UogPfEQ1Rxv6tM7a2FMPTCpZuxl7c7+zL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cj4ngip/Qvhl1dZ4kA1isuqGFW6gyTZlT8ddJ9VLvQ0Er0+IXLBApduQh5mb3KWwfqmHe2sciq+SlJxzkD+u/LgUFDl84dDgMRN+0acmDA8/a3+UY2hJuszVkO7P1Km42CWMmViwzCzkGwTCmGAQq5ybcClAIE3qa/K8W4cP4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm0CN1v/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm0CN1v/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1de0f92e649so32338355ad.0
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389180; x=1711993980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAqubCL51IrVA5I7nNJRuv0X36LpccPRVheB6cZNZ0A=;
        b=Vm0CN1v/dNC88kXHxEabAOWEv9MLkq8pDKKcgHR6t8bFMoTR3nRNkCEG5t98UJnO7a
         CRD6IjC//nAkiH6OjjCYpjQzlrlcsm5+qm7yaWux7qQG8Uj8JQ3j1XkNcp3JXUu42j+3
         bMdusCM9oK5aNqVSYjopnxZDaZFRTJepwgdgyjlImdiYK6wc4QPYS5xPcOklsNRgWg12
         zTiN8WdhQcQlmrRCcrMdJYgl4kGvBiYJsSde5D4peZ5wRlVrJ0bEvSqKNNjmdVF97Gvo
         RcFENMPwJZTeJmFWreRJOlbZsoQ5lWDP8YtuPBUJtkfzgMZIBKI3//eLcnqVFxG7A3Eh
         P7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389180; x=1711993980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WAqubCL51IrVA5I7nNJRuv0X36LpccPRVheB6cZNZ0A=;
        b=SVHuR3oiI7vXtgV7AgfQzOm0DA9zLWdem2WTcCuCB0vJTzfAs1f0pVKcnB3GBzFl36
         uo5OOTYuqT+8Q+RN7bZleJTnxMi0h7+yQOlk2BAGEoJzzf8f37a/emyajgIyS+VG35uO
         A2HveYyF1W0Dr2P63pjXnpliSkDky2dFwMhP4JzhF4bgCnrHclU/m9RyFIMRWsaKGARx
         xNB8zJwb0Uk02qQl71kQyu0lGXG/o+5t8WlJfqoRRKLQriZGhH9Bk4aVeC0X9oM+xBbE
         9p1UdhdYL7DkEI956xZUKgV2tGCMQVovnmXuVh23ndVE8KPVh/Py+o6IIpe4g8fC0eWX
         X88Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRJiUXtPYu5eGoy5hGwfGedX5XozsAtO1VVM1UnhS3XPZ+CID/UNziFfGTIUfAA8ComI5/qdHdg0ArWVgsUQwWwhYnUIF42BJo
X-Gm-Message-State: AOJu0Yyf4kFHVLANqa0lhp8E/Oi8gzzQdQDZSoXRGQFLorhjCSy0VJ80
	ML4zGZ0ik78mZtA3OzChzmnxk5v2AnL3PemSqZaXnCflUCNpAevM
X-Google-Smtp-Source: AGHT+IEZGgr3SHHp7IQgBYCFkoLblCFSkGv9KaSvXEQxhqKmotSHNR4v/ZnArS+Gaiul6D7vvEZjeA==
X-Received: by 2002:a17:90b:17c3:b0:2a0:84f8:3096 with SMTP id me3-20020a17090b17c300b002a084f83096mr202747pjb.5.1711389180022;
        Mon, 25 Mar 2024 10:53:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fv9-20020a17090b0e8900b0029c7963a33fsm10424210pjb.10.2024.03.25.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:52:59 -0700 (PDT)
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
Subject: [PATCH v2 03/14] kunit: Add test cases for backtrace warning suppression
Date: Mon, 25 Mar 2024 10:52:37 -0700
Message-Id: <20240325175248.1499046-4-linux@roeck-us.net>
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

Add unit tests to verify that warning backtrace suppression works.

If backtrace suppression does _not_ work, the unit tests will likely
trigger unsuppressed backtraces, which should actually help to get
the affected architectures / platforms fixed.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 lib/kunit/Makefile                     |   7 +-
 lib/kunit/backtrace-suppression-test.c | 104 +++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 2 deletions(-)
 create mode 100644 lib/kunit/backtrace-suppression-test.c

diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 545b57c3be48..3eee1bd0ce5e 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -16,10 +16,13 @@ endif
 
 # KUnit 'hooks' and bug handling are built-in even when KUnit is built
 # as a module.
-obj-y +=				hooks.o \
-					bug.o
+obj-y +=				hooks.o
+obj-$(CONFIG_KUNIT_SUPPRESS_BACKTRACE) += bug.o
 
 obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
+ifeq ($(CCONFIG_KUNIT_SUPPRESS_BACKTRACE),y)
+obj-$(CONFIG_KUNIT_TEST) +=		backtrace-suppression-test.o
+endif
 
 # string-stream-test compiles built-in only.
 ifeq ($(CONFIG_KUNIT_TEST),y)
diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
new file mode 100644
index 000000000000..47c619283802
--- /dev/null
+++ b/lib/kunit/backtrace-suppression-test.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for suppressing warning tracebacks
+ *
+ * Copyright (C) 2024, Guenter Roeck
+ * Author: Guenter Roeck <linux@roeck-us.net>
+ */
+
+#include <kunit/test.h>
+#include <linux/bug.h>
+
+static void backtrace_suppression_test_warn_direct(struct kunit *test)
+{
+	DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
+
+	START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
+	WARN(1, "This backtrace should be suppressed");
+	END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_direct), 1);
+}
+
+static void trigger_backtrace_warn(void)
+{
+	WARN(1, "This backtrace should be suppressed");
+}
+
+static void backtrace_suppression_test_warn_indirect(struct kunit *test)
+{
+	DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn);
+
+	START_SUPPRESSED_WARNING(trigger_backtrace_warn);
+	trigger_backtrace_warn();
+	END_SUPPRESSED_WARNING(trigger_backtrace_warn);
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn), 1);
+}
+
+static void backtrace_suppression_test_warn_multi(struct kunit *test)
+{
+	DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn);
+	DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
+
+	START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
+	START_SUPPRESSED_WARNING(trigger_backtrace_warn);
+	WARN(1, "This backtrace should be suppressed");
+	trigger_backtrace_warn();
+	END_SUPPRESSED_WARNING(trigger_backtrace_warn);
+	END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_multi), 1);
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn), 1);
+}
+
+static void backtrace_suppression_test_warn_on_direct(struct kunit *test)
+{
+	DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
+
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE) && !IS_ENABLED(CONFIG_KALLSYMS))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE or CONFIG_KALLSYMS");
+
+	START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
+	WARN_ON(1);
+	END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
+
+	KUNIT_EXPECT_EQ(test,
+			SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_on_direct), 1);
+}
+
+static void trigger_backtrace_warn_on(void)
+{
+	WARN_ON(1);
+}
+
+static void backtrace_suppression_test_warn_on_indirect(struct kunit *test)
+{
+	DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
+
+	if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
+		kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
+
+	START_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
+	trigger_backtrace_warn_on();
+	END_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn_on), 1);
+}
+
+static struct kunit_case backtrace_suppression_test_cases[] = {
+	KUNIT_CASE(backtrace_suppression_test_warn_direct),
+	KUNIT_CASE(backtrace_suppression_test_warn_indirect),
+	KUNIT_CASE(backtrace_suppression_test_warn_multi),
+	KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
+	KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
+	{}
+};
+
+static struct kunit_suite backtrace_suppression_test_suite = {
+	.name = "backtrace-suppression-test",
+	.test_cases = backtrace_suppression_test_cases,
+};
+kunit_test_suites(&backtrace_suppression_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.39.2

