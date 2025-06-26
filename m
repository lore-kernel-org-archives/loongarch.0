Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533422EACFB;
	Thu, 26 Jun 2025 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951946; cv=none; b=V74cMjdOyDqE2M5MNUjJxnHctm+JAqlXOXysUIAWdrqGHbojVB0U9r43WTi3TE+xp4X41/HanrPzsBsR3KN1Hv5+46M+kZ6DCnZJlh5QWlZ5/bpM0A/vfLsBpxmv46rvRXFxnuhlYBxOngEakq/CbVvPp5Gjqvt8qJ/X4NGK+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951946; c=relaxed/simple;
	bh=ghsO1F/BwKrN4WXjqdGwBv2veuOHZXcs2WsT9+fKO3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f1MogUF4hkctogpu58YqUVUakXSIXgTEKVX3QUSH+KgjNd4CtOHKrLUHyYkP4zX5nC499EQEgtxNtLGvoknd4JhJvkKPzFWoEmGzeUNdepTglI1kDPAShsOZdh8ItqnjO9kaebt9oEcZKBP0EU6q3mSo5tvTvQvh9eebWEdVTKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2+V9zgN; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2+V9zgN"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553c31542b1so1269776e87.2;
        Thu, 26 Jun 2025 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951943; x=1751556743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCoYbCl3wZIeXCSyY3ZNY+HzBteHxI7NOqzCSDqwFag=;
        b=b2+V9zgNLTpstmjcYeqsKkUdHmK0O75dIqSjlj9zoXxR1MbNAgVmJcTZwlv1nBQ3J1
         fbBnMCHdYjhCaRgPIFnx54ghFxsJfkeXZLe+CCqIBD25Oe7yI4DMtp1/OQnntVioc/ru
         78lIDLrqxrXCPv5L5cBnTN8WGMUEMzT9H3TzNqWOVT9DGqCfz9prjWS/9HM/qaGXes4U
         xrSwaBkW66fHOCgWHvmFyvARoNOyM86LCU7CSicPj7gEcOSKAsMPC+/HGoeuk5doojSZ
         IRp5fVe4dOf55qGc/N3AFD8W0l3iaU1YtX3xnP32mTtIexoiUv/YvU2c/Ek+gcaQOi4c
         va2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951943; x=1751556743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCoYbCl3wZIeXCSyY3ZNY+HzBteHxI7NOqzCSDqwFag=;
        b=OoMq/zIqhamay+Jxk6SaTPne0e9gn6ao13kKpNitwJTFbXl4PCyFTVQi8/J3M1Z7yA
         B3R+L5Woa59IYBX++vE5lZs1e4UtJybBGhRH6IFEVIQVOZdHPFIKfWyTbyavkyFX7Kam
         I8+1cBiBBdbIHitGTPvnjgJUzuGo7eTSu6aY+BhxDJMEnmmb+4/Ja8qfWHnfC7sY3VkK
         UpRocRqBoJR0/38szSmbaM1jyrIRgS7rjt4YBhLYond08Y56gUvG91Tq98Hm3dKAjv1y
         RS2QZvG24/oHE6uIv/ki3LOflwS2PAeLEoeqJH/AwOZID57wEUQ+kCx0gKsFrvJct15m
         iy0g==
X-Forwarded-Encrypted: i=1; AJvYcCWpJAwvRTxcw+cdB3sMEAvHQfBAGvqkzgGtXujaf/7liprGOvlS8OlFbziMSW+mzG1exBvW@lists.linux.dev, AJvYcCXAz1fxYHtEEQALut0zYGjrSNAk6jqlO/gxIGf2UL/N2o0kogKNY8l84p6z63YJT4k80XGLo66NenUq@lists.linux.dev
X-Gm-Message-State: AOJu0YxlGdjB7uwkIA2fGOiPK9Vy5H+5ulWTL76Me401z4S29Fjg8mPC
	j7KYrbn6MoZNwXyaLT1H+RiGv0dLNRJ4eZ+j2tb4HtgdTqzbWVft6yFy
X-Gm-Gg: ASbGnctes+N1RVNTF8FbWjevKZ4q+huunbIXzxyKVqTHfKHjLcNQlLqyMHz3KSIAswP
	h8vRdw93UoiDn2LF2cMCDQl3QLd+I1sSL3AE2McroqaG5zVJnhsGSCQAwxtw8Z6D7J2xrWZxd8a
	HKwEYdgEfkHcaR93hir3hsbELMppteRrnI2DXS6rp4jLxGqkB8FdyjyZQyL/kiY3LLDFr04BfQ3
	YYUcZ6edpLrgbqkVhMJWC09hCLB2+8n+yeNyBxMp9Tq1BH8NUa7Oc/vN7joIzaRnUsgxoDyiQMK
	JlQbVOjzsMnoxRcMskz7QSexumhsfzLTT5L5t5r1JWSuPSjgn0iczve1mWcFBJ5SeVGmw81kIKU
	apZK3z7irx0XkMF47YdleKSrB7EfEiUXvQgsTfafT
X-Google-Smtp-Source: AGHT+IEkjyG404mf0WVWC0akoOQBzKpFWvtutC6can+yvjxVSyNvAZo7Oo5uRf5TEFNgUYRmuuUuuA==
X-Received: by 2002:a05:6512:3da2:b0:553:26a7:70ec with SMTP id 2adb3069b0e04-5550b79db9cmr1980e87.0.1750951943188;
        Thu, 26 Jun 2025 08:32:23 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:22 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 03/11] kasan/arm: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:39 +0500
Message-Id: <20250626153147.145312-4-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which enables the static flag to mark KASAN
initialized in CONFIG_KASAN_GENERIC mode, otherwise it's an inline stub.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
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

