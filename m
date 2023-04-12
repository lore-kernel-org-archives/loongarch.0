Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7AB3209
	for <loongarch@lists.linux.dev>; Wed, 12 Apr 2023 10:05:09 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxJYxUgjZkrywbAA--.41793S3;
	Wed, 12 Apr 2023 18:05:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxSL1SgjZke9wgAA--.34313S4;
	Wed, 12 Apr 2023 18:05:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v1 2/4] LoongArch: Add larch_insn_gen_break() to generate break insns
Date: Wed, 12 Apr 2023 18:04:59 +0800
Message-Id: <1681293901-24918-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1681293901-24918-1-git-send-email-yangtiezhu@loongson.cn>
References: <1681293901-24918-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8DxSL1SgjZke9wgAA--.34313S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KFWfXF4furWUWFW8ZFyxKrg_yoW8uw4DpF
	nrZrn5KrW5GryfGr9Ig3y5Zr15Jws7WwsFqFsIya4xGrWUX3W5XF10gryqqFyjvan5WFW0
	q3WSqw12v3W5JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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
	0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

There exist various break insns such as BRK_KPROBE_BP, BRK_KPROBE_SSTEPBP,
BRK_UPROBE_BP and BRK_UPROBE_XOLBP, add larch_insn_gen_break() to generate
break insns simpler and easier, this is preparation for later patch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/inst.h | 12 ++++++++++++
 arch/loongarch/kernel/inst.c      |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index af494b5..95b3c20 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -456,6 +456,8 @@ u32 larch_insn_gen_nop(void);
 u32 larch_insn_gen_b(unsigned long pc, unsigned long dest);
 u32 larch_insn_gen_bl(unsigned long pc, unsigned long dest);
 
+u32 larch_insn_gen_break(int imm);
+
 u32 larch_insn_gen_or(enum loongarch_gpr rd, enum loongarch_gpr rj, enum loongarch_gpr rk);
 u32 larch_insn_gen_move(enum loongarch_gpr rd, enum loongarch_gpr rj);
 
@@ -474,6 +476,16 @@ static inline bool unsigned_imm_check(unsigned long val, unsigned int bit)
 	return val < (1UL << bit);
 }
 
+#define DEF_EMIT_REG0I15_FORMAT(NAME, OP)				\
+static inline void emit_##NAME(union loongarch_instruction *insn,	\
+			       int imm)					\
+{									\
+	insn->reg0i15_format.opcode = OP;				\
+	insn->reg0i15_format.immediate = imm;				\
+}
+
+DEF_EMIT_REG0I15_FORMAT(break, break_op)
+
 #define DEF_EMIT_REG0I26_FORMAT(NAME, OP)				\
 static inline void emit_##NAME(union loongarch_instruction *insn,	\
 			       int offset)				\
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 258ef26..31b8efe 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -208,6 +208,15 @@ u32 larch_insn_gen_bl(unsigned long pc, unsigned long dest)
 	return insn.word;
 }
 
+u32 larch_insn_gen_break(int imm)
+{
+	union loongarch_instruction insn;
+
+	emit_break(&insn, imm);
+
+	return insn.word;
+}
+
 u32 larch_insn_gen_or(enum loongarch_gpr rd, enum loongarch_gpr rj, enum loongarch_gpr rk)
 {
 	union loongarch_instruction insn;
-- 
2.1.0

