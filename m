Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAF8538A
	for <loongarch@lists.linux.dev>; Sun, 26 Nov 2023 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8AxXOqjNWNlmts8AA--.28072S3;
	Sun, 26 Nov 2023 20:10:12 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxvi+hNWNlqdlMAA--.38908S2;
	Sun, 26 Nov 2023 20:10:10 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Set unwind stack type to unknown rather than set error flag
Date: Sun, 26 Nov 2023 20:10:02 +0800
Message-Id: <20231126121002.22568-1-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxvi+hNWNlqdlMAA--.38908S2
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF4xWw1UGrWrKrW8AFW7KFX_yoW5JF1kpr
	ZxA3Z3Wr4YgF92q3srtry8uryDXwnrCw13Wa4qyFyrCFnrXry2vw4Fva4DZF4qq3s5G34F
	vFn5G3s0ga1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU7fMaUUUUU

During the unwinding, unwind_done() is used as an end condition. Normally
it unwind to the user stack and then set the stack type to unknown, which
is a normal exit. When something unexpected happens in unwind process and
we cannot unwind anymore, we should set the error flag, and also set the
stack type to unknown to indicate that the unwind process cannot continue.
The error flag emphasizes that the unwind process produce an unexpected
error. There is no unexpected things when we unwind the PT_REGS in the
top of IRQ stack and find out that is an user mode PT_REGS. Thus, we
should not set error flag and just set stack type to unknown.

Reported-by: Hengqi Chen <hengqi.chen@gmail.com>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/loongarch/kernel/stacktrace.c      | 2 +-
 arch/loongarch/kernel/unwind.c          | 1 -
 arch/loongarch/kernel/unwind_prologue.c | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/stacktrace.c
index 92270f14db94..f623feb2129f 100644
--- a/arch/loongarch/kernel/stacktrace.c
+++ b/arch/loongarch/kernel/stacktrace.c
@@ -32,7 +32,7 @@ void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 	}
 
 	for (unwind_start(&state, task, regs);
-	     !unwind_done(&state) && !unwind_error(&state); unwind_next_frame(&state)) {
+	     !unwind_done(&state); unwind_next_frame(&state)) {
 		addr = unwind_get_return_address(&state);
 		if (!addr || !consume_entry(cookie, addr))
 			break;
diff --git a/arch/loongarch/kernel/unwind.c b/arch/loongarch/kernel/unwind.c
index ba324ba76fa1..a463d6961344 100644
--- a/arch/loongarch/kernel/unwind.c
+++ b/arch/loongarch/kernel/unwind.c
@@ -28,6 +28,5 @@ bool default_next_frame(struct unwind_state *state)
 
 	} while (!get_stack_info(state->sp, state->task, info));
 
-	state->error = true;
 	return false;
 }
diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index 55afc27320e1..929ae240280a 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -227,7 +227,7 @@ static bool next_frame(struct unwind_state *state)
 	} while (!get_stack_info(state->sp, state->task, info));
 
 out:
-	state->error = true;
+	state->stack_info.type = STACK_TYPE_UNKNOWN;
 	return false;
 }
 
-- 
2.42.0

