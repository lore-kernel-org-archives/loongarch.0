Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78608283CAF
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901156; cv=none; b=I6/YNcEpqFO7Gn3sY0ApWfOGWP4a2FvDqfBjJ+FakptKwxSYjT8J/g/2JQDZil4LDhXHitJDUlrincal80D2oJb6YckQRuPhzzjLZe/exq5jwWeB0E3OzhKEDpqVFmICCQ+USN/23rHbelvNgwdwX7lUBV2jS2p0me9MgUuniRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901156; c=relaxed/simple;
	bh=VFZk1884jgS/DJq+nxygx0E7BGzvWbVuXGdUldrPvhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaGKUz+hvYtYVNPpqMZnChLg3Lutc/15RvawSrXo3ikZPfL8CMMopqc//W5+pmWsQBXUbI9hk/yrbI8tNx3aV1Wd8I+e9TRi2z5WahaYo0GbJIHqIo7yZr92187259u1PkUZ1FCQMZocPkJfpPvOCVGLFIbngyVbqU3e4r7IOfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nh2ib+P7; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nh2ib+P7"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so880827b3a.1
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901154; x=1757505954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nO2c+otpv3hSaUcvwB5pOaRyO079lesbP8vlGoLxfew=;
        b=Nh2ib+P7Ujl+WDkA7YeNGwkthhAamhreXYvB7zKjeiTZQAXMr1ya88UozfL3cUrQrf
         NpIqx1LJssDhnhbcDQwj+ACruyYeOnF9xl2gOUtkHScUn2g5kksnGuUfoGlHI4mhs00q
         tY8bf2GyhgSN8fOJeCjOExeDQDUMJR+C3aBNtFC9lgK1L9K9a/hdy6jUlVXeAnLXYuyq
         RUDmnxa7WXF1oS0ZGDHccUogQu4XXAG3W8veZgsdnm9UidNZ3BuOv5ggbELB/W0c/jjK
         2xBp4Onbwgs6ZOtXi9cNcsZFCIa11bUOOQKg7SvorpGw28HS3qRKX9ZuaJnUmJ03cNVS
         wYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901154; x=1757505954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nO2c+otpv3hSaUcvwB5pOaRyO079lesbP8vlGoLxfew=;
        b=N92mFgIEPYFF2l5Y7p6nvXDO7uAOCu8jbczUUvwP2vxbDg60hebSEYJrrjSYZalq2z
         uZZOPFzefeJ7rge3WDCfqHGOhlDn0jFqRp/sRr0wj+BR2gkiDxcYW2HMk/E54J9GEnpS
         J+K9/LzIKTJBG+NFrH9p6HLuDT0x9y+ZdFIbEGap4u5pEFOFr3+6McNT4SQLUcoNBXG2
         +f8MvMKZiQEd1uWArcQd+5XbKzWRRKfvrq+5rmbfIDaSt5ASI0xifhJWJI6gJNtQRR+U
         W+/yuYzhIAtbvIka4asWcPHkNuXZM2Tj4X0UqRTpwewkqgSjzQiFjBHtdJOVYNwgLWQC
         MQ2A==
X-Gm-Message-State: AOJu0Yyng7Nk4q9IyCSnsLHmlSZQ37PZJFvMTJCRihs7vQRDM8sAPpuu
	gITgdv5xC5SwWgnNBKHV0T8LP+VyDiZhXSI4i7TUJye8icEw9LdA5kO0upw4p9lQvzY=
X-Gm-Gg: ASbGncsdyr3wHawcUKOZ7pPP+FkyAvxS9fUaBMZl5bkwSdg+nebqow1lTNjnMDR97BD
	8+kxvN0GE7QoQ0zhxHLSJqmmetHqWoGh/3O9Z1CicqFsf8f+00lWER28sFN1KhJtf1a7NZNtSNG
	bceQHjAZfWgWvvAXVK9THz8JUSX/inZEpzoxpSFXu+ihj9acvyD6CTUU/rna07mGLLQ5XEs9rMY
	w6R2w7h5FBohCqEyFm1/d584lXzu/jZwJw+BQFwv+WzrAhkzjsNy2KbkyKYHdxqRmq8R8Yh2roV
	LYN9aQ+3nKoJlbUPAebGwRNYik5KiT9JCEzpytFfFA3DWdBdKAuYetN2X0c3ajPGJ0qkfS/or5l
	uzej17OZfyr9l6yqWh78cgTtqYZ1jYryPibFHLgpYuuEJQ5yzkio=
X-Google-Smtp-Source: AGHT+IHrJ5joBxmTb4YD16jo130hKukqegA4X1AEQIZM30v6N/u7zgRLj1F9dcj4A+efeg+h8tDtfQ==
X-Received: by 2002:a05:6a00:21c9:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-7723e3374d8mr18018803b3a.11.1756901153589;
        Wed, 03 Sep 2025 05:05:53 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:05:53 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 2/8] LoongArch: BPF: Remove duplicated bpf_flush_icache()
Date: Wed,  3 Sep 2025 07:01:07 +0000
Message-ID: <20250903070113.42215-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903070113.42215-1-hengqi.chen@gmail.com>
References: <20250903070113.42215-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf_flush_icache() is called by bpf_arch_text_copy()
already. So remove it.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 77033947f1b2..9155f9e725a1 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1721,7 +1721,6 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
 		goto out;
 	}
 
-	bpf_flush_icache(ro_image, ro_image_end);
 out:
 	kvfree(image);
 	return ret < 0 ? ret : size;
-- 
2.43.5

