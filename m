Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B17F25CC74
	for <loongarch@lists.linux.dev>; Fri, 12 Jun 2026 01:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781226625; cv=none; b=efciLsEAsVYHKwPdHuYfVIpRbXZUuxiyMQl9xE4elqpDVESZphNJZq+fsAZBHPAye2/FCYf4TWXta2DPBm2I0RIS6rG/UavgAC/Y0rttZQV+G7tqiDp52Mlj4kpn9wWuEz9b1+kmf71ahhagnn7VHSevylmZ8zULYzf8MnHCS64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781226625; c=relaxed/simple;
	bh=pNiKlJ6NbmzWPwwAd1NDkeKjChv85ysLybtmH1wQAEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d1MIKIdTZZfn0S2enxsvRJ8f1/fZ+kRTL/MpvARXosTi5ZPrhAY/1FehP3lA1gmgvSqlLej4O+KJQIxMHVmBNAiuF6BI/oQa5rVIVOpjD8YQrB5ADY5+IYZn+ZOF9xAuk3DZJ5SdSF1Ay/RVypx/LAXZXpyom8GUFj7iuCA8EvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxZnh7XCtqTk0TAA--.26570S3;
	Fri, 12 Jun 2026 09:10:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCx_8J5XCtqUG+jAA--.47689S2;
	Fri, 12 Jun 2026 09:10:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3] bpf: Fix unaligned interpreter panic on JIT fallback path
Date: Fri, 12 Jun 2026 09:10:16 +0800
Message-ID: <20260612011016.25701-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8J5XCtqUG+jAA--.47689S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxury3uFWUGF1kWFyfZr4kZrc_yoWrXr43pF
	95Cw4akr4UXF4Ig3y7JwsFvw15Kw48uay5GayfKr1FkF4FqrnrW3WUKw1FgFsxGr4j9F1x
	Zr42vFy29a48JFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==

When an architecture implements bpf_jit_inlines_helper_call(), such
as LoongArch, ARM64, and RISC-V, the BPF verifier skips rewriting
the helper call offset (insn->imm) during the bpf_do_misc_fixups()
phase if the helper is expected to be inlined by the JIT compiler.
As a result, insn->imm remains as the raw helper enum ID.

However, if JIT is disabled at runtime (net.core.bpf_jit_enable=0)
or if the JIT compilation later dynamically fails (e.g., due to OOM
during bpf_jit_alloc_exec()), the core BPF subsystem falls back to
the BPF interpreter.

When the fallback interpreter executes (__bpf_call_base + insn->imm)
with the unpatched raw helper ID, it jumps into an unaligned invalid
address space, triggering a fatal instruction alignment fault (ADEF)
or illegal memory access kernel panic.

This issue impacts all architectures that support helper inlining.
Introduce a late fixup pass via bpf_fixup_fallback_inline_helpers()
in __bpf_prog_select_runtime() to fix it.

When JIT compilation fails or is disabled, the helper call offsets
originally skipped for inlining are rewritten to relative memory
offsets right before transferring control to the interpreter.

A bounds check on insn->imm against __BPF_FUNC_MAX_ID is added to
ensure already-patched address offsets of regular non-inlined helpers
are safely filtered out during traversal.

1. Test case (test_panic.c):

  #include <linux/bpf.h>
  #include <bpf/bpf_helpers.h>

  SEC("kprobe/sys_getpid")
  int test_panic(void *ctx)
  {
  	struct task_struct *task;

  	task = (struct task_struct *)bpf_get_current_task();
  	if (task)
  		bpf_printk("Task address: %p\n", task);

  	return 0;
  }

  char LICENSE[] SEC("license") = "GPL";

2. Reproduction steps:

  $ clang -target bpf -O2 -g -c test_panic.c -o test_panic.o
  $ sudo sysctl -w net.core.bpf_jit_enable=0
  $ sudo bpftool prog load test_panic.o /sys/fs/bpf/test_panic autoattach
  $ sudo cat /sys/kernel/debug/tracing/trace_pipe

3. Panic information on LoongArch:

  Kernel ade access[#1]:
  ...
      ra: 9000000000486e50 ___bpf_prog_run+0x1370/0x36b0
     ERA: 9000000000485383 __bpf_prog_ret0_warn+0x13/0x20
  ...
   ESTAT: 00080000 [ADEF] (IS= ECode=8 EsubCode=0)

Fixes: 2ddec2c80b44 ("riscv, bpf: inline bpf_get_smp_processor_id()")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Acked-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/bpf/core.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 649cce41e13f..14bb71853a15 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -2608,6 +2608,31 @@ static struct bpf_prog *bpf_prog_jit_compile(struct bpf_verifier_env *env, struc
 	return prog;
 }
 
+/* Fix up helper call offsets for inlined helpers on JIT fallback path. */
+static void bpf_fixup_fallback_inline_helpers(struct bpf_verifier_env *env, struct bpf_prog *fp)
+{
+	struct bpf_insn *insn = fp->insnsi;
+	const struct bpf_func_proto *fn;
+	int i;
+
+	if (!env || !env->ops->get_func_proto)
+		return;
+
+	for (i = 0; i < fp->len; i++, insn++) {
+		if (bpf_helper_call(insn)) {
+			/* Filter out already-patched address offsets. */
+			if (insn->imm >= __BPF_FUNC_MAX_ID)
+				continue;
+
+			if (bpf_jit_inlines_helper_call(insn->imm)) {
+				fn = env->ops->get_func_proto(insn->imm, env->prog);
+				if (fn && fn->func)
+					insn->imm = fn->func - __bpf_call_base;
+			}
+		}
+	}
+}
+
 struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct bpf_prog *fp,
 					   int *err)
 {
@@ -2643,6 +2668,9 @@ struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct
 			*err = -ENOTSUPP;
 			return fp;
 		}
+
+		if (!fp->jited)
+			bpf_fixup_fallback_inline_helpers(env, fp);
 	} else {
 		*err = bpf_prog_offload_compile(fp);
 		if (*err)
-- 
2.42.0

