Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF42F8C48
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762481; cv=none; b=e5jXxEm/80K0qVSXf1ABaLrTZ0CIhrWC04E7WJZGc4O5OR8p9FpV3Yu9hCTkm85sjh1of4dqo7kJx5Y+Q/4wKRmGsNR2TnFXKq0rnWhfbn5smBnBfPZUc8t0ZKOJihMRqfi++eRYGfY/R4eRL/VAUPM1Tu/GdhH+WuKFqOQdMF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762481; c=relaxed/simple;
	bh=13fOJSUT1Czga1bfp1m5xo8KIEdG5XIY1TAjVaD1C0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qLuE9wKg2ZSDm4Xl5eS/YvO6PPTsme8nubsa5UPlytUW4OK4nIi7S1Nevpi7gdihcA7zLJCO/SHFGAJmz2Tf7UZ7R/zO3d9ZqCmmrT1kGCvWSJpvYAUDXARIBIzQnOV3TnvmCgs+EHxf+FIwkdSfOjzkrq8B948hv/9c1KCAtgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G30oz+OJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G30oz+OJ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so1339168e87.0
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762478; x=1753367278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj0938MKzJL3dLX2pSfruVoI7qA5XRt5dsqIl4I0tCY=;
        b=G30oz+OJmZkhvNt9pwxkXswmFe3RHCheb/wu8UOK6Kpd5XG8N9MPq3pB3kfvEnEdCi
         /VqXyLa7///5vcnOJRUPYRpUQuZ1sYBQTT0QHrv9CrfRdUfYauK1fl/BHhBRNbzmoV21
         W0SNDn3jYzaUv5PrvRy588i394/8xSzJLKgJ10NdMvjK9g2csRBV8qMj9yGqmnrKCywj
         OzzQeN9QFZCoDKgS00gYgK7bPpFxlGHA1EkQ5aQMct6ERFcryjDPJiYssBlvrSjOTtH8
         sw4TECwINjo4hGyVqTkRbwO666Qfv1XKcCWYvbMvcB94rHflrLownqvi2tBHVDQL6u+C
         mzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762478; x=1753367278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj0938MKzJL3dLX2pSfruVoI7qA5XRt5dsqIl4I0tCY=;
        b=gPJapS+Hqfz/+YPPesxFiWIBDVxczL5CWp2gQw+j0kc0mESqGLqCefwtlFWFp6ss9N
         zmFgPoM2/sbO3TVuFv9Mr6J2PySBMXZYotT9wq2jQA+VQCFc3OxqEkp5uu4f5AU2IrVN
         5u6l6GOM2LDIXZA3oKufzczEjj8/os6grlDoevdxNI7OCezVmCnv4pfOhPJ6NPeOA2S1
         KSRN74gLrF5Khq6PrfM2NgvOwe4h5T3LWbmKVpY+G/GRNln3wm7ks+G09W/4aBX0RJMJ
         IKg8nhHnZ7HldbZmdcZT6T6a8UilBQr5GL7gaUATBGlncNnVnoIIS1bbjZB555T7dHSv
         092g==
X-Forwarded-Encrypted: i=1; AJvYcCXFDRQ8IuqGYFsz9TcXo+6eBEU8zE6PNwFPvqJjbr8uGdIVaR2AdvoKXYPPhCq/9atFhajpV4tP5N8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyWtFd/LYeC3x+9TMmHpVnTCdFVZu7f6ibZNgNyg1uMAwa1nvv
	uTi0Px93nyYiub7xRw0jmNXwaIjkOEMHpDtQ6CW1PUMbtPEV99bvRr2l
X-Gm-Gg: ASbGncuyvREsbRsc4XP3LLK4VU4tDjWcCDDc5LZrcDa5bTb2ab9mxzWP7p7PTclaaMR
	GHOpV+j+CO6OMZqkzZ3inFe7A/eFtjAmK/AF+cZBKNkz64PDruDJ6FanCq6OgKRFym559dLmFHp
	XmAS8dPML3p0IOqyUsaXEha+K71Sunfsb0B8UEyUeTgCyCs909q7Xe/R7qZ6N2fSgM1BvGOKvTP
	ws6eCiO2Di/Mn9x9aHWFzQJpf01TcuRVXEqvbIsIEXXkm/mAhjy94jycwHcXgWRYb/uMy4YfHpF
	AQFrt0U0oEmytdA8UVHZUNruPCa1fozzXPGFJb3G95UJxOP0DFC4nro1dUMFJ49nvUB0ItoqSNn
	UcwKR3+VbuvCwgQ+kPfVfWZQZE5XbJMzM0l/x95e9KDhXgPxeEYK7kMmKO0kBStwqsKHa9BdxhQ
	J/x98=
X-Google-Smtp-Source: AGHT+IEgw9d3ZuJ+QMY1MR2nr/3qOXMGIgWnHA/W5FJZ5VigpFpebSW6/CzlCrWt32sYjXVTTwrchg==
X-Received: by 2002:a05:6512:360e:b0:553:d12c:fef7 with SMTP id 2adb3069b0e04-55a233137ecmr2448163e87.14.1752762477204;
        Thu, 17 Jul 2025 07:27:57 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:56 -0700 (PDT)
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
Subject: [PATCH v3 05/12] kasan/arm: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:25 +0500
Message-Id: <20250717142732.292822-6-snovitoll@gmail.com>
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
and prints the banner. Since arm doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, but kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.34.1

