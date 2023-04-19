Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCA02F35
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 09:57:25 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxONn_uj9k7uEeAA--.48200S3;
	Wed, 19 Apr 2023 17:57:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxbb78uj9kXuguAA--.15680S6;
	Wed, 19 Apr 2023 17:57:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 4/6] LoongArch: Add uprobes support
Date: Wed, 19 Apr 2023 17:56:59 +0800
Message-Id: <1681898221-27828-5-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1681898221-27828-1-git-send-email-yangtiezhu@loongson.cn>
References: <1681898221-27828-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Bxbb78uj9kXuguAA--.15680S6
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3GryDXF45tF13ZFyxCF1rZwb_yoW3KFyxpa
	yDCFy5KF4UG3Z3Jry7J398Zr1FyrWkWw47ZFy2ka4Sya12qryrXr1xtrWqvF15A39YgFW0
	qa4rtFWY9FW3JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Uprobes is the user-space counterpart to kprobes, this commit
adds uprobes support for LoongArch.

Here is a simple example with CONFIG_UPROBE_EVENTS=y:

  # cat test.c
  #include <stdio.h>

  int add(int a, int b)
  {
  	  return a + b;
  }

  int main()
  {
	  return add(2, 7);
  }
  # gcc test.c -o /tmp/test
  # nm /tmp/test | grep add
  0000000120004194 T add
  # cd /sys/kernel/debug/tracing
  # echo > uprobe_events
  # echo "p:myuprobe /tmp/test:0x4194 %r4 %r5" > uprobe_events
  # echo "r:myuretprobe /tmp/test:0x4194 %r4" >> uprobe_events
  # echo 1 > events/uprobes/enable
  # echo 1 > tracing_on
  # /tmp/test
  # cat trace
  ...
  #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
  #              | |         |   |||||     |         |
              test-1060    [001] DNZff  1015.770620: myuprobe: (0x120004194) arg1=0x2 arg2=0x7
              test-1060    [001] DNZff  1015.770930: myuretprobe: (0x1200041f0 <- 0x120004194) arg1=0x9

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Kconfig               |   3 +
 arch/loongarch/include/asm/uprobes.h |  36 +++++++++
 arch/loongarch/kernel/Makefile       |   1 +
 arch/loongarch/kernel/traps.c        |   9 +--
 arch/loongarch/kernel/uprobes.c      | 142 +++++++++++++++++++++++++++++++++++
 5 files changed, 186 insertions(+), 5 deletions(-)
 create mode 100644 arch/loongarch/include/asm/uprobes.h
 create mode 100644 arch/loongarch/kernel/uprobes.c

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 7fd5125..ab66ad2 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -574,6 +574,9 @@ config ARCH_MMAP_RND_BITS_MIN
 config ARCH_MMAP_RND_BITS_MAX
 	default 18
 
+config ARCH_SUPPORTS_UPROBES
+	def_bool y
+
 menu "Power management options"
 
 config ARCH_SUSPEND_POSSIBLE
diff --git a/arch/loongarch/include/asm/uprobes.h b/arch/loongarch/include/asm/uprobes.h
new file mode 100644
index 0000000..59e2683
--- /dev/null
+++ b/arch/loongarch/include/asm/uprobes.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_LOONGARCH_UPROBES_H
+#define __ASM_LOONGARCH_UPROBES_H
+
+#include <asm/inst.h>
+
+typedef u32 uprobe_opcode_t;
+
+#define MAX_UINSN_BYTES		8
+#define UPROBE_XOL_SLOT_BYTES	MAX_UINSN_BYTES
+
+#define UPROBE_XOLBP_INSN	larch_insn_gen_break(BRK_UPROBE_XOLBP)
+#define UPROBE_SWBP_INSN	larch_insn_gen_break(BRK_UPROBE_BP)
+#define UPROBE_SWBP_INSN_SIZE	LOONGARCH_INSN_SIZE
+
+struct arch_uprobe {
+	union {
+		u32 insn[2];
+		u32 ixol[2];
+	};
+	bool simulate;
+};
+
+struct arch_uprobe_task {
+	unsigned long saved_trap_nr;
+};
+
+#ifdef CONFIG_UPROBES
+bool uprobe_breakpoint_handler(struct pt_regs *regs);
+bool uprobe_singlestep_handler(struct pt_regs *regs);
+#else /* !CONFIG_UPROBES */
+static inline bool uprobe_breakpoint_handler(struct pt_regs *regs) { return false; }
+static inline bool uprobe_singlestep_handler(struct pt_regs *regs) { return false; }
+#endif /* CONFIG_UPROBES */
+
+#endif /* __ASM_LOONGARCH_UPROBES_H */
diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
index 78d4e33..67b9c26 100644
--- a/arch/loongarch/kernel/Makefile
+++ b/arch/loongarch/kernel/Makefile
@@ -53,5 +53,6 @@ obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o perf_regs.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 
 obj-$(CONFIG_KPROBES)		+= kprobes.o kprobes_trampoline.o
+obj-$(CONFIG_UPROBES)		+= uprobes.o
 
 CPPFLAGS_vmlinux.lds		:= $(KBUILD_CFLAGS)
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index de8ebe2..cfc2e0c 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -45,6 +45,7 @@
 #include <asm/tlb.h>
 #include <asm/types.h>
 #include <asm/unwind.h>
+#include <asm/uprobes.h>
 
 #include "access-helper.h"
 
