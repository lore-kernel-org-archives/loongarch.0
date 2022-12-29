Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228EF137B
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 06:15:45 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxlfCQMK1jKTMJAA--.19917S3;
	Thu, 29 Dec 2022 14:15:44 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxrb6OMK1jIiYPAA--.24618S4;
	Thu, 29 Dec 2022 14:15:43 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Qing Zhang <zhangqing@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/6] LoongArch: Use correct sp value to get graph addr in unwinder guess
Date: Thu, 29 Dec 2022 14:15:13 +0800
Message-Id: <20221229061516.31671-3-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221229061516.31671-1-hejinyang@loongson.cn>
References: <20221229061516.31671-1-hejinyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxrb6OMK1jIiYPAA--.24618S4
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Gw1fAFWUCF43CF43XFWfuFg_yoWxJr4kpF
	9xCas3GrWxWryqgrnrXr1jvrn5Crn2kw12gFyDJ34FkFnrXry3Grn0v3yqvF4DJ3y8Wr48
	XFn5GrW5KanrG3JanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxU4AhLUUUUU

The stack frame when function_graph enable like follows,

---------  <- function sp_on_entry
    |
    |
    |
 FAKE_RA   <- sp_on_entry - sizeof(pt_regs) + PT_R1
    |
---------  <- sp_on_entry - sizeof(pt_regs)

So if we want to get the &FAKE_RA we should get sp_on_entry first.
In unwinder_prologue case, we can get the sp_on_entry as state->sp,
because we try to calculate each CFA and the ra saved address.
But in unwinder_guess case, we cannot get it because we do not try
to calculate the CFA. Although LoongArch have not fixed frame, the
$ra is saved at CFA - 8 in most cases, we can try guess, too.
As we store the pc in state, we not need to dereference state->sp, too.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/loongarch/include/asm/ftrace.h     |  2 --
 arch/loongarch/include/asm/unwind.h     |  9 +++++++++
 arch/loongarch/kernel/unwind_guess.c    | 12 ++++--------
 arch/loongarch/kernel/unwind_prologue.c | 22 ++++++----------------
 4 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/arch/loongarch/include/asm/ftrace.h b/arch/loongarch/include/asm/ftrace.h
index 90f9d3399b2a..3418d32d4fc7 100644
--- a/arch/loongarch/include/asm/ftrace.h
+++ b/arch/loongarch/include/asm/ftrace.h
@@ -10,8 +10,6 @@
 #define FTRACE_REGS_PLT_IDX	1
 #define NR_FTRACE_PLTS		2
 
-#define GRAPH_FAKE_OFFSET (sizeof(struct pt_regs) - offsetof(struct pt_regs, regs[1]))
-
 #ifdef CONFIG_FUNCTION_TRACER
 
 #define MCOUNT_INSN_SIZE 4		/* sizeof mcount call */
diff --git a/arch/loongarch/include/asm/unwind.h b/arch/loongarch/include/asm/unwind.h
index f2b52b9ea93d..6ece48f0ff77 100644
--- a/arch/loongarch/include/asm/unwind.h
+++ b/arch/loongarch/include/asm/unwind.h
@@ -7,8 +7,10 @@
 #ifndef _ASM_UNWIND_H
 #define _ASM_UNWIND_H
 
+#include <linux/ftrace.h>
 #include <linux/sched.h>
 
+#include <asm/ptrace.h>
 #include <asm/stacktrace.h>
 
 enum unwinder_type {
@@ -40,4 +42,11 @@ static inline bool unwind_error(struct unwind_state *state)
 	return state->error;
 }
 
+#define GRAPH_FAKE_OFFSET (sizeof(struct pt_regs) - offsetof(struct pt_regs, regs[1]))
+static inline unsigned long unwind_graph_addr(struct unwind_state *state,
+					unsigned long pc, unsigned long cfa)
+{
+	return ftrace_graph_ret_addr(state->task, &state->graph_idx,
+				     pc, (unsigned long *)(cfa - GRAPH_FAKE_OFFSET));
+}
 #endif /* _ASM_UNWIND_H */
