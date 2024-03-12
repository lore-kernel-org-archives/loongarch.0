Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE862137937
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710262997; cv=none; b=DMxxUbjZiApmU4QA3ivK/cAGOV1eQPEf0E89kGM8cZE/xwdeq6MEVVggevG2JSPHgGCnd0rQAMXum5PqDYfCjZiJZIyMGOsn9F8iVcRojPvW3EufXO92GamxLwkkn59mhkjxuD4lHveNy9/6Blm6HJZK/UNiZataxuk0mo6kz38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710262997; c=relaxed/simple;
	bh=8n/02f2SOXoK5vgtrzv7GEjJRgXi58830FC1dkrTfl4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FaRBPMOZUXPgnXmXoRyGDWfQmcKcxEmFddnSLFvBQB3yecMVhHUTBj56K+jbxZM3FDMl0Yv7FEf1uLLbEl9C2YYkm4b3NL7jXSIsQ9h16RR6Te3FrV+ggz3V43lya2MHAaVysO17BsZ5f0/9/qRO57xHig83B7jmPeS6JQpT5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpHheO2z; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpHheO2z"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc75972f25so1228275ad.1;
        Tue, 12 Mar 2024 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710262995; x=1710867795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WLftE/7MjlMuOSj897HlMQUMVZbmkOmcm7ijw8JWvLk=;
        b=bpHheO2zx8EWcG7qM/xmaMyv8xZ4Fmvc23Lta+6Ylkm2X+/1fEkDUXJ68W6HKZyos7
         dcnyORUr9NK3CDZ5NlbhG/Sw377l4RBzMp8evIPqnZynfrX+cyQrrZj6uS95r/HWkKBA
         eKKRodX0lZGSWY0EWLiB38mVkS+NXbL7hHtq3X8N4uCGJkR2fECuCGE0uGKwoZ6u4fvI
         xt0gB6j5UVhnzI+xaEqms0uuSBG+X92cigmVGgw/A8Hrbyx0ODTglCR/pVyukexK9Das
         ZJfJpSebFVSrYeNHyRoxek5kk0qbvOIFhWYRsGDyE6c/d7QrX359dbG+g3lZBx/qVdFx
         xvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710262995; x=1710867795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLftE/7MjlMuOSj897HlMQUMVZbmkOmcm7ijw8JWvLk=;
        b=pLK+qj98EWvtjWGzDyhgZlBozX6jtJOZTPCy/9PWg8dsi3nCdrgcLVQI+eK3840zqo
         1Le9tc3Qyohk68BiXl3QjjYcfnymLZGAPBXcoVVhQkUZ/IWeAbDXG7DKhdmfE20H36Wm
         VYovBn9wQW+scrAKqyv8iFZZmMWS7con0xcG0ElP00UCiZ6wW7rghUCu2MVibAJWOsXI
         vLG2uK7l7+PPi6QAiKJt2KGcHAfczLYV1KzIaTgF029N/QwanDOB71NG6uMSerLB7dCb
         h+FprLsO16Ou6hty0465aawPHY9UqfolX8b/zpRBnCY8mvuBlVIM9Ow8wm1ZtopDWzyg
         REEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9/AQNQ5JTeRLbJlt3Pz4I0K6eQcvZMoQcaRKkBxGRGz3dkldJPkeIjmepmdVDpB/LHlG23187+uFy1cDb9DtpNQL8ZnMB9n5/XXbI/j4LWpJ1hgFtHLiqvS+I5MwgwWcI
X-Gm-Message-State: AOJu0Yzv8B/fYksZVDfCiSemEJ/rVs2qFPqgMzrd1l6ZGuOLx+WuP7cL
	CQsqVrsPUXgwWzTxu8Sx6wKJfCcTcf8IZor6VtGKb1c0d9mtjNsz
X-Google-Smtp-Source: AGHT+IGoSNJSdzshXUinY0deqrpWSsXfjdp27VpnRBXFH0xqKuZltMGKwFFXD7x5fWGnOCLrPfDYHw==
X-Received: by 2002:a17:902:7ec9:b0:1dd:b681:990e with SMTP id p9-20020a1709027ec900b001ddb681990emr2092458plb.36.1710262994820;
        Tue, 12 Mar 2024 10:03:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r20-20020a170902c61400b001dd02f4c8fcsm6942533plr.139.2024.03.12.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:13 -0700 (PDT)
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
Subject: [PATCH 00/14] Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:02:55 -0700
Message-Id: <20240312170309.2546362-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some unit tests intentionally trigger warning backtraces by passing bad
parameters to kernel API functions. Such unit tests typically check the
return value from such calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum. Architecture specific changes are kept at minimum by
retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
CONFIG_KUNIT are enabled.

The first patch of the series introduces the necessary infrastructure.
The second patch introduces support for counting suppressed backtraces.
This capability is used in patch three to implement unit tests.
Patch four documents the new API.
The next two patches add support for suppressing backtraces in drm_rect
and dev_addr_lists unit tests. These patches are intended to serve as
examples for the use of the functionality introduced with this series.
The remaining patches implement the necessary changes for all
architectures with GENERIC_BUG support.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
  size increases if CONFIG_KUNIT=n. There would be some benefits to
  adding those pointers all the time (reduced complexity, ability to
  display function names in BUG/WARNING messages). That change, if
  desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests
