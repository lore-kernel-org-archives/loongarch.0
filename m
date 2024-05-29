Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362C733D1
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 01:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946237; cv=none; b=d9veSgNY4eFvDfA98yf1DjVSSAOedkGLG4/HiZKPQQ5cJ55myjyOAYcTL+SXAkNjMK0XlRnu/Oz5HvKx9BLcsySIo/Gcq6xujsTyR6H4QVUkdiDbg3Y3qRDp8LdQ/WAzQl6XK/oyW48UpdN6fIhvKDWY5EK4k363udQJ/DsIQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946237; c=relaxed/simple;
	bh=PxSQlLE8IGonCe5oFNnpy/+ru2KHI7lSTHCL3X5LMK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YYWaU2urTc/xkIU2Xth6DEbMZpVQdqybneOhtN5IVXEMl7KUWJCp2ExtXiDaqUHdyxYuKnmTNOWxThrtgNdzudxivbLU1IHciyPoUduyVJr0YL7J1E/8fFf1bXPH7Y/YMn+A1sF09QaCNdxEFkrJOm0m74cRG0hpVx9raERRVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxHusyhVZmUu0AAA--.3928S3;
	Wed, 29 May 2024 09:30:26 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxusYrhVZm5nEMAA--.32890S4;
	Wed, 29 May 2024 09:30:26 +0800 (CST)
From: Hui Li <lihui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH 2/3] LoongArch: Trigger user-space watchpoints correctly
Date: Wed, 29 May 2024 09:30:18 +0800
Message-Id: <20240529013019.15235-3-lihui@loongson.cn>
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
X-CM-TRANSID:AQAAf8DxusYrhVZm5nEMAA--.32890S4
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXryUGr15CFy7Jw1xJw45twc_yoWrWr4xpF
	W3Cr95tr4DJFWUWwnxtw48Cry5GwnF939ruwn5G34Ykws8WrW5Kr10krWqqF45Cw1Sq34F
	vwn0kw18KFWUZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ36c02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCFb4Uv73VFW2AGmfu7
	bjvjm3AaLaJ3UjIYCTnIWjp_UUUYO7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4
	CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8V
	C2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv
	7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIccxYrVCFb4
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5_C
	zJUUUUU==

In the current code, gdb can successfully set the watchpoint through
ptrace interface, But watchpoint will not be triggered.

When debugging the following code using gdb,

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
(gdb) c
Continuing.
start test
a = 1
end test
[Inferior 1 (process 1154) exited normally]

No watchpoints were triggered, the root causes are:

1. The kernel uses perf_event and hw_breakpoint framework to control
   watchpoint. But the perf_event corresponding to watchpoint is not
   enabled, it needs to be enabled according to watchpoint control register.

2. The global enable control for all watchpoints is the WE bit of CSR.CRMD,
   and hardware sets the value to 0 when an exception is triggered. When
   the ERTN instruction is executed to return, the hardware restores the
   value of the PWE field of CSR.PRMD here. So, before a thread containing
   watchpoints be scheduled, the PWE field of CSR.PRMD needs to be set to 1.

Modify the relevant code to solve the above problem. Enable the watchpoints in
the user-space thread.

All changes according to the LoongArch Reference Manual:
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#basic-control-and-status-registers

with this patch:

lihui@bogon:~$ gdb test
...
(gdb) start
...
Temporary breakpoint 1, main () at test.c:5
5        printf("start test\n");
(gdb) watch a
Hardware watchpoint 2: a
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
end test

Signed-off-by: Hui Li <lihui@loongson.cn>
---
 arch/loongarch/kernel/hw_breakpoint.c |  4 +++-
 arch/loongarch/kernel/ptrace.c        | 16 +++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 2d311aff91af..01cd0b051225 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -517,7 +517,9 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
 		if (!((regs->csr_era ^ addr) & ~mask))
 			csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
 		regs->csr_prmd |= CSR_PRMD_PWE;
-	} else {
+	} else if (test_tsk_thread_flag(next, TIF_LOAD_WATCH))
+                regs->csr_prmd |= CSR_PRMD_PWE;
+	else {
 		/* Update breakpoints */
 		update_bp_registers(regs, 1, 0);
 		/* Update watchpoints */
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index 16b756c6049b..328510bf60e1 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -589,6 +589,8 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 	struct perf_event *bp;
 	struct perf_event_attr attr;
 	struct arch_hw_breakpoint_ctrl ctrl;
+        struct thread_info *ti = task_thread_info(tsk);
+        int hbp_enable = uctrl & CTRL_PLV_ENABLE;
 
 	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
 	if (IS_ERR(bp))
@@ -608,9 +610,17 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
 		return -EINVAL;
 	}
 
-	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
-	if (err)
-		return err;
+       if (hbp_enable == CTRL_PLV_ENABLE) {
+		err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
+		if (err)
+			return err;
+		attr.disabled = 0;
+		set_ti_thread_flag(ti, TIF_LOAD_WATCH);
+	}
+	else {
+		attr.disabled = 1;
+		clear_ti_thread_flag(ti, TIF_LOAD_WATCH);
+	}
 
 	return modify_user_hw_breakpoint(bp, &attr);
 }
-- 
2.38.1

