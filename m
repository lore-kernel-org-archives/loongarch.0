Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D4139566
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263004; cv=none; b=jbtfpodQkzVqstj6TMWbVBeLzb94c4Tahjas1lXz2+Gi247+Rq7oY++4aM8A7WpGPNn5K+EwD8cTqonb0LmE0WFFtrsE4nOAkYaLIAxWwxznfcEZRMKZNFXFsvU69ZnNYtU7IkhS4PzzBZ4SkN9m1zN6MbsQ8tn7bVowibm2t04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263004; c=relaxed/simple;
	bh=yHteoDhfKPGcsj1rp+n2EnxWC6nzc7OGPJZKXcy8Y4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FbSZo5HHew0+QMAmc/vwjKIvTs5YN4z7rUM9pzxJROQ4K4UL3N86HHIvHlo1gEC2N8cpNc2+yR+UwBavHlQHFiFspJcvC4jEBLPO5jLdPsQ6SpBqdM5G1VDUQDTL+fPM1KZkrZlWUixRtJAwEQsoB7OzXNkJj7KkAyukE17Fshs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrOX3JD8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrOX3JD8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dca3951ad9so47285675ad.3;
        Tue, 12 Mar 2024 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263002; x=1710867802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36BrykVX1YEJvDrrNJGSTLQfgxZ1lgqGPC6PgqTTbEw=;
        b=LrOX3JD8mWWXAd6DDgCsRtDOLpe14/kyaEFsRjgUdirCkRm4URTtvpKTAkL8dOBqQJ
         cct2yrQfZ4P0fqsI5Zm6ywWnZrkXMwvYIAvFzWwvR0wil8jlzprxAX7r3m2CcJNY92tj
         IvWv7ZeIOFGZUCdzsTvIet10+e6Xy45afYrui90DVnz2sc63ITHYQXQTxkM6SZLDywKl
         j+A4PB4SO9jZ3ErtFXshaG/YLafB3XUsKk2nlwSF9NB3uf0bu42rJFRkmEGWt1Cr7MwW
         cdEU1qajT2YNBLGuc6qgNNAukiMsfLM/YEISs/UJqS5Ejjl2RgSNZjykLUXg85ElWKIk
         x++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263002; x=1710867802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=36BrykVX1YEJvDrrNJGSTLQfgxZ1lgqGPC6PgqTTbEw=;
        b=ShQmiWKbLooEX/ttVlQKAK+DstpEm6ApjMwAxxiScbJ1O9vdEhcWMuRNYmzKnsVfxl
         4auSBTpzLAnWowOP+jiwU/FP5UzhtERhh1HBLDcXIoDBVy/ZdwXuj712Kq0KItj2SmbQ
         bcFwWUbgNccmjsPUREQBImYmzMdL5GKM9icdkcIns7FdHX+R10tfgaKLw3Yw6CDx7J2M
         DWAUWe+OiHDAWCA14oKthxwd4MzExQ1xYcqwKZnkJqbeKLfzSUlWtMwmh3neRA2sNHvV
         3LEiAY/qG3JhGYpc1QHgMmaSmfBujvL7xD1WTKoauIAcjOM/aH1DLHToe9eYz1SYfpq9
         Bg+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVPvPwEPdyrQd2QQk0UBEtQu7NeSv8Yv2kk0Hkz1LkXuxer9jg6xezG9C0fM2ifpTDqIJ0thEJsAKUTs11U1eIZ6ybL2eTh75FtNWle7nv0t0b3Jnp/pvX5+SEPhBtWcRA
X-Gm-Message-State: AOJu0YzyJd7PR6I3AWHeYUWcHCHxNNm/nX1S0/9vu5g0QQOwbFwVn6ms
	NWKc+m7fYyQ8Lc2lU5Lb1iHJI89+2H2CkgyAZj25ldPZbmJE/92j
X-Google-Smtp-Source: AGHT+IHYAZUPDqsFw7GWyh1RSbVI2Qwrh9Mdl1wKcQdsH3Ao31Ql441CQm7bvVJxkQ6v+AiS/8LElw==
X-Received: by 2002:a17:902:b198:b0:1dc:d8de:5664 with SMTP id s24-20020a170902b19800b001dcd8de5664mr9227736plr.33.1710263002517;
        Tue, 12 Mar 2024 10:03:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902a3c100b001dbb6fef41fsm7095813plb.257.2024.03.12.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:21 -0700 (PDT)
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
Subject: [PATCH 04/14] kunit: Add documentation for warning backtrace suppression API
Date: Tue, 12 Mar 2024 10:02:59 -0700
Message-Id: <20240312170309.2546362-5-linux@roeck-us.net>
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

Document API functions for suppressing warning backtraces.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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

