Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CDD2116
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 06:39:14 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxsfAQg31k8gUAAA--.196S3;
	Mon, 05 Jun 2023 14:39:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axa9YPg31kHQcAAA--.72S3;
	Mon, 05 Jun 2023 14:39:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v5 1/6] LoongArch: Move three functions from kprobes.c to inst.c
Date: Mon,  5 Jun 2023 14:39:05 +0800
Message-Id: <1685947150-4949-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1685947150-4949-1-git-send-email-yangtiezhu@loongson.cn>
References: <1685947150-4949-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Axa9YPg31kHQcAAA--.72S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXrWkCF4fJw4Utw1xCryxCrX_yoWrKr1fpF
	47u3WfJr48WFn3XryDJw4Yvr1Fkrsa93sFqF17JayfKry2qr15tF1kKrZYvF98K3y2kr4I
	qF1Yyry5W3WfAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

The functions insns_not_supported(), insns_need_simulation()
and arch_simulate_insn() will be used for uprobes, move them
from kprobes.c to inst.c, this is preparation for later patch,
no functionality change.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Jeff Xie <xiehuan09@gmail.com>
---
 arch/loongarch/include/asm/inst.h |  4 ++++
 arch/loongarch/kernel/inst.c      | 39 +++++++++++++++++++++++++++++++++
 arch/loongarch/kernel/kprobes.c   | 46 ++-------------------------------------
 3 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index b09887ff..c9e5435 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -435,6 +435,10 @@ static inline bool is_self_loop_ins(union loongarch_instruction *ip, struct pt_r
 void simu_pc(struct pt_regs *regs, union loongarch_instruction insn);
 void simu_branch(struct pt_regs *regs, union loongarch_instruction insn);
 
+bool insns_not_supported(union loongarch_instruction insn);
+bool insns_need_simulation(union loongarch_instruction insn);
+void arch_simulate_insn(union loongarch_instruction insn, struct pt_regs *regs);
+
 int larch_insn_read(void *addr, u32 *insnp);
 int larch_insn_write(void *addr, u32 insn);
 int larch_insn_patch_text(void *addr, u32 insn);
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 258ef26..6f61956 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -133,6 +133,45 @@ void simu_branch(struct pt_regs *regs, union loongarch_instruction insn)
 	}
 }
 
+bool insns_not_supported(union loongarch_instruction insn)
+{
+	switch (insn.reg2i14_format.opcode) {
+	case llw_op:
+	case lld_op:
+	case scw_op:
+	case scd_op:
+		pr_notice("ll and sc instructions are not supported\n");
+		return true;
+	}
+
+	switch (insn.reg1i21_format.opcode) {
+	case bceqz_op:
+		pr_notice("bceqz and bcnez instructions are not supported\n");
+		return true;
+	}
+
+	return false;
+}
+
+bool insns_need_simulation(union loongarch_instruction insn)
+{
+	if (is_pc_ins(&insn))
+		return true;
+
+	if (is_branch_ins(&insn))
+		return true;
+
+	return false;
+}
+
+void arch_simulate_insn(union loongarch_instruction insn, struct pt_regs *regs)
+{
+	if (is_pc_ins(&insn))
+		simu_pc(regs, insn);
+	else if (is_branch_ins(&insn))
+		simu_branch(regs, insn);
+}
+
 int larch_insn_read(void *addr, u32 *insnp)
 {
 	int ret;
diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
index 56c8c4b..08c78d2 100644
--- a/arch/loongarch/kernel/kprobes.c
+++ b/arch/loongarch/kernel/kprobes.c
@@ -21,48 +21,6 @@ static const union loongarch_instruction singlestep_insn = {
 DEFINE_PER_CPU(struct kprobe *, current_kprobe);
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 
-static bool insns_not_supported(union loongarch_instruction insn)
-{
-	switch (insn.reg2i14_format.opcode) {
-	case llw_op:
-	case lld_op:
-	case scw_op:
-	case scd_op:
-		pr_notice("kprobe: ll and sc instructions are not supported\n");
-		return true;
-	}
-
-	switch (insn.reg1i21_format.opcode) {
-	case bceqz_op:
-		pr_notice("kprobe: bceqz and bcnez instructions are not supported\n");
-		return true;
-	}
-
-	return false;
-}
-NOKPROBE_SYMBOL(insns_not_supported);
-
-static bool insns_need_simulation(struct kprobe *p)
-{
-	if (is_pc_ins(&p->opcode))
-		return true;
-
-	if (is_branch_ins(&p->opcode))
-		return true;
-
-	return false;
-}
-NOKPROBE_SYMBOL(insns_need_simulation);
-
-static void arch_simulate_insn(struct kprobe *p, struct pt_regs *regs)
-{
-	if (is_pc_ins(&p->opcode))
-		simu_pc(regs, p->opcode);
-	else if (is_branch_ins(&p->opcode))
-		simu_branch(regs, p->opcode);
-}
-NOKPROBE_SYMBOL(arch_simulate_insn);
-
 static void arch_prepare_ss_slot(struct kprobe *p)
 {
 	p->ainsn.insn[0] = *p->addr;
@@ -89,7 +47,7 @@ int arch_prepare_kprobe(struct kprobe *p)
 	if (insns_not_supported(p->opcode))
 		return -EINVAL;
 
-	if (insns_need_simulation(p)) {
+	if (insns_need_simulation(p->opcode)) {
 		p->ainsn.insn = NULL;
 	} else {
 		p->ainsn.insn = get_insn_slot();
@@ -220,7 +178,7 @@ static void setup_singlestep(struct kprobe *p, struct pt_regs *regs,
 		regs->csr_era = (unsigned long)p->ainsn.insn;
 	} else {
 		/* simulate single steping */
-		arch_simulate_insn(p, regs);
+		arch_simulate_insn(p->opcode, regs);
 		/* now go for post processing */
 		post_kprobe_handler(p, kcb, regs);
 	}
-- 
2.1.0

