Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C03A299AB4
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763963831; cv=none; b=e9Y8s7+1mn0+g7pKy2Ec/8vcuEsA5i5dd+Q1whWxLab6FG+ONJbwkjYwkRQM49JkC+eo77wBZN9iYhlVHOXVAbxtYFluBKmJ3ZsS+yJLACMmWoofYdqubNJaCUy2/VUWwqawfxUZrPDsHnYsDgwF4DCxahSa+OUgwK5S0P+NCSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763963831; c=relaxed/simple;
	bh=a3FS4lXFVduG2Jdpv14EyGB5mP1sh4xLeovTZaM92/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSggUCYpk358zrONkqv7lX3qtmVmSBEQ42iX3QJ6KBnBgEiF9AnGt6mcV8/fpZqG8ZpIxmYoqi8Te66H20KWRG2BTwUhztVjuSmA4h0tRQy3fT4mpEheXLhUISn7gQOLto38xWoe0nlzTmjcJT94BfMPkIaCFv5AU/ir9Jax3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNMbPiAJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNMbPiAJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29555415c5fso43223055ad.1
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 21:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763963828; x=1764568628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpHaUb8qBqlBZqFVXhT7R9Iw5whC1Uicg7Q6tNoLowY=;
        b=MNMbPiAJcJ5xcr17IM5x0PxpIztzygAfXld0leXZqilJAaU9zEp1JgGBO/l6siggkG
         MAxBXhDpIS0ZXQ6WoyP1/NtoH4hCVFKszeISIOf2S/fVqlhh5F9Aqpmawrxxf0nOaJgx
         I6TewSXLFwfRLvTYyOIfi5Olj2j1w1l1sE/LQUovglRTUiHbWBdLAVyxkMYLEV+Axamx
         j8EVhainu3DKR36WsQe9dCs9/SDi5+mU8p3NpLuDMzQjd1N6MLFm6qErNb1D8vVLUZQq
         3KIb3f5iXUkEZxqlGP+h2BcMLfvchBDMV1dG5WI7cbZ/a7K0IC61TmiRDoRzXBI0xYT0
         Po3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763963828; x=1764568628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bpHaUb8qBqlBZqFVXhT7R9Iw5whC1Uicg7Q6tNoLowY=;
        b=ooSpOXxo8OzArZKeFZLoDO+/IZmNbpNOsqNLcA5TfJoLn9FOi3veWR5lqWY2tPMTyu
         6YIDQkjXj+qPp5EmBOzTBv/LwSBl3awbW7iAHCf79ZYex/RA+n8G1u3F0UKXAozDc1+D
         IHanc4tUMjzRL+cGTW2tCm5dFVzzRKxDQZsZ8tRgTeqyTH3O2BkQzVk640hQ05uPt7NQ
         aYs1v3IFDVMJgf7dvmvVfq/PUgPNPYgGp0sbgtp2IyhuIzgRh1zug0um3Oa0S61PHNxd
         9JhlRCCsEDTRIqQkrz8YAcfWFK+S4xS/bqsjzWlKbdWVZUM6LAgsoqgRKhRoH7rBVfVw
         Xbbw==
X-Gm-Message-State: AOJu0YweZOP2zPhL3r1rEIpCuGnR9MViXBdMBC5fPvuMcgcSeUyDG4i1
	J0PtzRR/JTi9UBwL/hQNpV/7GRz8P3UOP8Dm/MlRZ0u23HMDbaISBfXx
X-Gm-Gg: ASbGncsBvh6/3x2LvwzHVgG7Ed5IXOSJ9lCiL5arWfiDDLepzIpIiW4ZcJ5nMzMNQ66
	pjN3TW+fpdIT3PEZbLU9gapWBFKu+efGr7twE2O25nNF6q1KzQqvPs6z/iV6YC9FfZiQ3kZIz7g
	lO5Nj3fuO8cdgQW5g9WFDKrryTTIaC6e+BDI5czzZBL2isD2KDoxObXbIC1VhakjZIDR6OzvX3u
	mE9BZayAF848hYxSwdK/gZ1c+2qarVuwb6KG4pKzp1VcIzBdC62Rj519w3j3ez+YBKSLxPxhEWL
	MB9EaVxvBLDQN7LvBBPhuQRLc5cUDry76W3d9CZpURiIamAIgPGqkaXUjH4b/Rtx9MJExy+YiEQ
	0QiMasz88p+dNFnxRrAPuzYVNuNpPwThZJlV6nYZ/vKzLo+4UGlS5loGw+cvuGLqj6KAT7LHO5h
	QJ8Tv0oh1txDS3YzXgYuNZhO7Uva07
X-Google-Smtp-Source: AGHT+IEWKwuJfGzH7IniwZINBdtXQX6FxLxbtPkBvyMvsNt+4ZyLZYWA/rYVFZCCO/00DQRFftbR9A==
X-Received: by 2002:a17:903:2f82:b0:295:425a:350e with SMTP id d9443c01a7336-29b6c3dc000mr108160595ad.8.1763963828331;
        Sun, 23 Nov 2025 21:57:08 -0800 (PST)
Received: from devbox.. ([43.132.141.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b106094sm124881785ad.10.2025.11.23.21.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 21:57:08 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 5/5] LoongArch: BPF: Implement bpf_addr_space_cast instruction
Date: Mon, 24 Nov 2025 05:56:42 +0000
Message-ID: <20251124055642.1591-6-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124055642.1591-1-hengqi.chen@gmail.com>
References: <20251124055642.1591-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LLVM generates bpf_addr_space_cast instruction while translating
pointers between native (zero) address space and
__attribute__((address_space(N))). The addr_space=0 is reserved as
bpf_arena address space.

rY = addr_space_cast(rX, 0, 1) is processed by the verifier and
converted to normal 32-bit move: wX = wY

rY = addr_space_cast(rX, 1, 0) has to be converted by JIT.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 15 +++++++++++++++
 arch/loongarch/net/bpf_jit.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 14188e8d86bc..12fc7bfe3fe4 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -560,6 +560,15 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	/* dst = src */
 	case BPF_ALU | BPF_MOV | BPF_X:
 	case BPF_ALU64 | BPF_MOV | BPF_X:
+		if (insn_is_cast_user(insn)) {
+			move_reg(ctx, t1, src);
+			emit_zext_32(ctx, t1, true);
+			move_imm(ctx, dst, (ctx->user_vm_start >> 32) << 32, false);
+			emit_insn(ctx, beq, t1, LOONGARCH_GPR_ZERO, 1);
+			emit_insn(ctx, or, t1, dst, t1);
+			move_reg(ctx, dst, t1);
+			break;
+		}
 		switch (off) {
 		case 0:
 			move_reg(ctx, dst, src);
@@ -1936,6 +1945,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	memset(&ctx, 0, sizeof(ctx));
 	ctx.prog = prog;
 	ctx.arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
+	ctx.user_vm_start = bpf_arena_get_user_vm_start(prog->aux->arena);
 
 	ctx.offset = kvcalloc(prog->len + 1, sizeof(u32), GFP_KERNEL);
 	if (ctx.offset == NULL) {
@@ -2097,3 +2107,8 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_arena(void)
+{
+	return true;
+}
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index 328ec445a710..93720f5ec8bb 100644
--- a/arch/loongarch/net/bpf_jit.h
+++ b/arch/loongarch/net/bpf_jit.h
@@ -21,6 +21,7 @@ struct jit_ctx {
 	union loongarch_instruction *ro_image;
 	u32 stack_size;
 	u64 arena_vm_start;
+	u64 user_vm_start;
 };
 
 struct jit_data {
-- 
2.43.5

