Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B5B882D
	for <loongarch@lists.linux.dev>; Thu, 28 Dec 2023 01:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dI/0nhQj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6d9aa51571fso2622445b3a.3
        for <loongarch@lists.linux.dev>; Wed, 27 Dec 2023 17:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727757; x=1704332557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Nao5aFqcs14j7uzTeCL4obzFSkk9OE7jeAS4fIG/k=;
        b=dI/0nhQj4eDwLp66ALjHdaGvq2UvhCZDLZyoVel4Y9Y6Hr6Kx+h3bl3gDs9toN6Pvc
         hOhpSO9zRmv/oeo0ZCYOBbnJUrXeBp6adFeStfUtD0j1W6uXep823stJn09wmUJ2L/gA
         7igosYZNT3RffdLRt+8083cLZ4bDqj9HNgGyCp7hHsxcJs10yBdaeMCVGQYoId9+paqN
         WDDfsmWusuu+B7/HSsUUdzO8CGR8hDJG6u3p2ut9+q0u73pgA6bDcZDXKr93rv1GLQtm
         h1WsyhYLLrM2LYMemdGzPSg+Tq1IoR4vvpm6pyFu7UmMaLmp2tAGZ7xQcLrdPW1y4DML
         lW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727757; x=1704332557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3Nao5aFqcs14j7uzTeCL4obzFSkk9OE7jeAS4fIG/k=;
        b=Lcw97ESIlLN6X7iK1KBEwN3CK3wH+/kdzAgKwG9mG4kClJARQT5ZqRCgJYHZQzTRlj
         k87Ngt0Ko9y9voOeUZjXHd2GlYVXvwE3RDJl7hG0K5ukV1LZzo2Rr/FwAD7PEIMPOakP
         Xcp07KUMT+hAzIE4noBfbg0VfiPrUBeucISCwcqEyahJyXjW48IsGY9HydjPtgnsT4wm
         zMYEx6Yria/Env5qwW9ZBQM402RtljgTN5fxgBTIk4O70aSxh4+Or3Bu/VwZiQEFIRhG
         2/nVQGKYJs589b7yXRC9kp3ZZR+qiXysuykNFNduCqnOm+whN8x29qOQt7erSvKFj4Fa
         lIkw==
X-Gm-Message-State: AOJu0Yxv3WeJKUhVahS1w0T85Ziya+OWMw8zsJVdJ8Dl8XRb1oOrt+8K
	FeBFvVHKjzsv/O+6zcBdMpFVNtyZPpqGlQ==
X-Google-Smtp-Source: AGHT+IF6EDv76QAoc6OEmsqDg21WkjdveqS7R2bB/shYp3RQfsvs+Kqk+D0lgj6bhfU+kuxRie9joQ==
X-Received: by 2002:aa7:91d5:0:b0:6d2:95d4:9c37 with SMTP id z21-20020aa791d5000000b006d295d49c37mr9390922pfa.30.1703727756811;
        Wed, 27 Dec 2023 17:42:36 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:36 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 11/14] drm/amd/display: Only use hard-float, not altivec on powerpc
Date: Wed, 27 Dec 2023 17:42:01 -0800
Message-ID: <20231228014220.3562640-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Ellerman <mpe@ellerman.id.au>

The compiler flags enable altivec, but that is not required; hard-float
is sufficient for the code to build and function.

Drop altivec from the compiler flags and adjust the enable/disable code
to only enable FPU use.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 12 ++----------
 drivers/gpu/drm/amd/display/dc/dml/Makefile    |  2 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile   |  2 +-
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 4ae4720535a5..0de16796466b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -92,11 +92,7 @@ void dc_fpu_begin(const char *function_name, const int line)
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
-		if (cpu_has_feature(CPU_FTR_VSX_COMP))
-			enable_kernel_vsx();
-		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
-			enable_kernel_altivec();
-		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
 			enable_kernel_fp();
 #elif defined(CONFIG_ARM64)
 		kernel_neon_begin();
@@ -125,11 +121,7 @@ void dc_fpu_end(const char *function_name, const int line)
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
 #elif defined(CONFIG_PPC64)
-		if (cpu_has_feature(CPU_FTR_VSX_COMP))
-			disable_kernel_vsx();
-		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
-			disable_kernel_altivec();
-		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
 			disable_kernel_fp();
 #elif defined(CONFIG_ARM64)
 		kernel_neon_end();
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 6042a5a6a44f..554c39024a40 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -31,7 +31,7 @@ dml_ccflags := $(dml_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
-dml_ccflags := -mhard-float -maltivec
+dml_ccflags := -mhard-float
 endif
 
 ifdef CONFIG_ARM64
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index acff3449b8d7..7b51364084b5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -30,7 +30,7 @@ dml2_ccflags := $(dml2_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64
-dml2_ccflags := -mhard-float -maltivec
+dml2_ccflags := -mhard-float
 endif
 
 ifdef CONFIG_ARM64
-- 
2.42.0

