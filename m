Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473122F9495
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762488; cv=none; b=cK7XwUMR/LzY8pXMjuLHJya+PtBRhuYDYFOXjis18CSQUg0pU3e0Ru4fO4eI6/15Qq6hnWMtmlA61Tlxto4ItOrndlMQ0btvBDaMN5b/ku25NZTRZksBYuKOg6/CMoIFA5Z0xDmh7V6yYEatLO438QWQ8K6zwFfcWo3olCkppnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762488; c=relaxed/simple;
	bh=iyvyFShSw2tQpFiJjfhyr1CCv5Bxv6uDVr/sKPG3O90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nxqcw4eGMgOkjFOFrMo1aNcxrRPaTJscfRqk5B13j1bs0OlryOGXWdS0L24MFIGTj/ei0o4RR4Joq+HwC1PDxFtt/X2cIsWjbd+iChhRnm7zCuM/Je1CQ2S8vaBqW5LJSrHKKzBZm62Ya3EBiTpIaey16KCXCM8tUbUYUXeTLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myw3bf5E; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myw3bf5E"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b10594812so1024399e87.1
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762484; x=1753367284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQlEQnJy2HJRDhHnfkaTRfud2Lma6wEowy/1dG9z9wI=;
        b=myw3bf5E91CD9SE/aC6kRCwJw/IiKNBa5WVMAGXA3qhgCCwsyUZa51FAf1rG0Wt1mj
         ZX8P3YS6dATk3y9uePUXySdez1B0sZB9cnwydcTgPJWAEOCPcfQgVScsZ7t6o5A1Ek9A
         WKzUxE0aHxaKMVSQ2lmPN7fuj3bEtu1HKtOVW1+TsUQJ+XUyLyLaUlVsu0Uf167lZ7mC
         RF6g8hC/XyXLBKxjBiPO4R0FM+lkGArTSJlfKqXHpqbLX4Roz40I8VXYbG4ZRbR3dlKv
         n5ZSL/Kur+vFCRXJb1vq+kf9cPXDBPlapexpa7hPtZQGnih7XjBYGXL76kcveBsB86j9
         le6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762484; x=1753367284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQlEQnJy2HJRDhHnfkaTRfud2Lma6wEowy/1dG9z9wI=;
        b=NHvBmbJdJxybpAFC0PavbEKFPdJBQgLzMr5vKspWRJYjfIry2IQKVTJnYYLB5bXEnR
         JJw/NpmiotW59Pkfx6O4/y0/3K6XdS+wvnF6DVEIPtOstl4OyGJjMeEG8g8xGNNNfZSl
         newFWqNR2pLBq8QbPxLAR3+KnQ33cn2WpYcAr4juOhu9vVfXmpCh5zG+HLR3l7v2KHad
         9IbKetUM9+8c+suACouKuYxmwH74vFFoZ7bFypH77GBDWqGof3OlNAdlLOnyym/rHTwT
         6IUNNwDO59R/Brqj7yaDRQcDR7MSDhOZHql0qpWKdOFpa2sq7w/Pp3KXvpyOo9bWF+q4
         JYlw==
X-Forwarded-Encrypted: i=1; AJvYcCUfjJKJJmnmAk/qWSgVRoEgKAViI0oFyKuCl1IKmqKqrNByZBfrAW/rJ6ttLF6jDTy2ut0kFVa0yd0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr37y2gGYo52eBGbr934beW2xJH0imxeJCsCX3MWaGLWXffB8t
	Q5tJF4rpigJIUABAUyOC1Z+XwEXVfLEcAYXUSoEtW0kiBzwDBc458ogO
