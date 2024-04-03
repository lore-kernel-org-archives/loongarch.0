Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5CD14AD28
	for <loongarch@lists.linux.dev>; Wed,  3 Apr 2024 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150403; cv=none; b=EEEptnIJNm9IF01S1KZ6FeH2FQKqwnJzLjZVeyVXLBczW+RHZdSSwQ0/OARoFks+OuDFyTYtIv6ZmDur8xh7OAoJ+dZTzwKEgbZMRYpl1/YEchFv2uds/eaOJRAolFY00ukeLU1+gFCkqQNI8EdAiX2VOXEEVk7Df4PQoFCDIww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150403; c=relaxed/simple;
	bh=sRCoD7CA4VHB2FMUeBuju4gSTZ7VzEchcpaWHda2dww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CwzBj2FpbZ6WauR6n1ZvTrvx3/fpYhJXRZXLGgHoPg43+pg3GZfDpA/7eTQ3ZrodFmSxVPqodLxIDCdKIlvlTYwqaKyzY8FmrbcW+Mfov86e0cS0/MTQdv10+R1/o6IGXSjiELkm7FHcOrYw32gOBVoUW+L0/9016M2e53gy/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCIVwaLO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCIVwaLO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e0ae065d24so53957985ad.1
        for <loongarch@lists.linux.dev>; Wed, 03 Apr 2024 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150401; x=1712755201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=;
        b=BCIVwaLO6f8FjhidsQMDloJZvIOuB1l4oExL/MrlWzVkP7R1+7v2gGsdhK7l5nLTOx
         LJkOzomhxJoHZbvef5IOMcDN6U5Nt7KgV/NbcsOMbXUnN2GUPZdSZ/69dNHApC1j4HRc
         NlLiA9sDnbBFEONAraln7vIwJH3xvBzTUUTSOkvw0+SPJibcv+v88alzC1k0v3qJabR7
         YbyHxEWHjz2Mk1yvmjvxX+dSgHNYhCFF8m7EsQCMmXPbXKoTA9E45DSOOrW1HJT0rKBM
         BlLxGFPA+6GHE4QVUsbRplR9+yRx3Uec8mSM51vruAMzoARDYaJq7+P0TXvjll6I3ySA
         okYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150401; x=1712755201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=;
        b=TIH6wTqUVwRcethCztb43ojK53f8pw7ntpAaWDvUTBqaEQjBiTUyAb5xSdWMbf31VK
         yJkL2bDeZafYhdGXXtyaQd8QOKrO6AKO1dQNR+c7lb9JC+/ZidkcIvfy27BIgt5227dN
         MSHXxwuaQOvJMIMKL1UtEUuA4p6yu1qKA0PyAlsgt+WCqKLCGQF0uzTEhPpdA3fosB3Z
         BNNGMFzbK4Qs3AdeDSqiRljGkSnLOLUtA7CEbKY0eiQP2kFVtk/S0n0tFCa9T8RLNn92
         WuqkSS36gmdCz9CgSlZsrihYr3ObSp+j9nTLD6qzoVAEKHxz8RgQ+OuO38tFJ2PNZyZG
         TmnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8s6CNo7rIM2EGVj8FSfpV7gpmZRquT9oc1KZm+jXqHw41vTUvA3O4R5U+WkIFrRlvCNYbAclVt+ZJ4hqfXpJzxG+6HehJZDSm
X-Gm-Message-State: AOJu0Yx/WxqLHEClKPtIexsC8VxzqGvog2Dpi3/VDPp1k7BzBnsNhoxt
	ZSnt4LGu0v+h46IImCxbU2z9ln29dTJake2HHXK7LA4SjZh990py
X-Google-Smtp-Source: AGHT+IEMqe589WW9yt5k/lfzrxxoDYVpXeSOxtyZyHF9LDTCjhOnJNt1j89G1vs1iICWdJ7uWy226Q==
X-Received: by 2002:a17:902:bb16:b0:1e0:b871:53f1 with SMTP id im22-20020a170902bb1600b001e0b87153f1mr12301982plb.31.1712150401114;
        Wed, 03 Apr 2024 06:20:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b001e2461c52c6sm9309915pla.149.2024.04.03.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:00 -0700 (PDT)
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
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH v3 11/15] s390: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:32 -0700
Message-Id: <20240403131936.787234-12-linux@roeck-us.net>
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
increase due to unused __func__ entries (this is necessary because
__func__ is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1 (simplified assembler changes after upstream commit
  3938490e78f4 ("s390/bug: remove entry size from __bug_table section")
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

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