diff --git a/arch/loongarch/kernel/unwind_guess.c b/arch/loongarch/kernel/unwind_guess.c
index a1bc7c852000..935d24f8c95c 100644
--- a/arch/loongarch/kernel/unwind_guess.c
+++ b/arch/loongarch/kernel/unwind_guess.c
@@ -11,10 +11,7 @@ unsigned long unwind_get_return_address(struct unwind_state *state)
 {
 	if (unwind_done(state))
 		return 0;
-	else if (state->first)
-		return state->pc;
-
-	return *(unsigned long *)(state->sp);
+	return state->pc;
 }
 EXPORT_SYMBOL_GPL(unwind_get_return_address);
 
@@ -36,7 +33,7 @@ void unwind_start(struct unwind_state *state, struct task_struct *task,
 
 	state->task = task;
 	state->first = true;
-
+	state->pc = unwind_graph_addr(state, state->pc, state->sp);
 	get_stack_info(state->sp, state->task, &state->stack_info);
 
 	if (!unwind_done(state) && !__kernel_text_address(state->pc))
@@ -60,9 +57,8 @@ bool unwind_next_frame(struct unwind_state *state)
 		     state->sp < info->end;
 		     state->sp += sizeof(unsigned long)) {
 			addr = *(unsigned long *)(state->sp);
-			state->pc = ftrace_graph_ret_addr(state->task, &state->graph_idx,
-					addr, (unsigned long *)(state->sp - GRAPH_FAKE_OFFSET));
-			if (__kernel_text_address(addr))
+			state->pc = unwind_graph_addr(state, addr, state->sp + 8);
+			if (__kernel_text_address(state->pc))
 				return true;
 		}
 
diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index b8b830b69a48..3fbb9c65d64e 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -21,16 +21,9 @@ static inline void unwind_state_fixup(struct unwind_state *state)
 
 unsigned long unwind_get_return_address(struct unwind_state *state)
 {
-
 	if (unwind_done(state))
 		return 0;
-	else if (state->type)
-		return state->pc;
-	else if (state->first)
-		return state->pc;
-
-	return *(unsigned long *)(state->sp);
-
+	return state->pc;
 }
 EXPORT_SYMBOL_GPL(unwind_get_return_address);
 
@@ -43,9 +36,8 @@ static bool unwind_by_guess(struct unwind_state *state)
 	     state->sp < info->end;
 	     state->sp += sizeof(unsigned long)) {
 		addr = *(unsigned long *)(state->sp);
-		state->pc = ftrace_graph_ret_addr(state->task, &state->graph_idx,
-				addr, (unsigned long *)(state->sp - GRAPH_FAKE_OFFSET));
-		if (__kernel_text_address(addr))
+		state->pc = unwind_graph_addr(state, addr, state->sp + 8);
+		if (__kernel_text_address(state->pc))
 			return true;
 	}
 
@@ -161,7 +153,7 @@ void unwind_start(struct unwind_state *state, struct task_struct *task,
 
 	state->task = task;
 	state->first = true;
-
+	state->pc = unwind_graph_addr(state, state->pc, state->sp);
 	get_stack_info(state->sp, state->task, &state->stack_info);
 
 	if (!unwind_done(state) && !__kernel_text_address(state->pc))
@@ -188,8 +180,7 @@ bool unwind_next_frame(struct unwind_state *state)
 
 		case UNWINDER_PROLOGUE:
 			if (unwind_by_prologue(state)) {
-				state->pc = ftrace_graph_ret_addr(state->task, &state->graph_idx,
-						state->pc, (unsigned long *)(state->sp - GRAPH_FAKE_OFFSET));
+				state->pc = unwind_graph_addr(state, state->pc, state->sp);
 				return true;
 			}
 
@@ -204,8 +195,7 @@ bool unwind_next_frame(struct unwind_state *state)
 				state->first = true;
 				state->ra = regs->regs[1];
 				state->sp = regs->regs[3];
-				state->pc = ftrace_graph_ret_addr(state->task, &state->graph_idx,
-						pc, (unsigned long *)(state->sp - GRAPH_FAKE_OFFSET));
+				state->pc = pc;
 				get_stack_info(state->sp, state->task, info);
 
 				return true;
-- 
2.34.3

