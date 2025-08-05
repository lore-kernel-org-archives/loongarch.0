Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69027B4F9
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404006; cv=none; b=PAXeavESJzYcYM/zDkv3kGGUagwz5woUd8+DHSnPg7WhD7JoCgt6Eg7Wf7mIG2+40Jbgc+IFZFW1F3qEnsBK8ZlIdGsMhVSF1rdkFaVZnRRwaGRCIFx2H4/51KAuA+NhAvbY5gpMOQVCYQZvdrGW7cUFal8Vfx5tn1vFlHhIeiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404006; c=relaxed/simple;
	bh=0+YxMXVG8MURIRmahEKn+nTfC5J8vQnslz9SF4x43H4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=faEELvYdBomi9sZlul6iwIakfHnj23XML6vl4mdgm5pN+tFb79Z/fDmWiBf7y3AIBBQHpy5/VHNHPOOk7+hZZjtA95uuw3kAq5Rglly65sZ4igXBfGSXkpqpH1SYY9u6Wx1SjeY4huv+4l1gVOeGkzmFlNUV1GOlfp58YWV2YnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ly0oTgfJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly0oTgfJ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55502821bd2so5675071e87.2
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 07:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404003; x=1755008803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pl3xBvbmXoSLjMyBTIqb051cyNY5upcj2qfXScxGTG8=;
        b=ly0oTgfJ2XPAhoHxGxDvOZ1x5DYThKpj+NnjlDqAYqsgARoNOSapFvf4zCFz0Djb9Y
         sqvnFawALRu+W2OUHx67p/1kenBL86l792fPR+SECeoB33CvwEWY4QC+o4MK/ChLq2Pi
         TRFNX4KWFxxyseVJ4ndvzUGhfcDETfmeuREe5pi13S2x7t/mcFTR/0orNCepJpJmEBO8
         pfO6Sb3wdrI2rn9N88m/dMKEFKZsf72G+ULKFbLXipVcUwcwNmTR7uO6KSLw3wfvuj+k
         3jIs2vUhaXriiopLrddQL05D8DLBrDfB0PORjab3RaiuWsqwojlhLCpHmQPnU0NdcGso
         GAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404003; x=1755008803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pl3xBvbmXoSLjMyBTIqb051cyNY5upcj2qfXScxGTG8=;
        b=W/IwAUPIjVgo5IAxtp2rAY4V1yJRCMZ1QPEArwMMNQQGvtNWWS6DMKg7UkwMGmacvB
         J61SRQGkFdQwLmzus9cHccCyYn5rJkiVlrXMt/9zLGhGz6SiLX2c8GBWq5rI9YGJftob
         VgbQi6vgUyQ3/kIV9hhuKqIJEg+Z3lXPY7xeB4IqxThaRvzHTnnHVeGOe7ZDbZtsR7T8
         LwPXtG2kXV/MT02m734MHyyfE9xguMn9THhBvi6EMTIv7rpDSncbUmeuWpDeeU4AkFkp
         1J4yOz+ONrn9IcDHzLj94JIQDJGhAkcHcTDSqdEyN6aRh5YFGX3ytAdThxMuIVtQJlrq
         eZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMk0lCRzg5pTR25s3freMLTTsSmwFtgm5IkoWyPhpeG9ZQQxCykU345h6cVHoCAIXeyr5Xa/HroIQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSwwo70Ol+QOp1KjInFY4WWVB70VnxOv2prac7wgBLx+C2R2MW
	JBvR8miIHhrNyO1wNZ9DSdmHcbXV0DBIDoti1BM4DYUm98g0hejydkio
X-Gm-Gg: ASbGncvl2VaKz3KadEu2XlJfZAIltBoNKc1xHatBdL48yrHKkJo2rvE77PnuGXs9tOi
	Syo4/YHp3XrynzxU2P7j8lDHpZBftrsAubvdTXBjtbEMywbECw5DTiwRnna9c9tbNtlJRRlmzHv
	YyvyuOmPbA2XW2PCVjJxR894JJpK+ywiQ6UDd48urSNLslXBpI/oNeXA9CLxJ19TZ2PhwGA4DK2
	o5apORyQYB9s5N057ZwI3qn1l+yUWMR8JpTcB7Xp6r1wb6YmoksUlRvAt52zhM6YDesdt9ZqjCa
	uqV50+2FCv5nuk5jE9Ta/ZqLZfTlCT808XenTl2H0FdlfQ2TSagZpGGZdXeXeLMQN+z8WC7cAn2
	Tp3xPzqAvRP5SQWHVRfvMBpwXZjLGMlbadn795O6yZRfsLmuhjfExl2eP1cZ/F3pDpoDqSA==
