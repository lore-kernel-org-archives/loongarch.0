Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB5A13281B
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389193; cv=none; b=h6AOElw2MoV/ZsncGo6cXRAbaSKQ+5tFR3GyTEMcqDikahEtGYJy/cuco7XhWg70Q4a7fIK6B1UEtpKnErm2S3uHhmtusST2abf2/F0kh+WGnY4WW1KGVnjsUB4JMpsiZH3Lx1D2HY5fZDAnL6/eauhk7HpEXgco+BeaMXOl1h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389193; c=relaxed/simple;
	bh=YAKHougynNfwqGMi4/MjS3GlrbEhqsqnDH26+cm5nFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LapsUuRyhw5pXyjkwyh9CJRRcEw49yWXwnAvFMzw5A7m3vhIEPKANnuk9EY012WffNoSykk99eCMx4TtCG/vo5NMZNkQrwyCXktZCBwJ8kxLh/MdRfyxajvnzUXYYR2R7xESD5hha32afFTDmtykvrnmDXhU3z6Nu2VGBfwZg4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkSWJACd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkSWJACd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1de0f92e649so32341175ad.0
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389191; x=1711993991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtwUXE+IqNuorT54j0aaEA4aHeW6X4Zjm5IQoCcbGI8=;
        b=UkSWJACdpb/PJCbrp22KNpaA9mPe9fKn/SuWILpuDo1c12vaKUlV6jTpgAPzpB9pH3
         7SaJZFUm8qmc1jIKNqei/GF7TPI46ib2V1kAU0F+8xJzPHo1Af/PDCJmv0hdCQdbQ9j5
         37xv1we6OgT7y/IVOTeVZTAOQ0T/JE48mrtno0kzsuV+ct/iIvUE8bQQ83BdR9Zjux9H
         uHXghUqjhyv4VzZMgzlYTW8ohZpN45nDY3ib4vsgnip4ZT2IBF5hUmGEkboS4LBZ/uxj
         zXSLZJ9JsVOxvDpGbwxVsia//E7h6NMva2oQ4QxKgmMk0xRes1z1rtz1cRA+MyEBhTYU
         nq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389191; x=1711993991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtwUXE+IqNuorT54j0aaEA4aHeW6X4Zjm5IQoCcbGI8=;
        b=viS864D6Fb5xCh9xOZruu+fokVZQbyhq+TPZ5lNdjcWh9UXHPMoPHtUMQ1CASeRAW9
         wfoRE/2Ov7BuSge4MUK2j2zqHTk5IS6Ok6kl2o/nPuNYYJNvo47uTpgzBNBMeOq22hYo
         mOKZwOcZJWgifLmOSZ81FkkCb/e7YAPKzlZn8MTyb2NT56WRJMvrdxfYSEg1wONicJlo
         +u+0c0omagxDiplcs5W1qKFR0dTA+hGzH5qorN41Q9fn/LjQ3N82TNwFgNW5cipahZ3B
         4O4QaM4efKlslbN9IqTbfAuMcF8oT+UBarxIp9V+Kw0EYEmFM7ExyFgSKNL74RxjRYwO
         2/2g==
X-Forwarded-Encrypted: i=1; AJvYcCXpeSs2Yp0sGI+dV2+isqy58e5yAjMhPOxth8RpGK30Q50gnOwonSNtrRMe0N1jH5CCGHqcQr4VjWsMqVPceQFoS7Zy/oUI8Kia
X-Gm-Message-State: AOJu0YwmwY8ssytTrQ+Ztyc4wrmHGoH0euPa64cf8ceNH1DWoqHYYjZd
	ZIYasfhA8iQ0GGf3w1PXoHDl4Mtwo0ysZ6YP7k9YYVDSZmqUeteq
X-Google-Smtp-Source: AGHT+IFgb86jAL+eLx1VucoqIZk09YlvJLM+FeVnRGQ5UPNHQryATu5Oxjm2FFfuTD/AWoK6+BajtA==
X-Received: by 2002:a17:902:f548:b0:1e0:94a1:95c1 with SMTP id h8-20020a170902f54800b001e094a195c1mr530124plf.29.1711389191372;
        Mon, 25 Mar 2024 10:53:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902f68500b001dda64281a9sm4953716plg.85.2024.03.25.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:10 -0700 (PDT)
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
	Helge Deller <deller@gmx.de>
Subject: [PATCH v2 10/14] parisc: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:44 -0700
Message-Id: <20240325175248.1499046-11-linux@roeck-us.net>
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 833555f74ffa..b59c3f7380bf 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -23,8 +23,17 @@
 # define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
-
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define BUG()								\
 	do {								\
 		asm volatile("\n"					\
@@ -33,10 +42,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %c3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (0), "i" (sizeof(struct bug_entry)) );	\
 		unreachable();						\
 	} while(0)
@@ -58,10 +69,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
@@ -74,7 +87,7 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t.short %0\n"				\
-			     "\t.blockz %1-4-2\n"			\
+			     "\t.blockz %c1-(.-2b)\n"			\
 			     "\t.popsection"				\
 			     : : "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
-- 
2.39.2

