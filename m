Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DFD6EB4D
	for <loongarch@lists.linux.dev>; Thu,  8 Feb 2024 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389489; cv=none; b=CBGqvAUDKsILJC1M9IyPi+RSJp6StAgXGPjAlf0XiS1E7MfPKHWqiArAWDQ5c3fq981cYaWRtNX3TimKFcXr0ZcfvAw1dwE66cxk7Oex3Tbj+a8iJQfkevWGEVsMWIHJDp7/XVOBJmUAa0GJmkAe9wxMEj0aha29/ffFmsEKpEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389489; c=relaxed/simple;
	bh=Emv88gdDG9pxYGUfTBsBEdEI0xWLZ5BnAsMkMUFkpJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pwyrBkJ9o3j++n59SEDOGeS1YtVcNRAdd9nZPks0pKFQt+phvcKAgzGQhnjmIgD1dcl0muAvTrjhah47++JJ2E1vqyi7H9xQqFnu2/72Kn/jR7sc81cwqt5TVidRk4zxvfhQ7lO9xIYSM1AH18nmOaH/mHJhRCKRFcujAUhkz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNK4WqhD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNK4WqhD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4103fc91755so2560715e9.2
        for <loongarch@lists.linux.dev>; Thu, 08 Feb 2024 02:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389485; x=1707994285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNZpB/EZ4NWTASPOpVzKWYUje+5cX+UaG3ufU3H/M78=;
        b=iNK4WqhDKmiSXg8wxXKL+r3hOuO1Kr9EhTUg0Mv0eWlr8POax3a6LTp9GJ911UCI2/
         Wso5sD+ldykMkxd1KqV3RBrw4hO4qpD+hKsuxKzu+go8g6HHT/hkONMW4Tz5RpZIM8gm
         ErOYFLCR8L1heWP8uy48pdh6fliZuglRDXgEeYCGvEKBrz01dwitvmwJajPQnXGYoOYZ
         58sDziWxA39kU3CHLtfytyBzl9tDcEOTcrDX2d9pf6HzuBW3Wmb0JptDucGaJOFBOOjh
         TIBUP65E8/R1qoa177+fldfW/3x+NukVH3Yt6PNIiRuMwcCyKas/9hoaEfmqm5qoBAyO
         V+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389485; x=1707994285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNZpB/EZ4NWTASPOpVzKWYUje+5cX+UaG3ufU3H/M78=;
        b=lGHKsX2cI5NNRnIJd9WIY4x54s9FwtKpMp1Yn21rn6AWCMpInjfOneUzN0wps/b4cd
         Dktwnw518R91/YhZe/MrH1S9JisMcuMQsHMMfD1O2fgsKeJjGXarvHg6WcTpG8u0PISd
         AqYOAPuHqb4eulegYvnt/DYVVxFI6hpvmOHZgus/s4oR2ocNrAXi2CeImopb8cPErimm
         Kbt4kU+TzMZAwXHmi+Je6d3ss5YcV3nzghueDqUBDPVVFQ8CG3LFRD3i6EfAQB7V3DjZ
         cuXcIXdTqneAbLscsvRhsCquSJFgqN98go1jlkKl/jC/HE1+LlgmYlHMdMc1w90h0/P7
         ypkQ==
X-Gm-Message-State: AOJu0Yy2RBBrrJxSnJXo+glPnEmw/D6MC/ConIDW/h98JmiW26hACZXU
	pGiplZVuFneTGJMyiQVaKqnCx8jWa6aivVnAB3avrNdZTm/puzAdvXfXZaYM6mE=
X-Google-Smtp-Source: AGHT+IG/kpPi0hDLahtJf6Zl7iOAtwtOFLT5HQAwO/GC4rKQbHaL0ZIM+cfHVjTakOaZqbnsfVy1nw==
X-Received: by 2002:adf:b196:0:b0:33b:58dd:84c5 with SMTP id q22-20020adfb196000000b0033b58dd84c5mr941338wra.53.1707389485245;
        Thu, 08 Feb 2024 02:51:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnciD60jji026n5unEXbnYRO2wX370lNj1yfb2eMmvYIkCLxGw+Fw70zuIAxqIwi24cZ1WAdRcI7uIY0UxF7OLxdCTQdWQtrcshhfQrCT1hh+T3i+WDxBHinbKaRqXDMgMGpwYRQ4rHj2cilTvoZ4nefbgo/ukzC83fTvCo2JKjvh85F+QXLcmoX8GVVG+2QegkzmYrt4O85p/0e7O3eV2HeYKqR6u6100FEaASTf370aYyyLBUSyo40zeNg5nzIwTUg==
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id g15-20020a056000118f00b0033af5716a7fsm3328649wrx.61.2024.02.08.02.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:51:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] LoongArch: dts: minor whitespace cleanup
Date: Thu,  8 Feb 2024 11:51:21 +0100
Message-Id: <20240208105121.128521-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space before '{'
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/loongarch/boot/dts/loongson-2k0500-ref.dts | 2 +-
 arch/loongarch/boot/dts/loongson-2k1000-ref.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
index b38071a4d0b0..8aefb0c12672 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
@@ -60,7 +60,7 @@ &i2c0 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	eeprom@57{
+	eeprom@57 {
 		compatible = "atmel,24c16";
 		reg = <0x57>;
 		pagesize = <16>;
diff --git a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
index 132a2d1ea8bc..ed4d32434041 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k1000-ref.dts
@@ -78,7 +78,7 @@ &i2c2 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	eeprom@57{
+	eeprom@57 {
 		compatible = "atmel,24c16";
 		reg = <0x57>;
 		pagesize = <16>;
-- 
2.34.1

