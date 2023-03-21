Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98B11FA0
	for <loongarch@lists.linux.dev>; Tue, 21 Mar 2023 06:29:19 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxJFy8Thlk7UMPAA--.22737S3;
	Tue, 21 Mar 2023 14:29:17 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxAeW7Thlk20UIAA--.35478S2;
	Tue, 21 Mar 2023 14:29:15 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Guenter Roeck <linux@roeck-us.net>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] LoongArch: Check unwind_error() in arch_stack_walk()
Date: Tue, 21 Mar 2023 14:29:14 +0800
Message-Id: <1679380154-20308-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxAeW7Thlk20UIAA--.35478S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAFy7uFy7Xr47Cw1kGFy3Jwb_yoW5Xr1xpr
	ZrZ3Z3Wr4ruF9Fqa4Dtw18ur98J3s7ur12gas8Aa4rCFnrXry2grnava4DZF4qy34kG340
	gFnYkr909a1UJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

We can see the following messages with CONFIG_PROVE_LOCKING=y on
LoongArch:

  BUG: MAX_STACK_TRACE_ENTRIES too low!
  turning off the locking correctness validator.

This is because stack_trace_save() returns a big value after call
arch_stack_walk(), here is the call trace:

  save_trace()
    stack_trace_save()
      arch_stack_walk()
        stack_trace_consume_entry()

arch_stack_walk() should return immediately if unwind_next_frame()
failed, no need to do the useless loops to increase the value of
c->len in stack_trace_consume_entry(), then we can fix the above
problem.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/8a44ad71-68d2-4926-892f-72bfc7a67e2a@roeck-us.net/
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/stacktrace.c      | 3 ++-
 arch/loongarch/kernel/unwind.c          | 1 +
 arch/loongarch/kernel/unwind_prologue.c | 4 +++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/stacktrace.c
index 3a690f9..7c15ba5 100644
--- a/arch/loongarch/kernel/stacktrace.c
+++ b/arch/loongarch/kernel/stacktrace.c
@@ -30,7 +30,8 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 
 	regs->regs[1] = 0;
 	for (unwind_start(&state, task, regs);
-	      !unwind_done(&state); unwind_next_frame(&state)) {
+	     !unwind_done(&state) && !unwind_error(&state);
+	     unwind_next_frame(&state)) {
 		addr = unwind_get_return_address(&state);
 		if (!addr || !consume_entry(cookie, addr))
 			break;
diff --git a/arch/loongarch/kernel/unwind.c b/arch/loongarch/kernel/unwind.c
index a463d69..ba324ba 100644
--- a/arch/loongarch/kernel/unwind.c
+++ b/arch/loongarch/kernel/unwind.c
@@ -28,5 +28,6 @@ bool default_next_frame(struct unwind_state *state)
 
 	} while (!get_stack_info(state->sp, state->task, info));
 
+	state->error = true;
 	return false;
 }
diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index 9095fde..55afc27 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -211,7 +211,7 @@ static bool next_frame(struct unwind_state *state)
 			pc = regs->csr_era;
 
 			if (user_mode(regs) || !__kernel_text_address(pc))
-				return false;
+				goto out;
 
 			state->first = true;
 			state->pc = pc;
@@ -226,6 +226,8 @@ static bool next_frame(struct unwind_state *state)
 
 	} while (!get_stack_info(state->sp, state->task, info));
 
+out:
+	state->error = true;
 	return false;
 }
 
-- 
2.1.0

