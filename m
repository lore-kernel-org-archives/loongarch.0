Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D02C29AAEA
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845187; cv=none; b=dfXRTU7W6T8iVF9091g/tRwzbESr/uY0uFj1xf7L01GMeqWop1L6Ond2rlAl/svaPijH7Z3V+Il1LSuM/z5byV8Gv2YwV0pdZHr4oMqw2C6U4s3xSpsgOZAkDLUi2pviSPGMOXhOJoV/Mi6bXz7MgBu6/4/LlwMsdeiOfbxFY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845187; c=relaxed/simple;
	bh=sGXp482ePzEbOSqj6Oo7pSTRt0qdWiaHv14lzRVBHx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gYSOT8yanxdOy0LZxz5VnzFGqjoRJF64etzXfACvzxMKBYh2NrkBp1FPHIJrVybgeMaa27FI0Ve9mi9XpmFYRq+3d7ANSA+rdX1OUmKJK4ElYz2WqjGYRyl1nBE/V/cuKFKuRk+LF9YTSQ1IGdyi0Sze7QWGO5i9EMqkmaKKoPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZtfKGyO; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZtfKGyO"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b3b250621so12818721fa.2
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 02:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845183; x=1751449983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
        b=WZtfKGyOwA3rhSFDa0d6V+THbGXmNGsKwE5b6oD5t6E0zfV6r0Swv3W7IyJ+FRmeGg
         EYf/cDvPgBTyfWEzNsInu/WtMbB4K4COUkOOs2mUqMRwEYAsRARTYiVXpcvvztH/fTHc
         naMt9y/LtY3QYwUNSboTTcyG4EaVJBSLj9Yb+/JhJea+vPvzrrJy6oSKrBWb/nZ25vvR
         VMWYvP8071/0U5wGmCKYAwWSFw/U/4asN+JB10coDHrtuSNXDygTVYHhSXfKQ++sWP2s
         SJnkz7Mgr2RImJSfI+ynujV8FfH6VsIT6J+7Me0nZqNjOqZwBls0MMz4KQkWSqQjX3Gp
         8eSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845183; x=1751449983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
        b=t+L+54DGDLt3i0E+rmCXa9QZbHPAFa96+IfxTGhFAHIiObmqiCyzf8C2gA16/qjCEQ
         0o3v3xGiy4dNqXCrvuNpcT+bR48QtN25IStW7iXvI3FyUFWvdLLEd3HczGnSQmM8vjKr
         nGWcIEDfXOOVrC07KPs26KUjSHMBEAt0pBAJSRA/w6DSPYXnrpUhzy8P2wJWUVztyYFl
         xQm/evkqoBZeICvjYTB1Wk4BATF4tIbFdAlVduCy9K+yznJAjEjURErPrp1uJqchjlk9
         6hJLLSC8LOo4TE2phbpOOVGcMN9qr+ajJ7Xvu/0EP9LwsbfeBqxyeHz30hGK71Vnd2SM
         upJA==
X-Forwarded-Encrypted: i=1; AJvYcCUwQVvCptaYzgY0kcLpbXDUfQw2bnPWa0MXaBX6RboYcNGcS9rQ3GxnnFrU0748RiBU+ciDsJGT5wY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMbQbc71ViySTsF22z+Vdsb9epxdiNI5oloZvzQPqvxXuuB8/O
	ARzpGUMs6Yc1vbGrQfqcAw7SVtti9FhNqImBGbiPzI2zp7/UnojuAQoi
X-Gm-Gg: ASbGnctYOJn3zQemUFhbK1ResW9XCP8YE64mIcclXg6i8Z7xIfoCbWUUo05TiShVNqb
	ZT7eNwqnzbx9wgOG2yv03Af0IRVHgD7dFdXWGsepYQZmC4kjF7xktux1IdVoBNs+Ls/qFF3anBy
	miqf76PxXJXGKXZMcDRwN54DI7qpNy8aE4c6u9XI2C8E8SdEk72DA+yTe2kJf+l9J5EthhIyKDf
	QYh8t6YAYEGH6uSuTiajqisUookk97d9lDDD3g2enZlcZMi0lokSVQNS2kuoHbuFWSEfpjY3Kel
	cPE3GRkIzfKnfkjKI6qAEL42v8oi+7VLqNsyOO4F3cL89cDBlVT2OpkFZcnSKEKmGZRcbFrCfeU
	n7xtaqf2IxfU+12ca2i/0m/tiyCT8Tg==
X-Google-Smtp-Source: AGHT+IFM+6Gp9FKNRVxfpjNXcdXOUjE/qQpWABAqK3bSElIsQlHP18BbIkRAqZ9Oq2fiOL+vDX3DJA==
X-Received: by 2002:a05:651c:e11:b0:32a:714c:12d1 with SMTP id 38308e7fff4ca-32cc649716bmr4987311fa.1.1750845183165;
        Wed, 25 Jun 2025 02:53:03 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:02 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
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
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 3/9] kasan/arm64: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:18 +0500
Message-Id: <20250625095224.118679-4-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
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

