Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1E554736
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697106; cv=none; b=BPxyxu65HldFCuRnCQwvXkzdPImzm/ry1DMCYSY9dcmPRSAWtomO0hmIE+wjPIetOLQ3jxfTN9jHIZxT6YvKYvXqv/A9uZGQWNnz6F18zeLQq2usNtOfBkJFA9GtB05ftjuYrI3B1KHyv29EzEIRUFUqWAexjcwvyPjywAQFCGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697106; c=relaxed/simple;
	bh=kpa1yeFKUWqDA55hlpZXysxwBbXgX1S+zha/rueetK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VtE9RmMz+5uDScFO7CCha9g5urFSHm2mKdIQArd4EXvck5bsKf0x0FBNbEgdjDiHv9XdOsIrkxfZu/mNbSUcwghr2uY0tFXTfrUFgv4uDhP3DhOxazlBagGGkGiEm5qRtHkgZ6lBdXC48jVWLz6Rh3eo09BVnfQEGTBqhbfKb0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=RGTaA61Y; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RGTaA61Y"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2a215582617so160328a91.0
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697104; x=1712301904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxmfK/dV9iwtkx63gHffuqsF2FQECTKGikC6K6RCS1A=;
        b=RGTaA61YgjVoGPNJwDyGIQCkQedoHS/l/WgCBiY4dHTlqwYAxHfYoJE3RPwQW0bAG+
         5Rat45N6w6VIWootRhcUcl0+yparUCcx1M1mSjKcA6T9kXrWV6WKlpMNQcuyW59GV6jY
         xYG3QJDipXkq44Z40t14KF+8xscfiSZm/KwE8bSM+MDLCNxA7Jh1lo6IcNfAgLb3KoQF
         hGRWVsNdQfvSsPaz/cpiDQfdMukmLm/Mw8ILMVJ4HxaC2WtEBo2LaHkwILHjmp7yaoU+
         cEYnwLr7ekHfe0YXdFq2EwNljQdaPSThwGUISmPSljkovP5wCeTj1QYOQosH4/SZyjMt
         GpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697104; x=1712301904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxmfK/dV9iwtkx63gHffuqsF2FQECTKGikC6K6RCS1A=;
        b=rHZ6r783aFBgprChyFqjHWgJ2RM4DA3gpvSOKhC6QsnrN9+xUqx1Zr+Czl/daagqAi
         s34odhujSTGKFUW1Ue2phFFZBjGdIiIht7iryhjBIxckd7jqDMHxeuLUzWP62w1yhykk
         Pupo/lXWSTvPikm0g0PgiXnose6BZJ3EI26Jv3mnTwv3IzyTJPtm20vbYK83a0ZQKIJz
         xYW9kC+MaagK01XXGVnu4W7vnwrX6IFljkIRyI+dErLh/ozwfNt1wXWM1IZbZwHLnO6t
         hZ7Cpg7zfp6m/8pDS1BHWgRRCdv8k668JW+2kQwxgBrMGYCDj7rfac9AKwrXf6datNf9
         o07Q==
X-Forwarded-Encrypted: i=1; AJvYcCVF4FSRIfUluCs3dhSUSpyH9oLFQGBSyGonQ6+zgnBliVQVYx6E+39ZaXzaR9lC/FA7iqMPnG6yEMYZil4F1IwBH1r9ko1yTgPe
X-Gm-Message-State: AOJu0YynU7wdkYi3Ax8oPqqNNiV7bfMt2TjMIU5yAiGjEHpn9EF9UFjX
	i7vpGkXirvEq4nu+CZ2LHbHDaaSot3gzFv3KfF6n9EiDJsv+k4W4F3VSTzt6fQLaULpltA/YWSL
	5
X-Google-Smtp-Source: AGHT+IHpeVerdLnkB6vVIrwuNmVNMPefUfPXpMCtetpMqAC6/YKtxmEHNVWfJReDkAcL5lZnKsQNnw==
X-Received: by 2002:a17:90a:ff15:b0:2a0:4a22:3740 with SMTP id ce21-20020a17090aff1500b002a04a223740mr1338180pjb.49.1711697104041;
        Fri, 29 Mar 2024 00:25:04 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:03 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alex Deucher <alexander.deucher@amd.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 12/15] drm/amd/display: Only use hard-float, not altivec on powerpc
Date: Fri, 29 Mar 2024 00:18:27 -0700
Message-ID: <20240329072441.591471-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
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
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

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
index c4a5efd2dda5..59d3972341d2 100644
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
2.44.0