X-Gm-Gg: ASbGncvUYOfs9+PSs+KEJy65mzasB5wDIBTkepKlXSdRvA4LnhozJz8HVgW2/bFlHe5
	4PB9Um0Ajdg3zwlxw2XqWBJGHqfY6IJDvgzkx152yjSLrD7Hvy1YHzzNgpkHM6XKYs5w9zXUzyg
	qi7mnlnl4uYnP4VCCUVlxxjOo1K2+WDcCEm/rYH7kUuXFUa+/3kziEMmmf0qpZSmCgwhPUI7MIm
	9XJ+CU1LyYygej1ObRTfNQljIpyB+3f4rEqZHw0d1Zqrc9tsx7CzAX07nOKKd/+R54EytcoQXAb
	xfJ2ng/IbNQNwmEgBE78DTEfECikMNVE1t2HqFcrCIfSGD7qPtcVoH0JZa5sz4Ph/a7kLum9n4H
	nVXaHMkmenZdHxWtkRdDWYm2XE1PJZGPWM0209GmmORA06EYnGK4L0jumtTX1n79EgQdk
X-Google-Smtp-Source: AGHT+IGXa3L1SWxkZTnlyx1w4BEvo8LnYJCQl11jQhxF60PeWT+4RjpJebmC/Vi8BeBawEBpCpZoXA==
X-Received: by 2002:a05:6512:2310:b0:55a:271e:965c with SMTP id 2adb3069b0e04-55a271e97f2mr1332318e87.55.1752762484050;
        Thu, 17 Jul 2025 07:28:04 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:02 -0700 (PDT)
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
Subject: [PATCH v3 07/12] kasan/loongarch: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Thu, 17 Jul 2025 19:27:27 +0500
Message-Id: <20250717142732.292822-8-snovitoll@gmail.com>
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

LoongArch needs deferred KASAN initialization as it has a custom
kasan_arch_is_ready() implementation that tracks shadow memory
readiness via the kasan_early_stage flag.

Select ARCH_DEFER_KASAN to enable the unified static key mechanism
for runtime KASAN control. Call kasan_init_generic() which handles
Generic KASAN initialization and enables the static key.

Replace kasan_arch_is_ready() with kasan_enabled() and delete the
flag kasan_early_stage in favor of the unified kasan_enabled()
interface.

Note that init_task.kasan_depth = 0 is called after kasan_init_generic(),
which is different than in other arch kasan_init(). This is left
unchanged as it cannot be tested.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Added CONFIG_ARCH_DEFER_KASAN selection to enable proper runtime control
---
 arch/loongarch/Kconfig             | 1 +
 arch/loongarch/include/asm/kasan.h | 7 -------
 arch/loongarch/mm/kasan_init.c     | 7 ++-----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 4b19f93379a..07130809a35 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -9,6 +9,7 @@ config LOONGARCH
 	select ACPI_PPTT if ACPI
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ARCH_BINFMT_ELF_STATE
+	select ARCH_DEFER_KASAN
 	select ARCH_DISABLE_KASAN_INLINE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index 62f139a9c87..0e50e5b5e05 100644
--- a/arch/loongarch/include/asm/kasan.h
+++ b/arch/loongarch/include/asm/kasan.h
@@ -66,7 +66,6 @@
 #define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
 #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
 
-extern bool kasan_early_stage;
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 
 #define kasan_mem_to_shadow kasan_mem_to_shadow
@@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
 #define kasan_shadow_to_mem kasan_shadow_to_mem
 const void *kasan_shadow_to_mem(const void *shadow_addr);
 
-#define kasan_arch_is_ready kasan_arch_is_ready
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	return !kasan_early_stage;
-}
-
 #define addr_has_metadata addr_has_metadata
 static __always_inline bool addr_has_metadata(const void *addr)
 {
diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index d2681272d8f..cf8315f9119 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define __pte_none(early, pte) (early ? pte_none(pte) : \
 ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
 
-bool kasan_early_stage = true;
-
 void *kasan_mem_to_shadow(const void *addr)
 {
-	if (!kasan_arch_is_ready()) {
+	if (!kasan_enabled()) {
 		return (void *)(kasan_early_shadow_page);
 	} else {
 		unsigned long maddr = (unsigned long)addr;
@@ -298,7 +296,7 @@ void __init kasan_init(void)
 	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
 					kasan_mem_to_shadow((void *)KFENCE_AREA_END));
 
-	kasan_early_stage = false;
+	kasan_init_generic();
 
 	/* Populate the linear mapping */
 	for_each_mem_range(i, &pa_start, &pa_end) {
@@ -329,5 +327,4 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized.\n");
 }
-- 
2.34.1

