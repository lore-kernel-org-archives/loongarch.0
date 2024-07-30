Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036F4168481
	for <loongarch@lists.linux.dev>; Tue, 30 Jul 2024 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722320352; cv=none; b=XIW5VgwSeu+mrz7R3hLQZs+/bnFJvI2KKbHBJ/BRQ8RdGk6ef1PWtuELY8GeNNaxdyU1EjoG7fImkTOgCFOWIk/WqCWDTtYJCoTanEsfrdatr3TMv2Fzr8nKaAi4lf3NJ72LCE+llXZATBeEThT/A1zpgWqdqj1hL7NWx8cRCDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722320352; c=relaxed/simple;
	bh=vz2hKdAFp86DZHllck2S/sUsgOdMhETXVboVbB5vGXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTs/pzDv1dUiWI0XeTDm6bOn0pOpyQs51g0aAQO9knZY+H2IBI8xn7OGKPIl5asUP7HJozQYDBY2rJuoCeYyorXWKGX2FkhJwJPl6zfIEfMvYrdr2K60pXyAOgCM9e8W00qJ5MrtrmJban00PwdVbUvQ5zEk2sKfOcoE3ulKYbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxuOnXhahmzUMEAA--.15072S3;
	Tue, 30 Jul 2024 14:19:03 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMAxX8fVhahmehYGAA--.30051S3;
	Tue, 30 Jul 2024 14:19:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] objtool/LoongArch: Restrict stack operation instruction
Date: Tue, 30 Jul 2024 14:19:00 +0800
Message-ID: <20240730061901.21485-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240730061901.21485-1-yangtiezhu@loongson.cn>
References: <20240730061901.21485-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxX8fVhahmehYGAA--.30051S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF17Cr4UCw1kXr4fZw4DWrX_yoW8Kryfpr
	Zru3W3GFWUurn7Zw1vqayUWrZxGFs3XrySgF4fJa4xCr13Xrn7Xr1Ig3WYkFyvqw45K3y0
	grWfAry7JF4qvagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8wNVDUUUUU==

After commit a0f7085f6a63 ("LoongArch: Add RANDOMIZE_KSTACK_OFFSET
support"), the code flow of do_syscall() was changed when compiled
with GCC due to the secondary stack of add_random_kstack_offset(),
something like this:

  addi.d          $sp, $sp, -32
  st.d            $fp, $sp, 16
  st.d            $ra, $sp, 24
  addi.d          $fp, $sp, 32
  ...
  sub.d           $sp, $sp, $t1
  ...
  addi.d          $sp, $fp, -32
  ld.d            $ra, $sp, 24
  ld.d            $fp, $sp, 16
  addi.d          $sp, $sp, 32

fp points to the stack top, it is only used to save and restore the
original sp and is not used as cfa base for arch_callee_saved_reg().
In the case OP_SRC_ADD of update_cfi_state(), the above rare case is
not handled so that lead to a wrong stack size, then there exists a
objtool warning "do_syscall+0x11c: return with modified stack frame".

Because the fp related instructions do not modify the stack frame,
no need to decode them, just restrict stack operation instruction
only with the single case "addi.d sp,sp,si12".

By the way, if fp is used as cfa base for arch_callee_saved_reg()
(there is no this behavior on LoongArch at present), then it needs
to decode the related instructions and modify update_cfi_state().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407201336.mW8dj1VB-lkp@intel.com/
Fixes: b2d23158e6c8 ("objtool/LoongArch: Implement instruction decoder")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index aee479d2191c..6a34af675cee 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -121,8 +121,8 @@ static bool decode_insn_reg2i12_fomat(union loongarch_instruction inst,
 {
 	switch (inst.reg2i12_format.opcode) {
 	case addid_op:
-		if ((inst.reg2i12_format.rd == CFI_SP) || (inst.reg2i12_format.rj == CFI_SP)) {
-			/* addi.d sp,sp,si12 or addi.d fp,sp,si12 */
+		if ((inst.reg2i12_format.rd == CFI_SP) && (inst.reg2i12_format.rj == CFI_SP)) {
+			/* addi.d sp,sp,si12 */
 			insn->immediate = sign_extend64(inst.reg2i12_format.immediate, 11);
 			ADD_OP(op) {
 				op->src.type = OP_SRC_ADD;
-- 
2.42.0

