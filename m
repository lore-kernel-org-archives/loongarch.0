Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE5315A3
	for <loongarch@lists.linux.dev>; Fri, 23 Dec 2022 02:08:48 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxKemoDaVj5_wHAA--.14525S3;
	Fri, 23 Dec 2022 10:08:41 +0800 (CST)
Received: from bogon.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxY+WoDaVj8sEIAA--.34210S2;
	Fri, 23 Dec 2022 10:08:40 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Simplifying larch_insn_gen_xxx implementation
Date: Fri, 23 Dec 2022 10:08:40 +0800
Message-Id: <1671761320-31392-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8AxY+WoDaVj8sEIAA--.34210S2
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJFy5Xr1rCw1furW8AF43Jrb_yoWrWFW5pr
	42vwn5JrW7JryFkrWDX3yrXr13Jws3WrZFqFsrWws7Gw4YqFyrXFyvk34vyFWqgw4Uua10
	qa13Ar43ZF45JaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x
	07je0PfUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Simplify larch_insn_gen_xxx implementation by reusing emit_xxx.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/loongarch/include/asm/inst.h |  1 +
 arch/loongarch/kernel/inst.c      | 45 +++++--------------------------
 2 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index c00e1512d4fa..a463b518a636 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -401,6 +401,7 @@ static inline void emit_##NAME(union loongarch_instruction *insn,	\
 }
 
 DEF_EMIT_REG0I26_FORMAT(b, b_op)
+DEF_EMIT_REG0I26_FORMAT(bl, bl_op)
 
 #define DEF_EMIT_REG1I20_FORMAT(NAME, OP)				\
 static inline void emit_##NAME(union loongarch_instruction *insn,	\
diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
index 512579d79b22..badc59087042 100644
--- a/arch/loongarch/kernel/inst.c
+++ b/arch/loongarch/kernel/inst.c
@@ -58,7 +58,6 @@ u32 larch_insn_gen_nop(void)
 u32 larch_insn_gen_b(unsigned long pc, unsigned long dest)
 {
 	long offset = dest - pc;
-	unsigned int immediate_l, immediate_h;
 	union loongarch_instruction insn;
 
 	if ((offset & 3) || offset < -SZ_128M || offset >= SZ_128M) {
@@ -66,15 +65,7 @@ u32 larch_insn_gen_b(unsigned long pc, unsigned long dest)
 		return INSN_BREAK;
 	}
 
-	offset >>= 2;
-
-	immediate_l = offset & 0xffff;
-	offset >>= 16;
-	immediate_h = offset & 0x3ff;
-
-	insn.reg0i26_format.opcode = b_op;
-	insn.reg0i26_format.immediate_l = immediate_l;
-	insn.reg0i26_format.immediate_h = immediate_h;
+	emit_b(&insn, offset >> 2);
 
 	return insn.word;
 }
@@ -82,7 +73,6 @@ u32 larch_insn_gen_b(unsigned long pc, unsigned long dest)
 u32 larch_insn_gen_bl(unsigned long pc, unsigned long dest)
 {
 	long offset = dest - pc;
-	unsigned int immediate_l, immediate_h;
 	union loongarch_instruction insn;
 
 	if ((offset & 3) || offset < -SZ_128M || offset >= SZ_128M) {
@@ -90,15 +80,7 @@ u32 larch_insn_gen_bl(unsigned long pc, unsigned long dest)
 		return INSN_BREAK;
 	}
 
-	offset >>= 2;
-
-	immediate_l = offset & 0xffff;
-	offset >>= 16;
-	immediate_h = offset & 0x3ff;
-
-	insn.reg0i26_format.opcode = bl_op;
-	insn.reg0i26_format.immediate_l = immediate_l;
-	insn.reg0i26_format.immediate_h = immediate_h;
+	emit_bl(&insn, offset >> 2);
 
 	return insn.word;
 }
@@ -107,10 +89,7 @@ u32 larch_insn_gen_or(enum loongarch_gpr rd, enum loongarch_gpr rj, enum loongar
 {
 	union loongarch_instruction insn;
 
-	insn.reg3_format.opcode = or_op;
-	insn.reg3_format.rd = rd;
-	insn.reg3_format.rj = rj;
-	insn.reg3_format.rk = rk;
+	emit_or(&insn, rd, rj, rk);
 
 	return insn.word;
 }
@@ -124,9 +103,7 @@ u32 larch_insn_gen_lu12iw(enum loongarch_gpr rd, int imm)
 {
 	union loongarch_instruction insn;
 
-	insn.reg1i20_format.opcode = lu12iw_op;
-	insn.reg1i20_format.rd = rd;
-	insn.reg1i20_format.immediate = imm;
+	emit_lu12iw(&insn, rd, imm);
 
 	return insn.word;
 }
@@ -135,9 +112,7 @@ u32 larch_insn_gen_lu32id(enum loongarch_gpr rd, int imm)
 {
 	union loongarch_instruction insn;
 
-	insn.reg1i20_format.opcode = lu32id_op;
-	insn.reg1i20_format.rd = rd;
-	insn.reg1i20_format.immediate = imm;
+	emit_lu32id(&insn, rd, imm);
 
 	return insn.word;
 }
@@ -146,10 +121,7 @@ u32 larch_insn_gen_lu52id(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm)
 {
 	union loongarch_instruction insn;
 
-	insn.reg2i12_format.opcode = lu52id_op;
-	insn.reg2i12_format.rd = rd;
-	insn.reg2i12_format.rj = rj;
-	insn.reg2i12_format.immediate = imm;
+	emit_lu52id(&insn, rd, rj, imm);
 
 	return insn.word;
 }
@@ -158,10 +130,7 @@ u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum loongarch_gpr rj, unsigned l
 {
 	union loongarch_instruction insn;
 
-	insn.reg2i16_format.opcode = jirl_op;
-	insn.reg2i16_format.rd = rd;
-	insn.reg2i16_format.rj = rj;
-	insn.reg2i16_format.immediate = (dest - pc) >> 2;
+	emit_jirl(&insn, rj, rd, (dest - pc) >> 2);
 
 	return insn.word;
 }
-- 
2.37.3

