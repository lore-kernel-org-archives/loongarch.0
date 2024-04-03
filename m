Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A805514D297
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150408; cv=none; b=NCpbuAltOdtwgdRHVNztHwXg/Zy90ncW+Bgtis4IzOl9K4vXBFcKHn6obJ2mqI5hEjGwnfxwVgkfneukSeo4THBElPE/iaZ46tggQgIJbmjxYyiHR1U1S3n7D9VMdHaY4i6IuUtqT7Lq11XEkfhWx3W+Oq+1CuxF3uxrkz22cz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150408; c=relaxed/simple;
	bh=6CYnXopnOEFDbmnJvQptcozsBT0uZcC6Gw55E5+uo5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fAX01iy9f2HFFa0RUxq0MLRJgY6uj6cp5QwspxmKp5QPoTP0spFiRelL298nTT6VzPeHfBQ9l9o3ECH6ifkRLyZfI3HCy06pg2uu/gBCYTM3IEG+tvWkRAzPKko98BXNx7mnRvamXpbM93XdD73hUP5mZpExLiDxaT7TIVSpm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S73WP6iU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S73WP6iU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e296c7aa7cso4307145ad.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150406; x=1712755206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODnUVSnKJhDEm1BurB+AUz+TF6tuatLZNT+jGpCl49o=;
        b=S73WP6iUTdw1fUxApyJ11qJEtLh1XYg5UhMowX9jvaDTYac3FXnDnMMxOEnzsBux3x
         5B6RFZsVvRuWaRDJ7TynGz/xj8XxyNicnMIjTyAe/WLQOgDX9rANcqdXta555b8wmHA3
         gLz8ZAaTFwerWa1tEphihkuVg8KYzcnjYmB24kjPSpXY0+QbZfI/ej4AqpReMyEFkpQD
         VCpcQKsT0J7+fcUym3f1lj1C20WX5KyvgaOBqtaakrEBT271bx26SNrC7J364L7IzNIp
         DE1HkNQQdsTIkp+nND3k/xZVAtG4IzPoeUEUqRll86DEQ9fZHoRFVLesAPBQ+Kd980PX
         HJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150406; x=1712755206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODnUVSnKJhDEm1BurB+AUz+TF6tuatLZNT+jGpCl49o=;
        b=csz1lqgF5v4TKnhXG2YO8kOlnnV4mlhdlg5+E4uR7K5sWOKG2CEZwDWDd+OcUDs0Yv
         7dn31BPfd1O+StJ0OKQ2dQLKwcIeBD0z84v9gHXzroIFL4F/vU8F09ZEhvNvNJ/sF0i2
         mKNTPQQs1IINUgG9+3rD62QOP9s4M+7ASX1TBdwjMhcvtU0LH3p0Uk+2FO8Jf5m3wWmJ
         BGcviOvYmxuDmvBZzKvW070bR1mv4QP0YU9qmSYrWbA3rS9s+UDykOGeVn9bZOlnMRFX
         BeISLRyeFBucrMWJ/HAzfqQOzV5SoR/yg7/48x0bUslMAajXuvF88GALRHKq3dw5yLQG
         v+6g==
X-Forwarded-Encrypted: i=1; AJvYcCVu+W/96Hf+SxQJq59uv5TtE55n7KlZaRXyXfKcZpZtWowUIm7coSyRe2bdmkz/bdXKvxWgAldxqKZjyi9zMjDtcFhYMXS4XZwV
X-Gm-Message-State: AOJu0YxPUbOLoVTMv1rVie/URchZ94Q/hpwtdJwSVv28SUC0xDiGyETt
	RqN6AabP3+duTBTfzisEefDS1Wo4ism7O4SP++aYFdo47yITR3Z3
X-Google-Smtp-Source: AGHT+IFJ9xVFhcxKPjkQ9awCqlJIsW3wvRmyEJkLnkWMs/f98CPvZeN33nEjiQcGmSbiBbYrqVdc1g==
X-Received: by 2002:a17:902:ccc1:b0:1e2:3d61:e266 with SMTP id z1-20020a170902ccc100b001e23d61e266mr18724864ple.49.1712150405920;
        Wed, 03 Apr 2024 06:20:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b001db717d2dbbsm13207508plh.210.2024.04.03.06.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:05 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 14/15] riscv: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:35 -0700
Message-Id: <20240403131936.787234-15-linux@roeck-us.net>
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

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

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

