Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8A62472B1
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 05:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759728839; cv=none; b=C2bP5Ku4D/RQ6rD73ByfbH/DetG+YlScuahRvZOz2CRFqnirwBsyKj4v4oCP3d8HIq957gJkFBosaahzBNKDob6yv2B/9b3Hy4mVHmBja8bxTEkUfPNE85XXaFTvQ3UZOsxKox6SoIgBw0CdsZLz/nQAjDbkUFHVOW8dlGTpGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759728839; c=relaxed/simple;
	bh=w1STG67KNOwBm1+IqoaNsepyc7ohrpWg9UeSjEurASs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDG6hXPZim4IoSAz+J/Rr8wrTrCgeelnspPZvpj+OtVH8y8xo4zgAXe9MffiI/UOGe1A7wmJIW4bk/Fvt0Jkx8FRDmH09O8aqPzpJ2e4c+rT4PIkZz8U5sot547/iSXOIGSvMoYrLOdRx5cII1yF/puiHukGH+bgoaxGHL5w4xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fV+luLM7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fV+luLM7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-28e7cd34047so38543915ad.2
        for <loongarch@lists.linux.dev>; Sun, 05 Oct 2025 22:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759728836; x=1760333636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ae48NXMwv7Or/hDk1Phha1tzBU966acEZda0f0wrHKE=;
        b=fV+luLM7MaRGcFafudtO8+Jh0+W1WijAoDi+u671vxojW/vuIp1OgnkRoPh7/+YPTH
         8fEVqVnMmfzxm/ecn3GNRROz8SXdtML5Epk1iV3YlVWlPZZmq/DuLpJuaL4DRuFbmfT+
         4s2HrtsV2zr4OX1bwzciBiuV8TB8Rxoq0dClmc8pAn2tIL982gEBUdP07VwW7xDgyitX
         4ysDB9rn2pn6FlwpxvVFd4yTDY729/t2WtM5p2GwrFxcidiI6x5TAy0KtGXWZdIuniHt
         7Bk/TtvtJZVr6zkFcRZ3+1Rde8dKgcfGljjD4t5orugfegDG44vJLVLhqxgV1Sk+2hwI
         UV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759728836; x=1760333636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae48NXMwv7Or/hDk1Phha1tzBU966acEZda0f0wrHKE=;
        b=FUV36Bajiym2QY3YWwviMSIpjStLtx0CBgUnw61LN7Uf0jDHUIN0HeD13DEBvbRxbU
         qZcIphl+SABt0w7N9SlcgWA0LctFeD05mj5BDSy776GDZOryf94G+CAyomH3l9GwdjI7
         ejpnATeZhpRcZzHTX8WjzGHsSSc8um9lGbca90JhyYjKJ4/a4GHwNgjS9dVOtqznTEX4
         osUxyo/u5oAQrKVjgIaS1sQBflsbYvCITDpaEZUsbtVgetxC6d4dMSqiQ1WwfifUc2Xt
         OggHW51B0wZm8btLlhBwGo2C4FYFl2kKJCZVzzoQDQTF5lFCmniWnCRvvo1V8owov0NB
         QPog==
X-Gm-Message-State: AOJu0YyVxRsGu26EyCqpK1tw3JnyUPvvMVYXrC6fgfHLgCzMoOqbjc+W
	Vqik+mDi43kPjU928mya+5Y9QlwMi32g1+bo779GfcjF0csarO7Qy7YT
