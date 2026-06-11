Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1BC390226
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 07:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161218; cv=none; b=aNipT0YolQ4HYGXsxd+GwAyPqr5cdyP7kkizeJHyyN9KsbPsTUzIdp+fdveOxd7cfUoSpLqlLrSYp0nfYEpOnUT4Aic7cVsg+Ws7c9xQhlk/nMeXjQYk+9LvVqiL4JjhKGqVXA6U5NofIDEyqZE7q4VDrtxs0y+Qq2knsjhgZhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161218; c=relaxed/simple;
	bh=eZnh3Kje12vZLEq8l8DpvmArrMs4XgsjW6kPObMDsWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ihHPVGZ8aza1opODidJ8ISmyq5YrMCHTtsBvAwGOfHodNzXnKkbd2Jk5+u+cKhmmTiIZ/iSwi9FNjZUgZ8jYrN8Fy6TWRygDOn1FI09VRNBaUUp6OHIZkS4MocfoB3jvbX6AISAZ1+JzjrnTDNy9/Mr8U/d+SEjaPNNeHbRhCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxAuv7XCpqOfwSAA--.50751S3;
	Thu, 11 Jun 2026 15:00:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCx+8H6XCpqY6iiAA--.47750S2;
	Thu, 11 Jun 2026 15:00:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1] bpf: Fix unaligned interpreter panic on JIT fallback path
Date: Thu, 11 Jun 2026 15:00:09 +0800
Message-ID: <20260611070009.26257-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx+8H6XCpqY6iiAA--.47750S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxury3uFWUGF1kCw18XFW7ZFc_yoWrXryfpF
	WDC34akr48XF4Ig3y7Jw42kw15tw4rWayUGa93Kr1F9a1YqrnrWF17K34FgFsxCr409F1x
	Zr42vF129F18JFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7pnQUUUUU

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
Introduce a late fixup phase in __bpf_prog_select_runtime() to fix
it. When the JIT compilation is skipped or fails (!fp->jited), just
traverse the BPF instructions and rewrite the call offsets for the
inlined helpers right before transferring control to the interpreter,
ensuring a safe fallback path.

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

2. Reproduction steps on LoongArch:

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
---
 kernel/bpf/core.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 649cce41e13f..de0c46b495b4 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -2608,6 +2608,30 @@ static struct bpf_prog *bpf_prog_jit_compile(struct bpf_verifier_env *env, struc
 	return prog;
 }
 
+/*
+ * Rewrite the helper call offset for inlined helpers when fallback to
+ * the interpreter happens due to JIT compilation failure or JIT disabled.
+ */
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
+		if (insn->code == (BPF_JMP | BPF_CALL) && insn->src_reg == 0) {
+			if (bpf_jit_inlines_helper_call(insn->imm)) {
+				fn = env->ops->get_func_proto(insn->imm, fp);
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
@@ -2639,6 +2663,15 @@ struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct
 
 		fp = bpf_prog_jit_compile(env, fp);
 		bpf_prog_jit_attempt_done(fp);
+
+		/*
+		 * If JIT compilation failed or is disabled (!fp->jited), we are
+		 * about to fall back to the interpreter path. Fix up the call
+		 * offsets to prevent unaligned memory access panic.
+		 */
+		if (!fp->jited)
+			bpf_fixup_fallback_inline_helpers(env, fp);
+
 		if (!fp->jited && jit_needed) {
 			*err = -ENOTSUPP;
 			return fp;
-- 
2.42.0

