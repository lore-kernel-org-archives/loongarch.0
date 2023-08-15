Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70DD23CC
	for <loongarch@lists.linux.dev>; Tue, 15 Aug 2023 08:36:10 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxV_H4ONtkVLEYAA--.51259S3;
	Tue, 15 Aug 2023 16:36:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c74ONtk0QVbAA--.27613S2;
	Tue, 15 Aug 2023 16:36:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH] objtool: Check local label in is_sibling_call() and add_jump_destinations()
Date: Tue, 15 Aug 2023 16:36:02 +0800
Message-Id: <1692088562-4630-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8Ax3c74ONtk0QVbAA--.27613S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3XFyrCw1rCF48uF47KFy5KFX_yoW7uw43pa
	13G3y5Kr4rXFWxuw47tF4UW3WSkw4rXFy7GFW5Ga4Skw1Yqas5ta1fK3WI9F15JFy5WF43
	Xw4jyryUCF4UAabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

When update the latest upstream gcc and binutils which enables linker
relaxation by default, it generates more objtool warnings on LoongArch,
like this:

  init/version.o: warning: objtool: early_hostname+0x20: sibling call from callable instruction with modified stack frame

We can see that the branch and jump operation about local label ".L2"
is not sibling call, because a sibling call is a tail-call to another
symbol. In this case, make is_sibling_call() return false, set dest_sec
and dest_off to calculate jump_dest in add_jump_destinations().

Here are some detailed info:
[fedora@linux 6.5.test]$ gcc --version
gcc (GCC) 14.0.0 20230803 (experimental)
[fedora@linux 6.5.test]$ as --version
GNU assembler (GNU Binutils) 2.41.50.20230803
[fedora@linux 6.5.test]$ objdump -M no-aliases -D init/version.o
0000000000000000 <early_hostname>:
   0:   00150085        or              $a1, $a0, $zero
   4:   1a000004        pcalau12i       $a0, 0
   8:   02ffc063        addi.d          $sp, $sp, -16
   c:   02810406        addi.w          $a2, $zero, 65
  10:   02c00084        addi.d          $a0, $a0, 0
  14:   29c02061        st.d            $ra, $sp, 8
  18:   54000000        bl              0       # 18 <early_hostname+0x18>
  1c:   0281000c        addi.w          $t0, $zero, 64
  20:   6c001584        bgeu            $t0, $a0, 20    # 34 <.L2>
  24:   1a000004        pcalau12i       $a0, 0
  28:   02810005        addi.w          $a1, $zero, 64
  2c:   02c00084        addi.d          $a0, $a0, 0
  30:   54000000        bl              0       # 30 <early_hostname+0x30>

0000000000000034 <.L2>:
  34:   28c02061        ld.d            $ra, $sp, 8
  38:   00150004        or              $a0, $zero, $zero
  3c:   02c04063        addi.d          $sp, $sp, 16
  40:   4c000020        jirl            $zero, $ra, 0

By the way, it need to move insn_reloc() before is_sibling_call()
to avoid implicit declaration build error.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 69 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 8936a05..fea3675 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -161,12 +161,39 @@ static bool is_jump_table_jump(struct instruction *insn)
 	       insn_jump_table(alt_group->orig_group->first_insn);
 }
 
