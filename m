Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABCA645
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 04:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D03C433D6;
	Tue, 27 Sep 2022 04:59:28 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jun Yi <yijun@loongson.cn>
Subject: [PATCH] LoongArch: Fix and cleanup csr_era handling in do_ri()
Date: Tue, 27 Sep 2022 12:58:20 +0800
Message-Id: <20220927045820.2770062-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't emulate reserved instructions and just send a signal to the
current process now. So we don't need to call compute_return_era() to
add 4 (point to the next instruction) to csr_era in pt_regs. RA/ERA's
backup/restore is cleaned up as well.

Signed-off-by: Jun Yi <yijun@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/traps.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index aa1c95aaf595..5010e95cef84 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -461,11 +461,9 @@ asmlinkage void noinstr do_watch(struct pt_regs *regs)
 
 asmlinkage void noinstr do_ri(struct pt_regs *regs)
 {
-	int status = -1;
+	int status = SIGILL;
 	unsigned int opcode = 0;
 	unsigned int __user *era = (unsigned int __user *)exception_era(regs);
-	unsigned long old_era = regs->csr_era;
-	unsigned long old_ra = regs->regs[1];
 	irqentry_state_t state = irqentry_enter(regs);
 
 	local_irq_enable();
@@ -477,21 +475,12 @@ asmlinkage void noinstr do_ri(struct pt_regs *regs)
 
 	die_if_kernel("Reserved instruction in kernel code", regs);
 
-	compute_return_era(regs);
-
 	if (unlikely(get_user(opcode, era) < 0)) {
 		status = SIGSEGV;
 		current->thread.error_code = 1;
 	}
 
-	if (status < 0)
-		status = SIGILL;
-
-	if (unlikely(status > 0)) {
-		regs->csr_era = old_era;		/* Undo skip-over.  */
-		regs->regs[1] = old_ra;
-		force_sig(status);
-	}
+	force_sig(status);
 
 out:
 	local_irq_disable();
-- 
2.31.1

