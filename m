Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E883C17
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 09:24:02 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxbdqwpOxj8t8AAA--.2325S3;
	Wed, 15 Feb 2023 17:24:00 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxjb6upOxjWsczAA--.34752S4;
	Wed, 15 Feb 2023 17:24:00 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] LoongArch: Add ptrace single step support
Date: Wed, 15 Feb 2023 17:23:57 +0800
Message-Id: <20230215092358.30368-3-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230215092358.30368-1-zhangqing@loongson.cn>
References: <20230215092358.30368-1-zhangqing@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxjb6upOxjWsczAA--.34752S4
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKrykuFWUWrWfAFW5tr4kXrb_yoWxtF1xpF
	9xCr1kGr4rKr1xWFnxJa1UZr13Jw1kW3y2gFySyaySywnrtryrXr1vkryDZF4rA3yjga4I
	gr90gw4agF4UXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JFv_Jw1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Ul4E_UUUUU=

Use the generic ptrace_resume code for PTRACE_SYSCALL, PTRACE_CONT,
PTRACE_KILL and PTRACE_SINGLESTEP. This implies defining
arch_has_single_step in  and implementing the
user_enable_single_step and user_disable_single_step functions.

LongArch has no hardware single-step register. the hardware single-step
function multiplex fetch instruction watchpoint(FWPS) and specifies that
the next instruction must trigger the watch exception by setting the mask bit.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 arch/loongarch/include/asm/processor.h |  3 ++
 arch/loongarch/include/asm/ptrace.h    |  2 +
 arch/loongarch/kernel/hw_breakpoint.c  | 35 +++++++++++--
 arch/loongarch/kernel/ptrace.c         | 68 ++++++++++++++++++++++++++
 arch/loongarch/kernel/traps.c          | 20 ++++++--
 5 files changed, 120 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/include/asm/processor.h
