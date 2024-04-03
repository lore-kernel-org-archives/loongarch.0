Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616D14BF84
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150405; cv=none; b=IdIJ7dN2RW5AV1a7/3sV7sUM+LRfbNZRGU1APi/7wysdVdEoOwgbLoghXKffMp/LIpM6FnRBNv3omeNxmXNUiG0JflC6qCcIeEgo1HEMMv7XncjpWt3yA0FTN44l9Ad2VJXCYAvyZucpMt9Cu/8wUkxyHF6+ZByB5UHFBMgM5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150405; c=relaxed/simple;
	bh=ZgmrdIG6yAEONHV4JnGuj9TrKexMhxErWuY9DJdDsqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYORVKN9IuboWJ+EiWAdJEq9XjKNj4IQDdZyc2DZ/zBH0aVsitBo2d+5gHvKXgHgiu/zLAYAhxpOJfXRlTomM/HjRwUKxnOHgdwtQUKjNM+fzB32K8dCgrSxkWyiW7/FwgQvnB2vcvYwpylhLIeADnxThxi9N27hlz2iGX1X3kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbSYcwze; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbSYcwze"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so5980730b3a.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150403; x=1712755203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acDD7oYfD3QQ420QQJRR06Qs6MsGb4dTYH+kiSwK7vU=;
        b=XbSYcwzeAMhVJtEaY3cS7iq8g2i1gHVFqWO7vXAR4S1VLDWFAHzMcJVgSfQFuV7pO0
         oJBX4BiEwwCxgoablJRv9eRHpvApnwf6ZMBqrnaVHKedg0e8dEoyobQ4umXsE0LTYc+2
         PNcC9JbP0kj8cRe84jjBSU6VSBAIh5OVvJ43dfur3+kkdmuXC+CrUa7/4uq2Z0th1WpU
         8SUJzTqznwtdCIThqNw3cRJcgQ4ZiPTuYf8mvnEjfV8LcYkFL43MwNfaUHvRwrOPlhVX
         DG2VY8ki2BgODp5R7NS9LBbzpC3o9dHOCdPPZRdpWPr1O6WWY9SqlMd25znHZCDXDURp
         31FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150403; x=1712755203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=acDD7oYfD3QQ420QQJRR06Qs6MsGb4dTYH+kiSwK7vU=;
        b=MXelC8OBs9jujdm7Mm/bZw/nUJo8HC6dro1mUdCzNOU3GumcyA5Ge8/6B2FGp9iigc
         YEW67BWnh0cK74eJ2NuMSj8ch2wf1UtYrXkYQiTeOpvZ3A1tOwVAi0BzXzReY4LcHQTi
         tNZkwXO3tLJZAtdWCnQ0uibo2YuUYTcJw+e4tWUWEEWGsUEhWP1QS3IOjPHY+4i2R6Lk
         /6TrGR5/zlXY8Wvon6BJVmSJbGugGCLjh2UAeGTJ5rfB+7Fj1+4SIEegpaEoxt3CLyfZ
         A4UNeJXdpAW+5Xx6eEjge0WOF2K90IKOwphEHyqsWrPLy16gLh63n4Fk2P7zEYuQqFH2
         +OCA==
X-Forwarded-Encrypted: i=1; AJvYcCXhhGVo3MaRB8LW0HQ29onr/pXzD6JSqEUgGfNpEAPPQ8DAE2qkP2oxkaiqx7zs4YhWzE+vNRVz1lDFSiAwlllorXjn/axG1LmX
X-Gm-Message-State: AOJu0YwAXAZMi0y/VJmQrmb6iVzHN8riivFXBpkp6GYR+hPchJpziq6L
	ZQlaJdH/+fdqHxQKtzxUzLPdDrJTLUEFkgA7BwnkkHabEUdbTZ/o
X-Google-Smtp-Source: AGHT+IH8rm/3VYkllAG+Ph/J3KijfrTneW29i0jWUjHAEJZozpI7yZ7ux/mQaa8T08FdPB1wOfWR4w==
X-Received: by 2002:a05:6a00:21cf:b0:6ea:c9c3:94a5 with SMTP id t15-20020a056a0021cf00b006eac9c394a5mr19496685pfj.0.1712150402646;
        Wed, 03 Apr 2024 06:20:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u32-20020a634720000000b005e838955bc4sm11440044pga.58.2024.04.03.06.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:02 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v3 12/15] sh: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:33 -0700
Message-Id: <20240403131936.787234-13-linux@roeck-us.net>
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..470ce6567d20 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-	"\t.short %O2, %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	__BUG_FUNC_PTR				\
+	"\t.short %O3, %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b\n"			\
-	"\t.short %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	"\t.short %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG()						\
 do {							\
 	__asm__ __volatile__ (				\
@@ -47,6 +62,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__), "i" (0),		\
 		   "i" (sizeof(struct bug_entry)));	\
 	unreachable();					\
@@ -60,6 +76,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
@@ -85,6 +102,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_UNWINDER),		\
 		   "i" (sizeof(struct bug_entry)));	\
-- 
2.39.2

