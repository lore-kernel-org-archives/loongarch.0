Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E19A70CC5
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389177; cv=none; b=HbVAQoh/DX47ekHFjj6yB9nJrU0ho5pQ3cXypF8GtjbiR1joowQPxedpKc5OfNmkTfO+uk2Jg+l3dI6eJUGnTVHg2fiYpwIHL7LG/czkBVoDqEl7lkyiNO/gYsJ8nQ1GJe7qdaKtWNllGIxZC4LeKZHkD45f+8LDbyphUKrkqQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389177; c=relaxed/simple;
	bh=VOccJ8b4F3FXwu0VomVq1foVe5FqXJomPjb+iB5b73s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sy+z8pkUuZlqPvMWyPOTBB8tRRrZgsYhXAsYP2naqKiZmNNdjqQe427CqBByOmX8uCUiBctRM9Bk+1r0v5fRsqf0R3MSUi8ZcB+m22LHfGZvaQ/agn0USAFrJaozJ6J59BEKZaF0lqJk3CytjvcZDYjj6xqWsntyCcp4qsSWN14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4SDEalF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4SDEalF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6b22af648so3701284b3a.0
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389175; x=1711993975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XNSADZIa55EnhS6o0yIL3ifpTu+GjUejKXDxEmLThHE=;
        b=X4SDEalFVXu/OTqa8o8H8Nd0+IPTUbNvdqsy1B1KJk3GYKVNf0gHKLSzGKRohvtbGd
         rG7b2vjNkzIO8/8YSrqAVGr9bzfa7yAyQrkPDjgDGch4HOtXYX0yAwySk32Z7hrY4K0f
         J9J6oSOunnVqfXtA9otCHHSWm+MXptyFxGyui1BUY7NGNQJsjzKg/mfHHPTMxPPmIwd+
         qD8fzIUcZoc7WZmpsNT/87Tp7XaxqKFL1S24EazGJw2wYKsxl3FoNCeL4quRxtCQpCgR
         /8wDghRJWJiOYBgYFuJFzpfz5GWOmMDFKic/C5aqqUYLZ3QbmH4FCo14wTz5z7X4wZyd
         jAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389175; x=1711993975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNSADZIa55EnhS6o0yIL3ifpTu+GjUejKXDxEmLThHE=;
        b=AxsOIHX9YlUiQt88rXUm1sPoT5ydLBFf/i/d72ccM55iKNa9BJpn2Zp+UXP0B+4tOE
         +x8kCKkkRTNQvU94H98G+W8wV2bc9sMqJ8qcFzBo/g1A/Ltv7V+Lo1eCXM7Fkx5nQ2Jt
         oGvHhjya9YjW8rT4yMWKjaC+KxL0Ju0CY4i8pESA1kAkz6s7HBQaLLgrb+xo3Z1SvQrs
         B5YrUIwH31eJNRykSvGLMRCDvuINWb3oTZJBO9NARc3D3GllLWFIPq9W9h/xZKu/1vPV
         /gOwHu9+Ytc6fMckEx81jWO7XKYr4GZFJ/he4GcYG+f7V6LkvCyf8940jC6+RDVcYq5N
         9+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWVVo8NE7fCLlC6mV7uy5aA/D+LMvVVJq9zUWgP7ouEWh3Ql2ccJHw6cOCiTnlFCH97Aw9Krt0r2T1KM9ey1dbjVlQheiFDbzSM
X-Gm-Message-State: AOJu0YxYWKgwr+XCypL76M49pPwseuh3iFjVLVCRztbuGdyXIWr7sbei
	m7nYFOPaGrociXcHoTzTiVdyMy5Hws9KcVsoI9LoApJ9ULU/QWm1
X-Google-Smtp-Source: AGHT+IGIDWtPHdUbX+7LWIxScptU3Z3k9sozN35URR01B7XvfxcUzrh1Z1HYjZAKi2mO+Me8ITFPPw==
X-Received: by 2002:a05:6a20:6a0e:b0:1a3:c4ba:a453 with SMTP id p14-20020a056a206a0e00b001a3c4baa453mr6509702pzk.7.1711389175417;
        Mon, 25 Mar 2024 10:52:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dr18-20020a056a020fd200b005cd835182c5sm5239787pgb.79.2024.03.25.10.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:52:53 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 00/14] Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:34 -0700
Message-Id: <20240325175248.1499046-1-linux@roeck-us.net>
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

With CONFIG_KUNIT enabled, image size increase with this series applied is
approximately 1%. The image size increase (and with it the functionality
introduced by this series) can be avoided by disabling
CONFIG_KUNIT_SUPPRESS_BACKTRACE.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
  to avoid image size increases if CONFIG_KUNIT is disabled. There would be
  some benefits to adding those pointers all the time (reduced complexity,
  ability to display function names in BUG/WARNING messages). That change,
  if desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

Changes since v1:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
  [I retained those tags since there have been no functional changes]
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
  default.
