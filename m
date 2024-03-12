Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEAD13A244
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263007; cv=none; b=fFlJXknK4u+p3Qm7aSsJwC69gdaVBJROCLbfUWHi8IhbEXJHyBoZIVi3j7h5zJqF5dx2z3uBBSX04T37vj7AU3ywPGHhmVNU3CR/megU13ENr5/xYnkAb7/CJ/Wzpi4Wcbvlo3pOBI7XQiEX1qSy/PY6KV/EjqUWi6wGuDIGrIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263007; c=relaxed/simple;
	bh=N5o0HnSZW5WhDNiR5nZH4ujEcqRXW+pWgts1zMrovCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MPpwH+xd7wYIeGydE5iC3pswQblm9f6+qgfmRih1JwmMRsG5eA1EazSOGM61kewMhLpMxjvJ1ZRaCx4+slFXCVoys0PrZs5OJDHCoZGx1nxErqA15bRxTaKzDG33EizsP51nKD/3hEaVPoaqKeFLdZphJukghXYLvglPp7pePRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMxSTz7t; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMxSTz7t"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6da202aa138so3775169b3a.2;
        Tue, 12 Mar 2024 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263005; x=1710867805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
        b=AMxSTz7taxQoTfndEUQBclGFJkyr6aPdPyp6Opb5sxBFyjGHkzXMuh5ag6647GF34F
         4WcdUIPQYP9R/yWp4oRcPMacUIrnpVrX7+mPjqGYNu2BXu+Mu0b6AB+iRKmT/LlMwjz1
         6gBh0gs7ozan3cve9p/VBZUwgadwyl8cbn+fhbrCvNjtvce176JVVLSVGDCouxl+1jOT
         Oz9hXnFl2ZpBBwr0QwXQae3fN9ObXyOxcGZIl16NiC1F1f58U9+RtdMbY5rYUPZ7NBS7
         7MxsHa5Zg9zXKomU1E/CZ/XAkCrpuLpDcgm2ANWZGv4VGwbKJa6E8Jpo4j9EGsvUf41c
         CFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263005; x=1710867805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
        b=kUd15sE7ArETd39UagGXfWN1kRWwsuTTMlwC5kvbx42jBm/9y+jc+iij3n+9BwNPQK
         NZfimWeDI/+G3kMHHVZPPXwKqS36z1mF+Xk6MaOBqFYuCOQ0wq3QmEPXnZoPY0K5boj6
         9PKxykFjxK8CaNCbz16Xi9vHk58cPsoeS8em9pWdEi59IjNpKn/iumfAa/tf9a6ln85y
         5fQ4AcyMjF96Yt98JcEvQCu2EA7nlAtb7/Vx6xEjAa4uYyrlSDrXJmWzzoB4ucYaBf1X
         VQUKOf19WjzVpqDCgOnR/wvtK7CPyhbBuPPbWWUpKeQTT0ujUBb0pwgSjExUfhDluetI
         Y3tg==
X-Forwarded-Encrypted: i=1; AJvYcCUij8qhljWxNXz1OTLrHLilZmpAh7oQx1RTl9fapFie1t4RHyKYFvjWOcauzioTDrZrQ6wZhEHrvVNZcWSnf52Hese/VdES6gi7xxmQv2ou7oc3hr6jXbCozEo+szKvVTie
X-Gm-Message-State: AOJu0YwuubqURyJr2gABNJsxsn7MeFSlavPHzUx8Y9EXFB7NGyvwYDR9
	cJZ1C6zJWqIWULvZ8iYust3Fa2s8qnfRxKFwpWM75o5LXxOJ4dmB
X-Google-Smtp-Source: AGHT+IGxFzq6cbK7MrvIXcZlkGCehcjfwe014BGxyN94I+kP8/p7v7PJMJz1gy7c7O8kch/y3R6C8g==
X-Received: by 2002:a05:6a20:1a8f:b0:1a1:4ea8:1844 with SMTP id ci15-20020a056a201a8f00b001a14ea81844mr8418900pzb.26.1710263004751;
        Tue, 12 Mar 2024 10:03:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t123-20020a628181000000b006e657c72cf8sm6830699pfd.148.2024.03.12.10.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:23 -0700 (PDT)
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
Subject: [PATCH 05/14] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Tue, 12 Mar 2024 10:03:00 -0700
Message-Id: <20240312170309.2546362-6-linux@roeck-us.net>
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

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 76332cd2ead8..75614cb4deb5 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.39.2

