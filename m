Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BBA41443D
	for <loongarch@lists.linux.dev>; Wed, 23 Sep 2026 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142978; cv=none; b=vBT2JbSwiE70LfIF1u/7+Oq0ZnOrAfYeydXsceMoKs9I9W77+irMTD3359DkF2IStPWf/loTsGapZ9iHU7SilQifXttGcisuOrJAQD/TcHecVF5h7V5jHABVzsjz6U26FymScYnxaAXO8SPajMpm63MQlFccGjpuoiWQIOqDaFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142978; c=relaxed/simple;
	bh=UpPsUD98cda34dA8MrwQ0wEf+kkVoVW2uvixgp8EJ78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+E1V2HaUv5d5khgmHJwgiRX3azVGiGcIuKwF0c8bSz4BreYUFbFvDsFoc80svcLedsHaP4sp91u9+nFLzPdh38N35rcdmm6YNQtSicL3B2FHrL/9M8cvadlBgY5fvGG+4rzME0R2gj4v3XkzRyZqU2hwndFDG4DdpSGlz4fIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Bx79LAabNqoe0OAA--.44097S3;
	Wed, 23 Sep 2026 13:55:12 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCx9cy7abNqphMkAA--.48859S9;
	Wed, 23 Sep 2026 13:55:12 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] LoongArch: Fix one-shot limitation for perf hardware breakpoints
Date: Wed, 23 Sep 2026 13:55:06 +0800
Message-ID: <20260923055506.29221-8-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260923055506.29221-1-yangtiezhu@loongson.cn>
References: <20260923055506.29221-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx9cy7abNqphMkAA--.48859S9
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3AF4fGr47Wr1xZF4DXw1kZwc_yoWfZFWrpF
	9rAr1kKr40kr1fu3Zxtw4Dur43tFs7ua12qFyfKa4Syw1qgryfJFn2kF9rXFy5Xws5Wa4I
	qw1Skwsaga1UXabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

In breakpoint_handler() and watchpoint_handler(), the code disables the
hardware slot by executing update_bp_registers(regs, 0, ...). This design
forces the active hardware breakpoint configuration to be wiped out upon
its first hit, turning standard perf hardware breakpoints into "one-shot"
events.

Furthermore, while the ptrace single-step path in do_watch() executes a
hardware single-step skip mechanism to advance the PC, the standard perf
path lacks any mechanism to bypass the original triggering instruction.

To maintain the long-term persistence of hardware breakpoints for perf
usage, eliminate the disruptive calls to update_bp_registers() within
the handler loops to keep the breakpoint configuration enabled.

Concurrently, execute a single, unified register write outside the loop
to atomize the state transition and explicitly enforce the hardware skip
mechanism once per exception return, ensuring the processor safely steps
forward without lockups.

Meanwhile, in order to prevent status contamination during single-core
context switches or cross-core thread migrations, the hardware register
skip state of the previous thread is saved first. Then, the skip state
is restored and its software skip flag is also cleared only if the next
thread has the skip flag; otherwise, 0 is written to clear the FWPS and
MWPS registers, which explicitly clears the skip bit according to the
architectural specification.

Additionally, explicitly clear hbp_break_skip and hbp_watch_skip inside
copy_thread() during task creation. This guarantees that a newly cloned
child task starts with a clean slate.

Here is a user-space reproducer to demonstrate the issue.

(1) Test program (test_perf_continuous.c):

  #include <stdio.h>
  #include <unistd.h>
  #include <sys/syscall.h>
  #include <sys/ioctl.h>
  #include <linux/perf_event.h>
  #include <linux/hw_breakpoint.h>

  static int var = 0;

  int main(void)
  {
  	size_t count = 0;
  	struct perf_event_attr attr = {
  		.type = PERF_TYPE_BREAKPOINT,
  		.size = sizeof(attr),
  		.bp_type = HW_BREAKPOINT_W,
  		.bp_addr = (unsigned long)&var,
  		.bp_len = HW_BREAKPOINT_LEN_1,
  		.exclude_kernel = 1,
  	};

  	int fd = syscall(__NR_perf_event_open, &attr, 0, -1, -1, 0);
  	ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);

  	asm volatile("st.b %1, %0" : "=m"(var) : "r"(11) : "memory");
  	asm volatile("st.b %1, %0" : "=m"(var) : "r"(22) : "memory");
  	asm volatile("st.b %1, %0" : "=m"(var) : "r"(33) : "memory");

  	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
  	read(fd, &count, sizeof(size_t));

  	printf("Watchpoint counts: expected = 3, actual = %zu\n", count);

  	close(fd);
  	return 0;
  }

