Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D7A352FA5
	for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 23:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776900266; cv=none; b=cR6/GD+l/ukVycNw3SV2WaPsLqAWTfXhkreJsTtQrvCJBvL42OGoBrDZc1MxKahZnvfeRLtiOdQMRHOQYZZhEoNmf8gCmmvI7u3lg/8MUgOHAsUJRFZdf5y8zC0jG4DxfIVpCvEwzpFKC69I9Pz6mOrEiprHrPuOq5Us1Iu/rgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776900266; c=relaxed/simple;
	bh=JwpPiWcxvNYKN4lMFNrdi3d/uL9NCRLy0XsGhPfvJ9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=prSc5SmAasDSMqU5SqkkZrD5ukfSbamXHHLuD+CRVNtu79mVMpNarcINArQuod6jGcyP+GPY/k+D1pjuo8lzJTKTgsVPuMaG0nguo+Y8QQQnsoxzOux3FqGlkwSXHOsle94fx7F/1Agd5+h6GTwP3vYTjVCLEwJwVVyCeWDOYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSl5PBvE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSl5PBvE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36146ae9dd4so4771894a91.3
        for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 16:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776900265; x=1777505065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTdBaz5QYX32iuAyyTR0YlGvwz+tmN7qZW8Yt7w0+5s=;
        b=QSl5PBvETAQOr0ZM60dUKAKRdVEaS9BCByXch1caI0P5H31qFyBo7CowA/DOJLHwX2
         ec5PC5+DryBeL7OEZ072724p4CFIQzqZjhOHKCzdZMf7Ijhirlr+8COumujJDbmzbRvJ
         vhn8EpNIvHM6TcRajFC3LlOqmApOaAC3YcwKa54/zm2m9R8n/8CyKb+kD5bx0/rcAzM0
         gDSxAdB5SSOKbpPLBTAZAgUBWFeVRXA2sJmJMMJ/9mqDe2Jzv7MdY8r7zfL2zGjgli83
         o8ITUMlZk7zpUxC7DpgcWPlNKyePJRNJ6f4s/1J3rVrCeuyd0ZVzmks8Sm51EfHOVDiA
         zZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776900265; x=1777505065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTdBaz5QYX32iuAyyTR0YlGvwz+tmN7qZW8Yt7w0+5s=;
        b=F8Y/98WleB8G5UF5OrMDzVugeC2bnQdwGEUx+9dCR1Y2H38fkXxlVyNTDydCLIZjGw
         EGDoH1KFQwuBOBFwxL61h1Df6O+2p/iselY4SKEb7gLsnjPowaAhaqLo2WdCZvKba4B0
         5Ofu6nMEdpLyCC9MDQra7g3RyYnLIbOvG4l7A6UyxcFaF2czS18KQT6uH7DHmLoj45M6
         Xrivoau+QnCi6uTV9YFoZ13SGNEfdXeaF8GqyyHQTZ2PaS42rhDvhF8BafBP5qNGSjve
         UcBooQLgIa7sR7i4cB6azMdOZcmnxIYiXwaFGcu8jCew5lHGXhEqLDYDRKes2QEshPeU
         5xNQ==
X-Gm-Message-State: AOJu0YyQf7PfwHjz0GxjnfgjAFjlr35qGNzuqqUPEzH1NE4CtmkqknAL
	KoKcaNUbDChUHl3/yD3Yl2VTDSZGGACtd43s8jS1PrpazDZSX5V/o8+d
X-Gm-Gg: AeBDievzHmbcMYV8ukZRAKetZYXqrdib7m8mPMGho+6rTRyBrVpNZTwnDhWIhWxke21
	xIYLwTEbKt6eoxCnvIDjjms0T+zQTSE5jtTsCTfjbj5sFKGjwS6Z0hx9LpKFzt3pXd7q6UYOL22
	wv144vGkYrG+7vX4i0KmFukYmy5+PZhROkV0DYOrP7b5fk1n6zcy5AdMP6+k6Hs0gigArdTHqdB
	b/ALGAQri6xlCT2nNox2ljVWBYa6dYwngs4sY0rX0KP06Mp5LMsnUNatr8gbgZBAEDqqgNg7BEJ
	UFandyVmM477NBu2l/D44gzsPkGuOVvCJG79sunxPCblG7g7Y/zeKiVfpFY3/279FUx8JGS4uDY
	OrsfPhXtMQtqrphjZKK/f6yUOH+7JElHSfm7g7f929FJEMS/JN+oiacx+GGq85NxRcY+OUPXLjc
	QMlAk42hoZ7R3OCIkQaDkn5nczkU2aVcB6z43WMJbEcA==
X-Received: by 2002:a17:90b:1809:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-361403d53bdmr24978742a91.8.1776900265019;
        Wed, 22 Apr 2026 16:24:25 -0700 (PDT)
Received: from VM-0-17-ubuntu.. ([119.28.83.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f920e1sm13776248a12.2.2026.04.22.16.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 16:24:24 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
X-Google-Original-From: Hengqi Chen <chenhengqi@outlook.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	menglong8.dong@gmail.com
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v2 1/2] LoongArch: BPF: Introduce emit_store_stack_imm64() helper
Date: Thu, 23 Apr 2026 07:24:06 +0800
Message-Id: <20260422232407.3862942-2-chenhengqi@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422232407.3862942-1-chenhengqi@outlook.com>
References: <20260422232407.3862942-1-chenhengqi@outlook.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengqi Chen <hengqi.chen@gmail.com>

Introduce a helper to store 64-bit immediate on the trampoline stack.
The helper will be used in the next patch. Also refactor the existing
code to use this helper.

Reviewed-by: Menglong Dong <menglong8.dong@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 215c5fb339b0..49dd3e1fedfe 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1668,6 +1668,12 @@ static void restore_stk_args(struct jit_ctx *ctx, int nr_stk_args, int args_off,
 	}
 }
 
+static void emit_store_stack_imm64(struct jit_ctx *ctx, int reg, int stack_off, u64 imm64)
+{
+	move_imm(ctx, reg, imm64, false);
+	emit_insn(ctx, std, reg, LOONGARCH_GPR_FP, stack_off);
+}
+
 static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
 			   int args_off, int retval_off, int run_ctx_off, bool save_ret)
 {
@@ -1676,12 +1682,11 @@ static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
 	struct bpf_prog *p = l->link.prog;
 	int cookie_off = offsetof(struct bpf_tramp_run_ctx, bpf_cookie);
 
-	if (l->cookie) {
-		move_imm(ctx, LOONGARCH_GPR_T1, l->cookie, false);
-		emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -run_ctx_off + cookie_off);
-	} else {
+	if (l->cookie)
+		emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1,
+				      -run_ctx_off + cookie_off, l->cookie);
+	else
 		emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -run_ctx_off + cookie_off);
-	}
 
 	/* arg1: prog */
 	move_imm(ctx, LOONGARCH_GPR_A0, (const s64)p, false);
@@ -1920,14 +1925,11 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
 
 	/* store ip address of the traced function */
-	if (flags & BPF_TRAMP_F_IP_ARG) {
-		move_imm(ctx, LOONGARCH_GPR_T1, (const s64)func_addr, false);
-		emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -ip_off);
-	}
+	if (flags & BPF_TRAMP_F_IP_ARG)
+		emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -ip_off, (u64)func_addr);
 
 	/* store arg regs count */
-	move_imm(ctx, LOONGARCH_GPR_T1, nr_arg_slots, false);
-	emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -nregs_off);
+	emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -nregs_off, nr_arg_slots);
 
 	store_args(ctx, nr_arg_slots, args_off);
 
-- 
2.43.5

