Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF09213AA24
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389198; cv=none; b=DvyJh8ZG0BCFv352bF0xkE6+MLzz0kUKzZRU4CZYvcNwxD6xswEaeWXjwmAJ+SPQS9IO04cCKsb+nYPeIe6WxX9sc2eGrgD0DCyl7+tke2ciVROVoi+JoiH4wAo3yUZX/ZWbc6ONU6rjJiN7O3uJJ0Uguu9NIV7IUBSrJFvHmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389198; c=relaxed/simple;
	bh=PWRyYNNTVSqaNxpe+46ccu4X3lA/e2YWTxFxcO7yBeg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eUdWSFr5fYe5dFuTJs2XT2TPyzGzHhmuiO+ZSdd9avVGp1GAzno8wRkUgyDmnq4h6BGNtMr3pS65KmRpDluK7Ax1izUnzRw/yHQkyrT/djloTmEas0fCMZJIgtGGF59pOCHLaV/pkQz0MwnUPZnDevSuq6Rh2e3uGG/mLYl7p1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xlu3P7+v; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xlu3P7+v"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso3098326a12.0
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389196; x=1711993996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnI6eL/80gG1dr8sD2qxmm+TprLGleZjKTemL3in51c=;
        b=Xlu3P7+v8wYZ89AL35Gz1LgDlbDZ5ZHLKe0gMXLN4W3AbmNogkws9VPxzeDhl4ssL/
         8hs0TdNPYPIIsWjKtiLYP0J4AupNW+NCwD2apgbmA/97O31PjJDSBXTV2DiRDE4v7mcy
         lNxjldvymd9WbG69GEU5g9v5JsC8WYghzx5/GP7QkvN5GhXqiA9XXQonW/DiD5QwMO6P
         V4Zsn8HSuxfoUyCykCWSvLvwPezQgq/PDpIZGRAG9SKHQ6mnZJGfc4u66E6IvXN+Lx53
         uuyP5fhaYyuq0pQvpu8wDsf7QTTFlo8nnK74VK2k5/p9S036ldnvE7Bnj+N1uw2R4eWU
         wA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389196; x=1711993996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnI6eL/80gG1dr8sD2qxmm+TprLGleZjKTemL3in51c=;
        b=IY33oXVfufQHsMjh+RYiO637vO0iFjyKI5ssk8oA2f+zF1n+dCANrSd+V6Wbn1BDmu
         23bX35mIwmj7OpikpZf/6THv3TaAwK9Wqu2vRwgRjAHVyOmlFosEQQaGPGJXo1PpsXol
         cRKng27bVXmgDqw2Jf9GjsHB6s4544DQgQjJfQiSQe/hGNFrKqTHBhB7HmrlWl7H7Xj/
         15c6edM3x50WLNdoB05IDriXlVzsiQKmoXeKWvr3CPIaKOtIlohHUILAuEp03annYgg0
         u7M9E8P/fWmEtWMaEDiqjUMVLxzMKrmsIbAdGVL1hTLbyzC9xXG9GxjLNWC03aqzECDr
         nY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrG/EumbUiDMMRS38eTOv3YA69LuqzkPftkFwfRlDMuVJhJFFuxA1Sv8rtEuAftDJ9IdgCNXTshxlr27jO5oYtVBQDCQmetX28
X-Gm-Message-State: AOJu0YxEq3JS6lFiOaYtpfeymBySyx2fVN8g4gHOc0WyFbaXrD9yrk2o
	NxuD4HcS4u/bJ750cOrfIcezlArJDLjWPSeR8fjDEXjTV7O9p19h
X-Google-Smtp-Source: AGHT+IHmG43u1pjyB8NBsXBypuvw9vgspS+EVnSj7EhdYOTyM3AqirrFZJgzW3g0aAbgHMabNWrpgg==
X-Received: by 2002:a17:90a:ec8d:b0:2a0:718a:8e49 with SMTP id f13-20020a17090aec8d00b002a0718a8e49mr2291608pjy.39.1711389196182;
        Mon, 25 Mar 2024 10:53:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id px8-20020a17090b270800b002a0544b81d6sm4083933pjb.35.2024.03.25.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:15 -0700 (PDT)
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
Subject: [PATCH v2 13/14] riscv: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:47 -0700
Message-Id: <20240325175248.1499046-14-linux@roeck-us.net>
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

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..79f360af4ad8 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -30,26 +30,39 @@
 typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_REL(val)	RISCV_INT " " __stringify(val) " - ."
 #else
-#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_REL(val)	RISCV_PTR " " __stringify(val)
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%1)
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	__BUG_REL(%0) "\n\t"		\
+	__BUG_FUNC_PTR "\n\t"		\
+	RISCV_SHORT " %2\n\t"		\
+	RISCV_SHORT " %3"
 #else
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	RISCV_SHORT " %3"
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)					\
 do {								\
 	__asm__ __volatile__ (					\
@@ -58,10 +71,11 @@ do {								\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
 			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
+			".org 2b + %4\n\t"                      \
 			".popsection"				\
 		:						\
-		: "i" (__FILE__), "i" (__LINE__),		\
+		: "i" (__FILE__), "i" (__BUG_FUNC),		\
+		  "i" (__LINE__),				\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
-- 
2.39.2