(2) Test steps:

  $ gcc test_perf_continuous.c -o test_perf_continuous
  $ ./test_perf_continuous

(3) Test results:

Without this patch:

  Watchpoint counts: expected = 3, actual = 1

With this patch:

  Watchpoint counts: expected = 3, actual = 3

Fixes: 3eb2a8b23598 ("LoongArch: Fix multiple hardware watchpoint issues")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/hw_breakpoint.h |  4 +--
 arch/loongarch/include/asm/loongarch.h     |  3 ++
 arch/loongarch/include/asm/processor.h     |  3 ++
 arch/loongarch/include/asm/switch_to.h     |  2 +-
 arch/loongarch/kernel/hw_breakpoint.c      | 36 +++++++++++++++++++---
 arch/loongarch/kernel/process.c            |  3 ++
 6 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/include/asm/hw_breakpoint.h
index e7a6606c86cc..16be0de90160 100644
--- a/arch/loongarch/include/asm/hw_breakpoint.h
+++ b/arch/loongarch/include/asm/hw_breakpoint.h
@@ -120,9 +120,9 @@ bool breakpoint_handler(struct pt_regs *regs);
 bool watchpoint_handler(struct pt_regs *regs);
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-extern void hw_breakpoint_thread_switch(struct task_struct *next);
+extern void hw_breakpoint_thread_switch(struct task_struct *prev, struct task_struct *next);
 #else
-static inline void hw_breakpoint_thread_switch(struct task_struct *next)
+static inline void hw_breakpoint_thread_switch(struct task_struct *prev, struct task_struct *next)
 {
 }
 #endif
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 32bbff337c5c..28eff8b49d1b 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1133,6 +1133,9 @@
 #define CSR_FWPS_SKIP_SHIFT		16
 #define CSR_FWPS_SKIP			(_ULCAST_(1) << CSR_FWPS_SKIP_SHIFT)
 
+#define CSR_MWPS_SKIP_SHIFT		16
+#define CSR_MWPS_SKIP			(_ULCAST_(1) << CSR_MWPS_SKIP_SHIFT)
+
 /*
  * CSR_ECFG IM
  */
diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/include/asm/processor.h
index 94c5ce9b1d24..cc1d1ed491eb 100644
--- a/arch/loongarch/include/asm/processor.h
+++ b/arch/loongarch/include/asm/processor.h
@@ -135,6 +135,9 @@ struct thread_struct {
 	struct perf_event *hbp_break[LOONGARCH_MAX_BRP];
 	struct perf_event *hbp_watch[LOONGARCH_MAX_WRP];
 
+	bool hbp_break_skip;
+	bool hbp_watch_skip;
+
 	/*
 	 * FPU & vector registers, must be at the last of inherited
 	 * context because they are conditionally copied at fork().
diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
index 27acbf913774..ab9e0292c7f3 100644
--- a/arch/loongarch/include/asm/switch_to.h
+++ b/arch/loongarch/include/asm/switch_to.h
@@ -34,7 +34,7 @@ extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
 do {										\
 	lose_fpu_inatomic(1, prev);						\
 	lose_lbt_inatomic(1, prev);						\
-	hw_breakpoint_thread_switch(next);					\
+	hw_breakpoint_thread_switch(prev, next);				\
 	set_current(next);							\
 	(last) = __switch_to(prev, next,					\
 		 __builtin_return_address(0), __builtin_frame_address(0));	\
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 1d881b2c2a50..3931a339ace6 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -481,6 +481,7 @@ bool breakpoint_handler(struct pt_regs *regs)
 	int i;
 	struct perf_event *bp, **slots;
 	bool need_sigtrap = false;
+	unsigned int clear_mask = 0;
 
 	slots = this_cpu_ptr(bp_on_reg);
 
@@ -494,11 +495,13 @@ bool breakpoint_handler(struct pt_regs *regs)
 			if (bp->attr.sigtrap)
 				need_sigtrap = true;
 
-			csr_write32(0x1 << i, LOONGARCH_CSR_FWPS);
-			update_bp_registers(regs, 0, 0);
+			clear_mask |= (0x1 << i);
 		}
 	}
 
+	if (clear_mask)
+		csr_write32(clear_mask | CSR_FWPS_SKIP, LOONGARCH_CSR_FWPS);
+
 	return need_sigtrap;
 }
 NOKPROBE_SYMBOL(breakpoint_handler);
@@ -508,6 +511,7 @@ bool watchpoint_handler(struct pt_regs *regs)
 	int i;
 	struct perf_event *wp, **slots;
 	bool need_sigtrap = false;
+	unsigned int clear_mask = 0;
 
 	slots = this_cpu_ptr(wp_on_reg);
 
@@ -521,11 +525,13 @@ bool watchpoint_handler(struct pt_regs *regs)
 			if (wp->attr.sigtrap)
 				need_sigtrap = true;
 
-			csr_write32(0x1 << i, LOONGARCH_CSR_MWPS);
-			update_bp_registers(regs, 0, 1);
+			clear_mask |= (0x1 << i);
 		}
 	}
 
+	if (clear_mask)
+		csr_write32(clear_mask | CSR_MWPS_SKIP, LOONGARCH_CSR_MWPS);
+
 	return need_sigtrap;
 }
 NOKPROBE_SYMBOL(watchpoint_handler);
@@ -549,7 +555,7 @@ static int __init arch_hw_breakpoint_init(void)
 }
 arch_initcall(arch_hw_breakpoint_init);
 
-void hw_breakpoint_thread_switch(struct task_struct *next)
+void hw_breakpoint_thread_switch(struct task_struct *prev, struct task_struct *next)
 {
 	u64 addr, mask;
 	struct pt_regs *regs = task_pt_regs(next);
@@ -561,6 +567,26 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
 			csr_write32(CSR_FWPS_SKIP, LOONGARCH_CSR_FWPS);
 		regs->csr_prmd |= CSR_PRMD_PWE;
 	} else {
+		unsigned int fwps = csr_read32(LOONGARCH_CSR_FWPS);
+		unsigned int mwps = csr_read32(LOONGARCH_CSR_MWPS);
+
+		prev->thread.hbp_break_skip = !!(fwps & CSR_FWPS_SKIP);
+		prev->thread.hbp_watch_skip = !!(mwps & CSR_MWPS_SKIP);
+
+		if (next->thread.hbp_break_skip) {
+			csr_write32(CSR_FWPS_SKIP, LOONGARCH_CSR_FWPS);
+			next->thread.hbp_break_skip = 0;
+		} else {
+			csr_write32(0, LOONGARCH_CSR_FWPS);
+		}
+
+		if (next->thread.hbp_watch_skip) {
+			csr_write32(CSR_MWPS_SKIP, LOONGARCH_CSR_MWPS);
+			next->thread.hbp_watch_skip = 0;
+		} else {
+			csr_write32(0, LOONGARCH_CSR_MWPS);
+		}
+
 		/* Update breakpoints */
 		update_bp_registers(regs, 1, 0);
 		/* Update watchpoints */
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 199c951a2e27..5e17e68e495a 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -226,6 +226,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->regs[2] = tls;
 
 out:
+	p->thread.hbp_break_skip = 0;
+	p->thread.hbp_watch_skip = 0;
+
 	clear_tsk_thread_flag(p, TIF_USEDFPU);
 	clear_tsk_thread_flag(p, TIF_USEDSIMD);
 	clear_tsk_thread_flag(p, TIF_USEDLBT);
-- 
2.42.0

