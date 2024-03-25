Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAFC12AAE6
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389187; cv=none; b=pz2yEtADRgtmw6Ija4XgkMfWbRNYcRwNgckPwu2eqjHc/iPFLcqZhNogTBYFAtw+RoaonwrKZE/+7RxSiqE6QxXnBdWO4AvbIr4Tbd0FxhoZTnPRinlfWOs2X9EzCOQKKNYn6IlJcALgaiBZuJCuhGJW1FYKkZgclmUiZz9ulu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389187; c=relaxed/simple;
	bh=8c3ps6bNPJo2RXqaRvl4Cf61H5GinAXtOitgA1RAlXs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PWz0VcV3pyAklXAi04YpOxSWRHh8UXpF0yoSDeTQIC64fp61UPTToSPMTXd4MkzPTrdBqmYFvzOFuQZ4X7K8bIEL1uJKnt2NlzXK/riqZFoL4u03i9HIH5r1yUOUiWPlTNFyLlIa7bHVmfztrG5vjDmaER85VGB+dg8RYLKbSGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA8ugXZZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA8ugXZZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e04ac200a6so32350565ad.1
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389185; x=1711993985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZNhbleKNla2Ie/ZEatm6EVk1jlCAGbsmm+zF41MFkk=;
        b=FA8ugXZZGwzyoNXLCuCF30S8i15P6NhlQ21hOVzavqWO8HQOfodiK7NEYd1JXYP7Af
         a9ovIbNBTi4z+fv4+OWOy0qyQJn7eW2u4/9kmoOdbkpxaOPvOqzw66wsFHCRJkMp7RkE
         fpkkCJRYh5BXq6AEiLeeHUmgXgxM5R3fFffWRK+fxGXzyhG8dD9lF6Yx72ecZRw9riwB
         wY8qbqfBYsT7yQ1ddJKxSILdnMP+yjLwyEA2hUMZHGYV+BzRYwavJfcv7l7zRpPybm0A
         cuS9XzwcuH9XPLIg8b6LdveM5xdEzmxO280PWQ0w+j5qIwSQ7ibBr3A3D9+QKGzilNgy
         7yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389185; x=1711993985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yZNhbleKNla2Ie/ZEatm6EVk1jlCAGbsmm+zF41MFkk=;
        b=Y9Q85sE3v/11lApyd7YRwF93gP5D1qKDe9h8iqYROi04HnphT+YnvBOmr+AH8iCmFr
         D5pYpR36Ftr2iuZEIYmy8BFL0FbBJgCrG/vZF6CEz+xHvRtBNjbQDed0BNavagsZKGCR
         B39xBTAvmANe5UK6hjsm3g8wu8FSRCVu+1ebnzq0TVOdPyuVW/ng1ryH7/LFCOzWm6q3
         +TCjia3ZaZBXrpyDVRViHCY4yxpfmQ1TchHhFv3IiRkMcLhtpD0CzMgtI22L2ajtUHsy
         I6W54+xuE9Nhmm/PQW7I/PJuyp70Jjr2h5ciiOgR3z4k1q3C/OCiNLqk12NY2Sa40fK+
         jc0A==
X-Forwarded-Encrypted: i=1; AJvYcCWFDIOAndp/svAtPts5KoancZaZgqMAWhBdyZrrOynQaq5wzaMnuz0e4MuB2vvDEJyxgvOxMNFLLPlO/fNPAjzS2bzVInBkeGnG
X-Gm-Message-State: AOJu0YzAQBFVXk+n72ZyIT7Lz7iCom8FOSHCirbUcrvzKgpfcBRLCqta
	Fmc1vCN3HjQg8oHjADWFGRcwRVzCvh+T/3nOmpUkMYL58Xb/Cnm+
X-Google-Smtp-Source: AGHT+IEKWGuzpihfez0cIj5Jcw9QuULSWV5Y1XxkrBzCrtkepZtfQa7QDls+G+yzQdtdIaLpfh3muA==
X-Received: by 2002:a17:902:e810:b0:1e0:960b:f395 with SMTP id u16-20020a170902e81000b001e0960bf395mr11373029plg.25.1711389185110;
        Mon, 25 Mar 2024 10:53:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001e0c568ae8fsm1586519plx.192.2024.03.25.10.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:04 -0700 (PDT)
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
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v2 06/14] net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
Date: Mon, 25 Mar 2024 10:52:40 -0700
Message-Id: <20240325175248.1499046-7-linux@roeck-us.net>
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

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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

