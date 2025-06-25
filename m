Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A5E27FB07
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845199; cv=none; b=QYcXzECyDEeBdMqJ24x6gTeXJNCW7Qo60jKv73t6Lg7Txp8T+CzoxH7AJc6iKyytWSsVemqfZOY+WSH1mLx3qgBs+aGJvzSmLoz10pGR5x7VPzOKjPsVyLINRGDRmRIYp01YqfSxSdXmB6Cy7iYIunn3q5maJ4P7tSE8m034KCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845199; c=relaxed/simple;
	bh=YSrfFiO3wmIem/Z+PiAU/NMaBQktcErgh1DaWKXnlpo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FY8oyks6HEDW45+1r0wgc0PKMCX7n7VR2MvddFCAvGiKLxumyG7IWRcMOAd8ZeILRzfFNI5bYwlbezsJ0Dhkj//tNjIXbBUbnlYRL98O5JJ/G7ATPmERnuGdK99/mX25TZSbdTLQADd/HLQwGGs6YO0rPfcG1komVbFccTnguvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3B54vpz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3B54vpz"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553cf020383so1334012e87.2
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845196; x=1751449996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOegpAuvdkFcZey7AJnC2ppf18uuNZebWg0aRe4Uqy0=;
        b=g3B54vpzS12046j4EuKvwauF+sWrVmO/vHIZlgWm8NrmTFZLBSyIn+8FX8+45NNxcP
         Ey8Gr4mOHjrSMMD4ton7n1BRVWNAdIso4P+jqLmtXQUFftoP0sx+bQQremNLWZ5p7e3o
         ZNzIMKns0jqL2YTZEAjFsuxYW9EKyQ2CsqpKVmDwbNwdI8qH3OYXjQ3JAVYQsli/6YeB
         FNHgo6wI0WMl1nWIebWpzjAnJ3cJxU241qd3NWt2uisSkLnSGqIzaric+evTPr+sIgwC
         RtSR3LdMK6FqtXpcRQXaZLp5mhsPIZ1p3UxmOeNx+ZjZMxxhNg4QkUpfCKYzwtsSdXgE
         s9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845196; x=1751449996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOegpAuvdkFcZey7AJnC2ppf18uuNZebWg0aRe4Uqy0=;
        b=YPewkyUqedehWs3KDr6JWzo8fEPAmWd4bsF9k8UFQ/f2R6j5oncADAw2HjjnYZN0pl
         EkPYxnnHt4VDa2iG1llHVUmybJCnsds2QOkBFJI2cHaA7wUs/r7iTx0ZDypgWsmYqdQV
         OxZC1TkkOa07eO8/O0tfP08w7jrmw++aisuGaU5sQJ6N9tK1rctLrV9EwR2M3noJ2oxn
         l2K3FFHCsCcmN+Gs/klaT38DcxSGpvW++4vKfdBHGtbSsUqvwl+G8+myCHoEWSi621wC
         RzWKWAb+6xjKhh29n9ba8PVQXioalxRMGEGtaUSLN6ve2/a0kE7Um/fsvA3gZnuSNbnd
         ci1w==
X-Forwarded-Encrypted: i=1; AJvYcCWas/zO+FhkNcvnkYB/1lCWYoXVRxjZbt0qVcmuPSMjtawubFdHLAoBWHW201sI4VbMe+hZxW39hpI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKuXYIlEgS3zqojss0Z5nHHOO9ZMH14MSFvNnpZzAqPqtJhw4i
	tpNkySNZYu+P0FobfOuAN/nFurDvGzBzxDkmqtW+GhwKy8nkq/wjXzEz
X-Gm-Gg: ASbGnctaDte3qsmM8OJUXzrLve62NoBPGZc1hkmOgDMHJPAYa7SOB6jZ/7KppZs8PZp
	ccWWwNzjOSsKmFvZgx+YH4QpR4f4g6miKwcnpGjHlRBXh9jLgW/TCwcSMPsaHvn0nxjDr2Jsy/u
	BZU3p646P4iIz0h5UbFncYRWlV0vvi/M36Z8gbo4DG5R2CPRBJXolJqx67aaA4aGty5JEZaOCIA
	MVUX/xMtb6W1/J2z4WSVIue420rB1aXEUrCXATyiBxZmBVROyRiGr7RagsEqjzYHUcnmF+i1Drc
	zKKM0w/QKTwBzYCP/b6k3hUoZ85RuoNUIEAkjSbbRkxP9DUbFEq+l1zmz836t+7WDBhpdHD7m6P
	ERWMl5hkE03V6f6U5BvoSewZfFIzZ4Q==
X-Google-Smtp-Source: AGHT+IH5sVpXWqNvgigVbtHVAfe6SjaMuU3V6+6bSDasNHNXTwQEDyYqvBChJ5Rb3116y8fRmuAdlw==
X-Received: by 2002:a05:6512:b1d:b0:553:ccef:e31f with SMTP id 2adb3069b0e04-554fdd428c7mr668464e87.13.1750845195630;
        Wed, 25 Jun 2025 02:53:15 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:15 -0700 (PDT)
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
Subject: [PATCH 5/9] kasan/loongarch: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:20 +0500
Message-Id: <20250625095224.118679-6-snovitoll@gmail.com>
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

Replace `kasan_arch_is_ready` with `kasan_enabled`.
Delete the flag `kasan_early_stage` in favor of the global static key
enabled via kasan_enabled().

printk banner is printed earlier right where `kasan_early_stage`
was flipped, just to keep the same flow.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/loongarch/include/asm/kasan.h | 7 -------
 arch/loongarch/mm/kasan_init.c     | 7 ++-----
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index 7f52bd31b9d..b0b74871257 100644
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