@@ -440,7 +441,6 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
 	if (regs->csr_prmd & CSR_PRMD_PIE)
 		local_irq_enable();
 
-	current->thread.trap_nr = read_csr_excode();
 	if (__get_inst(&opcode, (u32 *)era, user))
 		goto out_sigsegv;
 
@@ -462,18 +462,17 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
 		else
 			break;
 	case BRK_UPROBE_BP:
-		if (notify_die(DIE_UPROBE, "Uprobe", regs, bcode,
-			       current->thread.trap_nr, SIGTRAP) == NOTIFY_STOP)
+		if (uprobe_breakpoint_handler(regs))
 			goto out;
 		else
 			break;
 	case BRK_UPROBE_XOLBP:
-		if (notify_die(DIE_UPROBE_XOL, "Uprobe_XOL", regs, bcode,
-			       current->thread.trap_nr, SIGTRAP) == NOTIFY_STOP)
+		if (uprobe_singlestep_handler(regs))
 			goto out;
 		else
 			break;
 	default:
+		current->thread.trap_nr = read_csr_excode();
 		if (notify_die(DIE_TRAP, "Break", regs, bcode,
 			       current->thread.trap_nr, SIGTRAP) == NOTIFY_STOP)
 			goto out;
diff --git a/arch/loongarch/kernel/uprobes.c b/arch/loongarch/kernel/uprobes.c
new file mode 100644
index 0000000..628c39d
--- /dev/null
+++ b/arch/loongarch/kernel/uprobes.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/highmem.h>
+#include <linux/ptrace.h>
+#include <linux/uprobes.h>
+#include <linux/sched.h>
+#include <asm/cacheflush.h>
+
+#define UPROBE_TRAP_NR	UINT_MAX
+
+int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
+			     struct mm_struct *mm, unsigned long addr)
+{
+	union loongarch_instruction insn;
+
+	if (addr & 0x3)
+		return -EILSEQ;
+
+	insn.word = auprobe->insn[0];
+
+	if (insns_not_supported(insn))
+		return -EINVAL;
+
+	if (insns_need_simulation(insn)) {
+		auprobe->ixol[0] = larch_insn_gen_nop();
+		auprobe->simulate = true;
+	} else {
+		auprobe->ixol[0] = auprobe->insn[0];
+		auprobe->simulate = false;
+	}
+
+	auprobe->ixol[1] = UPROBE_XOLBP_INSN;
+
+	return 0;
+}
+
+int arch_uprobe_pre_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
+{
+	struct uprobe_task *utask = current->utask;
+
+	utask->autask.saved_trap_nr = current->thread.trap_nr;
+	current->thread.trap_nr = UPROBE_TRAP_NR;
+	instruction_pointer_set(regs, utask->xol_vaddr);
+
+	return 0;
+}
+
+int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
+{
+	struct uprobe_task *utask = current->utask;
+
+	WARN_ON_ONCE(current->thread.trap_nr != UPROBE_TRAP_NR);
+	current->thread.trap_nr = utask->autask.saved_trap_nr;
+	instruction_pointer_set(regs, utask->vaddr + LOONGARCH_INSN_SIZE);
+
+	return 0;
+}
+
+void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
+{
+	struct uprobe_task *utask = current->utask;
+
+	current->thread.trap_nr = utask->autask.saved_trap_nr;
+	instruction_pointer_set(regs, utask->vaddr);
+}
+
+bool arch_uprobe_xol_was_trapped(struct task_struct *t)
+{
+	if (t->thread.trap_nr != UPROBE_TRAP_NR)
+		return true;
+
+	return false;
+}
+
+bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
+{
+	union loongarch_instruction insn;
+
+	if (!auprobe->simulate)
+		return false;
+
+	insn.word = auprobe->insn[0];
+	arch_simulate_insn(insn, regs);
+
+	return true;
+}
+
+unsigned long arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
+						struct pt_regs *regs)
+{
+	unsigned long ra = regs->regs[1];
+
+	regs->regs[1] = trampoline_vaddr;
+
+	return ra;
+}
+
+bool arch_uretprobe_is_alive(struct return_instance *ret,
+			     enum rp_check ctx, struct pt_regs *regs)
+{
+	if (ctx == RP_CHECK_CHAIN_CALL)
+		return regs->regs[3] <= ret->stack;
+	else
+		return regs->regs[3] < ret->stack;
+}
+
+int arch_uprobe_exception_notify(struct notifier_block *self,
+				 unsigned long val, void *data)
+{
+	return NOTIFY_DONE;
+}
+
+bool uprobe_breakpoint_handler(struct pt_regs *regs)
+{
+	if (uprobe_pre_sstep_notifier(regs))
+		return true;
+
+	return false;
+}
+
+bool uprobe_singlestep_handler(struct pt_regs *regs)
+{
+	if (uprobe_post_sstep_notifier(regs))
+		return true;
+
+	return false;
+}
+
+unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
+{
+	return instruction_pointer(regs);
+}
+
+void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
+			   void *src, unsigned long len)
+{
+	void *kaddr = kmap_local_page(page);
+	void *dst = kaddr + (vaddr & ~PAGE_MASK);
+
+	memcpy(dst, src, len);
+	flush_icache_range((unsigned long)dst, (unsigned long)dst + len);
+	kunmap_local(kaddr);
+}
-- 
2.1.0

