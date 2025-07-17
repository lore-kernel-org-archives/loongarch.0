Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A642F85F1
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762474; cv=none; b=PgzTql+K7/4+WO+vA0FA7PRZQXaHECSsR5GGxQpkFbYZWIdbLfyfgHCagA5tCd30q76xWQgum6S4iU+Q+KeywWTPAYEqHyMeavKPy0VpTdtsItg8g42w1W3jhk7JHI2NCTn/glmzNLdYg3y83nSuRRsCBdoukA27yiOJY5mdx+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762474; c=relaxed/simple;
	bh=ESmhSIrQQTFnMHkO8fddR2vJBJBoLh1uTvlGgl5i9Zw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tM7eZzA4pCysybphqYh9mUjLwufaSwKW3Qwqs/8zoIX5UCV2W9LdB4BtOQHuY/cMLhawPbehjU4wyMhPChHfRFgdoDeW5yPnovkmV+bwa26CrhZ8eDnfB0LW3j0cWfr+XhLoorcD3UxLRrUUm8LpZCUC4YAxk85hwHg6HhVquNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnhnF0zO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnhnF0zO"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b584ac96so1113373e87.1
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762471; x=1753367271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U6pXPOm17QNJUh3dL0X5SvDfkuBM+kFPXcpz1Z7hWM=;
        b=NnhnF0zOa6+IYPy/QVS5jtRtuP6B4w/Af+P6siNs5IZvy/SWxIolCPDJ5hcy9qM0Uz
         eLjGezu4HE2MmI2JOukoSIjJUlLiR5aH8LR/jcy6ISXbzcBjFMvoLtq5t/d3m8Qw6evA
         45qGVIdrIgQHxClfu02z22BvF83lEhGVg9UkJqOTJi0Cs4BuQNuE2saj6fTlsMxgBHhO
         sshX796ousgEvoTCIWEcllzCTCRH/mP90ql1w/a/JAKfzeOs0G2Xj/pbmMvd354DUfPf
         H9XiTartD1Foq165E1hyz45sAxBCCyZt2nDfSJy/qtorRM7Y8iDDC9RNLTyuNJN9bZAr
         RFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762471; x=1753367271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U6pXPOm17QNJUh3dL0X5SvDfkuBM+kFPXcpz1Z7hWM=;
        b=wi8JpZ/FANBhDnkL7/oLJhu+pyimpoXLjdn6vBb66jzNAnYHb7F1mV3sJsCxWryNsS
         tUh021vR0fcDBzR6kItfUwEgYSeCzUrvybsUKn/T3o72KK0tLlCa35H9anHLy57KsetT
         FE4icZXHLsoLjCLpnC6oopSvL9o4H21iujHY3W6Ib7xJg7xMWg3b0HI9nWXf7DGDHI9x
         b1XONJtWTC2urB/i1O7/pipUnvelv39SbAXP467CFA7U2Vf6K9K7HB2LngA9ZLDvPNzP
         KfN8YNnzgsVJt+tlqHUvFya48ESkRibw79YhOBmQ0OHazO0gFfXa8JdAv6YlsaF1EzPd
         0MGw==
X-Forwarded-Encrypted: i=1; AJvYcCWcMOdvczzHwMuGDQ8zQV5BH2XLt2G3/IUeJneOJ0CNPmgM5vuUFwYTvNXy+94Y7O1OATY7SGZW62Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YziPsvlUSV0F2Z5E1Ge/KNIGln45v4+6nQ5RuOgTjOkEtnxrrpi
	BPjPj1ixEKYY8KFlY118o/Um38+IBbZqZZPWxCY4w8ancrGcQnX4GUQ2