X-Google-Smtp-Source: AGHT+IGVveeqR4Cp++JX2gYkKHclckYO0JnGR061NIJDmvQ7jhspWng2d4EVRtNzF0MnSLGE8X42Dw==
X-Received: by 2002:a05:6512:ba8:b0:55b:8e3e:2be6 with SMTP id 2adb3069b0e04-55b97b2971dmr4253074e87.24.1754404002655;
        Tue, 05 Aug 2025 07:26:42 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:42 -0700 (PDT)
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
Subject: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Tue,  5 Aug 2025 19:26:19 +0500
Message-Id: <20250805142622.560992-7-snovitoll@gmail.com>
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

UserMode Linux needs deferred KASAN initialization as it has a custom
kasan_arch_is_ready() implementation that tracks shadow memory readiness
via the kasan_um_is_ready flag.

As it's explained in commit 5b301409e8bc("UML: add support for KASAN
under x86_64"), if CONFIG_STATIC_LINK=y, then it works only with
CONFIG_KASAN_OUTLINE instrumentation.

Calling kasan_init_generic() in the end of kasan_init() like in other
arch does not work for UML as kasan_init() is called way before
main()->linux_main(). It produces the SEGFAULT in:
kasan_init()
	kasan_init_generic
		kasan_enable
		static_key_enable
			STATIC_KEY_CHECK_USE
...
<kasan_init+173>    movabs r9, kasan_flag_enabled
<kasan_init+183>    movabs r8, __func__.2
<kasan_init+193>    movabs rcx, 0x60a04540
<kasan_init+203>    movabs rdi, 0x60a045a0
<kasan_init+213>    movabs r10, warn_slowpath_fmt
	 WARN_ON_ONCE("static key '%pS' used before call to jump_label_init()")
<kasan_init+226>    movabs r12, kasan_flag_enabled

That's why we need to call kasan_init_generic() which enables the
static flag after jump_label_init(). The earliest available place
is arch_mm_preinit().

kasan_init()
main()
	start_kernel
		setup_arch
		jump_label_init
		...
		mm_core_init
			arch_mm_preinit
				kasan_init_generic()

PowerPC, for example, has kasan_late_init() in arch_mm_preinit().
Though there is no static key enabling there, but it should be the best
place to enable KASAN "fully".

Verified with defconfig, enabling KASAN.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v4:
- Addressed the issue in UML arch, where kasan_init_generic() is
  called before jump_label_init() (Andrey Ryabinin)
---
 arch/um/Kconfig             |  1 +
 arch/um/include/asm/kasan.h |  5 -----
 arch/um/kernel/mem.c        | 12 +++++++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 9083bfdb773..8d14c8fc2cd 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -5,6 +5,7 @@ menu "UML-specific options"
 config UML
 	bool
 	default y
+	select ARCH_DEFER_KASAN
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CPU_FINALIZE_INIT
diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
index f97bb1f7b85..81bcdc0f962 100644
--- a/arch/um/include/asm/kasan.h
+++ b/arch/um/include/asm/kasan.h
@@ -24,11 +24,6 @@
 
 #ifdef CONFIG_KASAN
 void kasan_init(void);
-extern int kasan_um_is_ready;
-
-#ifdef CONFIG_STATIC_LINK
-#define kasan_arch_is_ready() (kasan_um_is_ready)
-#endif
 #else
 static inline void kasan_init(void) { }
 #endif /* CONFIG_KASAN */
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 76bec7de81b..704a26211ed 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -21,10 +21,10 @@
 #include <os.h>
 #include <um_malloc.h>
 #include <linux/sched/task.h>
+#include <linux/kasan.h>
 
 #ifdef CONFIG_KASAN
-int kasan_um_is_ready;
-void kasan_init(void)
+void __init kasan_init(void)
 {
 	/*
 	 * kasan_map_memory will map all of the required address space and
@@ -32,7 +32,10 @@ void kasan_init(void)
 	 */
 	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
 	init_task.kasan_depth = 0;
-	kasan_um_is_ready = true;
+	/* Since kasan_init() is called before main(),
+	 * KASAN is initialized but the enablement is deferred after
+	 * jump_label_init(). See arch_mm_preinit().
+	 */
 }
 
 static void (*kasan_init_ptr)(void)
@@ -58,6 +61,9 @@ static unsigned long brk_end;
 
 void __init arch_mm_preinit(void)
 {
+	/* Safe to call after jump_label_init(). Enables KASAN. */
+	kasan_init_generic();
+
 	/* clear the zero-page */
 	memset(empty_zero_page, 0, PAGE_SIZE);
 
-- 
2.34.1

