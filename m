Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688713C9D3
	for <loongarch@lists.linux.dev>; Tue, 12 Mar 2024 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263018; cv=none; b=H4eBEw84lUOLIN7Bds7NyYlpFrwPQaaUvp6o8Yd1Vt+ovsK5KGrwVkw+UGtW513upB1CbyM+8kRLdaO3hUlNb1TnG5c+ujVF/+Ij+GyP9t8zygET2kQYrf4hhsbiqyhrWyP/3qBmIVMhJMEYc5BYsBYV7SITyF6FBPAntWdjjcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263018; c=relaxed/simple;
	bh=f0M5fc11HYIWKzmWkt7Ao2+081OZJPK9Hnp8Pgby/bA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uvtKLJ28AsDY9KZ8DMcBrR2IiY4PK/2Y90sKLhlhR1OzJ2ia1ofnpCe5pjt3orAcDrzsiqQii7gAb1VUtHnzsvJrUz6PSANAGVy0jhy/lu+Dn4o5jwQq/W3MtWGMJpotEOQ28Pt3/UlKCtCOJaJAr61hMq+LAksH74ESGaeq1h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xb5O7HaN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xb5O7HaN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dc49b00bdbso34339925ad.3;
        Tue, 12 Mar 2024 10:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263016; x=1710867816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yPqiFdiMaUo8CT/x9a2ZlbShLK74ZzL6qnaxWOIrD0=;
        b=Xb5O7HaNvg+uRVNGpwxfXA803QW+XHz7K6y0LbJvTd8EGyGNk9qdse3Tg3Yxi5wUSb
         eGE6iiGYTJ5V+/vv0eZafaN4RmnIAloYIIZbvYnZS3SJaals+CJ9SjiqA0nlZgIh2HMo
         Jpr+sUqsIVNjJqnnz6OaHop3x2QpcmDqEjUer75I72FfkIrKw8i19gj/vvIL4HG5KlP7
         I9TjaRWEJsY4i4H0ls5CcA+bg55hFxbgYuk3+WTMJVigwCAJwEKlSL+Jbq8XaP7wLs/i
         8dBLMyTT1j8UZPj8kdf7ybf0EkktRyaPMfq1mHApCOveC3H5Hz8zCD/58DOneuecQUNx
         ye2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263016; x=1710867816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8yPqiFdiMaUo8CT/x9a2ZlbShLK74ZzL6qnaxWOIrD0=;
        b=uZqIV3KcUoRKoXHxxfmBJuQTExekYQHeFC/8aMHoEqXnBv/R3+i08Eh+SkxV3vqjA7
         5qYI2BjfbEyzLVKDMlvUCEGjEeUilIvGQbf2A+0uIKAcgVbw65MbythIfeiq4ADQFb7o
         dViXVGnb+uvcBoQRU4nM7AiiRWRwVB+Po3KYxs7IOwE/8C4M6M0Rpm9xztFPHG3ICYAS
         I3AmpjDP0ManaVeJggAayRMX6pj3DhJpbMNfl7GbXUYgvGx6iN73mevOnKZ/2Ny4gZxh
         LQVLxcQHjsrqVI6tv0UWjuG9UC0eLAq+pksvqCrbkITOE1pRcxeJVGBnRfzcP3QbqXd7
         qBhA==
X-Forwarded-Encrypted: i=1; AJvYcCWIewDWK/64EX3sL6yT/VSTA5Ckmv7r8umzLZPoBHHmqEFornOaBX9YZWG3i+dJoldHKVuYx+Ypn8UfIrFoaMBlg+YvQos9Cr1+uH1ZPUitlaMEHipm7LNaLln0Zfa5CWBM
X-Gm-Message-State: AOJu0YyRnoTgtHji0DoqRzVrqrE030J7/QfmmT+7wNMsWjOsVQfVX/9a
	lSoPXOBcyxz1k7oZhsg8uGSnnA6PpVwXy27I6sxhzghRUG7uEFEO
X-Google-Smtp-Source: AGHT+IFoEsNPPrMLHPvnKMDpnnejQqa8I+dYMyPxL8EBJ4sDwkePMFxEwmxbDBpOVTaOpj6jJj/c1w==
X-Received: by 2002:a17:903:2349:b0:1dd:afc9:a34f with SMTP id c9-20020a170903234900b001ddafc9a34fmr4471610plh.50.1710263016146;
        Tue, 12 Mar 2024 10:03:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902ed1500b001d9a42f6183sm6958877pld.45.2024.03.12.10.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:35 -0700 (PDT)
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
Subject: [PATCH 10/14] parisc: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:05 -0700
Message-Id: <20240312170309.2546362-11-linux@roeck-us.net>
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

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 833555f74ffa..792dacc2a653 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -23,8 +23,17 @@
 # define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
-
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
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

