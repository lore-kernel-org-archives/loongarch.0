Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558C6FBB
	for <loongarch@lists.linux.dev>; Fri,  8 Dec 2023 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aoFWzGih"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d06d4d685aso12922625ad.3
        for <loongarch@lists.linux.dev>; Thu, 07 Dec 2023 21:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014906; x=1702619706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqG7sh4TEQnomN1Pb8iughMffScuejFKYmgaMeTCLmM=;
        b=aoFWzGihtBS+BahydT7WcQcaVBtAo9AauckFMTxRmiXwkyVka2LwkNS9vFdo6zMh0D
         95Xa0CvZyUvfC6Sj/Lh9jYpP/hl4u1YZ2tQdzYFp7fk5QDS2suO9VEcPIEijo49SgUMJ
         EBjZqFk0CTDz6Og9vWa9fs4orhUrj/s83/ZJ5ltp30F58stUYktE8hkTbGYeeLCh2QOB
         a01uEM+j4JH0lna1hBd0VfpQ2SM0qDne9oyi02QdXT3N1ew7iGz9/2as8zpeioYh7d1U
         gnB9SKS28Od4eE/y0tyhgoDRf9smY+9bVwwUk8KLNUbgmFPPrfSbag9R1Rm+vRHgStpA
         qieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014906; x=1702619706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqG7sh4TEQnomN1Pb8iughMffScuejFKYmgaMeTCLmM=;
        b=mb0kflhtGYQACgTnghUstjCD7I25qmsUClQW2ynoF1GGeE7eyk8jt8RPZpCC2ff3dZ
         u6m9BMGU3g7vp3SppCLlnkFlRdM/S2U7Ff9u+UO+FCwqcYTr0erCZI8HCMztqpvsGXdw
         lRo0yH8cFcz+3lLLHW9En3HoRrp1I/UR2alc+/AXp+1BgMg8uAac2Ef8wUvC+R9HRbj4
         JhJNjWVLZ3/RO3AyMG/sS2aoTtAzE02k9ewxMgi4z3YSAV3RJR/3o7Wu4SlFiSiKh0g4
         CS7+1Ji2IMub2G4IMC1NT8TynxFk0hPLyDKG5FEBoBPiEh6/R+jLB3ycmeH/fNFQnDhr
         jg5w==
X-Gm-Message-State: AOJu0YyQtuicADWARdLSiSJ4r3sH7ChZs5wh3XoGhmqaEThTT4D/TZZf
	m8iHSDl1rM2CjwR2MNaecCHGTQ==
X-Google-Smtp-Source: AGHT+IFmoFC5Jy7QDutaZzebMhgROVCbFnFB+FkSDZrKf0b9QQV81pWWj0y7Aq09xAemAJ7UXgVmYQ==
X-Received: by 2002:a17:902:ee45:b0:1d0:6ffd:f205 with SMTP id 5-20020a170902ee4500b001d06ffdf205mr3064563plo.91.1702014906581;
        Thu, 07 Dec 2023 21:55:06 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:06 -0800 (PST)
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
Subject: [RFC PATCH 03/12] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Thu,  7 Dec 2023 21:54:33 -0800
Message-ID: <20231208055501.2916202-4-samuel.holland@sifive.com>
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/arm/lib/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 650404be6768..0ca5aae1bcc3 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -40,8 +40,7 @@ $(obj)/csumpartialcopy.o:	$(obj)/csumpartialcopygeneric.S
 $(obj)/csumpartialcopyuser.o:	$(obj)/csumpartialcopygeneric.S
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-  NEON_FLAGS			:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-  CFLAGS_xor-neon.o		+= $(NEON_FLAGS)
+  CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
   obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
 endif
 
-- 
2.42.0

