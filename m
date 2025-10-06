Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436A21C179
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 05:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759728841; cv=none; b=b6cJ/Ywpp4GG+2kDqYO2TcWBVHDqPOqhnVY+HE1MaeARga1mBwPipYBNSkLK9Bv8pDiag0u/cXOs164YIhCpn9YSjSbairNa4Lu1rshnsgNj3qdZEM6JP2Q0wqicVFTIHJ0zNc9h1n1Z2oh52oH39PoOln4yxW36dBDc2Pq3H5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759728841; c=relaxed/simple;
	bh=A6phwdVfk3jQ67w64tosRXERQ7OpY3PEtQslQcwojZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNqnfBsuf/jMLLM+9qlMolV0VKimZqA9Ad/oYjCCOHaIPl/fQHxMpmy4V51YiSdCIct4EBiaZ9DQiITbUdXxRGvL/08GY6oPQZICoQjTitd61bzj8DyS4vW0NWm+Z28/yCyK9trVmBig6hKhUNF80lReN9HgaOP9wVvXpk6RmKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtWIclwl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtWIclwl"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so63369885ad.2
        for <loongarch@lists.linux.dev>; Sun, 05 Oct 2025 22:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759728839; x=1760333639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsFvW4otEuQ4E5aZB7dDbgJHeco92cY5CGoClRWrXfI=;
        b=UtWIclwlBikTW18L4icFZEKYUHoGOPb4xoa+yp2YMaa3hfQrQDbLtp0p8skd44hrf/
         MLiCbsjzbpUEsqVje/2mhxukNQn6wALmfG6FpqVFJ8CxKvxEbBa3OVu/F9bkguGXn6Gk
         BMQPwv8xt7crRwxFFcw2UWLdz7QIhasQGTkwNbjChp8RdLSc2TbkltwY+2bzBG34GYGo
         zWsT757+1yrWyE0mUgqtaYnz0wL7DsxsKLxXUoUX9mvO+IQVl9e27aRWrDfc7MEzcTl1
         mIvS/ztWozZWdk7woPdnJrLTbdX82OfpqK+1Tm+Q/wLYTgckBwCE1SEJLUaTiMsPlBEO
         PVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728839; x=1760333639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsFvW4otEuQ4E5aZB7dDbgJHeco92cY5CGoClRWrXfI=;
        b=KRDbADVDoNaj0YS0LLn5rlFfj4Qn34ma72zWKu4HtUeOEgHwM+1RRM56gGHPZ38tpf
         yxd5/k+Y+PesNxdvc43JA368Gmois/wOTUdFJR1r9WfHF2TMUk40caMR5MG/PgVrodAU
         LRWY015SbRRTzNgRriVfVL/bethkHTc4MK6IwfHLfME6gqoY8nyqfOLDXe/Hwg1NCw1B
         FBIu9+O+SM6jE+Dq/EPa3X9YHVRyb27HHFCj7LpH8lQ26Efq3RXTXSpaQwg2WrgsrWCa
         YACzd4nQhPtf3sY7ED4PYzvIwsqsfD8yK6wDxjoJY5+YsJqsIvvCvTJP6O2oTIhQ1iTN
         lo8g==
X-Gm-Message-State: AOJu0YxaD23Enfu61RGnDgeGE85H1byNy31VLZZBMYJZWG2lLjsPwJ7i
	0JjvxrFj5uB7TNcgUIWJxiT2Lj8w9zMNiB4IAREIkNabpMlYFvfkbnr2
X-Gm-Gg: ASbGnctQWB8i3KCngfxYQS+v9oQ5RpzsYTYley7H1NP5fJVv16sfuvfWvOvz20/gyPA
	AfirRnOokCmmZGame9S2MYtsqx2EeE473JeZNW9KPj8Xlnf+T6GOvVvym02V+OSW3/YpcmaO/MB
	ZVk6V7rAZkswDoEUuS5qztuy9Gp6eZcoyRR8wo11h6IrOUB903Oc9Km8N7A0wTMv7KRgxaqJ4Sn
	rZef416MS+3pNEfio7V2AHJBeUvgObu57v48OduStmmz3P8durFNKlrsMYYFlWQw9DmMYAQNXf6
	ZpDJPPB03FqLIbZm/S79ZYXga+P3edScrCVXgV+m66vGVVJZ60heiJbzlAuqz8rYomRuzkbZGQI
	x89pmmu8QktYvl+VnJnLwZWrO2pHPMHqO2Bl0eu3INStybo9WjViO7rePnmWi+JxcSA==
