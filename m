Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F701E52C
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569729; cv=none; b=YpHE64WMSf1cqZVDO3z/YpMim4yUGIr0tMvEQdZG4vwORq7QFzoOQYc+ptGONpkoao1givu3umuMdUJoghLlQBWwd1gSGi5SJluPQVE4WXEKkBCNatD5FcSrpOL2ioRP820yIOYlbCMRzP5XlELJCvVuodKQNg66w2f9NgtVN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569729; c=relaxed/simple;
	bh=TbFyk0hacvmJ9olxKFdeN1kGuF2ppBFDV7NUTUOGoKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nF64gS0IaSpNi8oxJcE/R+vaUYuD4wERKLVyD8B47eSOd8PeyLD9YwAR3j6awxpWqXjcIyoc2QOtZaKdy8lsiKvhbomVQ+7kDPEAXFc34sZ3q6EQ/0f7YL7OO21KgjhldEV5uU51TbGpGYm3Bb+V/AfxiEajR3kaDtOFDp0nX00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=KLPT+nV3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KLPT+nV3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e0f2798cd8so2273105ad.3
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569727; x=1712174527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhRrF1Pu1wTofDEF5NDtSjXNjQrJmyXSgj6gSsLdD3o=;
        b=KLPT+nV3u2foWcbByqWMJqlQvXAylG9Smm59r1hIZVIu/UYSy/YoFXTBVpodm6Cg7O
         p06p+rudYch8Oe/6Pcdzbz+zIq8JQ0BjjQ83ed/nTLqkEsRNRdmKSoYqD2MaawopBp9j
         VSjSL5/sp3YdZ3bSAIwfB8TjY/x+QjpkrjW9fYDeCXvGt2LFddRVJn9jQ9Lzz9GbwIo5
         SzDVUBVUI8VzaduOe3ss6VEk69xvbkMm9Qvc2YtjuAWklRXG7F77cO/fooTj11DyiLNJ
         /YmhpAYJ9PzDbQYEwmWCJ3cDzSs3t8FUFQj2hveleNeszyasM0uVaBbBLzYMifUZwRvP
         ZPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569727; x=1712174527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhRrF1Pu1wTofDEF5NDtSjXNjQrJmyXSgj6gSsLdD3o=;
        b=ViUf38JTTZUv7AwlzQQFBZepoq7sdRruls/DqxTz0CeTmt4Oz3qVUDv9uAxAEW7EkC
         0B6zaq7AXrEyjr2ILDIMPtGEitwapxFoUBzb4Gf+HyQBkes5K6zehq9GeW700Y9BDd5a
         hlCiebOi2px53vIukPs3b4UbmXGX3s0bxSwEOfCDJFUQUrTcftHFnSWlRgtKJ59R41Ac
         J45L6zuKtC07c9T54zKOD1re8s9dk41p26H1lXtJ5dZsT0HHF2GJ82wrEGf9Aw55VTE2
         Npou1bAw98HtviPiNsiRMlw4gJnMHiiN96XbNhDdDFNa7+3EapWI5piGUZBCldVn35qT
         mIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyPDeCUA5gdQhhWWtgTMGeERSAbbYpu8QVc8jSoUF1YzivSIZMaKDs4wP6YYI0zl5nrw1U4g2BZf3RXU/AOIfbeKO5c21LzYKd
X-Gm-Message-State: AOJu0YxZI1Lap7xWhtHYO427Oyw2WE/Pg90xT9Bm6xcTp+R5qGHE1DwO
	h8++jDrhxFGbOvtUEP8WxTmIjs7/ETXTO+UbMtVZtvivhyA3smNS3n99jxn+ECc=
X-Google-Smtp-Source: AGHT+IFTdj+7xjr/hkuUZrog62OKlzxWVPjf6p/E+DdPaik3Rv7nG00gWJ8Kh9j7qP1eqTQJrGE0sw==
X-Received: by 2002:a17:902:650e:b0:1de:eca6:483d with SMTP id b14-20020a170902650e00b001deeca6483dmr724908plk.27.1711569726983;
        Wed, 27 Mar 2024 13:02:06 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:06 -0700 (PDT)
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
Subject: [PATCH v3 06/14] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:37 -0700
Message-ID: <20240327200157.1097089-7-samuel.holland@sifive.com>
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/raid6/Makefile | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 385a94aa0b99..c71984e04c4d 100644
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
 
@@ -75,10 +56,14 @@ targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
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
+CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
 targets += neon1.c neon2.c neon4.c neon8.c
 $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
-- 
2.43.1

