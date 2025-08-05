Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793927C875
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404013; cv=none; b=YHMuugU2EYfF6tmZmiaJ+ktJxYYY6JsVGJlZgbsOBWVUhm4KTHoXM4R8iw0gj6iYiRTCCirZxSWelAUi/KgGR3pMl7I/mphKAlNN7OuRD7JVt3kPB8/+iUSTAlCZExaRF13HvI6pwHpTgQ2Y6R8ydxfxeIprECSvo2sVkWxvg5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404013; c=relaxed/simple;
	bh=+oDLrDvMYdcW7Q2MYvDnPqqaPmQC/lb+cp7H6kYc8ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DLCT7nBAK+LN2dfZHUCu7LWAr2K7s7P+vt2EuW+eRzr+HoAvTl7BW8EyrXgQmOYEFLO+1V6Ie5oQvYk6C9UObe0Yav0x2a57hrOiXcd6skfUzpQBBXV7UDVqJVZ7BjurYYninmRLhe57GqkSFy8CJzFd7ZQuNTbdYZw1gQr2Lg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/ZF8rfj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/ZF8rfj"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55b975b459aso4177219e87.3
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404010; x=1755008810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
        b=h/ZF8rfj0RuTdL+doCOYk3kGqqZeoZlVyLjmHyehlvovaVJ/00OB7D4yhaYFwTWSk7
         3Sp2jsP0fibV5aUhuPstOfo3G3BSlX0Kv2Ndq5AfepJBuSa1bnhlnyrI1RoZBg94DWLP
         DmJqWeDKIB8zyVYlam5A96RkKS6pGt29LHjKBWKaWDa6gTu5iOP+y0p5zaPQrjZTHMkB
         0EKT+JptLSnz+syGs5gCVx8PQqRzP4NPiyeEVub4lDT+prRE6P+cFon5X1/Vx1Qhn8J2
         IujlwKVrSI0Lsc49mdc8L2xA4OmaAiymsgfdES6kGotPkf7w4mmb3Fzw3soqkgB6+qek
         IXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404010; x=1755008810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
        b=VF7JVkHUaS+YBW9V7c8ieWrp1YN3YEAxmf64CPiynlwdy1IodmX6ykaPHBuFNTI2GQ
         ufKT5VoaGCV59dUKfhOmCxCiYL24BUN5StjQxehoFJTFMuUduTTAgXxfan2HBZFBvADX
         9ljF39NS4flyWEfs7sC6yO9kOAu3y202Pnk5uJ5iURXXU8+G5qvezLIDvI9lBD0hygtp
         CBcCr17y9tZfFLmN5QLTn3l1rnlPPlj6yu6wt9puskZ5Rmt0Htvlv6ytE8Y/SE02uXi/
         HmRrEe5RJMMLwzzI0dfrQXv6Zh8ZyG49Q6sKKBv0wpkFIPUhlhzaYzW2+vDn3VgFAVfQ
         YcRA==
X-Forwarded-Encrypted: i=1; AJvYcCVofjRpARemisqEXEF6tgFyj16fA25GVRFVB1AbEl0zRO93L5LJbVHSqIVRCBYe7cvgUluYXfVxWr4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrzo0AOqrbOoLvl+o90//HmdWvENiZDeZHAyJG3R3/Cwar4PaU
	OLPXyEdKMFgD72QpGidkjt9fjD9sE0pocC7g8dy+XaDeZLkqW5HhcYf/
X-Gm-Gg: ASbGncvYgBiUl7Ih65isFKTndLeHHYW7wFGI3/tTa6s87i1pDAq5usPRcup4D6+OgAp
	EETxZ0JKjlpdPa1L9dKBvuENWeI0edheNTcX789GNX1Xympsdd6ReRKdJmTU8lWJxqY5dW5gU/V
	Mvwremi119cqT2KDM+BNg6s9fz8bOnghCWhi8kmvTFJT9jOom4cQ+qndzvkiQp6cm4a4KMQdIRS
	tXZYWn3MPHarAdKKIgouoKRW4WKlou6dg3N5mpWEJvL5rd4tj4wcIU3rxyBGIWK2kmYCPTdzA2e
	JaGPK5MSH+xlZQgJKphCYteW8wy3gMnOylug7nA29p/FRKLXdXEnJLephhgtFg64VIWqScq8Qe5
	k/zX3pcomPf4KR+0KdmPDpUmcfzHPXCNEFwxMR8MgjHxP4t5ZiJVCadDi5/43dnmzrEJhYA==
X-Google-Smtp-Source: AGHT+IEuo6xaqIABZcTJ/AY4HFbxdZ3CAT0b3T807lmpaRovzDFMVVkpiUz/KiBR8yrsIvUCLLc9/A==
X-Received: by 2002:a05:6512:3e1d:b0:558:f694:a65e with SMTP id 2adb3069b0e04-55b97b41812mr3194986e87.34.1754404009682;
        Tue, 05 Aug 2025 07:26:49 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:49 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
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
Subject: [PATCH v4 9/9] kasan/riscv: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:22 +0500
Message-Id: <20250805142622.560992-10-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805142622.560992-1-snovitoll@gmail.com>
References: <20250805142622.560992-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since riscv doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/riscv/mm/kasan_init.c | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.34.1

