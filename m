Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298C2367B6
	for <loongarch@lists.linux.dev>; Thu,  7 Aug 2025 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754595630; cv=none; b=OvFL27QDHdcPTiOOKApTMcrHSoK+LHG7Qr+CEZjOeGoMgPQdhZvS7aVOtjhDjSSgC8emJcXxnIH7ufIGylW8aL6QJCDthBKgJlfuFZtHtv9YVKyg+Dy9PUSq4XL/wwBkCH9KhXHT+21nN8k+LkliLRn8k5TpYgYx8B9jZP9BEXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754595630; c=relaxed/simple;
	bh=6hmaHEjviM+XvjcMBDP5iVfHBmu+Q4FRdIjRj4xU29E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XBHHPM0PuvFdWJMDJnoi7zFR98kqld65ufLAZ5Er2H+E/2Qr8PK47Y4y8ptXfpeOVMVMceq7Li3m6+pzAkwEAnPjI1A9jZZcyJ/B1RtIXJGAXwHYgShCgN2AUCb/eGDDeQeVJ6I1JIREPapXmjfqrFdpDtxYXgoAmTv7ITZZJmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXazQJFB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXazQJFB"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55b96b154bdso1355169e87.0
        for <loongarch@lists.linux.dev>; Thu, 07 Aug 2025 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754595627; x=1755200427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNdBwl8v2OqAa3v0ByxYoV2FZHtZfSuaaApNKvSqvMU=;
        b=FXazQJFBesQOTpS6bdgzqt39cQ1TyA4Zevb0Z3nXXgRUtsu5/95kd4UE92q7Dy++pY
         WPQOA4euA0hZBVV9LCjONxBmYvdZaeVhC5OtjHM7COrOMyFF05HJgrt6W9vf2BrT6A9H
         b8Sx3dTVve5JkOJ0J5ikwViRsl8O1CK9eCbqIuW1fvjjVyp0qNlw8tlEp4ip1zU88/yL
         O80NgBI6MPBGM96+Xrr5K1RjEX60O4DwFk5rji9LplaVUY4r1YIk/NDORHLlU1ogmXii
         JwX+ZJNCnL2BRoECmNtG2IitBtXBF3a8aKCLR1V3utPZgMqb0SdvOJsEI3p1WVhpN2j4
         eGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754595627; x=1755200427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNdBwl8v2OqAa3v0ByxYoV2FZHtZfSuaaApNKvSqvMU=;
        b=jKYmfyZ6ynYs+106pYz4DY/XeiHce25wD2R6cf0xdgy6KskjEzXZ4KhCMEnT0VuTjZ
         ezG8YOYcUYGIZEXsmdokY7FihpkLtVbNCQ0siRGi5OvXNeo4YfSWgGHI8WEkz32u56XA
         wmyovMyRfDlMNvusXFMh7f6FEQLOOixdeNw6CgBw/GEfxCLAohFELlq0K19RXt1Go14p
         JhBK+RbQVERgVGsE5TpVocwAlu0puzV8g6nzNiEO2ahCOSbIwYsVHZLUCh9KCPqVD5Cr
         8Z6ZvIXTtlKho1f2Yct9dpfTKql396+qffeHWU9GmGx4qNqI/ocVq0reHj7MfcGlIPY7
         udtw==
X-Forwarded-Encrypted: i=1; AJvYcCV3zSN9vvrLi5v7AVNyg5Xsf0zl0KgSwU/NyQnB2vCLnAGBF7WS/JRJ0qQYr1PuR9PP/tdc2fcc/1I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx44ThY/DSlpPxjcmH5OfRS6PR47UJ5RbBlgn5FX4PTeT+yZ69l
	y1BfZX5DjueUpfCSdb9sjQYi5be4JlGVmVfJPM8motSsSZhTT0cALIxz
