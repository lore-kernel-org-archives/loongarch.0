Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63873BB669
	for <loongarch@lists.linux.dev>; Thu, 24 Sep 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260037; cv=none; b=XW3LPjo6f8rLvQcWhOO9k68Ta2ws4oobpVlOSNZ89ooUHLWToTTTd+nG6vu4LD0fm7A9Iy6W8XsalT860iTAwtIBZ3jAv5VLMfYcYNwf1fbaBDR00fAUS7PuiQcd7M8/iXb+HRjKhrFcSD5Q9aTfBTZR4Kp0cJ8e276Ts7CfpZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260037; c=relaxed/simple;
	bh=gP1hbo0fXBOIR/xuHFNmPZCAZbNpdADMI1YaB4qZt5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ig7jmMNx7ZIr81kDQ1MC26uHol1xgGLTg6tfL2rRcQ8mZSO6K1ZkB1vxvVSddlnWGkSrU1NbNvk0LNYn4TTC3GVBc0nNWDSh1TIrz7X4EV6z5JJOVVZ4zyhQeRdP3u8xO0BdpSQO8JtyawG3LqLGEvkwmxTKYzzsxH4Y6DFRmmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxYdFAM7Vq5XAPAA--.45640S3;
	Thu, 24 Sep 2026 22:27:12 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxBc09M7Vqha8kAA--.50018S6;
	Thu, 24 Sep 2026 22:27:12 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] LoongArch: Only send SIGTRAP signal if necessary in do_watch()
Date: Thu, 24 Sep 2026 22:27:06 +0800
Message-ID: <20260924142708.2459-5-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260924142708.2459-1-yangtiezhu@loongson.cn>
References: <20260924142708.2459-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc09M7Vqha8kAA--.50018S6
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw45AF4xKry3uFyfJr4DJrc_yoWrtw48pF
	ZruFn3KrWDGr1ku3W3Gw4Dur43Grs5uw47u34Sy34F9rs0grWrJrn2yFnFqFW5W3s8Xa40
	qF1Yq3WS9a1UXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

In do_watch(), the kernel unconditionally forces a SIGTRAP signal at the
end of the handler via force_sig(SIGTRAP). This is essential for ptrace
operations, but it severely disrupts standard perf_event usage.

Under normal perf usage, it is not necessary to force a SIGTRAP signal
on every hit. Forcing it unnecessarily aborts the target process if no
user-space signal handler is registered, which violates performance
monitoring behaviors and injects context switch overheads.

However, a conditional check using only 'current->ptrace' would block
legitimate user-requested signals when a perf_event is configured with
'attr.sigtrap = 1' for asynchronous user-space tracking.

Fix this by refactoring breakpoint_handler() and watchpoint_handler()
to return a boolean status indicating whether any triggered breakpoint
explicitly requires a signal notification. Update do_watch() to enforce
the SIGTRAP signal only when the process is actively being debugged via
ptrace, or when the underlying perf_event infrastructure specifically
demands it via 'attr.sigtrap'.

Fixes: 424421a7f34c ("LoongArch: ptrace: Add hardware single step support")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/hw_breakpoint.h |  4 ++--
 arch/loongarch/kernel/hw_breakpoint.c      | 18 ++++++++++++++++--
 arch/loongarch/kernel/traps.c              |  8 +++++---
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/include/asm/hw_breakpoint.h
index 5faa97a87a9e..d202052df8a1 100644
--- a/arch/loongarch/include/asm/hw_breakpoint.h
+++ b/arch/loongarch/include/asm/hw_breakpoint.h
@@ -116,8 +116,8 @@ extern void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 extern int hw_breakpoint_slots(int type);
 extern void hw_breakpoint_pmu_read(struct perf_event *bp);
 
-void breakpoint_handler(struct pt_regs *regs);
-void watchpoint_handler(struct pt_regs *regs);
+bool breakpoint_handler(struct pt_regs *regs);
+bool watchpoint_handler(struct pt_regs *regs);
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 extern void ptrace_hw_copy_thread(struct task_struct *task);
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 7f69cf361a5e..3683a52b2368 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -482,10 +482,11 @@ NOKPROBE_SYMBOL(update_bp_registers);
 /*
  * Debug exception handlers.
  */
-void breakpoint_handler(struct pt_regs *regs)
+bool breakpoint_handler(struct pt_regs *regs)
 {
 	int i;
 	struct perf_event *bp, **slots;
+	bool need_sigtrap = false;
 
 	slots = this_cpu_ptr(bp_on_reg);
 
@@ -494,18 +495,25 @@ void breakpoint_handler(struct pt_regs *regs)
 			bp = slots[i];
 			if (bp == NULL)
 				continue;
+
 			perf_bp_event(bp, regs);
+			if (bp->attr.sigtrap)
+				need_sigtrap = true;
+
 			csr_write32(0x1 << i, LOONGARCH_CSR_FWPS);
 			update_bp_registers(regs, 0, 0);
 		}
 	}
+
+	return need_sigtrap;
 }
 NOKPROBE_SYMBOL(breakpoint_handler);
 
-void watchpoint_handler(struct pt_regs *regs)
+bool watchpoint_handler(struct pt_regs *regs)
 {
 	int i;
 	struct perf_event *wp, **slots;
+	bool need_sigtrap = false;
 
 	slots = this_cpu_ptr(wp_on_reg);
 
@@ -514,11 +522,17 @@ void watchpoint_handler(struct pt_regs *regs)
 			wp = slots[i];
 			if (wp == NULL)
 				continue;
+
 			perf_bp_event(wp, regs);
+			if (wp->attr.sigtrap)
+				need_sigtrap = true;
+
 			csr_write32(0x1 << i, LOONGARCH_CSR_MWPS);
 			update_bp_registers(regs, 0, 1);
 		}
 	}
+
+	return need_sigtrap;
 }
 NOKPROBE_SYMBOL(watchpoint_handler);
 
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index c4d7e55fb3ea..4cbf84b148cd 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -811,6 +811,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
 asmlinkage void noinstr do_watch(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
+	bool need_sigtrap = !!current->ptrace;
 
 #ifndef CONFIG_HAVE_HW_BREAKPOINT
 	pr_warn("Hardware watch point handler not implemented!\n");
@@ -851,11 +852,12 @@ asmlinkage void noinstr do_watch(struct pt_regs *regs)
 			}
 		}
 	} else {
-		breakpoint_handler(regs);
-		watchpoint_handler(regs);
+		need_sigtrap |= breakpoint_handler(regs);
+		need_sigtrap |= watchpoint_handler(regs);
 	}
 
-	force_sig(SIGTRAP);
+	if (need_sigtrap)
+		force_sig(SIGTRAP);
 out:
 #endif
 	irqentry_exit(regs, state);
-- 
2.42.0

