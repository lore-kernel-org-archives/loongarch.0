Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB7B47794
	for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 07:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711697093; cv=none; b=iOvXLFSfMsu55LigBLSLuSrnbVYRFHLxCZ+8J8otb7KRKaHCSjnkeDTO4dn4AM4dmzzLhyOCZjFXjoZq41WN3kQNX05Oe60ffNcLfOw8Eoj99SjwBvWwpm14V3YfaLBi62pOk/I6gJRdrV/oMXGOHzMPImIocnXVmMuEXJv01wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711697093; c=relaxed/simple;
	bh=gxAW0DTrkLtRtKQJA86gMhjr+tKNdgSukt4KSi/OgcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lh1RimsZNoe99o56ac9M4+uT1EXAALHQUomQvq0p2ItakErnFDdRBpzUyFoFaBHw9Cf0u7jnRgCPduIIRCIi1alPKz9uOioHE2UTgJIN1/I4l82mIIFvZUxtNDHmFvUsZjaBdiu1i5wcPcXVhIA0cFJPQvPXEmXCk8mZ/tVegik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Tj9cF5+w; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Tj9cF5+w"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5c66b093b86so2043432a12.0
        for <loongarch@lists.linux.dev>; Fri, 29 Mar 2024 00:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697091; x=1712301891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqbtCYy6rKAgoCWJo/IDkaQi4Zmy7pvo/Tw1FadjoIk=;
        b=Tj9cF5+wTo5iRRSTyjtUG9qyzoFMxSIr7zVdT2vdNM+OEbo6IuftRfACLS6A/V0ioc
         5JiL8LgUVDEMa4KPTIU2X5cSucdmwYUgX6JGxQiRK1T8iNTGFFpXX3ysOH3SO69M2Akw
         NHOGAcTNwmzn11kox6FhevLmm+0hrB7SMT9F33IXm0rO67/J4DtZCuGN/7ezgzQsfyDM
         GUDBntyd+gYaiLvifFhGoSnlyFE9yRlH5Al++vFq+Xa9BuSVclCLLmoJk3Hoh/+rVHz+
         l5XAGwLYvQPqdnqGkFDfaH1AsKVYv4nJpn6kEV03KegPrnqqnz9qoq8k4p7oPjYvzp7s
         1IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697091; x=1712301891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqbtCYy6rKAgoCWJo/IDkaQi4Zmy7pvo/Tw1FadjoIk=;
        b=wAnyykHIrLYAA8ZtHsrxG7ijC7gX09XPYxvUbRaYbYr0tH3ORC+X2JYLnhtHMtOQPr
         qxLi/qWTtulhrsblLNY+A/rINzOXLdVvwv9clCr6Tw7NgeVZhSaNdb965USCmeea0gQJ
         iOGCSj1bIsa0w0Rh9aKqSBzJGR0k5ILbJGZIwqjBS071ENST5spajzMzU0wcXF7JJeEU
         pOF3LVEuPe7GaTHRANUzsC9JxghOenKRMtXZxxjzF1qZSoMAPNSi4WAnIjSozw0eeFv8
         xdnMhV84dzYjTAuLe5JJFlIeLRwp9Uq2HLHTytlLJoyK8pPe+7YjFO7chuToHIUtJNPV
         ThtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1lQvBoFI7WCb2B9wuKhUZGsTWlq1NOUmdfOKZyawp8k2KMLgxcDGL1esSyZNW3FFjVcPPr4dEp1nIVQDkfx9t3qHmlsEgoSM9
X-Gm-Message-State: AOJu0Yzf1F57qDIHKOKkBLlUIfq0fDqF+mgh0qW19ZJBFSk+cz7gu5Q5
	mUgWzKJDaCf4bJtLhfSORjgfg4Jt+skS8MQy59G8COpce4fvtznNMbDOG6zVPQI=
X-Google-Smtp-Source: AGHT+IFpgVY+di4cvDttsjDdGENlsS7ZbuG0wU7DGKwYbCO2yCZHbkcZgR0Ijs83aSucHtPBLyzxXQ==
X-Received: by 2002:a17:90a:d588:b0:2a0:3b1d:7c5 with SMTP id v8-20020a17090ad58800b002a03b1d07c5mr6633406pju.3.1711697091135;
        Fri, 29 Mar 2024 00:24:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:50 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 06/15] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Fri, 29 Mar 2024 00:18:21 -0700
Message-ID: <20240329072441.591471-7-samuel.holland@sifive.com>
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

Changes in v4:
 - Add missed CFLAGS changes for recov_neon_inner.c
   (fixes arm build failures)

 lib/raid6/Makefile | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 385a94aa0b99..0e88bfe6445b 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -33,25 +33,6 @@ CFLAGS_REMOVE_vpermxor8.o += -msoft-float
 endif
 endif
 
-# The GCC option -ffreestanding is required in order to compile code containing
-# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
-ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-NEON_FLAGS := -ffreestanding
-# Enable <arm_neon.h>
-NEON_FLAGS += -isystem $(shell $(CC) -print-file-name=include)
-ifeq ($(ARCH),arm)
-NEON_FLAGS += -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-endif
-CFLAGS_recov_neon_inner.o += $(NEON_FLAGS)
-ifeq ($(ARCH),arm64)
-CFLAGS_REMOVE_recov_neon_inner.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon1.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon2.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon4.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon8.o += -mgeneral-regs-only
-endif
-endif
-
 quiet_cmd_unroll = UNROLL  $@
       cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
 
@@ -75,10 +56,16 @@ targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
 $(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
-CFLAGS_neon1.o += $(NEON_FLAGS)
-CFLAGS_neon2.o += $(NEON_FLAGS)
-CFLAGS_neon4.o += $(NEON_FLAGS)
-CFLAGS_neon8.o += $(NEON_FLAGS)
+CFLAGS_neon1.o += $(CC_FLAGS_FPU)
+CFLAGS_neon2.o += $(CC_FLAGS_FPU)
+CFLAGS_neon4.o += $(CC_FLAGS_FPU)
+CFLAGS_neon8.o += $(CC_FLAGS_FPU)
+CFLAGS_recov_neon_inner.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_recov_neon_inner.o += $(CC_FLAGS_NO_FPU)
 targets += neon1.c neon2.c neon4.c neon8.c
 $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
-- 
2.44.0

