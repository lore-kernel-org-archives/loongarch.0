Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFCF1A2398
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293582; cv=none; b=CDPYQjviOccvlrvi/uqHu2liRRSCeObWMFfyQTqhE2kc9we6QOVxVQYk3SoBuOjioL/ylgO+bS5uefw1yIlOsA/kw5n8he51u7CeYqHgaqSAG+mUXcRoKYjFIu6Qxcsn+JfQl7qegHavfK3Lmw6xaKCn++zJLfDCEGgAp1rTGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293582; c=relaxed/simple;
	bh=B3IoHA5CU5Vhbudi+gAnvUlk1xOMZZA5ef7d4rvycy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URUx/TYecBMhkjxAwhIxSh1jyXqjhJ+ogqug9pmlqxgh9XO+5JyRumuYC0Spp6YAfMZydqYYwILC4hYLU7NsknAqkZ/WIG3x0G71hjwAG9Q0V73ZIKAo1t88Xejn4MvJuE8LP46DCmZ/hd2kIc23/FkRLbYu2YDJRzAsTrlSE7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/VUPBGy; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/VUPBGy"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-771f69fd6feso2471014b3a.1
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293581; x=1756898381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhGYyByMutM4bNKtp1mgwhdBo+AYNzVb7+uzUi0Q8fs=;
        b=m/VUPBGyNEMzcho7Bab/0MGryzZRo1AT9z5rgFkVbj9EPP/qfHOxx4imvFSZDRw2CP
         /HpxADd6CsZBHszTevtQTFwH1vvKYwzfw1fn9rTS0nDeUxauDnA4zNJ1VV+KyKdEASde
         WYzPNnr8l7Ff49T8qrvf9pexYzX2/DkHRDFxJZL9mCuAwck+eLAEpEnAG6F6P7GFqujP
         YjTU6QupOOin7cTLxflEAUyA2vAO3GREQQtoY59LoS6JvmYtiAT840hH9Z1LoY9xosCm
         jLrSbO9twEmJfoJ8o56OwjQRWxy/AG1PK0NH+jK4aFL51Cko0Zgf9BY9jRkmyGK5pP4g
         rCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293581; x=1756898381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhGYyByMutM4bNKtp1mgwhdBo+AYNzVb7+uzUi0Q8fs=;
        b=siL6KQvPqHdsNROQk+WxTFkSj0IQ56E21S9FJs2KDt4oKcywvs/wGMALIG67vQTd8m
         mX46sgB4ov8nMq9bksdKyw6XDi0GeSX6qokQG1qOY2xhvLpxAvtQ6+1hpjbZc8WU4Yoq
         +DLGRnNp9BJS6dmimWE3u+xv86R8qW43NkVyzBIRcQQxEJNy+DqwpM50Xdhnpm4TDfGi
         NeOd2FT6VX50jm6sy1mBrUrXPFyL3nQez+pe3IYSaB4L/DVfNZk4l0oWTEQxTEYXSYHD
         EL+LOpVhdmOIvEkICD87XJWFSmIprBtV6LySoJ1nYgLzYKrSBJvrvz4Ns9AyxoPM0dru
         0QlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwW3vW0CcZZzWfoTTnSqc0VGCJb6drkA75dV5Q60T0qt46XfmLvBNNjdftNJFBupAXuIcIKCLP4QA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV73YwZPEUwSlTf1DqZYocdthbpg1jWZlPzGS64P4qBP2e0NDW
	pxtBCnjng2JHxv5naN6AIseEF2tHqzcCBC4Pfl8vI5QAXEVMvVjZP+GC
X-Gm-Gg: ASbGncuZctZiSi9WkyjwI616L5QNJxenM7tpCCONRZ/kR1QyAIpnvnx2+kjiABad4z/
	coM4O2GM3TydDxHli2QgD8mlLXlB7aYoPoB13J997//kLW3r+PD73S6tCSPEc09EfxvhXZjB6NV
	7Uqx06c1hiCtFcm1D6ZDDVoyKxJbdy0HcMGbz0mPlVqqDEUa1M5NQ2dWQkwZNh8ty3pSUGs+dK7
	r7lEHV0+qcXArGc23WdWGqjzU84mTwJTt28KRCA2DmQYaHNtgfpr/Ca94mwp0EKVs+5taUaZXBH
	6SYB6IJWrBCDrBzz0bBeDv6r52lr0IucbfXzNKUkfKaiv//7ne98T/WSOzTCYwc5GXhL5dM2I6o
	DUVAP3ghtj5aHlJ47z7wdSLxVbgEjaWHXz6XxXrkd
X-Google-Smtp-Source: AGHT+IFm9/bk92HhSMvH6AJXv5+SFfo/iMGcHmnhHa66QnomvkMmPxbBlOr4VfIVsDyy9RMTyQg56A==
X-Received: by 2002:a05:6a20:3f9e:b0:243:15b9:7657 with SMTP id adf61e73a8af0-24340d231f0mr23109694637.49.1756293580807;
        Wed, 27 Aug 2025 04:19:40 -0700 (PDT)
Received: from devbox.. ([43.132.141.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f8a3335sm1829729a91.13.2025.08.27.04.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:19:40 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	jianghaoran@kylinos.cn,
	duanchenghao@kylinos.cn,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	vincent.mc.li@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v2 1/3] LoongArch: BPF: Remove duplicated flags check
Date: Wed, 27 Aug 2025 09:47:31 +0000
Message-ID: <20250827094733.426839-2-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827094733.426839-1-hengqi.chen@gmail.com>
References: <20250827094733.426839-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY)
is duplicated in __arch_prepare_bpf_trampoline(). Remove it.

Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index abfdb6bb5c38..b646c6b73014 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1462,9 +1462,6 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
 	u32 **branches = NULL;
 
-	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
-		return -ENOTSUPP;
-
 	/*
 	 * FP + 8       [ RA to parent func ] return address to parent
 	 *                    function
-- 
2.43.5


