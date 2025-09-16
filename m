Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9C22F39BC
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074162; cv=none; b=Ul33JA36I9Rl1WWJiYJQZjbN6NiMcUoXqZZFj2BdDOJiNQH9eRJT/8+4SThtzvVFMYtEiS1dXUcIxT6WY7hRwKSjzfLfb/i5G+PJ4URajsuY+MB5qJokJfbkbqurzzSxY+Ac7FIIRZdGaq7EH1/dCD3h+3eG8Hp58ARJcd7o48A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074162; c=relaxed/simple;
	bh=NewO4njemEniVz7mSlQozZsOjqSCSXJQc2zH/OdZIqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjnPtgM6TqRbnF9f0yKHNJNrKzcZk32KXh77U3mxcQAFFLs/RFqUfUasiCNJmcw3tgxs/+4LoYHmiZZzCFqfTTcWZyp+dUCtF6AphSVLWcrYFoh3XwV0xJys1KbuVeQIROtse0x54vNk9MEvAx64mAhARrlnwVoKJH+Ag0f7oeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duYLwZSx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duYLwZSx"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-267a5aeb9f1so17684695ad.1
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 18:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758074160; x=1758678960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq3M1EuezVXyFff7JhHFKkQRUBD32DzfJXZ578Wxpbo=;
        b=duYLwZSxH4pLiBrn0c6dsYSphOBuOFkgqt3rGmd9ap0/x8UtzDzsHpqmf/05/Dypi0
         Ea0SoACP2eUdQOo0/+siCUAY5R5ZCHqgcvKr2Dvve+9UtWBnplzyshzsOIQmWVwpBfMS
         ngYzzlq6f1B7b9ZYIiBfHrO+v7cduVjvAYV1mHgCCGGHAhrDgdPBbgs5e3YgHaXS2jF6
         RTi9K2mKIXn99MUU85HWo4eEzesAE63qu0ZVLQv0cofMZXZcunvuK9mhgKKMnsDkCegB
         6/zS6hkSVPKGasmwuFFz4cYeWKNiPr8RqLxc8CNI2Ba7c8p/VulF+lqTLPvZSxtDkUds
         s//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758074160; x=1758678960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sq3M1EuezVXyFff7JhHFKkQRUBD32DzfJXZ578Wxpbo=;
        b=Dk3SAz07LnKO1Kxaak9Vws9XMaQMRjV62CME77OytSk8ufZhnDafR2+98llB5Sst9X
         FEDmwryNEl8lLVMTyDF2cm0QLSANZ24js15AFAEapTZEB2QqP1AFkYIU4KIbhEWEwD/m
         7DKN3KxA9lGJuohnnN6fvkimn8mXBoBRnZlK1icZeQE6hOJXEnUqIs3nUJqIoYlYSYUo
         L450BCxRNZOR7QBNsLmCtGSFrEPY5gBdzBmeIvMl+TefJnu97wAao+mKChNPHNnnd0F0
         aj92m2dZCkjqh7XWCoSU0mMGSVWgDynz4MN2dR8l1VDwH2g2q8Od2udr9k+qPOfHVkc1
         tY/w==
X-Gm-Message-State: AOJu0Yw9/RvauAmCfsCOj9KY9A+krosb4t5P/178IGNC4fC4gw2hvYw0
	9kfBQTQymUrHRv/50HBV3T1+ttF4mLcrab1h/U26OQkuvnfH/DgdmVrj
X-Gm-Gg: ASbGncuFymYw2sApTEegRetKx11XQcOuKjSrXBfzMBW1Yprf6Ci4Kpf806tuet41B8B
	IaVRyJMVdOF60EWP23+YrRBeXPtwK5hlWHQFf+POFVcU5NzM2QyZw1tHijSkerkxrIZL3Ffl0zI
	Wnk8+mRKD7JFB8g0kFovYNyREK2Xp+PIi4WHU9Y1nAG+ZrUX/P3ndPJKtuszWMrF/RLGM2Ktije
	k1jJ/uSPaLjAZ/bTtHidwyD4AYitqisQ6ZSUNM4TwPf6sPmJJ8NB62+uvYul9CV2c7Z6Gy8nbJP
	aoWtU0ioyU9/pvcW25tMP4jutTYdDd0qpuo2OxXp4EKrtbR7/7WdaJMfFkjMXKZVydO5vxXjElL
	IhheC3sTW2IoxV7anb2EHIx1hxbpuGNG5V29/FWg=
X-Google-Smtp-Source: AGHT+IF5fjddfpB51TxPXnYtXn8g3/ZIZOrSWL7YRRgoxuyt/8u/ymntWldtAkNVPfPw/7xnSYJ0pg==
X-Received: by 2002:a17:902:ec92:b0:252:8cc1:84a3 with SMTP id d9443c01a7336-268138fdec3mr5046945ad.43.1758074159795;
        Tue, 16 Sep 2025 18:55:59 -0700 (PDT)
Received: from devbox.. ([43.132.141.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm839746a91.29.2025.09.16.18.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:55:59 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v5 6/8] LoongArch: BPF: Make trampoline size stable
Date: Tue, 16 Sep 2025 23:56:25 +0000
Message-ID: <20250916235627.102831-7-hengqi.chen@gmail.com>
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

When attach fentry/fexit BPF programs, __arch_prepare_bpf_trampoline()
is called twice with different `struct bpf_tramp_image *im`:

    bpf_trampoline_update
        -> arch_bpf_trampoline_size
            -> __arch_prepare_bpf_trampoline
        -> arch_prepare_bpf_trampoline
            -> __arch_prepare_bpf_trampoline

Use move_imm() will emit unstable instruction sequences, let's use
move_addr() instead to prevent subtle bugs.

(I observed this while debugging other issues with printk.)

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 43628b5e1553..07ca32c673d5 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1599,7 +1599,7 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 		orig_call += LOONGARCH_BPF_FENTRY_NBYTES;
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
-		move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
+		move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
 		ret = emit_call(ctx, (const u64)__bpf_tramp_enter);
 		if (ret)
 			return ret;
@@ -1649,7 +1649,7 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		im->ip_epilogue = ctx->ro_image + ctx->idx;
-		move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
+		move_addr(ctx, LOONGARCH_GPR_A0, (const u64)im);
 		ret = emit_call(ctx, (const u64)__bpf_tramp_exit);
 		if (ret)
 			goto out;
-- 
2.43.5

