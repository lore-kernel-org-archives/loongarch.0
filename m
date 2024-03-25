Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454A136E20
	for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389195; cv=none; b=iUQruGvBBTUpj3ibajECVOeFid6fLMXI9kfGnnqBrLlOTLhnxU+d30EbEdGl6LBGwah0v7H5pik+3+dn47Dti090pZaBaM7K8tsRu9Y6x3CWl0QHmg+3n48hVkEjsAW8dmFIhi5//1n2uIorXEuXIOIzrjy/iZkdO2V7mmUyqSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389195; c=relaxed/simple;
	bh=A5b2LvLAMqDa3tfzhsOvBq7xlErnTWSCJfRbwCKdC64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FS/GJIj3jZv01VzoMPjN/aTG/NEjh1aZA5FYz5xhnSLLRQ0OlvgUNOaNua18XlQCMUdu29AW9vL6J4l+iQ/S/IAMhw7dCzohgamM8ou6Rdy9xugKfL+T16sTwWawseeB82+HRnRz27LuMIjHdBf6+1aCwTMKgPrqAZNMDudGHls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq9ARuGK; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq9ARuGK"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5a4a2d99598so2065083eaf.2
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389193; x=1711993993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND8lqpveiFX6xmjgwVdwzXmzEkzcSSVNG8THPWMqf7Y=;
        b=cq9ARuGK/rAM+mTMNxx5q485LorN+KlXJlG10PZ3DQGRMZEJwGhVo9yOqb9uV6XlGZ
         p6en4h9iQZU4DE6rFhYmdE1jJeI9uGz7nF662ZXyb+cXLcu432Cl0OoN4jDgE4p4S2B0
         dW14FgJy57Y8ONp0LpCaMgvuOki7UkL/MmUYLVYfhWcBHWwnWNNT2uBgj8SRl1kNFjm2
         vHSXoADL5oTb+/8PoKA2wZr6jbAHILYhfrr3rTg7xeHEhSpTmhI7lgINhti033wBAxs7
         WmJD+l3avsMFDACkeQWSQAezt7YGVx0iZSrfqxmLP/NFDz17TjqguRNuO2EnSswf+3hq
         OfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389193; x=1711993993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ND8lqpveiFX6xmjgwVdwzXmzEkzcSSVNG8THPWMqf7Y=;
        b=llPbqw8ONti5BqurwIi6c3Jhu19vUh+wU/bLC0sECSdls9bwTBcyznfkkYbWKituTe
         ynvtEu2D6eCmCr69WCLrapGTZzHM5UgysdusnPrF78eABj/tQ8TZqxRIZY4BHsT467Zf
         K4/YgC1dRfUkUFV232mZnWOaqoa5JE695uXTriZ6dv6hM8VYurXSwyicfFuB8PLOdK8q
         K9E0V68oNusr6I79sUTm7xWEWEhFQfWETZ1zfenPPtnT6kfn8KD9h0ugVTsvbj8oqkXH
         OusvZHs2CcsjlEsgFiokTuGW6S0ffyeaK2M0z77wbdLRZUBaR943xvuInMDMgXT+wUbx
         Q2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqRQcFi2tuGV28O+ozcYFr4Irb3sWzQZkE4Yp6Gu1F3Q5/D8Rt1clpm4U0xa0HlJFBeYr9pLueyRJHNl27ViwXyCd0u7XpjtjA
X-Gm-Message-State: AOJu0YzoI2Ca5QmcUzQ4e8BCSK9np/JJ/kRANmFSKpBvBAflptUSLuNZ
	gtWhqdB6Niu6t4PdOWDwJ33xhbaLPi0TyF47QihiXo17G4Zkk1HX
X-Google-Smtp-Source: AGHT+IGv1aIgA06o9Fu8TIRgx/HOB3QdMC5g6WhXly0xhlmCYycmN3i4bcD6kTp8Utc1wDwGC1lc7A==
X-Received: by 2002:a05:6358:fac6:b0:17f:729a:8562 with SMTP id ts6-20020a056358fac600b0017f729a8562mr2827009rwb.3.1711389192937;
        Mon, 25 Mar 2024 10:53:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w189-20020a6362c6000000b005e438ea2a5asm6051492pgb.53.2024.03.25.10.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:12 -0700 (PDT)
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
Subject: [PATCH v2 11/14] s390: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:45 -0700
Message-Id: <20240325175248.1499046-12-linux@roeck-us.net>
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
increase due to unused __func__ entries (this is necessary because
__func__ is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1 (simplified assembler changes after upstream commit
  3938490e78f4 ("s390/bug: remove entry size from __bug_table section")
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/s390/include/asm/bug.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index c500d45fb465..44d4e9f24ae0 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,6 +8,15 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
@@ -17,10 +26,12 @@
 		".section __bug_table,\"aw\"\n"			\
 		"2:	.long	0b-.\n"				\
 		"	.long	1b-.\n"				\
-		"	.short	%0,%1\n"			\
-		"	.org	2b+%2\n"			\
+		__BUG_FUNC_PTR					\
+		"	.short	%1,%2\n"			\
+		"	.org	2b+%3\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (__BUG_FUNC),				\
+		    "i" (__LINE__),				\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.39.2

