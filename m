Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E22EF2A7;
	Thu, 26 Jun 2025 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951973; cv=none; b=j9wP1zy9CGKdSG1bdST6BukXHSgpqryDprSeAPWFu5ZW1xjj/Hn5T9PoxMRdZzvJ5mPrZDwmvSh22sTD6NV2GIaI3Z8rKgZ13TBkIaT7Y6Lqj0r4fiSJCTPErrluBrYLj2UbHwzHYkFXAQaMbLI1x+kPMqjCnrzy/QYs7MuAbOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951973; c=relaxed/simple;
	bh=lhF1+oDAAfZTQLsvxX1VmCxIOVKQmNCDXyIFJsn0eiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UVzSsedLWe8sRM8a65/ZEW+a3bj3E8+8lPko0CpNuWWbHyLLcX9ii8H5tkqkzY5XF/VRXj92EFYu1HYfCe8IJ5UFRX4OzTO6kjDWtd5YA4gJ1KWo1MTUbACoIBH3vpsISz8EjXSuE8DmolhP2bvh4vc22cLhXZ5zGl9rO4r3uxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9UvTp0E; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9UvTp0E"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b3316160so1021412e87.2;
        Thu, 26 Jun 2025 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951970; x=1751556770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
        b=f9UvTp0E1fK+gTfta8CRvKps3Hj649kUNRoOd/amQvEvkZItN+bZlGboHJxrSzZh1n
         /eshuqaHhkZVIsrNA6sMdUOHK2PIOwbvNltadciOWkhNI2mHG17xoBTMlfDsNFxuhxt+
         xqmGFqfL+Ar1w77fpZ1yld4o9r0x8pl99EOFbZxDM8ceR7utQgyPbXyNd2PmlBg0UTzP
         crvVVqk5FWyLvyw9SttIUU2V4paZvi8CD92EeivQ8kO0BwtEgSZ4jDtCHkwroi9/kjQm
         P1QUNHKva9mOz7nvDB7ZqI1WDJjuhg2oAVvECXOEvBWEE00c5Fpn9+bgbjAFZiUJkiRp
         O96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951970; x=1751556770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
        b=bqTIneJjgs363pu9x/5nnfzp2xqbpfKWbdG4SdxRlmEAn/mxjJBVG8fAXGehKmwgec
         vJiUBXMtRUpzHriOa0LeLoOCJZWhvOJ9JBF2huqQTGn7vp/aysKq+DZ9B+hQiV5Tyyto
         mPFAvIcHmNLyO0EZuypFLVqXQtcBkrYml3kHNnlfkaTl09Hsu4pyuJUBAaj4TdaexkaX
         atI7ebvx50TX6OTjn8krnvfsm9KhMLTwU7qSeAUgqiGxOzNYxgOVmyGkIWZuInuq2Mtn
         KelHtgRZ0IwPVIXbkFcpZYM//8UToW1wAZ4uAu4ZzGyMJaV2uN8YaA1yBwYypBGAURBn
         1p9g==
X-Forwarded-Encrypted: i=1; AJvYcCXI8rYGR7FeJABVNuojERe1l27nqk7Mk5hh08fwLE38jGn0N111J8EDC6lshKqE2koe3d2x@lists.linux.dev, AJvYcCXgah9cvBVsjoo6tk1/dLDl5KRlu9m1LDEglTe5RIFI0RiynQw55ONjFJTdWGAOXRCxqTo06XJllhBB@lists.linux.dev
X-Gm-Message-State: AOJu0YxWGpOm9rv1ckVqtEuhgF5INzHA5yNw8BUR/N+8yGcydKDNMO/S
	tGL78rlnh5zDSyu80A6XqOEW8IAWDEp1tFw9EP/io0VADbk1GhQXZDMr
X-Gm-Gg: ASbGncuN6e9aZMDlBkLUqP9ZP7KaG0cMI4RJdQkhQgENrBdPzcPgEnEkX3dnuCfN+fK
	uXREkUMmFFIG4VNX2z9yg4Uh/l8v1wT3EPxAYF9VYQNA+EF1VEzQZgYu/GFzzGhg+ZaxKJf72ta
	sAU1+p2dB/3EBGqcN+V0t6Qyj2W5klXWPxfkfM27Eh1KtovkK9LjkFAcB6TADbuNOntPPrrwh5K
	VAK6XyMjD36/ETM8DamDdj+yioTrIZotxGQWjBf4bAxkD4/fGCOpuL67aBgc2HgfevPiEEGDhYQ
	zopepydWMg87rId4M3DVOTw5g5g5Ny22OZrf+9a7SAJW82rL9NM4r3zvWT+DsO2SKGmpXOOGItO
	RU+UeOh/3V46nizmYfp+UGj5eWpeSeA==
X-Google-Smtp-Source: AGHT+IEJ8rUJC6ORRfCQpyeVpgt13wcImWaXJ02l+Sh7w1+4iNgFiJrQa6DpXH1RNUwTGuIGr0B3/g==
X-Received: by 2002:a05:6512:3d8d:b0:553:d637:1e96 with SMTP id 2adb3069b0e04-554fdd1d556mr3088387e87.31.1750951969599;
        Thu, 26 Jun 2025 08:32:49 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:49 -0700 (PDT)
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
Subject: [PATCH v2 07/11] kasan/x86: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:43 +0500
Message-Id: <20250626153147.145312-8-snovitoll@gmail.com>
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

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
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

