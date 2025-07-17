Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2782F7CF5
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762491; cv=none; b=VrLvQR1KrCUWP4KAwsVyN6/vbuOlX0lcHVGsyqxfhVIndhrvJP+hsv+DAGTFdUqyjNDomm5nNU77zyrAe6+OaP+5ogpLx1/xFEjMYFe+U9pmTtfLDtApq9xyNhxGURqyCDH5wBxWTwDwyDffWPCROeHE1400/nA3WWK5DofMDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762491; c=relaxed/simple;
	bh=ni9+MGOPBCWxW978r5Taw8MZty2jgdJNnvPYPhZ7RZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CBtt9KVKL89cz0ZgSZj2VgnfEmyP64Zc6fXqR9av/rj8VPOsA8hUhXIeBaiVg4loY13tlSyYrEdk8Z+zel6Kre/INmA3fOCeIQ2ijMWFF/VTTMJjSZGm9VVmRkNAguqCwHBySFePVELEVSnNG6B3ZHovwoX0cfsqGBHQJ3Vpui4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeAYnBA0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeAYnBA0"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso1030964e87.2
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762488; x=1753367288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVh/EioNiM2ei5SEPjKOjjcyR398WOKR4A8RtqUhr5I=;
        b=WeAYnBA0/a8ACCFtbEkW4nM+4VFX69T4SA9HNbDpj1Zw5tT4+/foZtA5gT5QUczqhE
         0zNDwAgPSoQNXK+yUI9JGroguVYUcW/BDKEyGN1A3rUkVVusmE8uYi2jfGD8MHn9gKEx
         4z2O48czVBOBrV09tlQdPY+UU5xw+XEENPChyrvkkRUoshRJHdQd2bCT/sg1gGKULxff
         B1bgaGG4WcAY0+2iCFwdH8zH4o/GE2GQHxVXvvtb4/l2Fcew8sz2IeS4ruGvL5sCkXHt
         bqL66T6olJ3b6AZcmNK9t5z4oFJEeCFyUE81ItkwTG5VuS34abQZyxzlZ54kjwg89TOb
         l6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762488; x=1753367288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVh/EioNiM2ei5SEPjKOjjcyR398WOKR4A8RtqUhr5I=;
        b=xVAtk/mtBxQovhdXVF4sqAMST7A5Hef/brrwYDRZTOe6JMxJelPZFd4unexGm25m4P
         7z1DSsydVO1PwmaWHBYMaJY9OBqEK5oAVowhfp0NsWS/35rUfMmwI7r+ZoJ/oeilvbUl
         38qnLRBKa/zcCAASIe64nM+hNgK4zAbn1V0N1msw7YbtutesO17J6uTiYcAiqmdZMxKj
         c/LEBHMb9lXaGr6XQNBPlABqFzdAug+s9xkwJhkyFPAF7thpQH49a3K+bwXJw9bBQI7Q
         91uHuygrJkWqpqdU21LioCBcBlGkc3lI6DiZ1hJT3kO31mNUxdyeA5ADMxo4vJBQy2Ci
         Upiw==
X-Forwarded-Encrypted: i=1; AJvYcCVzLzfOaSugibHZIIwKx6El3+Z4d5/+fcqogts35IxDf+8vMcrcaZszzYxTdux2NJWo7KvYImD4bYY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yym5HA8TrhGB3djk+/6FzgjaYQaJqXVfVk9o6i2XNsrOcl78R8I
	4W4tttHNvYx6hJreagOH09mMeJ7FOyP+QGeQwq7PYBftAzF4fH1BiZ5G
X-Gm-Gg: ASbGncvXPppc+2t77Sq+GZhFR9DfXcEoClTdKCSTkmBItyeFFAkLxb3/wnQ8FGkV67z
	VSMjgJc2XiXa3hcGIAXf8rknhxjXKUi9BTt/tMUiEv5OKrgOlAoviX0ENc8IXyxG6dklXOvhkFw
	7Ac0fkzoYd+cjMJ56MU1aco8o9CuQ2YDcwKDYVYwtTnNoOFwJe6wt6ezGUJL2hqAz1UHUcAUYAk
	BM+cAr0GUvRXEobtzIBW4+PTRAF1IRXTOQkVvskB8AC/NsZ+up7qz0P14pk7bc83W3Fb7Cezkti
	NwwDBTFFcFc4gFg+BteJVWbJTyKjCTHbUOlpZ+Yj1/Eql0VtOgj7mHOrE5JJ2pCX7kAZno9f+uK
	rxibRhgX4xUvI2IS85XAwm25PNufiOT4bP02+3D/PHIC1cm9lxenL11JZGDLbxvEp99Ho
X-Google-Smtp-Source: AGHT+IGxLJhvaMCe+spMW+LE9A946Qy8DaLWnnJJyiUxPC1zU6fBVPq5lHa93m7Tf0WxYYCemaAtrQ==
X-Received: by 2002:a05:6512:611:10b0:553:2e92:2c98 with SMTP id 2adb3069b0e04-55a2339f4b9mr1702111e87.42.1752762487529;
        Thu, 17 Jul 2025 07:28:07 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:06 -0700 (PDT)
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
Subject: [PATCH v3 08/12] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Thu, 17 Jul 2025 19:27:28 +0500
Message-Id: <20250717142732.292822-9-snovitoll@gmail.com>
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

UserMode Linux needs deferred KASAN initialization as it has a custom
kasan_arch_is_ready() implementation that tracks shadow memory readiness
via the kasan_um_is_ready flag.

Select ARCH_DEFER_KASAN to enable the unified static key mechanism
for runtime KASAN control. Call kasan_init_generic() which handles
Generic KASAN initialization and enables the static key.

Delete the key kasan_um_is_ready in favor of the unified kasan_enabled()
interface.

Note that kasan_init_generic has __init macro, which is called by
kasan_init() which is not marked with __init in arch/um code.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Added CONFIG_ARCH_DEFER_KASAN selection for proper runtime control
---
 arch/um/Kconfig             | 1 +
 arch/um/include/asm/kasan.h | 5 -----
 arch/um/kernel/mem.c        | 4 ++--
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index f08e8a7fac9..fd6d78bba52 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -8,6 +8,7 @@ config UML
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_FORTIFY_SOURCE
+	select ARCH_DEFER_KASAN
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_STRNCPY_FROM_USER
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
index 76bec7de81b..058cb70e330 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -21,9 +21,9 @@
 #include <os.h>
 #include <um_malloc.h>
 #include <linux/sched/task.h>
+#include <linux/kasan.h>
 
 #ifdef CONFIG_KASAN
-int kasan_um_is_ready;
 void kasan_init(void)
 {
 	/*
@@ -32,7 +32,7 @@ void kasan_init(void)
 	 */
 	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
 	init_task.kasan_depth = 0;
-	kasan_um_is_ready = true;
+	kasan_init_generic();
 }
 
 static void (*kasan_init_ptr)(void)
-- 
2.34.1

