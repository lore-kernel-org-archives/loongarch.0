Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088A2ECE8E;
	Thu, 26 Jun 2025 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951935; cv=none; b=QvgRfwYDxL585vTe03vHBrEvu9Y3B/MACZI3pgpokmChiyZ84AmaVRnV6+H+cfwN2jZU9kGOLyFxa0Z4HniKq+LCVu98Fml5cuvpAiATji7oBAGuJCHPO6S4NxRoLSB5TLp0YdLfa1HsHundPj94HFdjWFTzU4AI7Ha6gS7vMko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951935; c=relaxed/simple;
	bh=kQk1v9s1banQZEyMdVJIVhKwmVBmTThWer/Uh1qqD6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KPOSzpOkqah2dP0dn3eidWwa41fMZXgp7TRnkuYHnC0+pX+y2LvKLcmshgCwgd1QRAeNGj5xG6Zw80kAmErCdzJOgvlGVqTZLrrayszcdzztASdm+ZuASOu2pRrR98ak7bGdZh3ucXN73D7LpVl5puKE11s2NXQQu5b5w42iI7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPhKw0U+; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPhKw0U+"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1329249e87.0;
        Thu, 26 Jun 2025 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951931; x=1751556731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WWyylL/OQDZN+BQlllp9O148iIrISnZhKRdMW4Il1I=;
        b=IPhKw0U+sqW6ZNdjyii/mnrPSC4891/j4qOatRfszll0WpaPDiIESQXMQYlrn/Xnm6
         1rfBzNsXLGNwXjk1KBpXgF0tK3/Zh/4czTEi2NN3FA1TiXR1t7Ae8jYAkIZIhuQm2xfY
         Jnc8VWxK4OCDj8yUtHeoaKjGQyiCEz6Ur7MjFgpAubJK8oGlH9w54NNtlvjFE8B6kQHN
         pI7FNbA6YPkuoebNcgp/GS1IgQ80UkyyzMLvfPOyGU9hCLwI5UQEMe3WJVuFV1fbA9kK
         Az0/aBm+U7HvQbwjnXY9Rm03BQ36pd9SZD9kZjv4Q4MSN070s455AejmrbGQFL9MTSaT
         hibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951931; x=1751556731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WWyylL/OQDZN+BQlllp9O148iIrISnZhKRdMW4Il1I=;
        b=Gfhh0oflt3PvQhj7Vhyrf3sieaWv2rLWJRSG8dfcLE8syyzw1L9/ftwicpSM+ArovU
         GMQsHDN4SPNnb07KN1gvPs5ZEsnS64w1g0akJpx5q6bRJwgjw71iDmjOA9DiAyXh0lMj
         uQ1KAAyELkkLZ7DtyAnBiJcBo5XziH/y69tVnLBtXvfFb2E1xtkmux0Fdwzca5/0Xqog
         KQZMMlEHipfCQ5r5G1O9ZsDEvd/XG5V9/ZC4RL7OWzD5Ldsu5Yt0qWycczkLTkXg9a5A
         LPEJxMiRJJ/aK4nMQiI6F7DrxpkMNt/R4WlrwbMR9tPvZgnTZWvRNrcosoZG8XO2dfm4
         Y9yA==
X-Forwarded-Encrypted: i=1; AJvYcCVoEKoJ545hsyL22F2z3rOXVB7wJPAGP5pHUwlExotx6ZrmdMupGJY2CRjBScihDJ181VTg@lists.linux.dev, AJvYcCXVzBabIehFhUX4bhE5beKKYBN+rXPsJcr5Tvuan7BVHZxHAQJO/BQUKchulf1AXLlgC/Quzp4eKwyV@lists.linux.dev
X-Gm-Message-State: AOJu0YygYsdJsBZk6d9kSzBfrZsuEwoBVb7015dR+sGBFNUoAOU9lINt
	uS1OkbyZmpfao//1S0c7PIX/Xtck7tMQhr/RUcm5dg8DIkxVm/dkzBCD
X-Gm-Gg: ASbGncuFEwyIAD2extMRNSpXsDVNyq7UEhg3YCLBVHtjEfjdvmFs3CLcfvs0Nn6oG/h
	lm8NqcHAHqZWqh2PiwrPj6uXDw1gi1hOgsPEKsj4BfDey8RayLnboNAq2NX1M32haD4CSYUNrrj
	BkS9cWdQLveb5OWIofdQRoPM0yTvmtBFdqWWkQB2P54js4bkhwO5CTN6aQZWhXzwTttuCUUa3jl
	ELRNREYwsIx7SZgFohWHBD6HPcb46xfoBu/QMcnfFD9tjfR8lwRHBB3cnwmGxp35B65iPuIuz6o
	M2KtD+xyLJFTypHxVbP1hKk0NaAJNKOHWcdL/BJ+T97KU7W1flKbzwz3ADbEkXI8/1NIryYD+Y2
	jQlrGgjsOJrqQsUdazbM9TABWnpXop0Etjr5QVT9N
