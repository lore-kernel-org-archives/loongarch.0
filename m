Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F041217F1
	for <loongarch@lists.linux.dev>; Thu, 15 Dec 2022 04:02:17 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8AxSulGnJpj37kFAA--.10069S3;
	Thu, 15 Dec 2022 12:02:14 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtOVDnJpjVBkAAA--.887S3;
	Thu, 15 Dec 2022 12:02:14 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Qing Zhang <zhangqing@loongson.cn>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/6] LoongArch: Get frame info in unwind_start when regs is not supported
Date: Thu, 15 Dec 2022 12:01:36 +0800
Message-Id: <20221215040141.18610-2-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221215040141.18610-1-hejinyang@loongson.cn>
References: <20221215040141.18610-1-hejinyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxtOVDnJpjVBkAAA--.887S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCr1rKFykXr47urWrCrWktFb_yoW5ZFy5p3
	sxCrsxWr45uF9Fqr9rtw1kZr95Grn7uw12gF9rt34rC3W7XFyxurnYv34DZFs8t3yvgw10
	qFn5KrW5Ka1UJaUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUc-eODUUUU

At unwind_start, it is better to try to get its frame info even we not
support regs rather than get them outside. So that we can simply use
unwind_{start, next_frame, done} outside.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/loongarch/kernel/process.c         | 12 +++---------
 arch/loongarch/kernel/unwind_guess.c    |  6 ++++++
 arch/loongarch/kernel/unwind_prologue.c | 16 +++++++++++++---
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 502b8b950057..6ef45174ad35 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -197,20 +197,14 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 unsigned long __get_wchan(struct task_struct *task)
 {
-	unsigned long pc;
+	unsigned long pc = 0;
 	struct unwind_state state;
 
 	if (!try_get_task_stack(task))
 		return 0;
 
-	unwind_start(&state, task, NULL);
-	state.sp = thread_saved_fp(task);
-	get_stack_info(state.sp, state.task, &state.stack_info);
-	state.pc = thread_saved_ra(task);
-#ifdef CONFIG_UNWINDER_PROLOGUE
-	state.type = UNWINDER_PROLOGUE;
-#endif
-	for (; !unwind_done(&state); unwind_next_frame(&state)) {
+	for (unwind_start(&state, task, NULL); !unwind_done(&state);
+	     unwind_next_frame(&state)) {
 		pc = unwind_get_return_address(&state);
 		if (!pc)
 			break;
diff --git a/arch/loongarch/kernel/unwind_guess.c b/arch/loongarch/kernel/unwind_guess.c
index e2d2e4f3001f..e03864511582 100644
--- a/arch/loongarch/kernel/unwind_guess.c
+++ b/arch/loongarch/kernel/unwind_guess.c
@@ -26,6 +26,12 @@ void unwind_start(struct unwind_state *state, struct task_struct *task,
 	if (regs) {
 		state->sp = regs->regs[3];
 		state->pc = regs->csr_era;
+	} else if (task == current) {
+		state->sp = (unsigned long)__builtin_frame_address(0);
+		state->pc = (unsigned long)__builtin_return_address(0);
+	} else {
+		state->sp = thread_saved_fp(task);
+		state->pc = thread_saved_ra(task);
 	}
 
 	state->task = task;
diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index 0f8d1451ebb8..9d51ea37782e 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -141,12 +141,22 @@ void unwind_start(struct unwind_state *state, struct task_struct *task,
 		    struct pt_regs *regs)
 {
 	memset(state, 0, sizeof(*state));
+	state->type = UNWINDER_PROLOGUE;
 
-	if (regs &&  __kernel_text_address(regs->csr_era)) {
-		state->pc = regs->csr_era;
+	if (regs) {
 		state->sp = regs->regs[3];
+		state->pc = regs->csr_era;
 		state->ra = regs->regs[1];
-		state->type = UNWINDER_PROLOGUE;
+		if (!__kernel_text_address(state->pc))
+			state->type = UNWINDER_GUESS;
+	} else if (task == current) {
+		state->sp = (unsigned long)__builtin_frame_address(0);
+		state->pc = (unsigned long)__builtin_return_address(0);
+		state->ra = 0;
+	} else {
+		state->sp = thread_saved_fp(task);
+		state->pc = thread_saved_ra(task);
+		state->ra = 0;
 	}
 
 	state->task = task;
-- 
2.34.3

