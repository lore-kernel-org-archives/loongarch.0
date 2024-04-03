Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C171494CA
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150393; cv=none; b=tmBZJOOQ8YE46EB0Z8/8/+0JvcmHWp7Ffi8j0riNaZ+lmc6s2arTztwCobEK714MJ1EstFOJjvxQsQ8oZ5mhWNuipJp9EhL73Dgyt4NY0K5pZvnjRkC2dofJjo+c/lheB6uTULUhZ2gRUMT3min3k435rjiKenWM4EKfat6cL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150393; c=relaxed/simple;
	bh=kq5+RMCvHSKQHxJsCA0Sj8YeDyJpY+oX/LlT/96C6xo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gX2AW95y5u8eq6YIHRthXv+vqO8KeBff0VNmQ2osCSnLaqk3fEa+m6ANke1qCQ6OYRdtkb+d7Xt4hrYJK2tFeyTiR+KyWC6qrtDorlez3g5OhCW6MiAZNSiYz63sv3RTpDKtezg/g5/wvqQl5ZYs+DUCwsINVi1Obm+RCBD1Rto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK8U90z8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK8U90z8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e0b889901bso51583765ad.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150391; x=1712755191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HH3He2M5JGBbpn1IyUzwQbFpqNeS8i3zDjnB0NO5L0=;
        b=FK8U90z8A12xbf/1XiPnhftSnbPkEheAozOaMwGE/SUztDP8ZEUPbf2WPJNgJcZ+Je
         r0JKHyuyx2JljBOfMYAZFVD1AHr7d9d9tcPrXBkfqANchJra8yrhr4hnA8pdB7NHXLYJ
         S2OH1dwBEMtZW18BxfDr2RqhpEdP9mzdIwwqORQl4RpXZj+ahi759/XjytBWJR9Cngiu
         YLOXAvOrmeP/EkwJrh1NQzmDbsrekQrC0mK7IvmuloFllR2pOI5W5Go7lbsjN6aakeSG
         TweANEbaWyBIFsjnq14TS5IdnLlOlaCc+NFHpaCbCw6Z5F2J6eSgyxIocGY5vjWRXN1H
         6aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150391; x=1712755191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0HH3He2M5JGBbpn1IyUzwQbFpqNeS8i3zDjnB0NO5L0=;
        b=O2oRLI96DfYw7dUPQHi2qZ+CIIZR1ZKzSUhfz2obupuqKoqSy6MJyRRqmQVC7HpKIJ
         CknkUo03XNVPMPRgYhqnd/UmqpxHmiHKrK3JYU+rXoLZ2H29aq4KxWmNrwNSAvQKveYX
         sNQKId6xVqhXe6kAOzZddnAGKUa7AaDahro1eOSlKKj9EdfPTIJl/L2YTaABtq4mqSp4
         gaDs1IZFIhJUC/0+RE04EJRyPeDuIbpwPD7ISlujKddcX9KCBhZexOcNxZFf7dPpIRkG
         e7TXa7vdkJi50r+8ySE3ZWwqZKgxPTSu7b3DHm7TzFFoP4v6p15v1q2qIjpxdRlKpQD3
         uGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlToEho26UD+r0PJbeIV/uwQlQMHY0zW3hJODuFB/xxoI33OlM6Wpz6VI/04PYCXs1Phcj83xYm2/cMCBSQf8Ev01BjESdXcBM
X-Gm-Message-State: AOJu0YziS0+7O1PWGCL8E0XehGIFcR8RDoqEW4nLxS1nXK1ZuENfN7S1
	0cXpVtZ5JCxk+8Yqt6tBiezlHRd1Qjd2OZU3GTlFlrBbaN0j20b4
X-Google-Smtp-Source: AGHT+IGzp4oN8GRSo/9EyN0xy1NOVYsP3l70Car4fBvR2s7g6gbB9/O+yleAACI5/eSTY78txokLLg==
X-Received: by 2002:a17:903:d1:b0:1e2:a177:d6b with SMTP id x17-20020a17090300d100b001e2a1770d6bmr229571plc.19.1712150391428;
        Wed, 03 Apr 2024 06:19:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h1-20020a170902b94100b001dd0c5d5227sm13149194pls.193.2024.04.03.06.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:50 -0700 (PDT)
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
Subject: [PATCH v3 05/15] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Wed,  3 Apr 2024 06:19:26 -0700
Message-Id: <20240403131936.787234-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log and distraction from real problems.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Maíra Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
v3:
- Rebased to v6.9-rc2

 drivers/gpu/drm/tests/drm_rect_test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 76332cd2ead8..66851769ee32 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,38 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_hscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
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
 
+	/*
+	 * drm_rect_calc_vscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.39.2

