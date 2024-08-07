Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EA31C9ECD
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021153; cv=none; b=J+RteVJqVVwY+3cRnpeWIuqx7yHyF69DI8rkoidm+Y4f1yAt6vaPclk8yM010HZZB7LyjEFZkf3N5oX9tKO2Dwjo0DjhCeAQbZwTf0gNK2POboKSqH1oP6LK3bcuoNY4PZFX6hggeCq35V2TDKHtniFpYJ8Va31n6mm/Bl5xX9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021153; c=relaxed/simple;
	bh=SQNtY+dSXTT0dOIDVCO8TymIfbCaaytGEiNOtPeFWi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdSAldJ1iRUny8KtcjQ2tOaYNW/XSWH1NfEq3dszdZ42wXm9tdwaq6c5qonST8+DAfaqPZOWjzywPfFQvC9BUMFFxWdbvni2fg0AG3HUT1orNpD8T1YxQflvutwur9MCBtYQc75n9koJn+FBa7vDNf/4x9BGROx3RnzS1gR1ocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxKupdN7NmzC8KAA--.31990S3;
	Wed, 07 Aug 2024 16:59:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxvmdaN7NmO8EHAA--.24061S3;
	Wed, 07 Aug 2024 16:59:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] objtool: Handle frame pointer related instructions
Date: Wed,  7 Aug 2024 16:59:03 +0800
Message-ID: <20240807085906.27397-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240807085906.27397-1-yangtiezhu@loongson.cn>
References: <20240807085906.27397-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxvmdaN7NmO8EHAA--.24061S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxKFW3tF43WF1xAw45AF4DJrc_yoW7try3pF
	Zxua45GrWkurn3ZwnrtF4UGrZ8Cws7WryjgFZ3J34xAryaqrn3WF1SqF1YyFn2qrs5ua40
	gFWayry2vF1j9agCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

