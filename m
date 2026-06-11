Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7ED3CAA49
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172744; cv=none; b=oBKHRzpEfxvuCWDz6e8gQ7axFWpnAnE0MVu94jKhPXXt1x98m/tMKv9WGdrYcv5YgdvNrcxK32LHoA/Pev4ZPbXKX/3OVw6YP/4t01gZy39OEuoATspXj+ejckNan6nz3V0iNPUtoptwqKraS0s8BX+8SfnO6yTYOjKu4RTKGJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172744; c=relaxed/simple;
	bh=gy4WYISVSPa7wX3CDZfbfoIxVgT+rzxK3PwMC+Hx/IM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZOJZPmSYXbx51KvGAucHZb0l/VUQGJ3mKlUw5QgVGkcKdOfMFi0Yf6eFr6Vr9taYI0JAUFqFXKGX84b5gbUKVxHOyS6MWrz+JsW1tLrwC5mcpQzEVsyaP+VQl0UzMaXlm492Tw1oJuOp/VaIzmgBqfpa8/Zqb58lCp0DRXIxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxX+sDiipqAgoTAA--.50331S3;
	Thu, 11 Jun 2026 18:12:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxTMIBiipqEM+iAA--.44515S2;
	Thu, 11 Jun 2026 18:12:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2] bpf: Fix unaligned interpreter panic on JIT fallback path
Date: Thu, 11 Jun 2026 18:12:16 +0800
Message-ID: <20260611101216.30153-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTMIBiipqEM+iAA--.44515S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxury3uFWUGF1kWFyfZr4kZrc_yoWrXr1rpF
	yDCw4akr4UXFWI939rJwsFvw15ta18uay5GayfKr1FkF4FqrnxW3W7Kw1FqFsxGr4j93Wf
	Zr42vF129a4rGFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzxR6UUUUU

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
---
 kernel/bpf/core.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 649cce41e13f..5785c8cb4dbe 100644
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
+		if (insn->code == (BPF_JMP | BPF_CALL) && insn->src_reg == 0) {
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

