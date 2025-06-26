Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2989B2ED867;
	Thu, 26 Jun 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951941; cv=none; b=XwXDv8+tYX4GXFpHyEo4DKFnhNOo9zX7RQ3u4w4Bn0rAMyCwfTH7kqHDWhDXRSK2kdChHbI3x/IHOXnzWRP0WaH9HdqiZbS6pxK8YxMY1h4OnVzPbbkWozSV5PqvGq0LEhMtLbI/8Y+0q1vpGekabiS8IRoyAsHDg63eN6wkDc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951941; c=relaxed/simple;
	bh=sGXp482ePzEbOSqj6Oo7pSTRt0qdWiaHv14lzRVBHx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/mOttEpKb/MQltYrJqV0Oj3SML2f/sY3QISPMNJP8dTm5RxkAP0WXWagTCkWBb/GfTkNuYvgsG12/G9+yqLzlpCwj5gULow2WcDlWpcy5sTNVuvFOWEKwTABXSZFTqxJq0F0UvB1vbKUsIjYmOkcmTLOlD9KCVSP5XmXM2DUUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/CAD9SN; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/CAD9SN"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553d52cb80dso1357476e87.1;
        Thu, 26 Jun 2025 08:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951937; x=1751556737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
        b=c/CAD9SNl68uhZhiI6aUoOcEHBbkeT1udOShxXNclncYjEQJ6ei+k66h6fJq2Rsp7f
         aL1wvq8y/jG8JQXbSyIkRzof10+ywc/vrDfjVOPpq7Id6OPopO6qrrn/JM5+YBWbP69J
         0pj2KQFrp8VfQ0eNUqiuuZNMjA6VvrFk3JPzx0lc18u8MF8CJP716LPP5e1X7QQgUGG9
         x0Z4oAi0s150SbFXRx6rn8/5z8c9yrpfR+ll6yf/5eqkCdFh0k87SjsJ1x7wbNwnD0Hx
         cL0ZI9AU5jhm+sa9/x0UEwy0IMjaj1NYbRe5e+372ZXQFTt9pw+pPxH42fLKnF6rx552
         Ea0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951937; x=1751556737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
        b=BI9JCLTki1wg1Z46wHJ4axzI7l13v0gXUtXOXNAgQXzM4zE9uqQQykIH/Tc64ciBXU
         73qyTNdjpxaIuPes0Yqk+ZOrl6IFE/XU5IV6qmgHM0V47j2VW+QmN88yQcXpJYeO+7NL
         eTD3w7nFYLZRct3M6OM6jUqL/7MxJHbXdF2ixeI7ykRcJVOSYZHJ4rWzMI29x3zTOY3z
         oPL3i2tTQaDqbVJNiT6oaTNQWSZHRIfmn9XLwuIyyJYPE9rfC/0E3HvBmmCwrNXheldq
         cXnEVkUEjUF/UAOtKDKIp89e59kr9KzamekSYhE/TTUjuqjwoa+xPkWj7pKuqKs9oWsD
         3lFA==
X-Forwarded-Encrypted: i=1; AJvYcCU00sdhjQ+QFMmXdOVcgSdQ5VouQeWm1ftKoENCUqiGaQ2hZMhq241+C1qogPSCpVuJiTXr8LP7xnhZ@lists.linux.dev, AJvYcCUsN14/cPtUTsi7GDvaL+pHAhZffrelf0RfplG6G2c/23LmrmpFyMeYHkI1TIAsSc1R7Sez@lists.linux.dev
X-Gm-Message-State: AOJu0YzpV5Lh6bH2UG0UShIbXnrMneW0HUWs786VcRZOT+SdMeaq4t6T
	zwt/kNv/FYMuI94EcWYBNydWR2KGXY6YhGLEfm/rGy2P2N0e3Y4mG9HZ
X-Gm-Gg: ASbGncvTJ4i7VaD299wSuG/16hzOjg1M8prKe4SC5lz/PwIle+gyJoU2N0RosYIZcXM
	DcEIXwY70KgJ6l9kMUNUe1QNPxTnN3HkdXxtySTeWz4Bm5fQ4ODI53MuSnkZHvTx5jskqq8Q6L1
	nzS8HBUlcyr7zBIubdjSJ7O7PYlwO20bwxJrVkWCglQtiQRcbxCgMbb1g1CRlrbBnZx55qxwdvu
	klsjYEiEbWlc8Nc+BmYdZoYxfEUpkEu0hw7BMdkRhVKf3pj98IzWmgH6TF0GMhxSGFNPTyqLko5
	ZAXcZ5vRaltM/Wb07DQ7MU3msJUL341UzZcIxCkjNQD3mzoSTYX5rhtv9mttA5kr/9jnzzu70L7
	ovhphb7dCFTNkPzV7VH4xrG/njQBYxA==
X-Google-Smtp-Source: AGHT+IFV82PjQkEQV8pwkpgH+uEG2XxjLf7tDKt0/XCF6qX83TTzJXquCdeUIk26UtVJ1dwuwllM0A==
X-Received: by 2002:a05:6512:3e0f:b0:553:cab0:3800 with SMTP id 2adb3069b0e04-55502c95046mr1480652e87.14.1750951936982;
        Thu, 26 Jun 2025 08:32:16 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:16 -0700 (PDT)
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
Subject: [PATCH v2 02/11] kasan/arm64: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:38 +0500
Message-Id: <20250626153147.145312-3-snovitoll@gmail.com>
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
initialized in CONFIG_KASAN_GENERIC mode, otherwise it's an inline stub,
and the flag is enabled in kasan_init_sw_tags() or kasan_init_hw_tags().

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
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

