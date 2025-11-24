Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67BA299AB4
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763963827; cv=none; b=OK+yu0setj4/SsicT8Y0hhOQ9pxakVWQ8fur6glwjgVF5FaQyjk+w4IQW5k/sPSbfq1sLOJEa0O5LjxlzJO496jouETehQxtdJgMmyTVe6e26vKkoJEM+5WZkC4zVHm0qlUYoZfQfvq/yGK96DLJVeO4/X2xKpKFzBqK2vi4Y4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763963827; c=relaxed/simple;
	bh=0S9NsCmEuhlYdz5rHVq7OXDlr9vkkRWwF7xWasmPXUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rE+J93eX5LDUCU7/6Yp0HQ0QMl/acb5RCVsmMx8krovK7M0dsN5EuhQegkRW+kdhS9D/VcHwvV0J4kb4/9p9J0m4T5rtdRBWIYNwLxXRwxpaasAhrYk6GUFLpMZqHRBh2mqs4Gxq0o1Ri1EgRSkmDY22rtqIwivy+a+V1KkMw9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d08mZQzk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d08mZQzk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-295548467c7so46693055ad.2
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 21:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763963825; x=1764568625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPSdX/GnPM9aUZ0LPHDd7XN9g1Vt7t3FVEaQcPQYxVs=;
        b=d08mZQzkBLdieo56bo85DEE8Zwz1ieo/L69A6wRr2gicgLnYBfIn4AFvi3h67L9FdL
         cNgfWfOd6bxKjLyF8jyeDLYoHdArPw+8Dht9rZMGmX0L3/U+0bQMAiLrhPR2swVVANPU
         z7mAExPcMsfbdme6el/I4erHBDmufik/m44YpvAHeQ0LifOQe6HJ6YBxI2LYVBj/DaGo
         JnewpzisCeVGjHsbSSBiSreVr9QwdpVrP9FD5SGMXvGw+1BIM6QajBO+dUzSg8PkXQT4
         Azh0DJoH0+4VzcM1mHjcFOA0NvBMKobCBaepnIc+bH+sCeuc4JLZ6x4tWyE7boZmvAnu
         7OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763963825; x=1764568625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vPSdX/GnPM9aUZ0LPHDd7XN9g1Vt7t3FVEaQcPQYxVs=;
        b=w1e6w1HsqKRxXnsRrNLB9/L5CKkH9i02JjEHnNMThRE5qd7gjk3qr6blE8s4xNUWaA
         U7geWstCIFldcnGUK5mFcFrFC1W4pOvuND1Vgxd0Z1rRQ+k6umlACyM7ikvs5dCbXDhw
         jfcWQJTgr4PHgegs7YTuc/kmYBrvKDOEYbBWRYIQbBW5fxy2r0Y5qtyCVvxmbPr6FQNG
         qR/84ns3xaSFkYUaqeZ2ibn6D13YGMNiUrFs3kyjmuO4MvZPfrnxy8A0xDbj3jeqjVGk
         fXv4NZzYUvB6/fpnqdv3CfeuENuGAQO7HLRsheU3Bz0ueiWSHPMCstzxzdbYtkBbVmjj
         4tqw==
X-Gm-Message-State: AOJu0Yz6BA4gxXeka3IfpAzOIMF5uy5/bXIPpamxhqOsrTfFF90YDwqU
	yfwfuqJ5B0cuj7VbPoeeMeGLc2HJFv/qPCPrDbCfCXh8/hygGiCWnGrU
X-Gm-Gg: ASbGncuL8AkyjNyPgDdEU/Pzri1abbNRh9i1KP82f15Z1HBKbiMJSKXG4+/53dTdiEY
	mXoPhQvieBoCq5d+qA328RstiV90o3Oih/BSmoV2cXgboOyyccn8z7lCB2uSrO8F7WiD4Yg+WsD
	LoVMh4hkMsdbxbzT/izO/NUM8WFImk9rKz4Zvi8C1WjG8ydK5jq0Kc3Ra6hq5O5VMQ/M+84nX3q
	BvMuwRRdtLXpmBmjNbuJfBmq5Wm14ML5SsJkoc3RwfrdTK6tdzPa5G49F0XgPcb/+NKQRcNMXS+
	yNDhY4nzBZ2z5nisES2vGQBZ+Ka2ZwhWPtwzqgvi9GjgY4crenxGOEtkBHNdhGWod87X8xsie4K
	1IyivF5r7a+kVgOv0O9KyYwRuNNBJXDoorH1EZKPIL1698/H7hOcs/DHJSvIvFCpy/2jr9IMAcH
	ck/c3xfuxP35/AEZanHTTHxZXdFTsj
