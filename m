Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C807F3D669B
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004551; cv=none; b=mAopnDTWUMJqFxvCwzE/9vFF/btr0uOUfrgxticEf8OCAhmrI2WBeNLI3sVBDw/kyhXKkKSE+KoFTonYynzjl0EAbN+BXzMXMisyiEdyaHaVDfZwv1YxLHjafqJxRPj59Zabmd7HDeSFsqFY1TsiU05t/NcngRQ5ICHjs57TMi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004551; c=relaxed/simple;
	bh=PSa6ThFZdCTR6jj8hyasj3K3S5xJHVABWteXY0Kw9pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3lK4Vd76qB/AgeaDRHrOiFBTocRP6+7z8WiYZ+KOxrPXgK7Q5AvGO56p9CqcN6DX1nsG+jpGsUh1bW3Lydko2U7S67TsDRQzz3Pd03jkaLWFgVv+fm1n6lMz8FTnAiHnKYb7IGzRabOMqTyqx/BVtpPXC0ufiq93UkY5KSgh74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsQfjPbB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsQfjPbB"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81df6a302b1so5396573b3a.2
        for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 06:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769004548; x=1769609348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2TAe9forEqccXUdqWKrZOFiGzS4qE2KfGLFlquvZmU=;
        b=GsQfjPbBB/wB1Yqh63cHcD5URs3PLj0XLbtW682IlZietXTKf5y4qWfLi2qiHnRq3j
         ijRdgUvixGD1Eo4BMuY0F54su+O7V66qf8tLKUlkUfp/YJ2kR2bZhidqtfmQCz6fhOCX
         etQX450Qp3uA8CYlNGmDgA2SagI7tushv/f5nu301Sc/AhIDc4kcHbGawy7cibu268Gk
         4RVp+zuqqSO3dNL4Cf5of8whREogkxvWLAyXTTiuc84yzX6MoYrUyrn2wBqd6PSa7Oq2
         KV0nCuoCejBqeYOy12j1nEN44Tm0OdcAblfs7Etb8qH+hGvFkygBw+Bhyj9sRLwB7zRP
         13cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769004548; x=1769609348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2TAe9forEqccXUdqWKrZOFiGzS4qE2KfGLFlquvZmU=;
        b=fqFNuPLULK604caC7WKnLt7WlHYlgKT+VdkjxK5/rr6k365D2Flv5A13Mh7DoaXDhT
         VnDD58OYjqGJOQTQQW2uYdiaI0Vob+6xcQi1Ctdfr77tB1cf8kqGJHW8C8dhJxkbMOb9
         OvBHLbFQGinyqRFiRthejTSxPg9inXlz+jujBS0njCn2grGTZO/41FEev4ENn51Y+n6y
         HNEa0hTvpK++B6k3Vw0E0A9q7A9NAlQoc7iFQitcn89efP+qElqX0AJGzpqXsNvXXb+9
         jmi2YUQPcuBd6cYT6XmCcVmcuvSmFF9Rit9m8Mpp5rxP27zjfe9YvMf2zttscnfsn4Wa
         hhBw==
X-Gm-Message-State: AOJu0YyBdcpbo9FE1n80p+Ipx8C+xoNCwGWWLeidmX2YRSR8myHfhazi
	c6xBlhYxcchqm9PElE+NYVOa5neHVZuXzfn2T4le944VCxNxpgESb5rj
