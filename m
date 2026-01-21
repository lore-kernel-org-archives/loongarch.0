Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454A2D2481
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004548; cv=none; b=i1Ff8vr/tA3wY2Bo8ZtnNh9+RR04pUZKngkpwM0Yh4OsHdpy3R9uMuNpEkFLVPaFwStVHRSSp3Zk2dMq1Z93Qhi8IbvBmrwFcPknNuYEUBDysWLRgA1DrNcOegK6NBi0k7CGlqIPiv/ixbEUqUZJ3Xv+dO23KRcR7rs/mh6IyuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004548; c=relaxed/simple;
	bh=5EZsPn5A+w9RnUJVlnVyLjeDjzMpC2mXp0l2wa1nPK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqEJktbdVikeSu5owy+SoadIyI5sZ450dhLh2SZ+yl0+is1rXklf0N/F3DytB/UxGtHZW8uDqKkXkAGS+xG5LZYo55Otm/Kw0E1R0ExEhjvI5kILZxJ0tofo21zpS1eXAfy6mN8jT6QImBbrGdI5G3rVKI6dlwcOiw/T4lGU+Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnV09K0Q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnV09K0Q"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f4e136481so3143627b3a.3
        for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 06:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769004544; x=1769609344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnT808tx5VDfovQx6YGpyoBEYZjT02uOYC2Y/smKV+M=;
        b=XnV09K0Qu0BQe+LrbbOLfb8mHMvHMhyA80Ep57Cn4VHWSSV0EmAcELvAPBCG7JvVrq
         IlMnTGJCTR6Z2aGCm09UGTw09OUmxnIifxv9VVN0vQ6eTi9TO6RWwcCHFNdR//ARxCIB
         pk2ELgMSAp8XSqzpgGztwDgnDOctK2w+dQ6bwzB/h3aGiU03rVFCJsHIRLooaIUcgOw0
         +OX/GZwTT1LCGRMw0BEUW+Qi1xV1lJSyaMEAla/c3atbrKi2cKNJTF3DLUOXT9yzMTch
         fTN3GHV0kHJjFxMSbF34Pv369f5g8cwW9fgcLrp3uV1TtbqjVo6Rlc+DYFfT24VGWR76
         rn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769004544; x=1769609344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CnT808tx5VDfovQx6YGpyoBEYZjT02uOYC2Y/smKV+M=;
        b=lXrhcCwM/MNVlkVt0ZW2Ua22Ssm1cJPolnE+BUoue1eEsbowbxGnpeFfIPt1HL427g
         13aqNTggwarhCFohOEm/YH70c8CCCu7EsNQ8GHgsx/NR5LG92Dky235z/J2tCbeaVD1O
         XtAFCOXBvS+2/7u+HbVYMAEYAGNvLrwmUa4flJMYcRG2CXpGYWKG2Asx+9fWGC9kX89h
         /4MHprYpGe+PrlgTNIwRM6eYciHP7Toz2zg/P/SvbRFHILjhKs8cKYTSdAQSws1UfWfI
         dQ/8q85Z+VTLB1zVsVPIDhVlzPKqciSUStlXgBOEXXqo6qfeggVK3oWGlwd8vZSduya0
         ntNQ==
X-Gm-Message-State: AOJu0Yy1IG+Z6Cw4E9cQleMhHoG7D/57OSMNH8Yn06ncGMebIs1pbhjR
	+WhX8JsyzmnHyM2WVdlwG5tDoAG4E/xBkW2axKr4Bg5u6fXJjQSzB7OD
X-Gm-Gg: AZuq6aImQyIeK2LZHByEkFHQ90LXiXJ+9l7V5+DQL0zFy9DqvG6l79jXNYuD2nGUMLY
	FCZeHK/8zXbZPeQ8jvOJMcBqfBfNciQSH1iC4EAYwQHwMdrnKf4AOPvOjoJahY/86tAiCKf6grv
	2eiRjVi1JmvG7iBfxYDbxGv+g1NlNY2gpkqwiQQTAaDM4POpGEXmza4gArx6g+c65CbGPv+zTKa
	TtBPAp3qVpo7WeEUYZnvTOvfm8qpGzeQpMghOoeURuDuCtHk4mfF/V6S6egH+L0zz7pTg23crZT
	uCT554GpAAPbDAgDC0bPfmY0cFiB9J+aXcIT+RSyCUHfWW3fEjK1LWHJYNEKwPy0Tf3B+EbPEGe
	Rq006qxbN+jS+1t85oShobEnf7F/om6ILO06qmTLc8JI3LeMuIezg1JPQOYoU6NXZUcsVi4nNIV
	tdNAVKwJp+prEvzhuyL6nli1gMVhb+/Qkzh0U/lkfZDNzViA==