X-Gm-Gg: ASbGnctm6YvRbFRDSJ2ORP/qmgROMDeysIVHMAWM9Pi/+7h62wFo3vJv4vTIdPwCeth
	C9HBYX4WJ4L3HvvkULZImXuHRE0rg6hrLa/YY1204oWFz8HpcIuJhQu1Mq0yhZDhAJ65T23fZ36
	vFx1+z+l7fQhqVx7LvkAy7oR+JU3c4jcIjtuMcxS+4uHpGzGJRoOaht3JhftSvMwgsxcLyEEDfH
	T6/uVSLow43HuKV/MbTYR2j7/i5WYzIpEx/S6ahgI7N/KdbG+9f2GEELM+ZgeYoSaV7M+tcKoBm
	/7y8beWyFCzYS1R4UhgmGu6PdQxxUmSqB3ZE452XqmChe+MQMFhYLNBdRR+EqG1G5lH0Hi9Ccie
	uRiQkZ4xFMdOphcByWIOb6jlN1/heyv1ISBQ8YniiFG21994+yXiCL6y1dOlmxVJr5w==
X-Google-Smtp-Source: AGHT+IE8RjVGNUOfHsMrBak48pxL1WyDreFoV7/PylsTzqAllzXqImzqGD1P6+tVHQ4X/8Y36GbnGw==
X-Received: by 2002:a17:902:f68c:b0:24a:d213:9e74 with SMTP id d9443c01a7336-28e9a634df9mr154148485ad.49.1759728836382;
        Sun, 05 Oct 2025 22:33:56 -0700 (PDT)
