Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B246FA6
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 05:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MAXg1HO3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c5fb06b131so1246106a12.0
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 21:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014904; x=1702619704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT/f+zG+eBk9GDNM3PRDRS7FWs4vWVwDUJpda1v2enk=;
        b=MAXg1HO37L0Vjz6LCfUu9eBUTT+ob8tskzSSKkDNhzT5I1gIRyY4/T5gf4uizd1bBY
         GBQsrKeIms1F6si6eh/0ey/doIQGgYQksPEiP7/Q3iQPySG5rHtkw/QKyBa4bjm43T6V
         mb0gWcF7CfDt41QyWWFCa1+WsrU1rskFJTfoLJP6T1FZsy8ACm5Kof8LDoVOfo96mi+I
         qQBsZKCb6O2bYkBMjE4ZKpu4iKtQbPSpp41aFTfVOdDWp7d0gv6TT7Jmjrq4PQ2uxXLt
         lSJ9e/a8zhlRznTHUb8Lk0zkUlpphQbyJLfqqF66Lxn0Z/BhCWPsCBUNdVPFyzPuoHhm
         CM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014904; x=1702619704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT/f+zG+eBk9GDNM3PRDRS7FWs4vWVwDUJpda1v2enk=;
        b=SX8pzQeaFAxBTRz76yLNiKvutejbqt8SypvGeMbAr8NEUeoC3MVsE6t4awknc8j4Y8
         cdECVTLPhfUex0urjPMdxqkB1mn9MIQmJVeV2iFNzEH9wbdqHKKck0t5tFT78klLluU+
         a0jVplhCHSK2Wjmw7GHzcA88Y7FQ+9ZwBTp6Gi2t7ftqAgXQ6e6uSlXL1WLJ089qdx41
         eM+tYeEgDI+g6TddxjPK1n4ZRGMatQvP0rL+16RDFgoKC4CRWfeWS0QulF8uFFoTsyli
         MTzCJ2k6/rgeIIBW2+/jl8EQp++FgFmsYyVxrmNGgJZbCdgMs+yx7kVc/RY0j/GfCXLj
         7C8w==
X-Gm-Message-State: AOJu0YxVR+tVFtilnMk2Lfllo5GuQA5+6gPlHGbEZ1wH6I2mIiI4FN1U
	NmyWw64AoWzgFWoljNB9ZFjp/A==
X-Google-Smtp-Source: AGHT+IHjHZOPQupU2gBIY1LJy6ZLE2Spe4muScdMLjHj9er/qEsoCLB+Of3eLXhwYzBMH5NUihe96w==
X-Received: by 2002:a05:6a20:160a:b0:190:14d9:4797 with SMTP id l10-20020a056a20160a00b0019014d94797mr1355279pzj.4.1702014904099;
        Thu, 07 Dec 2023 21:55:04 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:03 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 01/12] arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:31 -0800
Message-ID: <20231208055501.2916202-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several architectures provide an API to enable the FPU and run
floating-point SIMD code in kernel space. However, the function names,
header locations, and semantics are inconsistent across architectures,
and FPU support may be gated behind other Kconfig options.

Provide a standard way for architectures to declare that kernel space
FPU support is available. Architectures selecting this option must
implement what is currently the most common API (kernel_fpu_begin() and
kernel_fpu_end(), plus a new function kernel_fpu_available()) and
provide the appropriate CFLAGS for compiling floating-point C code.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 Makefile     | 4 ++++
 arch/Kconfig | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index 511b5616aa41..e65c186cf2c9 100644
--- a/Makefile
+++ b/Makefile
@@ -969,6 +969,10 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
 export CC_FLAGS_CFI
 endif
 
+# Architectures can define flags to add/remove for floating-point support
+export CC_FLAGS_FPU
+export CC_FLAGS_NO_FPU
+
 ifneq ($(CONFIG_FUNCTION_ALIGNMENT),0)
 KBUILD_CFLAGS += -falign-functions=$(CONFIG_FUNCTION_ALIGNMENT)
 endif
diff --git a/arch/Kconfig b/arch/Kconfig
index f4b210ab0612..6df834e18e9c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1478,6 +1478,15 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
 	  address translations. Page table walkers that clear the accessed bit
 	  may use this capability to reduce their search space.
 
+config ARCH_HAS_KERNEL_FPU_SUPPORT
+	bool
+	help
+	  An architecture should select this option if it supports running
+	  floating-point code in kernel space. It must export the functions
+	  kernel_fpu_available(), kernel_fpu_begin(), and kernel_fpu_end() from
+	  <asm/fpu.h>, and define CC_FLAGS_FPU and/or CC_FLAGS_NO_FPU as
+	  necessary in its Makefile.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
-- 
2.42.0

