Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00914900B
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150392; cv=none; b=pLESsvNccm+4iW34v2FKkbT4mAGqcQ3o2WN0i5qskPhklq+gz8C/fBAzog6pYvjoTqBwiWS53F5yPKXlXp9Vf/Jw87h7HV6AL/CBidWTgwecu1Rd+xbo5Rp40Dztbh7NTE36lggUGkniQfPL85BTyilk1p0jgf8avJjGXfkaGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150392; c=relaxed/simple;
	bh=gwAOp4S2RjVEdHOKrWJyWwN/DfRkuBxfLFLX2qhlwAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d+6oQG8n2g8lkNTxz5d/ICc385zgW537wmUnPcKvH9eeclayd+hqGhEefSdHHUt9d+9z8X5SJYSnZQ46ucQg4gKX3B7J4b5Q1OajnyH3PYfJrrLVnP20KuNq5vqbQR7T3YgQiJIioXzrRG0dwN68DkNXMn5hj14Z0cMvP9K3N8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bf+F7BzX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bf+F7BzX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1def3340682so55044385ad.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150390; x=1712755190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUpuwFkhA/ZZkaJrm+5DUMvKoRunaI4/ZlB0ejZmZW4=;
        b=bf+F7BzXco4qA6PI2ksJZzH2Z6E+ayT+XfAfH7Ecda6qcb5v1GwSqQES7Z/KM2KMe3
         w8BBkqonpuCrSLmfsVFD6YSm/spmxWxWUs8KcHFV4dxIa/vCiLLYnqlOiRXApBu1bUSV
         S89uFcNnhqANCDx79XLn+w0IBRzNRqkQT81T9eLfSbNqxCKe4FNEENPNsceSXBtyFCgL
         N86+ctUeYKy0FKR9hwHcCpGv9A5qZakjFsFeaJOEmXrGJS7pvdBpry1pvij4R3XiE2AA
         ZN4F0ajA+ya/GEq3uvJC7cHw6qT2Is+EbiEPTMimzMA3TP6Ng7YAekTJNjAvBWXXkADa
         dKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150390; x=1712755190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUpuwFkhA/ZZkaJrm+5DUMvKoRunaI4/ZlB0ejZmZW4=;
        b=daUmS87aQjlxTk0BcdkGyya+1snpgb29xLOdqoLs+1EqLDggqoxI0i2b2jDTVXgztJ
         AtWMuVghCn9HYn4sJdDjET2Cf+5VyMGVaxNmHZbV7jmCfjxkeRqexl815/OUlaG/+Qf0
         ZmjaNawHdZSJhLmKIszRSPD23eMUiOK9A3U9abcO7uZhaxvwOlHB2Axc37YGlGXO/cCh
         LcNEdfCmOgG1rZLDhQu0fCKQXykCNCJ+wnbY4iXQAGeuVzbTKm29IjsLOUqaY05vvLPw
         WbYXTIqBr51ZpZMpzwnuqQrfSxihQ6PWQqHpnLml3Ju4CRw1Q3UOd9PIYoefv4ZB6QDG
         dAeg==
X-Forwarded-Encrypted: i=1; AJvYcCUaI7Fh0rEthWJxTjUbihhNz+qSdtaTyRxGcH6lcYUTWhvzx1Qfqq4R5FD0rCurLrj6LTboBvsEd6WrepILUDHrvZkc9c3hxean
X-Gm-Message-State: AOJu0Yye8UnNJEHaU+4nhFAh4RkBl+xrm3ncG1invd0/S2PITach/PAT
	lNzmIJ2FL0wKmHD5rwhLM9M3C5x16430iKOHRmfVCyw9+FXA3San
X-Google-Smtp-Source: AGHT+IE/2OacMp/2cfvaRksBgAjGZgKxyI++pmI4VDvZRW0+d8012wJeFPX8kGKifNbdvVT4SH77dg==
X-Received: by 2002:a17:902:f68a:b0:1e2:9205:5254 with SMTP id l10-20020a170902f68a00b001e292055254mr1881147plg.7.1712150389795;
        Wed, 03 Apr 2024 06:19:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001e088a9e2bcsm13158796plt.292.2024.04.03.06.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:49 -0700 (PDT)
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
Subject: [PATCH v3 04/15] kunit: Add documentation for warning backtrace suppression API
Date: Wed,  3 Apr 2024 06:19:25 -0700
Message-Id: <20240403131936.787234-5-linux@roeck-us.net>
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

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
v3:
- Rebased to v6.9-rc2

 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..8d3d36d4103d 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Such backtraces can be suppressed. To suppress a backtrace in some_function(),
+use the following code.
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		DEFINE_SUPPRESSED_WARNING(some_function);
+
+		START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		END_SUPPRESSED_WARNING(some_function);
+	}
+
+SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
+suppressed backtrace was triggered on purpose, this can be used to check if
+the backtrace was actually triggered.
+
+.. code-block:: c
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
 
 Test Suites
 ~~~~~~~~~~~
@@ -857,4 +885,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}
-- 
2.39.2

