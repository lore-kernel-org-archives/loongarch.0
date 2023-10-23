Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6211118F
	for <loongarch@lists.linux.dev>; Mon, 23 Oct 2023 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxJui3KjZlXuYzAA--.42043S3;
	Mon, 23 Oct 2023 16:11:35 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxG9y0KjZlQRAvAA--.34174S3;
	Mon, 23 Oct 2023 16:11:33 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4 1/8] objtool/LoongArch: Enable objtool to be built
Date: Mon, 23 Oct 2023 16:11:24 +0800
Message-Id: <1698048691-19521-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1698048691-19521-1-git-send-email-yangtiezhu@loongson.cn>
References: <1698048691-19521-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8AxG9y0KjZlQRAvAA--.34174S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtr47ur1kJF13CFW3ZFW7WrX_yoWxZF13pF
	1DC3sxGF48WFyfuw1xt3W5WrW3Jan7WryIqFy2qry8ZFZrX3s7tr4SkrWDAFy8XwsYgFyI
	qFnag3WUZFsFyabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Add the minimal changes to enable objtool build on LoongArch,
most of the functions are stubs to only fix the build errors
when make -C tools/objtool.

This is similar with commit e52ec98c5ab1 ("objtool/powerpc:
Enable objtool to be built on ppc").

Co-developed-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Co-developed-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/Build                 |  2 +
 tools/objtool/arch/loongarch/decode.c              | 71 ++++++++++++++++++++++
 .../objtool/arch/loongarch/include/arch/cfi_regs.h | 22 +++++++
 tools/objtool/arch/loongarch/include/arch/elf.h    | 30 +++++++++
 .../objtool/arch/loongarch/include/arch/special.h  | 33 ++++++++++
 tools/objtool/arch/loongarch/special.c             | 15 +++++
 6 files changed, 173 insertions(+)
 create mode 100644 tools/objtool/arch/loongarch/Build
 create mode 100644 tools/objtool/arch/loongarch/decode.c
 create mode 100644 tools/objtool/arch/loongarch/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/loongarch/include/arch/elf.h
 create mode 100644 tools/objtool/arch/loongarch/include/arch/special.h
 create mode 100644 tools/objtool/arch/loongarch/special.c

diff --git a/tools/objtool/arch/loongarch/Build b/tools/objtool/arch/loongarch/Build
new file mode 100644
index 0000000..d24d563
--- /dev/null
+++ b/tools/objtool/arch/loongarch/Build
@@ -0,0 +1,2 @@
+objtool-y += decode.o
+objtool-y += special.o
diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
new file mode 100644
index 0000000..cc74ba4
--- /dev/null
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <string.h>
+#include <objtool/check.h>
+
+int arch_ftrace_match(char *name)
+{
+	return !strcmp(name, "_mcount");
+}
+
+unsigned long arch_jump_destination(struct instruction *insn)
+{
+	return insn->offset + (insn->immediate << 2);
+}
+
+unsigned long arch_dest_reloc_offset(int addend)
+{
+	return addend;
+}
+
+bool arch_pc_relative_reloc(struct reloc *reloc)
+{
+	return false;
+}
+
+bool arch_callee_saved_reg(unsigned char reg)
+{
+	switch (reg) {
+	case CFI_RA:
+	case CFI_FP:
+	case CFI_S0 ... CFI_S8:
+		return true;
+	default:
+		return false;
+	}
+}
+
+int arch_decode_hint_reg(u8 sp_reg, int *base)
+{
+	return 0;
+}
+
+int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
+			    unsigned long offset, unsigned int maxlen,
+			    struct instruction *insn)
+{
+	return 0;
+}
+
+const char *arch_nop_insn(int len)
+{
+	return NULL;
+}
+
+const char *arch_ret_insn(int len)
+{
+	return NULL;
+}
+
+void arch_initial_func_cfi_state(struct cfi_init_state *state)
+{
+	int i;
+
+	for (i = 0; i < CFI_NUM_REGS; i++) {
+		state->regs[i].base = CFI_UNDEFINED;
+		state->regs[i].offset = 0;
+	}
+
+	/* initial CFA (call frame address) */
+	state->cfa.base = CFI_SP;
+	state->cfa.offset = 0;
+}
diff --git a/tools/objtool/arch/loongarch/include/arch/cfi_regs.h b/tools/objtool/arch/loongarch/include/arch/cfi_regs.h
new file mode 100644
index 0000000..d183cc8
--- /dev/null
+++ b/tools/objtool/arch/loongarch/include/arch/cfi_regs.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _OBJTOOL_ARCH_CFI_REGS_H
+#define _OBJTOOL_ARCH_CFI_REGS_H
+
+#define CFI_RA		1
+#define CFI_SP		3
+#define CFI_A0		4
+#define CFI_FP		22
+#define CFI_S0		23
+#define CFI_S1		24
+#define CFI_S2		25
+#define CFI_S3		26
+#define CFI_S4		27
+#define CFI_S5		28
+#define CFI_S6		29
+#define CFI_S7		30
+#define CFI_S8		31
+#define CFI_NUM_REGS	32
+
+#define CFI_BP		CFI_FP
+
+#endif /* _OBJTOOL_ARCH_CFI_REGS_H */
diff --git a/tools/objtool/arch/loongarch/include/arch/elf.h b/tools/objtool/arch/loongarch/include/arch/elf.h
new file mode 100644
index 0000000..9623d66
--- /dev/null
+++ b/tools/objtool/arch/loongarch/include/arch/elf.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _OBJTOOL_ARCH_ELF_H
+#define _OBJTOOL_ARCH_ELF_H
+
+/*
+ * See the following link for more info about ELF Relocation types:
+ * https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html#_relocations
+ */
+#ifndef R_LARCH_NONE
+#define R_LARCH_NONE		0
+#endif
+#ifndef R_LARCH_32
+#define R_LARCH_32		1
+#endif
+#ifndef R_LARCH_64
+#define R_LARCH_64		2
+#endif
+#ifndef R_LARCH_32_PCREL
+#define R_LARCH_32_PCREL	99
+#endif
+
+#define R_NONE			R_LARCH_NONE
+#define R_ABS32			R_LARCH_32
+#define R_ABS64			R_LARCH_64
+#define R_DATA32		R_LARCH_32_PCREL
+#define R_DATA64		R_LARCH_32_PCREL
+#define R_TEXT32		R_LARCH_32_PCREL
+#define R_TEXT64		R_LARCH_32_PCREL
+
+#endif /* _OBJTOOL_ARCH_ELF_H */
diff --git a/tools/objtool/arch/loongarch/include/arch/special.h b/tools/objtool/arch/loongarch/include/arch/special.h
new file mode 100644
index 0000000..35fc979
--- /dev/null
+++ b/tools/objtool/arch/loongarch/include/arch/special.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _OBJTOOL_ARCH_SPECIAL_H
+#define _OBJTOOL_ARCH_SPECIAL_H
+
+/*
+ * See more info about struct exception_table_entry
+ * in arch/loongarch/include/asm/extable.h
+ */
+#define EX_ENTRY_SIZE		12
+#define EX_ORIG_OFFSET		0
+#define EX_NEW_OFFSET		4
+
+/*
+ * See more info about struct jump_entry
+ * in include/linux/jump_label.h
+ */
+#define JUMP_ENTRY_SIZE		16
+#define JUMP_ORIG_OFFSET	0
+#define JUMP_NEW_OFFSET		4
+#define JUMP_KEY_OFFSET		8
+
+/*
+ * See more info about struct alt_instr
+ * in arch/loongarch/include/asm/alternative.h
+ */
+#define ALT_ENTRY_SIZE		12
+#define ALT_ORIG_OFFSET		0
+#define ALT_NEW_OFFSET		4
+#define ALT_FEATURE_OFFSET	8
+#define ALT_ORIG_LEN_OFFSET	10
+#define ALT_NEW_LEN_OFFSET	11
+
+#endif /* _OBJTOOL_ARCH_SPECIAL_H */
diff --git a/tools/objtool/arch/loongarch/special.c b/tools/objtool/arch/loongarch/special.c
new file mode 100644
index 0000000..9bba1e9
--- /dev/null
+++ b/tools/objtool/arch/loongarch/special.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <objtool/special.h>
+
+bool arch_support_alt_relocation(struct special_alt *special_alt,
+				 struct instruction *insn,
+				 struct reloc *reloc)
+{
+	return false;
+}
+
+struct reloc *arch_find_switch_table(struct objtool_file *file,
+				     struct instruction *insn)
+{
+	return NULL;
+}
-- 
2.1.0

