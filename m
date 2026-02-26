Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B47B38A298
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 07:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089219; cv=none; b=TZgb5ParNcixeO4z9wOorbvNYykmMsBwc7Zv9oj6RjHlsXnqSf0K4nQsrRmmujcJTMsIKBWzfAm2FgQk8ittgR4WIbjLvUx/8vELBl0IUDrjoOgAVU60B0djkz5n7ddeLp3iNv8orpcSbD1YwedpHuLA5+wTdmK2F+IJa4BhuXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089219; c=relaxed/simple;
	bh=2iX3dKAMS1oZ5OwbOCcsitkuKGk+awvjZ2AJ28l/3ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcGGCk/FD2wC0lHjjXmp/6fI6Si7ddns0eFDs7KXmVrAynBuDTToneTF8IrgiOCvUx4dIoIEpynjqXgBPj7Dw+9VLz23g5KlEAKWez1H23BXnAmgnsae+8bYiksnV377wFJ6iKg5CeEnQkKriTtn9bIoeecesCVto/Ox32UUEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gaa/O5nr; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gaa/O5nr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7d98c1879so3189605ad.3
        for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 23:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772089218; x=1772694018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3XzNgCljErU8AUCuaB5WM6VPMtS9wlKZ/3vC39jEL8=;
        b=Gaa/O5nrN9+nItiv4kAKroQTrpRtIM5q1vppO8NcPt2s8W5F987OWJU5V9sy1vvuRQ
         6jjoWmrwi3aPkWRI7zgyBWSh6aKSu8qMbZn6Y+E8rq0lBcsWJkM1NZ7T+Ey1lmj7NlQC
         GAxA8WJVrdjgRpnY8ksPQVWiYli6UnRRO10MvhcJCmRXrpfJwV3SrKbx+xz7ID/zn4wp
         9YPUV2U31IbbOZ8iCVVRh0krf/1fvUu2tU1JH97xzDmlULeUq7HJe7fTKcchYH9SeLzU
         gnJvR29etP+lWOF4maTmT/rc+Ljaeyuyn/lgr+jyI6KKY1mrpqsFUj5nHTAUYs3St4d6
         bnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089218; x=1772694018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J3XzNgCljErU8AUCuaB5WM6VPMtS9wlKZ/3vC39jEL8=;
        b=TwgtdNAsq/7SHaVEVTp1U4iLo03dtUwGv/SDyjeB/HAicTghvgh4zBXkaqrKbccPwl
         kogdAYnum9VCOKxnfa0ny1xPZZOXpJhrUP5fwyXJ8TLGPY+PseYNQlNMAv6jLorQ9wzY
         RZXBCovW4ei/nzh/QZRJliUqs/oJt9a4PNJOAp3rfEwl2+VWOu/nAH0vG9QnMcwIQPAE
         deNvl9BEXGztWZWnYBnQJYTEJqarlomA6lcRv+UAycvh5I9nQswSRgeX87bLmH6yhm4Y
         4h0ToYoNWgpFnbTUCH92Wi//xlbeEfjR2CiCy/4ZUVcfGbDG4WiiWWTX0onXPBac3rRl
         95qQ==
X-Gm-Message-State: AOJu0YwfT2wyI/z4ixNqC+zbNIzvAaMvilGN6aR/Rn6jLbIqDYkM1Gnx
	ZdQKc8AJ+bgb7kX6pEYw0FFJXbe989LviSRw4G45nkWbQQ7qZQkgei1T
X-Gm-Gg: ATEYQzwirKe6sm4nax0rmMtTl9QH/phOVDfarvDlDEdmne5TEL0Vk6M9CR5OuKoOUEz
	4DQnyegsHxPkIrwfNhkW5hl16e1f6LUmG2HHKzKuSUnwUFdyMn5xZ/ky9zJUDXSk4LqIyaDAodm
	9DRwY1fN+GrjVpTdI0r1qI0NZTW5Wzgl2XKpCm8b+4ghAUlYfJWDURXNvY9U6sWYl0cmJObcv3s
	WfUqwTPIRtOSEUikqeq08ucHZQVDbVV9DX7EsKO4zEY+LhR/gyYjPvLm6lnh4BbWvY6eHDDRcoz
	N3WfVkaQDWhs7NPFQu28gWpglaWhYjRZirxWbQCnsXeYXnAxSqo8Jj3LBpcRfya8bNkEpzLU8Z5
	6kFrwmUgYxYSixHecoa0HAYAklhDUS4QaQlJBuf2PgRFzXx+O6NlKewnMCaC/+ZYvd7O9Jj8dKA
	aNGSKDfdEpo6mfuKG5o2sN2qtW25DoJOtwL2hFq51K8eztAwDhRjj6CgZkyn9Mhy9LtrrbyQ==
X-Received: by 2002:a17:903:2c5:b0:2a0:c58c:fdd2 with SMTP id d9443c01a7336-2ad74516011mr183336305ad.26.1772089216915;
        Wed, 25 Feb 2026 23:00:16 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.35])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb5b2296sm14803135ad.5.2026.02.25.23.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:00:16 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com,
	menglong8.dong@gmail.com
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 1/3] LoongArch: BPF: Introduce emit_store_stack_imm64() helper
Date: Thu, 26 Feb 2026 06:59:49 +0000
Message-ID: <20260226065952.4082859-2-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260226065952.4082859-1-hengqi.chen@gmail.com>
References: <20260226065952.4082859-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a helper to store 64-bit immediate on the trampoline stack.
The helper will be used in the next patch. Also refactor the existing
code to use this helper.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 3bd89f55960d..e3deb0da6a50 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1480,6 +1480,12 @@ static void restore_args(struct jit_ctx *ctx, int nargs, int args_off)
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
@@ -1488,12 +1494,11 @@ static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
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
@@ -1726,14 +1731,11 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
 
 	/* store ip address of the traced function */
-	if (flags & BPF_TRAMP_F_IP_ARG) {
-		move_imm(ctx, LOONGARCH_GPR_T1, (const s64)func_addr, false);
-		emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -ip_off);
-	}
+	if (flags & BPF_TRAMP_F_IP_ARG)
+		emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -ip_off, (u64)func_addr);
 
 	/* store nargs number */
-	move_imm(ctx, LOONGARCH_GPR_T1, nargs, false);
-	emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -nargs_off);
+	emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -nargs_off, nargs);
 
 	store_args(ctx, nargs, args_off);
 
-- 
2.43.5

