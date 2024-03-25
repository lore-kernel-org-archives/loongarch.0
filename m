Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9274D13F434
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389200; cv=none; b=tCQ5gRxac746IYsU5B/h9Dx+iKDfCFCxinRYQ3kl4kEtPzoFi8NzBrlVHIGIgzbQwvfacykCFYg/A6qLEhPXBTxIZlBPGiNmKgcA3yQTnvnTdgDglaTIXuAhuP3/2rOnonYNDH8sDKdpKDIssrzBbDAVm5NLMoTmPdtbruE2bH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389200; c=relaxed/simple;
	bh=d44to29QxAZRss/vImP1cjs/5S7S45VoMwPRc5E6CzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eonAU2ogD2HF8aHVFSYNo6+SsGsZNNDpfKyaI4pAPEaR+Q9YrrUS2Fd7vnNNDkjLKXuSJHg1QtLRJuDEWJ4wHKlsiGP6bMF61NGZOQiLo6iuMAw4MN0FILtoN70WY6vx17r0Vwyv40tH+SHFqR29WZnJgXT7Q20hZm8G0AHpVvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1JqQrIv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1JqQrIv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e0d6356ce9so5074065ad.3
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389198; x=1711993998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1SpZkZqM4zlQDRKNVTJpf19d/YZRyK65cuIsSmn1gc=;
        b=k1JqQrIvnjAx9ZWymeCeJgiES1RY5GtpzLfZyKKjmfdaUPmKnTbUrwz+i9pVLnr7IH
         TqtxLG7wcvHihk+h13nUe6W9na4De5rkLBXGUv1ERnRIabLDxRdc4fjyvXOGAJBd+vqO
         G9nAoQttPp3b7XUqVY3rO09jdwdrua2CZ4Zqgyy0XpLZmR8cAm2i/jsyM7BK7fhUkMxS
         kv7SVL/t9fIZ3OMBIloJMVF7MwKjT59/T36/fukrji12z7Ofi5g9wEn6Arl3Se6cltA0
         p44/IWjt6WW2OkCB5WiajfPMLdSk8HceQplMaa13R7jOOdzsMy5gFLdz4aD24rRNo5e9
         B2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389198; x=1711993998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1SpZkZqM4zlQDRKNVTJpf19d/YZRyK65cuIsSmn1gc=;
        b=EvSq623zEr8wwt3/Yh9wOKCbrDwoFJEeiGTedNGes5evdN9ZbtAjyn3sfds8587hhf
         9nEHZa+wOTn45Vu87ApKiYa1ruJT0dQLNaMKkAHzoqkO8ez9kqdlWGoY0aZ5BpqWyyiF
         TeJ6CGmOuqi24Bmk9O/KajYUBho6/MPH1zyQRM3QIua6rKCeIdKxC60ZCk5sZaMxzrKS
         lO3/iUdhNI+fOaWzmVxzmFK5C4SOO4WEleUwgsonJZnxY9X6AGpaNpXodhcF1sYWVTqM
         jcBxGuEvtw4UZ1o3WgxKzbpoDKFiyKGyncbfCzSo6/b6GOVjRQkXxMgZfdVdyzHISgb1
         9RYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtnPNbyq2fYTr+Psmh/g4GC5TquoAc82Z4J5f9uASXUFoJF88X2KojSh1nOxNKSEgtH1Mehpsa8acdmsAVjNcEHWpTebm0+2bm
X-Gm-Message-State: AOJu0Yyh6iDXVYU0NvuLaL+oYkvnLOZXRz99oH4i7dd+8OEXx6ST33YI
	06jVa5mOxaPHzAH7ZW1QEoN3C/u8GmvciRxfbTEbWSiclzBdUQnj
X-Google-Smtp-Source: AGHT+IHTc79fOqkfgWwaBqDmxHsREbiE6llQARC+UmxA2cQTIolFyUfUQoa6sVIdjGwuI2KMb1NDoA==
X-Received: by 2002:a17:903:2301:b0:1e0:b5ef:91b with SMTP id d1-20020a170903230100b001e0b5ef091bmr4565322plh.50.1711389197737;
        Mon, 25 Mar 2024 10:53:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e00d9680cesm4933234plr.130.2024.03.25.10.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:17 -0700 (PDT)
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
Subject: [PATCH v2 14/14] powerpc: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:48 -0700
Message-Id: <20240325175248.1499046-15-linux@roeck-us.net>
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

 arch/powerpc/include/asm/bug.h | 37 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1db485aacbd9..5b06745d20aa 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -14,6 +14,9 @@
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
 	 .4byte 5002f - .
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+	 .4byte 0
+#endif
 	 .short \line, \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -32,30 +35,46 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLY__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
+/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3,%4 to be FILE, __func__, LINE, flags
+   and sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.4byte %1 - .\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
 	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
+	__BUG_FUNC_PTR				\
+	"	.short %2, %3\n"		\
+	".org 2b+%4\n"				\
 	".previous\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
+	"	.short %3\n"			\
+	".org 2b+%4\n"				\
 	".previous\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG_ENTRY(insn, flags, ...)			\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
-		: : "i" (__FILE__), "i" (__LINE__),	\
+		: : "i" (__FILE__), "i" (__BUG_FUNC),	\
+		  "i" (__LINE__),			\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
@@ -80,7 +99,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(PPC_TLNEI " %5, 0", 0, "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -90,7 +109,7 @@
 		if (__ret_warn_on)				\
 			__WARN();				\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+		BUG_ENTRY(PPC_TLNEI " %5, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
 			  "r" (__ret_warn_on));	\
 	}							\
-- 
2.39.2

