Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F043495CB
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697094; cv=none; b=JZRTngVNjL5c+/0GkaET0ge1YW4jdibHg7zlspkR4ZPlyd/BZLCIWWDIPzvrUarzzdQcPSAZyi9VNuOzyYw/RvKMGh1sox8BGH3tbkxSD4fDaI71e0IOn8gjs6004kDL13QPFaLUjh/lqRZoy4vDs8JfkRc5qTyu1e5mhm+FrYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697094; c=relaxed/simple;
	bh=O77XQ9JMYTXzoKUTfguzu7GlKy5KIOLoXNdE3uNoao0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4rwTF/d57ae00d5MZDtlAEwLgEnbBD5o6uWogq/zvOMaa3MPg89L6yu6zAHx9t7bbOaK2CpeL+e3UVdjlX6GPGSwGLSxx0P9C/0Vrm6jsc/3axtLvOW/bsrYDy3TM19HD6PB1/nBXIOJ9CIy3ncb9wND9gGnZ+bMUdVc7VHYsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=KaP6syRl; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KaP6syRl"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d8b519e438so1258886a12.1
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697092; x=1712301892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F18yE3QV4MW8RCzD1e25jw8k09/j20Bb+PnplrzhdA4=;
        b=KaP6syRlKqOXbcpjPKvmmRhB3hocsyWymBj22IjbhcEhooJHZZwFDLIN7QjZ8O1gaw
         xhSSZS4Eth7Ek/e2fViCQQHnxdJn54tEbt3ScQlXThUYocvzELp4pZcQzQWexa+VVA+G
         NvMEjJsz/h7ttSsjRYYgIrq8h7lplMNEcakyZL7cnIlEFN5XFpSB83aLrfc9SfDKAKwa
         POKQ7pmAEjIPbX6jEJ0m2PeILDkfBfSdFgUnOnIQ+iKui8Pf/A267DXSC7Ntr57HvKZC
         9nXIx9Ar+ur4NBkBX98gtOiw6NVFhFoneMZ1rFCOD5f534I5Ios4AokdUzOE5bqbUbWp
         SmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697092; x=1712301892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F18yE3QV4MW8RCzD1e25jw8k09/j20Bb+PnplrzhdA4=;
        b=N7ozsYdFhk36l1snQQlSedBatDZD+Tw2MFOeAP8YF+q8efEuJPa/Hk9hcDTJ27M9iY
         pqLxGiZAnzNgUyCTKkCCRDiW2s1ZEZjrxGdCWa4NjxSIiXuI+6UI+Da72ou0LvtN8TOH
         SewP0p1oFvDbIBStvTx0/k3nrqjLcptwMk5QgBSoJu+szOljIeLLUTDxCJGijYCaePiX
         8W2t2Jmc9GLvOlpNdZVgUibJXS812RKwzFOUDfV7rTa80jXg6IypFtZxQDU4JnjUAf5s
         3oCcrhAWCUUIdou0syND0jTUQ+pq2VPByP9W19bM/mdIdnZm0NBOQbxtRIwWBdiszUzH
         gSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnx39YjZ0I8Q5tBvI2u/ybqDa1MwhFO53qMpOjb2xwMAxq2q9SpN8Q3ZCVKcLQmM2yUxeG+otWsbdLT4iYPBPdApXq9awtylk3
X-Gm-Message-State: AOJu0YxpYnMBgRLUkRQIYvr8Y6LrnvepJW8PR6X0bLDOO286hYn7dRGC
	o5QjmLOilhC0a5Wdjk4l4Gx0dSEq88mv+91+s52y4BVZh8f04ECnBLmsq/EuTo4=
X-Google-Smtp-Source: AGHT+IFY/yzEzRZYFdEySbj/sKHZJd/DWAHR82okZCfCkYYQ9Rz+9YBmaRZXyDE1LpyvvN0Ey140hg==
X-Received: by 2002:a17:90a:fe85:b0:29f:ea48:25dd with SMTP id co5-20020a17090afe8500b0029fea4825ddmr1492025pjb.33.1711697092415;
        Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
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
Subject: [PATCH v4 07/15] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:22 -0700
Message-ID: <20240329072441.591471-8-samuel.holland@sifive.com>
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

LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
asm/fpu.h, so it only needs to add kernel_fpu_available() and export
the CFLAGS adjustments.

Acked-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v3)

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
2.44.0

