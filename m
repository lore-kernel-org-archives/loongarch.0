Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322591632C8
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 05:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759728826; cv=none; b=LPjUwoSqh+29J+wlpcWEKrnUnrAWkkvbqvRMUOiBmpb8KYOeFJXSHhXEXv/3Nqe353u8yK/KkHT3AgHM3chHxFPMap6DVAhbOrXAoFtXn0TzIYydToYNz1iNs4mj4ksiSHltWjlNLIMhLDgxuRjDnK1sLWMs16HTju9GdI60LiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759728826; c=relaxed/simple;
	bh=DPkzrJxP5nIkX9+pRiUEf6G9SUqLae9HEs6UCGtb5QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeWYG3Bu6kXwvpdI42Q8rPu8X5YkP80XlXRvhLlFiU1XVWqQsP2by8nQlbNaOqr0cBAH5GvX7tDbx1Rkp6cc1GTsMt8/6RdwfAVW8rCKi40Od+MyeMNrBxS6euNd1KLM7jt3itxSKrIlyyUEHN61VZyy23YW2bnoRWH1AIdjtsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMpblJQZ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMpblJQZ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b55640a2e33so3314305a12.2
        for <loongarch@lists.linux.dev>; Sun, 05 Oct 2025 22:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759728824; x=1760333624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+GcjUjH+qCW40aNUokrpo5VneAtLZTyBQC3PMLfSms=;
        b=bMpblJQZB3QcB7KsKlRnqmMoGsRyJdhYaRgdyTe6FMJuCE81AMk/UvqHkamVXbgIDN
         dLwOrU4VJrwWiitZ+9mwaAhdbWHpTFk446HmXrjfrebbLDtHWRPqBYuSAtTO1UHMnMWA
         m13bfMlvpXu8c1uwYH4uWYVnH7rnUVhCMLYfp4TffNEGzDVevv4sFNvRCwUx1JfOyv82
         f+rwcpKYwoKDpP8U4an8k7sE2+eJz66cYfb81rZAqn4PakLokscPoZWN9WqRwTPPy8QP
         Eh1X8PAD4b7abFPLhU2XtCPh5zBufn9Sw2juTFnwPvDCanmiKuJ8pdz4aG4JTc71YxPH
         gSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728824; x=1760333624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+GcjUjH+qCW40aNUokrpo5VneAtLZTyBQC3PMLfSms=;
        b=Ctysy/xcbpcy2Nq+BfKHhDn/r+QPrXgHzaOVNUNgIT1yUuYp9to5PsslEj4WrFSmaq
         vVf0GO3cI2nVy1G73ypKgxb5EgxRglvSrj/1ZiBmfObP8yBwoPk9yfa5OzqAA6vZXJsZ
         32u5XulhEyJ7hr5W1V9jWPzsV6S9L24q1Cr7aTES1i8SpYZVRCRA1lWwY2k0sLIB3qsu
         M3Miut4skPfPAVLJAeWy5BfK1WfPY4wW7Bb3xXh4VACMfrloAv2WfeyOMe1j81BLOQUI
         BwHKUeAwLz7TH5z+XwdbQ0tYGvAW5/H215Md5/d3ubhhpa+FRm2QSnFlsw0yAzAR1g4B
         3nyQ==
X-Gm-Message-State: AOJu0Yy06KcrdvE/+YziIry1FvJB1H7qgYvvyq8d/yLwgM2J+EoY6jmi
	KzASLDSeUG1bxzDFQuHgc0lY8Z4XQlPSep1WAPd0i6A0eXnORgDzwmf1XlDiWSofWyDXLA==
