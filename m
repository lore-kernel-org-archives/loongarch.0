Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17C38B7C1
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 05:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777439649; cv=none; b=pi7J5CW2tUxKfAi7FOZCGKOsue0myiL2f6mrRNV9vBjPGGa6vjVlFocBkA8xp/nN71CyNhJzODqvjQ/K8Vaa7fGDdkfLdyU10RsSq0IaCc24JqY1nYut5ay5RcRcDhE3BP72plLlLLjzdqJ9t9zamIKF845QF2DgWBhdsCGWxmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777439649; c=relaxed/simple;
	bh=dItIsPbk/j3Cl3D6WqOm0NerVIalkv5nzvBY3Zn3xvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HteBbV8KgBjAcA+Q1tb9SOYwycs1q7DhR2Y3aVXkshpnT2lIsdfhS5bbSM/s0+O/KgUopfqjWj/Atg0bRFThYvzx/+IpTK8oJaCActn8+DyhEvdfAY1Whd7QCFQSbfv7NTIDAEdTPHEuaZ8aJznQeI88yXnzdx6vdL+oU5bA438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=PPGQKTk1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="PPGQKTk1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b2429f98d0so72346515ad.2
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 22:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777439647; x=1778044447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99tLjWOK/mLpAv9uxA8Gv2R+vi67znNvjWmjayf7030=;
        b=PPGQKTk1D+1YWm5Q5mzfED82N3pSp4NfjrEwJnL2nX/drKGLIEi/Yx8ah9Gm7oi3mM
         Dv3uIFbELl3XHtvKMW4YHgHw/xH2WITKtHiXMlALp7/UJ79prGmTSGh3aBCjRfm/cX+x
         g9IZF97e39yiy3yMigFdxdkgYy07LiN73lyCYl2Y1Vrqjih/OCsBfqz0MGDwpAbJPZ3y
         GPjMaOpYtDWrDQ36dw3l7YW3f7CUT1GpUFzNTaQS2cIkPnIXOIsK/IPY/CMvgRKYRksx
         7WBgSZmk4cP9cRedefnVrT43j+nSAxGFupPZRWKg9f1sRCF0XGX3R2oKQFJUf7FIC2/T
         t1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777439647; x=1778044447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99tLjWOK/mLpAv9uxA8Gv2R+vi67znNvjWmjayf7030=;
        b=co+t6qoePtbAnRZ6coZDFxc/wqDJV/EDk7AnkwebWnXy4yxZyM1eBmkX9emYjrpO/K
         amrWXviHfQKR4c25JUzlagHn+PCu06m08RtGRXTwJmnfwGWdu9eBGzGyx0R5KmfVX0xp
         SsLOGD5xv7cfaZc9kDK7cDpYcx1ZuxgrKAHvIutcEyBU35tNnrYb0QOIALJmGlIu20O3
         NmDMoILqRE5IOSh67KIqDl0Z3Yjwk6vM1TBUI8MOnN2aYJcz5UZbk3OrzrjB1zufJbi3
         TgFuIL9TDtE/EBOeGponFoBeqU/Tfi6EoTPxYjpJw33pGGgOpwmj1kS/227kCn3H9JPN
         Pk8Q==
X-Forwarded-Encrypted: i=1; AFNElJ93VYIYLxV4VrLTsd98ut0k02HLEf8ybsJY0UtdeUTxMAtNN898pmn3XCX8/KB0eECKektNqjX+wPA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6YunDPcaCMspjOPA6DKeTY06A35GwkyKBU1kTZ27wMxM/0dvl
	9XGdrcQvZRiBnhhtfuh5A+ADlsUZVxYxGcqHlKMrIc6vOdrDpKGoMk7/z2E910FFh0U=
X-Gm-Gg: AeBDieszDrSYX56vslro+tjudCH/YT1kYL9nagwQ1QaPO0KxkyFjY3GHCKOBtFkXOAq
	Oz0BF77gO+G4Wo761X+7L+fg7zIwCByItkkkZA7LgltnKOnZSYZY2EI9nMoXQgiWPSmq5GRnnHG
	Auf09hC3kG2EHkx7Qm6HztiSdVu85BFA0vouhRMjUr1de9I515MeClqldKEwEMktfXrFz3iTgAT
	M3mnl6YECW2mcOfsvlbbUKJsA5spHKAmKFvTbLYOp0J2bBLB7Vs8VGJbMwdrb/1BLLHj8B90moG
	WcdClmswt15KsbuT/9ISPsLJmnoLOUMFMGuFj8zr76lWl2HhM7Bi21InMDuu/uAJl0l5Dejh4wx
	9hfbM6Xe1GBGvou1tEKPMgE+6MrPIw5J47Qx1Zw6523/ZO8adAC9gv5k6Kzg9bg2X0mt3+okNOO
	ZtJWIiGIrGfsjgY2ZgM1371ilcwcR1
X-Received: by 2002:a17:902:f907:b0:2b2:42b1:adac with SMTP id d9443c01a7336-2b97c412257mr40027755ad.3.1777439647157;
        Tue, 28 Apr 2026 22:14:07 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988787360sm8846935ad.20.2026.04.28.22.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:14:06 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Haiyong Sun <sunhaiyong@loongson.cn>,
	Lisa Robinson <lisa@bytefly.space>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH v3 3/3] LoongArch: Avoid initrd overlap during kernel relocation
Date: Wed, 29 Apr 2026 13:13:18 +0800
Message-ID: <20260429051318.1581350-4-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429051318.1581350-1-r@hev.cc>
References: <20260429051318.1581350-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate the relocation address against the initrd region specified
via "initrd=" or "initrdmem=" on the command line. Reject relocation
targets that overlap the initrd to prevent memory corruption during
early boot.

Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/kernel/relocate.c | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index c36604a81d08..c303c0be8f06 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -214,14 +214,59 @@ static inline void __init *determine_relocation_address(void)
 	return RELOCATED_KASLR(destination);
 }
 
+static unsigned long __init try_get_initrd(unsigned long *size)
+{
+	unsigned long start = 0;
+	unsigned int key_length;
+	const char *key;
+	char *p;
+
+	key = "initrd=";
+	key_length = strlen(key);
+	p = strstr(boot_command_line, key);
+
+	if (!p) {
+		key = "initrdmem=";
+		key_length = strlen(key);
+		p = strstr(boot_command_line, key);
+	}
+
+	if (p == boot_command_line || (p > boot_command_line && *(p - 1) == ' ')) {
+		char *endp;
+
+		p += key_length;
+		start = memparse(p, &endp);
+		if (*endp == ',')
+			*size = memparse(endp + 1, NULL);
+	}
+
+	return start;
+}
+
 static inline int __init relocation_addr_valid(void *location_new)
 {
+	unsigned long initrd_start;
+	unsigned long initrd_size = 0;
+
 	if ((unsigned long)location_new & 0x00000ffff)
 		return 0; /* Inappropriately aligned new location */
 
 	if ((unsigned long)location_new < (unsigned long)_end)
 		return 0; /* New location overlaps original kernel */
 
+	initrd_start = try_get_initrd(&initrd_size);
+	if (initrd_start && initrd_size) {
+		unsigned long kernel_start;
+		unsigned long kernel_size;
+
+		kernel_start = PHYSADDR(location_new);
+		kernel_size = (unsigned long)_end - (unsigned long)_text;
+
+		if (kernel_start < (initrd_start + initrd_size) &&
+			initrd_start < (kernel_start + kernel_size))
+			return 0; /* Initrd overlaps kernel */
+	}
+
 	return 1;
 }
 #endif
-- 
2.54.0

