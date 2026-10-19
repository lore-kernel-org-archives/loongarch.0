Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5D432FA2E
	for <loongarch@lists.linux.dev>; Mon, 19 Oct 2026 01:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373624; cv=none; b=HbeKP9hKVxPAQ/PaTmuLkBAj77fr/YgqviJFzmmQdiG+3UMgksf3N1iozIBZtqCZvFpd/DvVS3IRPD+hP8cdvIGWjsGOgCwKucJtsqih8D3vxWSmf2FhNEb+645xh/gVZ9o/mhrhKLkvUXmQf0Lw/1H93nH6dN07IeypfGiHUs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373624; c=relaxed/simple;
	bh=CLPXxO8YwoqCRp2ZUTaY8ylfbE+V5chVr1TGEeyRt38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6yRTt3xrOeGNzdReDzFVTsPcnPgbUhYDRoyaaKb/c+EJ3rkT4IynhZChBLBnsa4jRzd9nhBcP+YLVd4e1NtleIa+ZrRobdydvAVgRVV35HPxMJuc3yu+NBVsNTcXS+9hXfSok8RMTsNMABS7r1qRyqEb2wIIXfhxTZI2VvCPBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Bxn9Fyc9VqDCQXAA--.1255S3;
	Mon, 19 Oct 2026 09:33:39 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxTs9wc9VqFtctAA--.30913S2;
	Mon, 19 Oct 2026 09:33:36 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] LoongArch: BPF: Fix stack arguments for indirect trampolines
Date: Mon, 19 Oct 2026 09:33:35 +0800
Message-ID: <20261019013335.13512-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs9wc9VqFtctAA--.30913S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF4DXF1xGr4rZw1kCr18Xrc_yoW5tFWkpF
	n8CFsxGF40qr4xt3Z7GayUZrya9Fs3Zw43Wr4DJay0ya15ury8XF1rK3ZI9F98GrnYv340
	vrs0vwn09FWDA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7iFxUUUUU

From: Kumar Kartikeya Dwivedi <memxor@gmail.com>

LoongArch passes arguments beyond a0-a7 at the caller stack pointer. The
trampoline store_args() helper always reads those arguments at FP + 16,
which is correct for a regular fentry trampoline: its prologue leaves FP
16 bytes below the stack pointer at trampoline entry to hold the saved
RA/FP frame record of the parent function.

A struct_ops indirect trampoline is entered through a function pointer and
only saves its own RA and FP before setting FP to the entry stack pointer.
Its stack arguments therefore start at FP, not FP + 16. As a result, every
stack-passed struct_ops argument is currently read two slots late.

Select the source offset based on whether the trampoline is indirect. This
also prepares the stack-passed arena argument path to consume the actual
pointer slot.

With this patch, the BPF selftest "./test_progs -t struct_ops_multi_args"
passed on LoongArch.

Fixes: c9ebe2016de9 ("LoongArch: BPF: Support up to 12 function arguments for trampoline")
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
v3:
  - Reword the log and comment to clarify that the 16-byte frame record
    is saved for the parent function, not the traced function. (bot+bpf-ci)
  - Remove a stray blank line after the opening brace of store_args(). (bot+bpf-ci)
  - Reorder the comment sentences to match the true/false branches of
    is_struct_ops for better readability.

Here is the original link:
https://lore.kernel.org/bpf/20260821233516.3426127-8-memxor@gmail.com/

This version is based on the series:
https://lore.kernel.org/loongarch/20261016081006.26069-1-yangtiezhu@loongson.cn/

 arch/loongarch/net/bpf_jit.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 1a7c8effc37b..c6784602f029 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1725,17 +1725,22 @@ int bpf_arch_text_invalidate(void *dst, size_t len)
 	return ret;
 }
 
-static void store_args(struct jit_ctx *ctx, int nr_arg_slots, int args_off)
+static void store_args(struct jit_ctx *ctx, int nr_arg_slots, int args_off, bool is_struct_ops)
 {
+	/*
+	 * Indirect struct_ops trampolines place incoming stack arguments directly at FP.
+	 * Regular fentry trampolines need to skip the 16-byte RA/FP frame record saved
+	 * for the parent function.
+	 */
+	int stack_args_off = is_struct_ops ? 0 : 16;
 	int i;
 
 	for (i = 0; i < nr_arg_slots; i++) {
 		if (i < LOONGARCH_MAX_REG_ARGS)
 			emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOONGARCH_GPR_FP, -args_off);
 		else {
-			/* Skip slots for T0 and FP of traced function */
 			emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP,
-				  16 + (i - LOONGARCH_MAX_REG_ARGS) * 8);
+				  stack_args_off + (i - LOONGARCH_MAX_REG_ARGS) * 8);
 			emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -args_off);
 		}
 		args_off -= 8;
@@ -2068,7 +2073,7 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	func_meta = nr_arg_slots;
 	emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -func_meta_off, func_meta);
 
-	store_args(ctx, nr_arg_slots, args_off);
+	store_args(ctx, nr_arg_slots, args_off, is_struct_ops);
 
 	if (bpf_fsession_cnt(tnodes)) {
 		/* clear all session cookies' value */
-- 
2.42.0