index db060c5a976f..3ea0f1910c23 100644
--- a/arch/loongarch/include/asm/processor.h
+++ b/arch/loongarch/include/asm/processor.h
@@ -131,6 +131,9 @@ struct thread_struct {
 	struct perf_event	*hbp_break[LOONGARCH_MAX_BRP];
 	struct perf_event	*hbp_watch[LOONGARCH_MAX_WRP];
 
+	/* Used by ptrace single_step */
+	unsigned long single_step;
+
 	/*
 	 * FPU & vector registers, must be at last because
 	 * they are conditionally copied at fork().
diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
index 58596c4f8a0f..66a0e6c480a3 100644
--- a/arch/loongarch/include/asm/ptrace.h
+++ b/arch/loongarch/include/asm/ptrace.h
@@ -150,4 +150,6 @@ static inline void user_stack_pointer_set(struct pt_regs *regs,
 	regs->regs[3] = val;
 }
 
+#define arch_has_single_step()		(1)
+
 #endif /* _ASM_PTRACE_H */
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 6431cd319c32..94967b887d92 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -153,6 +153,22 @@ static int hw_breakpoint_slot_setup(struct perf_event **slots, int max_slots,
  */
 void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
 {
+	int i;
+	struct thread_struct *t = &tsk->thread;
+
+	for (i = 0; i < LOONGARCH_MAX_BRP; i++) {
+		if (t->hbp_break[i]) {
+			unregister_hw_breakpoint(t->hbp_break[i]);
+			t->hbp_break[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < LOONGARCH_MAX_WRP; i++) {
+		if (t->hbp_watch[i]) {
+			unregister_hw_breakpoint(t->hbp_watch[i]);
+			t->hbp_watch[i] = NULL;
+		}
+	}
 }
 
 void ptrace_hw_copy_thread(struct task_struct *tsk)
@@ -498,11 +514,20 @@ arch_initcall(arch_hw_breakpoint_init);
 void hw_breakpoint_thread_switch(struct task_struct *next)
 {
 	struct pt_regs *regs = task_pt_regs(next);
-
-	/* Update breakpoints */
-	update_bp_registers(regs, 1, 0);
-	/* Update watchpoints */
-	update_bp_registers(regs, 1, 1);
+	u64 addr, mask;
+
+	if (test_bit(TIF_SINGLESTEP, &task_thread_info(next)->flags)) {
+		addr = read_wb_reg(CSR_CFG_ADDR, 0, 0);
+		mask = read_wb_reg(CSR_CFG_MASK, 0, 0);
+		if ((task_pt_regs(next)->csr_era & ~mask) == (addr & ~mask))
+			csr_write32(0x10000, LOONGARCH_CSR_FWPS);
+		regs->csr_prmd |= CSR_PRMD_PWE;
+	} else {
+		/* Update breakpoints */
+		update_bp_registers(regs, 1, 0);
+		/* Update watchpoints */
+		update_bp_registers(regs, 1, 1);
+	}
 }
 
 void hw_breakpoint_pmu_read(struct perf_event *bp)
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index bee4194177fd..52a3ee4366f4 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -20,6 +20,7 @@
 #include <linux/context_tracking.h>
 #include <linux/elf.h>
 #include <linux/errno.h>
+#include <linux/hw_breakpoint.h>
 #include <linux/mm.h>
 #include <linux/ptrace.h>
 #include <linux/regset.h>
@@ -30,6 +31,7 @@
 #include <linux/stddef.h>
 #include <linux/seccomp.h>
 #include <linux/uaccess.h>
+#include <linux/thread_info.h>
 
 #include <asm/byteorder.h>
 #include <asm/cpu.h>
@@ -39,6 +41,7 @@
 #include <asm/page.h>
 #include <asm/pgtable.h>
 #include <asm/processor.h>
+#include <asm/ptrace.h>
 #include <asm/reg.h>
 #include <asm/syscall.h>
 
@@ -541,3 +544,68 @@ long arch_ptrace(struct task_struct *child, long request,
 
 	return ret;
 }
+
+void ptrace_triggered(struct perf_event *bp,
+		      struct perf_sample_data *data, struct pt_regs *regs)
+{
+	struct perf_event_attr attr;
+
+	attr = bp->attr;
+	attr.disabled = true;
+	modify_user_hw_breakpoint(bp, &attr);
+}
+
+static int set_single_step(struct task_struct *tsk, unsigned long addr)
+{
+	struct thread_struct *thread = &tsk->thread;
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+	struct arch_hw_breakpoint *info;
+
+	bp = thread->hbp_break[0];
+	if (!bp) {
+		ptrace_breakpoint_init(&attr);
+
+		attr.bp_addr = addr;
+		attr.bp_len = HW_BREAKPOINT_LEN_8;
+		attr.bp_type = HW_BREAKPOINT_X;
+
+		bp = register_user_hw_breakpoint(&attr, ptrace_triggered,
+						 NULL, tsk);
+		if (IS_ERR(bp))
+			return PTR_ERR(bp);
+
+		thread->hbp_break[0] = bp;
+	} else {
+		int err;
+
+		attr = bp->attr;
+		attr.bp_addr = addr;
+		/* reenable breakpoint */
+		attr.disabled = false;
+		err = modify_user_hw_breakpoint(bp, &attr);
+		if (unlikely(err))
+			return err;
+
+		csr_write64(attr.bp_addr, LOONGARCH_CSR_IB0ADDR);
+	}
+	info = counter_arch_bp(bp);
+	info->mask = 0xffffffffffff;
+
+	return 0;
+}
+
+/* ptrace API */
+void user_enable_single_step(struct task_struct *task)
+{
+	struct thread_info *ti = task_thread_info(task);
+
+	set_single_step(task, task_pt_regs(task)->csr_era);
+	task->thread.single_step = task_pt_regs(task)->csr_era;
+	set_ti_thread_flag(ti, TIF_SINGLESTEP);
+}
+
+void user_disable_single_step(struct task_struct *task)
+{
+	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
+}
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 2b133079e0f3..56d7d076153c 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -511,9 +511,23 @@ asmlinkage void noinstr do_watch(struct pt_regs *regs)
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	irqentry_state_t state = irqentry_enter(regs);
 
-	breakpoint_handler(regs);
-	watchpoint_handler(regs);
-	force_sig(SIGTRAP);
+	if (test_tsk_thread_flag(current, TIF_SINGLESTEP)) {
+		int llbit = (csr_read32(LOONGARCH_CSR_LLBCTL) & 0x1);
+		unsigned long pc = regs->csr_era;
+
+		if (llbit) {
+			csr_write32(0x10000, LOONGARCH_CSR_FWPS);
+			csr_write32(0x4, LOONGARCH_CSR_LLBCTL);
+		} else if (pc == current->thread.single_step) {
+			csr_write32(0x10000, LOONGARCH_CSR_FWPS);
+		} else {
+			force_sig(SIGTRAP);
+		}
+	} else {
+		breakpoint_handler(regs);
+		watchpoint_handler(regs);
+		force_sig(SIGTRAP);
+	}
 
 	irqentry_exit(regs, state);
 #endif
-- 
2.36.0

