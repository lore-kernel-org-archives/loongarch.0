Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F1840DB5E
	for <loongarch@lists.linux.dev>; Wed, 23 Sep 2026 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142978; cv=none; b=iRcG0AXca/oQMX1QLMO/z65ajph4Y29If7sL5qPHgE40WUaHHqUz/UZlABA4lYROeH7f/ZMBHQwXQzz/l4COJ0/eyCP4JSTZ5D2HtEYdmnxC8eHPFt4an+F3tb+d4x0E6qr0zFtBkHYZUMHOsXLg1Bbrp8T5OmGtebLOUrocorw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142978; c=relaxed/simple;
	bh=ubI8nU68TcLfAsEaCAATmWbEBhfvxq+CKFd/wp8TRLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsmk5eAVJ2retccwlxusurPxfWzjo7f77dVO3IMFtLJg1U+iYI0WHGWyUFL1TJbVfZhZ25l7yitFEN5qLtOJij+/WBIxv+cYo0ZuLHmkOUY9roJArXwdpwsrA6kxasmsbzrBM2xEYZ0JJPzDz1Qh34+MRplP/XZm2NbXDX7PVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxjdK_abNqnu0OAA--.43496S3;
	Wed, 23 Sep 2026 13:55:11 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCx9cy7abNqphMkAA--.48859S8;
	Wed, 23 Sep 2026 13:55:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] LoongArch: Fix thread_struct layout for hbp_break and hbp_watch
Date: Wed, 23 Sep 2026 13:55:05 +0800
Message-ID: <20260923055506.29221-7-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJCx9cy7abNqphMkAA--.48859S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF15KrW3ur47tFyrAw47GFX_yoWrtw4DpF
	9rCw1ktr48Kr18uwnrJ3ykZr17trn7WF42ga43tayayr1qgw45XryvyFyDZFW5J3WF9a4I
	qrnIgws0ga1DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

According to the architectural code comment in processor.h, FPU and vector
registers must be located at the very end of the inherited context within
struct thread_struct because they are conditionally copied during fork().

However, hbp_break and hbp_watch arrays were erroneously placed after the
fpu and lbt fields. Due to the partial memcpy optimization which are used
in arch_dup_task_struct(), the hardware breakpoint members were silently
truncated and ignored during task duplication, accidentally relying on a
subsequent ptrace_hw_copy_thread() to clear the uninitialized pointers
with memset.

Fix this by moving hbp_break and hbp_watch arrays up before the fpu field,
strictly adhering to the established layout convention. This ensures state
cloning boundaries via the native kernel memcpy. Then, remove the helper
ptrace_hw_copy_thread() and its caller to clean up the code.

Fixes: edffa33c7bb5 ("LoongArch: Add hardware breakpoints/watchpoints support")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/hw_breakpoint.h |  4 ----
 arch/loongarch/include/asm/processor.h     | 13 +++++++------
 arch/loongarch/kernel/hw_breakpoint.c      |  6 ------
 arch/loongarch/kernel/process.c            |  1 -
 4 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/include/asm/hw_breakpoint.h
index d202052df8a1..e7a6606c86cc 100644
--- a/arch/loongarch/include/asm/hw_breakpoint.h
+++ b/arch/loongarch/include/asm/hw_breakpoint.h
@@ -120,12 +120,8 @@ bool breakpoint_handler(struct pt_regs *regs);
 bool watchpoint_handler(struct pt_regs *regs);
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-extern void ptrace_hw_copy_thread(struct task_struct *task);
 extern void hw_breakpoint_thread_switch(struct task_struct *next);
 #else
-static inline void ptrace_hw_copy_thread(struct task_struct *task)
-{
-}
 static inline void hw_breakpoint_thread_switch(struct task_struct *next)
 {
 }
diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/include/asm/processor.h
index ce8b953f8c79..94c5ce9b1d24 100644
--- a/arch/loongarch/include/asm/processor.h
+++ b/arch/loongarch/include/asm/processor.h
@@ -128,18 +128,19 @@ struct thread_struct {
 	unsigned long trap_nr;
 	unsigned long error_code;
 	unsigned long single_step; /* Used by PTRACE_SINGLESTEP */
+
 	struct loongarch_vdso_info *vdso;
 
+	/* Hardware breakpoints pinned to this task. */
+	struct perf_event *hbp_break[LOONGARCH_MAX_BRP];
+	struct perf_event *hbp_watch[LOONGARCH_MAX_WRP];
+
 	/*
 	 * FPU & vector registers, must be at the last of inherited
 	 * context because they are conditionally copied at fork().
 	 */
 	struct loongarch_fpu fpu FPU_ALIGN;
 	struct loongarch_lbt lbt; /* Also conditionally copied */
-
-	/* Hardware breakpoints pinned to this task. */
-	struct perf_event *hbp_break[LOONGARCH_MAX_BRP];
-	struct perf_event *hbp_watch[LOONGARCH_MAX_WRP];
 };
 
 #define thread_saved_ra(tsk)	(tsk->thread.sched_ra)
@@ -173,6 +174,8 @@ struct thread_struct {
 	 */							\
 	.trap_nr		= 0,				\
 	.error_code		= 0,				\
+	.hbp_break		= {0},				\
+	.hbp_watch		= {0},				\
 	/*							\
 	 * FPU & vector registers				\
 	 */							\
@@ -182,8 +185,6 @@ struct thread_struct {
 		.ftop		= 0,				\
 		.fpr		= {{{0,},},},			\
 	},							\
-	.hbp_break		= {0},				\
-	.hbp_watch		= {0},				\
 }
 
 struct task_struct;
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 9dcb122218c2..1d881b2c2a50 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -154,12 +154,6 @@ static int hw_breakpoint_slot_setup(struct perf_event **slots, int max_slots,
 	return -ENOSPC;
 }
 
-void ptrace_hw_copy_thread(struct task_struct *tsk)
-{
-	memset(tsk->thread.hbp_break, 0, sizeof(tsk->thread.hbp_break));
-	memset(tsk->thread.hbp_watch, 0, sizeof(tsk->thread.hbp_watch));
-}
-
 /*
  * Unregister breakpoints from this task and reset the pointers in the thread_struct.
  */
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index baa683fbfc53..199c951a2e27 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -226,7 +226,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->regs[2] = tls;
 
 out:
-	ptrace_hw_copy_thread(p);
 	clear_tsk_thread_flag(p, TIF_USEDFPU);
 	clear_tsk_thread_flag(p, TIF_USEDSIMD);
 	clear_tsk_thread_flag(p, TIF_USEDLBT);
-- 
2.42.0

