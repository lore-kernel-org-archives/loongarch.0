Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272DC13D502
	for <loongarch@lists.linux.dev>; Mon,  5 Aug 2024 03:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722828426; cv=none; b=UyBYkkBEHxuqC1a3DOv48DBzDAJsGiw/Fa1A5P8tSwWm0lNa/OasBWX9Atg4hvbj+ffbITIlldKfFVP2T/wvOer+80ifpjR6kfqJDvcCtVfr5JbjYN5b1G6EfjW+x4mVT1OuVw6koqhqeVt3WV4IeUb2zUAjY+Tdx8TKsNRyAYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722828426; c=relaxed/simple;
	bh=hl0dbmk20s8D35tLoREPfCShfffkpWB3hKqyL5SB2wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmE3QiHL+RBTD4AOZgy444DWtLB6JCS4xdaJSvfjH+kUBAYHqh22vymVwiYEA3D1J0bCG+nDAAP242ufYAYMBE6kOC860/LXjIsm6+d0Jzck/IFeroabZJSQAnkYs4OpezXD4tw72g1egIfFwrzBPgu0F3g/+pWj9IHH66xIMgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Ax2emGRrBmGtAHAA--.26592S3;
	Mon, 05 Aug 2024 11:27:02 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxkeGFRrBmgeADAA--.20473S3;
	Mon, 05 Aug 2024 11:27:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] objtool/LoongArch: Decode secondary stack instruction
Date: Mon,  5 Aug 2024 11:26:58 +0800
Message-ID: <20240805032700.16038-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240805032700.16038-1-yangtiezhu@loongson.cn>
References: <20240805032700.16038-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxkeGFRrBmgeADAA--.20473S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr13XF18tw1DZw4DKr4kAFc_yoW5Cr18pa
	nrZ3s5Jr4rWr1SyrnrJ3y5urW3Grs3WryIqFsxG34IkrWaqr95XF1IgFy0yF1kGw4rKFyI
	9r4fZw17WF1UAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1YL9UUUUU=

After commit a0f7085f6a63 ("LoongArch: Add RANDOMIZE_KSTACK_OFFSET
support"), there is a new instruction "sub.d $sp, $sp, $t0" for the
secondary stack in do_syscall(), then there exists a objtool warning
"do_syscall+0x11c: return with modified stack frame" and there is no
handle_syscall() which is the previous frame of do_syscall() in the
call trace when executing the command "echo l > /proc/sysrq-trigger".

In order to solve the above issues, the first step is to decode the
secondary stack instruction "sub.d $sp, $sp, $t0".

Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/arch/loongarch/include/asm/inst.h | 12 ++++++++++++
 tools/objtool/arch/loongarch/decode.c   | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/tools/arch/loongarch/include/asm/inst.h b/tools/arch/loongarch/include/asm/inst.h
index c25b5853181d..935b596642e2 100644
--- a/tools/arch/loongarch/include/asm/inst.h
+++ b/tools/arch/loongarch/include/asm/inst.h
@@ -51,6 +51,10 @@ enum reg2i16_op {
 	bgeu_op		= 0x1b,
 };
 
+enum reg3_op {
+	subd_op		= 0x23,
+};
+
 struct reg0i15_format {
 	unsigned int immediate : 15;
 	unsigned int opcode : 17;
@@ -96,6 +100,13 @@ struct reg2i16_format {
 	unsigned int opcode : 6;
 };
 
+struct reg3_format {
+	unsigned int rd : 5;
+	unsigned int rj : 5;
+	unsigned int rk : 5;
+	unsigned int opcode : 17;
+};
+
 union loongarch_instruction {
 	unsigned int word;
 	struct reg0i15_format	reg0i15_format;
@@ -105,6 +116,7 @@ union loongarch_instruction {
 	struct reg2i12_format	reg2i12_format;
 	struct reg2i14_format	reg2i14_format;
 	struct reg2i16_format	reg2i16_format;
+	struct reg3_format	reg3_format;
 };
 
 #define LOONGARCH_INSN_SIZE	sizeof(union loongarch_instruction)
diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index aee479d2191c..db4dd05cdb49 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -272,6 +272,25 @@ static bool decode_insn_reg2i16_fomat(union loongarch_instruction inst,
 	return true;
 }
 
+static bool decode_insn_reg3_fomat(union loongarch_instruction inst,
+				   struct instruction *insn)
+{
+	switch (inst.reg3_format.opcode) {
+	case subd_op:
+		if ((inst.reg3_format.rd == CFI_SP) && (inst.reg3_format.rj == CFI_SP)) {
+			/*
+			 * sub.d sp,sp,t0
+			 * this is a rare case for the secondary stack.
+			 */
+		}
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
 int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
 			    unsigned long offset, unsigned int maxlen,
 			    struct instruction *insn)
@@ -303,6 +322,8 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 		return 0;
 	if (decode_insn_reg2i16_fomat(inst, insn))
 		return 0;
+	if (decode_insn_reg3_fomat(inst, insn))
+		return 0;
 
 	if (inst.word == 0)
 		insn->type = INSN_NOP;
-- 
2.42.0

