Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD012FA62B
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762497; cv=none; b=HJykD90A7hIXu7OtbwSJib7UkawZFMs2BKRN+uvcHxd9gxkJ+4Eca+snAmstUjDhwzbyUDgM3p4qNE0W/LtRMQr4zWUu7fZozUvGLSTuM0xNQbKNkycdz0kLMeo3QyyeRsCmjaOFbBtdqYos4EYk5UiO0GROrtPDrmzkQ8WzvhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762497; c=relaxed/simple;
	bh=3Cytk+SVwc2NsgWIw0nESWZsARd8iImT7N+vVAOVWLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XfrXCAvZOUHNVtzNMLQC9A7nR5IaRck+/8zcM4yE9PMaAeEV0b56fNj5gfMJPu2b4L0oG4kr5uLaU5rPB9dlEqUkvdWdxUQr4O4jJAHbDT3vxmJcrJomJX6Q//1ydo8J8nuyvO9BQSzJ5vKdLqEHczUPmIeDAZrIShk0P2C4hpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWNpep5N; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWNpep5N"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55a25635385so1157679e87.3
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762494; x=1753367294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwSPw6gFzDTyOsOkroA5OTCCxXe2CzpjscG8NASBaU4=;
        b=fWNpep5NreRGXGHeQksX51iDoF6UlTjE8BBx7AD1g55BUTr5lrnM4aaF7J4CvRyoNa
         OS4u7U6GuG4Gq21zNDLRL6S1YJGr5Za7DMMtOb62/RMPZ2bx51/yrw16YSF7GOaM11gO
         bSwmL7JmzcQLGbZ0Xmc7Mb7I1Es+PbsVDIAzJbSdS7ZYiYEFs0peEVsKi3eX2ImxRZNc
         OvSicB/qNDneTAM/wifECr5amQlMEC/L3WFFJn3SoFCZtZ+zqXkqCBrFFMxOFoqwGSuB
         2hObjvi9rnwEob03FiuJOmzMQFGCxV1Xunz+bW+Nt1GCTLWMdOj2SyoZ3UC9VwS/EHJk
         0B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762494; x=1753367294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwSPw6gFzDTyOsOkroA5OTCCxXe2CzpjscG8NASBaU4=;
        b=NxT5D9O18UX06xjvJsEAWYLLG+izN1+LkAQhWq4PlIoY+ragVj1DB4BwdJnY6ZykH3
         3fAFLbsyK34nlpedYFNWL2zJMnhjTdcuvVl2Ys9L3oowHO2+GEzLMVB7vjuXE0vvcmcp
         CN7JR9nGCkisDVA0/bUlpGbgxK3dlhK6e7Ao92tNnRkqHT80o6vTWApfMqiwP159wKlu
         HfUjz4rf+wWNKUSbOROlsB/wejC9n5zvftBYIe8tvFANguwwiRspP+hX749Nz3Eap5Gl
         ijfLFBC87HvAs6I9Hani8lkt8lsm0R2pvi2ukLnAu9gZ13FXajt7hkbjpfFMsZ9JJqlM
         vWFA==
X-Forwarded-Encrypted: i=1; AJvYcCWyucimZVJMUuamT1by31GwFmWHE7LXQYJNREtlxMGcWQJ7x18RM7VDdVeT6Ik/CCkScu0OdURlGCU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwAM2i5hLX0OSCPUMbRe9wpapPGjaA5Ju7CjuTJFQ+K3HEcVv7
	yrjwimSCMKf3Pp4id4kgTDJk6ADufi8ZRNJu94YWre69+RLZA4Qwft86
X-Gm-Gg: ASbGncslXTvnbEPlUulhCF4mMqbg1fVgp3IAnWjL0HceVgiX8udtb7oEkFWHIxL2K6F
	ymQWrwd4EBeD3+4n4vKS/XeYdu6Bh9QV451TxDqegc9AbeF9ilGA82BYlLElmIMfwK05/Z7I+yS
	3BUDR8niwkb7H/tU1JOOj4vDxVNj/cJILNyFwuROG1CVe7qMPHpJxT14BaoCpd55fuCRL6JNHUk
	azLyySG3bMi1YYsdYqql+G43Gp8X4N+qg0Damc/bEbPT3GAqIExst2UehWzLcf2UZx0Il7hHmNx
	UPN7SnrnH8qlj1zyWfrOfNQH75V3x4y1aXV33twVcgipD8g56m/+2q1P4yI7moQp7U6XoBjGM1E
	s9HGpHAL32JaFBr8hmEjKLyP+GR2NkqC3lPV7ClEZfEF3mmXIWfisgiZhPu0n+kJQrMH6
X-Google-Smtp-Source: AGHT+IFV4/fgUWSLQ9HeTYD1ZNc8U4khjXBXPUvRtZGAA8fcpyT35FlSXgJszoiLVDo7d7offe3D+A==
X-Received: by 2002:a05:6512:3710:b0:554:f74b:78c1 with SMTP id 2adb3069b0e04-55a233db3famr2128904e87.43.1752762493542;
        Thu, 17 Jul 2025 07:28:13 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:12 -0700 (PDT)
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
Subject: [PATCH v3 10/12] kasan/s390: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:30 +0500
Message-Id: <20250717142732.292822-11-snovitoll@gmail.com>
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

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since s390 doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

s390 sets up KASAN mappings in the decompressor and can run with KASAN
enabled from very early, so it doesn't need runtime control.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/s390/kernel/early.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 54cf0923050..7ada1324f6a 100644
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
 
-- 
2.34.1

