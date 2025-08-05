Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F01E27C854
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404008; cv=none; b=m0LvXkFL3bGFs9KwGAlXClErGC/d7Sohb41hGYH5L9UtaZqRiOgkGHZuc76IfHFcoMDvjY1dMnwmzBcUHKicvrntQ4Le2T04hEvVnNdqAF+J3odaWXNEPZgYf96bBbABme5KosvntQosNnnBTS5Sx5tSOVd8+icaAToQYbcOS30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404008; c=relaxed/simple;
	bh=Xk0SjVcNNZnQp2HkpSSqHyE9VWiAO/AKIvYCRFHkldY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DkZRsnkNiS/bjPtInil4wGbDOG8D18blZQsRxsubLgyxduri/gYG/1Q1lViY+9xQzZu1GkYYCT/64UUFhRaxsaAlmSjBtwUtepOsAStF5t89CG2K6OazEUFh2OZ3CcD5wBwJm6cMgVFRFX9ZK7LTkwYFEbe+VPuVgaNXZvbv6Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8Hzf0EB; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8Hzf0EB"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55b9a3e69d3so4045046e87.0
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404005; x=1755008805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
        b=f8Hzf0EBVoZBGIr4dMg1y2Ao0rZcFM5RuTfQBtIFwW1ept3ayFkcfpFqE8rW66QGXu
         rkkmSA3PSiSsirFprHXtS4yCPIH2TzdB0/tHdaKqo+/iHBcCISeY1audFS8EMzpyMI8a
         pMlVHwaUTwOc5u41G1bWfToHn4MAfuqbPfNTf9GvlJPEKRIQlkLwuT8ZtedYRCdHzS4M
         jMmS7kcxErlSo1ZZ0RKApgg7mrUZvLWlRuT/Ys9QMF0s8VFSG53MxMR2MsLcnzW7hBR3
         x0xY2iQyOqVS4ecAVjl9rGN9163+62gguZqfZVwM2+HLKvHohQFvm+l+1Qnqkb4AV43z
         l4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404005; x=1755008805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
        b=MZPGsqajWyAErBBQ4TLSbVXPte6es7qDfH2BVd6WYpxbnE/gV4dly2tjCRoVZ3uB6M
         kzcFnyE/BKuVk+ZiKL5WOfqOgmI5nFXdE864ko2NsPAQQ61Cbi10PbPmEBd9CSsqaDbx
         ZbWaQeuyu191HHAlmyMu69fOK9o9ajHZIXUpJ4E/wi/HrTyu1R5J28HQAjKK+tzwS6/F
         roQiSR02XwtSjRKSOVezfd81tA4lAjlfLND4ngg1KCmwwQZntXHTxUeKW0SDaJdsKCFJ
         SxqV8fFc4rUTQn4zZmFT2cZNsqLzjxfQPFcSwCkNfQ5Dr5zJEUhwwG4hNNY/bJhy9pdO
         KtEw==
X-Forwarded-Encrypted: i=1; AJvYcCVhECBwbXLDOE+XKJGLJW7oxHNSwOIhxTJQIhZB3RMOD1oojsuYmCKmMgek6M8GMT/GCVvvQIPEMRI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJjLvFOclk7ENmNDdI6VeINaQfRvD1t1qPEBVbNAuc6y1HlpNk
	5v8lf1siP+mZujfJKHZYdM6YhFzHFmIunZLA14FHiU3Rs2O3xJE6BUDh
X-Gm-Gg: ASbGncvg1SryPxy1CPi62xgtRFHb+SaSQBDH3sbhy+ivfDHYDAyyIRVGzJyxIIHgWRO
	UMnGaE0wtCHja1JXkpn5CM986VyUn1B1dfUuY6u+iMRTE+0UqSnRukwt1VLHSSimxpVtAoJia/F
	PYIX57Y9sQYQhssTPoy0lHY28i5y4QynKwxm7Z2EtgMA06i5AasHsKXiZQHTJvmym70M8QlCI3b
	bUZjSgcB7FGW88KuVcuEWA3mqBpjPXShUbsunDJnEHEOwX+8sHK4XpfP3/L69lirvMV56VMTWO/
	6tXSBF9+K7T+DZIbut3/1jarfHVFbvSP0OaGR6RsC2/r73m38kHUyCGAj0DKYLBTn5hrtHCBz3D
	KWnjpaEmouI8JqIHRIxim6Qi3Lp2NVTUnYJED458nV+R5vQxOk1Ku1TCagvsQxKy3N1+KN3zQ6A
	NLGTI7
X-Google-Smtp-Source: AGHT+IEfdK6xUGSau1shbIGz1OserWC83V4+ELanbWHlOwkRpBjVR9Bm+3vZR0IX6iJXBqrfn1b6mA==
X-Received: by 2002:a05:6512:3c97:b0:55b:8277:22a2 with SMTP id 2adb3069b0e04-55b97ac64ccmr3140519e87.21.1754404005154;
        Tue, 05 Aug 2025 07:26:45 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:44 -0700 (PDT)
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
Subject: [PATCH v4 7/9] kasan/x86: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:20 +0500
Message-Id: <20250805142622.560992-8-snovitoll@gmail.com>
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
and prints the banner. Since x86 doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/x86/mm/kasan_init_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.34.1

