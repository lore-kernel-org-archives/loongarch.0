Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4AC10796
	for <loongarch@lists.linux.dev>; Fri, 30 Jun 2023 12:46:57 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8DxOsa_zp5kWUsEAA--.7132S3;
	Fri, 30 Jun 2023 20:46:55 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ82+zp5kJ48TAA--.64402S2;
	Fri, 30 Jun 2023 20:46:55 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	zhangqing.qz@outlook.com,
	zhangqing199801@gmail.com,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Qing Zhang <zhangqing@loongson.cn>
Subject: [PATCH v2] LoongArch: KGDB: Add Basic KGDB support
Date: Fri, 30 Jun 2023 20:46:47 +0800
Message-Id: <20230630124647.1178939-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxJ82+zp5kJ48TAA--.64402S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfuw1xGF1DWw1fWr48Wr4fCrX_yoW8uF4kCo
	WUAF4qy348GFn2kFZ3Crs8WF4DX3W8K34kAFyrZFsxu3Z8Arn0grWak3W2vr13Cr1ktr4x
	uw15X3sYvas2yrn5l-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYb7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

Add Kgdb debug support for LoongArch kernel debugging, more support
and testing is working in progress.

Kgdb is intended to be used as a source level debugger for the kernel,
It is used along with gdb to debug a kernel. The expectation is that
gdb can be used to "break in" to the kernel to inspect memory, variables
and look through call stack information similar to the way an application
developer would use gdb to debug an application.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
V2:
- Sort Kconfig options alphabetically;
- Add the parsing of the orig_a0 and badv registers to match the latest
  gdb;
- Change if-else to switch-case in dbg_set_reg()/dbg_get_reg();
- Macros are used to represent the number of registers and its offset,
  etc;
- printk->pr_err;
- Comment formatting.

---
 arch/loongarch/Kconfig                  |   1 +
 arch/loongarch/include/asm/kgdb.h       |  39 ++
 arch/loongarch/include/asm/stackframe.h |   4 +
 arch/loongarch/kernel/Makefile          |   2 +
 arch/loongarch/kernel/entry.S           |   5 +
 arch/loongarch/kernel/kgdb.c            | 605 ++++++++++++++++++++++++
 arch/loongarch/kernel/traps.c           |   6 +
 7 files changed, 662 insertions(+)
 create mode 100644 arch/loongarch/include/asm/kgdb.h
 create mode 100644 arch/loongarch/kernel/kgdb.c

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index f70cc4ee3b0a..7b2829df91cd 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -92,6 +92,7 @@ config LOONGARCH
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN
+	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
diff --git a/arch/loongarch/include/asm/kgdb.h b/arch/loongarch/include/asm/kgdb.h
new file mode 100644
index 000000000000..ce5c9e107a6b
--- /dev/null
+++ b/arch/loongarch/include/asm/kgdb.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+#ifndef _ASM_LOONGARCH_KGDB_H
+#define _ASM_LOONGARCH_KGDB_H
+
+#define KGDB_GDB_REG_SIZE	64
+#define GDB_SIZEOF_REG		sizeof(u64)
+
+#define DBG_MAX_REG_NUM		80
+
+#define DBG_PT_REGS_BASE	0
+#define DBG_PT_REGS_NUM		35
+#define DBG_PT_REGS_END		(DBG_PT_REGS_BASE + DBG_PT_REGS_NUM - 1)
+
+#define DBG_FPR_BASE		(DBG_PT_REGS_END + 1)
+#define DBG_FPR_NUM		32
+#define DBG_FPR_END		(DBG_FPR_BASE + DBG_FPR_NUM - 1)
+#define DBG_FCC_BASE		(DBG_FPR_END + 1)
+#define DBG_FCC_NUM		8
+#define DBG_FCC_END		(DBG_FCC_BASE + DBG_FCC_NUM - 1)
+#define DBG_FCSR		(DBG_FCC_END + 1)
+#define DBG_SCR_BASE		(DBG_FCSR + 1)
+#define DBG_SCR_NUM		4
+#define DBG_SCR_END		(DBG_SCR_BASE + DBG_SCR_NUM - 1)
+
+#define BUFMAX			2048
+#define NUMREGBYTES		(DBG_PT_REGS_NUM * sizeof(GDB_SIZEOF_REG))
+#define BREAK_INSTR_SIZE	4
+#define CACHE_FLUSH_IS_SAFE	0
+
+extern void arch_kgdb_breakpoint(void);
+extern void breakinst(void);
+extern int kgdb_ll_trap(int cmd, const char *str,
+			struct pt_regs *regs, long err, int trap, int sig);
+
+#endif /* __ASM_KGDB_H_ */
diff --git a/arch/loongarch/include/asm/stackframe.h b/arch/loongarch/include/asm/stackframe.h
index 7df80e6ae9d2..4fb1e6408b98 100644
--- a/arch/loongarch/include/asm/stackframe.h
+++ b/arch/loongarch/include/asm/stackframe.h
@@ -158,6 +158,10 @@
 	cfi_st  u0, PT_R21, \docfi
 	csrrd	u0, PERCPU_BASE_KS
 9:
