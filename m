Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F29153590
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569730; cv=none; b=uS9iMb20g75GT0OSo38w0Oy5+2b5lFpwKxOjhL3+ah2WjHN9wWQgRfPdHjCY8hlozxgAT4ezAndJNTXkhMh9Z1/Ntzl69rC8sAHgYC8nUEKo9K464ys4JcDun7OJr7hPW0/xJtwfhG8bxCsIruopRpJZxIOzqBQWrnc7Nse3TFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569730; c=relaxed/simple;
	bh=eMQmSUo52FJHLb7k7DMqQqQuHAf5Jw+iP3bS7rkuvng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9TGRkz7FIPONFg5n7LBRtYOJhaTsgRpUcubbieCA2kjZ5n507UvK+Eu20gsY+00viuMdPeHWs+M93tMfDSlzdag+qfmh3zsZ4s0E2MHOoWpqn5o6rYuLnn494ACR4FLE1FPa2/TeFZwjvY5EKIGALwrd4gseGgPvdZvJxFV7vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Y9J2JbMm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Y9J2JbMm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e0f3052145so2329035ad.2
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569728; x=1712174528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZE0ell9od5iMx/niXSnkXHAkP7o0Zji40W4vIuo5Ic=;
        b=Y9J2JbMmDgYxGp3B+DJwD/XSjqgDBYCvj1bcE7LFErWptsf2eqxMFWXKZuM9xRrXFW
         8c6hJXNwLwIe9bT8Jisk8P86sWFOERWsIeHSPl+wEiIM/7/NqwrL3bvASoKU2B1LCoSR
         1/o+G01YJFhSKF0XzaNW2mrj8QeG8dQENKaX7kUlM1Uh8MV36T+JM20U8au4hSRN0zab
         wlzA3Jg/zmKGPtUSD1dnWRXV7xFClzQvrPw+vIJuJeNW4n3J27ELxAl3r2wVpa+WySVY
         frs9f47mJwXl34btWLe7F5gQAfUSdbMeH4I2rrmbvpI1oexX0CmTli1eJZPpwSyY9RBC
         YLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569728; x=1712174528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZE0ell9od5iMx/niXSnkXHAkP7o0Zji40W4vIuo5Ic=;
        b=s0VsdGvmabtG5VWgYWNgdvRLA9/fWRwUsN6Hq9K+8AZx39aOr3lbkUDj+V+31OwD9a
         N1fOAjZFzWArt0M6B1CRCORssg1Ch3IK+EQGX++tgnRR8O72cKAilwaZOWQpjJZPGE/A
         Bq0MJ6ZQGL8fwJrBL0TZpC554BikjeWxN9V5qEA10VFM3MWjZmtbra5DsN6zRvN7iUSx
         qthl07md7gZiVdlJzJuLvgA/lD+to+Icnw+aLVLiq3o68U+MfxzFlh7/16uIPlY8M1/8
         WwI2bj2X9XiyLTPy4NNcrP/mF+MmNC5IRgtF1cJ8ItsxR4k0NdkqCQsNh2l6pxLF7onH
         SiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkoCLiJAXQyE3DFnfax7aYSrlaalOuh4HbnGrKUWXTgIkyp0CfKESkg48UX9uSVL9Us7CNQJ2BsOAvofNXwBdEWGEixKCt3Ny0
X-Gm-Message-State: AOJu0Yy+gyQypgIb947SKL/Ls4MiwEg0+LyPTmkLj+pziy/RYy/2dWzL
	TvB+gC6uxisPPtCjIVJ5H5tGQ9Ru0NILsOOZ8UjGPoqYYpNSAkcLfH9G+1BTh2Y=
X-Google-Smtp-Source: AGHT+IGM9v2q1Bg0jHlsJFItc73WPBzqi9soPcoc57OB2ZggdclEbNRISa4ohk9keY4487ms+Vhuaw==
X-Received: by 2002:a17:902:d4d0:b0:1de:fbc2:99f0 with SMTP id o16-20020a170902d4d000b001defbc299f0mr957547plg.2.1711569728307;
        Wed, 27 Mar 2024 13:02:08 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:07 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	WANG Xuerui <git@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:38 -0700
Message-ID: <20240327200157.1097089-8-samuel.holland@sifive.com>
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

LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
asm/fpu.h, so it only needs to add kernel_fpu_available() and export
the CFLAGS adjustments.

Acked-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Rebase on v6.9-rc1

 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/Makefile          | 5 ++++-
 arch/loongarch/include/asm/fpu.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a5f300ec6f28..2266c6c41c38 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -18,6 +18,7 @@ config LOONGARCH
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index df6caf79537a..efb5440a43ec 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -26,6 +26,9 @@ endif
 32bit-emul		= elf32loongarch
 64bit-emul		= elf64loongarch
 
+CC_FLAGS_FPU		:= -mfpu=64
+CC_FLAGS_NO_FPU		:= -msoft-float
+
 ifdef CONFIG_UNWINDER_ORC
 orc_hash_h := arch/$(SRCARCH)/include/generated/asm/orc_hash.h
 orc_hash_sh := $(srctree)/scripts/orc_hash.sh
@@ -59,7 +62,7 @@ ld-emul			= $(64bit-emul)
 cflags-y		+= -mabi=lp64s
 endif
 
-cflags-y			+= -pipe -msoft-float
+cflags-y			+= -pipe $(CC_FLAGS_NO_FPU)
 LDFLAGS_vmlinux			+= -static -n -nostdlib
 
 # When the assembler supports explicit relocation hint, we must use it.
diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index c2d8962fda00..3177674228f8 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -21,6 +21,7 @@
 
 struct sigcontext;
 
+#define kernel_fpu_available() cpu_has_fpu
 extern void kernel_fpu_begin(void);
 extern void kernel_fpu_end(void);
 
-- 
2.43.1