After commit a0f7085f6a63 ("LoongArch: Add RANDOMIZE_KSTACK_OFFSET
support"), there are three new instructions "addi.d $fp, $sp, 32",
"sub.d $sp, $sp, $t0" and "addi.d $sp, $fp, -32" for the secondary
stack in do_syscall(), then there is a objtool warning "return with
modified stack frame" and no handle_syscall() which is the previous
frame of do_syscall() in the call trace when executing the command
"echo l > /proc/sysrq-trigger".

objdump shows something like this:

0000000000000000 <do_syscall>:
   0:   02ff8063        addi.d          $sp, $sp, -32
   4:   29c04076        st.d            $fp, $sp, 16
   8:   29c02077        st.d            $s0, $sp, 8
   c:   29c06061        st.d            $ra, $sp, 24
  10:   02c08076        addi.d          $fp, $sp, 32
  ...
  74:   0011b063        sub.d           $sp, $sp, $t0
  ...
  a8:   4c000181        jirl            $ra, $t0, 0
  ...
  dc:   02ff82c3        addi.d          $sp, $fp, -32
  e0:   28c06061        ld.d            $ra, $sp, 24
  e4:   28c04076        ld.d            $fp, $sp, 16
  e8:   28c02077        ld.d            $s0, $sp, 8
  ec:   02c08063        addi.d          $sp, $sp, 32
  f0:   4c000020        jirl            $zero, $ra, 0

The instruction "sub.d $sp, $sp, $t0" changes the stack bottom
and the new stack size is a random value, in order to find the
return address of do_syscall() which is stored in the original
stack frame after executing "jirl $ra, $t0, 0", it should use
fp which points to the original stack top.

At the beginning, the thought is tended to decode the secondary
stack instruction "sub.d $sp, $sp, $t0" and set it as a label,
then check this label for the two frame pointer instructions to
change the cfa base and cfa offset during the period of secondary
stack in update_cfi_state(). This is valid for GCC rather than
Clang due to there are different secondary stack instructions for
ClangBuiltLinux on LoongArch, something like this:

0000000000000000 <do_syscall>:
  ...
  88:   00119064        sub.d           $a0, $sp, $a0
  8c:   00150083        or              $sp, $a0, $zero
  ...

Actually, it equals to a single instruction "sub.d $sp, $sp, $a0",
but there is no proper condition to check it as a label like GCC,
so the beginning thought is not a good way.

Essentially, there are two special frame pointer instructions
"addi.d $fp, $sp, imm" and "addi.d $sp, $fp, imm", the first one
points fp to the original stack top and the second one restores
the original stack bottom from fp.

Based on the above analysis, in order to not add a arch specified
update_cfi_state(), just add a member "frame_pointer" in the struct
symbol as a label to avoid affecting the current normal case, then
set it as true only if there is "addi.d $sp, $fp, imm", the last is
to check this label for the two frame pointer instructions to change
the cfa base and cfa offset in update_cfi_state().

Tested with the following two configs:
(1) CONFIG_RANDOMIZE_KSTACK_OFFSET=y &&
    CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=n
(2) CONFIG_RANDOMIZE_KSTACK_OFFSET=y &&
    CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y

By the way, there is no effect for x86 with this patch, tested on
the x86 machine with Fedora 40 system.

Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/decode.c | 11 ++++++++++-
 tools/objtool/check.c                 | 23 ++++++++++++++++++++---
 tools/objtool/include/objtool/elf.h   |  1 +
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index aee479d2191c..69b66994f2a1 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -122,7 +122,7 @@ static bool decode_insn_reg2i12_fomat(union loongarch_instruction inst,
 	switch (inst.reg2i12_format.opcode) {
 	case addid_op:
 		if ((inst.reg2i12_format.rd == CFI_SP) || (inst.reg2i12_format.rj == CFI_SP)) {
-			/* addi.d sp,sp,si12 or addi.d fp,sp,si12 */
+			/* addi.d sp,sp,si12 or addi.d fp,sp,si12 or addi.d sp,fp,si12 */
 			insn->immediate = sign_extend64(inst.reg2i12_format.immediate, 11);
 			ADD_OP(op) {
 				op->src.type = OP_SRC_ADD;
@@ -132,6 +132,15 @@ static bool decode_insn_reg2i12_fomat(union loongarch_instruction inst,
 				op->dest.reg = inst.reg2i12_format.rd;
 			}
 		}
+		if ((inst.reg2i12_format.rd == CFI_SP) && (inst.reg2i12_format.rj == CFI_FP)) {
+			/* addi.d sp,fp,si12 */
+			struct symbol *func = find_func_containing(insn->sec, insn->offset);
+
+			if (!func)
+				return false;
+
+			func->frame_pointer = true;
+		}
 		break;
 	case ldd_op:
 		if (inst.reg2i12_format.rj == CFI_SP) {
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 01237d167223..af9cfed7f4ec 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2993,10 +2993,27 @@ static int update_cfi_state(struct instruction *insn,
 				break;
 			}
 
-			if (op->dest.reg == CFI_SP && op->src.reg == CFI_BP) {
+			if (op->dest.reg == CFI_BP && op->src.reg == CFI_SP &&
+			    insn->sym->frame_pointer) {
+				/* addi.d fp,sp,imm on LoongArch */
+				if (cfa->base == CFI_SP && cfa->offset == op->src.offset) {
+					cfa->base = CFI_BP;
+					cfa->offset = 0;
+				}
+				break;
+			}
 
-				/* lea disp(%rbp), %rsp */
-				cfi->stack_size = -(op->src.offset + regs[CFI_BP].offset);
+			if (op->dest.reg == CFI_SP && op->src.reg == CFI_BP) {
+				/* addi.d sp,fp,imm on LoongArch */
+				if (cfa->base == CFI_BP && cfa->offset == 0) {
+					if (insn->sym->frame_pointer) {
+						cfa->base = CFI_SP;
+						cfa->offset = -op->src.offset;
+					}
+				} else {
+					/* lea disp(%rbp), %rsp */
+					cfi->stack_size = -(op->src.offset + regs[CFI_BP].offset);
+				}
 				break;
 			}
 
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index 2b8a69de4db8..d7e815c2fd15 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -68,6 +68,7 @@ struct symbol {
 	u8 warned	     : 1;
 	u8 embedded_insn     : 1;
 	u8 local_label       : 1;
+	u8 frame_pointer     : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 };
-- 
2.42.0

