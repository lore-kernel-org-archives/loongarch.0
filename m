Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687F612DDA3
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389189; cv=none; b=KAUB58RdIT8Kqy+TWsYs0AarkMfBIS74ytZqXClislYUJISthvsXIs9Is48QoafMVcJrywbkh1vYLm1+vl7q0hU0D2wingIkqEOju04QrvfM37yvmoj+AbEcRB9t6Ebn5+9TwkL928Z6GZ4JneLgUw+ixvbfqW+EZIqeYeLG/Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389189; c=relaxed/simple;
	bh=ujryoIXyOtMv7CZgaU8c13DgnsRbrFmRRwvyIDKligc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjVN9FsK4tIvftWNJHcqumGXZOV0nFVAp55qoi9J+wNN6/uQIv5qwzSX8DZlBxVaJYoRDIs2eIo+CTs4ZV77O6l/FM8K7kL5Xp0a5z3MNDGlZpujb96cOe4JE5aX5YHfyexWZ/WQ4940ipCRt35KP3WPkTDWk/1Hi+JcZUGi82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQvKD0TO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQvKD0TO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-29e0a1fd9a7so3095781a91.2
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389187; x=1711993987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkFivhI5ysBM/6se13ha6YOC4kb+BKpi8rjyyPjulPM=;
        b=FQvKD0TO3hUyHKOUYVGLzmhBS+Poo/ddo12ynBtqHhIEOMD+Rd28MQRbz1BOfSEneL
         mnTdq2ykXxC5Ez+luuZ/xD813H1Hcw4HoFJUpzc8SfRMW2SnO6zQYJMCbE5U6FmWMy+B
         xcH0iy9C4omAEoIUaBN3U05sttSfgKVNey4fWpNcdvojbX68XQDjJCEycpGfgClcGcpQ
         QhUTrHOwaowJWMSP5PK6LyZpPXrNU5yQ8gcuM4H4C9FC9BGJs/4IspvGV2rZD+9FrxMM
         FFcFaCe6ZMh00/M22DrtYx7tw2FuOhyy6v4EjWA+oeyfqfAtdRb+uhmfnDK2NUQeUhB3
         GcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389187; x=1711993987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NkFivhI5ysBM/6se13ha6YOC4kb+BKpi8rjyyPjulPM=;
        b=UsCec3ObXnUBfA5jvi2WVkroP4pelOU/n7MQAuRqa4O1dn2+fm/ZHvYN9DFdzp5R7d
         ZH2tYDRi/ozYBcKU4o70qkA+xMqHscjpnooU6DxBcHd37msXrFr/djvchWzZYErOCUoQ
         AVircp9D5SXFxKSaNBakjNdgctPSi0uTnJwXQkfWtpz53vOzntxi3V9k4CSzXoedpJM1
         QmaIczOTC3HsZixf2E0mYCp7ExjH7j2Qm7xpkOrD08u2LlX6miOkryqadbAzqcU2yXRr
         oTZBGzeHu6EpWRaFvdxI2KOpUGCll1/mW5/wiqG0nRXo0d+rIlBH/gYJcvsYfOIN41en
         8P3A==
X-Forwarded-Encrypted: i=1; AJvYcCVNiUygdGTtPIo/S3oqvfB8YFa5pcVfW5chaerVXFNTRvifbBn2/5ZZgOF4hKTZkfL/AmvFj1jpzr7kVFZ1pf26dbPRd2t96NOn
X-Gm-Message-State: AOJu0Yx4Zck1QkTs3Ymv4MNJ7sIxf0Lz1OWj1dx3+deM4T1Vp6wV96Kp
	+Y1G7E7GMdDVL9IHnDMpdI07IDsyDfpBWbcje5eKP9Vr1e9Fx7bP
X-Google-Smtp-Source: AGHT+IGbs92c//BGiqmdUL4T55P2X9QmdN/SfOH2hxAjReRZ1Fd5UIZ7am79FuHHvN6tgafQ9jOuwg==
X-Received: by 2002:a17:90b:3005:b0:29d:fe93:52ac with SMTP id hg5-20020a17090b300500b0029dfe9352acmr5131747pjb.13.1711389186749;
        Mon, 25 Mar 2024 10:53:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090ae00200b0029c693a1e6dsm6784603pjy.17.2024.03.25.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:06 -0700 (PDT)
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
Subject: [PATCH v2 07/14] x86: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:41 -0700
Message-Id: <20240325175248.1499046-8-linux@roeck-us.net>
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

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3ec87d198ac..7698dfa74c98 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -23,18 +23,28 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
+		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
+		     "\t.word %c2"        "\t# bug_entry::line\n"	\
+		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
+		     "\t.org 2b+%c4\n"					\
 		     ".popsection\n"					\
 		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
+		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
@@ -80,7 +90,8 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);		\
+	if (!IS_SUPPRESSED_WARNING(__func__))			\
+		_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.39.2

