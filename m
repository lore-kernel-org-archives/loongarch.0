Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA7153BFB
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569735; cv=none; b=m8puZfOIJVmQWVqTnk2dW2f9kNqyx44hvikJfrjZZNdHfsnNjG+CkuCZlSJrAxV9qWCOxr9okfVuGLLShIHIzhi7qEVXGgEjSNeCuRf0UfuZ+YwaMSgHpiZVpdNXQ0tJ1ZbNzio3Fh7db4Pm0kTQPHRdW1iihlzhhOeMloxfVd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569735; c=relaxed/simple;
	bh=91qMtAnZtTeg2i7QDjR/G11+PwQHwDTtJmPnZfMaIks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4C44Keu0UY6bG2Y4Eweq/k7NL7zHSucrlrcTi3PRMw9E4s8LD0+gYKaUG8x18tyW1RypHvC/N01xHK5zEJtJ2liGWEg0JVfoKvUlhXMfuIBZm5dn8fsQo0Qk1hbArFvPFL5dcTAKwgtVjeXUk9y0ASSU8R7pkLxRcPUq9V7yg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=mtflUu14; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mtflUu14"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e00d1e13a2so1946975ad.0
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569734; x=1712174534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt5T6f5KKlAqEBrctbVWHiZ4yWz8xGfDOuoPShtqdto=;
        b=mtflUu14+egBznzYTcD8KK8ddMMZTsNi+yhlTmZ4C1c4A261BJZcUKncm+x/0rmBEQ
         rhkJQJflEB9pNIYppXiGNuwqlHXUBk3BtQxGGjdRjsbzlGlxybV3zZ89MlZZoOr/MgQh
         pi/FJWyqDJufZaVvAZewbPj6FXPEcwQFrdKjfW4rVz5d+VRvqtDvOJ/ObmAtxpmsL24F
         ZEVWhQmTYTddQ2If7rxikckzxQ/gMjQQpWwNTh1o18vcDytSpxOJ8omtS5gwmmHZPPwv
         gVT6ZBQOsV6MEB6VeDeaDkMYX3FjSVeroeKtR1stt2Ntk8j+v7WFQtdQLiseyOXfHihW
         9gVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569734; x=1712174534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kt5T6f5KKlAqEBrctbVWHiZ4yWz8xGfDOuoPShtqdto=;
        b=GWZlAMoL6L8h9MUWRM9K0b8C/Ps3ln6kQAb8dyeNINURR/NLlYvxqTTPztqWzjRkKU
         DP/Rg13bJuJf++wZQSzHvNwjYKQeGHIv+LnVIDkNDPO5cY+sqEYgefA06QaI+OV7/fQo
         h+73f2htmIDdBCVNsvtFXdQEM7HR4Zc9zoRzcDEDEGC+5ObwUySMLx75wDDrEtZPTZOm
         7ZYObI2knP6pf5imTgHBM8CfxD9JHoTo1Zs0fUy4ita3JMex0zhW8al4ZaiDqdPumY1Z
         q7MgoVENkeNSC+OJ9rz9WJ+eQUHZ4USMBUSpPoFAxgccNjbowkEeqRkjFdFE0upucy01
         yQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmAO2ScsIdwAVVeHiGCzZCWZ42VoX6TFQAMl9YQDa5mfNZorJ9u5hx7+4afUX2fmMo1VScQXc0IP4PouplexLY7ZLrOf0LkQpN
X-Gm-Message-State: AOJu0YyAhkJjforwKCUQ1Qti8n+w5ZQV1XPwvl4Fk6XGLhyn6U9mgF4M
	aC5RzyBwXPvN6JG6gNX4rOL5E6czGNHLWnhHxDJeDlREEbw1JjnFIaj0k5o6kSw=
X-Google-Smtp-Source: AGHT+IGvbXfMD3NpHBvc61C4JrxkXrP2UbmyeCXEZSqIACFIDKyEi0FLcpBAl7w+qDDaJ12IbzUk9g==
X-Received: by 2002:a17:903:1211:b0:1e0:afa0:cc9c with SMTP id l17-20020a170903121100b001e0afa0cc9cmr851093plh.2.1711569733842;
        Wed, 27 Mar 2024 13:02:13 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:13 -0700 (PDT)
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
Subject: [PATCH v3 11/14] drm/amd/display: Only use hard-float, not altivec on powerpc
Date: Wed, 27 Mar 2024 13:00:42 -0700
Message-ID: <20240327200157.1097089-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
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
2.43.1

