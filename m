Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB037E2EB
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 05:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777439646; cv=none; b=QeMi3bDQRQiTQ3K/pJLkp5ZB3gZpFm7/R4TPkrHlFXAlyXS8CkDh6aC4eDQVsU+//5Uj0+jhHa9MVGJDTQknDC9LyfuDeTl9efKYX/ELOgBpuGYnTvNAnb8ARzWrJp7IF3p67EojLGrU4y9g1PkrrsBhi0hmCOjJrW2QUOsH6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777439646; c=relaxed/simple;
	bh=AFxDVPfqDD1fX+0U3m7t2OJUKJfWgyTTwFDtosrykxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWLo2BJRa8Cs4PtpBuFBoHBE1rhlmwHLAjiaP8qNSWcBEg6h2wbPu1z4FFm9WX/KX3MtWybZhystJHjxqpDwwn+k/BvMpRK4+DK6z9KF+oJX6EyaME06JiJpra4yugezTX7v5RONRPjajA0C/+mpOPCGvhmgeC5iV3Y7Gs7bkTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=iBOJcuWp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="iBOJcuWp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b7adb38d65so58260765ad.2
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 22:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777439644; x=1778044444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1M23bGh5Hxam/8XaoRaHHo8c9kozCZBAlQpB9hznRA=;
        b=iBOJcuWpavY+pk3FA0Bx7GKtgersWxIDMrz2e05+gLZHA6lVhUIrUeYbPD95wCosV7
         nC+TgwnirwMrk2tQBRh2rULJskKzevJ87vkbuTtcOkjDivpFE47eDTMHvCyDbiScqif0
         vtd8JoJlgJOetzf+Am9f0o3QrCz2UyUKCdpmRPWt37xZXqpEpItehWr7Dk/T770nOLrb
         5pyoEKDKUxwV79Jbv434EdaO7Pkstr6LRdXC0Rp/zv+JpLl+b5DBZAAkrbH5ZGi0Hn2k
         AMNkMmLDxuVfslexulYI7iWtK3NcxVVUNvDyPVleBOuHsi+WBcu68otMislPMPVRZNge
         qKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777439644; x=1778044444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1M23bGh5Hxam/8XaoRaHHo8c9kozCZBAlQpB9hznRA=;
        b=UfOVwaf2q0tUBj+e7jrJ/d3BmCa+M5HBZCQZPAB0AmYcTYVeuch7nWjmANQqOfk3jC
         sKdDvQgV6QZ/X7H8noK143HPKPPZug6czyEtOLZdxusszah7vrBHXYgWc1WVxMVHZZ21
         KQf8G1PiiM1jo85vu0AVHSxPpodqTE6s+paDFsubxZ7ZtJ/6VdFI6CIC1JY/Po6U6FBE
         n4dvMkMHJCBkxh7qC9tjesgtPbNSGm64O8mzn1t43j0X5ST1kO3BHLwrav1/OSR4nvvK
         hniNsks77NINSGqBcwMYImOE5gT9+RVOtXRvk0OTujDCBpnjFV5munpE4qCV+jWNpvzj
         C5tQ==
X-Forwarded-Encrypted: i=1; AFNElJ8goqcA5+cw++gyNFSEQPXmV4ZvE/CFw32EGDO8uWcq8nMopKJ3cz1zSODSy1srkxm5JwhAf4MBkvM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3R3pHW72Vgesozmwgl5Stf3Bp2/vdmEEpOwwy5x1SDJaUADMf
	cQCASdDobjxKlCd/wTxWIfwdJevfTExF3G5HYeOyWrHXQfGfgK8Yn3Q4b4IMS7Irdlw=
X-Gm-Gg: AeBDieunDn4cRVnLAsuIMh+zSt9XM5ZSPPlhPgSgRbPhzBKEJ6A1krxg8aOqFceOh+T
	2VlV1r2qZVq6JJL9RBc1iFHOBd4lJIP7HnUFR8kBFtgwkz8xa7vcVaxuKlm+3giFyujvMA8/VdF
	IONprKSYvgp56kAHbehqGlGBRRa5cNl/TVwJyIjetY5up2fmisMp1hHswLRJEvhzT/VjoIH/f3U
	6A8E3hCA/wPF9B66JB23eLZoRnhQa23IcJiyLkWAdTHUvvfS5DYM23oLEg79tNe9G9EfrFZHFr+
	xkOXkXHSlJqTO+rBmTvkGhENeNLjSsI2a2XUuEsCZL8H4slJiHlmC8IV+2fIbVSHYNgh3yjSa/D
	VkZ6+US3jLLjW37ipP+80jFi/k8w+YNALQdYyPuc7KI9OvWK+SCqMJxznrg8T1jjqOsP60g4I3i
	QTybbR9qr15qbcuubx905nsSoaBWFE
X-Received: by 2002:a17:903:2acc:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2b97c48d869mr58904515ad.34.1777439644464;
        Tue, 28 Apr 2026 22:14:04 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988787360sm8846935ad.20.2026.04.28.22.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:14:04 -0700 (PDT)
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
Subject: [PATCH v3 2/3] LoongArch: Skip relocation-time KASLR if it has already been applied
Date: Wed, 29 Apr 2026 13:13:17 +0800
Message-ID: <20260429051318.1581350-3-r@hev.cc>
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

When the kernel is relocated during early boot, a randomized load
address may already have been selected and applied. In this case,
performing KASLR again in relocate.c is unnecessary.

Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/kernel/relocate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 16f6a9b39659..c36604a81d08 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -139,6 +139,10 @@ static inline __init bool kaslr_disabled(void)
 	char *str;
 	const char *builtin_cmdline = CONFIG_CMDLINE;
 
+	/* KASLR is performed during early boot. */
+	if (kaslr_offset())
+		return true;
+
 	str = strstr(builtin_cmdline, "nokaslr");
 	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
 		pr_info(KASLR_DISABLED_MESSAGE, "\'nokaslr\'", "built-in");
-- 
2.54.0

