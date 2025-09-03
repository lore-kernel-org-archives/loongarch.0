Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110D28467D
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901168; cv=none; b=DPK9VurJ+Cdbf5N1fw8GLCNvQcs9S8FvTuPfi/pae34t0Pd7onRVVX/pANBugfyU5Vlx6ikCwxeMpQA8UwUwqgW0bFLnCcPAX58agna4jP8AvHkX5ZwDpt7ymMrO9x/ptFgMYp7FP6T9NUzkUEhhbJD+9FCjL3xSTC24Brd8lHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901168; c=relaxed/simple;
	bh=0OMtucW60YAzR5hU4oEuQTn0vNb0HaJ3df68UwygFuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvw/wLP9BMCKnB6+CaVKj3SsHdUYAX5kcSYWU+R8PkC6pbQ6NCAsFgqGdu6OPOxnAvQsrfm+Nah7uJkQ5XcerX1rro4HVSt8UFV7JN7KSj25l0Eh8k/CELDjHo+2jtj5W+pmpIoWM0LOf4SDarQGBiZK/O8+rVIBRM2qmxmiSVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a40JtwVa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a40JtwVa"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so880995b3a.1
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901167; x=1757505967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeOtodTRI+OBS50kot4CSeaPmna3ks2JaD3tu8/xt+o=;
        b=a40JtwVaEpCsI455eVjLRldKLvHLpZoFRDKE5p0FZKkBBS6Hh+PSyjNt5GJ9t5fR9E
         6+uuE5Y4sUd2F1v5QRywN9xwU/LyhG7RS4zL6xCe4htLzkieV+Vubsz7VDmzboPL37mN
         9e/o2pSJXB2N0ouVjhqK7jgRD0rs4O/cLhz4Te5HxDIf+Ous1prVY873B/VVHLxmJFKS
         SE8U3ga1cbG6+Pd/cJtItmiRAXKRMaHipaOigOM7qLI2+shZfjBQAlX5rpYtQG1O5XtC
         A+dhJ8L3WLwUgA0Y49YQi0AaIw2G0+Z+dvZ7Z2xX1Us9HEn82gOvdjZ7A1UQ5jjKYtUy
         Wl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901167; x=1757505967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeOtodTRI+OBS50kot4CSeaPmna3ks2JaD3tu8/xt+o=;
        b=JdS8NEbkHmJEH2/IlPA80FIrNmxqtwwccYj8ck+190Mq+HhnpqwD3DEHFYKd8OcAZr
         JweiRESa3OBB5YnGH0p/22u23Bp/AZ0mCHXk0QNl3C5HM2avY7X1Bqqevhipi/kGZFJi
         1CZIcqIwgBFrVKn68iioQCKx4RhoOgqE5GypCymxYWbexjfE/H/asVXBwfthlf8XB9x3
         Vju9V9YhJjGDoK3qeeAs18LpxPS73YBDkSLquA77Azr+69CwkisGRLNNoT0mqLGm9fKH
         HtQ//J6+QFwpa1kpP72i+THUFtoCyMkfmCgPBAzouzcozMsZ/9EBEcRluSeaN74x3A96
         8B1w==
X-Gm-Message-State: AOJu0YzWQIuCCgFA9ppojd/VBso//km92FeXo3GuN/m2ghGQFjuBdCf4
	dA8GLaurttCoLoC2EaTIhz1RmMUQn5FaIQ69u14rIts+Gm71iOR2O23rw8hmZW8XTdo=
X-Gm-Gg: ASbGnctPr1KnoIlto7SzlIfz9U1Bt9gB8KVwXwAr+VgvPJu3Hi7u3qybdlMU/qxfcn8
	+whAwkLKG7il8qm8I02P7kl+sZvTcbhBtkS3aT+5Tgu5lgM3DAMdLT73buYb1K3Hbpw+2jv/JQb
	8KdSh0wrULLyukc5a1XlIoliTBA1vYjHFn/lDqxRRXFvmOWxFUH0GuBpeU7plL54zLos/AS8qeD
	XXgsroQDyz4EhQhLIsdKUHAs0WuT9013xMTXo7WA86XoVztrsB3RXGTWZp1aQd74YOkn2tvSfu+
	+saSk0aEOnSY9XwUMckrLOaccPZCkljDaDPPz7mMcMjWf/ZkilWYtUdEauS2Hp42A1zq7cSrYuO
	n5IRae/Nn4LdPjAH9373bwDJr/Wf/Kzy1R2Txuhad2IHOnENSVE8=
X-Google-Smtp-Source: AGHT+IEgLpaebfrGWFEDqZ1Vr8B2710uXLEoN/+Sw96hSPwPaY07+Omw+Jui0vIxxxqP75bjS2Hxiw==
X-Received: by 2002:a05:6a00:a85:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-7723e2578c1mr18564170b3a.6.1756901166565;
        Wed, 03 Sep 2025 05:06:06 -0700 (PDT)
Received: from devbox.. ([43.132.141.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm16615899b3a.92.2025.09.03.05.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:06:06 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	hejinyang@loongson.cn
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v4 6/8] LoongArch: BPF: Make trampoline size stable
Date: Wed,  3 Sep 2025 07:01:11 +0000
Message-ID: <20250903070113.42215-7-hengqi.chen@gmail.com>
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

