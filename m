Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9F26B2C0
	for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866307; cv=none; b=nn159IKR81UVViaLgzjQMmdTYfuPHPjN+/HTJJJu6n4+Mo9Vwwkm0QdyYZH6bv8vnyDahNkuJz9CrTsFg0GPpQgAQfQUzrRuEBwksiGVSHIRHA3+p2Tmwwc1vVkOOm15Br7bURm5U8KoEuqH75/ZPaMDr1Lcdx7PPsQjsVG7NQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866307; c=relaxed/simple;
	bh=LkqKUNYGs/ePGkjxR4/GakhMBC+dOQkDGsyg7Jru2eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=ZyIGvDwzHP9DbtiWg5g+e+vPgXGxpk9Q7OBnv9ps7n6HKrpI6hXZlIUCqFxRaTYn9f/+PU8OV4lH8R5jsALkkI8DXnp/yWu2xt2j6/9lMzdieNkVlqK0oei9isUUtj2LFoEL/sTNVn3YkFgebQxXl0Pbjt4YzM9ComTNWkOE24Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=On+/hDJK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="On+/hDJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
	b=On+/hDJKQP6nTAAv05+HLf9v0U0/QckbbMsYnI7i5AZi823gwQHZUXo4QK6zk8kcDoOWIK
	iv1xcj3R1ettysDtqjZ51aCezuUUvIt7VS+tNPQEYPNjbrpWrew+JVK2ld/jKHDnVApwGC
	I3Zeq18Y274TfVzf9XkzKId97WhY0wk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-GzHmCkpnOdKV2jgZA7OvuQ-1; Thu, 13 Mar 2025 07:44:59 -0400
X-MC-Unique: GzHmCkpnOdKV2jgZA7OvuQ-1
X-Mimecast-MFC-AGG-ID: GzHmCkpnOdKV2jgZA7OvuQ_1741866296
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-391459c0395so372372f8f.2
        for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 04:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866296; x=1742471096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
        b=Bxr7DWYXnNSml8Q6/46VA9zXvqgj51epLNqNyhtVSkaTmcOMVrZeALV9cop93ALB+N
         yZDyNatKmVA5Me6jW9uyrfW96Qbi/Ylu2q5FSOgkXxKEKf9482ZdRg+Q83CqTJyaTU++
         Vg7/7t2tn09oNumYakJMahtO6s0t1+zorIOqAPZ4VoP0ntmlWnzJ+y6MWmUd9zXORIxQ
         L5Ib7wWS/2NTeuT6LifTgh1A+OF9onfNwO4gdhNPl7c+o3Cj0/hd0X9BAdjxAfGCb65N
         n9DpeSCfaXq/CgnMo+77dE0KmPUn/NYIOkw8DMYGtMr3Xzw0I/Qdmu4WteX1JUzzn1qe
         rxkw==
X-Forwarded-Encrypted: i=1; AJvYcCX5yd5uMENV8T5pVpLc95RERuxBgiCAXbu5KN8eYTwxukEIdrJJuy7l5MBRDTSJwAgJkM2RNZXc85I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiM8kgaSBAw8uGyQR1Fk1rElHoVARanSgJNWdWo46UOVwj4hKj
	lYnCBgKQSdAENK9TalG1KcRmyrCe8O2z3ceD4Dzr630UpHfkd5Raut6Pc+SWZ203ckr8lB6RnZD
	GSGlHQAxIN6iPsM8Mj+S8tS7dIe8T8vzBlcjEA8kW+YiFsMeG1cmqH/2djw==
X-Gm-Gg: ASbGncukeKA9BUBK9jiEinzEXDGny9eS9h6s8rkTy+ucXDM2YAnIBzzxA9f6Wrg09Cw
	dtjtYlPydnFIrcvRLL8ZGBisMHraz63paqsase3gioz27/L8mhWx7AhVtG5OU2LCw327G6J5eX1
	KjfKo6soXSx95O5BM+n8+hst2llfc45qAQ5ZO7BcS38124uvMHGDlOjhxB4pM8guzImqGAFN0e6
	C0je1fLP/0z6lOjX4OPQ3mSp0muXn0Zx7iozbzwoz9nFmbuKhg2GSA6MtPLiSBrz8m0kNu+nvlW
	CljvLla0/duowW9oZZ09
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39132db703cmr17836113f8f.47.1741866296126;
        Thu, 13 Mar 2025 04:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyU2ePtAFWyqCZMakOsiK4/iIhrDziNVQawXJEAak4gPJli8tipIq38M0q9zksW0XKC08fAA==
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39132db703cmr17836093f8f.47.1741866295677;
        Thu, 13 Mar 2025 04:44:55 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:54 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
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
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
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
	x86@kernel.org,
	Simon Horman <horms@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 12/14] sh: Move defines needed for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:27 +0000
Message-Id: <20250313114329.284104-13-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rN7N6QBNnH-rlEfo0fVLueZpUBT3eqT9nyy_oi-ABM0_1741866296
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

Declaring the defines needed for suppressing warning inside
'#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.

.../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
	Prototype was for HAVE_BUG_FUNCTION() instead

Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
to make kerneldoc happy.

Reported-by: Simon Horman <horms@kernel.org>
Cc: Simon Horman <horms@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/sh/include/asm/bug.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 470ce6567d20..bf4947d51d69 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -11,6 +11,15 @@
 #define HAVE_ARCH_BUG
 #define HAVE_ARCH_WARN_ON
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* CONFIG_DEBUG_BUGVERBOSE */
+
 /**
  * _EMIT_BUG_ENTRY
  * %1 - __FILE__
@@ -25,13 +34,6 @@
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
-# define HAVE_BUG_FUNCTION
-# define __BUG_FUNC_PTR	"\t.long %O2\n"
-#else
-# define __BUG_FUNC_PTR
-#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
-
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-- 
2.34.1