X-Gm-Gg: ASbGncvEKmLHy1ybJ0/u4JkABNI8KoX37csFozj517mS0V8Hs7x9PMOf9HnT+7vUKLr
	XhbygI0gIkYDa2iYOlGOoatv4yif5yZ1CWQNIxVMuc/G3JJzkTKTO2RAIMZLYWOk3hcXDN9HtXC
	PUCEzV6lYY0GKnnOisXo66L/4+7lCIfb6wvYJHGLbUYcjJtkxkzqrUjn7DTDjb7L3Vcy/65T8wv
	qQb1wu6BQyupzPT+etTj77si5H4aKbmFMFIiFMpNwXCqNCJQ/KsI8WllfyJYqYIcWX6vG7RBuww
	cGpQJkHWu0KGBsVRrV1sChEx5vrBOUoZrARMMhU/xBOOxWJmQ7JdI7MH3ZiYZNH0o7cSQQbumE3
	t7WkMQQ8NQcod6IZQ5m1TiuXSA/zD/ZjKlJVFFoswvEKnJ5Q+P/6swFpGo9ckKWAPEAQ2
X-Google-Smtp-Source: AGHT+IFxg66CFuCFZcq7YEHf2jsYRpZfJ3opYk2GjZt6qN26RYtZXaN505yqdxOnxSgHLvlINQObtg==
X-Received: by 2002:a05:6512:78a:b0:553:2868:635c with SMTP id 2adb3069b0e04-55a233db5f5mr1804298e87.48.1752762470559;
        Thu, 17 Jul 2025 07:27:50 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:49 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v3 03/12] kasan/powerpc: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Thu, 17 Jul 2025 19:27:23 +0500
Message-Id: <20250717142732.292822-4-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PowerPC with radix MMU is the primary architecture that needs deferred
KASAN initialization, as it requires complex shadow memory setup before
KASAN can be safely enabled.

Select ARCH_DEFER_KASAN for PPC_RADIX_MMU to enable the static key
mechanism for runtime KASAN control. Other PowerPC configurations
(like book3e and 32-bit) can enable KASAN early and will use
compile-time constants instead.

Also call kasan_init_generic() which handles Generic KASAN initialization.
For PowerPC radix MMU (which selects ARCH_DEFER_KASAN), this enables
the static key. For other PowerPC variants, kasan_enable() is a no-op
and kasan_enabled() returns IS_ENABLED(CONFIG_KASAN).

Remove the PowerPC-specific static key and kasan_arch_is_ready()
implementation in favor of the unified interface.

This ensures that:
- PowerPC radix gets the runtime control it needs
- Other PowerPC variants get optimal compile-time behavior
- No unnecessary overhead is added where not needed

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Fixes: 55d77bae7342 ("kasan: fix Oops due to missing calls to kasan_arch_is_ready()")
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Added CONFIG_ARCH_DEFER_KASAN selection for PPC_RADIX_MMU only
- Kept ARCH_DISABLE_KASAN_INLINE selection since it's needed independently
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 ------------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 5 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3e0cc83f12..e5a6aae6a77 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -123,6 +123,7 @@ config PPC
 	#
 	select ARCH_32BIT_OFF_T if PPC32
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
+	select ARCH_DEFER_KASAN			if PPC_RADIX_MMU
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index b5bbb94c51f..957a57c1db5 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -53,18 +53,6 @@
 #endif
 
 #ifdef CONFIG_KASAN
-#ifdef CONFIG_PPC_BOOK3S_64
-DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	if (static_branch_likely(&powerpc_kasan_enabled_key))
-		return true;
-	return false;
-}
-
-#define kasan_arch_is_ready kasan_arch_is_ready
-#endif
 
 void kasan_early_init(void);
 void kasan_mmu_init(void);
diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index 03666d790a5..1d083597464 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -165,7 +165,7 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_late_init(void)
diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
index 60c78aac0f6..0d3a73d6d4b 100644
--- a/arch/powerpc/mm/kasan/init_book3e_64.c
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -127,7 +127,7 @@ void __init kasan_init(void)
 
 	/* Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_late_init(void) { }
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 7d959544c07..dcafa641804 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -19,8 +19,6 @@
 #include <linux/memblock.h>
 #include <asm/pgalloc.h>
 
-DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
 static void __init kasan_init_phys_region(void *start, void *end)
 {
 	unsigned long k_start, k_end, k_cur;
@@ -92,11 +90,9 @@ void __init kasan_init(void)
 	 */
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
 
-	static_branch_inc(&powerpc_kasan_enabled_key);
-
 	/* Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_early_init(void) { }
-- 
2.34.1

