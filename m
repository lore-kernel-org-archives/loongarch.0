Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CCE288C2B
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 05:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763963827; cv=none; b=aEobJr6L21IINEixNH1nIKugs78VtMtwaqjahOGuqXrBYDzCuGDJaZkJADxZgHOWkimoSpHgwJznP2Xk6VY83j1PAxuDlMPEXeiiNHQMP5NsBXpnsAmeqekdFiIsXJaS5sVxok4u4+YY8ZVN2+s8SVHNNkg2ZFHM+kVqULS2AmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763963827; c=relaxed/simple;
	bh=wP9KvES0Pyqx93pCFDiuiyhnqX71PIJYxTLISNJ6gBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgyZqPHhoaEltzqTjUb1+Fi07NmHBe9e+dKdNc7vPLzr14OdraZKK3ZLHIhzYfguXi5gHr9BZ0zKQ4EQKfIDVzuFpu5XRQeObA35tuqG7+uSniacAhiP3lB/ctoHXR3jdQgJDpiHvzXJoYo9mAvneL0j++dTdp0zh7wCPFntv7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvYYTxoe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvYYTxoe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2984dfae0acso61934285ad.0
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 21:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763963823; x=1764568623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQJrrtNIfaN4jqKW1BokOT59wvHty99NFF8JLOzjvec=;
        b=RvYYTxoebRbn2I/N8h7qzh4IeTM8MNJcnJvwudARRtBtmqhyOERrTmyne3jMovTdyo
         +I7lWq20vjWjJWgHevzOn9pS/YP7UGPhl1TStUk0Z0u85pFZgkmhaaMztj3qtzSScUiB
         mZ5Y5F9t15JfYed3AMvBE6GhLZsjYW9iSYHH6UyNCE629HiRAZRsAqn8pQgUwsH6EuLu
         Khq98F8H/6tEBEjffjhU5KxiTErXmQ0LUhXNl7zemUTsN9mPZY6Mr9rjeSzgbVqh2oDs
         N2ZDPNIC+I27S85Ct+AoM27gydmsR7/DF2myKoeIY36fMjuaHKNPqWJ/Tl51rrAKBMff
         2UoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763963823; x=1764568623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SQJrrtNIfaN4jqKW1BokOT59wvHty99NFF8JLOzjvec=;
        b=FTA1voOV2ZyKh+gzMusimb6mZhDra8I/y596syahlLXxM1ReCTk+E1tF+Mk31nDbQI
         eQFhh/jUN+rTjbkvUrJdQE7RzwtQlgKBtb+Qrz7dJ8ZaMSuc7OPnQfeywuE6KYXFHiEc
         Q5+O1Bakr/cq8ylcN6yp0xXy4jrOXV92XIG4AyWo66ZjMwvTSum2rDr73hPXvIlk0mHl
         VVFxW3t+7V8jPpwJ/rArhtvGUc0nT8Z1sW34sV4NMjM4O6yCcrEb0AplgRJ2Z4n3sJrb
         Oe4KNj0Vs/Bbti/zH7vGOmUA5EgB2fPpR93RoJnsRzFq2dUSGACWPagzEdib4GrtOuLI
         6ydg==
X-Gm-Message-State: AOJu0YwAvgPbm63bBE2TTjj3KzdlYMEY1DaB2wBE9amLzfcr3u3VKNkK
	CcFQmTdU9CrpBrLzKe5+fHlZ9AmG8r58XdZhMZquVhV2mu/2LZQpLHIc
X-Gm-Gg: ASbGncvrdwmF7Zkc71F11/licGdLLc13Ll70h+w4xpKLJjLdfI+eeVNsbUFg6i3f049
	0zJRTluUaSa7BfXGqdPcWtCHMUWIGExBYiHd0QZi6necLlyKEODneQ+zJb005KmlVyUOVIdhXO8
	rpMMkRjQKgiAeRX8xtHNBAw5CxllHL7xOhNanz4A1bH2W7qV3E6VuEzlboNP0T7CaRCJf6AD6Oq
	bfX3L7byn1g1jE70I1nGQkR+CvZilP/UiiK2Y8fBM63KyPSTA4zK7aP2P50FSIidBpwNrcMDEpH
	6bxCIuS7y/Eo/Z4xY5Rjol9v16xhe6XsABmCA2AeWf5FbeCRMs5olXmT72xpsRVXSh3TbsYRuqL
	Bs2cGZVQrkOCESpS0TAJ0x2D3+HJR/lxwejMVw6g5m8FqFXi5faxNWO4v+QFvjqtoK10DBrveKy
	N+0HtlB/w2uWJpz/M3IytgWZ8UN6fG
X-Google-Smtp-Source: AGHT+IFzzkbbHQt3BegAu0+cY6Ioe2ECRWUChRGq9heN9kUR0Q6uQrkHN5GS+FYtdMHcoMm5YOrCnw==
X-Received: by 2002:a17:902:e945:b0:295:565b:c691 with SMTP id d9443c01a7336-29b6be9d664mr127924245ad.17.1763963822797;
        Sun, 23 Nov 2025 21:57:02 -0800 (PST)
Received: from devbox.. ([43.132.141.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b106094sm124881785ad.10.2025.11.23.21.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 21:57:02 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 3/5] LoongArch: BPF: Use BPF prog pack allocator
Date: Mon, 24 Nov 2025 05:56:40 +0000
Message-ID: <20251124055642.1591-4-hengqi.chen@gmail.com>
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

Use bpf_jit_binary_pack_alloc() for JIT binaries. The BPF
prog pack allocator creates a pair of RW and RX buffers.
The JIT writes the program into the RW buffer. When the JIT
is done, the program is copied to the final RX buffer
with bpf_jit_binary_pack_finalize.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 123 ++++++++++++++++++++++++-----------
 arch/loongarch/net/bpf_jit.h |   2 +-
 2 files changed, 87 insertions(+), 38 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 4be8515197ce..c1c71c2e86f0 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -459,11 +459,11 @@ static int add_exception_handler(const struct bpf_insn *insn,
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
@@ -474,14 +474,18 @@ static int add_exception_handler(const struct bpf_insn *insn,
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
@@ -489,13 +493,25 @@ static int add_exception_handler(const struct bpf_insn *insn,
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
 
@@ -1808,11 +1824,12 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
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
@@ -1847,8 +1864,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
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
@@ -1882,17 +1901,26 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
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
@@ -1900,48 +1928,47 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 
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
@@ -1961,17 +1988,39 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
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
index ed0193659cf9..7a9d2134f8d1 100644
--- a/arch/loongarch/net/bpf_jit.h
+++ b/arch/loongarch/net/bpf_jit.h
@@ -24,7 +24,7 @@ struct jit_ctx {
 
 struct jit_data {
 	struct bpf_binary_header *header;
-	u8 *image;
+	struct bpf_binary_header *ro_header;
 	struct jit_ctx ctx;
 };
 
-- 
2.43.5