X-Gm-Gg: ASbGncuwl+WbprQux21SvoL5ld/N9CwG1vbDnZR3s4gOfkPxDHWeTnoQe6g6TkG50P2
	CSejH54P6AgdJf4BUk6Te+zS0W3Unmz/uiKjrSz52SPKEZV+INhvUjwzD9JyRsEQYDKEiim0mIk
	zzYvLPpnL6of4R7pBShbXZpK3QKe9bxjzAxsNfJ6iRY2mcWjEilmtb6Txr8AvcPurQb737xlDKp
	x7P1fNAAsWUaC1sVvYOll8tpzgeeqX8eLYLa2FMmntPJYYGFHmNNv5DX+jOtyifaI7xsgWrjADe
	hF8dTA5KLjBDnXjY3OaGxroMs4DIKWTlUD9UZUQr1lkXHnmK5bcTVeDVj15bUZDq93TrFjyqt1z
	FjY3gFX2szrZafwvkz6RS0uBV0RG1zQ0PqJD3YfLH99V36pjDFhvnfYGxV8jMfbXDzXQRww==
X-Google-Smtp-Source: AGHT+IFy1K+04TTf6HeQynR9tEb65FcTbYVkR/07BpvyTspaDpSD1TTrgV/AzkLRIY/TwnnFAN629A==
X-Received: by 2002:ac2:4e14:0:b0:55b:8f46:80ed with SMTP id 2adb3069b0e04-55cc00e3a66mr10263e87.21.1754595627098;
        Thu, 07 Aug 2025 12:40:27 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c98c2asm2793570e87.77.2025.08.07.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 12:40:26 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	bhe@redhat.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	davidgow@google.co,
	glider@google.com,
	dvyukov@google.com
Cc: alex@ghiti.fr,
	agordeev@linux.ibm.com,
	vincenzo.frascino@arm.com,
	elver@google.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 2/2] kasan: call kasan_init_generic in kasan_init
Date: Fri,  8 Aug 2025 00:40:12 +0500
Message-Id: <20250807194012.631367-3-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807194012.631367-1-snovitoll@gmail.com>
References: <20250807194012.631367-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which handles Generic KASAN initialization.
For architectures that do not select ARCH_DEFER_KASAN,
this will be a no-op for the runtime flag but will
print the initialization banner.

For SW_TAGS and HW_TAGS modes, their respective init functions will
handle the flag enabling, if they are enabled/implemented.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390
---
Changes in v5:
- Unified arch patches into a single one, where we just call
	kasan_init_generic()
- Added Tested-by tag for riscv (tested the same change in v4)
- Added Acked-by tag for s390 (tested the same change in v4)
---
 arch/arm/mm/kasan_init.c    | 2 +-
 arch/arm64/mm/kasan_init.c  | 4 +---
 arch/riscv/mm/kasan_init.c  | 1 +
 arch/s390/kernel/early.c    | 3 ++-
 arch/x86/mm/kasan_init_64.c | 2 +-
 arch/xtensa/mm/kasan_init.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 111d4f70313..c6625e808bf 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -300,6 +300,6 @@ void __init kasan_init(void)
 	local_flush_tlb_all();
 
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
-	pr_info("Kernel address sanitizer initialized\n");
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 }
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d541ce45dae..abeb81bf6eb 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -399,14 +399,12 @@ void __init kasan_init(void)
 {
 	kasan_init_shadow();
 	kasan_init_depth();
-#if defined(CONFIG_KASAN_GENERIC)
+	kasan_init_generic();
 	/*
 	 * Generic KASAN is now fully initialized.
 	 * Software and Hardware Tag-Based modes still require
 	 * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
 	 */
-	pr_info("KernelAddressSanitizer initialized (generic)\n");
-#endif
 }
 
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 41c635d6aca..ba2709b1eec 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -530,6 +530,7 @@ void __init kasan_init(void)
 
 	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 
 	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 9adfbdd377d..544e5403dd9 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <asm/asm-extable.h>
 #include <linux/memblock.h>
+#include <linux/kasan.h>
 #include <asm/access-regs.h>
 #include <asm/asm-offsets.h>
 #include <asm/machine.h>
@@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d21..998b6010d6d 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f39c4d83173..0524b9ed5e6 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -94,5 +94,5 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages. */
 	current->kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1

