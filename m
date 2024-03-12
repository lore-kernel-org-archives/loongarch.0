Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D42113D30A
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263023; cv=none; b=G4GlNNDLn2PgUeJ1KJH9GqTYfe52TkiSlRd5ZCvVORxnuEqDFgXAMGi9eeZC40+HlYX5327aeqoKSYPwZBoV/QDH6thgW/jdwddl6mAVs5r8MT7FiOM0Y9J2Kj9wFR9ANBirHVMqZ1OlgzpsmgC/tubr8SUaQTOAk1zvqcYJfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263023; c=relaxed/simple;
	bh=jbZMWCS3DByK5SjjQJp5r57w18nrJ58+23RdL2gWKoc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m3JLULH/vLf/1LPXhjr08DdhLlHqQCQKbOPbsbF+vPCS3Nu/rOFNOnEMWU9BHa4q9aLYNIoq7Rzr9PXLZYi5co7pPbuJ71o/ram7yGD1xIwQtoPD6P4n2uJZXHdyz5QmOkIN4zhdvesaHos86x+vHCWaN1EOB5DB4lez7RTT0Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIu53xPw; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIu53xPw"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e62c65865cso4818352b3a.2;
        Tue, 12 Mar 2024 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263021; x=1710867821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXPfnReuSHXGXOVrQxZxvKsOYxRmb4ItarTkuVBwfPs=;
        b=VIu53xPwaJBuB1Pn86DJrixJDec7J2Eg7P4ZGwimCQl72gDfKnfGKAjUQZGv45c2Cg
         t+gaXGssPokvDuaW89HhL4MrX/ALY4IS2sqD5FLKJvH5n6EJcoQv7SIYMSxe8vScO6a2
         vD/a3l25AYzHvtX/FSBSu+p1+FgvrqpCXgJ4+J8yTFu1dXymi7AY9qVVXZrUxp+py41j
         j+l+5WjChbJBfWEXOGppjsKvbm9SlLVvIpG2KLREzf5s5tt36IY8nheSiqo4Ns1k1+Z9
         Kzf1uq/lHLklW/A+cz//8mgLfieb41VvkZlrt+BlRE+9pegQ72lYgfPFcTv318kgUQDz
         g6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263021; x=1710867821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXPfnReuSHXGXOVrQxZxvKsOYxRmb4ItarTkuVBwfPs=;
        b=lLEX4oHI7dqVrwJHvep4HMyFHcR1lSx2Q7oeb8qL5U+psz5HPoL3CtfKZxU7X3d18v
         HdAXaZ8U44KCE4PefUyckZya4fOuNV+sT2QP4dNlWd1nmiyRHPahqj7QcRjqZO/QHG6s
         BIoUjlm6lSGxx/dtHEIhvHV9P/MLC4C+wpHcxQXPWs7EQG4o2dT0NHUIwVsRvrV/0Eva
         Jdpxp+eWG4CzLcTUmZBB1ylCSnm3j2ioSdkuLVoZjlPPTsdpWnaDFzM8TEbmGquqqJ0a
         kbl0hCWxyTUztmeG0q9Iukzp3msRbrd8e8snnl5ZBi7BX0zx9xLiK5HZTbZiwAIu2ob5
         RrxA==
X-Forwarded-Encrypted: i=1; AJvYcCUTx7fK132px57DfV1jLPH17YT8g6t60bm34y2Ll4IFSnTqSLxXRJVZxxrXJzwhv0YqZKWhR5EpxQ6r/OEn0kOyTNkgoTkwi1I8tOmRnBzcGLsdSNUQzsksqT1gBYibJaS6
X-Gm-Message-State: AOJu0YyUCu2TDqYhpIIMvfekFMRIlwDf52O8Y/SjSgH5OJfb7L+GWVXM
	l4PelExtDX7SXcHWVMRx1iHOkjJgMpVqa4cT+bBPyHZik4J87e0W
X-Google-Smtp-Source: AGHT+IE4fVqqJ6hNP2W9YJrC0c7a73CCPEj82DwWsP9/bD/wztKwzROAlQDxzJc7BU6W2bM1RSgz/A==
X-Received: by 2002:a05:6a20:9f06:b0:1a2:ba3f:e530 with SMTP id mk6-20020a056a209f0600b001a2ba3fe530mr11544554pzb.50.1710263020818;
        Tue, 12 Mar 2024 10:03:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a000b8100b006e674ef94b2sm1453577pfj.159.2024.03.12.10.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:40 -0700 (PDT)
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
Subject: [PATCH 12/14] sh: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:07 -0700
Message-Id: <20240312170309.2546362-13-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..cadc335eb759 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
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

