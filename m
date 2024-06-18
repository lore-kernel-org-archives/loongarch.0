Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF82D14EC7D
	for <loongarch@lists.linux.dev>; Tue, 18 Jun 2024 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696590; cv=none; b=odger7MSaxu1lWN74YHCAE8Tnq4w/7T41ftKwy87CYRvi0bn3i18+AaZy5LNr9kvtStsa02pBtqsuxFqA5z7GR3obogrWLOu8q4QnUJoSMbjqlZzgWbWP8ZCJiK5TAGYNz64kL24fL+xk63MZa3XBJT4ouScxBNnJnsgQd+ft1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696590; c=relaxed/simple;
	bh=QFeh68y8xSUV8oj/h7LRotj2kFsnrsON/qOF7VaMWEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mRLdny2/oVYtMIyCjj8HHgkYIg/K7yrtVD73z+ndPNychq0QAnYoT5OBs6GTL/GDt0k4E9kh2PPyLoBlGdtfbLubo/6TVZLcOQBx4njIZ66u3wFBkT1lTCrw9x44arV2GKDanMx2vDPmrt85p2Q/VoOgZu0K6pe8qitq+PnwPH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxW+qKOnFmqNYHAA--.31642S3;
	Tue, 18 Jun 2024 15:43:06 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxTceIOnFmqBMnAA--.29300S4;
	Tue, 18 Jun 2024 15:43:05 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH v3 2/3] LoongArch: Trigger user-space watchpoints correctly
Date: Tue, 18 Jun 2024 15:43:02 +0800
Message-Id: <20240618074303.17869-3-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240618074303.17869-1-lihui@loongson.cn>
References: <20240618074303.17869-1-lihui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxTceIOnFmqBMnAA--.29300S4
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtFy3Cr18Gr45XF17Zr4kXwc_yoW7trW8pF
	42kr95tr4DtrZ7Kwnxtrn5Cw45Gwn7u39rXw1fK34YywsxWFW3Gr1kGr95XFWYyw4rG34F
	vF15Ww1jga1UZ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

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

1. Kernel uses perf_event and hw_breakpoint framework to control
   watchpoint, but the perf_event corresponding to watchpoint is
   not enabled. So it needs to be enabled according to MWPnCFG3
   or FWPnCFG3 PLV bit field in ptrace_hbp_set_ctrl(), and privilege
   is set according to the monitored addr in hw_breakpoint_control().
   Furthermore, add a judgment in ptrace_hbp_set_addr() to ensure
   kernel-space addr cannot be monitored in user mode.

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
 arch/loongarch/include/asm/hw_breakpoint.h |  2 ++
 arch/loongarch/kernel/hw_breakpoint.c      | 19 +++++++++++++++++--
 arch/loongarch/kernel/ptrace.c             | 16 +++++++++++++---
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/include/asm/hw_breakpoint.h
index a8ce580f4fc6..6415b981dbdc 100644
--- a/arch/loongarch/include/asm/hw_breakpoint.h
+++ b/arch/loongarch/include/asm/hw_breakpoint.h
@@ -75,6 +75,8 @@ do {								\
 #define CSR_MWPC_NUM		0x3f
 
 #define CTRL_PLV_ENABLE		0x1e
+#define CTRL_PLV3_ENABLE	0x10
+#define CTRL_PLV0_ENABLE	0x02
 
 #define MWPnCFG3_LoadEn		8
 #define MWPnCFG3_StoreEn	9
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 2d311aff91af..3ac58d1a14b7 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -178,6 +178,17 @@ static int hw_breakpoint_control(struct perf_event *bp,
 	int i, max_slots, enable;
 	struct perf_event **slots;
 	struct arch_hw_breakpoint *info = counter_arch_bp(bp);
+	struct pt_regs *regs;
+	u8 privilege;
+
+	if (arch_check_bp_in_kernelspace(info))
+		privilege = CTRL_PLV0_ENABLE;
+	else
+		privilege = CTRL_PLV3_ENABLE;
+
+	/*  Whether bp belongs to a task. */
+	if (bp->hw.target)
+		regs = task_pt_regs(bp->hw.target);
 
 	if (info->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) {
 		/* Breakpoint */
@@ -204,13 +215,15 @@ static int hw_breakpoint_control(struct perf_event *bp,
 		write_wb_reg(CSR_CFG_ASID, i, 0, 0);
 		write_wb_reg(CSR_CFG_ASID, i, 1, 0);
 		if (info->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) {
-			write_wb_reg(CSR_CFG_CTRL, i, 0, CTRL_PLV_ENABLE);
+			write_wb_reg(CSR_CFG_CTRL, i, 0, privilege);
 		} else {
 			ctrl = encode_ctrl_reg(info->ctrl);
-			write_wb_reg(CSR_CFG_CTRL, i, 1, ctrl | CTRL_PLV_ENABLE);
+			write_wb_reg(CSR_CFG_CTRL, i, 1, ctrl | privilege);
 		}
 		enable = csr_read64(LOONGARCH_CSR_CRMD);
 		csr_write64(CSR_CRMD_WE | enable, LOONGARCH_CSR_CRMD);
+		if (bp->hw.target)
+			regs->csr_prmd |= CSR_PRMD_PWE;
 		break;
 	case HW_BREAKPOINT_UNINSTALL:
 		/* Reset the FWPnCFG/MWPnCFG 1~4 register. */
@@ -222,6 +235,8 @@ static int hw_breakpoint_control(struct perf_event *bp,
 		write_wb_reg(CSR_CFG_CTRL, i, 1, 0);
 		write_wb_reg(CSR_CFG_ASID, i, 0, 0);
 		write_wb_reg(CSR_CFG_ASID, i, 1, 0);
+		if (bp->hw.target)
+			regs->csr_prmd &= ~CSR_PRMD_PWE;
 		break;
 	}
 
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index 16b756c6049b..6ab03acb3afb 100644
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
+	if (hbp_enable & CTRL_PLV_ENABLE) {
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
+	if ((unsigned long)addr >= XKPRANGE)
+		return -EINVAL;
+
 	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
 	if (IS_ERR(bp))
 		return PTR_ERR(bp);
-- 
2.38.1

