Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D73913EFE1
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263025; cv=none; b=C4GBJErB52hf2C4J1S2Vy83Pweg45Kmw5eWKZN5LByt53KmfAkRAvxuQJWzEQjq+vsIB1WqUC9IPO+BC20FAnSqWftJHVSv+Fby8f1R91D4h0VjfKtFXC3uXnWDnJ6lyWNod+tkiKUyiyDMGOfBvclZO9BMbNi1vCiJ3OH8KuJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263025; c=relaxed/simple;
	bh=M3fGFgI9yuthQJkxiEtVWLMsbx99o2Y7sxqWKVQ8z74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t3Dqf8uYNIrSrJm7mXINsgjNenCouLl0uySXyWWV3Dy5aRw73oItlkVaE83tKU/5Eh6jGjF3qVpok+UhQzMhh2bHIGlj42DIhUSYOJdZZlt16ACHyhKcnaflM49Ms1hWyac4xs3+pfIa/aJVihrtS2a+hQeyIuSvMyiI4vpzBMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3CRLc4B; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3CRLc4B"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6adf257fdso574053b3a.0;
        Tue, 12 Mar 2024 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263023; x=1710867823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mb4FmIopiSO+/3QwXjaWJkazatuyJXVbnhhdOwFBf/s=;
        b=a3CRLc4BZWbGRSymhYRxqrDH1dLkI/RCd99mL6ktJD7e+4W+ez7uf+PUYt2hI+GgFj
         TRXVXzFihhWI7J6JjGazk2GAYEy0s9b2Kfd7Z4Xvwfa7KXuyYkvfvscw+GuTupGUxSvr
         F9Gqqy63+89hQT+QeLy7m52TOO01T6y01FRujnLpnqCOgnCpr/rTFY8mqK9LMrI4eO14
         9DllB08B9QPg+u1DngfpHWwFWdFDxCXFCT1v9mlhxCAtMyKF8fRXdTAFKydSx5rpknIe
         9bOKk9miUpGP0mec5n5Duxn0x49oUzSY+KwFWnOxMSxgpArjoPEKCCaauJVko/QYzjj6
         Zeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263024; x=1710867824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mb4FmIopiSO+/3QwXjaWJkazatuyJXVbnhhdOwFBf/s=;
        b=jKM2NAzWXq3gQBCtOCn4Ln7uOYD8nrnCEYWVsOR+dIfwa4gjLQahzd9o1vE8sCCmTL
         ah/kuMbY6GzbGmunsIJEZ+niaxJ3R7ZERJhJMKCJfX6eHcJLVFnFRXYg0Kz+vtQoMOOm
         Mw1QdpSQZhENRYVAqGJra5Xibs2+uzyUEIKt+ZbOvysqjimFQLlToxrxqZz1lyKMWgtu
         Dga3jistzmdAv9n4Uuo3oFlG3f+bOW1DR0MZ8KkLB4zSxVJkvoZL/Y0A7Y9RD02LbN+X
         uEQBHnMiHZK/exkxeXGvvIHY6ahwszjgOUaAIoe8M5KfxovqvsO9Yi3XYgpzxzVVyofU
         +k7A==
X-Forwarded-Encrypted: i=1; AJvYcCVv+tOpQcxku5SayyjJyinp/7ZyUNVSJ3sstGMmXXnmY8tlD/RFNGrsJHc5I0UoOzFeO/DCQxKvQALoA/xu5jDGLyQJE53Cgk3GyLmpErpmZ9w53oF21CHN/UiinElPoDQj
X-Gm-Message-State: AOJu0YzZB1s3eNffMjmsCBJEj46KAVynDEMb0kIXod0YARNHT23/wp+P
	DmcMBMEjUWsU5phQW7jFFuhGtOxwydKctDdkiI8bv5P8uieRgOHJ
X-Google-Smtp-Source: AGHT+IESK+W76sbv32507e8vr+AETbi9zHy7dM6LrGga9gr4qnmj+9kyX8nY1a/g+A7cAY64N5ru0w==
X-Received: by 2002:a17:902:edd0:b0:1dc:a8aa:3c86 with SMTP id q16-20020a170902edd000b001dca8aa3c86mr9530991plk.5.1710263023689;
        Tue, 12 Mar 2024 10:03:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001dca68b97d3sm6991774plw.44.2024.03.12.10.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:43 -0700 (PDT)
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
Subject: [PATCH 13/14] riscv: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:08 -0700
Message-Id: <20240312170309.2546362-14-linux@roeck-us.net>
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..8955ee5c1c27 100644
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
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%1)
+#else
+# define __BUG_FUNC_PTR
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
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

