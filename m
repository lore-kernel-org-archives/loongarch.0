Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D549371
	for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 08:53:26 +0000 (UTC)
Received: from 4.cn (unknown [10.20.4.148])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxkOBVaDFjySIiAA--.62110S2;
	Mon, 26 Sep 2022 16:52:37 +0800 (CST)
From: Jun Yi <yijun@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Qing Zhang <zhangqing@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Mao Bibo <maobibo@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Remove useless header branch.h
Date: Mon, 26 Sep 2022 16:52:37 +0800
Message-Id: <20220926085237.1821015-1-yijun@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxkOBVaDFjySIiAA--.62110S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4UJF4fJw4ktFy7Zr13urg_yoWrXw1DpF
	9rAFs7GrZ5Wrn5Z3yDJ340vF15Jrs5Kw429a42ka4S9F1avryrWr4kG3srXFWvya9YyFy0
	gFyrtw1YqF45XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUF9a9DUUUU
X-CM-SenderInfo: p1lm30o6or00hjvr0hdfq/1tbiAQABAWMwRN0OuAABs8

The content of LoongArch's branch.h is porting from
MIPS which includes some functions about delay slot,
so inline the definitions and remove the header.

Signed-off-by: Jun Yi <yijun@loongson.cn>
---
 arch/loongarch/include/asm/branch.h | 20 --------------------
 arch/loongarch/kernel/traps.c       |  7 ++-----
 arch/loongarch/mm/extable.c         |  4 ++--
 arch/loongarch/mm/fault.c           |  5 ++---
 4 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 arch/loongarch/include/asm/branch.h

diff --git a/arch/loongarch/include/asm/branch.h b/arch/loongarch/include/asm/branch.h
deleted file mode 100644
index 9a133e4c068e..000000000000
--- a/arch/loongarch/include/asm/branch.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
- */
-#ifndef _ASM_BRANCH_H
-#define _ASM_BRANCH_H
-
-#include <asm/ptrace.h>
-
-static inline unsigned long exception_era(struct pt_regs *regs)
-{
-	return regs->csr_era;
-}
-
-static inline void compute_return_era(struct pt_regs *regs)
-{
-	regs->csr_era += 4;
-}
-
-#endif /* _ASM_BRANCH_H */
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index aa1c95aaf595..3c82c57daeee 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -30,7 +30,6 @@
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
-#include <asm/branch.h>
 #include <asm/break.h>
 #include <asm/cpu.h>
 #include <asm/fpu.h>
@@ -378,7 +377,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
 {
 	bool user = user_mode(regs);
 	unsigned int opcode, bcode;
-	unsigned long era = exception_era(regs);
+	unsigned long era = regs->csr_era;
 	irqentry_state_t state = irqentry_enter(regs);
 
 	local_irq_enable();
@@ -463,7 +462,7 @@ asmlinkage void noinstr do_ri(struct pt_regs *regs)
 {
 	int status = -1;
 	unsigned int opcode = 0;
-	unsigned int __user *era = (unsigned int __user *)exception_era(regs);
+	unsigned int __user *era = (unsigned int __user *) regs->csr_era;
 	unsigned long old_era = regs->csr_era;
 	unsigned long old_ra = regs->regs[1];
 	irqentry_state_t state = irqentry_enter(regs);
@@ -477,8 +476,6 @@ asmlinkage void noinstr do_ri(struct pt_regs *regs)
 
 	die_if_kernel("Reserved instruction in kernel code", regs);
 
-	compute_return_era(regs);
-
 	if (unlikely(get_user(opcode, era) < 0)) {
 		status = SIGSEGV;
 		current->thread.error_code = 1;
diff --git a/arch/loongarch/mm/extable.c b/arch/loongarch/mm/extable.c
index bc20988f2b87..6da7c5e5847b 100644
--- a/arch/loongarch/mm/extable.c
+++ b/arch/loongarch/mm/extable.c
@@ -4,14 +4,14 @@
  */
 #include <linux/extable.h>
 #include <linux/spinlock.h>
-#include <asm/branch.h>
 #include <linux/uaccess.h>
+#include <asm/ptrace.h>
 
 int fixup_exception(struct pt_regs *regs)
 {
 	const struct exception_table_entry *fixup;
 
-	fixup = search_exception_tables(exception_era(regs));
+	fixup = search_exception_tables(regs->csr_era);
 	if (fixup) {
 		regs->csr_era = fixup->fixup;
 
diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index 1ccd53655cab..5c2a3399c823 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -24,7 +24,6 @@
 #include <linux/perf_event.h>
 #include <linux/uaccess.h>
 
-#include <asm/branch.h>
 #include <asm/mmu_context.h>
 #include <asm/ptrace.h>
 
@@ -197,9 +196,9 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		if (!(vma->vm_flags & VM_WRITE))
 			goto bad_area;
 	} else {
-		if (!(vma->vm_flags & VM_READ) && address != exception_era(regs))
+		if (!(vma->vm_flags & VM_READ) && address != regs->csr_era)
 			goto bad_area;
-		if (!(vma->vm_flags & VM_EXEC) && address == exception_era(regs))
+		if (!(vma->vm_flags & VM_EXEC) && address == regs->csr_era)
 			goto bad_area;
 	}
 
-- 
2.31.1

