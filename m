Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48A42ED872;
	Thu, 26 Jun 2025 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951986; cv=none; b=IYPd3KEekQ5x7ZAnAE3WiHBUhCWFAM6cJMyy+aXautmU1CmEjiDNl2C8U++hu2ybDpP5AdGl9o/jxB8iODj9yNPWy92saEztYhgh+mZn2qFEJDXEXoTjTOPFQtRcuMUG/NSkRe2aU69od7q9UVhuFkM5Wpgl4FmmyEqTSMX+sQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951986; c=relaxed/simple;
	bh=b11LfSCJRGGHkPLLhyUq9TH5cjeD31Z4uJweEL6bcd0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XKDyytSsAwIhIybJBkj7TkW+DKeu8cy/IZxIwRWDv8wkCtwXziLHbqWRLqItcdRi/ICuFj6rsN9/KPkm1e0NtmsbAeuOzO1i3hjWSH/1Jz9InKUUSzT5PektpFrrMNdKxeM9KJJlSUEMeFp4atJUXJ+oK3gMmE1i0TCU818Wsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDqUQKTA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDqUQKTA"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5535652f42cso1256152e87.2;
        Thu, 26 Jun 2025 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951983; x=1751556783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gODL4ePLEui+bgBCtMqPW0nf/RnbL8ytBUu0XwvP9Tc=;
        b=PDqUQKTAaRJ5KjFdlf5UNHZIaKIUT61UPmhQFarG2tKLGUKpc//7uIvakq5fGVFq/B
         LC4SMunQ6RZOIqcyCXCuBjOjN5/eNG0vpQPaznXrUxWwRdRKYIvqI0PsKi8kvTnUsrL/
         hie/rkOXUpI2/GiUVS+J6R9hb6FvT/qX6HgHCVD2eWYrLJEmlh7wBTrwtwBnmNdJin0A
         s5SE/nlkmJt2c8OBXJiicGI/lKtRZxqpJz6KcElpEcKyyVzN+WI9wWePsCtGrcFnMP6b
         G0Q0mIVvucjUoM6JVBMzEfRUrn+AVWXNNFS3N5H4z5ZVeT7SPA+fks3IjFNUkf9xFf5I
         ZOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951983; x=1751556783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gODL4ePLEui+bgBCtMqPW0nf/RnbL8ytBUu0XwvP9Tc=;
        b=T+Ivr/2jg6YdbPpgMMACH8e/5Nfnq3FBy1KbSkJ3cJtEbWXYmarc4x7jGVAaPHmoQr
         GGukZc5Hx4fza+lzcjNq+WdYkcNUPLnLnRPeNEdpBCzP5CNgl9fltPnhPtlbaUCGkcyM
         rjRjPIgdWROuEXe3ufeyXcPre9+ZWxp8cKuDblwwEofjWKn41b/DjRiJM7mey1YMgMI0
         VHZucZOJZLwOiYMeH4e8VQUH13ZmqnyxsvusUU2D9SWUO0JZDLLO+T9ZAAID6fOMs3ox
         rHypYp/YooybDXGb2Hw2chnOOK26rzwB6WzuIB3soqcI1cfMRSTx+w07dFDmsXq0T6eS
         gSiw==
X-Forwarded-Encrypted: i=1; AJvYcCUlod6IIWYoPVC8m04Ru0FFfSatfjl4BxBhlO4r/rIHZn9wXhuLQGv5NCs0Q9Oxa6dY0lqb@lists.linux.dev, AJvYcCXyxGknzM6eWk4iffy0asgI9IVeGRhrIrag+PnA0jEndBaQgNSfJCLy37jl0OxubHW9ZrHrzOZcilcg@lists.linux.dev
X-Gm-Message-State: AOJu0YwoLCIDHqSJkH82xTsXyB0yyuVGKCIRIXrBaB6B3iD4yPeJqXoa
	erRbzTqrgQ9ayMT6BWxcejQCN4ZXDc1i0PohqlXJLwackGMAAMpVHXN3
X-Gm-Gg: ASbGncu41F2OAuIkXsEuro+oHof0o1ONaVYVAxn3ZodzF4Sc9suebinGnJD9KAGVoqC
	YvE9Eb3Oln2g2lcLeBbxigMDC30I8RybzzgDwqGHVZqR1LZ3wApvrssHU3iraNx/HFEEIhDJD4t
	YgiQCjR2Qw4hf4kA2vSb/fGp3RjE/rIjsfGUYXj1Hhei6+LJWZR5RuGZL6qoMLuyVHqf/00fsDG
	fNsFLHp+fmolFbRKLyyDoNjmf19LBgoQDncEh6KublM+ewFTBJ5yez/lTZnY590INodyvyeW86t
	6s+ttlAFIEWfGhmVGJDZbzNdAR4LE/eUC7qbPoX9aC2oRjVzAgp6pG3bF1NeVethWKt8UJm9kju
	WKOo/ubLf7+ocUvVPaWNgzdsTZHFw+Q==
X-Google-Smtp-Source: AGHT+IFtokin1pGKu8SGoAO+egXDXmR37EPc9QSc1BH26CQqVKh0GZxc7OuPefULxYvAjMzQKpLkUQ==
X-Received: by 2002:a05:6512:318f:b0:553:ae47:6856 with SMTP id 2adb3069b0e04-5550b474cafmr117706e87.10.1750951982600;
        Thu, 26 Jun 2025 08:33:02 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:33:02 -0700 (PDT)
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
Subject: [PATCH v2 09/11] kasan/powerpc: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:45 +0500
Message-Id: <20250626153147.145312-10-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Fixes: 55d77bae7342 ("kasan: fix Oops due to missing calls to kasan_arch_is_ready()")
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v2:
- Add kasan_init_generic() in other kasan_init() calls:
	arch/powerpc/mm/kasan/init_32.c
	arch/powerpc/mm/kasan/init_book3e_64.c
- Add back `#ifdef CONFIG_KASAN` deleted in v1
---
 arch/powerpc/include/asm/kasan.h       | 13 -------------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 4 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index b5bbb94c51f..73466d3ff30 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -53,19 +53,6 @@
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
-
 void kasan_early_init(void);
 void kasan_mmu_init(void);
 void kasan_init(void);
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

