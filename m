Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51ECC2570
	for <loongarch@lists.linux.dev>; Wed, 16 Nov 2022 08:23:45 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxnrcQnnRj+rMHAA--.17521S3;
	Wed, 16 Nov 2022 16:23:44 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_1cKnnRjxqMUAA--.54947S6;
	Wed, 16 Nov 2022 16:23:44 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH v8 RESEND 4/9] LoongArch/ftrace: Add dynamic function graph tracer support
Date: Wed, 16 Nov 2022 16:23:33 +0800
Message-Id: <20221116082338.5145-5-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221116082338.5145-1-zhangqing@loongson.cn>
References: <20221116082338.5145-1-zhangqing@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx_1cKnnRjxqMUAA--.54947S6
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGF4DAF1DKw4rGFWUtw4UXFb_yoWrKFyDpr
	y2y3ZxtrWjkFsakr9Igw4DXrW5J393G342vanrtryrCwsFqF13Aw1xA34qqFyaqw4UCryS
	vayrAr4jka1UXa7anT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	baAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
	w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
	jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I
	0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI
	43ZEXa7IU8I_M3UUUUU==

Once the function_graph tracer is enabled, a filtered function has the
following call sequence:

1) ftracer_caller     ==> on/off by ftrace_make_call/ftrace_make_nop
2) ftrace_graph_caller
3) ftrace_graph_call  ==> on/off by ftrace_en/disable_ftrace_graph_caller
4) prepare_ftrace_return

Considering the following DYNAMIC_FTRACE_WITH_REGS feature, it would be
more extendable to have a ftrace_graph_caller function, instead of
calling prepare_ftrace_return directly in ftrace_caller.

Co-developed-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 arch/loongarch/kernel/ftrace_dyn.c | 45 ++++++++++++++++++++++++++++++
 arch/loongarch/kernel/inst.c       | 24 ++++++++++++++++
 arch/loongarch/kernel/mcount_dyn.S | 33 ++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index 1f8955be8b64..3fe791b6783e 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -109,3 +109,48 @@ int __init ftrace_dyn_arch_init(void)
 {
 	return 0;
 }
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+extern void ftrace_graph_call(void);
+
+void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent)
+{
+	unsigned long return_hooker = (unsigned long)&return_to_handler;
+	unsigned long old;
+
+	if (unlikely(atomic_read(&current->tracing_graph_pause)))
+		return;
+
+	old = *parent;
+
+	if (!function_graph_enter(old, self_addr, 0, NULL))
+		*parent = return_hooker;
+}
+
+static int ftrace_modify_graph_caller(bool enable)
+{
+	unsigned long pc, func;
+	u32 branch, nop;
+
+	pc = (unsigned long)&ftrace_graph_call;
+	func = (unsigned long)&ftrace_graph_caller;
+
+	branch = larch_insn_gen_b(pc, func);
+	nop = larch_insn_gen_nop();
+
+	if (enable)
+		return ftrace_modify_code(pc, nop, branch, true);
+	else
+		return ftrace_modify_code(pc, branch, nop, true);
+}
+
+int ftrace_enable_ftrace_graph_caller(void)
+{
+	return ftrace_modify_graph_caller(true);
+}
+
+int ftrace_disable_ftrace_graph_caller(void)
+{
+	return ftrace_modify_graph_caller(false);
+}
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index d62cdf4a9ffb..2d2e942eb06a 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -55,6 +55,30 @@ u32 larch_insn_gen_nop(void)
 	return INSN_NOP;
 }
 
+u32 larch_insn_gen_b(unsigned long pc, unsigned long dest)
+{
+	unsigned int immediate_l, immediate_h;
+	union loongarch_instruction insn;
+	long offset = dest - pc;
+
+	if ((offset & 3) || offset < -SZ_128M || offset >= SZ_128M) {
+		pr_warn("The generated b instruction is out of range.\n");
+		return INSN_BREAK;
+	}
+
+	offset >>= 2;
+
+	immediate_l = offset & 0xffff;
+	offset >>= 16;
+	immediate_h = offset & 0x3ff;
+
+	insn.reg0i26_format.opcode = b_op;
+	insn.reg0i26_format.immediate_l = immediate_l;
+	insn.reg0i26_format.immediate_h = immediate_h;
+
+	return insn.word;
+}
+
 u32 larch_insn_gen_bl(unsigned long pc, unsigned long dest)
 {
 	unsigned int immediate_l, immediate_h;
diff --git a/arch/loongarch/kernel/mcount_dyn.S b/arch/loongarch/kernel/mcount_dyn.S
index 205925bc3822..0c12cc108e6f 100644
--- a/arch/loongarch/kernel/mcount_dyn.S
+++ b/arch/loongarch/kernel/mcount_dyn.S
@@ -62,6 +62,11 @@ SYM_CODE_START(ftrace_common)
 	.globl ftrace_call
 ftrace_call:
 	bl		ftrace_stub
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+	.globl ftrace_graph_call
+ftrace_graph_call:
+	nop				/* b ftrace_graph_caller */
+#endif
 /*
  * As we didn't use S series regs in this assmembly code and all calls
  * are C function which will save S series regs by themselves, there is
@@ -84,6 +89,34 @@ ftrace_common_return:
 	jr	t0
 SYM_CODE_END(ftrace_common)
 
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+SYM_CODE_START(ftrace_graph_caller)
+	PTR_L		a0, sp, PT_ERA
+	PTR_ADDI	a0, a0, -8	/* arg0: self_addr */
+	PTR_ADDI	a1, sp, PT_R1	/* arg1: parent */
+	bl		prepare_ftrace_return
+	b		ftrace_common_return
+SYM_CODE_END(ftrace_graph_caller)
+
+SYM_CODE_START(return_to_handler)
+	/* save return value regs */
+	PTR_ADDI 	sp, sp, -2 * SZREG
+	PTR_S		a0, sp, 0
+	PTR_S		a1, sp, SZREG
+
+	move		a0, zero	/* Has no check FP now. */
+	bl		ftrace_return_to_handler
+	move		ra, a0		/* parent ra */
+
+	/* restore return value regs */
+	PTR_L		a0, sp, 0
+	PTR_L		a1, sp, SZREG
+	PTR_ADDI 	sp, sp, 2 * SZREG
+
+	jr	ra
+SYM_CODE_END(return_to_handler)
+#endif
+
 SYM_FUNC_START(ftrace_stub)
 	jr	ra
 SYM_FUNC_END(ftrace_stub)
-- 
2.36.0