X-Google-Smtp-Source: AGHT+IG7WtFTeVkFLig6ADCybE0FMg16uTyvWJXqTr2IQNzecVhCQNyJXIxsj6pYs3eNzWMEcdoaIQ==
X-Received: by 2002:a17:903:903:b0:295:a1a5:bae9 with SMTP id d9443c01a7336-29b6be86b48mr114117715ad.8.1763963825304;
        Sun, 23 Nov 2025 21:57:05 -0800 (PST)
Received: from devbox.. ([43.132.141.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b106094sm124881785ad.10.2025.11.23.21.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 21:57:04 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 4/5] LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
Date: Mon, 24 Nov 2025 05:56:41 +0000
Message-ID: <20251124055642.1591-5-hengqi.chen@gmail.com>
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

Add support for `{LDX,STX,ST} | PROBE_MEM32 | {B,H,W,DW}` instructions.
They are similar to PROBE_MEM instructions with the following differences:
 * PROBE_MEM32 supports store.
 * PROBE_MEM32 relies on the verifier to clear upper 32-bit of the
  src/dst register
 * PROBE_MEM32 adds 64-bit kern_vm_start address (which is stored in S6
  in the prologue). Due to bpf_arena constructions such S6 + reg +
  off16 access is guaranteed to be within arena virtual range, so no
  address check at run-time.
 * S6 is a free callee-saved register, so it is used to store arena_vm_start
 * PROBE_MEM32 allows STX and ST. If they fault the store is a nop. When
  LDX faults the destination register is zeroed.

To support these on LoongArch, we employ the t2/t3 registers to store
intermediate results of reg_arena + src/dst reg and use the t2/t3 registers
as the new src/dst reg. This allows us to reuse most of the existing code.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 69 +++++++++++++++++++++++++++++++++---
 arch/loongarch/net/bpf_jit.h |  1 +
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index c1c71c2e86f0..14188e8d86bc 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -17,6 +17,7 @@
 #define LOONGARCH_BPF_FENTRY_NBYTES (LOONGARCH_LONG_JUMP_NINSNS * 4)
 
 #define REG_TCC		LOONGARCH_GPR_A6
+#define REG_ARENA	LOONGARCH_GPR_S6 /* For storing arena_vm_start */
 #define BPF_TAIL_CALL_CNT_PTR_STACK_OFF(stack) (round_up(stack, 16) - 80)
 
 static const int regmap[] = {
@@ -136,6 +137,9 @@ static void build_prologue(struct jit_ctx *ctx)
 	/* To store tcc and tcc_ptr */
 	stack_adjust += sizeof(long) * 2;
 
+	if (ctx->arena_vm_start)
+		stack_adjust += 8;
+
 	stack_adjust = round_up(stack_adjust, 16);
 	stack_adjust += bpf_stack_adjust;
 
@@ -177,6 +181,11 @@ static void build_prologue(struct jit_ctx *ctx)
 	store_offset -= sizeof(long);
 	emit_insn(ctx, std, LOONGARCH_GPR_S5, LOONGARCH_GPR_SP, store_offset);
 
+	if (ctx->arena_vm_start) {
+		store_offset -= sizeof(long);
+		emit_insn(ctx, std, REG_ARENA, LOONGARCH_GPR_SP, store_offset);
+	}
+
 	prepare_bpf_tail_call_cnt(ctx, &store_offset);
 
 	emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_adjust);
@@ -185,6 +194,9 @@ static void build_prologue(struct jit_ctx *ctx)
 		emit_insn(ctx, addid, regmap[BPF_REG_FP], LOONGARCH_GPR_SP, bpf_stack_adjust);
 
 	ctx->stack_size = stack_adjust;
+
+	if (ctx->arena_vm_start)
+		move_imm(ctx, REG_ARENA, ctx->arena_vm_start, false);
 }
 
 static void __build_epilogue(struct jit_ctx *ctx, bool is_tail_call)
@@ -216,6 +228,11 @@ static void __build_epilogue(struct jit_ctx *ctx, bool is_tail_call)
 	load_offset -= sizeof(long);
 	emit_insn(ctx, ldd, LOONGARCH_GPR_S5, LOONGARCH_GPR_SP, load_offset);
 
