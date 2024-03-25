Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B0783A02
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389184; cv=none; b=c4Ee41XFw+/o91EddZgrTPsmtd08hyPdjswQhtGEcM7joAZrj6pf52yEVXqdiYB5rXQEw3NDlN1pfKWj/Xnb0iQaN5hf+TyNcDAE1GMhuLdMP+zenZh9l9TAGKPluV2MKJvLDbzwZnnF2QMfMK2d1JSWRxBxvWHolyeXvuBGYv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389184; c=relaxed/simple;
	bh=T+Ia0Pc3N4kwmjFvQN0LMacAar1RnknNeZiqXVkndLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ASUnGzX8DsoHN13gWaAMlG45AMkmWq+ZkxAzavD2Ar38pK8YmVGTReqAyzHsCeOQdQnJXulQEAZu39k8QsaOvEdRT8WEs+hwC/gotUDV31+yB2A/YHqpXzza8hh+/WYG8Y/rM+mmVNG6yTLX8PtcLu+iDxefLCAcp2sn10n2BEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBS0Gb6u; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBS0Gb6u"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so3977492b3a.1
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389182; x=1711993982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5DnhCN93QNiYO14tG2AocbiB+DMWlDa/rXDsAPUdjs=;
        b=BBS0Gb6u6apJynAbcpvA49TFr3lhZ+QikZrEcVeSNPX/E13zuMebnEyfl2dPHyYvfE
         /vdI5gtIRvlmheSBZLfbJUnwVpSYANVujVOni+3yleYkyWnUt96YNxPWEWaigYjCgkwt
         2deHnysX+d0rkGmbNG2KcDyVuuRfuy5xdwp1S/bafF5vzAqo1iscQUImhZ/8NNov0HIE
         Q7Ox0366ZBO2bElHMCvzf7aOix04gN+A040XriHDXNyPHP3pTBpMDVpOKo1YcO5bLq+K
         kOEa9x8GbTOGFhsflOT3nPxPToxRR9DOUGqeYrJDGkFZMWdyPz/mPX3Hnu0G0rok6oKR
         2mYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389182; x=1711993982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E5DnhCN93QNiYO14tG2AocbiB+DMWlDa/rXDsAPUdjs=;
        b=jSDvkCGUXkgvtF63g+NXVDi5D/JFkejHz5Ox/0ebJizRzG7vf7vfz7Z6KefYWQmNJW
         2R+iRPotkxcVavrqyaNhm6djA9Ot5V5V93jmxuoa4ROOPzsewAsMabytKw3AVg8DPqia
         JLz0YF1CkokvSPg/At0gS5ZCe9J8vNkfjpCtJtf5RdeBRPhfhEN5wkkARTbS8TujkgtF
         W5UzAWXp0tv9E6P2KWR5jYBgSnAby68c+XfmSiBdL7/XybzPkbVYzh3GeCLRzpC4D3FY
         7wb44764/4ZrQ7S7IgdLGuQnjybqZlT0GORKSYmwg33eavfshvh/osxoik7dT8LZi5vF
         fUPA==
X-Forwarded-Encrypted: i=1; AJvYcCUvtb6RGpxvu7YL2XG8jCl6u6vyZNXsBnFDReUFiMmAe1zgWFfBRW1By/AVfasizQZplXjOOWeUDTI2lWvU5VAwcN4Wc4qzXxHH
X-Gm-Message-State: AOJu0YwLfTFF0oxshHDPfJVYRWMmhDHbyuQIdWNa0/QR4uQFjcjNWKjV
	uVT1QI0L46cFi3VM+Z8ZqoomFWbzZGwAfSmzuQXt+bTLrEv5lzxi
X-Google-Smtp-Source: AGHT+IHUbFCxxsrPDRZqrZE3rVYi2h6yvmCQyCE4SU/FpvCJKM9Sju0fTz4yCOmRcDciiduCin1d7Q==
X-Received: by 2002:a05:6a00:9298:b0:6e8:b78a:29fb with SMTP id jw24-20020a056a00929800b006e8b78a29fbmr9626545pfb.2.1711389181672;
        Mon, 25 Mar 2024 10:53:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z24-20020a630a58000000b005e83b64021fsm5516536pgk.25.2024.03.25.10.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:01 -0700 (PDT)
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
Subject: [PATCH v2 04/14] kunit: Add documentation for warning backtrace suppression API
Date: Mon, 25 Mar 2024 10:52:38 -0700
Message-Id: <20240325175248.1499046-5-linux@roeck-us.net>
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

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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

