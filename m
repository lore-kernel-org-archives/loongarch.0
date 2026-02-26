Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573122D1F44
	for <loongarch@lists.linux.dev>; Thu, 26 Feb 2026 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089226; cv=none; b=iLLkVaYfVJtzG7jHcDBkn1kZnRcPLRQG/AD1Xg9DakFef8Z4D0TNGI2HcHVSNrQ4zxtfgv3FGoYitsJGyG1Wcfzf/c7cheDLfKhUv1Z9uirynTPEtxrSbTEFYvEvYDm/bqI4+sdRnpVd/e+2TwLE8qP6IFMUvwyl7eS4ChpJN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089226; c=relaxed/simple;
	bh=BZhYZA+eXHYQqrUU/qWaI0FZCJx2N2EOS7LErvcjwkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ky+cw3nY1dklkSfb/5bVYR6j9fygsf9YOCuY+rNFaSrtNTXOUsjwTg7Z/p6DaqKVr9BPRxBBDLYCldKt3fxvoNpX9PHtvrAUKBn6PA3dntm7/7eyzBgwVmgYzA9GicEOTJZJeA+gNPlUNmJsI+rwpD8wSNZzjVO4+DpoNEvticI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+VgXqM3; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+VgXqM3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70f5d6a6a4so285730a12.1
        for <loongarch@lists.linux.dev>; Wed, 25 Feb 2026 23:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772089225; x=1772694025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2Zh6z6yYMkDb7j7is6q+V1FWbCIXb7Mh6e0JwzS82A=;
        b=K+VgXqM3rY/djQ9C43M9MW7g7MiOI8cEAiItH/45hkh1/1LyB8sfxuka4NpVnECpKm
         GpcAYDErp8qrNKIjMDTeGpS/PPCg7NsBLIcr3QjTORUBtcNKA8M8Ly8wvK7DC/ruiVhi
         aPskFReqyYijgKENwx4klpC5dFJlnWL8Z/fZ/bU6j2gYEZr8cmt41A4nZxD0FRhFJQA1
         2O/bYJ9VVi4dchCSSwdzMwZ6JYqlbtWWCnNPaWA6t12gf7bu16nqJo1fWd9E2NPYEyRy
         U5/kwu4B7EOCZv7HzS3zBuqEMQgKJfbZUIigM/pNCh2OhsPPoMSV6gs0pA8uaSuMylYH
         PYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089225; x=1772694025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k2Zh6z6yYMkDb7j7is6q+V1FWbCIXb7Mh6e0JwzS82A=;
        b=T82tGGeJX/d2869i3iHjpD9hA5aKSzsC7gCIRBwwcfTVW3r8v4nQO0ozlWTz/B6p9d
         +9QHr4p/7mnvUh+BLUdEWNeDIlf6WwImkaJgHNWYSK3uNeW7a0aBqvy9I2INu79fRfGl
         rvLfhTUgJnheLO4CK4Wm1Qsp66Buv/+t+j2xSxvxALbvuwiN2P8GufnCnlS3KKN+zxtb
         t88eRQ6iEBzxhguSBU0YN+F2ARZvrdZb5p65vioRqofGubqG2FekVZ6VRtGdUNE2755e
         P7jwkTP8VNZ2uQ3Quk/p29hUE68FYCiSn8DWhzHIkIjp0S/9MBgmK5Z4+6yh4R4Htude
         G+yg==
X-Gm-Message-State: AOJu0YyfETKvnnBK9qCfmQkeB5LH9ySrr+9PLN3WUjDY8l8RLsVEyTA3
	MoCvg/S6vSF/stQbBpfSm4lD1rig7sxTaCuycyZuGq3VhdHKJvZx2dYJ