-static bool is_sibling_call(struct instruction *insn)
+static struct reloc *insn_reloc(struct objtool_file *file, struct instruction *insn)
+{
+	struct reloc *reloc;
+
+	if (insn->no_reloc)
+		return NULL;
+
+	if (!file)
+		return NULL;
+
+	reloc = find_reloc_by_dest_range(file->elf, insn->sec,
+					 insn->offset, insn->len);
+	if (!reloc) {
+		insn->no_reloc = 1;
+		return NULL;
+	}
+
+	return reloc;
+}
+
+static bool is_sibling_call(struct objtool_file *file, struct instruction *insn)
 {
 	/*
 	 * Assume only STT_FUNC calls have jump-tables.
 	 */
 	if (insn_func(insn)) {
+		struct reloc *reloc = insn_reloc(file, insn);
+
+		/* Disallow sibling calls into STT_NOTYPE if it is local lable */
+		if (reloc && reloc->sym->type == STT_NOTYPE &&
+		    strncmp(reloc->sym->name, ".L", 2) == 0)
+			return false;
+
 		/* An indirect jump is either a sibling call or a jump to a table. */
 		if (insn->type == INSN_JUMP_DYNAMIC)
 			return !is_jump_table_jump(insn);
@@ -232,7 +259,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 	 * of the sibling call returns.
 	 */
 	func_for_each_insn(file, func, insn) {
-		if (is_sibling_call(insn)) {
+		if (is_sibling_call(file, insn)) {
 			struct instruction *dest = insn->jump_dest;
 
 			if (!dest)
@@ -743,7 +770,7 @@ static int create_static_call_sections(struct objtool_file *file)
 		if (!elf_init_reloc_data_sym(file->elf, sec,
 					     idx * sizeof(*site) + 4,
 					     (idx * 2) + 1, key_sym,
-					     is_sibling_call(insn) * STATIC_CALL_SITE_TAIL))
+					     is_sibling_call(file, insn) * STATIC_CALL_SITE_TAIL))
 			return -1;
 
 		idx++;
@@ -1298,26 +1325,6 @@ __weak bool arch_is_rethunk(struct symbol *sym)
 	return false;
 }
 
-static struct reloc *insn_reloc(struct objtool_file *file, struct instruction *insn)
-{
-	struct reloc *reloc;
-
-	if (insn->no_reloc)
-		return NULL;
-
-	if (!file)
-		return NULL;
-
-	reloc = find_reloc_by_dest_range(file->elf, insn->sec,
-					 insn->offset, insn->len);
-	if (!reloc) {
-		insn->no_reloc = 1;
-		return NULL;
-	}
-
-	return reloc;
-}
-
 static void remove_insn_ops(struct instruction *insn)
 {
 	struct stack_op *op, *next;
@@ -1560,8 +1567,14 @@ static int add_jump_destinations(struct objtool_file *file)
 			 * External sibling call or internal sibling call with
 			 * STT_FUNC reloc.
 			 */
-			add_call_dest(file, insn, reloc->sym, true);
-			continue;
+			if (reloc->sym->type == STT_NOTYPE &&
+			    strncmp(reloc->sym->name, ".L", 2) == 0) {
+				dest_sec = insn->sec;
+				dest_off = arch_jump_destination(insn);
+			} else {
+				add_call_dest(file, insn, reloc->sym, true);
+				continue;
+			}
 		} else if (reloc->sym->sec->idx) {
 			dest_sec = reloc->sym->sec;
 			dest_off = reloc->sym->sym.st_value +
@@ -3649,7 +3662,7 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 
 		case INSN_JUMP_CONDITIONAL:
 		case INSN_JUMP_UNCONDITIONAL:
-			if (is_sibling_call(insn)) {
+			if (is_sibling_call(file, insn)) {
 				ret = validate_sibling_call(file, insn, &state);
 				if (ret)
 					return ret;
@@ -3670,7 +3683,7 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 
 		case INSN_JUMP_DYNAMIC:
 		case INSN_JUMP_DYNAMIC_CONDITIONAL:
-			if (is_sibling_call(insn)) {
+			if (is_sibling_call(file, insn)) {
 				ret = validate_sibling_call(file, insn, &state);
 				if (ret)
 					return ret;
@@ -3834,7 +3847,7 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 
 		case INSN_JUMP_UNCONDITIONAL:
 		case INSN_JUMP_CONDITIONAL:
-			if (!is_sibling_call(insn)) {
+			if (!is_sibling_call(file, insn)) {
 				if (!insn->jump_dest) {
 					WARN_INSN(insn, "unresolved jump target after linking?!?");
 					return -1;
-- 
2.1.0