X-Gm-Gg: AZuq6aLQRElYtgAlRooVB/uxZ8j7r3OteqVrGLRtTISGp4Dm/k/qKwWIn1tSQGm+4l/
	bQCiHrXuJWbwqtvVzgRQ0LYQ+/5uTU/mVdxhXTd6lsq8apCcHhO7VJOLhKXSO9f0sGWp7N6qmWP
	n5AD/z9ju1Aw617mthCEiogXcwtssuMNyIzpGtb1BZFhoKjRLb6qH85P4QjylW0IjKbRF4DYODT
	kDvr++L0dRWsXWmmTUr3J729q2P0QEJcmdydC4dJVpk0qcSS4uPZPlOWV13OgfJU2Xpsp4ya2EX
	HC3iSghxU8JxdRTpxj0NzP5ZW5ts4t1pt4/XkXDd93yPUGZ2M8EtrbC92+8MNpOdpuVBuLjMr8Q
	7mI6op3QqW22LlPb4oNjZhJ8Kk3cGScxglcv/AUhV0ylcJAOPbUpIfoldB3xj0UhM5B365fFAk8
	PKlPHQH7erOpxzH5k/qiIncdBR3badzyaxxh4N//1IuPlTVQ==
X-Received: by 2002:a05:6a00:21cf:b0:7f1:4:66b with SMTP id d2e1a72fcca58-81fa1820808mr15790271b3a.44.1769004547827;
        Wed, 21 Jan 2026 06:09:07 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.161])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82180636c38sm715964b3a.24.2026.01.21.06.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:09:07 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v2 3/3] LoongArch: BPF: Implement bpf_addr_space_cast instruction
Date: Wed, 21 Jan 2026 14:08:40 +0000
Message-ID: <20260121140840.2165381-4-hengqi.chen@gmail.com>
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

LLVM generates bpf_addr_space_cast instruction while translating
pointers between native (zero) address space and
__attribute__((address_space(N))). The addr_space=0 is reserved as
bpf_arena address space.

rY = addr_space_cast(rX, 0, 1) is processed by the verifier and
converted to normal 32-bit move: wX = wY

rY = addr_space_cast(rX, 1, 0) has to be converted by JIT.

With this, the following test cases passed:

    $ ./test_progs -a arena_htab,arena_list,arena_strsearch,verifier_arena,verifier_arena_large
    #4/1     arena_htab/arena_htab_llvm:OK
    #4/2     arena_htab/arena_htab_asm:OK
    #4       arena_htab:OK
    #5/1     arena_list/arena_list_1:OK
    #5/2     arena_list/arena_list_1000:OK
    #5       arena_list:OK
    #7/1     arena_strsearch/arena_strsearch:OK
    #7       arena_strsearch:OK
    #507/1   verifier_arena/basic_alloc1:OK
    #507/2   verifier_arena/basic_alloc2:OK
    #507/3   verifier_arena/basic_alloc3:OK
    #507/4   verifier_arena/basic_reserve1:OK
    #507/5   verifier_arena/basic_reserve2:OK
    #507/6   verifier_arena/reserve_twice:OK
    #507/7   verifier_arena/reserve_invalid_region:OK
    #507/8   verifier_arena/iter_maps1:OK
    #507/9   verifier_arena/iter_maps2:OK
    #507/10  verifier_arena/iter_maps3:OK
    #507     verifier_arena:OK
    #508/1   verifier_arena_large/big_alloc1:OK
    #508/2   verifier_arena_large/access_reserved:OK
    #508/3   verifier_arena_large/request_partially_reserved:OK
    #508/4   verifier_arena_large/free_reserved:OK
    #508/5   verifier_arena_large/big_alloc2:OK
    #508     verifier_arena_large:OK
    Summary: 5/20 PASSED, 0 SKIPPED, 0 FAILED

Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 15 +++++++++++++++
 arch/loongarch/net/bpf_jit.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 87bc4df03dd6..4933aabc7b6a 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -561,6 +561,15 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
@@ -1957,6 +1966,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	memset(&ctx, 0, sizeof(ctx));
 	ctx.prog = prog;
 	ctx.arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
+	ctx.user_vm_start = bpf_arena_get_user_vm_start(prog->aux->arena);
 
 	ctx.offset = kvcalloc(prog->len + 1, sizeof(u32), GFP_KERNEL);
 	if (ctx.offset == NULL) {
@@ -2118,3 +2128,8 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_arena(void)
+{
+	return true;
+}
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index 8816ac106f2f..a8e29be35fa8 100644
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

