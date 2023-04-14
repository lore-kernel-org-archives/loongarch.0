Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8303AA4F
	for <loongarch@lists.linux.dev>; Fri, 14 Apr 2023 09:33:11 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxYU_UHTlkmGIcAA--.44264S3;
	Fri, 14 Apr 2023 17:33:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxjb7SHTlkpYkkAA--.885S4;
	Fri, 14 Apr 2023 17:33:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 2/4] LoongArch: Add larch_insn_gen_break() to generate break insns
Date: Fri, 14 Apr 2023 17:32:59 +0800
Message-Id: <1681464781-4428-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1681464781-4428-1-git-send-email-yangtiezhu@loongson.cn>
References: <1681464781-4428-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Dxjb7SHTlkpYkkAA--.885S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KFWfXF4furWUWF1kJw47Arb_yoW8uw1kpF
	9Fvwn5KrW5WryfGr9Iq3y5ur13Jan7WwsFqFsxta4xGr4UXa45XFy0gryqqFyjvan5WFW0
	q3WSqr1Iv3W5JaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8CztUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

There exist various break insns such as BRK_KPROBE_BP, BRK_KPROBE_SSTEPBP,
BRK_UPROBE_BP and BRK_UPROBE_XOLBP, add larch_insn_gen_break() to generate
break insns simpler, this is preparation for later patch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/inst.h | 12 ++++++++++++
 arch/loongarch/kernel/inst.c      |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index 9ea485b..061c0ea 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -421,6 +421,8 @@ u32 larch_insn_gen_nop(void);
 u32 larch_insn_gen_b(unsigned long pc, unsigned long dest);
 u32 larch_insn_gen_bl(unsigned long pc, unsigned long dest);
 
+u32 larch_insn_gen_break(int imm);
+
 u32 larch_insn_gen_or(enum loongarch_gpr rd, enum loongarch_gpr rj, enum loongarch_gpr rk);
 u32 larch_insn_gen_move(enum loongarch_gpr rd, enum loongarch_gpr rj);
 
@@ -439,6 +441,16 @@ static inline bool unsigned_imm_check(unsigned long val, unsigned int bit)
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
index 95219e0..0bdcd46 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -247,6 +247,15 @@ u32 larch_insn_gen_bl(unsigned long pc, unsigned long dest)
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