X-Google-Smtp-Source: AGHT+IE9GYxLiOYhxIA5Ev3WJWnszBqvgVmZmVZpoI4KzTn4pH5uj6GPwII6Blv/6T015vTzfPK1pQ==
X-Received: by 2002:a05:6512:b91:b0:553:adf7:e740 with SMTP id 2adb3069b0e04-554fdd1d728mr2765576e87.28.1750951930696;
        Thu, 26 Jun 2025 08:32:10 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:10 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 01/11] kasan: unify static kasan_flag_enabled across modes
Date: Thu, 26 Jun 2025 20:31:37 +0500
Message-Id: <20250626153147.145312-2-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Historically, the runtime static key kasan_flag_enabled existed only for
CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
architecture-specific kasan_arch_is_ready() implementations or evaluated
KASAN checks unconditionally, leading to code duplication.

This patch unifies the approach by:

1. Moving kasan_flag_enabled declaration under CONFIG_KASAN (all modes)
   instead of only CONFIG_KASAN_HW_TAGS
2. Moving the static key definition to common.c for shared usage
3. Adding kasan_init_generic() function that enables the static key and
   handles initialization for Generic mode
4. Updating SW_TAGS mode to enable the unified static key
5. Removing the duplicate static key definition from HW_TAGS

After this change, all KASAN modes use the same underlying static key
infrastructure. The kasan_enabled() function now provides consistent
runtime enable behavior across Generic, SW_TAGS, and HW_TAGS modes.

This maintains a backward compatibility - existing architecture code
continues to work unchanged, but now benefits from the unified runtime
control mechanism. The architecture-specific kasan_arch_is_ready()
implementations can be gradually replaced with calls to the new
kasan_init_generic() function.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 include/linux/kasan-enabled.h | 10 ++++++++--
 include/linux/kasan.h         |  6 ++++++
 mm/kasan/common.c             |  7 +++++++
 mm/kasan/generic.c            | 11 +++++++++++
 mm/kasan/hw_tags.c            |  7 -------
 mm/kasan/sw_tags.c            |  2 ++
 6 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0..2b1351c30c6 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,9 +4,15 @@
 
 #include <linux/static_key.h>
 
-#ifdef CONFIG_KASAN_HW_TAGS
-
+#ifdef CONFIG_KASAN
+/*
+ * Global runtime flag. Starts ‘false’; switched to ‘true’ by
+ * the appropriate kasan_init_*() once KASAN is fully initialized.
+ */
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
+#endif
+
+#ifdef CONFIG_KASAN_HW_TAGS
 
 static __always_inline bool kasan_enabled(void)
 {
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 890011071f2..51a8293d1af 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -543,6 +543,12 @@ void kasan_report_async(void);
 
 #endif /* CONFIG_KASAN_HW_TAGS */
 
+#ifdef CONFIG_KASAN_GENERIC
+void __init kasan_init_generic(void);
+#else
+static inline void kasan_init_generic(void) { }
+#endif
+
 #ifdef CONFIG_KASAN_SW_TAGS
 void __init kasan_init_sw_tags(void);
 #else
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index ed4873e18c7..525194da25f 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -32,6 +32,13 @@
 #include "kasan.h"
 #include "../slab.h"
 
+/*
+ * Definition of the unified static key declared in kasan-enabled.h.
+ * This provides consistent runtime enable/disable across all KASAN modes.
+ */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
+EXPORT_SYMBOL(kasan_flag_enabled);
+
 struct slab *kasan_addr_to_slab(const void *addr)
 {
 	if (virt_addr_valid(addr))
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index d54e89f8c3e..32c432df24a 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -36,6 +36,17 @@
 #include "kasan.h"
 #include "../slab.h"
 
+/*
+ * Initialize Generic KASAN and enable runtime checks.
+ * This should be called from arch kasan_init() once shadow memory is ready.
+ */
+void __init kasan_init_generic(void)
+{
+	static_branch_enable(&kasan_flag_enabled);
+
+	pr_info("KernelAddressSanitizer initialized (generic)\n");
+}
+
 /*
  * All functions below always inlined so compiler could
  * perform better optimizations in each of __asan_loadX/__assn_storeX
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index 9a6927394b5..8e819fc4a26 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -45,13 +45,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
 
-/*
- * Whether KASAN is enabled at all.
- * The value remains false until KASAN is initialized by kasan_init_hw_tags().
- */
-DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
-EXPORT_SYMBOL(kasan_flag_enabled);
-
 /*
  * Whether the selected mode is synchronous, asynchronous, or asymmetric.
  * Defaults to KASAN_MODE_SYNC.
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index b9382b5b6a3..525bc91e2fc 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -45,6 +45,8 @@ void __init kasan_init_sw_tags(void)
 
 	kasan_init_tags();
 
+	static_branch_enable(&kasan_flag_enabled);
+
 	pr_info("KernelAddressSanitizer initialized (sw-tags, stacktrace=%s)\n",
 		str_on_off(kasan_stack_collection_enabled()));
 }
-- 
2.34.1

