Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4382877F9
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845206; cv=none; b=FG/yfsehvg2qNT8VGm0aTMCNQIl0f2qnwpDDK0lpzbayhhpps7Q9hhn3K4tODCXnVRU4gYZePpy4tpfzKh1BFZSrYczMRFkUzfJcBx5mQGSD3mh52brPIQzznRon+B1/LXTe1NyzXio0+DWXiNmNdzC9X7xk/fQuWByqj0kocbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845206; c=relaxed/simple;
	bh=ZIM5Z8nhsFV5W+hsX3dV876oHiSX20+bmYuDafoyB6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZreZq0/ym3SvbqY3rsIiPc7S2yfZBAIFfB7mtgk4kKju43SsPyfo7Bh+rlD+GH31UdxMjIZ1cn55iOFFJixBHXF4yZX1EGclz2kaNjEHq3HVlMRUXJpKLfetprXNDDIS5iyvr4lSoTepBSGLhT1OSsfAlu/6QtQep9vyYJKsrp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpWBlKpD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpWBlKpD"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so65437311fa.1
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 02:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845203; x=1751450003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HfJTJJcJZY7/fCA0Tiz5Rc62kUV3pDrNC7eedpHA74=;
        b=hpWBlKpDWmQxMdQV91twJMLGZLZngNa4LoKUGNqfcY9gOpWHo/uGue8hevqf7xNmZP
         +bXmAQ4LE7vzbAqGfVOGzJx+hVhc7tn0huH/as416hrpyUGJHwGyCyobTY3mWGd1ctQz
         AFsPhYu1+bMOlpEqghKMqvbmr2pcDvBjydFSE0VbqLUyi55bOuJC31kFIE3iWKVKPVsA
         /6SqWAlC9/Zm0lcUBi79tIoMKsF3QB6Yll6Q1/r2fyYl70R2jlg8mrqsGux0sDceAcqI
         rAeNsCJpK26AUutSK2LnBPITvVctcnwL8L13tZWnh20SxVsd56LAIvE30+doJ9UF0kNx
         go3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845203; x=1751450003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HfJTJJcJZY7/fCA0Tiz5Rc62kUV3pDrNC7eedpHA74=;
        b=l1hrMxV/JSWf5Hq1AAgpJ92swJ/amEuq+X7GcOGKUmzfvoWm0p7tU50LjGsw9hwBhX
         htXMRwtm9jH6u6fYL5tLWEPjWyc9N1j5aqWVg0p6hkEo2X/vCTXMImePyM4XRE9JVgBb
         aer4Elp5nAPptQMKpjp032Avy7HCLloUH4XMKPn0GR2XmGac1moebeqkl7bq9WOf/6X6
         JMFvFl119/7PjneyGnhLmKiTHovzzZc8s6i5BeWqbggHx4wLwbu/puRGzaOaLyqyNgnt
         TF0N7/8juc4pwWWI818IjLPGVPb5wQiD217GV6tfOuFGfhow3eX6uT+SK48yWTSmOetr
         fUuw==
X-Forwarded-Encrypted: i=1; AJvYcCVtgHIsZUyJk2Ag2G23jMKdNauTgwhm7SR5SP5ELDbB/TascvefRAH4/JCItSbUskEu0u8ao9CoDsA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa0cabw67v4KnGdkPosgJtVRwlv1dlOOKXUyZC+K7JFvODW1sL
	YTm2UflO1eva040r+guJYsKqzBBcfREt5mwsKEpHSNj83HWfZf0UFOJ3
X-Gm-Gg: ASbGncvSeS9zZw/LqanVJ4IO10X4S+O9SDXB7p1O3GeU7PWiClHhAKzPhrC7pVffFf3
	TLrhrXgu7U9AIKcUJwOkeyg5XN0ktOxAjmCSqdwcYgj2bXcieE68vm065H4gK4wjY+wy0ksQ3gx
	fOLV4HAe/lwLr+nQY94Ujk3wGagZ5QRH+8mtJt47sBGNI+j2GUBaTTQy+bu7TQnl1r/KbN+dIIX
	mo7vWtOEirFgE/XWUeQMKV22DUHY8ojjIjTSvaY8mBCSRrjEpDEkWr0WHIXbY+tb/4Q1gagQdJv
	6tHOsaFiggXVoFPhtB2djDjZApm8AykwMxw3s1nmUwJ1bK6eBHfxEPuwIFG1VDDj15sKIz+Hq9P
	tgb6uwZ+2HH2FG/KQTrVRMVjBbynEBA==
X-Google-Smtp-Source: AGHT+IGryY1FCOgoaOa1ABgKWf+F5LHoFKkqdltui071JTPn8wvOuq6kBWhaIRALdveundDdtHS+Sw==
X-Received: by 2002:a05:651c:31c:b0:32c:a771:9899 with SMTP id 38308e7fff4ca-32cc648af6cmr6208261fa.9.1750845202774;
        Wed, 25 Jun 2025 02:53:22 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:22 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 6/9] kasan/um: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:21 +0500
Message-Id: <20250625095224.118679-7-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.

Delete the key `kasan_um_is_ready` in favor of the global static flag in
linux/kasan-enabled.h which is enabled with kasan_init_generic().

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/um/include/asm/kasan.h | 5 -----
 arch/um/kernel/mem.c        | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

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
index 76bec7de81b..2632269d530 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -21,9 +21,9 @@
 #include <os.h>
 #include <um_malloc.h>
 #include <linux/sched/task.h>
+#include <linux/kasan-enabled.h>
 
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