X-Gm-Gg: ASbGnctpWRo4bIUQAqqNArfeKAU8cc3pt8GQ5YbGQrgS2nbcGD+UH2TMEZ1FCGmYPa2
	DxvKTL3mYXdRWQiwE2pZeIsOtWvKWhyeG2x8Ypg88d+ZOr5rVOWT8+M8bxIYhn0eRHFJ19gacgj
	xVzMnBcMta3ZHJ9F0fDsViTLmP6xSh88COXvX7MzFF1XAIVFKco1TH7ivLmZhNxptEu7cFo72pA
	udsawhT0uN0zJzDTJ8ISbe9h+d9H8t4kuy2smm5TR2cexajXtdYLBH4PzW8dNToXj1MvTFpvPGd
	jL+a9zA/tYVEI5cXM5+hmFgAtH+k9v8DeRob2nIsbDNYDSeBruuwxTwjJNkOmydzPeif/MGr7TZ
	TPtM0VxAgZneYtp+i+YADBTTyRJ/8Ax7dqYkU+9nZaMZAvuNb9Xcyw93hhCieAcoL5g==
X-Google-Smtp-Source: AGHT+IH6iWfPL5tyvIchH6/tH5X2tdX98iNdvgcSzHjae6AAl6l708zOrAVbCHOJunaog6iMF1xu7Q==
X-Received: by 2002:a17:902:e883:b0:24e:81d2:cfda with SMTP id d9443c01a7336-28e9a3068d5mr136680865ad.0.1759728824115;
        Sun, 05 Oct 2025 22:33:44 -0700 (PDT)
Received: from devbox.. ([116.16.231.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88fcsm120187075ad.84.2025.10.05.22.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:33:43 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 2/7] LoongArch: BPF: Rename local variable sign_extend to sign_ext
Date: Mon,  6 Oct 2025 05:33:18 +0000
Message-ID: <20251006053323.193581-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006053323.193581-1-hengqi.chen@gmail.com>
References: <20251006053323.193581-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local variable sign_extend in build_insn() to sign_ext
to avoid naming conflict with sign_extend(). sign_extend() will
be used in upcoming change in build_insn().

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 4e6ef93ab0d3..579957b4d40a 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -535,7 +535,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 {
 	u8 tm = -1;
 	u64 func_addr;
-	bool func_addr_fixed, sign_extend;
+	bool func_addr_fixed, sign_ext;
 	int i = insn - ctx->prog->insnsi;
 	int ret, jmp_offset, tcc_ptr_off;
 	const u8 code = insn->code;
@@ -1035,18 +1035,18 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
-		sign_extend = BPF_MODE(insn->code) == BPF_MEMSX ||
-			      BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
+		sign_ext = BPF_MODE(code) == BPF_MEMSX ||
+			   BPF_MODE(code) == BPF_PROBE_MEMSX;
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
 			if (is_signed_imm12(off)) {
-				if (sign_extend)
+				if (sign_ext)
 					emit_insn(ctx, ldb, dst, src, off);
 				else
 					emit_insn(ctx, ldbu, dst, src, off);
 			} else {
 				move_imm(ctx, t1, off, is32);
-				if (sign_extend)
+				if (sign_ext)
 					emit_insn(ctx, ldxb, dst, src, t1);
 				else
 					emit_insn(ctx, ldxbu, dst, src, t1);
@@ -1054,13 +1054,13 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			break;
 		case BPF_H:
 			if (is_signed_imm12(off)) {
-				if (sign_extend)
+				if (sign_ext)
 					emit_insn(ctx, ldh, dst, src, off);
 				else
 					emit_insn(ctx, ldhu, dst, src, off);
 			} else {
 				move_imm(ctx, t1, off, is32);
-				if (sign_extend)
+				if (sign_ext)
 					emit_insn(ctx, ldxh, dst, src, t1);
 				else
 					emit_insn(ctx, ldxhu, dst, src, t1);
@@ -1068,13 +1068,13 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			break;
 		case BPF_W:
 			if (is_signed_imm12(off)) {
-				if (sign_extend)
+				if (sign_ext)
 					emit_insn(ctx, ldw, dst, src, off);
 				else
 					emit_insn(ctx, ldwu, dst, src, off);
 			} else {
 				move_imm(ctx, t1, off, is32);
-				if (sign_extend)
+				if (sign_ext)
 					emit_insn(ctx, ldxw, dst, src, t1);
 				else
 					emit_insn(ctx, ldxwu, dst, src, t1);
-- 
2.43.5

