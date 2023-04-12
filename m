Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2CA320E
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 10:05:09 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Ax69lVgjZktSwbAA--.41728S3;
	Wed, 12 Apr 2023 18:05:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxSL1SgjZke9wgAA--.34313S5;
	Wed, 12 Apr 2023 18:05:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v1 3/4] LoongArch: Use larch_insn_gen_break() for kprobes
Date: Wed, 12 Apr 2023 18:05:00 +0800
Message-Id: <1681293901-24918-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1681293901-24918-1-git-send-email-yangtiezhu@loongson.cn>
References: <1681293901-24918-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8DxSL1SgjZke9wgAA--.34313S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGw13JF48Kry8Jry7Cr18uFg_yoWrZF4UpF
	srAwn3XF4rWr95GryDJws8Zr1Yyrs5uwsFqF15CaySkFW2qrn8tF1kKrWqyF98K3yvkFWI
	qw17t348X3W7ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

For now, we can use larch_insn_gen_break() to define KPROBE_BP_INSN and
KPROBE_SSTEPBP_INSN. Because larch_insn_gen_break() returns instruction
word, pass around instruction word instead of union for the functions
insns_not_supported(), insns_need_simulation() and arch_simulate_insn(),
no functional change intended.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/inst.h    | 18 +++++++++++++++---
 arch/loongarch/include/asm/kprobes.h |  2 +-
 arch/loongarch/kernel/kprobes.c      | 21 +++++----------------
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index 95b3c20..a0fce06 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -409,8 +409,12 @@ static inline bool is_self_loop_ins(union loongarch_instruction *ip, struct pt_r
 void simu_pc(struct pt_regs *regs, union loongarch_instruction insn);
 void simu_branch(struct pt_regs *regs, union loongarch_instruction insn);
 
-static inline bool insns_not_supported(union loongarch_instruction insn)
+static inline bool insns_not_supported(u32 code)
 {
+	union loongarch_instruction insn;
+
+	insn.word = code;
+
 	switch (insn.reg2i14_format.opcode) {
 	case llw_op:
 	case lld_op:
@@ -429,8 +433,12 @@ static inline bool insns_not_supported(union loongarch_instruction insn)
 	return false;
 }
 
-static inline bool insns_need_simulation(union loongarch_instruction insn)
+static inline bool insns_need_simulation(u32 code)
 {
+	union loongarch_instruction insn;
+
+	insn.word = code;
+
 	if (is_pc_ins(&insn))
 		return true;
 
@@ -440,8 +448,12 @@ static inline bool insns_need_simulation(union loongarch_instruction insn)
 	return false;
 }
 
-static inline void arch_simulate_insn(union loongarch_instruction insn, struct pt_regs *regs)
+static inline void arch_simulate_insn(u32 code, struct pt_regs *regs)
 {
+	union loongarch_instruction insn;
+
+	insn.word = code;
+
 	if (is_pc_ins(&insn))
 		simu_pc(regs, insn);
 	else if (is_branch_ins(&insn))
diff --git a/arch/loongarch/include/asm/kprobes.h b/arch/loongarch/include/asm/kprobes.h
index 798020a..7ef7a0f 100644
--- a/arch/loongarch/include/asm/kprobes.h
+++ b/arch/loongarch/include/asm/kprobes.h
@@ -22,7 +22,7 @@ do {									\
 
 #define kretprobe_blacklist_size	0
 
-typedef union loongarch_instruction kprobe_opcode_t;
+typedef u32 kprobe_opcode_t;
 
 /* Architecture specific copy of original instruction */
 struct arch_specific_insn {
diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
index 08c78d2..9f699f0 100644
--- a/arch/loongarch/kernel/kprobes.c
+++ b/arch/loongarch/kernel/kprobes.c
@@ -4,19 +4,8 @@
 #include <linux/preempt.h>
 #include <asm/break.h>
 
-static const union loongarch_instruction breakpoint_insn = {
-	.reg0i15_format = {
-		.opcode = break_op,
-		.immediate = BRK_KPROBE_BP,
-	}
-};
-
-static const union loongarch_instruction singlestep_insn = {
-	.reg0i15_format = {
-		.opcode = break_op,
-		.immediate = BRK_KPROBE_SSTEPBP,
-	}
-};
+#define KPROBE_BP_INSN		larch_insn_gen_break(BRK_KPROBE_BP)
+#define KPROBE_SSTEPBP_INSN	larch_insn_gen_break(BRK_KPROBE_SSTEPBP)
 
 DEFINE_PER_CPU(struct kprobe *, current_kprobe);
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
@@ -24,7 +13,7 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 static void arch_prepare_ss_slot(struct kprobe *p)
 {
 	p->ainsn.insn[0] = *p->addr;
-	p->ainsn.insn[1] = singlestep_insn;
+	p->ainsn.insn[1] = KPROBE_SSTEPBP_INSN;
 	p->ainsn.restore = (unsigned long)p->addr + LOONGARCH_INSN_SIZE;
 }
 NOKPROBE_SYMBOL(arch_prepare_ss_slot);
@@ -68,7 +57,7 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
 /* Install breakpoint in text */
 void arch_arm_kprobe(struct kprobe *p)
 {
-	*p->addr = breakpoint_insn;
+	*p->addr = KPROBE_BP_INSN;
 	flush_insn_slot(p);
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
@@ -253,7 +242,7 @@ bool kprobe_breakpoint_handler(struct pt_regs *regs)
 		}
 	}
 
-	if (addr->word != breakpoint_insn.word) {
+	if (*addr != KPROBE_BP_INSN) {
 		/*
 		 * The breakpoint instruction was removed right
 		 * after we hit it.  Another cpu has removed
-- 
2.1.0

