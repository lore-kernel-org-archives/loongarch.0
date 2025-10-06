Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A366247DEA
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759728844; cv=none; b=pZXrmoXivoV7x+U7GQCzDa48pacVIb8om7YDWptmcYu2HnW4Ipg6vsGnvjxwgeRpZDAEOSayed/sNL/e44aD3QY2fxq9pq4HZszcVtA9BB4p8iHJK8obcSWaKYeRDJtWBzUB7GxGaYos8LNSNM5aCGqREgGF9nN+VGudYQBXnFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759728844; c=relaxed/simple;
	bh=BKSMKbh5qbfrVBt86cTn2NWkYoH6gkfQ3g/jpU59nn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPppI8tmDU9ZJ4qgusydfy+6zqmX9gbAEs6kiZPBn57iNUtLnviyD+m+QPb/enGBhp/ajTesLFpizzBpwTaQptdkuOHfX03hA1LnuLH1x9jGhVKOsISk7wnyeRM6tkDJoi+yb1Yam/v4mSM6v+TmcbFwgfGOJh/uygK+HdCRW+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhimjW08; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhimjW08"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b5506b28c98so3107448a12.1
        for <loongarch@lists.linux.dev>; Sun, 05 Oct 2025 22:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759728842; x=1760333642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OedT7hKKspvt0TM3G1uCwteK4e0CQR22WJoCIcBKjGo=;
        b=LhimjW08KFbpqTggLm3zlotShuC490vtVeKoEVMJgph5hjC6hJLgl0EYALtZ9jqmP2
         +PXDrcPa475SFKvVeTo1bQP2q8P5gIh3olNyuc2W+y0wowWbB5dbH7+H6t909E58+aYF
         WUKgokgwFxTXTB7mY9CQS05mdpThooGeMHPst1ijto7gmK1V4L2UU29xsPPS8qxXlxl0
         PzUa7oA2tfT9abwBz+/ByI0hFyxlMVzill7ARU4YxersROnGJY5DQM/wL+WBAAfO08GC
         2uMdDYSOey1kNCa+fMqlZ1Yv0JOG+ttI+HALAqHfwgMGk+pLdt2TtSZCYqhPvhADgyLl
         GMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728842; x=1760333642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OedT7hKKspvt0TM3G1uCwteK4e0CQR22WJoCIcBKjGo=;
        b=R0/jAUWFqcNO957iLT1OvIlfiTFqZL41f6JKyQcOVPCoYCmMjF9pLY5mOjnBUpWF6v
         AUsXBem5KFkrivC4MiLVfBiB4YQmiV8VcmfQ2qLkhorZy3jILrqSb2YqO6TYJa/ZuwV6
         PxdXL8lAS9JBo07Q2Htod3mlyAAonsLILsATemwvQGiysQb2xrjmeG9mjHU8ZcdphkaF
         YXQFxYunWZAo56t6fXrVKdXI1aNqDVeIx108LCfgy5Ohoi7kJp+jx1VVbiuCvlfgLY0v
         lfYoZKuKFp/gxaKR4NcmKCgI9bC4FdGNg2Rf7EO8sXV26Amb0+sEKeKyC7Tsyp5PDIG2
         OdwQ==
X-Gm-Message-State: AOJu0Yzk1YB3U9KJK7pEhqdJU/yyiSLFRHVQnHeXwdDTv8jQBbd4eTjF
	U+P386SQyrm1FS7GsWjJS65m6rD2Xjp9+B8tzY2qyRjvwHy6SXQEg277
X-Gm-Gg: ASbGncs4Gi7w2TMzfk4Ml8l1i8ouvOEoxg5+Mh5jLzdccucN2jvbrwTEtXC/duTvmZk
	wOXpMB+JxG6OT87ldzRHn4eLRUOYnn+qTFd/8zd+t1/MKZPV555RmMZFArhM2Bay4wHVvDqar5H
	7kWmJUhpB3VLgqFjjySy2vCSPzX3uznhak9WZzSRV8iV7KxqKAsGphEOwfyNHmY1mz1kTETOikd
	WR/kyCBFjWLDfrsz07vty/fSGV3KkytdvrGNGMB7cTP3hyrJYP5AIG7Md/gasbGQKJygqP5cTvt
	NHUiufbUrBgtqOVUHlqRHoan38Iqbxa6T79csCcPJfxhGmB3+kne0woXKCzMN89oBkylq67OzCB
	w3fHRLqP9nrrScJSxeEVj5KvxnsDrASF8TG9bslalp+26FYFVYAGoUxvAPw3zZcxUaA==
X-Google-Smtp-Source: AGHT+IFHnCQBU2EGOeIC8ciu3UaIUV/+axjAo+enf3TLutT/NIorM9OMriyreL2XNmhZpMGAcXscZQ==
X-Received: by 2002:a17:903:3c24:b0:26c:e270:6dad with SMTP id d9443c01a7336-28e9a664540mr133254745ad.60.1759728842432;
        Sun, 05 Oct 2025 22:34:02 -0700 (PDT)
Received: from devbox.. ([116.16.231.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88fcsm120187075ad.84.2025.10.05.22.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:34:02 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 7/7] LoongArch: BPF: Implement bpf_addr_space_cast instruction
Date: Mon,  6 Oct 2025 05:33:23 +0000
Message-ID: <20251006053323.193581-8-hengqi.chen@gmail.com>
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
index d32f9630825a..d3ea00da8b2e 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -591,6 +591,15 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
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
@@ -1937,6 +1946,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	memset(&ctx, 0, sizeof(ctx));
 	ctx.prog = prog;
 	ctx.arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
+	ctx.user_vm_start = bpf_arena_get_user_vm_start(prog->aux->arena);
 
 	ctx.offset = kvcalloc(prog->len + 1, sizeof(u32), GFP_KERNEL);
 	if (ctx.offset == NULL) {
@@ -2098,3 +2108,8 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_arena(void)
+{
+	return true;
+}
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index 94d1c44b42f3..16c28d0238ef 100644
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