X-Gm-Gg: ATEYQzxHVH1c8BpzFH5Q7FMJWsEMAbESj3rK/Fjynaq4X1ZVN3moMlwmv2ulz0iNjg5
	yF05nUAoI0MKTESaFRdIbQnW3Ecr9wrHq7PaG8DreOLVlWbOL9CunA7N9qP7+x+/+7epa40PfMH
	E0gEvn5l5oI3d2ovKEZVWWynxy2JOh3BQfP2t+x9ZQAjXXqMWoCEUmtL18V6yeNEupHjFwMMh/b
	hFVldgYwXZdoi49EsnXhfswxVWM8v5R0U71jEvT2j508Yuiflkx/7L1HLcvyivU4i7/veEgtsfY
	Xs1OTdtMDoxT1TJmzTbCze3PgyBYL783HZ0Cw1/i+RhKWpkljaPRQiUbLnx3xhH0D6LmGaRCMqa
	p15gMocC6bX4NuZqk9XOtd8q/RYnMWo0+NbKYoCTNpfnH4WtITj9mIB22PNwZqzG9ifug3dWx5I
	MBEonNmj+/BwIJ3bCLvY1EsLcpwEckWetK7UY45i+EqWhm9L5s9KKzQGPtTuqewWcRpSVLpA==
X-Received: by 2002:a17:903:19eb:b0:2aa:dbf7:7449 with SMTP id d9443c01a7336-2ade9a3c809mr38589905ad.37.1772089224016;
        Wed, 25 Feb 2026 23:00:24 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.35])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2adfb5b2296sm14803135ad.5.2026.02.25.23.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:00:23 -0800 (PST)
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
Subject: [PATCH 2/3] LoongArch: BPF: Add fsession support for trampolines
Date: Thu, 26 Feb 2026 06:59:50 +0000
Message-ID: <20260226065952.4082859-3-hengqi.chen@gmail.com>
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

Implement BPF_TRACE_FSESSION support in LoongArch BPF JIT.
The logic here is almost identical to what has been done in
RISC-V JIT.

The key changes are:
  - Allocate stack space for function meta and session cookies
  - Introduce invoke_bpf() as a wrapper around invoke_bpf_prog()
    that populates session cookies before each invocation
  - Implement bpf_jit_supports_fsession() callback

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 78 +++++++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index e3deb0da6a50..16da53f80266 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1549,6 +1549,31 @@ static int invoke_bpf_prog(struct jit_ctx *ctx, struct bpf_tramp_link *l,
 	return ret;
 }
 
+static int invoke_bpf(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
+		      int args_off, int retval_off, int run_ctx_off,
+		      int func_meta_off, bool save_ret, u64 func_meta,
+		      int cookie_off)
+{
+	int i, cur_cookie = (cookie_off - args_off) / 8;
+
+	for (i = 0; i < tl->nr_links; i++) {
+		int err;
+
+		if (bpf_prog_calls_session_cookie(tl->links[i])) {
+			u64 meta = func_meta | ((u64)cur_cookie << BPF_TRAMP_COOKIE_INDEX_SHIFT);
+
+			emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -func_meta_off, meta);
+			cur_cookie--;
+		}
+		err = invoke_bpf_prog(ctx, tl->links[i], args_off, retval_off,
+				      run_ctx_off, save_ret);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_links *tl,
 			       int args_off, int retval_off, int run_ctx_off, u32 **branches)
 {
@@ -1610,13 +1635,15 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 {
 	int i, ret, save_ret;
 	int stack_size, nargs;
-	int retval_off, args_off, nargs_off, ip_off, run_ctx_off, sreg_off, tcc_ptr_off;
+	int retval_off, args_off, func_meta_off, ip_off, run_ctx_off, sreg_off, tcc_ptr_off;
+	int cookie_off, cookie_cnt;
 	bool is_struct_ops = flags & BPF_TRAMP_F_INDIRECT;
 	void *orig_call = func_addr;
 	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
 	u32 **branches = NULL;
+	u64 func_meta;
 
 	/*
 	 * FP + 8       [ RA to parent func ] return address to parent
@@ -1634,10 +1661,14 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	 *                  [ ...               ]
 	 * FP - args_off    [ arg1              ]
 	 *
-	 * FP - nargs_off   [ regs count        ]
+	 * FP - func_meta_off [ regs count, etc ]
 	 *
 	 * FP - ip_off      [ traced func   ] BPF_TRAMP_F_IP_ARG
 	 *
+	 *                  [ stack cookie N    ]
+	 *                  [ ...               ]
+	 * FP - cookie_off  [ stack cookie 1    ]
+	 *
 	 * FP - run_ctx_off [ bpf_tramp_run_ctx ]
 	 *
 	 * FP - sreg_off    [ callee saved reg  ]
@@ -1671,9 +1702,9 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	stack_size += nargs * 8;
 	args_off = stack_size;
 
-	/* Room of trampoline frame to store args number */
+	/* function metadata, such as regs count */
 	stack_size += 8;
-	nargs_off = stack_size;
+	func_meta_off = stack_size;
 
 	/* Room of trampoline frame to store ip address */
 	if (flags & BPF_TRAMP_F_IP_ARG) {
@@ -1681,6 +1712,11 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 		ip_off = stack_size;
 	}
 
+	cookie_cnt = bpf_fsession_cookie_cnt(tlinks);
+	/* room for session cookies */
+	stack_size += cookie_cnt * 8;
+	cookie_off = stack_size;
+
 	/* Room of trampoline frame to store struct bpf_tramp_run_ctx */
 	stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), 8);
 	run_ctx_off = stack_size;
