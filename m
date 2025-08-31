Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B29C273FD
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756691751; cv=none; b=E3SC2UIPRqD8agnofO3MFRmxgDBJsHx/5dhqi35DNLpws500P8UUix9MT+v4DcKLwzTwyD/AekFMFQa8tQ3xG6A3FjwvUXwwkFJ78b44oVrICiayfXTKT/RSCen13ZPU/ANOBO0AdVgS4fy6ESljrvvTuY82h3CpXrCeT7fL7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756691751; c=relaxed/simple;
	bh=B3IoHA5CU5Vhbudi+gAnvUlk1xOMZZA5ef7d4rvycy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnQJjFETNVWOwvR+VVJkht+aB4ixC5+gYuKJQ1U8EgTjqOIW6Ex5SSezoV0/jfHVSyMIXvdNuLs247H8IHDTvP8ztt3lzsGRD2PTwWRbtm8y/rT2zMM5+6u/edJrzNo7m+xE7n/XPeAWQc8wUoEcdBh7U8sxcjCuFunEPT1VqgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAoxWMWD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAoxWMWD"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-327705d0a9bso3299887a91.0
        for <loongarch@lists.linux.dev>; Sun, 31 Aug 2025 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756691749; x=1757296549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhGYyByMutM4bNKtp1mgwhdBo+AYNzVb7+uzUi0Q8fs=;
        b=DAoxWMWDigppNoJSwiJVslEVaCT9t6uz9rh2BKCZlLvLzW2ffPzdcJPLYFo8Ts8koe
         pleFK3f190WX5V+wsRL+2ysvKC9Az+D+iATEbeuWDWZlCQZ4i/j2HcCAcnp7aiKWNhq1
         rKbMGe4FjeWzjpIit8nGUSlDhgE/Zs+I255HVKODGIR0xl6e4wNEev49N8ciMJjoALdR
         XyWA+vpe8oz7kjuU+wVzdwL3hj2QSAJF1rSfTuotTnpgvF6efh7Vjd4+8b3l/LlEZhsR
         iQoodtXeCUPRYPpcopKIFNoUxQVgjThpAHFsWFaUAWDAKkKbfjg+UkMh+HIlvGRNnjCZ
         PQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756691749; x=1757296549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhGYyByMutM4bNKtp1mgwhdBo+AYNzVb7+uzUi0Q8fs=;
        b=YzsqQICIi3caiGBYIufQS4eGaQSvz29Z/GvIR8u9n9CalxIUFI8R676ARbEWa1Us4O
         UJL0jYvsc0OahWca7/HpyG1cYf2odUraDVlnejIwfSjcJhgVMNLCaSly78ObmJaQlTkh
         6GXlZB82SnV3pstOy/VBPF+Hs5Fq4IpsG8DdKP3+vg0rqr5mHxo8c1jKJBIBWV5Ae/69
         +tV3QTD+mrOAEStIDcKh56Y6TKLLUaVCemfwrpKvj3/kgtDzo8HHo5iiacG3yFlIdTSJ
         NMpmuT8GO8k9qhiJjw0Tb7WZW4sf2Jxx83x52d3ivV/bYU/YB+rsq1aPtZiEWRhhWxYL
         6KLg==
X-Gm-Message-State: AOJu0Yx5APM2zjkG/mZjgrDaV91fpBJS/zoLOByyR1pg6FR/f7U09oHy
	/Mg8aq7lF+1XvLLPZru1jai4PFkehnFiY3uclRlFCxz2w7YOkESXEgaW
X-Gm-Gg: ASbGncsqdJGIQmlRCY1xwY55MVVSQL4v7+EjhWn8IMD7xpUoyS4mQBc+hQEi9b+Lzz6
	TEEQDfvZYcQj58CkKovFT6lldpydugjV+I5F2r1mp1UZtogaC/PPywMLVVP6dinPCh+G7eD9ngT
	jC3y6KhJof/F0TNg5GCteAuvnjXob0eRuhx6bZDGnlqR+aZHhdeD4vPT+B7VBHLLDl6MDG/Cetn
	Ksm3k2h13PBw54BfjicDJhMjOFvHDGbhP18edm2Pg91n5E/p/uuN8Jj7MsOLh+H0jp8SY/+rt00
	J5fI3tGsRi4Jq+s/1HI1R9kgKB8oGwUP6jNnCkxOZCv7TZrEgo4Ds8NU/SL8ORaly9Nos9sLrR4
	Sft0xkuLWQwvvJGfRGuZQshHfJkrLbpV2xP07K0g=
X-Google-Smtp-Source: AGHT+IHdv9fgOoA2NgFojHz6dM3OgKaUKoMSxzjKmVKNS58gHD2BIcPvnUZxwUgv2brOI25V+76dEA==
X-Received: by 2002:a17:90b:3d92:b0:31e:3d06:739c with SMTP id 98e67ed59e1d1-328156f73aemr6415063a91.31.1756691749306;
        Sun, 31 Aug 2025 18:55:49 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006c340sm8103034a12.1.2025.08.31.18.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 18:55:48 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v3 1/3] LoongArch: BPF: Remove duplicated flags check
Date: Sun, 31 Aug 2025 23:43:26 +0000
Message-ID: <20250831234328.22440-2-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250831234328.22440-1-hengqi.chen@gmail.com>
References: <20250831234328.22440-1-hengqi.chen@gmail.com>
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


