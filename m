Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32C0149C5D
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150395; cv=none; b=WvcozEvZDbDi7EPZS7G2L1WISuXhfKhS95pEYkhCCYib5bz4mLLjMHvMRRTeFwieUyrxgYDLRhug9hv/Az0d6HcC3j75mXMBc17CVnnez2gUQRV2ITTXFwneQBSZYQZZQOXfn5mqF1liazWjzNBQHkun2eZLogL625UTydZqiIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150395; c=relaxed/simple;
	bh=euFd9pdOgYqNo0qCqbH/AlBY7kEWMpZ/eka8k6xSTcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hWQw/LdXX2MKKjku7CazRwW79VwQ3X9KdZuKBs1K0rMgNDuF/scHB8Miq6mQhpR0RRxwDHogtweG4bd0U2RwR7O2m7GRKu3F2QxpFGrM42sHM3xQwe9kFlTg4G1j/brbbQc8J+MIks6+/fBvaids+kT4mMsShCsi0U1/zamDcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8QdtRq7; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8QdtRq7"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ecc9f0bdaaso1190512b3a.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150393; x=1712755193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvARuQ+3VmnrmzgmqFSmVu3cd4NVfa8l1fZDGFIcUBg=;
        b=E8QdtRq7SQ03DRdZ1KJksatlzDq39baaHZB0QcZMtlu9rfKytJ+kkEdr6Sobaz7hIg
         KPd4AxhqxE3c/5mD6pn/N2WaCCGpECm+UL2arlpA0zptb/9AZXjkfbMg9pMuJHUC8uyP
         HUzGUQwq3ijN0D22dG03b/JPTOkVcPfjx+XHUrfGOQtKZ46dqTrHE19/b8HKqZfX7oOI
         as01tn6WsQD6qHlnz8JYA4gEtmm1q1qixqNUJYT0ad3eNMZi/vsmUdNawYbOV6OqxLhs
         XhK3USfaI5NC9HgJnx/ldf6TdBPyFItySyYwOaxDO0GKPN8aPfeUM8cscegyyaAgZwdT
         PnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150393; x=1712755193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MvARuQ+3VmnrmzgmqFSmVu3cd4NVfa8l1fZDGFIcUBg=;
        b=d7BdD7y3dVFaX7SZUV3zgAUw2et5FyuS4Yt9CNLuoc6uWVTntk3xvQciRjRu5o/oPR
         KOsS4oqtH51Y/GiuHBN8NqT/GdMI+KkDeddu9ffvar83sCJrndLlgLdy+BpNxj4EcOFb
         pzotsuqrEx4gHwCCV2jykeQ7l0wMI+K/veq4UOoPw2QAZDC+7yJ6DnokRl9FEwX9UJmn
         hz88uHy1AygWYiFagZTvUXTrBcr1QWBoJ+d1W9aK9rEe/CH7CYjNdwEBUx1Thm3QbaOQ
         kq6sUGsVHTEfJD7hTS7KHTKXcBtwVPrMLDwqMS1llzHLIrkcqqX7cVnFa86NAJSga4bz
         K5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTQ0aCruYgRrJIQio9HPlkCC8aZ+2KPt/v2d8P9C1o5xeMOQSw87zuAH9vxJOXyDNM2+fVNrY9zceId16lAIYYiiBusZa8B2FI
X-Gm-Message-State: AOJu0Yz4i5LvoG4FbqFKKKKHAE6lG+6yIM7TZ28CvMrzSGu4oDDE+bvI
	TwgzU7jkat2wnVhfbTxLaMetwFLQgy7GsmLjtbGLS1T2pKGEz6Jj
X-Google-Smtp-Source: AGHT+IFzkfgfwanXAd82f8i8ef5Fjpgbc/yneRFMHGOwV59qDNS3Awm153uRnJZYSeIbwOl4zm4JYA==
X-Received: by 2002:a05:6a00:190b:b0:6ea:73d3:d3a with SMTP id y11-20020a056a00190b00b006ea73d30d3amr17312402pfi.22.1712150393007;
        Wed, 03 Apr 2024 06:19:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j3-20020a62b603000000b006e56bf07483sm11720837pff.77.2024.04.03.06.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:52 -0700 (PDT)
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
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
Date: Wed,  3 Apr 2024 06:19:27 -0700
Message-Id: <20240403131936.787234-7-linux@roeck-us.net>
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

dev_addr_lists_test generates lock warning noise at the end of tests
if lock debugging is enabled. There are two sets of warnings.

WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())

WARNING: kunit_try_catch/1336 still has locks held!

KUnit test cleanup is not guaranteed to run in the same thread as the test
itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
be called from different threads. This triggers the warnings.
Suppress the warnings because they are irrelevant for the test and just
confusing and distracting.

The first warning can be suppressed by using START_SUPPRESSED_WARNING()
and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
the second warning, it is necessary to set debug_locks_silent while the
rtnl lock is held.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
v3:
- Rebased to v6.9-rc2

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