@@ -1734,11 +1770,19 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	if (flags & BPF_TRAMP_F_IP_ARG)
 		emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -ip_off, (u64)func_addr);
 
-	/* store nargs number */
-	emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -nargs_off, nargs);
+	func_meta = nargs;
+	emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -func_meta_off, func_meta);
 
 	store_args(ctx, nargs, args_off);
 
+	if (bpf_fsession_cnt(tlinks)) {
+		/* clear all session cookies' value */
+		for (i = 0; i < cookie_cnt; i++)
+			emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -cookie_off + 8 * i);
+		/* clear return value to make sure fentry always get 0 */
+		emit_insn(ctx, std, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_FP, -retval_off);
+	}
+
 	/* To traced function */
 	/* Ftrace jump skips 2 NOP instructions */
 	if (is_kernel_text((unsigned long)orig_call) ||
@@ -1755,9 +1799,10 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 			return ret;
 	}
 
-	for (i = 0; i < fentry->nr_links; i++) {
-		ret = invoke_bpf_prog(ctx, fentry->links[i], args_off, retval_off,
-				      run_ctx_off, flags & BPF_TRAMP_F_RET_FENTRY_RET);
+	if (fentry->nr_links) {
+		ret = invoke_bpf(ctx, fentry, args_off, retval_off, run_ctx_off,
+				 func_meta_off, flags & BPF_TRAMP_F_RET_FENTRY_RET,
+				 func_meta, cookie_off);
 		if (ret)
 			return ret;
 	}
@@ -1791,8 +1836,14 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 		*branches[i] = larch_insn_gen_bne(LOONGARCH_GPR_T1, LOONGARCH_GPR_ZERO, offset);
 	}
 
-	for (i = 0; i < fexit->nr_links; i++) {
-		ret = invoke_bpf_prog(ctx, fexit->links[i], args_off, retval_off, run_ctx_off, false);
+	/* set "is_return" flag for fsession */
+	func_meta |= (1ULL << BPF_TRAMP_IS_RETURN_SHIFT);
+	if (bpf_fsession_cnt(tlinks))
+		emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -func_meta_off, func_meta);
+
+	if (fexit->nr_links) {
+		ret = invoke_bpf(ctx, fexit, args_off, retval_off, run_ctx_off,
+				 func_meta_off, false, func_meta, cookie_off);
 		if (ret)
 			goto out;
 	}
@@ -2132,3 +2183,8 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_fsession(void)
+{
+	return true;
+}
-- 
2.43.5

