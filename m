Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C014A628
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150401; cv=none; b=UHQy77rrVSd+ZYFG4RQ9p2HOkjJFJTMgrYsB9aovqEIm1jVUfRG7tMdLmMRdO6heRXys0c9IWLwcdtMtfxVOnu1BMhjHR8S4sHayOUC7JRB+Co/W3EPDcFgZlnJ9dl9lc429PmAwJuHvPSWs2G/BYh055bPtP38Nu5elJjtxYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150401; c=relaxed/simple;
	bh=mB5dRAwCZwGdxvivIII9kjFblTdf+kQMWEar8P8iGWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CtB351seJCzCn6exQrJAnEbLosmmRTqzqEVO/rUxiqnb4wdm8P1x3rt20BtKDLuDxYJQymFkWOeYLdwU4auyCoo6ENleDE759Lms94/EMcMn8+gORf/eenW9hoTG9W0lQ1WzVNTXtN352YIV+PLiq9HPv4YhsCsBk/2zF2kIVZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJOg2H13; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJOg2H13"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e0d8403257so49724295ad.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150399; x=1712755199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dfx4BAIsIiEeZYorwHVQiaeI+Aj0IBngtjLPvcVHyE=;
        b=cJOg2H13Itt8OfIMMqdA29qlCSVDUjaOLJ8P8y7kFoHn/70wMnajfnx1ice1JS+5XG
         vecmysrtcJCSz1cWjlk9StLrzr94ISKCuMINvfBHG152pUYA3PolTV18r07EIVZWKS92
         HWUkcTBagXyOlhUuazKdjr3f3Qru6/BXRXPgSfE6APMkIp0RhpmiUe1+aoKk84pS9eZC
         HJaouEkXnPHypZxlEiwrRbN9qV9cGNVZTauxNfDZBh8SVg2mRXXU8mBM8TmH2qchFnS5
         9DnHkFPFyaoY/+rfBRp5NdvOzyZHqiWg8roJoRW+VwMtWowD5pY0k4TjDLhvqRHZOUJo
         2H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150399; x=1712755199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dfx4BAIsIiEeZYorwHVQiaeI+Aj0IBngtjLPvcVHyE=;
        b=O3hfyfF82LIvopwsZ1IqPjXt/wE8oOiIpDx32ZzHUSVoszaORNK+BLhSTcGl/zaRpE
         lXUNmsLOnA4S1cENX7c4IoxeIcgjKY+dHhtI4ftgKhvhK3t/sC6UDYlR69hJEsPeHwNe
         hQXdAux/w/mwDiWHgPEgq7Y43Pv6o2WFG5cGChylPuL6fSxVzdtmerH1I0CDikVAOVka
         4CFIYqvUYYQRkmgY80Qv03AbaXKhrlfb/9BSLoH2kZQfoy1gMHztlqm3/HiHveJOUFuM
         xdDicuIPl/n2Ie24/YHnWAJTKhbAOM9lbzgUWrgcb+eOzoiYpooy5ioODMkx7f9WCVc4
         kfkw==
X-Forwarded-Encrypted: i=1; AJvYcCUKUbvVhVu8Z6MdRpCJH8xdkkvNp8rds3S0MesWiw5pmY+XU9/P9OtEwOlczWduZpH+O5nYfCNFoAQ9zvWz64HT+HBXgs+BROSy
X-Gm-Message-State: AOJu0Yy9sTgEynUeMH+INioegHytXOTSexUypRT3rodPofSbuA/r5XPw
	mi2BHcx4J+9t4d6oro2iT+c9u4J2iUvBD9ZiqA3/fnzIQvAziB9d
X-Google-Smtp-Source: AGHT+IGbWkjRTcooZ5OE5cFx+wdKtwDNdTLrjwriJaWh51uLS/GGpEV8fzA7vGhwR64nNp+19Aq+wg==
X-Received: by 2002:a17:902:d4c4:b0:1e2:a0cf:c3dd with SMTP id o4-20020a170902d4c400b001e2a0cfc3ddmr376556plg.7.1712150399532;
        Wed, 03 Apr 2024 06:19:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l11-20020a170903120b00b001dddaa7d046sm13268622plh.29.2024.04.03.06.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:58 -0700 (PDT)
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
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 10/15] parisc: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:31 -0700
Message-Id: <20240403131936.787234-11-linux@roeck-us.net>
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

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

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