X-Google-Smtp-Source: AGHT+IGWKXdhLdxmYVxorIHxK9nTT+HhjMnYLo0g4RTrJ0R6KnIKkiuzNSTM/4M1IKBypBG1DkIpwg==
X-Received: by 2002:a17:903:2f0e:b0:250:bd52:4cdb with SMTP id d9443c01a7336-28e9a62ff1emr114401855ad.32.1759728839375;
        Sun, 05 Oct 2025 22:33:59 -0700 (PDT)
Received: from devbox.. ([116.16.231.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88fcsm120187075ad.84.2025.10.05.22.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:33:59 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 6/7] LoongArch: BPF: Implement PROBE_MEM32 pseudo instructions
Date: Mon,  6 Oct 2025 05:33:22 +0000
Message-ID: <20251006053323.193581-7-hengqi.chen@gmail.com>
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
index 57a9774affad..d32f9630825a 100644
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
@@ -472,6 +489,7 @@ static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size, bool sign)
 
 #define BPF_FIXUP_REG_MASK	GENMASK(31, 27)
 #define BPF_FIXUP_OFFSET_MASK	GENMASK(26, 0)
+#define REG_DONT_CLEAR_MARKER	0
 
 bool ex_handler_bpf(const struct exception_table_entry *ex,
 		    struct pt_regs *regs)
@@ -479,7 +497,8 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
 	int dst_reg = FIELD_GET(BPF_FIXUP_REG_MASK, ex->fixup);
 	off_t offset = FIELD_GET(BPF_FIXUP_OFFSET_MASK, ex->fixup);
 
-	regs->regs[dst_reg] = 0;
+	if (dst_reg != REG_DONT_CLEAR_MARKER)
+		regs->regs[dst_reg] = 0;
 	regs->csr_era = (unsigned long)&ex->fixup - offset;
 
 	return true;
@@ -498,7 +517,8 @@ static int add_exception_handler(const struct bpf_insn *insn,
 		return 0;
 
 	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
-	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX)
+	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
+	    BPF_MODE(insn->code) != BPF_PROBE_MEM32)
 		return 0;
 
 	if (WARN_ON_ONCE(ctx->num_exentries >= ctx->prog->aux->num_exentries))
@@ -560,8 +580,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
@@ -1069,8 +1090,19 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
+	/* LDX | PROBE_MEM32: dst = *(unsigned size *)(src + REG_ARENA + off) */
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
 		sign_ext = BPF_MODE(code) == BPF_MEMSX ||
 			   BPF_MODE(code) == BPF_PROBE_MEMSX;
+
+		if (BPF_MODE(code) == BPF_PROBE_MEM32) {
+			emit_insn(ctx, addd, t2, src, REG_ARENA);
+			src = t2;
+		}
+
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
 			if (is_signed_imm12(off)) {
@@ -1130,6 +1162,16 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
@@ -1172,6 +1214,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			}
 			break;
 		}
+
+		ret = add_exception_handler(insn, ctx, REG_DONT_CLEAR_MARKER);
+		if (ret)
+			return ret;
 		break;
 
 	/* *(size *)(dst + off) = src */
@@ -1179,6 +1225,16 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
@@ -1217,6 +1273,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 			}
 			break;
 		}
+
+		ret = add_exception_handler(insn, ctx, REG_DONT_CLEAR_MARKER);
+		if (ret)
+			return ret;
 		break;
 
 	case BPF_STX | BPF_ATOMIC | BPF_W:
@@ -1876,6 +1936,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 
 	memset(&ctx, 0, sizeof(ctx));
 	ctx.prog = prog;
+	ctx.arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
 
 	ctx.offset = kvcalloc(prog->len + 1, sizeof(u32), GFP_KERNEL);
 	if (ctx.offset == NULL) {
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index e76819a157ca..94d1c44b42f3 100644
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

