Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1477D1384A4
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263002; cv=none; b=MbnLfCXwSQVuiEJi4emktrLI2KyOpjspT9qBDdr/cPs47+FrcjqtrQkZqYjX4FjB3aZhoSiTjh+q/mbVNo8PgWGQ1gGstT6POl+S/lIrxvsnprwTQOA5bqzlCw9OislU0W2onmKBIqmzieW61tovWBhqApkkSxPSCqHpRcfx7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263002; c=relaxed/simple;
	bh=6sNYSIeWjeJasEWjPkKmJrJOPHHuw7n+sDWqcd32API=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mA4KmXaxsnP+iaJScU1NZEJaPLbiLeTW5bxbKpAp+sVOmzcq1TD8sifNoWzVBzBjScaGX8BFSa3IrMiNDZ7ArkPArrustSpLHDXyNDl0hCJsef92Xw290LPQkOPeobJuwx6oZlcDXFRq+723Kz2z+i7zl0t/pa4NO4HLHVH757I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Olvk6WM4; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Olvk6WM4"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso564835b3a.2;
        Tue, 12 Mar 2024 10:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263000; x=1710867800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g4hKhLnYWz4PyvpNTr/SgCP1vJlAe2ABRcfc3yqje8=;
        b=Olvk6WM4FtuTaFyI7SKzZjiQN1Oy/JkS/NxA/GZt2UgSTFs1uYfu7336y39/GZ4PCp
         qoqC20ubMponq6z8xXjEWqMY0N7Kn8qcTJxI1Y0TULuSamIuUukR0CpstxKHo4XoWsEL
         jtyfPOB1mCdo0n02iAtY4fGZQZ1jtfFbk0Q/M+RXQlrT/8hO91zsQE7iJYDNadOYDP9Y
         M4LlSHiS5Zun3s3yAOXITioT/HXzSdlTVrcWxpd/s9+Bkwyz1F9bgQw2r9W7ObvGNbUV
         yFrr0M2bMliAftHm1aH+c43AO5LYVmYe4P/FQ/9VnVUy9Iiw71mU6zkKH24nOCgKCQPe
         Y/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263000; x=1710867800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0g4hKhLnYWz4PyvpNTr/SgCP1vJlAe2ABRcfc3yqje8=;
        b=T2dYwHb90xiONPhnG575iIEpXZm29cyaPYtpfRzHotdSSbEd8XnBo0sKlhBjtZ57kM
         VN+D99NfAYz0LMQI7QLOnaUgCN1u6HKGerQsXqUcHdpULBkV9mtBeHkBFafPRVD9MlEU
         BtPkqoYzsYWgvg3oxMGUQpPCCX8xmIYvsUnJ9eialzv+T/OYhfDHCtGclAS3GLXnEcPS
         epQWZv4e5f5nU1Ard1ICP4/4kG/edFC5U8+kgL9SCfMkccAQepItINxbBUYTWcIBghkL
         y7Dlr2iJHEpTB93YAWgDDBBS9kWNj8gem7/4vxYyEToO34nECCbhj0WkphEZRi6o/A5B
         v8AA==
X-Forwarded-Encrypted: i=1; AJvYcCWsQqHLs7NiZh8Ghy7LXlhTpPb/A8lUVj7TV18Qs8YQdpFbELMYSeGLThxCupOffyolM97TSYzRO/+M6dAorDQm+GN9rWyO/h06Pc2G11VnzTG5rECWVllAW8gk6J20F9Zz
X-Gm-Message-State: AOJu0YxR3/IvTWyQ/GXzeXK6zHXmx22HpfD7dA2zgtOOoXWR0TocAOi6
	G0bB0jMI53AeJa1lX9MGcrU1eguqkKFnEsk273Rsa+wUnhDkVDkS
X-Google-Smtp-Source: AGHT+IHT6d6QUcxkAobup5YpfcRZi4Aa/waxUmdzBZbBKsk0+4WZBzbaK7WYGFQOB9v1r7/VMSutWg==
X-Received: by 2002:a05:6a00:10d2:b0:6e5:ad7d:d031 with SMTP id d18-20020a056a0010d200b006e5ad7dd031mr32842pfu.32.1710263000113;
        Tue, 12 Mar 2024 10:03:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r2-20020aa79ec2000000b006e31f615af6sm6552880pfq.17.2024.03.12.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:19 -0700 (PDT)
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
Subject: [PATCH 03/14] kunit: Add test cases for backtrace warning suppression
Date: Tue, 12 Mar 2024 10:02:58 -0700
Message-Id: <20240312170309.2546362-4-linux@roeck-us.net>
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

Add unit tests to verify that warning backtrace suppression works.

If backtrace suppression does _not_ work, the unit tests will likely
trigger unsuppressed backtraces, which should actually help to get
the affected architectures / platforms fixed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 lib/kunit/Makefile                     |   3 +-
 lib/kunit/backtrace-suppression-test.c | 104 +++++++++++++++++++++++++
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 lib/kunit/backtrace-suppression-test.c

diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 545b57c3be48..6a44d2b54ea9 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -19,7 +19,8 @@ endif
 obj-y +=				hooks.o \
 					bug.o
 
-obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
+obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o \
+					backtrace-suppression-test.o
 
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