X-Received: by 2002:a05:6a00:b84:b0:81f:5d0a:c970 with SMTP id d2e1a72fcca58-81fa17bb952mr15363119b3a.31.1769004544137;
        Wed, 21 Jan 2026 06:09:04 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.161])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82180636c38sm715964b3a.24.2026.01.21.06.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:09:03 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v2 2/3] LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
Date: Wed, 21 Jan 2026 14:08:39 +0000
Message-ID: <20260121140840.2165381-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260121140840.2165381-1-hengqi.chen@gmail.com>
References: <20260121140840.2165381-1-hengqi.chen@gmail.com>
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

Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 73 +++++++++++++++++++++++++++++++++---
 arch/loongarch/net/bpf_jit.h |  1 +
 2 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index ee7395561bd2..87bc4df03dd6 100644
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
 
@@ -178,6 +182,11 @@ static void build_prologue(struct jit_ctx *ctx)
 	store_offset -= sizeof(long);
 	emit_insn(ctx, std, LOONGARCH_GPR_S5, LOONGARCH_GPR_SP, store_offset);
 
+	if (ctx->arena_vm_start) {
+		store_offset -= sizeof(long);
+		emit_insn(ctx, std, REG_ARENA, LOONGARCH_GPR_SP, store_offset);
+	}
+
 	prepare_bpf_tail_call_cnt(ctx, &store_offset);
 
 	emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_adjust);
@@ -186,6 +195,9 @@ static void build_prologue(struct jit_ctx *ctx)
 		emit_insn(ctx, addid, regmap[BPF_REG_FP], LOONGARCH_GPR_SP, bpf_stack_adjust);
 
 	ctx->stack_size = stack_adjust;
+
+	if (ctx->arena_vm_start)
+		move_imm(ctx, REG_ARENA, ctx->arena_vm_start, false);
 }
 
 static void __build_epilogue(struct jit_ctx *ctx, bool is_tail_call)
@@ -217,6 +229,11 @@ static void __build_epilogue(struct jit_ctx *ctx, bool is_tail_call)
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
@@ -442,6 +459,7 @@ static bool is_signed_bpf_cond(u8 cond)
 
 #define BPF_FIXUP_REG_MASK	GENMASK(31, 27)
 #define BPF_FIXUP_OFFSET_MASK	GENMASK(26, 0)
+#define REG_DONT_CLEAR_MARKER	0
 
 bool ex_handler_bpf(const struct exception_table_entry *ex,
 		    struct pt_regs *regs)
@@ -449,7 +467,8 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
 	int dst_reg = FIELD_GET(BPF_FIXUP_REG_MASK, ex->fixup);
 	off_t offset = FIELD_GET(BPF_FIXUP_OFFSET_MASK, ex->fixup);
 
-	regs->regs[dst_reg] = 0;
+	if (dst_reg != REG_DONT_CLEAR_MARKER)
+		regs->regs[dst_reg] = 0;
 	regs->csr_era = (unsigned long)&ex->fixup - offset;
 
 	return true;
@@ -468,7 +487,8 @@ static int add_exception_handler(const struct bpf_insn *insn,
 		return 0;
 
 	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
-	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX)
+	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
+	    BPF_MODE(insn->code) != BPF_PROBE_MEM32)
 		return 0;
 
 	if (WARN_ON_ONCE(ctx->num_exentries >= ctx->prog->aux->num_exentries))
@@ -530,8 +550,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
@@ -1037,8 +1058,19 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
-		sign_extend = BPF_MODE(insn->code) == BPF_MEMSX ||
-			      BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
+	/* LDX | PROBE_MEM32: dst = *(unsigned size *)(src + REG_ARENA + off) */
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
+		sign_extend = BPF_MODE(code) == BPF_MEMSX ||
+			      BPF_MODE(code) == BPF_PROBE_MEMSX;
+
+		if (BPF_MODE(code) == BPF_PROBE_MEM32) {
+			emit_insn(ctx, addd, t2, src, REG_ARENA);
+			src = t2;
+		}
+
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
 			if (is_signed_imm12(off)) {
@@ -1098,6 +1130,16 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
@@ -1140,6 +1182,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			}
 			break;
 		}
+
+		ret = add_exception_handler(insn, ctx, REG_DONT_CLEAR_MARKER);
+		if (ret)
+			return ret;
 		break;
 
 	/* *(size *)(dst + off) = src */
@@ -1147,6 +1193,16 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
@@ -1185,6 +1241,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			}
 			break;
 		}
+
+		ret = add_exception_handler(insn, ctx, REG_DONT_CLEAR_MARKER);
+		if (ret)
+			return ret;
 		break;
 
 	case BPF_STX | BPF_ATOMIC | BPF_W:
@@ -1896,6 +1956,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 
 	memset(&ctx, 0, sizeof(ctx));
 	ctx.prog = prog;
+	ctx.arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
 
 	ctx.offset = kvcalloc(prog->len + 1, sizeof(u32), GFP_KERNEL);
 	if (ctx.offset == NULL) {
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index 38eb75f79069..8816ac106f2f 100644
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