+	if (ctx->arena_vm_start) {
+		load_offset -= sizeof(long);
+		emit_insn(ctx, ldd, REG_ARENA, LOONGARCH_GPR_SP, load_offset);
+	}
+
 	/*
 	 * When push into the stack, follow the order of tcc then tcc_ptr.
 	 * When pop from the stack, first pop tcc_ptr then followed by tcc.
@@ -441,6 +458,7 @@ static bool is_signed_bpf_cond(u8 cond)
 
 #define BPF_FIXUP_REG_MASK	GENMASK(31, 27)
 #define BPF_FIXUP_OFFSET_MASK	GENMASK(26, 0)
+#define REG_DONT_CLEAR_MARKER	0
 
 bool ex_handler_bpf(const struct exception_table_entry *ex,
 		    struct pt_regs *regs)
@@ -448,7 +466,8 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
 	int dst_reg = FIELD_GET(BPF_FIXUP_REG_MASK, ex->fixup);
 	off_t offset = FIELD_GET(BPF_FIXUP_OFFSET_MASK, ex->fixup);
 
-	regs->regs[dst_reg] = 0;
+	if (dst_reg != REG_DONT_CLEAR_MARKER)
+		regs->regs[dst_reg] = 0;
 	regs->csr_era = (unsigned long)&ex->fixup - offset;
 
 	return true;
@@ -467,7 +486,8 @@ static int add_exception_handler(const struct bpf_insn *insn,
 		return 0;
 
 	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
-	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX)
+	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
+	    BPF_MODE(insn->code) != BPF_PROBE_MEM32)
 		return 0;
 
 	if (WARN_ON_ONCE(ctx->num_exentries >= ctx->prog->aux->num_exentries))
@@ -529,8 +549,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	const u8 cond = BPF_OP(code);
 	const u8 t1 = LOONGARCH_GPR_T1;
 	const u8 t2 = LOONGARCH_GPR_T2;
-	const u8 src = regmap[insn->src_reg];
-	const u8 dst = regmap[insn->dst_reg];
+	const u8 t3 = LOONGARCH_GPR_T3;
+	u8 src = regmap[insn->src_reg];
+	u8 dst = regmap[insn->dst_reg];
 	const s16 off = insn->off;
 	const s32 imm = insn->imm;
 	const bool is32 = BPF_CLASS(insn->code) == BPF_ALU || BPF_CLASS(insn->code) == BPF_JMP32;
@@ -1036,8 +1057,19 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
+	/* LDX | PROBE_MEM32: dst = *(unsigned size *)(src + REG_ARENA + off) */
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
 		sign_extend = BPF_MODE(insn->code) == BPF_MEMSX ||
 			      BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
+
+		if (BPF_MODE(code) == BPF_PROBE_MEM32) {
+			emit_insn(ctx, addd, t2, src, REG_ARENA);
+			src = t2;
+		}
+
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
 			if (is_signed_imm12(off)) {
@@ -1097,6 +1129,16 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	case BPF_ST | BPF_MEM | BPF_H:
 	case BPF_ST | BPF_MEM | BPF_W:
 	case BPF_ST | BPF_MEM | BPF_DW:
+	/* ST | PROBE_MEM32: *(size *)(dst + REG_ARENA + off) = imm */
+	case BPF_ST | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_ST | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_ST | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_ST | BPF_PROBE_MEM32 | BPF_DW:
+		if (BPF_MODE(code) == BPF_PROBE_MEM32) {
+			emit_insn(ctx, addd, t3, dst, REG_ARENA);
+			dst = t3;
+		}
+
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
 			move_imm(ctx, t1, imm, is32);
@@ -1139,6 +1181,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			}
 			break;
 		}
+
+		ret = add_exception_handler(insn, ctx, REG_DONT_CLEAR_MARKER);
+		if (ret)
+			return ret;
 		break;
 
 	/* *(size *)(dst + off) = src */
@@ -1146,6 +1192,16 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	case BPF_STX | BPF_MEM | BPF_H:
 	case BPF_STX | BPF_MEM | BPF_W:
 	case BPF_STX | BPF_MEM | BPF_DW:
+	/* STX | PROBE_MEM32: *(size *)(dst + REG_ARENA + off) = src */
+	case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_STX | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_STX | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_STX | BPF_PROBE_MEM32 | BPF_DW:
+		if (BPF_MODE(code) == BPF_PROBE_MEM32) {
+			emit_insn(ctx, addd, t2, dst, REG_ARENA);
+			dst = t2;
+		}
+
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
 			if (is_signed_imm12(off)) {
@@ -1184,6 +1240,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			}
 			break;
 		}
+
+		ret = add_exception_handler(insn, ctx, REG_DONT_CLEAR_MARKER);
+		if (ret)
+			return ret;
 		break;
 
 	case BPF_STX | BPF_ATOMIC | BPF_W:
@@ -1875,6 +1935,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 
 	memset(&ctx, 0, sizeof(ctx));
 	ctx.prog = prog;
+	ctx.arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
 
 	ctx.offset = kvcalloc(prog->len + 1, sizeof(u32), GFP_KERNEL);
 	if (ctx.offset == NULL) {
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index 7a9d2134f8d1..328ec445a710 100644
--- a/arch/loongarch/net/bpf_jit.h
+++ b/arch/loongarch/net/bpf_jit.h
@@ -20,6 +20,7 @@ struct jit_ctx {
 	union loongarch_instruction *image;
 	union loongarch_instruction *ro_image;
 	u32 stack_size;
+	u64 arena_vm_start;
 };
 
 struct jit_data {
-- 
2.43.5

