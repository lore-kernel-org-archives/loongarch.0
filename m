Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0114279DB6
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754403997; cv=none; b=Usdmh3ZBV8bkK4gBBxsLYsAFOPzOtbqhA08OW6F0TWLJ1Se/uHO4nhwmQ9uwd0R6QZCAMjVbT6kSrVFX9NzTzSksmfIfONxkSgqBqThD8EIT2eluG2Djm8u5GzDz4mrv+al4oa50TgmimaO8XCcdFPxcIJ+0i6tFJCq1AbZR6Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754403997; c=relaxed/simple;
	bh=3HeZTVECsuRRA+a4sR8Q4oo4v2MjazmlgBTz+bqQUAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A6nUUu8MiWWHvk4UmS4YlvYXltXWxAx6pAKLNo5JlkxmAWPhh5XMfX8vyiTiAcv6YT6htsg5KnGmLAmvt6nLzRDoL64LPnaH5aXU/JdWEf/VF8oCUBJOZM8sKoELCKeEt218grP7+EOyynlfm0EH9JR5iK9L+/fpxu7W6Y+gjBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScRCOb7G; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScRCOb7G"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55b847a061dso6301785e87.1
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403994; x=1755008794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44Cef9kvp87sJdDYN0I0T3XW3v08YaC6etU0qwyWC00=;
        b=ScRCOb7GpUc37Hg8W58y4i1bMjO8ngKFBXnG+haInhXisL8TOfhwKjqMwsvg7ZlfUI
         XXeto62qmAtkz/1nOQl9KtFboUIHTCzsk5hFL25y0LbD7MacIVDXdyk0y/jdOzCyJBvv
         IuGGRXo4o18f4JBWIvzsa7x5b4c2Al5XIbZ02pXO0h8HDi2zliY0HVtX33NCKmT7mC79
         qhcpsuZUeygcK3RdfFSu17y2tny2RiLYq0L3MwM1NNmHTV7y1poaBfaeTqXQgebWxBmT
         mE8Rtx3GN/nxclvWKeQZZfMZtseQ6VGYoIsotc4VUUR0mHIRdB5DA0vKCPGtzBEkm38o
         iPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403994; x=1755008794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44Cef9kvp87sJdDYN0I0T3XW3v08YaC6etU0qwyWC00=;
        b=BPfu7hRWSrhURoMJMSka819UNEgtvYHk5BFMQ2pmH0n3gFtsT5Pe0fngNkdc2IcFGQ
         qcp1FdpwIhGKtRlwdv9LShDAUYJ+tQxvWxnaS6oMuEOpmucf1URbKd9L7dBQT60k/Z7P
         xLtvEk4jsQhE2LOdpEu1LMT4ag46kNWNc2H1YtfeBss8NeNMVSSLeHQoACcvIG6t7fvU
         tVWpeKCLv8O90XZei2gqbgjSeTGDfhCO5/F/btS83oFU8Zrb+DXVTNjYrnUpX7wgFiSC
         qVj3/6CwtGsANDrNfbXFYpb22dpu5VaUvztOizyAsJnsMeI++oGbN/D8aafqk1HmJkBS
         +fAg==
X-Forwarded-Encrypted: i=1; AJvYcCW3qFG9k/eYUBXtb0z3m9t1bXme+cRbNqrbH0SU+Tax4wMiRuVQsT3QBcD1ieTd4KVb0UMHtUA0tg0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw//hv/Puck7JLS2HSX//P7IoUkVGgV/FU8SKsXG9AxJYyiBobl
	fGryKJfP0nbhRGUpRSsdcS/aKRgYjpvEos7mh9MSsVgrUQVxHldBa2WH
X-Gm-Gg: ASbGncuMQbIPg+V/YqXgzrvGah28Plq4Cj6XOM9xeTh1uwjbAuwLsJl1NM1pHZ8z8f2
	R/HSL83QuLTwXVdVZbUUhAXPWK9i6vAV4V7v4wN6LRkUCTRBksbAoCgyqDIEvnumgs13BqDzt1m
	yPYM3b8S9w52HSiaCp/TY4zJKl02asEZ8qIdbaCci7p6rjd5ruVLPHuAP09vwPYgqWVuBISCopn
	tqXdIxUle8ksHAMpZKnnErv5TCbISvByHAtXdY52A/BMLOWt/cHCoNfR3ZGZeg3FRS3xyv5Wjj8
	aX600EuAjZQ2Ecp+9Kl41lgpYVkclNuNpPEJ8tsJbe6L28CIes0rKVam621DyuiocHdRFzHDfSX
	hVzbkcx953p5/O+W/I+7hj50mJfJpSOwBjV+0GYHk8FyAgjE0YKoWrJd5w0aOeanERH+j8A==
X-Google-Smtp-Source: AGHT+IG3IvKFDzWW1UJXkvwSM56EKK5Kb8nNkpLL/WnL+raFeiYW6aZ7Xti28XnaNJYqXW0SrOWKyA==
X-Received: by 2002:a05:6512:4023:b0:55b:81de:3576 with SMTP id 2adb3069b0e04-55bab40c2d5mr1298432e87.24.1754403993514;
        Tue, 05 Aug 2025 07:26:33 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:33 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
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
Subject: [PATCH v4 2/9] kasan/powerpc: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Tue,  5 Aug 2025 19:26:15 +0500
Message-Id: <20250805142622.560992-3-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805142622.560992-1-snovitoll@gmail.com>
References: <20250805142622.560992-1-snovitoll@gmail.com>
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

Remove the PowerPC-specific static key and kasan_arch_is_ready()
implementation in favor of the unified interface.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Fixes: 55d77bae7342 ("kasan: fix Oops due to missing calls to kasan_arch_is_ready()")
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 ------------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 5 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 93402a1d9c9..11c8ef2d88e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -122,6 +122,7 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 	select ARCH_32BIT_OFF_T if PPC32
+	select ARCH_DEFER_KASAN			if PPC_RADIX_MMU
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
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

