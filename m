Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B2721255E
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074164; cv=none; b=GagF//2XsDYGUtq5zF60dBO5ztX6BMEV/d3whAE+FTAeH2uPNFTpxvEk2i+p9Ee1K15HfkRzUx9MZpCB2i9w3wqaorarlmZ4Dp1MDXL6Ep2tqEiK9YO1Q2KqSy7lrUbuMNAHWw2Mz6VDIgpnZsN1ZFfrrzSm0IB0QlBG1bnFGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074164; c=relaxed/simple;
	bh=mfRqLxrQbK9ufYnhCzdh6ReMtMnLnEihp/qs/DK77aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCdGyyYRuJ1458L6iV6ho8XTyRHs0EVOelJ13fOmhJHSO/9SNpL77vxZ5dY5bq2HPNVoXt6LW+QfWe6/NnAzui8wYt/2m06lPqzGXWryl/PG96a8EKEPwenL52sc4h4awZ7Jjc08b718MnyJvu8ydTOi0b/ue6rlOQ1nh6hee94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1/4URfE; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1/4URfE"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-323266cdf64so5320737a91.0
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758074163; x=1758678963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YZmDj07Ldq6nfFbWtqFrG1CWWP+54yDeybcH+1ins0=;
        b=C1/4URfEZJ6mBahhi3K6Fy3mICiXaNKpEbPGloCadFwFfDhPdACKSXuOtINM0fW80R
         PgDfed11FoBbIbe1uetkVxH9NEuUXHm79op4ScfaY/PMO7i7cgSx8How0dNkg1QgX24j
         58/0lnQ+EOMHWxXipM8O9JpHyGyFxycv0Hiu7ZfTlbrFlAE5sMOHvymhePsL1AvkRWrK
         sMrCk6oTrwyllPCj7RXq0P5bpBzImMw22EC252FrDHj1i+FuM4IVqGdAXPV8PN5Io94q
         QCN/r81a1cWs/R1g4FGz/bpEvrAEDVpspVd1ahGd2ow23MpuoEA0NEXO5hYNn7ONzZC8
         jArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758074163; x=1758678963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YZmDj07Ldq6nfFbWtqFrG1CWWP+54yDeybcH+1ins0=;
        b=fLZIrK7qch4Ut043EPuxOM3YZNmltDnNReGwWkeB7sYJfs/TE0vWPu2MqM+okNSua6
         qRUoIZ2m0TGxfBNI7/0C2nhqx0XXHGbcCIrrC1eC8DHiI1Wk7+5wL052ZI6LFd3dN0tS
         c1gSJRUPJLVidQAhP9z1VzE7K1C8Y+yswiGLNDf7Bot000yRA98Q4EnTZih2fkibLdWC
         ZnTlFnXp2szv3g7fIyHKbE2/I3CrIIernivCG+dZI8LYnxfRnfz5s4IdMc7/3rgw46Mx
         YBZHKqzPI+DyKFFOfJ/MIAy8k5zZrhPXZhMLJrG3sR/dMF++KPg1SQ/xGDo7Sv4694v0
         cWzw==
X-Gm-Message-State: AOJu0YyeBbfxLq7Fz/pIJtVVQMd9Thh6EdRWYRBGzYAVG2migHCDQNQi
	wXGwYbwVSuKMbxbWnMLaw5Q80lW4+nJTrck4rsIUexHA9j0AiDpHMb47
X-Gm-Gg: ASbGncse9blzhzCshzptXKodkFLY5hZ78jCopwyDnVnCgCgvrcEB7Z5X3EYAnc7llSa
	yIGaZMfrs4V4YL/fDmHzZQZ+vIC6mxrGvvUaBGl7UcRx0dzRK8NKyQYEcP4RDLIudZ8NsZ2uthk
	KYk6DoiFiIL5Qy3dDYga5Mbxdm0V1L+G+yDISqLKJdXQlPERUzEeDlf029/1FA9MGCZp3JH/h+M
	NL0wFs+e7Uqr5VfIWaWjOL6O7KzWY+t+OsXz51oVNCB33r2tGtQ3Fo8jn+5MzhZu83c8GvNFKCv
	jLYUgu7S7qnchzpTQjdSLHqC2aiXYtGzMDTJxlsYlEi7ICP71U7q8kp1XuwO7UPmxbKOOqbXQUX
	NekK0MTXrJvwcOv0xY12tSYNzGiaRPrKSZNd/1Do=
X-Google-Smtp-Source: AGHT+IEPezc3fCIlqK6q6kkW62MMrj0UPvtlQGeTeHmKqthwGoxKgXhG9PAfeRYqe0wKpbk84GVKhQ==
X-Received: by 2002:a17:90b:560c:b0:32e:3f93:69dc with SMTP id 98e67ed59e1d1-32ee3f6408emr539450a91.25.1758074162530;
        Tue, 16 Sep 2025 18:56:02 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm839746a91.29.2025.09.16.18.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:56:02 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v5 7/8] LoongArch: BPF: Make error handling robust in arch_prepare_bpf_trampoline()
Date: Tue, 16 Sep 2025 23:56:26 +0000
Message-ID: <20250916235627.102831-8-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916235627.102831-1-hengqi.chen@gmail.com>
References: <20250916235627.102831-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bail out instead of trying to perform a bpf_arch_text_copy()
if __arch_prepare_bpf_trampoline() failed.

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
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

