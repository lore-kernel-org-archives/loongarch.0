Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4765E37BE92
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004539; cv=none; b=okYA1VhNE4yIT80yumqwUdK9B+bs8A7apIEf/XucYzF3ypLhJN+rkRFcU0G+7RrUP5fcovWiGhiwc+5wUVktw6PpzV+PKj2IRTAFYQh/E8RmXaTrbqSnI7k1dutq2KWpAyz9F6AETGO1UxhiV8wcQbGpcEXeFzUJPSwQezvqemo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004539; c=relaxed/simple;
	bh=XB0fSNIjIk01jOeNim8P2+B3b3u3yw7YgSCNd4g9j/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeJKFGoEr7Bw7nTgSYhHdRmuhHGbw/de0KL7Ys6HJ1UzUiB2m/0SkvamiaJXM1Jh1AoopMwVcRg5syo4Rz/MoTyvW9eRuzZzumAbeAum7GUIZ5vnyZAN37UX/UJiu3r0GeUO72euI6/U/uTjRSXtC5+W3S249BSGUI/ciiYble0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOQStZiE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOQStZiE"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f3b4ae67bso3524809b3a.1
        for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 06:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769004536; x=1769609336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhQjzdiHtsc6lD39yVOvOvT/+5k7X34YmBaBZuxgYAA=;
        b=HOQStZiEtXOPXQRB6yNipciulG4VbzPdag5tSfYF78Q3H4obEOIViydKsYyRqVC6VL
         MlkOIil46mQxW9BtozTqAdQU23DacBnMlbF8tKY1vmL50/85fq5JA9qnhZ/bWwtJnDXk
         6IkbVqJlbAm1pzbRkVuIkyFWKHThU20Lsfjp+9vs5JZ115FVOwEPMYRIgk+YC5V/Wh7y
         2nl9bWgecsEnBrK5mFoLy4vdFPdv45xYm5XZljTCHzm4r/GY63Ljj+oclGj5u5Hc3hua
         8fRKo4JSyWZ0OEagiY9OF4kgxnCQaRDijPb+KYT3hSmO3wYnDMzsYnzclxtT5nId4abw
         H9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769004536; x=1769609336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LhQjzdiHtsc6lD39yVOvOvT/+5k7X34YmBaBZuxgYAA=;
        b=qlno7tgOFr/RI1qgHuIIDBzKg2DpOL4iLeltMzvCR2zJHYjolQtI/BySs8Ij1sy13G
         M7AtSNPg7r3LpsC1U5+lwtVZ0Jztg05XUYtpyLcSQvWDpyzl6KvXxIVe/rvjgkIT89dX
         rs48E/8OaZiimzAgkteLp0FatNrCl0+MD4ESG6c0Mnv2DBoHOhq5h2DPUZ4IzdvyCgzm
         yeJ4+l7801gk9QynnoBa02BAWzTFQdBIypmqRif9Gt4SrQ7J9VZSfD1Ce3N2/zXujqQz
         qHELySHApeIQDZiZ6uvA4XJQIgwxr1y/voHMUqEuiA1q/kh3z4nQBQNEpZrcCXFaSCEp
         Ygcw==
X-Gm-Message-State: AOJu0Yz6vh62SkeweQ6GCVYCjGwa+NFg5w6c0TgOsIMlDb9CoZ1RIAGX
	FjNNCdX8qCD+Q7cLXvKejRsERqjvXfZzP9zsFqbtnFHw7EUAGZLPw9qw
X-Gm-Gg: AZuq6aK+bPXxS0+Fdu9WkyjdsGcPcsEOzld0858a6Eu0o20OwqBiYW7NDEu0mEDlJy6
	c8fOYVvHp8PgYRX9ZTBHLKlGA9JnUwOefPIFerG8xAdl36JbCfjDojB8ZoboUhyqsjelVX7z4Is
	uY/WrArf3zQMuUDRBsbIqmK8r7WcoZz1MwcrOVkS7XBqS8NoU1TKyhMqMmdQU16D8mIDMoZGbyd
	fWtsL0Kn7ZQ/JRKnKxWTaqc9uwLq6XoQUmVkQ0w5CUWpkCsenHvrAfc33yNxBSfk5BmfRiEr7zM
	MjZgjqQlV19Sg5Ujfz4ljshlkrNqQ5hu07GUy2Cds/vq3LHO8unjRR9ijxUACk678KkhbHRQVY6
	L2uQmbncbHisTUxV/r/gOTTnjBHxI/anV185+GwW+w+kqRqJfVoMgLxvMJUkkOQSc/KQVES2bRk
	UGDYBhL2hlPdPBBRJB/7xDS72M/HBoYXtuKzuX1P5t2hobbg==
X-Received: by 2002:a05:6a00:3bf5:b0:81f:f10e:fb17 with SMTP id d2e1a72fcca58-81ff10efbc0mr3385891b3a.59.1769004536256;
        Wed, 21 Jan 2026 06:08:56 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.161])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82180636c38sm715964b3a.24.2026.01.21.06.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:08:55 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH v2 1/3] LoongArch: BPF: Use BPF prog pack allocator
Date: Wed, 21 Jan 2026 14:08:38 +0000
Message-ID: <20260121140840.2165381-2-hengqi.chen@gmail.com>
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

Use bpf_jit_binary_pack_alloc() for JIT binaries. The BPF
prog pack allocator creates a pair of RW and RX buffers.
The JIT writes the program into the RW buffer. When the JIT
is done, the program is copied to the final RX buffer
with bpf_jit_binary_pack_finalize.

Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Vincent Li <vincent.mc.li@gmail.com>
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 123 ++++++++++++++++++++++++-----------
 arch/loongarch/net/bpf_jit.h |   2 +-
 2 files changed, 87 insertions(+), 38 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index d1d5a65308b9..ee7395561bd2 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -460,11 +460,11 @@ static int add_exception_handler(const struct bpf_insn *insn,
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
@@ -475,14 +475,18 @@ static int add_exception_handler(const struct bpf_insn *insn,
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
@@ -490,13 +494,25 @@ static int add_exception_handler(const struct bpf_insn *insn,
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
 
@@ -1829,11 +1845,12 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
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
@@ -1868,8 +1885,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
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
@@ -1903,17 +1922,26 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
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
@@ -1921,48 +1949,47 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 
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
@@ -1982,17 +2009,39 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
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
index 75b6330030a9..38eb75f79069 100644
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