+#ifdef CONFIG_KGDB
+	li.w	t0, CSR_CRMD_WE
+	csrxchg	t0, t0, LOONGARCH_CSR_CRMD
+#endif
 	.endm
 
 	.macro	SAVE_ALL docfi=0
diff --git a/arch/loongarch/kernel/Makefile b/arch/loongarch/kernel/Makefile
index 9048ab4e5d40..d1144d6cd090 100644
--- a/arch/loongarch/kernel/Makefile
+++ b/arch/loongarch/kernel/Makefile
@@ -66,4 +66,6 @@ obj-$(CONFIG_UPROBES)		+= uprobes.o
 
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
+obj-$(CONFIG_KGDB)		+= kgdb.o
+
 CPPFLAGS_vmlinux.lds		:= $(KBUILD_CFLAGS)
diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
index d737e3cf42d3..00654322348e 100644
--- a/arch/loongarch/kernel/entry.S
+++ b/arch/loongarch/kernel/entry.S
@@ -58,6 +58,11 @@ SYM_FUNC_START(handle_syscall)
 
 	SAVE_STATIC
 
+#ifdef CONFIG_KGDB
+	li.w	t1, CSR_CRMD_WE
+	csrxchg	t1, t1, LOONGARCH_CSR_CRMD
+#endif
+
 	move		u0, t0
 	li.d		tp, ~_THREAD_MASK
 	and		tp, tp, sp
diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
new file mode 100644
index 000000000000..3b819df4844c
--- /dev/null
+++ b/arch/loongarch/kernel/kgdb.c
@@ -0,0 +1,605 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LoongArch KGDB support
+ *
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+#include <linux/kdebug.h>
+#include <linux/kgdb.h>
+#include <linux/hw_breakpoint.h>
+#include <linux/ptrace.h>
+#include <linux/sched.h>
+#include <linux/smp.h>
+#include <asm/inst.h>
+#include <asm/fpu.h>
+#include <asm/cacheflush.h>
+#include <asm/processor.h>
+#include <asm/sigcontext.h>
+#include <asm/irq_regs.h>
+#include <asm/ptrace.h>
+#include <asm/hw_breakpoint.h>
+
+int kgdb_watch_activated;
+
+static struct hard_trap_info {
+	unsigned char tt;	/* Trap type code for LoongArch */
+	unsigned char signo;	/* Signal that we map this trap into */
+} hard_trap_info[] = {
+	{ 1, SIGBUS },
+	{ 2, SIGBUS },
+	{ 3, SIGBUS },
+	{ 4, SIGBUS },
+	{ 5, SIGBUS },
+	{ 6, SIGBUS },
+	{ 7, SIGBUS },
+	{ 8, SIGBUS },
+	{ 9, SIGBUS },
+	{ 10, SIGBUS },
+	{ 12, SIGTRAP },	/* break */
+	{ 13, SIGBUS },
+	{ 14, SIGBUS },
+	{ 15, SIGFPE },
+	{ 16, SIGFPE },
+	{ 17, SIGFPE },
+	{ 18, SIGFPE },
+	{ 0, 0}			/* Must be last */
+};
+
+struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
+	{ "r0", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[0]) },
+	{ "r1", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[1]) },
+	{ "r2", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[2]) },
+	{ "r3", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[3]) },
+	{ "r4", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[4]) },
+	{ "r5", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[5]) },
+	{ "r6", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[6]) },
+	{ "r7", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[7]) },
+	{ "r8", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[8]) },
+	{ "r9", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[9]) },
+	{ "r10", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[10]) },
+	{ "r11", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[11]) },
+	{ "r12", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[12]) },
+	{ "r13", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[13]) },
+	{ "r14", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[14]) },
+	{ "r15", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[15]) },
+	{ "r16", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[16]) },
+	{ "r17", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[17]) },
+	{ "r18", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[18]) },
+	{ "r19", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[19]) },
+	{ "r20", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[20]) },
+	{ "r21", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[21]) },
+	{ "r22", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[22]) },
+	{ "r23", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[23]) },
+	{ "r24", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[24]) },
+	{ "r25", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[25]) },
+	{ "r26", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[26]) },
+	{ "r27", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[27]) },
+	{ "r28", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[28]) },
+	{ "r29", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[29]) },
+	{ "r30", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[30]) },
+	{ "r31", GDB_SIZEOF_REG, offsetof(struct pt_regs, regs[31]) },
+	{ "orig_a0", GDB_SIZEOF_REG, offsetof(struct pt_regs, orig_a0) },
+	{ "pc", GDB_SIZEOF_REG, offsetof(struct pt_regs, csr_era) },
+	{ "badv", GDB_SIZEOF_REG, offsetof(struct pt_regs, csr_badvaddr) },
+	{ "f0", GDB_SIZEOF_REG, 0 },
+	{ "f1", GDB_SIZEOF_REG, 1 },
+	{ "f2", GDB_SIZEOF_REG, 2 },
+	{ "f3", GDB_SIZEOF_REG, 3 },
+	{ "f4", GDB_SIZEOF_REG, 4 },
+	{ "f5", GDB_SIZEOF_REG, 5 },
+	{ "f6", GDB_SIZEOF_REG, 6 },
+	{ "f7", GDB_SIZEOF_REG, 7 },
+	{ "f8", GDB_SIZEOF_REG, 8 },
+	{ "f9", GDB_SIZEOF_REG, 9 },
+	{ "f10", GDB_SIZEOF_REG, 10 },
+	{ "f11", GDB_SIZEOF_REG, 11 },
+	{ "f12", GDB_SIZEOF_REG, 12 },
+	{ "f13", GDB_SIZEOF_REG, 13 },
+	{ "f14", GDB_SIZEOF_REG, 14 },
+	{ "f15", GDB_SIZEOF_REG, 15 },
+	{ "f16", GDB_SIZEOF_REG, 16 },
+	{ "f17", GDB_SIZEOF_REG, 17 },
+	{ "f18", GDB_SIZEOF_REG, 18 },
+	{ "f19", GDB_SIZEOF_REG, 19 },
+	{ "f20", GDB_SIZEOF_REG, 20 },
+	{ "f21", GDB_SIZEOF_REG, 21 },
+	{ "f22", GDB_SIZEOF_REG, 22 },
+	{ "f23", GDB_SIZEOF_REG, 23 },
+	{ "f24", GDB_SIZEOF_REG, 24 },
+	{ "f25", GDB_SIZEOF_REG, 25 },
+	{ "f26", GDB_SIZEOF_REG, 26 },
+	{ "f27", GDB_SIZEOF_REG, 27 },
+	{ "f28", GDB_SIZEOF_REG, 28 },
+	{ "f29", GDB_SIZEOF_REG, 29 },
+	{ "f30", GDB_SIZEOF_REG, 30 },
+	{ "f31", GDB_SIZEOF_REG, 31 },
+	{ "fcc0", 1, 0 },
+	{ "fcc1", 1, 1 },
+	{ "fcc2", 1, 2 },
+	{ "fcc3", 1, 3 },
+	{ "fcc4", 1, 4 },
+	{ "fcc5", 1, 5 },
+	{ "fcc6", 1, 6 },
+	{ "fcc7", 1, 7 },
+	{ "fcsr", GDB_SIZEOF_REG, 0 },
+	{ "scr0", GDB_SIZEOF_REG, offsetof(struct thread_struct, scr0) },
+	{ "scr1", GDB_SIZEOF_REG, offsetof(struct thread_struct, scr1) },
+	{ "scr2", GDB_SIZEOF_REG, offsetof(struct thread_struct, scr2) },
+	{ "scr3", GDB_SIZEOF_REG, offsetof(struct thread_struct, scr2) },
+};
+
+int dbg_set_reg(int regno, void *mem, struct pt_regs *regs)
+{
+	int reg_offset, reg_size;
+
+	if (regno < 0 || regno >= DBG_MAX_REG_NUM)
+		return -EINVAL;
+
+	reg_offset = dbg_reg_def[regno].offset;
+	reg_size = dbg_reg_def[regno].size;
+
+	if (reg_offset == -1)
+		return 0;
+
+	/* Handle general-purpose/orig_a0/pc/badv registers */
+	if (regno <= DBG_PT_REGS_END) {
+		memcpy((void *)regs + reg_offset, mem, reg_size);
+		return 0;
+	}
+
+	if (!current || !(regs->csr_euen & CSR_EUEN_FPEN))
+		return 0;
+
+	/* Handle FP registers */
+	switch (regno) {
+	case DBG_FCSR:	/* Process the fcsr/fsr */
+		memcpy((void *)&current->thread.fpu.fcsr, mem, reg_size);
+		break;
+	case DBG_FCC_BASE ... DBG_FCC_END:	/* Process the fcc */
+		memcpy((char *)&current->thread.fpu.fcc + reg_offset, mem, reg_size);
+		break;
+	case DBG_SCR_BASE ... DBG_SCR_END:	/* Process the scr */
+		memcpy((void *)&current->thread + reg_offset, mem, reg_size);
+		break;
+	default:
+		memcpy((void *)&current->thread.fpu.fpr[reg_offset], mem, reg_size);
+	}
+
+	restore_fp(current);
+	return 0;
+}
+
+char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
+{
+	int reg_offset, reg_size;
+
+	if (regno < 0 || regno >= DBG_MAX_REG_NUM)
+		return NULL;
+
+	reg_offset = dbg_reg_def[regno].offset;
+	reg_size = dbg_reg_def[regno].size;
+
+	if (reg_offset == -1)
+		goto out;
+
+	/* Handle general-purpose/orig_a0/pc/badv registers */
+	if (regno <= DBG_PT_REGS_END) {
+		memcpy(mem, (void *)regs + reg_offset, reg_size);
+		goto out;
+	}
+
+	if (!current || !(regs->csr_euen & CSR_EUEN_FPEN))
+		goto out;
+
+	save_fp(current);
+
+	/* Handle FP registers */
+	switch (regno) {
+	case DBG_FCSR:	/* Process the fcsr/fsr */
+		memcpy(mem, (void *)&current->thread.fpu.fcsr, reg_size);
+		break;
+	case DBG_FCC_BASE ... DBG_FCC_END:	/* Process the fcc */
+		memcpy(mem, (char *)&current->thread.fpu.fcc + reg_offset, reg_size);
+		break;
+	case DBG_SCR_BASE ... DBG_SCR_END:	/* Process the scr */
+		memcpy(mem, (void *)&current->thread + reg_offset, reg_size);
+		break;
+	default:
+		memcpy(mem, (void *)&current->thread.fpu.fpr[reg_offset], reg_size);
+	}
+out:
+	return dbg_reg_def[regno].name;
+}
+
+void sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *p)
+{
+	int reg;
+	u64 *ptr = (u64 *)gdb_regs, *gdbregs = ptr;
+
+	*(ptr++) = 0;
+	*(ptr++) = p->thread.reg01;
+	*(ptr++) = (long)p;
+	*(ptr++) = p->thread.reg03;
+	for (reg = 4; reg < 23; reg++)
+		*(ptr++) = 0;
+
+	/* S0 - S8 */
+	*(ptr++) = p->thread.reg23;
+	*(ptr++) = p->thread.reg24;
+	*(ptr++) = p->thread.reg25;
+	*(ptr++) = p->thread.reg26;
+	*(ptr++) = p->thread.reg27;
+	*(ptr++) = p->thread.reg28;
+	*(ptr++) = p->thread.reg29;
+	*(ptr++) = p->thread.reg30;
+	*(ptr++) = p->thread.reg31;
+
+	/* orig_a0 */
+	ptr++;
+
+	/*
+	 * PC
+	 * use return address (RA), i.e. the moment after return from resume()
+	 */
+	*(ptr++) = p->thread.reg01;
+
+	/* BadVAddr */
+	*(ptr++) = 0;
+
+	ptr = gdbregs + DBG_SCR_BASE;
+	*(ptr++) = p->thread.scr0;
+	*(ptr++) = p->thread.scr1;
+	*(ptr++) = p->thread.scr2;
+	*(ptr++) = p->thread.scr3;
+}
+
+void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
+{
+	regs->csr_era = pc;
+}
+
+static inline void kgdb_arch_update_addr(struct pt_regs *regs,
+					 char *remcom_in_buffer)
+{
+	unsigned long addr;
+	char *ptr;
+
+	ptr = &remcom_in_buffer[1];
+	if (kgdb_hex2long(&ptr, &addr))
+		regs->csr_era = addr;
+}
+
+static struct hw_breakpoint {
+	unsigned int		enabled;
+	unsigned long		addr;
+	int			len;
+	int			type;
+	struct perf_event	* __percpu *pev;
+} breakinfo[LOONGARCH_MAX_BRP];
+
+static int hw_break_reserve_slot(int breakno)
+{
+	int cpu;
+	int cnt = 0;
+	struct perf_event **pevent;
+
+	for_each_online_cpu(cpu) {
+		cnt++;
+		pevent = per_cpu_ptr(breakinfo[breakno].pev, cpu);
+		if (dbg_reserve_bp_slot(*pevent))
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	for_each_online_cpu(cpu) {
+		cnt--;
+		if (!cnt)
+			break;
+		pevent = per_cpu_ptr(breakinfo[breakno].pev, cpu);
+		dbg_release_bp_slot(*pevent);
+	}
+	return -1;
+}
+
+static int hw_break_release_slot(int breakno)
+{
+	struct perf_event **pevent;
+	int cpu;
+
+	if (dbg_is_early)
+		return 0;
+
+	for_each_online_cpu(cpu) {
+		pevent = per_cpu_ptr(breakinfo[breakno].pev, cpu);
+		if (dbg_release_bp_slot(*pevent))
+			/*
+			 * The debugger is responsible for handing the retry on
+			 * remove failure.
+			 */
+			return -1;
+	}
+	return 0;
+}
+
+static int kgdb_set_hw_break(unsigned long addr, int len, enum kgdb_bptype bptype)
+{
+	int i;
+
+	for (i = 0; i < LOONGARCH_MAX_BRP; i++)
+		if (!breakinfo[i].enabled)
+			break;
+
+	if (i == LOONGARCH_MAX_BRP)
+		return -1;
+
+	switch (bptype) {
+	case BP_HARDWARE_BREAKPOINT:
+		len = 1;
+		breakinfo[i].type = LOONGARCH_BREAKPOINT_EXECUTE;
+		break;
+	case BP_WRITE_WATCHPOINT:
+		breakinfo[i].type = LOONGARCH_BREAKPOINT_STORE;
+		break;
+	case BP_ACCESS_WATCHPOINT:
+		breakinfo[i].type = LOONGARCH_BREAKPOINT_LOAD && LOONGARCH_BREAKPOINT_STORE;
+		break;
+	default:
+		return -1;
+	}
+
+	switch (len) {
+	case 1:
+		breakinfo[i].len = LOONGARCH_BREAKPOINT_LEN_1;
+		break;
+	case 2:
+		breakinfo[i].len = LOONGARCH_BREAKPOINT_LEN_2;
+		break;
+	case 4:
+		breakinfo[i].len = LOONGARCH_BREAKPOINT_LEN_4;
+		break;
+	case 8:
+		breakinfo[i].len = LOONGARCH_BREAKPOINT_LEN_8;
+		break;
+	default:
+		return -1;
+	}
+
+	breakinfo[i].addr = addr;
+	if (hw_break_reserve_slot(i)) {
+		breakinfo[i].addr = 0;
+		return -1;
+	}
+	breakinfo[i].enabled = 1;
+
+	return 0;
+}
+
+static int kgdb_remove_hw_break(unsigned long addr, int len, enum kgdb_bptype bptype)
+{
+	int i;
+
+	for (i = 0; i < LOONGARCH_MAX_BRP; i++)
+		if (breakinfo[i].addr == addr && breakinfo[i].enabled)
+			break;
+
+	if (i == LOONGARCH_MAX_BRP)
+		return -1;
+
+	if (hw_break_release_slot(i)) {
+		pr_err("Cannot remove hw breakpoint at %lx\n", addr);
+		return -1;
+	}
+	breakinfo[i].enabled = 0;
+
+	return 0;
+}
+
+static void kgdb_disable_hw_debug(struct pt_regs *regs)
+{
+	int i;
+	int cpu = raw_smp_processor_id();
+	struct perf_event *bp;
+
+	/* Disable hardware debugging while we are in kgdb: */
+	csr_xchg32(0, CSR_CRMD_WE, LOONGARCH_CSR_CRMD);
+	regs->csr_prmd &= ~CSR_PRMD_PWE;
+
+	for (i = 0; i < LOONGARCH_MAX_BRP; i++) {
+		if (!breakinfo[i].enabled)
+			continue;
+
+		bp = *per_cpu_ptr(breakinfo[i].pev, cpu);
+		if (bp->attr.disabled == 1)
+			continue;
+
+		arch_uninstall_hw_breakpoint(bp);
+		bp->attr.disabled = 1;
+	}
+}
+
+static void kgdb_remove_all_hw_break(void)
+{
+	int i;
+	int cpu = raw_smp_processor_id();
+	struct perf_event *bp;
+
+	for (i = 0; i < LOONGARCH_MAX_BRP; i++) {
+		if (!breakinfo[i].enabled)
+			continue;
+
+		bp = *per_cpu_ptr(breakinfo[i].pev, cpu);
+		if (!bp->attr.disabled) {
+			arch_uninstall_hw_breakpoint(bp);
+			bp->attr.disabled = 1;
+			continue;
+		}
+
+		if (hw_break_release_slot(i))
+			pr_err("KGDB: hw bpt remove failed %lx\n", breakinfo[i].addr);
+		breakinfo[i].enabled = 0;
+	}
+
+	csr_xchg32(0, CSR_CRMD_WE, LOONGARCH_CSR_CRMD);
+	kgdb_watch_activated = 0;
+}
+
+static void kgdb_correct_hw_break(void)
+{
+	int breakno, activated = 0;
+
+	for (breakno = 0; breakno < LOONGARCH_MAX_BRP; breakno++) {
+		struct perf_event *bp;
+		struct arch_hw_breakpoint *info;
+		int val;
+		int cpu = raw_smp_processor_id();
+
+		if (!breakinfo[breakno].enabled)
+			continue;
+
+		bp = *per_cpu_ptr(breakinfo[breakno].pev, cpu);
+		info = counter_arch_bp(bp);
+		if (bp->attr.disabled != 1)
+			continue;
+
+		bp->attr.bp_addr = breakinfo[breakno].addr;
+		bp->attr.bp_len = breakinfo[breakno].len;
+		bp->attr.bp_type = breakinfo[breakno].type;
+		info->address = breakinfo[breakno].addr;
+		info->ctrl.len = breakinfo[breakno].len;
+		info->ctrl.type = breakinfo[breakno].type;
+		val = arch_install_hw_breakpoint(bp);
+		if (!val)
+			bp->attr.disabled = 0;
+		activated = 1;
+	}
+
+	csr_xchg32(activated ? CSR_CRMD_WE : 0, CSR_CRMD_WE, LOONGARCH_CSR_CRMD);
+	kgdb_watch_activated = activated;
+}
+
+const struct kgdb_arch arch_kgdb_ops = {
+	.gdb_bpt_instr		= {0x00, 0x00, break_op, 0x00},
+	.flags			= KGDB_HW_BREAKPOINT,
+	.set_hw_breakpoint	= kgdb_set_hw_break,
+	.remove_hw_breakpoint	= kgdb_remove_hw_break,
+	.disable_hw_break	= kgdb_disable_hw_debug,
+	.remove_all_hw_break	= kgdb_remove_all_hw_break,
+	.correct_hw_break	= kgdb_correct_hw_break,
+};
+
+int kgdb_arch_handle_exception(int vector, int signo, int err_code,
+			       char *remcom_in_buffer, char *remcom_out_buffer,
+			       struct pt_regs *regs)
+{
+	regs->csr_prmd |= CSR_PRMD_PWE;
+
+	switch (remcom_in_buffer[0]) {
+	case 'c':
+		kgdb_arch_update_addr(regs, remcom_in_buffer);
+		return 0;
+	}
+
+	return -1;
+}
+
+void arch_kgdb_breakpoint(void)
+{
+	__asm__ __volatile__(
+		".globl breakinst\n\t"
+		"nop\n"
+		"breakinst:\tbreak 0\n\t");
+}
+
+void kgdb_call_nmi_hook(void *ignored)
+{
+	kgdb_nmicallback(raw_smp_processor_id(), get_irq_regs());
+}
+
+void kgdb_roundup_cpus(void)
+{
+	local_irq_enable();
+	smp_call_function(kgdb_call_nmi_hook, NULL, 0);
+	local_irq_disable();
+}
+
+static int compute_signal(int tt)
+{
+	struct hard_trap_info *ht;
+
+	for (ht = hard_trap_info; ht->tt && ht->signo; ht++)
+		if (ht->tt == tt)
+			return ht->signo;
+
+	/* default for things we don't know about */
+	return SIGTRAP;
+}
+
+/*
+ * Calls linux_debug_hook before the kernel dies. If KGDB is enabled,
+ * then try to fall into the debugger
+ */
+static int kgdb_loongarch_notify(struct notifier_block *self, unsigned long cmd,
+			    void *ptr)
+{
+	struct die_args *args = (struct die_args *)ptr;
+	struct pt_regs *regs = args->regs;
+	int trap = read_csr_excode();
+
+	/* Userspace events, ignore. */
+	if (user_mode(regs))
+		return NOTIFY_DONE;
+
+	if (atomic_read(&kgdb_active) != -1)
+		kgdb_nmicallback(smp_processor_id(), regs);
+
+	if (kgdb_handle_exception(trap, compute_signal(trap), cmd, regs))
+		return NOTIFY_DONE;
+
+	if (atomic_read(&kgdb_setting_breakpoint))
+		if ((regs->csr_era == (unsigned long)breakinst))
+			regs->csr_era += 4;
+
+	/* In SMP mode, __flush_cache_all does IPI */
+	local_irq_enable();
+	flush_cache_all();
+
+	return NOTIFY_STOP;
+}
+
+#ifdef CONFIG_KGDB_LOW_LEVEL_TRAP
+int kgdb_ll_trap(int cmd, const char *str,
+		 struct pt_regs *regs, long err, int trap, int sig)
+{
+	struct die_args args = {
+		.regs	= regs,
+		.str	= str,
+		.err	= err,
+		.trapnr = trap,
+		.signr	= sig,
+
+	};
+
+	if (!kgdb_io_module_registered)
+		return NOTIFY_DONE;
+
+	return kgdb_loongarch_notify(NULL, cmd, &args);
+}
+#endif /* CONFIG_KGDB_LOW_LEVEL_TRAP */
+
+static struct notifier_block kgdb_notifier = {
+	.notifier_call = kgdb_loongarch_notify,
+};
+
+int kgdb_arch_init(void)
+{
+	register_die_notifier(&kgdb_notifier);
+	return 0;
+}
+
+void kgdb_arch_exit(void)
+{
+	unregister_die_notifier(&kgdb_notifier);
+}
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 8fb5e7a77145..38f99ef1b9ff 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -695,6 +695,12 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
 
 	bcode = (opcode & 0x7fff);
 
+#ifdef CONFIG_KGDB_LOW_LEVEL_TRAP
+	if (kgdb_ll_trap(DIE_TRAP, "Break", regs, code, current->thread.trap_nr,
+			 SIGTRAP) == NOTIFY_STOP)
+		return;
+#endif /* CONFIG_KGDB_LOW_LEVEL_TRAP */
+
 	/*
 	 * notify the kprobe handlers, if instruction is likely to
 	 * pertain to them.
-- 
2.39.3

