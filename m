Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C602F85C3
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762468; cv=none; b=nS+1Vizdq/88CGLmpNIrPfes2JQTfsy3Um9p0eoxvtd4T5RdMJIATX0Zj4M0p6sR78xrOJPwyQIl8LTHWDYhLrIhYakC5kpu1YH6gFPop4MLrcdFEP4I9Fz9kJ6bVuVImJBJ0ffgxWBh3Fq+e5bmWAG9rBRwr+BcicjqukuCMJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762468; c=relaxed/simple;
	bh=u5QXaPJcX4chKtk2OMOGLWnLjy+FfyCWJZqxtReexR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rk55Sqb5yQ2zCNI4vvPGkYefgmmzsOSZJvAXmmv2VDKylsvS/uOtmScoK1fCUH74bFstFOi+TXGNV+YwhJKl60i21aFBcoJxfrX2rG83htNtvVREg1SaxFnTMdVXm05OFua2j2TScJxdL30l6+BGjOMOvGLd9XLNH2r0iB14Ids=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwPn7ec5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwPn7ec5"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5561d41fc96so1208517e87.1
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762464; x=1753367264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3WcQqYlZ+nGmkIZO7BZjNBhDOM5R3Ju7Hd0Z8GcHCU=;
        b=OwPn7ec50XotFBbv52E6UAFMdRIRElHEkbd8VaZJeP4gne2I5BYL03vwXG9yresm1B
         JTxEN/LFTt/B1wq+3x2V33TTRj2yCkSXxPMp6NcpqXKfQ7PBLX7F8Y5DcWjn4Bt1wbWw
         rdAvFl266k5D4vefMWuGvXHk77yRgOf9McYdY6ow6rRVWrGIlD30KluriA8Xin9lNM47
         Sdl4xmxFYxJfCHKK2tsMDmB+ETKVJOgetGsEbtBBkOKyVRAyqvqu7HhDdIZg6N81PFuX
         L1jCTbza51gkMTE4iDdt6ZG/1xFLWD0i+AW8WM8j40Z7juAHS+SnOjoLrZAWded0jIfI
         5xOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762464; x=1753367264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3WcQqYlZ+nGmkIZO7BZjNBhDOM5R3Ju7Hd0Z8GcHCU=;
        b=GjXyL94nxbf/kb6yHI8An9cbaJrlMlS5LVtQLnIiki43kmseQfTu8BFrlhLA+vN/UK
         Qa0L+oF1fX4AuMYQnrYqtxCOtAd5sKgHRpbRm4HzHTto+ttv7A5VBiVC3weeJGwwEX7K
         6g7rPE/Hi1TnC1f3o/9nHdFcR/Sj38/9HKDlrDsY5ZOtE3e+umuVFzMLLVmyk4CR1XxH
         K3B4OxQVGoeCs617JY80a1J+0WEkaajtzJsXW0xe8KvFM3s5dxbww5Y5VMouBuv/pnPT
         Vq+cSxqKq43vc23O8IjFQYhPZ2cHVTIGWmYpatquqRT9My4ftS9rDhygu/hwuaLMA/SF
         LEig==
X-Forwarded-Encrypted: i=1; AJvYcCWut+q43ZXbpf/PKcugSYqrheqX9re5ZsEUvZnOmk8GlC9SvcemGLIhMWf76oM/m/GcXJxLKCocijs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yybd1J0wxNCr5Pk8aOYB6HI4+f9d9I+euW+nhbbkH6olvqtnX1s
	vYrKW4q9qA8rA36UYDJ9A2Ps1SxSanl2HnqZMV5dyWYWUUegnVXkR0bm
X-Gm-Gg: ASbGncvGSXOly7IM4btx4r52N1Ei3Ull1iFh7XyEpwwmvKIOiJXx14oiqpY/q5CW+Ae
	rHP8FKq5XB5rspTEyw371X5cJoohN/M6VM1BiL2NBPTixgsZfOVoF1qL/AhfY5XDWG8xJn3RxQV
	zqDGnjZcZR13IMXYLgbTKlvtyyWkvKO4DKk8S+9t76dObyvMYAgcyGBcO2qpEgRZAWyiKImq/ig
	PLWwLZzpYGUX/BOFMw1G539y4lFowUdRuRyLG00RgTP/DLOaWcMsyksLQ5185C9Z91V9cDirwFk
	zjoPIubdgbBXIQgVOFWs3RK3Pg1YLh1mT/FW0E6tAHLIDw6HhvwlsemDYl84cmQxHbN5/EIepOX
	tF0JpCrNXc5W0Iv+7CNZ9h/b96d7eM7Ac5NLzONzcSuGqYup6oBRTR0CGItGQx/0QQFyu
X-Google-Smtp-Source: AGHT+IF/OloHnnX3mhASN203Qn491wmneqjv+U28AgmKB7HhI1lYsnMn0p3m12S3GUHmxAKLZ2vT4A==
X-Received: by 2002:a05:6512:15a9:b0:553:2421:f5e3 with SMTP id 2adb3069b0e04-55a23f1f963mr2211249e87.19.1752762463801;
        Thu, 17 Jul 2025 07:27:43 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:42 -0700 (PDT)
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
Subject: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN option
Date: Thu, 17 Jul 2025 19:27:21 +0500
Message-Id: <20250717142732.292822-2-snovitoll@gmail.com>
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

Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
to defer KASAN initialization until shadow memory is properly set up.

Some architectures (like PowerPC with radix MMU) need to set up their
shadow memory mappings before KASAN can be safely enabled, while others
(like s390, x86, arm) can enable KASAN much earlier or even from the
beginning.

This option allows us to:
1. Use static keys only where needed (avoiding overhead)
2. Use compile-time constants for arch that don't need runtime checks
3. Maintain optimal performance for both scenarios

Architectures that need deferred KASAN should select this option.
Architectures that can enable KASAN early will get compile-time
optimizations instead of runtime checks.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Introduced CONFIG_ARCH_DEFER_KASAN to control static key usage
---
 lib/Kconfig.kasan | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f82889a830f..38456560c85 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -19,6 +19,14 @@ config ARCH_DISABLE_KASAN_INLINE
 	  Disables both inline and stack instrumentation. Selected by
 	  architectures that do not support these instrumentation types.
 
+config ARCH_DEFER_KASAN
+	bool
+	help
+	  Architectures should select this if they need to defer KASAN
+	  initialization until shadow memory is properly set up. This
+	  enables runtime control via static keys. Otherwise, KASAN uses
+	  compile-time constants for better performance.
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
-- 
2.34.1

