Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3635AC1E
	for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204975; cv=none; b=WWZkijf/8/RPdoQzO8PVGv9o5q332C70TPBBVYaaYcfWxV+Zvj2RIkgv0cFE5ycFVcgbIPffQ3LafC58OKtZL4SpPCe10s/usBqjdKK3sSjfy37XPjwvbyLQXMLFHOtiFRLELWO1broDvQ2I32jJR8q3genkYN/M2zULXG07z9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204975; c=relaxed/simple;
	bh=gZg1LZJ8U8You+Wkevxwu5gYhMLfjULVKE+O5oAK3N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBcxx8W7pXoj99FDnWSPffnNrsYLlVRexQnOtWcibBS0+UaKu22cEl5cslaUB8XhNU6Q8cx1i+ny/mTCcG2z+g026oCpkXDNGmK2iJMNhWaQHRrQ6UVsVdfYDYKEUdB2q8UhiHrmglM5tFfgFNyhvUjVv4sAliI8es3ukDCGj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=LJWQykGB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="LJWQykGB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad617d5b80so54288535ad.1
        for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 05:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777204973; x=1777809773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhTH8c+vBFpvSOX6DMmifWKJbw9Gz0Bb3dH6yZMz4Qs=;
        b=LJWQykGBcXZFQCEk8ddm1Vt3DTs/QzT0nmMNErW9bpYAh6o/JrA9wolHlfOKX/mHER
         lc1gHhtmfGqHHUmYH76i1OvaC6lWGTzedYH8Godqrza8TLg/FYD7CqXL52CdJGMGBOBO
         vlEY0yc3SBf5KKLz4rT1n7p2fMGfb4XOknAkKPzEWgSAzglTs+VvOniYb7KgvqnGjntl
         6j6Exu1/sZ3qIs97LiMR3jprTyOnbqnCq1qOpRBxdvZ+tBv/HXV3xnsPIQ+09BwrHhIt
         8Acb6lJmUEkOxHwDvmCkiUdit9IJ0BcotfC/X49I8sZZzejamFw4PHMjO0s0+5gPPnw+
         Riug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204973; x=1777809773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UhTH8c+vBFpvSOX6DMmifWKJbw9Gz0Bb3dH6yZMz4Qs=;
        b=EPh/+wkBe3WlJCSIZkcNCsDSOjvEbL/oLYiJfoFKUtM+Y70EXvGpP59Oakdw7q/COV
         /d+J8008R1qLFGBOhvbZgSvX5zx2HEbKXwJkjRyynNYjLHW7yKoedG4BUYuy7w/hxt8Q
         W5S8EodBnqTrlneFuo5WUB5gaXbJwNkWglTXAcXMiHZzcpNTxarJU+VpFOXfgVkJR0aK
         slSHNusuO7n2Pu0S5KMXsJxmWzEjmX8G/cRW2/zyEJQp51zPx4HNOj+UGE0ojJoeHg5s
         //8YZgrHpmILSr9SX2BS8QFtXcxvlDSV4446N9/jOzZuGWIf4uQnKeIW1XrdqR/IEfrv
         ihXg==
X-Forwarded-Encrypted: i=1; AFNElJ/JM9pTZeTK1iIgrywW20CeAUSoHq+uz/rCEOMM8YhbghE2N6hivj2g1IWBH6Fxj1LIgXA5em65CZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxD1ksnR05/mWmkGTI4FmzDNDp50esmQ6wSTX6NfDoI2DoLll8
	8otB7MUamEIM5Um35eAg36HU4Tg/G9ZoNbMddWOTQQgSjaMeptQ60ayI+IF1h/EN60M=
X-Gm-Gg: AeBDievI0mIsSpme8X6TXYgtcTq0qK4oP6x2RUrO4JfMCSX6XYcm3UukvmVHP7YmQE3
	GYYOscAcq1dhs9qSCS4FWvDPhMpsGAw7wH1GADPzHfQ6RM3/C3U2pxIOsietzsvn3QWJ3HNqYrF
	wLD35fWT4j20ZmGuwNW3t0szExz2/Q9VVkhb81JjejUYBWtttNFJcLGSujYhHB3464Vc13dydF2
	YQWtytmA9ziW+G6BPuq9qYYZH5QalM4LS9O8WBn88Ytythf9lBj+bEU6cu7uG6Rr5UHc95LSAu3
	2QtLvhgMgkFVnas99OLY9qqgKb0c747z8jaohK7jX/fQIf1Eziq7NEQRcU63gX5BaGdlTHHeAFA
	/+dlPs6khugtRC6NClXJRVVtNk/QfstsLNwEsw7xDNe2m+0kdunsS8LpVbs9C7x0E0MVfr8NP1q
	31g09GHJrXwdt440ILhvBql8WIKS7yGg==
X-Received: by 2002:a17:903:2ecc:b0:2b4:6022:bf8c with SMTP id d9443c01a7336-2b5f9f52984mr430205845ad.22.1777204973336;
        Sun, 26 Apr 2026 05:02:53 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3c:3085:4d80:3614:2212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab297c8sm263413965ad.67.2026.04.26.05.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:02:53 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [RFC PATCH 1/3] LoongArch: Allow rdtime_h and rdtime_l in 64-bit builds
Date: Sun, 26 Apr 2026 20:02:29 +0800
Message-ID: <20260426120231.532644-2-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426120231.532644-1-r@hev.cc>
References: <20260426120231.532644-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the CONFIG_32BIT guard around rdtime_h() and rdtime_l()
so they can also be used in 64-bit builds.

Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/include/asm/loongarch.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 2a6bc99177d8..bb2da9c58411 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1248,8 +1248,6 @@
 
 #ifndef __ASSEMBLER__
 
-#ifdef CONFIG_32BIT
-
 static __always_inline u32 rdtime_h(void)
 {
 	u32 val = 0;
@@ -1274,8 +1272,6 @@ static __always_inline u32 rdtime_l(void)
 	return val;
 }
 
-#else
-
 static __always_inline u64 rdtime_d(void)
 {
 	u64 val = 0;
@@ -1288,8 +1284,6 @@ static __always_inline u64 rdtime_d(void)
 	return val;
 }
 
-#endif
-
 static inline unsigned int get_csr_cpuid(void)
 {
 	return csr_read32(LOONGARCH_CSR_CPUID);
-- 
2.54.0

