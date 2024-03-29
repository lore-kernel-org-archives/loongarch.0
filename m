Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A9446C5
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697092; cv=none; b=hRKqPHlmi+MZs+HW2mbpoddcCHZ9+Dt1KeaYddFds8jfuuPkiz7aWcVZbF7LHQ0SR3NDMoozuibOu0ovegsITUDi5xZ55abR3chKyLbRUSy0hS2Kue0/xpoRLq7BH12Bhk8B+TKmIdjKZJ6jIx0rTfqUby+thuzEeTK+fB1Ys1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697092; c=relaxed/simple;
	bh=f1Ved49IBgBs8V4O2Ps9VgHa0Mf2aY/RBhmEBJyNCVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JN/CgMoQWV6r0KAs0ZwLFBAAdb8R622Qf28CKufbvRGe69hxiax5NNZ+2jYjA4V3tT+QaOLvf0PiBw1aj8B1eenYr5nGpz8quTmwmsWPvOOfR1vI+qdGcqcjYIrRxc7lb2h/4U2DkmXclYtGyOO66BpfckwveTAbzUW1hC4cOHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=gvmD/0SP; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gvmD/0SP"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ea7f2d093aso1733538b3a.3
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697090; x=1712301890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPRyZsExaX9jqH4yhl7xuz7hAOg3yG/uDoq2R6sqbZQ=;
        b=gvmD/0SPMbh6NXuYfy7XYIxzA8+SpDm2nWHsMGtJO+bkI3EK8TNbwKGJgLUz/K09lm
         XP/ktihgA4GV1wOvXdyOxDf7mhdsBHk2fdjutZ8dxOQ/0x+jdzzMuvfSBsPnEutfSp5/
         myYL8WIfy5uCU/dssm44klMaTSq3cnuc0G11u2pAelJPUWKmc+Kc+2DrPN3sT1H+kvKy
         /7LerL0D0iWIyqDuHs1XvoiVIqDRW95mpV45Zf8nra+QW0cfN/jP3lHHKPBavbxM+Inx
         zxKlcwbzywLhPqmmT/rRhbRmEyUWGEvaKGQtV991fEzXDIIhBD9qw5auFKdIfBAF8Rlt
         Lwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697090; x=1712301890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPRyZsExaX9jqH4yhl7xuz7hAOg3yG/uDoq2R6sqbZQ=;
        b=sph7FoJjxDz9++Bj++NjLN7/kOnsy5pmEbcP+fAzBGav4brEc3NQZNHEApi795FbzW
         Az5qDL89iU0dA+jIICrr/qyWOSbxmsZRSRX5SAkdgawA/D44+HZabqP317SBCn2kZPgn
         0g4OVpr6KNQJPMgvGyV65Ary0CO3yIRiU4j7WCXa3d7d5xgceKG4ymHphkBa2/7yoBLN
         1d1ieAgJpoxis2BlNcswmIhD1EwfJjZ0kFkYdbqLNdAHvOyd6/oEyiOhejrjCawAQjYd
         iG+7QVrS8QNY5sx68wiZI8EOZBcUmtlYp3tiwBwv9LTnfv+6fDWQpubWLG2EKOblXoP/
         ZxqA==
X-Forwarded-Encrypted: i=1; AJvYcCWsVP/ls2YpscVfAJIdnfCLEMSj7mXjmxGYpVJaWb5i2A/NzBiF5NcWwR/BGp995lASYofVE+PwfYfboJ0tHHjIo/CdxH4HM3E7
X-Gm-Message-State: AOJu0YyGyygGQQJFU+N1cFWVqNu4REMVgDPM12Rt0VOwVtwRsFi45+Ie
	3OhhphbUtUAy4aNulfOHDx9CA4BonhbAVH2ftHu6CKRHXSIM8qvxg1brWg5RzKQ=
X-Google-Smtp-Source: AGHT+IGTP4+TuVjePLHUufBWyrdagoR69ieuL91+Fm218jTRMOa2nDQVrtkL7zzrGfUrh4aL4xmRCg==
X-Received: by 2002:a05:6a20:2db:b0:1a3:71f7:df3d with SMTP id 27-20020a056a2002db00b001a371f7df3dmr1114388pzb.30.1711697089806;
        Fri, 29 Mar 2024 00:24:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:49 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 05/15] arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Fri, 29 Mar 2024 00:18:20 -0700
Message-ID: <20240329072441.591471-6-samuel.holland@sifive.com>
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 arch/arm64/lib/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 29490be2546b..13e6a2829116 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -7,10 +7,8 @@ lib-y		:= clear_user.o delay.o copy_from_user.o		\
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON), y)
 obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
-CFLAGS_REMOVE_xor-neon.o	+= -mgeneral-regs-only
-CFLAGS_xor-neon.o		+= -ffreestanding
-# Enable <arm_neon.h>
-CFLAGS_xor-neon.o		+= -isystem $(shell $(CC) -print-file-name=include)
+CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
-- 
2.44.0

