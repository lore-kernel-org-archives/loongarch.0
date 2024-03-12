Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D35B13A27D
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263008; cv=none; b=sivETQ1T/C/Y5qjNOZ6+CJaEYCp/z5H86ExYVM+3O1bz8Q+nvvCnpO+yTUFZIASVgAWQqAw17GzKwvBY1WUPzY5Ij0IWJPTTANXMzn7pHScd9d56v+sBL1xtHsPrfE+JvG+a4xPTggKhyCAnER4OBHte54zE2FPi2tvmuCzQ0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263008; c=relaxed/simple;
	bh=knS+qppVrCuENhoPuTL59QYimH+PsuApCzIRiQQv0SM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WpNiEb/ShzTUCb4n6R+00qpO6GZzKHRW+w7dO9cx9nQZ9rrMZDkm9uSkQgv5MXuoXOaNexWLKSEB/wnLN7tvMWkXEWvLObBU276XFaPZsHRp0hGb6xnHKw4L41/hopmeY5G2Hvz7hykQM6QLBbxLXcGZBPUh7wvprTktgV/xiUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2k92hFK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2k92hFK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so276265ad.1;
        Tue, 12 Mar 2024 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263006; x=1710867806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=;
        b=d2k92hFKTD2tpwuDA8Q91UDnS7Kixhb/Rob56cwZuCufQQ+uRWTQK/xE+AzMdAJoqT
         gmwPkgl40sBmsAdFx6e/Hj1nUs5OdaqLQG4ddvu26afjWx2KopEXcj4mSGGxD0NM3w7b
         8J96xmvozN1/iZal9YO/l7qkuPrBqWULcIi9j7+fuG8hvhHeLDkU67BLqOxY2MPvZeVi
         S1AViTWTNpGv4Lmkk+Nfcs+jWpI2a3lwAJYgwWFcNO8e8kRU3KPcqgKJ9HDCJ4wX3h8w
         ZiMxpkkzu1FXZc9CJynt3fDaeM0bMCgq+rbmCnsMP9bga/vc7msD7w0UwIYIPjtYTT4o
         CezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263006; x=1710867806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=;
        b=MZlQICeJG4gSeZ58sOSuEHYjvtStJ4v6H21Ws6oVTa6KZ+HsXFs89Pq04e3n/NgW3p
         tOQO9PePc957oGbA4sBu6velh5HqGRKVMgPcEtgGxeXlHTUt34m+AWdQik9NnN/hvWIB
         4tdrJRh7FzvpCNAeD99c9GF626wssMgoiNnlHTrz052ipk08VJb8omFzKSiworQTtaSU
         +rzx877DIo5L1wqZtMIbagM+C9qehAmwRwGWe9RvvWtrJTN+eIjBJTff/agVDcVm/ljA
         mXtUmCSVYc0WNneu6rMOUlNQ2p5HpXxamQlyTseDTJBJZGVZL8SFJ6+fOfxtjGmO7Bgn
         vYtA==
X-Forwarded-Encrypted: i=1; AJvYcCVQdncuKpbLlwSie0y0sLg07qVgxkh6Xafki2GTI768dQPW5/Whp0M+4/z3fi3dEIlr+/khFOrOV5jNmC8/0fZ+HDYUuv5AVzgBvnEsM6H018qm29V/u6UVNf9UYACVauEu
X-Gm-Message-State: AOJu0YzoM1+VLmBgoE2YcxD9UgBBCMFIaSQftZWSrLdi9/9wqmwSCG1D
	uteBj3NwhTkiglVc85Yh+hu4G8yd99BvL5D91CjXGdIkZ2TQWjpc
X-Google-Smtp-Source: AGHT+IFHgAu4TIvnFI5COGYb5tswxOQ5AvbfbseYntF0tu2SzSXjMyu1g4BetZFgaKzrp5WqY1rOuQ==
X-Received: by 2002:a17:902:db10:b0:1dd:8ed0:59d0 with SMTP id m16-20020a170902db1000b001dd8ed059d0mr179469plx.17.1710263006272;
        Tue, 12 Mar 2024 10:03:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902ed1500b001d9a42f6183sm6958740pld.45.2024.03.12.10.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:25 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 06/14] net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
Date: Tue, 12 Mar 2024 10:03:01 -0700
Message-Id: <20240312170309.2546362-7-linux@roeck-us.net>
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

dev_addr_lists_test generates lock warning noise at the end of tests
if lock debugging is enabled. There are two sets of warnings.

WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())

WARNING: kunit_try_catch/1336 still has locks held!

KUnit test cleanup is not guaranteed to run in the same thread as the test
itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
be called from different threads. This triggers the warnings.
Suppress the warnings because they are irrelevant for the test and just
confusing.

The first warning can be suppressed by using START_SUPPRESSED_WARNING()
and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
the second warning, it is necessary to set debug_locks_silent while the
rtnl lock is held.

Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 net/core/dev_addr_lists_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/core/dev_addr_lists_test.c b/net/core/dev_addr_lists_test.c
index 4dbd0dc6aea2..b427dd1a3c93 100644
--- a/net/core/dev_addr_lists_test.c
+++ b/net/core/dev_addr_lists_test.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <kunit/test.h>
+#include <linux/debug_locks.h>
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
@@ -49,6 +50,7 @@ static int dev_addr_test_init(struct kunit *test)
 		KUNIT_FAIL(test, "Can't register netdev %d", err);
 	}
 
+	debug_locks_silent = 1;
 	rtnl_lock();
 	return 0;
 }
@@ -56,8 +58,12 @@ static int dev_addr_test_init(struct kunit *test)
 static void dev_addr_test_exit(struct kunit *test)
 {
 	struct net_device *netdev = test->priv;
+	DEFINE_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 
+	START_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 	rtnl_unlock();
+	END_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
+	debug_locks_silent = 0;
 	unregister_netdev(netdev);
 	free_netdev(netdev);
 }
-- 
2.39.2

