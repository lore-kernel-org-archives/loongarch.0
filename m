Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D43F13AA24
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389196; cv=none; b=WXsd2mW9FtCrGU3p0NbpG0oYjqn8y/GhKety9F6tT+ePq9mB1+y7SS/2mVocqstDGBzkoy9OmMROumGTXr/oQ8evfEy22KV61AMzf4S5F8fnicHo/wrDvBqt4rHJgtOKpSyBODMZIFlkt36XfGJZR7s9TkUjejESf7zW+yJKgGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389196; c=relaxed/simple;
	bh=qdStSeM+VJCbqbzuADj4lChWMSBHWJ8X0eHOGVaPa9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m5KIgkrtb2+d5KPKl9v/imbOfWVbpou/NQSt2OzJ/nzT8a8+BgGit20rFJlVMe594rLaBF/LA6htISVi3vknT1u5L4CBZH0RltgOb2ido7iZxOUyrtu3RcQDIrddONh7gUwgLnluhBfKe5WASwBazKjI8+HmsQFwi+h2f4c+QVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEn5Qqgc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEn5Qqgc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e0189323b4so34638465ad.1
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389194; x=1711993994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YzJYq0fkceHof/EPazly4M40tZRXgMzxd6Hp1cFk9M=;
        b=BEn5QqgciA0QHkqX3isL25MkJKC0RCfkirzrYgzC9TW6hUwWg/B+t9syYB/KJ8Bp6u
         CnwlZ7VLTQjxBLDHs74j3WBA7DUkKUYOnGv053/p9cjaeMpWrPsdvqVSp+OLj3nbhIo7
         On0LJCqrxL9j8JJLD6nAivkn9xyF5U622p0Ge5WsIiCseMuvGMPyODGpOZlp/pOdsA8n
         CL5DiBDN853d/yQZPA82bJw9XQWE6G4nMZ/K8maSlALDS98o0uRl2BqyxsAK+hTVwvfk
         mlDmqptYj7XpRV0zSYs6hSNKfhAY/L/R+PKl4HhYtF7/qfcr2mj7tkWKHr21JxxbRZ10
         WBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389194; x=1711993994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YzJYq0fkceHof/EPazly4M40tZRXgMzxd6Hp1cFk9M=;
        b=KwnpjFmYj0dCUjQWDAmxDixwFUaU7M5Tv71rWK4RxWze7CxGfWiP2XMnR19anbb+Kn
         IgflkQwE4gMMazFnCEsn/7WWxm5y1LGgAg11yRIIbYjdNspySm9IIwgIZEtqjlXCGkJr
         K5fnsZTt3i1vRm1kFLkGu+lbB8a2FGTQJLMtjhLR/DgQO0tUAe8Iz+joNOSZghXuLIuo
         2YGfyHBEwkwplJwXgAAdVT7/GOEQNbS0blWZxjogHnYk39xgoOWpA/5uljxNIVZMeifR
         ZD/Fk3fP42n/T56FvsCEbwOFwwXbCDDUJQIP+PPARea6FfauTu3clU/z+ckJVspq3Vac
         fQIg==
X-Forwarded-Encrypted: i=1; AJvYcCUAYM2x0DE8iGZgw0/aM+aRogiftP/maUcNVsAO8doTCARb067qGcaNPjlxBHoood6/RncjGlFVGdlmfDblvYDIEEW1A4dxBfzn
X-Gm-Message-State: AOJu0YxRuNSDuNqdZynfwR42tO9iJL3xmdJyeA+zzHJTwVf+sgtNIBgy
	93sX/RoBYEMt1N1lwI3Yd1HjxVzyTXJkPn3ZuwKY+8OAwTzlueIl
X-Google-Smtp-Source: AGHT+IH4L5pCyOM7/NriCMnotw9B9wTRd/QlGQsY00iVlUfB3rIc/3hcXxQD6OWxPS5Q16CPFVorBg==
X-Received: by 2002:a17:902:b495:b0:1de:faa5:552 with SMTP id y21-20020a170902b49500b001defaa50552mr8062370plr.56.1711389194428;
        Mon, 25 Mar 2024 10:53:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902c10100b001db8a5ea0a3sm4986539pli.94.2024.03.25.10.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:14 -0700 (PDT)
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
Subject: [PATCH v2 12/14] sh: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:46 -0700
Message-Id: <20240325175248.1499046-13-linux@roeck-us.net>
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

