Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A765336A
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 01:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946237; cv=none; b=QheLsNOrX5FziEBaQXx3rWuRnMHiYaJlko+2J7sybuax3oYjVEx7D1mKHQtLbwqkzzwywJYnXRG6hUqI+uLUHKvfnsmclgc8+e1GAPzXsoczOm6+AJuWqatszhAdpDZDxR9ShQAnybf/Fj0A78ppTPa+0YF6OCCzgOx2dBzO2do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946237; c=relaxed/simple;
	bh=4+t5Yu/JKvQtS7gVGEAg8SCqWBJZM4Y5PVvWeMXRx6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lsMdZU1f5CglwCwDcqqOmXnm/z63FGjtfjwHbhUM22SAYsqDCQYuVqcQ+i+dT9CMegdCVafhCvZ25FLms8ektqfZ5VXO2lxtJ2AMyFoxqki2azY7hpDBAPNSZ2TAS3PK+qCA/orRAXqizLXc4e9Eu4NX2w3g/10o+0WR6ZoOo1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxi+o0hVZmVe0AAA--.3815S3;
	Wed, 29 May 2024 09:30:28 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxusYrhVZm5nEMAA--.32890S5;
	Wed, 29 May 2024 09:30:27 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 3/3] LoongArch: Fix multiple hardware watchpoint issues
Date: Wed, 29 May 2024 09:30:19 +0800
Message-Id: <20240529013019.15235-4-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240529013019.15235-1-lihui@loongson.cn>
References: <20240529013019.15235-1-lihui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxusYrhVZm5nEMAA--.32890S5
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtF4rJw4fKFWkAF1UXw4UWrX_yoW7ur4fp3
	ya9FZIgrWjyr1kWrnrtF95Cr15Gr1kZ39rAr1Sy34YywsxWFWrKrZ7Jw1fXFW8C393WryF
	yw15XF1aga1DZacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ36c02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCFb4Uv73VFW2AGmfu7
	bjvjm3AaLaJ3UjIYCTnIWjp_UUUYO7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4
	CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8V
	C2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv
	7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIccxYrVCFb4
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUY7b
	1UUUUUU==

In the current code, multiple hardware breakpoint/watchpoint in
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

1. In hw_breakpoint_control(), The FWPnCFG1.2.4/MWPnCFG1.2.4 register setting
   are not distinguished. they should be set based on hardware watchpoint
   functions (fetch or load/store operations).

2. In breakpoint_handler() and watchpoint_handler(), not identifying which
   watchpoint was triggered, and all watchpoin-related perf_event callbacks
   are called and send siginfo to the user space. The user-space unable to
   determine which watchpoint is triggered currently. So, the kernel need
   to identity which watchpoint is triggered via MWPS/FWPS register and call
   the corresponding perf event callback to report siginfo to the user-space.

Modify the relevant code to solve above issues. All changes according to the
LoongArch Reference Manual:
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
 arch/loongarch/kernel/hw_breakpoint.c | 58 ++++++++++++++++-----------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 01cd0b051225..143a45a4c7da 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -197,15 +197,15 @@ static int hw_breakpoint_control(struct perf_event *bp,
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
@@ -214,14 +214,18 @@ static int hw_breakpoint_control(struct perf_event *bp,
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
+		}
+		else {
+			write_wb_reg(CSR_CFG_ADDR, i, 1, 0);
+			write_wb_reg(CSR_CFG_MASK, i, 1, 0);
+			write_wb_reg(CSR_CFG_CTRL, i, 1, 0);
+			write_wb_reg(CSR_CFG_ASID, i, 1, 0);
+		}
 		break;
 	}
 
@@ -461,12 +465,15 @@ void breakpoint_handler(struct pt_regs *regs)
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
 
@@ -478,12 +485,15 @@ void watchpoint_handler(struct pt_regs *regs)
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

