Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF142F8C32
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762477; cv=none; b=KEVWon9FVRRWcEMo7hvchGMtW4p2Ze1zX9mBu6U2+kuE/N+AYPj+dssqCZbGifWWGvRtdzILJxKq4LC5UatwPMF7tgkMg7NcIkflFQcXYQWttDhKchvfvAhXHblj/TSbw6y1ULHDsa4vPza/7Mws17TvuDwOOPloQ5qmaWkzNbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762477; c=relaxed/simple;
	bh=y2h7T4ppakA0lW5KEjIcMv2w/pJN9DVxFk/7JsnNCno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e9AM9MK8flkeGIDPu39W+F/Cfb0WEztTF0QTjoke8eqG1nAh7UHsgPUOmo42ibV198i9uDOf7pj1thsRhUbUBD9bzzlOvgC3j9T7t4cPCckIdR3GsPH8srs2wQd81ISs5GKO75xDvIJcYevnnp06JLLzRmPwg7XcSXo8Q4oukyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ0tJkWV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ0tJkWV"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5551a770828so1168817e87.1
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762474; x=1753367274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bku05+DNIlaPeHqRJ4y/c3E9v08tlUqoZ6kZCd1AC2c=;
        b=QQ0tJkWVGMJ+vsuLlZTeGdztEF26IKmD4riocpsGiFETgRu7xXGeMMgPIe1o8NsyqW
         AoPbs34bd/PQSeoEN1nfviDl5YD6JZH3OcCJxsJxHCuSp2+D9H0WNPr8nnAYBjxx7BEr
         n2RW+sbr0OGno30IKOV+LWpRYoE3yEeS/gCxbvqiM9Ar9b0QOtiHsQmKzlie4SHNcZOW
         XC/L5GMkkYcleiH9X6XsMqY4lHtZcM1klboneK0Uu+n+x+ePkkRlB5aSEMRsYp/HOXCJ
         fePsSZYejAlDfxG7XI4Bcr5MESwxPIv7kKZFW1LlMg26E/ecTf4+F7q0lv+plPrbt136
         1eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762474; x=1753367274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bku05+DNIlaPeHqRJ4y/c3E9v08tlUqoZ6kZCd1AC2c=;
        b=HeRjufAqCTPAlbQ/UNhGDQ6y35ZYOr1x/llC2vgm8BClhymN/7GHoIHK3VZ0uaQeWc
         zcFW4Q9F9BFkVa4oHi5ijfQLHz1SCAkJC1La74aQLtuKjHC4RZk4i6DG2UGJ9do+Q8Lq
         nBHDo0AR98WETSbNbqpTaVhqZA2+PaSwg82+U+46kfOxgTqgkRZjvoDTJGTLV3B6JMZi
         Mj980jYvGzb635khBm/6tVja7dAyEt9rSotJ4wkHi2DFVKoxTJSuRaYAbXFzBi9J8pm3
         3D3dso+VBFzvFPu6UMDW7vmHifQwOYLbU/SECdCTO66weyyhwOEX1Ygz4nT7YS/Tgp2G
         GZlg==
X-Forwarded-Encrypted: i=1; AJvYcCUMUEebtl467gaGelOBEVasEDRNIHdaH1waLHlpw6QE5K326q9osuN4jUFsq46VxEzUTIakCYj0z9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOWeoYAXgS3hZtr/xYe7RBsyeAy2aki+BI/6X+jPgVm4iKHcbl
	TMCq/OBQYP0ly37ooXNm0LvkM8DT9sMbyFHPliz4A9VHYznV6wAquzcG
X-Gm-Gg: ASbGncuLzyYdv6lHfRbopN/O2cEHhrZkgqVwRqgLMt0hOynghThboyglqSF5porwQ10
	V1CMgKwnG4ypIFyWSf8KNwXiCm8U+z02XmJGbN56VCebi/7G1sE7Ke1W376o512MN5U7QW0WU0I
	FHJTLqzPWxLeCAGXANfcA++GNlJf7PwXl/OAqIdZqyckG1Wie1y5Ck34e2WHOPlMNqg7DgaL+zo
	c0bEYQVwdKaGaxUOkrjCC+SBJLMyJDgPOIch7nrgPVcbei2Lz8LG5FgqSxSFhRz3eh5yKUHF8/+
	CX4WjIvNjvU/xMKCXs18gAFDFFDhssYLRzNIlbT1OlT5N71XmPKXhh45FjDH1sNiZpohgp2wR36
	keezs2KSk47rrv5gIeKPYLsrsVvMuENiGZc3xK5Q8ZMca2aWvnQnOYN4XwTqAz5SKgURhmZHMMh
	nVpSs=
X-Google-Smtp-Source: AGHT+IG3RRCZYJkrl0IFxNTcXHaC63cFJOMHtvbXLWcJf3SefCDeVNa3EwWa0HZJEZD2h7TP1+bY7g==
X-Received: by 2002:a05:6512:1452:20b0:553:af30:1e8b with SMTP id 2adb3069b0e04-55a233affa7mr1874039e87.38.1752762473999;
        Thu, 17 Jul 2025 07:27:53 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:53 -0700 (PDT)
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
Subject: [PATCH v3 04/12] kasan/arm64: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:24 +0500
Message-Id: <20250717142732.292822-5-snovitoll@gmail.com>
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

Call kasan_init_generic() which handles Generic KASAN initialization.
Since arm64 doesn't select ARCH_DEFER_KASAN, this will be a no-op for
the runtime flag but will print the initialization banner.

For SW_TAGS and HW_TAGS modes, their respective init functions will
handle the flag enabling.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm64/mm/kasan_init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

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
-- 
2.34.1

