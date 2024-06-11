Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C396A176227
	for <loongarch@lists.linux.dev>; Tue, 11 Jun 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106587; cv=none; b=sFsDH56ljKNqsXvQr4qo8I+xh8v1FLli3G+ZHZcXSvx/f0SCp0dg8FjAaWtw2y73rYz24SiDf0yTqkDS1zpmg8azaMtbn3jl1Xoav4jzgY8hrJOLa7Iynx4k0KkBQK5cwRy+5X0K7lEYIjp9YziljUF/XG9S9B7MTfZeRY/78lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106587; c=relaxed/simple;
	bh=Me8mIkpZIr46rO43ifZtdhuS81TfLx9up9x3XWLsSvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JBVyuU5BkSkdHGm6pcTthBg45p5NLHzXA2/YKks3Yly+XKy8ewK++xUZLDlp7qMgf2NHQih9D997aG9O7x5hI/ywg20xtKSGuKSXdCDK0y9A5p4IilOqXVFO8zY9EF1A/hoZKWJ0ZjtTvDP83zsKANNslJtzZk3fJSWczYffcLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx7erXOWhma6YFAA--.23251S3;
	Tue, 11 Jun 2024 19:49:43 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjsfTOWhmnfcbAA--.2891S4;
	Tue, 11 Jun 2024 19:49:43 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH v2 2/3] LoongArch: Trigger user-space watchpoints correctly
Date: Tue, 11 Jun 2024 19:49:38 +0800
Message-Id: <20240611114939.23586-3-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240611114939.23586-1-lihui@loongson.cn>
References: <20240611114939.23586-1-lihui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxjsfTOWhmnfcbAA--.2891S4
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtFyDArWUuw4DGrWDWF4rZwc_yoW7Xr4fpF
	W7CrZ5tr4DKrWxKwnxtwn5Cw45Gws2939rXwnxK3yYywsxWrW3Kr1kGryDXFWYkw4rJa4F
	vFn0gw1jgayUZwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jY38nUUUUU=

In the current code, gdb can set the watchpoint successfully through
ptrace interface, but watchpoint will not be triggered.

When debugging the following code using gdb.

lihui@bogon:~$ cat test.c
  #include <stdio.h>
  int a = 0;
  int main()
  {
	a = 1;
	printf("a = %d\n", a);
	return 0;
  }
lihui@bogon:~$ gcc -g test.c -o test
lihui@bogon:~$ gdb test
...
(gdb) watch a
...
(gdb) r
...
a = 1
[Inferior 1 (process 4650) exited normally]

No watchpoints were triggered, the root causes are:

1. The kernel uses perf_event and hw_breakpoint framework to control
   watchpoint. But the perf_event corresponding to watchpoint is not
   enabled, so it needs to be enabled according to MWPnCFG3.PLV3. And
   a judgment is added in ptrace_hbp_set_addr() to ensure that kernel
   space cannot be monitored in user mode.

2. The global enable control for all watchpoints is the WE bit of
   CSR.CRMD, and hardware sets the value to 0 when an exception is
   triggered. When the ERTN instruction is executed to return, the
   hardware restores the value of the PWE field of CSR.PRMD here.
   So, before a thread containing watchpoints be scheduled, the PWE
   field of CSR.PRMD needs to be set to 1. Add this modification in
   hw_breakpoint_control().

All changes according to the LoongArch Reference Manual:
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#basic-control-and-status-registers

with this patch:

lihui@bogon:~$ gdb test
...
(gdb) watch a
Hardware watchpoint 1: a
(gdb) r
...
Hardware watchpoint 1: a

Old value = 0
New value = 1
main () at test.c:6
6		printf("a = %d\n", a);
(gdb) c
Continuing.
a = 1
[Inferior 1 (process 775) exited normally]

Signed-off-by: Hui Li <lihui@loongson.cn>
---
 arch/loongarch/include/asm/hw_breakpoint.h |  1 +
 arch/loongarch/kernel/hw_breakpoint.c      |  9 +++++++++
 arch/loongarch/kernel/ptrace.c             | 16 +++++++++++++---
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/include/asm/hw_breakpoint.h
index a8ce580f4fc6..16016e4384d8 100644
--- a/arch/loongarch/include/asm/hw_breakpoint.h
+++ b/arch/loongarch/include/asm/hw_breakpoint.h
@@ -75,6 +75,7 @@ do {								\
 #define CSR_MWPC_NUM		0x3f
 
 #define CTRL_PLV_ENABLE		0x1e
+#define CTRL_PLV3_ENABLE	0x10
 
 #define MWPnCFG3_LoadEn		8
 #define MWPnCFG3_StoreEn	9
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 2d311aff91af..f9e8ed49cfdc 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -178,6 +178,11 @@ static int hw_breakpoint_control(struct perf_event *bp,
 	int i, max_slots, enable;
 	struct perf_event **slots;
 	struct arch_hw_breakpoint *info = counter_arch_bp(bp);
+	struct pt_regs *regs;
+
+	/*  Whether bp belongs to a task. */
+	if (bp->hw.target)
+		regs = task_pt_regs(bp->hw.target);
 
 	if (info->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) {
 		/* Breakpoint */
@@ -211,6 +216,8 @@ static int hw_breakpoint_control(struct perf_event *bp,
 		}
 		enable = csr_read64(LOONGARCH_CSR_CRMD);
 		csr_write64(CSR_CRMD_WE | enable, LOONGARCH_CSR_CRMD);
+		if (bp->hw.target)
+			regs->csr_prmd |= CSR_PRMD_PWE;
 		break;
 	case HW_BREAKPOINT_UNINSTALL:
 		/* Reset the FWPnCFG/MWPnCFG 1~4 register. */
@@ -222,6 +229,8 @@ static int hw_breakpoint_control(struct perf_event *bp,
 		write_wb_reg(CSR_CFG_CTRL, i, 1, 0);
 		write_wb_reg(CSR_CFG_ASID, i, 0, 0);
 		write_wb_reg(CSR_CFG_ASID, i, 1, 0);
+		if (bp->hw.target)
+			regs->csr_prmd &= ~CSR_PRMD_PWE;
 		break;
 	}
 
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index 16b756c6049b..4566059bd0a2 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -589,6 +589,7 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 	struct perf_event *bp;
 	struct perf_event_attr attr;
 	struct arch_hw_breakpoint_ctrl ctrl;
+	int hbp_enable = uctrl & CTRL_PLV_ENABLE;
 
 	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
 	if (IS_ERR(bp))
@@ -608,9 +609,14 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 		return -EINVAL;
 	}
 
-	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
-	if (err)
-		return err;
+	if (hbp_enable == CTRL_PLV3_ENABLE) {
+		err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
+		if (err)
+			return err;
+		attr.disabled = 0;
+	} else {
+		attr.disabled = 1;
+	}
 
 	return modify_user_hw_breakpoint(bp, &attr);
 }
@@ -641,6 +647,10 @@ static int ptrace_hbp_set_addr(unsigned int note_type,
 	struct perf_event *bp;
 	struct perf_event_attr attr;
 
+	/* Kernel-space address cannot be monitored by user-space */
+	if ((addr & XKPRANGE) == XKPRANGE)
+		return -EINVAL;
+
 	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
 	if (IS_ERR(bp))
 		return PTR_ERR(bp);
-- 
2.38.1

