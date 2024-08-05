Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1820113D518
	for <loongarch@lists.linux.dev>; Mon,  5 Aug 2024 03:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722828427; cv=none; b=M2dv3oYCLFl56/J2AClDzVPZ3CSt5Bb0m6ue+RS8pmgnSFS3KtsfeeCcxk1X3DHfyDt88VSwL2nYCKzxE0KASogcISsrAjcZdqv2n+QT4uWfCRcCKfVcNXwS95g5663pa2VloiZRix4/qWOUA1BZ8SXFPLBwZGamKSG5dXFWgG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722828427; c=relaxed/simple;
	bh=vZ3sMeD8V5KlT5OtrGoiGlkT57DiyJVyAvfiqHFT+t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHCATmQGX2CuUGeCjlBxHotssfN9rgQu5MvuC7WlO6Btrza9a5idPC0EfnG81/pya0DOaumvkU3lgpgM+2MPEmgxdBtqY2chyCy+CX5deVqlhOjvLHniX09uUn3Qmgyt/xK2nIs0Z2xoWVNvol9OJnfFDfnmpDQyNkkiI2nn9Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxuOmHRrBmHtAHAA--.27095S3;
	Mon, 05 Aug 2024 11:27:03 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxkeGFRrBmgeADAA--.20473S4;
	Mon, 05 Aug 2024 11:27:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] objtool: Handle secondary stack related instructions
Date: Mon,  5 Aug 2024 11:26:59 +0800
Message-ID: <20240805032700.16038-3-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMDxkeGFRrBmgeADAA--.20473S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr13XF18tw1DZw4DuF4rJFc_yoW7JrykpF
	ZrZay5GrW8Wrn3ZwnFqa1UWrZ8Aws7WrW0qFnxGw1xArWaqr93WF1Sv3WYyFnYqws5W3yI
	qrW3Zry2yF4j9agCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

After commit a0f7085f6a63 ("LoongArch: Add RANDOMIZE_KSTACK_OFFSET
support"), there is a new instruction "sub.d $sp, $sp, $t0" for the
secondary stack in do_syscall(), then there exists a objtool warning
"do_syscall+0x11c: return with modified stack frame" and there is no
handle_syscall() which is the previous frame of do_syscall() in the
call trace when executing the command "echo l > /proc/sysrq-trigger".

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

This is a rare case, add a member "secondary_stack" in the struct
symbol as a label to avoid affecting the current normal case, then
set it as true only if there exists the secondary stack instruction
"sub.d $sp, $sp, $t0", at last check this label for the other special
secondary stack instructions about fp to change the cfa base and cfa
offset during the period of secondary stack in update_cfi_state().

Tested with the following two configs:
(1) CONFIG_RANDOMIZE_KSTACK_OFFSET=y &&
    CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=n
(2) CONFIG_RANDOMIZE_KSTACK_OFFSET=y &&
    CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y

Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/decode.c |  8 +++++++-
 tools/objtool/check.c                 | 22 ++++++++++++++++++++++
 tools/objtool/include/objtool/elf.h   |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index db4dd05cdb49..4085714ffd18 100644
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
@@ -275,6 +275,8 @@ static bool decode_insn_reg2i16_fomat(union loongarch_instruction inst,
 static bool decode_insn_reg3_fomat(union loongarch_instruction inst,
 				   struct instruction *insn)
 {
+	struct symbol *func;
+
 	switch (inst.reg3_format.opcode) {
 	case subd_op:
 		if ((inst.reg3_format.rd == CFI_SP) && (inst.reg3_format.rj == CFI_SP)) {
@@ -282,6 +284,10 @@ static bool decode_insn_reg3_fomat(union loongarch_instruction inst,
 			 * sub.d sp,sp,t0
 			 * this is a rare case for the secondary stack.
 			 */
+			func = find_func_containing(insn->sec, insn->offset);
+			if (!func)
+				return false;
+			func->secondary_stack = true;
 		}
 		break;
 	default:
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 01237d167223..c7b9942fee29 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2993,6 +2993,28 @@ static int update_cfi_state(struct instruction *insn,
 				break;
 			}
 
+			if (op->dest.reg == CFI_BP && op->src.reg == CFI_SP) {
+				/* addi.d fp,sp,imm for the secondary stack on LoongArch */
+				if (cfa->base == CFI_SP && cfa->offset == op->src.offset) {
+					if (insn->sym->secondary_stack) {
+						cfa->base = CFI_BP;
+						cfa->offset = 0;
+					}
+				}
+				break;
+			}
+
+			if (op->dest.reg == CFI_SP && op->src.reg == CFI_BP) {
+				/* addi.d sp,fp,imm for the secondary stack on LoongArch */
+				if (cfa->base == CFI_FP && cfa->offset == 0) {
+					if (insn->sym->secondary_stack) {
+						cfa->base = CFI_SP;
+						cfa->offset = -op->src.offset;
+					}
+				}
+				break;
+			}
+
 			if (op->dest.reg == CFI_SP && op->src.reg == CFI_BP) {
 
 				/* lea disp(%rbp), %rsp */
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index 2b8a69de4db8..586916e0d441 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -68,6 +68,7 @@ struct symbol {
 	u8 warned	     : 1;
 	u8 embedded_insn     : 1;
 	u8 local_label       : 1;
+	u8 secondary_stack   : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 };
-- 
2.42.0

