Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877E525742F
	for <loongarch@lists.linux.dev>; Sun, 10 Aug 2025 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754830695; cv=none; b=Tzu1rAN7ahrbC+0LA2rUWnPq+lJrw5PD5VC9uFFfNZ3LAbP7yn5iWopGUg6jT/wcFaOWltG+uR0mWgImXhLX599YzaWGus7nX6C93ySgPJ5kvh2Qfa30A0mBjJIO1N8UANGLEjko3ZaSHDlSW7P4MFng3uhVKYZHFRsXCctl3w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754830695; c=relaxed/simple;
	bh=MqwKQc2JPJBB2GNaC3gYzjQZ5bv/gUTQatKs/70juhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iQazafVavYrs80pzOthnQ6mTjvakg5Zp1v1PGw5EObwEWQXlb8emG+wl6y/7mBG4WkmeYFezHY7k8nsdWxX2w6kwoYZ1XuZVRROrDinc/tXkD93AqZhpmkeauE0ZLKB2I3/eKSKyjmODbp9ki38AZaRcWaG0j72dQg+uJT/OA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4dEuqZV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4dEuqZV"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55b8f1a13e9so3108842e87.1
        for <loongarch@lists.linux.dev>; Sun, 10 Aug 2025 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754830692; x=1755435492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPUEdIdCRmt+MYJsQtBbxjY1GnPuX9CU1RwbVybqcDU=;
        b=Q4dEuqZVqroF8QQ0U4lsuWjm25484v9fnQSZLuDEfyWF0haS7F22ava0FPE5zU5VHw
         Y0ME+e8GZywAslou6R2wmhWeUhhuYZM0+yZOEKHXGfnEYTf7SGR2ncTeWcPvNmUbHoWT
         JMA5oUy+ukeB89mF/gMtwynU6k1PukeyhV2oxvzKmOH1gmroW6GY0HwHnoSFVAhv35r/
         OtUfNW43ZWakKUdysyDPPrq+wwh7kU3oGxvcaZYlJeeAOJ6mDxdA9JBrkAaUS7Abf3F9
         EnIUY7qq5auafb51+8yH7B1QhkbnZB/4y4ga5DQPuuYiW3z1rGeSzt9ORJB0B9iU5avp
         zvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754830692; x=1755435492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPUEdIdCRmt+MYJsQtBbxjY1GnPuX9CU1RwbVybqcDU=;
        b=k+HrsHRQ2Qdy02FgQWim2LRWVUjCQn+Ea7MQbsuCFgfnCcf0f2cr98UFanUM4CtrbL
         i5/mQ4O1t0vPpvhAT0d+rfgpfJ63hSOgE7lv0Ox/KVc+kP8qslWeN5vZxTW65n21QGb4
         h6GafnBoa78H0GHxz3zYLoHmJDvQXCc3lDiCND3WJgIjgap1E/v/SneUPzxs8HvVdoWW
         ZSlvitu1VhxOvSZEF6/Gd4oTZbc935KgfmsmFNLkUP5rYUbmPRCiyku6OiGyYvJ9B/7b
         kxjmCHHF0eevb0hSpegusZznG9P5yQNA0vfVSb8PLXzG+zljyeHjPsTyZ1s+4yiEuZKT
         ntRw==
X-Forwarded-Encrypted: i=1; AJvYcCWAfD3faYboXKKeXGgyqVUR7B+VIYXBnp3+qB7NItLt16/t46xsIkj93+7MIeQBmUq2mhnGAo1q+TE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8pWhet25ALGdAE44lkawx1/V5TZJZF1vsdkBJFeU3VXkRsS9E
	erF082PfNxBGA2AnkunI7aP5xtllLnGFesmo83LLYxqxp9y/9flD+A9u
X-Gm-Gg: ASbGncvFs4uDcgPSs07rm9fqD7qlWMZcghxmTpbKsl4yQlEzK7gRKOpujlO1D6KLcHH
	RSz+ELcWzxq7e+/l73kqzY/mE4iDZWW0kWZudILK0lsY86Lwnij38dtjE5PBBkVGRgKNFmUoZV6
	BYd8Jr5aefDflDMnuSUEUYlRjhV6q6PGi0bLlbKoEPc0N09jnDYWoIeaEryYe9Yx8Aad8y3KXzW
	ak2igYIcGAisDglDkZQ5NQjBlyuE5w4gDlxrAStUSFQgN5FqS66C2myImM3jHuWKDgvZSXGeUmj
	y1G3uIh58NyZHk1FK9xOvmwi6331V7fXNX2uCmXKPUCuNy62Eswk8PN3/doH6khawXzjvpMReSN
	my9GcZX3HqgQAPwWxgW41wR/8I4tXZrSFf5J3LQ==
X-Google-Smtp-Source: AGHT+IFrIl3eJCoqqHt0ANltzYIq2yL9Jka0mZA2tOEeoGsTnUPJed1OxDGIgQlZCm+SP4loyYZbRA==
X-Received: by 2002:a05:6512:3502:b0:55b:732d:931 with SMTP id 2adb3069b0e04-55cc00b14c8mr2560689e87.12.1754830691289;
        Sun, 10 Aug 2025 05:58:11 -0700 (PDT)
Received: from localhost.localdomain ([2a03:32c0:2e:37dd:bfc4:9fdc:ddc6:5962])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9908esm3804561e87.76.2025.08.10.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:58:10 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	christophe.leroy@csgroup.eu,
	bhe@redhat.com,
	hca@linux.ibm.com,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	davidgow@google.com,
	glider@google.com,
	dvyukov@google.com,
	alexghiti@rivosinc.com
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
	snovitoll@gmail.com
Subject: [PATCH v6 2/2] kasan: call kasan_init_generic in kasan_init
Date: Sun, 10 Aug 2025 17:57:46 +0500
Message-Id: <20250810125746.1105476-3-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250810125746.1105476-1-snovitoll@gmail.com>
References: <20250810125746.1105476-1-snovitoll@gmail.com>
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
Changes in v6:
- Call kasan_init_generic() in arch/riscv _after_ local_flush_tlb_all()
---
 arch/arm/mm/kasan_init.c    | 2 +-
 arch/arm64/mm/kasan_init.c  | 4 +---
 arch/riscv/mm/kasan_init.c  | 1 +
 arch/s390/kernel/early.c    | 3 ++-
 arch/x86/mm/kasan_init_64.c | 2 +-
 arch/xtensa/mm/kasan_init.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 111d4f703136..c6625e808bf8 100644
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
index d541ce45daeb..abeb81bf6ebd 100644
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
index 41c635d6aca4..c4a2a9e5586e 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -533,4 +533,5 @@ void __init kasan_init(void)
 
 	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
+	kasan_init_generic();
 }
diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 9adfbdd377dc..544e5403dd91 100644
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
index 0539efd0d216..998b6010d6d3 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f39c4d83173a..0524b9ed5e63 100644
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

