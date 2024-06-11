Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9833717BB03
	for <loongarch@lists.linux.dev>; Tue, 11 Jun 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106587; cv=none; b=P//idaNaeaj4WXdNC3G4Cl4eBg9QjgZ9aojMwAu0VWJpYm8/8j98EsEV/5YZfi4AILdOYjFzxeliQBAqiKx1xS94uwpAHFBGzGTZPa7uME+7QKxUW2G45O7jtcey9EJoAoBkVE9CHH+VXGji79ziVtQDFdoxUXHspUI/tLUlwEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106587; c=relaxed/simple;
	bh=SEhKW1D8ZbUOhz3e4zBz54ltfB1VduSy4RvLJEarxIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AwGCexOKFml+NViWyt26sjgIQF80Lw3qQDJbpxOnBfOrUuVPyGTpDtXy12iUTyoJynC4jYdwQ7kM556P/gAd6FJD4FiRtNvMij9jeP1lJGX+PM6pq4ZdaCpBitkVfHGVZxRi5w+cJNe52BSxWIMultBuZTOlVg+6o4wiyqCb5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axz+vXOWhmbqYFAA--.7174S3;
	Tue, 11 Jun 2024 19:49:43 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjsfTOWhmnfcbAA--.2891S5;
	Tue, 11 Jun 2024 19:49:43 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH v2 3/3] LoongArch: Fix multiple hardware watchpoint issues
Date: Tue, 11 Jun 2024 19:49:39 +0800
Message-Id: <20240611114939.23586-4-lihui@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxjsfTOWhmnfcbAA--.2891S5
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtF4rJw4fKFWkAF1UArWrZwc_yoW7uF47p3
	ya9FZIgrWjyr1kWrnrtas5Ar15Gr1kZ39rAr1Sy34Yy39xWFWrKrZ7Jwn3XFW8C393ZryF
	yw15ZF1aga1DZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

In the current code, if multiple hardware breakpoint/watchpoint in
a user-space thread, some hardware breakpoint/watchpoint will not
be triggered.

When debugging the following code using gdb

lihui@bogon:~$ cat test.c
  #include <stdio.h>
  int a = 0;
  int main()
  {
    printf("start test\n");
    a = 1;
    printf("a = %d\n", a);
    printf("end test\n");
    return 0;
  }
lihui@bogon:~$ gcc -g test.c -o test
lihui@bogon:~$ gdb test
...
(gdb) start
...
Temporary breakpoint 1, main () at test.c:5
5        printf("start test\n");
(gdb) watch a
Hardware watchpoint 2: a
(gdb) hbreak 8
Hardware assisted breakpoint 3 at 0x1200006ec: file test.c, line 8.
(gdb) c
Continuing.
start test
a = 1

Breakpoint 3, main () at test.c:8
8        printf("end test\n");
...

The first hardware watchpoint is not triggered, the root causes are:

1. In hw_breakpoint_control(), The FWPnCFG1.2.4/MWPnCFG1.2.4 register
   setting are not distinguished. they should be set based on hardware
   watchpoint functions (fetch or load/store operations).

2. In breakpoint_handler() and watchpoint_handler(), not identifying
   which watchpoint was triggered, all watchpoint-related perf_event
   callbacks are called and send siginfo to the user space. Causing
   user-space unable to determine which watchpoint is triggered. The
   kernel need to identity which watchpoint is triggered via MWPS/FWPS
   register and call the corresponding perf event callback to report
   siginfoto the user-space.

Modify the relevant code to solve above issues. All changes according to
the LoongArch Reference Manual:
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints

with this patch:

lihui@bogon:~$ gdb test
...
(gdb) start
...
Temporary breakpoint 1, main () at test.c:5
5        printf("start test\n");
(gdb) watch a
Hardware watchpoint 2: a
(gdb) hbreak 8
Hardware assisted breakpoint 3 at 0x1200006ec: file test.c, line 8.
(gdb) c
Continuing.
start test

Hardware watchpoint 2: a

Old value = 0
New value = 1
main () at test.c:7
7        printf("a = %d\n", a);
(gdb) c
Continuing.
a = 1

Breakpoint 3, main () at test.c:8
8        printf("end test\n");
(gdb) c
Continuing.
end test
[Inferior 1 (process 778) exited normally]

