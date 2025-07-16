Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7698E1F473C
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 04:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752640766; cv=none; b=hVbfdEJlQNY3aRQ8+vFE/lpzA5M0LC1uKFAXq8dT6h7y+sePeDK9tHWB1cl1qIwVz4N+woxSQsnuhPmIggdFJjv2LW5wNiG5N3P/2rN4FwQ85XqIvWarxl636SL0n5ebwBcW7vNGL01nG4XLg78tx6IgpnB+eMHe0lmlvjqF52s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752640766; c=relaxed/simple;
	bh=7HDOCBc6V6kKoG+jOtt6yyv5DEob+bLWWJqp9Btf4n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tyf/mXdFH14z44h4JGLhGzG1/FLtTDzUnG5c4K2ue7kM5n5QIxGBOQDrEsd/1TES4UAmg+CyRYaK9/ASiruM8o69OUvEPAsvlPxIUi9Qi3dgD1ElMCa9U9TNCRFPrBeBSvw9JxDcoWbkfZrleFLAjmel9vUNlMQcyFeNVJT72YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxWXH3LHdoleoqAQ--.24102S3;
	Wed, 16 Jul 2025 12:39:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxVOTzLHdonVQZAA--.5847S2;
	Wed, 16 Jul 2025 12:39:16 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Hengqi Chen <hengqi.chen@gmail.com>,
	bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] LoongArch: BPF: Add struct ops support for trampoline
Date: Wed, 16 Jul 2025 12:39:15 +0800
Message-ID: <20250716043915.15034-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxVOTzLHdonVQZAA--.5847S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtrWxKry3XryDJrWkCFyxtFc_yoWxGFy3pr
	yqkF48CFyUK3W2gF4kJr1j9r1rXFsakasxKayUJrZ5KrZxZFyrWF1UKr13WFW3X3WDZryx
	uwnYyw4vvF1xArcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8HKZJUUUUU==

Use BPF_TRAMP_F_INDIRECT flag to detect struct ops and emit proper
prologue and epilogue for this case.

With this patch, all of the struct_ops related testcases (except
struct_ops_multi_pages) passed on LoongArch.

The testcase struct_ops_multi_pages failed is because the actual
image_pages_cnt is 40 which is bigger than MAX_TRAMP_IMAGE_PAGES.

Before:

  $ sudo ./test_progs -t struct_ops -d struct_ops_multi_pages
  ...
  WATCHDOG: test case struct_ops_module/struct_ops_load executes for 10 seconds...

After:

  $ sudo ./test_progs -t struct_ops -d struct_ops_multi_pages
  ...
  #15      bad_struct_ops:OK
  ...
  #399     struct_ops_autocreate:OK
  ...
  #400     struct_ops_kptr_return:OK
  ...
  #401     struct_ops_maybe_null:OK
  ...
  #402     struct_ops_module:OK
  ...
  #404     struct_ops_no_cfi:OK
  ...
  #405     struct_ops_private_stack:SKIP
  ...
  #406     struct_ops_refcounted:OK
  Summary: 8/25 PASSED, 3 SKIPPED, 0 FAILED

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

This is a RFC patch, based on 6.16-rc6 and the following series:

[PATCH v3 0/5] Support trampoline for LoongArch
https://lore.kernel.org/loongarch/20250709055029.723243-1-duanchenghao@kylinos.cn/

 arch/loongarch/net/bpf_jit.c | 71 ++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 6820558afce5..7663b84a4ff1 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1599,6 +1599,7 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
+	bool is_struct_ops = flags & BPF_TRAMP_F_INDIRECT;
 	int ret, save_ret;
 	void *orig_call = func_addr;
 	u32 **branches = NULL;
@@ -1674,18 +1675,31 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 
 	stack_size = round_up(stack_size, 16);
 
-	/* For the trampoline called from function entry */
-	/* RA and FP for parent function*/
-	emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -16);
-	emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
-	emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
-	emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 16);
-
-	/* RA and FP for traced function*/
-	emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -stack_size);
-	emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_size - 8);
-	emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
-	emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size);
+	if (!is_struct_ops) {
+		/*
+		 * For the trampoline called from function entry,
+		 * the frame of traced function and the frame of
+		 * trampoline need to be considered.
+		 */
+		emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -16);
+		emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
+		emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
+		emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 16);
+
+		emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -stack_size);
+		emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_size - 8);
+		emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
+		emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size);
+	} else {
+		/*
+		 * For the trampoline called directly, just handle
+		 * the frame of trampoline.
+		 */
+		emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -stack_size);
+		emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, stack_size - 8);
+		emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
+		emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size);
+	}
 
 	/* callee saved register S1 to pass start time */
 	emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
@@ -1772,21 +1786,30 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 
 	emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
 
-	/* trampoline called from function entry */
-	emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_size - 8);
-	emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
-	emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, stack_size);
+	if (!is_struct_ops) {
+		/* trampoline called from function entry */
+		emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_size - 8);
+		emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
+		emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, stack_size);
+
+		emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
+		emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
+		emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, 16);
 
-	emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
-	emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
-	emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, 16);
+		if (flags & BPF_TRAMP_F_SKIP_FRAME)
+			/* return to parent function */
+			emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_RA, 0);
+		else
+			/* return to traced function */
+			emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_T0, 0);
+	} else {
+		/* trampoline called directly */
+		emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, stack_size - 8);
+		emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
+		emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, stack_size);
 
-	if (flags & BPF_TRAMP_F_SKIP_FRAME)
-		/* return to parent function */
 		emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_RA, 0);
-	else
-		/* return to traced function */
-		emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_T0, 0);
+	}
 
 	ret = ctx->idx;
 out:
-- 
2.42.0

