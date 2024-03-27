Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92891152E12
	for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569725; cv=none; b=bRptRJ2FmQaKAMRxIpgp2ipYRHZeKtfGSNTQWIieh5Xi2njOgw/jNk0WLXoJeexyeBuM4qNIeRZ0PyEdeckx/1ARV+pOCEyIhCws8SDo81/dVA7h8WeeiO0zk6IhpCkCZz9wsJlDB7Lfbu9dFNhbFukput21tYtvhBDWo7KeRVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569725; c=relaxed/simple;
	bh=JFTn7HBH7Lnt1aUxkwHzbnUdwmlaZ5Y72ysNp/iIKHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlwzHY7GA9qnLIIHFwXHVSI4aJqMsdpjAg/OgB1wewJZHIgHRZj3yik25NrVllxppYvynkX2izCSgl/9csR19fuaocMe7APB1nPGAD89EesoWb4q6Ud4lqtagJtm7I4k9JoCSQTLZ1o+954ZsN2VOg3HPrnDLag4zsvMoOsIWhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LNhKZ2vY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LNhKZ2vY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e00d1e13a2so1945275ad.0
        for <loongarch@lists.linux.dev>; Wed, 27 Mar 2024 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569723; x=1712174523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3VQJildZHY1Bgj6r2iljFMqpw+vWq4Si7He8vtNBY4=;
        b=LNhKZ2vYCh4gnpkll5yyX1zW0ZiRTsuF0a70AMKW4gY+gT1G4xFKmKOBRk7eC1Ul/M
         9rpNySRRHCPceJqS3e8yYIDeZIg5WHbafRuQKRYj+LohNIieeabew2JPFPoudwrXyGwQ
         1pB56xkW+7AuZBK6VHPBraj/z6pYA1cBeae6giNMZf6hA/RuC2YK1G/xNA+Qyr6DR7HD
         Mdbkk3F4Tuy0qC49a5LgKzD7yKAR8fafhmDAEWid55uiVrlBfljOWTn8fzU7TKEJ/8Jd
         WPvN6bvZwbUcYwaB20PtUDlYubA1L/OZMyJX6ZKt5UZx3kxWRWo0G+gYyfUeu9HDIEOk
         UGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569723; x=1712174523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3VQJildZHY1Bgj6r2iljFMqpw+vWq4Si7He8vtNBY4=;
        b=gQWpVP7H+OQkRFlVi7UfoqLSw8GW4kNUBud9QeQ7R/c7uk0iQl9LIASdDEm49ZrK/e
         KgrkBGQtJLn3742z9lJ2BqKgrHNSmhplqtA8d4AEg2TCdFgV59OTWlysMwWu5naMm1RB
         wSgMh2qYDThgPdRTrKDGaIkg1wZmXZOaRYThrFLirUzI/3OEmwp5cQZq92AQYsr5vp3s
         1LNIPMLdNRm9kbJ82KRTRsW9Aa/e3mw5EPgmG7W3bztDebe2+iCs6ojxKtliJoW63dju
         4tgz8qwMnJAytFraZWjF1WQcxZesDsbW4tIfFib0+xOC703BhYWI5v6zKQSc9Opl5iHF
         RDLA==
X-Forwarded-Encrypted: i=1; AJvYcCVeEvogDfMWPKuTwtX2nWWS1Yar4cuurrgoa657qnWE+bLsUYuAJZpjcjJBeg8VO4cdYQkxto/+JjkRBaGdg/Q+k/Qo3aAeG7FC
X-Gm-Message-State: AOJu0Yzy1BIoJft0qPKZZgXcMIknN8JauuC+xtQY82P3k77tbxf463qA
	PJS+qTA8tPfxSCyUXq89c27H2GauuiLx08XAfKvqOXABnEXxhhsQ138d9Vhs1d4=
X-Google-Smtp-Source: AGHT+IHYrCNFuZi7JM5PzLehk0tocOhYuLDObxCk9XIqMJvg9sySawc5MBuX1NvDT7qWP/3i+9Szlw==
X-Received: by 2002:a17:902:cece:b0:1dd:c7ea:81f3 with SMTP id d14-20020a170902cece00b001ddc7ea81f3mr964085plg.1.1711569722972;
        Wed, 27 Mar 2024 13:02:02 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:02 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 03/14] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:34 -0700
Message-ID: <20240327200157.1097089-4-samuel.holland@sifive.com>
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
2.43.1