Signed-off-by: Hui Li <lihui@loongson.cn>
---
 arch/loongarch/kernel/hw_breakpoint.c | 57 ++++++++++++++++-----------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index f9e8ed49cfdc..6711f93b8187 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -202,15 +202,15 @@ static int hw_breakpoint_control(struct perf_event *bp,
 	switch (ops) {
 	case HW_BREAKPOINT_INSTALL:
 		/* Set the FWPnCFG/MWPnCFG 1~4 register. */
-		write_wb_reg(CSR_CFG_ADDR, i, 0, info->address);
-		write_wb_reg(CSR_CFG_ADDR, i, 1, info->address);
-		write_wb_reg(CSR_CFG_MASK, i, 0, info->mask);
-		write_wb_reg(CSR_CFG_MASK, i, 1, info->mask);
-		write_wb_reg(CSR_CFG_ASID, i, 0, 0);
-		write_wb_reg(CSR_CFG_ASID, i, 1, 0);
 		if (info->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) {
+			write_wb_reg(CSR_CFG_ADDR, i, 0, info->address);
+			write_wb_reg(CSR_CFG_MASK, i, 0, info->mask);
+			write_wb_reg(CSR_CFG_ASID, i, 0, 0);
 			write_wb_reg(CSR_CFG_CTRL, i, 0, CTRL_PLV_ENABLE);
 		} else {
+			write_wb_reg(CSR_CFG_ADDR, i, 1, info->address);
+			write_wb_reg(CSR_CFG_MASK, i, 1, info->mask);
+			write_wb_reg(CSR_CFG_ASID, i, 1, 0);
 			ctrl = encode_ctrl_reg(info->ctrl);
 			write_wb_reg(CSR_CFG_CTRL, i, 1, ctrl | CTRL_PLV_ENABLE);
 		}
@@ -221,14 +221,17 @@ static int hw_breakpoint_control(struct perf_event *bp,
 		break;
 	case HW_BREAKPOINT_UNINSTALL:
 		/* Reset the FWPnCFG/MWPnCFG 1~4 register. */
-		write_wb_reg(CSR_CFG_ADDR, i, 0, 0);
-		write_wb_reg(CSR_CFG_ADDR, i, 1, 0);
-		write_wb_reg(CSR_CFG_MASK, i, 0, 0);
-		write_wb_reg(CSR_CFG_MASK, i, 1, 0);
-		write_wb_reg(CSR_CFG_CTRL, i, 0, 0);
-		write_wb_reg(CSR_CFG_CTRL, i, 1, 0);
-		write_wb_reg(CSR_CFG_ASID, i, 0, 0);
-		write_wb_reg(CSR_CFG_ASID, i, 1, 0);
+		if (info->ctrl.type == LOONGARCH_BREAKPOINT_EXECUTE) {
+			write_wb_reg(CSR_CFG_ADDR, i, 0, 0);
+			write_wb_reg(CSR_CFG_MASK, i, 0, 0);
+			write_wb_reg(CSR_CFG_CTRL, i, 0, 0);
+			write_wb_reg(CSR_CFG_ASID, i, 0, 0);
+		} else {
+			write_wb_reg(CSR_CFG_ADDR, i, 1, 0);
+			write_wb_reg(CSR_CFG_MASK, i, 1, 0);
+			write_wb_reg(CSR_CFG_CTRL, i, 1, 0);
+			write_wb_reg(CSR_CFG_ASID, i, 1, 0);
+		}
 		if (bp->hw.target)
 			regs->csr_prmd &= ~CSR_PRMD_PWE;
 		break;
@@ -470,12 +473,15 @@ void breakpoint_handler(struct pt_regs *regs)
 	slots = this_cpu_ptr(bp_on_reg);
 
 	for (i = 0; i < boot_cpu_data.watch_ireg_count; ++i) {
-		bp = slots[i];
-		if (bp == NULL)
-			continue;
-		perf_bp_event(bp, regs);
+		if ((csr_read32(LOONGARCH_CSR_FWPS) & (0x1 << i))) {
+			bp = slots[i];
+			if (bp == NULL)
+				continue;
+			perf_bp_event(bp, regs);
+			csr_write32(0x1 << i, LOONGARCH_CSR_FWPS);
+			update_bp_registers(regs, 0, 0);
+		}
 	}
-	update_bp_registers(regs, 0, 0);
 }
 NOKPROBE_SYMBOL(breakpoint_handler);
 
@@ -487,12 +493,15 @@ void watchpoint_handler(struct pt_regs *regs)
 	slots = this_cpu_ptr(wp_on_reg);
 
 	for (i = 0; i < boot_cpu_data.watch_dreg_count; ++i) {
-		wp = slots[i];
-		if (wp == NULL)
-			continue;
-		perf_bp_event(wp, regs);
+		if ((csr_read32(LOONGARCH_CSR_MWPS) & (0x1 << i))) {
+			wp = slots[i];
+			if (wp == NULL)
+				continue;
+			perf_bp_event(wp, regs);
+			csr_write32(0x1 << i, LOONGARCH_CSR_MWPS);
+			update_bp_registers(regs, 0, 1);
+		}
 	}
-	update_bp_registers(regs, 0, 1);
 }
 NOKPROBE_SYMBOL(watchpoint_handler);
 
-- 
2.38.1

