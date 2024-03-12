Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A1213AA3C
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263011; cv=none; b=e1CN7u3nAkfRVK/QLdfF0buPf9lOXy1fkHvfNEN0DCMO7blimThnW2Fx+MvbM10SVKEo2FWFetOB0Sdqvvgy04mTnNFz4cYWijWmpJXGHv1GXpaY4s0XDkugDG7m2ozbPqBph8ZUbs/AvZAXlInU3l1yWcVWjx9WFyXZQfHZ4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263011; c=relaxed/simple;
	bh=2NHIPSEeh5V+X5+GdK5eLhFVjFh0D1jEmjx7oDfzWbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SR2e4hAFVRoGFHZpA2W35FrRkzd/iu02nUwDFV2i39qnhG47qYv+iBOumC+VMVBP2xMhAr8bJTcz9qDF/9L8eP7Jx6uIPKlS62DKF8VdPFdnLp9bhi79d27yKUTGRSnG1DX/pCLR38XpEFOkWhtMn0FDfjutVpnOgk2GHfe9NWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdkTBFu6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdkTBFu6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29954bb87b4so2762881a91.2;
        Tue, 12 Mar 2024 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263009; x=1710867809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e/E6ddr2rv0O0qI6ESGYNVGq97JQ/YRs1mbYMxZhW0=;
        b=cdkTBFu6q2Ra4YA/jpWqyCbrYqrNQVjiB/Og2HkD8L7AnaNqFw3fMEhmJod06yhtIN
         C/+Lz0oKKDNBhVqzX1/b+O1SyMRR+N/wIFqFuxRgYn5cdk0K/m/r4QAiQ2BXHIKN7gVy
         trIssh39RtHKIJSLLw3q8KerH1MUGu6h4lHFUnf40yrnC4ZnfJaxYXyRo8AnMHR7GYkC
         kMZyxZpkWRsdk7YQ1NiyyFKsa8X1QJj9j6g6mYYybT5RqA57aeLOyVF0ahyWfoHJL2C1
         UxS77x8J9gwShMOW18FAI2mNSHLofn5KtNsZ/mIa2gBlaeCMZA76jHQy72JTmAFCSh3d
         0FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263009; x=1710867809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5e/E6ddr2rv0O0qI6ESGYNVGq97JQ/YRs1mbYMxZhW0=;
        b=AnmL8ToRW7mQlhuYyXYCfN1qWcxHaCtoH6kYvAVrTYfHXkk7gxmHuD4x/JQ77tQdQJ
         PiqaNg1XIA1rwd+Tc+0CitS3Om6bVQP7eahkUddrL4Cdh+RVuLjGwyj5YMbperuxgKmi
         iBlbpk+/SG5WKAveijUG8NR6zksgWYadfxE4GyHr8RhLAa0d/HqzAE/wJNDt2rLZ5+s8
         uinm33UQTJVSigYEfvVlWuXDR0R3UmcGisbH3IKaB3jCG+iSFT5Bd5uZY/pjNTQB5yx0
         z4bFwuUHmya4stIYPpZas3fWai9+rRcqJIaIG4XpMZdxFcgtvFfJF9cq0DCg6e68Vkyq
         9mIg==
X-Forwarded-Encrypted: i=1; AJvYcCX7LEQfbwBst+EmVGRjaCh7wZMoVjvwHk0KYuth4Cdsc6WsyiIHqtWcLfEY8Po0Tj7h02G81XyuiPM+TrtLv8wxIwGQbKJbHsXmR33siBu1h49Ri7GQDgUHtUm6/jymj5YQ
X-Gm-Message-State: AOJu0Yzjb63YJsyv7JiG7XQxibAyumDxzF1c1FmYmc35+hv4NkoTb5vO
	PZhfj4LoZ52C7rZH7qioQ3aCYSDiNDtiZYN4XWrcChpdW5nrHDcm
X-Google-Smtp-Source: AGHT+IHnpV6pQ4sbhTQFUz6ATEKXpUTcdarefNsnZ32RzB7TxwrdDKUDIv3vmdM+PJbrepqm0Atu1Q==
X-Received: by 2002:a17:90a:ba93:b0:29c:844:a91 with SMTP id t19-20020a17090aba9300b0029c08440a91mr5600961pjr.48.1710263008670;
        Tue, 12 Mar 2024 10:03:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bf20-20020a17090b0b1400b0029bc2b845c4sm5986405pjb.11.2024.03.12.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:28 -0700 (PDT)
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
Subject: [PATCH 07/14] x86: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:02 -0700
Message-Id: <20240312170309.2546362-8-linux@roeck-us.net>
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
 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3ec87d198ac..d87bf8bab238 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -23,18 +23,28 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
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

