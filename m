Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9D51FBE8D
	for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274629; cv=none; b=WlbFSXM9JSro5duOEYm/Bw7qIgmRAGREuy+TQ7GThrk6vtffioVSNQvhq9NcO/oSJASly7yv/VJyWhhZ/9nLYbTSCKDuG7nL95c2bb2CH8c02H1FsFUSsI9bkNJsWu7IFzaGDRqyvm9M9fnhpzwELrGUH2aKD94ghN8wJOulxY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274629; c=relaxed/simple;
	bh=m/+8q1wrcgoC6wUJG2XUe5g49NSQY+/e+7aNV/Lentw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgHmMpr1sOkuWcEjzpW0jDh0m1bZZSXnaRRbZvo9jBdCAplm+f3dMDO1Oepju1nTVXRBtLIO0D/fJ5B3GNFhiSaYKJ4bOrpIfEnxDP8VALXVolqEmfAoaum2n4BdM0ee8FgH45tMAX4M2GkfXG7c3oRahl5xW2/xSVx9aKvWVOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxaWp+OatnWSJyAA--.2077S3;
	Tue, 11 Feb 2025 19:50:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx3MR6OatnNPMLAA--.43600S5;
	Tue, 11 Feb 2025 19:50:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/7] objtool: Handle PC relative relocation type
Date: Tue, 11 Feb 2025 19:50:12 +0800
Message-ID: <20250211115016.26913-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250211115016.26913-1-yangtiezhu@loongson.cn>
References: <20250211115016.26913-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx3MR6OatnNPMLAA--.43600S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr48Ww13Xw15uryfGFyrKrX_yoW7Jw45pF
	srC398Kr4Yqr1xWw42ya1kWrW5Gws7Wry2qryqqryrZrZFqw15tFWxAFZ8Ka1UXwsYgFWx
	ZFnYgw17AF4qv3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

For the most part, an absolute relocation type is used for rodata.
In the case of STT_SECTION, reloc->sym->offset is always zero, for
the other symbol types, reloc_addend(reloc) is always zero, thus it
can use a simple statement "reloc->sym->offset + reloc_addend(reloc)"
to obtain the symbol offset for various symbol types.

When compiling on LoongArch, there exist PC relative relocation types
for rodata, it needs to calculate the symbol offset with "S + A - PC"
according to the spec of "ELF for the LoongArch Architecture".

If there is only one jump table in the rodata, the "PC" is the entry
address which is equal with the value of reloc_offset(reloc), at this
time, reloc_offset(table) is 0.

If there are many jump tables in the rodata, the "PC" is the offset
of the jump table's base address which is equal with the value of
reloc_offset(reloc) - reloc_offset(table).

So for LoongArch, if the relocation type is PC relative, it can use a
statement "reloc_offset(reloc) - reloc_offset(table)" to get the "PC"
value when calculating the symbol offset with "S + A - PC" for one or
many jump tables in the rodata.

Add an arch-specific function arch_jump_table_sym_offset() to assign
the symbol offset, for the most part that is an absolute relocation,
the default value is "reloc->sym->offset + reloc_addend(reloc)" in
the weak definition, it can be overridden by each architecture that
has different requirements.

Link: https://github.com/loongson/la-abi-specs/blob/release/laelf.adoc
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/decode.c           | 17 +++++++++++++----
 tools/objtool/arch/loongarch/include/arch/elf.h |  7 +++++++
 tools/objtool/check.c                           |  7 ++++++-
 tools/objtool/include/objtool/arch.h            |  1 +
 4 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index b64205b89f6b..02e490555966 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -5,10 +5,7 @@
 #include <asm/inst.h>
 #include <asm/orc_types.h>
 #include <linux/objtool_types.h>
-
-#ifndef EM_LOONGARCH
-#define EM_LOONGARCH	258
-#endif
+#include <arch/elf.h>
 
 int arch_ftrace_match(char *name)
 {
@@ -374,3 +371,15 @@ unsigned int arch_reloc_size(struct reloc *reloc)
 		return 8;
 	}
 }
+
+unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *table)
+{
+	switch (reloc_type(reloc)) {
+	case R_LARCH_32_PCREL:
+	case R_LARCH_64_PCREL:
+		return reloc->sym->offset + reloc_addend(reloc) -
+		       (reloc_offset(reloc) - reloc_offset(table));
+	default:
+		return reloc->sym->offset + reloc_addend(reloc);
+	}
+}
diff --git a/tools/objtool/arch/loongarch/include/arch/elf.h b/tools/objtool/arch/loongarch/include/arch/elf.h
index 9623d663220e..ec79062c9554 100644
--- a/tools/objtool/arch/loongarch/include/arch/elf.h
+++ b/tools/objtool/arch/loongarch/include/arch/elf.h
@@ -18,6 +18,13 @@
 #ifndef R_LARCH_32_PCREL
 #define R_LARCH_32_PCREL	99
 #endif
+#ifndef R_LARCH_64_PCREL
+#define R_LARCH_64_PCREL	109
+#endif
+
+#ifndef EM_LOONGARCH
+#define EM_LOONGARCH		258
+#endif
 
 #define R_NONE			R_LARCH_NONE
 #define R_ABS32			R_LARCH_32
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 85c1988014dc..7174dcb7496e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1943,6 +1943,11 @@ static int add_special_section_alts(struct objtool_file *file)
 	return ret;
 }
 
+__weak unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *table)
+{
+	return reloc->sym->offset + reloc_addend(reloc);
+}
+
 static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 			  struct reloc *next_table)
 {
@@ -1971,7 +1976,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (prev_offset && reloc_offset(reloc) != prev_offset + arch_reloc_size(reloc))
 			break;
 
-		sym_offset = reloc->sym->offset + reloc_addend(reloc);
+		sym_offset = arch_jump_table_sym_offset(reloc, table);
 
 		/* Detect function pointers from contiguous objects: */
 		if (reloc->sym->sec == pfunc->sec && sym_offset == pfunc->offset)
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 396f7c6c81c0..089a1acc48a8 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -98,5 +98,6 @@ int arch_rewrite_retpolines(struct objtool_file *file);
 bool arch_pc_relative_reloc(struct reloc *reloc);
 
 unsigned int arch_reloc_size(struct reloc *reloc);
+unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *table);
 
 #endif /* _ARCH_H */
-- 
2.42.0

