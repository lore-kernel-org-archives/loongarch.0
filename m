Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4222FD1DC
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901172; cv=none; b=e9AsFyWkbKtBtJXsgz7kw1QoJIwrejnk7eHlHdc/bqymiYfKUSY/v7sb+QVUlHfLfzO8ZfZr7T0ayoua+Z3e50zTHrfkBPqHgmrqJfOPWLb6wQNo3HD4F0VSCVXfsUGSi8LRc8zcF29fvImEZnix+9dD0kaVINZagA28AhULBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901172; c=relaxed/simple;
	bh=pW8hgdFY7Zy9b2sPuqrh0HAZvrw+j2HcAcMu/yU3uEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/yi195AefrpB9gieIayUrHttCby5KDDuAxkMcVPe58qIbI0B6B1kssrHDGOUuuYeh0O8qPRd7ehisRvfPg+94l2MpUVPCVjJ+ac2kaXNfAf7n9FGIMzpa0bwMdyBk5hucpJmPEllMgdWXw+vUrYBMeFIl+hXPn1udzkpgu8fxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/iorIAv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/iorIAv"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7725147ec88so532341b3a.0
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901170; x=1757505970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fe7u+orzOvLVezCU9OlBjTeCccmJExoTEHJ48lrVKZc=;
        b=L/iorIAvv3WFyaMjDHA+43Fh5nvlpViGYyA0q2l/j3AkJqbDgfmOR+rIKIGf6JYZwq
         8ojg0r5EGvYyb61QtDRDmNEWXLl8/gAkAfmtADgSsXJPU1AWupZxtDpT5yVV/+jZrB/v
         ID3pIz9+ycMsSOuUBjS5fASE/9U/Mqg9jv8hb4hkVnZHZXVhJU3OysptMkhtP7MmycjP
         P88yOiCCXUwGZmiObAjkY59avZYPK8ntQo7CegDxolIswzfoUzCe7Ax43Mj9ExY8w95n
         GW7mBgB5ZSpEvJUEhNDy9whhcGf39R1+o+jvwVGBTHxA+71c8T3679NdPAjojF/eNXoj
         kH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901170; x=1757505970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fe7u+orzOvLVezCU9OlBjTeCccmJExoTEHJ48lrVKZc=;
        b=S4y60qs+Zx6bpMSIxEkvFiOkbrFNAuabWaFOJzeoFC/IG/a54NP+zaYKyjij4s3dl7
         WdVJO3SwP+nGCQ5XnKm36BLpN68iw0N2v6AIyFEtxxCCiIJKaqHG98vSdC3LbaFYGlj8
         SfgKJMdp/SXDiO43wa15XeMAfXtsZ6Fg6fxmVU36Z/IV9Ej6UeNuvqBuCKSTawt653NV
         1bjzlTrgULcuJr9mbRT67SmoqkQ8PkLW1dk5e6IPG5RYRNZMb85tevkdW7QP230YUUhn
         x1YJJOiPI0Bg22kHQGDyZyklJSkisohICrGiHlQp/7USFnPtHKl87xP4Cm8mITGyLnEz
         n2AQ==
X-Gm-Message-State: AOJu0YygqEKwHPqOge491TLRNMyOm+7h1Mipt3SCEhqhX+mMgCnQvbez
	rz112KV94FOaUvcGD0Y4VFomlYsoWS6o3EeR9/xIPJOgACAL47pKlJwo
X-Gm-Gg: ASbGncu3hTVq5IbJg2yP1MvbV/IBNMNlzhI7ESOMhNWdrfl2RX1BicOocLBSx3Scv2l
	Uw8NjunOAy7aCQ2xV4cSulyHGK3UnA7jPCAHa4YlUNvnlZs3ealKf5XCB1XC15isyWML1Z3ZU+p
	njY8hbBp4wVUiOOO/cs47HnAHokrxcqKFAZbd2zA3QeocPiR9Ma/tW1eSsYCX3C3jZY0NUmXItT
	L87mEdTt6esgDC6g4WxCf+ybispBu/rnWTW6zVUfwTE7GYAh3vaFeZp/NiRW+AlDRITfoLdFvf4
	pHDx0COsyKU9V/tBT1ZRfj9AOi/E+x8N5R5pXvxxb82aEl86CGLm24LopDg0FusND/uMS47Zkd4
	8VhrXjfn+GBw1C4MVRg7/1TkzXa5D13sJO31J+IByx77/Rhm2BfE=
X-Google-Smtp-Source: AGHT+IHcbXuadl6qxtnidApDSs9NzEUJ2cD3eGt2HX37g2K/AJeCuHsM00R7bkbMn30UiDk69xZy7Q==
X-Received: by 2002:a05:6a21:998b:b0:248:86a1:a242 with SMTP id adf61e73a8af0-24886a1a561mr2427957637.4.1756901169787;
        Wed, 03 Sep 2025 05:06:09 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:06:09 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 7/8] LoongArch: BPF: Make error handling robust in arch_prepare_bpf_trampoline()
Date: Wed,  3 Sep 2025 07:01:12 +0000
Message-ID: <20250903070113.42215-8-hengqi.chen@gmail.com>
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

Bail out instead of trying to perform a bpf_arch_text_copy()
if __arch_prepare_bpf_trampoline() failed.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 07ca32c673d5..6dba407c202f 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1719,7 +1719,10 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
 
 	jit_fill_hole(image, (unsigned int)(ro_image_end - ro_image));
 	ret = __arch_prepare_bpf_trampoline(&ctx, im, m, tlinks, func_addr, flags);
-	if (ret > 0 && validate_code(&ctx) < 0) {
+	if (ret < 0)
+		goto out;
+
+	if (validate_code(&ctx) < 0) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.43.5

