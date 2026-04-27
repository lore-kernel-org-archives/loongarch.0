Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E83B4E95
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286862; cv=none; b=rzTaAQQbN6CkidjfS8snSnPnCuaEnZLwa2UPeVv7mKJXwEll8igpQx/a2Msp1rttWtDNfFo8PwEaozSYnU7BkIUFuwqy2Ju65CdaTqXl1e0VJHkamebNWMOwfOW/Axiwum7Yfd0K0pYiQAtKTNvy7GBOjW914sPbITziR3gc/sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286862; c=relaxed/simple;
	bh=gZg1LZJ8U8You+Wkevxwu5gYhMLfjULVKE+O5oAK3N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+dsZDFxT/I5bpb/QeaqGhUBJnDazfe09/8paHlaLGW9eeFhbjcCyHH2VYp3YUmPzy/z4XEU89TNnQ41xl0PkPo0dZ3Gasg7uUrNo+RR5CluXgLTxK3UNH1gHdDihi1qmVeh5Qh4aDm+z6eYFRe2xuH44BEKMIOYV175XvJlTKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=XTfJVx0F; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="XTfJVx0F"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so9312401a91.3
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777286861; x=1777891661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhTH8c+vBFpvSOX6DMmifWKJbw9Gz0Bb3dH6yZMz4Qs=;
        b=XTfJVx0F0rU99jBpwguMipXlFsRkQdO16qk8oRV/1eQAVgYcyp1o6W13tfxeUo8oIH
         174T17TWmZYnmLF6iHTpVtz4stlE+M+aeMGtEQw74AP+K122e9OFKpLsa7zgsJ/ABqoE
         cWyZ5d3AbUTHTXx7nEFoFH3mQ5O21iETQj48D12OD/tmyo62po95EduxSL9tl7X72k9j
         ybGDxzlxbfOfcIWFPM8JIAoICKFli58MKa4q/+iOgdD52aLwsTK1m0ffejRMwQAcWANd
         kBxNq4xZU9tVwSLEBu1hCehI6DxslKD5y/rjNUvyRUEu5/7RGdG7mcWvzkf5bWzBg7i6
         ePcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286861; x=1777891661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UhTH8c+vBFpvSOX6DMmifWKJbw9Gz0Bb3dH6yZMz4Qs=;
        b=TNqE6Qs9+fdH8x/uSu1qZft9Ao5ja3tyany1DzwOVVXV3aTcTcTtFKfjGJ/lBWVmq5
         dkNN1OqwhssI9DRN0pwdgoXex4ugj1SnUkPt4JGyI7wOaoQkH2IYUPJcJ1bmezG8OcPV
         TMTowXKowFwbfjZIxZFEy29nohY3MgX6efl7X7IDmD3rUEANj3sJ8DqtdHKunEiP+nQf
         1eE75ifswjatsjV6/+UTgDZWjYrIi9qBpUh0JK5Lcbr0OZ4IuTNfN3Y7/jT8GY1ysPo6
         pH7A/D58vVqk27uTzKMNC5D7RpsXLAmht+sAyQXz7ZpUGTnmo+SHxHmu+L9VjnhIQQry
         Avaw==
X-Forwarded-Encrypted: i=1; AFNElJ/ux6hoR2d7rjbVMx/TExjG+19oUms7yNH09aZYoe5aeOsoA8A8XifM3PPeqFnW74/PXt0Rn2XJvrc=@lists.linux.dev
X-Gm-Message-State: AOJu0YysaKkbf/KsXz/zAp+cPZ8/HSdKvzNM1RmZ09WDP6InDVPLekQX
	NKHqMfnb55KQhq3iGTpwI9PScVcYYWfWV2YE5QccN3e68o1GhG7mwLSZ5hCi/bJxgD8=
X-Gm-Gg: AeBDieu6iqE8gU/Kke3BlkXjqBIDaLXREiUUqzqBHD3IOQ8fM9G5V6XiaCzgcCRhbtP
	QIHBYwtURxjaUsmGXJXv4MTug9lKxc9DXDDWlE+YxSnn5cH1b3FFtN7RRd8Mciwn/CeEnYs0mH5
	r9gkz4oAoJcqoI7xfmLmYoHCZdXvOwNKonTxaXw7j6CAlvu1LHI4LMIWf2OC/BIY2AQwoTENRCx
	aeokbAg551QPlAxlwGdXK7iIRFcdLIk73zLH7ibtmLUwByFJNmpmZbCksCXagdkVq8NlcmNoSKH
	Vpjm54O5mVwx57rVbiAY58CnJ4wE2a4OrhfgQPpN1d6HDcUMdC34RunolfcT5/psYRAkEuT5mDk
	PAyP2OO+6xK67TNHHZ5eGZajo8Bjy7DXpQ7N5osupodLEcr8cQm6iDq31htYnhLcZAls/GYRu+0
	4gerGIsXWo8P8=
X-Received: by 2002:a17:90b:562b:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-361403bdcfcmr43713580a91.4.1777286860831;
        Mon, 27 Apr 2026 03:47:40 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362dde4ccbfsm16227029a91.1.2026.04.27.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:47:40 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH 1/3] LoongArch: Allow rdtime_h() and rdtime_l() in 64-bit builds
Date: Mon, 27 Apr 2026 18:47:19 +0800
Message-ID: <20260427104721.47724-2-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427104721.47724-1-r@hev.cc>
References: <20260427104721.47724-1-r@hev.cc>
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