Received: from devbox.. ([116.16.231.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b88fcsm120187075ad.84.2025.10.05.22.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:33:56 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 5/7] LoongArch: BPF: Use BPF prog pack allocator
Date: Mon,  6 Oct 2025 05:33:21 +0000
Message-ID: <20251006053323.193581-6-hengqi.chen@gmail.com>
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

Use bpf_jit_binary_pack_alloc() for JIT binaries. The BPF
prog pack allocator creates a pair of RW and RX buffers.
The JIT writes the program into the RW buffer. When the JIT
is done, the program is copied to the final RX buffer
with bpf_jit_binary_pack_finalize.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 123 ++++++++++++++++++++++++-----------
 arch/loongarch/net/bpf_jit.h |   2 +-
 stxSxLQw                     |   0
 3 files changed, 87 insertions(+), 38 deletions(-)
 create mode 100644 stxSxLQw

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 9f868bf85960..57a9774affad 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -490,11 +490,11 @@ static int add_exception_handler(const struct bpf_insn *insn,
 				 struct jit_ctx *ctx,
 				 int dst_reg)
 {
-	unsigned long pc;
-	off_t offset;
 	struct exception_table_entry *ex;
+	off_t ins_offset, fixup_offset;
+	unsigned long pc;
 
-	if (!ctx->image || !ctx->prog->aux->extable)
+	if (!ctx->image || !ctx->ro_image || !ctx->prog->aux->extable)
 		return 0;
 
 	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
@@ -505,14 +505,18 @@ static int add_exception_handler(const struct bpf_insn *insn,
 		return -EINVAL;
 
 	ex = &ctx->prog->aux->extable[ctx->num_exentries];
-	pc = (unsigned long)&ctx->image[ctx->idx - 1];
+	pc = (unsigned long)&ctx->ro_image[ctx->idx - 1];
 
-	offset = pc - (long)&ex->insn;
-	if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
+	/*
+	 * This is the relative offset of the instruction that may fault from
+	 * the exception table itself. This will be written to the exception
+	 * table and if this instruction faults, the destination register will
+	 * be set to '0' and the execution will jump to the next instruction.
+	 */
+	ins_offset = pc - (long)&ex->insn;
+	if (WARN_ON_ONCE(ins_offset >= 0 || ins_offset < INT_MIN))
 		return -ERANGE;
 
-	ex->insn = offset;
-
 	/*
 	 * Since the extable follows the program, the fixup offset is always
 	 * negative and limited to BPF_JIT_REGION_SIZE. Store a positive value
@@ -520,13 +524,25 @@ static int add_exception_handler(const struct bpf_insn *insn,
 	 * bits. We don't need to worry about buildtime or runtime sort
 	 * modifying the upper bits because the table is already sorted, and
 	 * isn't part of the main exception table.
+	 *
+	 * The fixup_offset is set to the next instruction from the instruction
+	 * that may fault. The execution will jump to this after handling the
+	 * fault.
 	 */
-	offset = (long)&ex->fixup - (pc + LOONGARCH_INSN_SIZE);
-	if (!FIELD_FIT(BPF_FIXUP_OFFSET_MASK, offset))
+	fixup_offset = (long)&ex->fixup - (pc + LOONGARCH_INSN_SIZE);
+	if (!FIELD_FIT(BPF_FIXUP_OFFSET_MASK, fixup_offset))
 		return -ERANGE;
 
+	/*
+	 * The offsets above have been calculated using the RO buffer but we
+	 * need to use the R/W buffer for writes.
+	 * switch ex to rw buffer for writing.
+	 */
+	ex = (void *)ctx->image + ((void *)ex - (void *)ctx->ro_image);
+	ex->insn = ins_offset;
+	ex->fixup = FIELD_PREP(BPF_FIXUP_OFFSET_MASK, fixup_offset) |
+		    FIELD_PREP(BPF_FIXUP_REG_MASK, dst_reg);
 	ex->type = EX_TYPE_BPF;
-	ex->fixup = FIELD_PREP(BPF_FIXUP_OFFSET_MASK, offset) | FIELD_PREP(BPF_FIXUP_REG_MASK, dst_reg);
 
 	ctx->num_exentries++;
 
@@ -1809,11 +1825,12 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 {
 	bool tmp_blinded = false, extra_pass = false;
-	u8 *image_ptr;
+	u8 *image_ptr, *ro_image_ptr;
 	int image_size, prog_size, extable_size;
 	struct jit_ctx ctx;
 	struct jit_data *jit_data;
 	struct bpf_binary_header *header;
+	struct bpf_binary_header *ro_header;
 	struct bpf_prog *tmp, *orig_prog = prog;
 
 	/*
@@ -1848,8 +1865,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	}
 	if (jit_data->ctx.offset) {
 		ctx = jit_data->ctx;
-		image_ptr = jit_data->image;
+		ro_image_ptr = (void *)ctx.ro_image;
+		ro_header = jit_data->ro_header;
 		header = jit_data->header;
+		image_ptr = (void *)header + ((void *)ro_image_ptr - (void *)ro_header);
 		extra_pass = true;
 		prog_size = sizeof(u32) * ctx.idx;
 		goto skip_init_ctx;
@@ -1883,17 +1902,26 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	prog_size = sizeof(u32) * ctx.idx;
 	image_size = prog_size + extable_size;
 	/* Now we know the size of the structure to make */
-	header = bpf_jit_binary_alloc(image_size, &image_ptr,
-				      sizeof(u32), jit_fill_hole);
-	if (header == NULL) {
+	ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
+					      sizeof(u32), &header, &image_ptr,
+					      jit_fill_hole);
+	if (!ro_header) {
 		prog = orig_prog;
 		goto out_offset;
 	}
 
 	/* 2. Now, the actual pass to generate final JIT code */
+	/*
+	 * Use the image(RW) for writing the JITed instructions. But also save
+	 * the ro_image(RX) for calculating the offsets in the image. The RW
+	 * image will be later copied to the RX image from where the program
+	 * will run. The bpf_jit_binary_pack_finalize() will do this copy in the
+	 * final step.
+	 */
 	ctx.image = (union loongarch_instruction *)image_ptr;
+	ctx.ro_image = (union loongarch_instruction *)ro_image_ptr;
 	if (extable_size)
-		prog->aux->extable = (void *)image_ptr + prog_size;
+		prog->aux->extable = (void *)ro_image_ptr + prog_size;
 
 skip_init_ctx:
 	ctx.idx = 0;
@@ -1901,48 +1929,47 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 
 	build_prologue(&ctx);
 	if (build_body(&ctx, extra_pass)) {
-		bpf_jit_binary_free(header);
 		prog = orig_prog;
-		goto out_offset;
+		goto out_free;
 	}
 	build_epilogue(&ctx);
 
 	/* 3. Extra pass to validate JITed code */
 	if (validate_ctx(&ctx)) {
-		bpf_jit_binary_free(header);
 		prog = orig_prog;
-		goto out_offset;
+		goto out_free;
 	}
 
 	/* And we're done */
 	if (bpf_jit_enable > 1)
 		bpf_jit_dump(prog->len, prog_size, 2, ctx.image);
 
-	/* Update the icache */
-	flush_icache_range((unsigned long)header, (unsigned long)(ctx.image + ctx.idx));
-
 	if (!prog->is_func || extra_pass) {
-		int err;
-
 		if (extra_pass && ctx.idx != jit_data->ctx.idx) {
 			pr_err_once("multi-func JIT bug %d != %d\n",
 				    ctx.idx, jit_data->ctx.idx);
 			goto out_free;
 		}
-		err = bpf_jit_binary_lock_ro(header);
-		if (err) {
-			pr_err_once("bpf_jit_binary_lock_ro() returned %d\n",
-				    err);
+		if (WARN_ON(bpf_jit_binary_pack_finalize(ro_header, header))) {
+			/* ro_header has been freed */
+			ro_header = NULL;
+			prog = orig_prog;
 			goto out_free;
 		}
+		/*
+		 * The instructions have now been copied to the ROX region from
+		 * where they will execute. Now the data cache has to be cleaned to
+		 * the PoU and the I-cache has to be invalidated for the VAs.
+		 */
+		bpf_flush_icache(ro_header, ctx.ro_image + ctx.idx);
 	} else {
 		jit_data->ctx = ctx;
-		jit_data->image = image_ptr;
 		jit_data->header = header;
+		jit_data->ro_header = ro_header;
 	}
 	prog->jited = 1;
 	prog->jited_len = prog_size;
-	prog->bpf_func = (void *)ctx.image;
+	prog->bpf_func = (void *)ctx.ro_image;
 
 	if (!prog->is_func || extra_pass) {
 		int i;
@@ -1962,17 +1989,39 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	if (tmp_blinded)
 		bpf_jit_prog_release_other(prog, prog == orig_prog ? tmp : orig_prog);
 
-
 	return prog;
 
 out_free:
-	bpf_jit_binary_free(header);
-	prog->bpf_func = NULL;
-	prog->jited = 0;
-	prog->jited_len = 0;
+	if (header) {
+		bpf_arch_text_copy(&ro_header->size, &header->size, sizeof(header->size));
+		bpf_jit_binary_pack_free(ro_header, header);
+	}
 	goto out_offset;
 }
 
+void bpf_jit_free(struct bpf_prog *prog)
+{
+	if (prog->jited) {
+		struct jit_data *jit_data = prog->aux->jit_data;
+		struct bpf_binary_header *hdr;
+
+		/*
+		 * If we fail the final pass of JIT (from jit_subprogs),
+		 * the program may not be finalized yet. Call finalize here
+		 * before freeing it.
+		 */
+		if (jit_data) {
+			bpf_jit_binary_pack_finalize(jit_data->ro_header, jit_data->header);
+			kfree(jit_data);
+		}
+		hdr = bpf_jit_binary_pack_hdr(prog);
+		bpf_jit_binary_pack_free(hdr, NULL);
+		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
+	}
+
+	bpf_prog_unlock_free(prog);
+}
+
 bool bpf_jit_bypass_spec_v1(void)
 {
 	return true;
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index 5697158fd164..e76819a157ca 100644
--- a/arch/loongarch/net/bpf_jit.h
+++ b/arch/loongarch/net/bpf_jit.h
@@ -24,7 +24,7 @@ struct jit_ctx {
 
 struct jit_data {
 	struct bpf_binary_header *header;
-	u8 *image;
+	struct bpf_binary_header *ro_header;
 	struct jit_ctx ctx;
 };
 
diff --git a/stxSxLQw b/stxSxLQw
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.43.5

