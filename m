Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CA3128379
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389185; cv=none; b=JA/62BbcL4JvfT7FSqlSkeRL7P9o8FJJ9MbdsH6cPXKTSgOmnlVVIm4oyFTtrzr6B0bN1zc0Htefy/HE3uCHFUBa8raYz5geQGWmu2fySP/zM5QvX9pMSIZ625cIcDHD64gBe9evINZtY4IWuhyAjJnxcqqTgnX0LsvJsfP7Hq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389185; c=relaxed/simple;
	bh=uf1EZIzeb5JONuf8FpS2iqxmJGsd3vztWjuaJxfsGis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fB4pgdltuE3BnSFC/UIbzxc+Bn2r4R5kBKVPEf0ivLwjCl/D19m8DMQIOxUGz9VcEgW+w/CbxAXESUhfbuN59locx3sSq/E5iXVBNhLs9fnYrliQwESZNLVr4ummTdW2LKUQCT8FvUR7IdRaYym0DZeGrsZRvQEsSmdTI9+c3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMiTJVCt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMiTJVCt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-29de2dd22d8so2400844a91.2
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389183; x=1711993983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSmEsP2HwUjZ+Kmad7RzlLHqlu7fphsCj8c3+UcbJqs=;
        b=CMiTJVCtynu35r5LkyRtKJ9KA7qLzcYNtcWcjv0UB/gBjbFqPCsyGHS2/c7jxi3JQb
         s7/mbAMU+Bpz+AdqQvEtXpBE6d7mxKCWYz9inilasWYwEkoQR4mAXeoCoS3DNme5iUXt
         f05Ic0XA8udAHVoadCArsupqv467PzLiM9snfJDbaDSaJ4t1UVy+Fq1okxG1+eS40oz1
         7qiLHkAWLUAfh9ObdL0BPt9Nw/wPJmuZ2F1jtuZcr4aYK3Qq0G4xv3PbFZU3Max1UXYB
         iple5pKpSg6av5y5P6Wzd1izyGI2MzcuwuhG1CjfbltTZitWKkdjkW+1Cn/TN7ommuet
         fwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389183; x=1711993983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSmEsP2HwUjZ+Kmad7RzlLHqlu7fphsCj8c3+UcbJqs=;
        b=wyz7vjSgc85zzlOSLUhlTYRRCGtAYZKMlPnnTjHOrDMLW2ohYlSDB21MV+4nlUK4am
         Pq07xyh93k+l0jjMNq7NF4rbYZ/KAUG46FcYcBZEs27Hf8cfcXa+HlYEtP1rtO8Uaruz
         sa86dUrNHEI9mNue51i2N00It0G2m+6yyWQ9av0bp5PXfH6tO4jojgxVB88cdfxfU6la
         O4YmHRQpk8vxc6AdQX/QLrjEkZO+CFnbylddJeNgTSIiDp4VkBFVzeidpC8HN+oCSHzr
         PRtOHOnfLZJzikcXytvdmvGcaqJxbEVLS6deniKV4vrs+VBnL+Nidr8kQM75O3Qml+BK
         D9/A==
X-Forwarded-Encrypted: i=1; AJvYcCVV6EGOFte0GiCK4b+eRP9g3THMY8kPGbMLEKk5nrM+s8cUI4RQsAuxNxpcdnnEPbjyEqMFFlWaXaDwSWs/fNsSBQq5GxGLEbb7
X-Gm-Message-State: AOJu0Yy6HUD2ulOcrWxX53diVqVg3Q6iOGlWJiVbPqK4OJvIVmM4n7zf
	Kqh6bTdFXy5vplOeKM0ejzyDnAythH5MK3zS4RZtI7onACwGMr0b
X-Google-Smtp-Source: AGHT+IEVej1vJgDHyMhirxlQLl4uccA8YOz8D7GQmS3E1f+SiDCdIFMWODSUkw2joL6x2b4cQW8ruw==
X-Received: by 2002:a17:90a:a88a:b0:2a0:486e:780a with SMTP id h10-20020a17090aa88a00b002a0486e780amr504319pjq.15.1711389183399;
        Mon, 25 Mar 2024 10:53:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r12-20020a17090ad40c00b0029c68206e2bsm6603983pju.0.2024.03.25.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:02 -0700 (PDT)
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
Subject: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Mon, 25 Mar 2024 10:52:39 -0700
Message-Id: <20240325175248.1499046-6-linux@roeck-us.net>
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

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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

