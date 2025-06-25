Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7929AB07
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845222; cv=none; b=JRaalkkFGTX42Rm1zekYka4DYYOTgzkmmserN7vA2zsmCG3GlvPOvY6+JqnimvXrZTUswjO4OZ3UMnf3ZmVP2LxFAqXdck4vVngEkctjbGBGe24EOawbg6ZFb6DAN4kPqxsjT7hfFRNgwStJensoU7WkDfUDhMA1/04grF5DwbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845222; c=relaxed/simple;
	bh=LmYJYUckHoTag0ZtlFjSwbcxbgwbsaAwVj2xOxG+evk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hapfW0nU6aEs368bBwv7dRQddPm2tv+SoDgv1fs5XzUos+N41ejeQlowhT4Klim07rKEqUjHCP+8hZc7T9gr0dT0sEDzP8JkU5iIexwqW6iTnsEKgMu6/Jnt+Cv3yyj+9HajzWUB+k0i581jRFjlquF1+dKGhNSnfsEfT6x+zpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqHii7Wy; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqHii7Wy"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55220699ba8so6788086e87.2
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845219; x=1751450019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovwzGubQ7EZCWb++7xcfiusg6EJnFDR8lh6aTJ/PpoI=;
        b=UqHii7Wy5lqJ818DZGKnM7jk6FUHUFBbCNMWVz0r33++jfZJzq6V8FcZzvBrEqaCfk
         kd3VRVXaLdvMpkltc1giTT2+5pGaCj0LfMgnIWfMYvSRobINfpxM1/2ahs8n9dFRTJB9
         wyvEy7RIXmcUW9q5xo4t2vsKROtoN6xislP28W7CRzNo6NIaCvTar/+VsCutGVeOQzPH
         ZA7pZD4KGTp6NYoqmPMil7SnPmXXFEgnIWKMqVlb8ApRVM0wpZTbmaKW8PRFOAy2JnJJ
         7yFnyeKvtMSKQjY0xkveEPz/iAR2M32fJ5r9EyDrELA2IU8H1novcQAz9/yjwtmUtc7P
         yAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845219; x=1751450019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovwzGubQ7EZCWb++7xcfiusg6EJnFDR8lh6aTJ/PpoI=;
        b=twVwYcrk4gZ3O3QXiBsX7ijRjzUrdASYLpMmtyn1CPMg3BDICO3Rx0Deri71BGjMdE
         7ruTI+a5Xmc946I4q5S8GYlqkZY7a3sl/BPSi0J8JH3NcvzrIb06KDPri1Nc+olZ/TVM
         qROLyZAtSXiulDNEO53RYj7984CW7qd1Wh5pn7h77FIQqSwiuY+44ssj/v5nbC4l6znX
         8kfUKO13rRaR/QIww5uEU55VdvgyGkphlcmMxMNpxe1hr6MttXS8wVaWQZ/yNTmvbHs+
         8a5GkL9lsY8wPE+JRx4KxanfSLVy7GFjUyFgJWzTHsmcTjfGz6Njvzz63V+sHCX5lN84
         kb8A==
X-Forwarded-Encrypted: i=1; AJvYcCXZH0t67k2eyLvYhHbqKavUOguMJlNaD2jI7Um8aAj8uY7WjMduLqQCZ1uz14m8yqWYxU8ctojzinY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl+XQH+IzgJM5PJOaGZBrNVyc3LRVRQwPXkm2E6Ng6GaeX+30T
	KGdF8jj+UnWd/ck8gcifKvOS4SwE8PGwrYEsNgPX3zJnSc4CysObwYgx
X-Gm-Gg: ASbGncvB6WGHtqNZvozWjONmJVGQ7VnVxXXcvw1FtzTDFrExkGgSITWbNrZ4ZEeAACr
	Fi6cIrJfTAnwZPGFv/59ShuERV1wSfB3KPBYonADDjKqNyVRcBCq3O1+wODyd6XWY4rCUZs1yjm
	oqJ6BPaqtbMndDitvd7AVeIjtrkXQD0u2jrPOCUbBbxcfsRb+RLINXEA6njLB4AR4kwQURwT44Y
	Q7gfEtydyWhsoe+Ooo6yR2QN6MEWZFl6uOEutGW5x0GGBqnpsJuAf6Rpjw9Kf5ZgDRIFzGdFs2G
	SBKDRGGQYiMwSNrytZUVjsiBZ9XTQAoAhycYQr4I1duvJBKl5uhVio+gyrQJCO5EGsHLhU8GNTL
	eLYoTXUC13OGL7ebfv6s0X5u0rETuBA==
X-Google-Smtp-Source: AGHT+IHEtWnCbJrLGTsCzIsOmvfz7XrCUuinYoJ1YMkmnRrIevIL2qUouOt7T42E5UqDFgQKhJfguA==
X-Received: by 2002:a05:6512:3dab:b0:553:26f6:bbfd with SMTP id 2adb3069b0e04-554fdce00cdmr639671e87.8.1750845218713;
        Wed, 25 Jun 2025 02:53:38 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:38 -0700 (PDT)
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
Subject: [PATCH 9/9] kasan/powerpc: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:24 +0500
Message-Id: <20250625095224.118679-10-snovitoll@gmail.com>
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
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Fixes: 55d77bae7342 ("kasan: fix Oops due to missing calls to kasan_arch_is_ready()")
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/powerpc/include/asm/kasan.h       | 14 --------------
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index b5bbb94c51f..23a06fbec72 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -52,20 +52,6 @@
 
 #endif
 
-#ifdef CONFIG_KASAN
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

