Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99AE1B597
	for <loongarch@lists.linux.dev>; Tue,  5 Mar 2024 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709664047; cv=none; b=mVFo+QYULl9YwuPbs3NnHx+4SzShsC2L9+JKAEE4xj+8YLfNpSTPXwwUSDMeAdks1tuGhfVbU/nCIeBgKvESZ/wvyOcF3rOkR8U8vccS8UHIlGwJWfQ0RNzgLtCp47Ugz3xq/WV8zf8f2Zk9740znQatuso23ASuo5g5w2SJU0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709664047; c=relaxed/simple;
	bh=N5o0HnSZW5WhDNiR5nZH4ujEcqRXW+pWgts1zMrovCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jdz21HWUBYxvn8t/Iy8rNnNS4dECTuWehJ7s1C8Fx6J2QTeHraUsSeRqvHCd5yVPqCKtiTK59Lk0DVWISCSW/VHP2dpPBRMvGH8XY7ivru7jGtH9Lj8iI5ndI3wv3q52cPgFW2mqOj9LRb1PjWvWgUy7hpM59Xxvl8BIrpS8mOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCsfKJX8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCsfKJX8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e5d7f1f25fso2642773b3a.0
        for <loongarch@lists.linux.dev>; Tue, 05 Mar 2024 10:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709664045; x=1710268845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
        b=PCsfKJX8KjrzwdEEdBv/RDwvoQlW/JeR+M1X0egSFMUAyyUyl3sque84tD5AQIjR9n
         SCtzqnNheXkPH7CFJGCAiUPmDR1gi50wzCGEbz1ehb39Z2tZ8I1f636Y+Hzb34G1EdVQ
         FpUNjFY0A16KVySSy+Cu1y/1ajemJwSfhpI6FRUtKO7x9Q+fYEVLfTcWv8nE+Ie95jhp
         eoKt5Rf0uRRMaCnsiEpZHO7kORQSAyUhCmvnidSJXdLYqf2YBG163nMtyw5zcqOHIZE0
         KzYFth9W+LECRJi8GxN+LqTjZ2BbmEG96NTojz6vvy2Lo2OMHI/i39MVTlld+W+kxuXf
         Tiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709664045; x=1710268845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
        b=pxi+okCTO1EFUe5G5uUQnhHWt+mYsDRyc/vbNDJYYCcUoCaxYsqnSrHyxAPyJJbyvx
         rA35vtmQrzAubjFqRi/lKFTGOgjBO6HWlUoFq7D2bjglwefAlNQoFDuu/6/s3iZ1E9Yv
         Vfev6R0L0iMeq5poNf8YKc+VBBhfbkMiwGLz42cPx3d7ovllwywf8OpbiAWxyYihKSYm
         RTpxIdnmgo/iNwIjqOCG/9imvuaHocddJnHHHcejcgsgJ40B1Ic1IQ0eRRT3hDKb1saf
         ggQ2LbUkPQyDT2mYpTfw736i6yrZkEZobLiodres0RkrLkYrEsHn/aiaKapQNoL6Wkyk
         RjAg==
X-Forwarded-Encrypted: i=1; AJvYcCWEetXHrQYggx9eALSZBGb4Ptodls/xG5lfBdOhqR0v5ik3JQh1Fpr31NVrO+d0fj7c93kGqmXbufW0XEYZQEB3x2DWMEJX4dOP
X-Gm-Message-State: AOJu0YzwY1OoC8cL0BymDFtk6kuqRVCjx/ZMjAaYPqo96XlAD3dwxvvO
	D4mSyQjEpY7hSi4dOBXeuM2kXPqugfaFWgvaR3VTsF/x5koXalmO
X-Google-Smtp-Source: AGHT+IEEib95LASlxflZmOGoKOqjWt2O08nr6/dUyPF5bkMtYTcUru+1PyW5JqlUhb0RbpsxEBo7Nw==
X-Received: by 2002:a05:6a21:8cc5:b0:1a1:47cb:9709 with SMTP id ta5-20020a056a218cc500b001a147cb9709mr3127651pzb.44.1709664045282;
        Tue, 05 Mar 2024 10:40:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78ec5000000b006e50c083b90sm9219955pfr.212.2024.03.05.10.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 10:40:43 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 2/5] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Tue,  5 Mar 2024 10:40:30 -0800
Message-Id: <20240305184033.425294-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305184033.425294-1-linux@roeck-us.net>
References: <20240305184033.425294-1-linux@roeck-us.net>
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

