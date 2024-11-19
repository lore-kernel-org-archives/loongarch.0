Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BE319ABCE
	for <loongarch@lists.linux.dev>; Tue, 19 Nov 2024 06:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999428; cv=none; b=XYr2vRC92QofTPj87R8owLt1Zjt6G9FF3CIfCWclS8FkVU+SDRa6uk6ADgWhlfq5baiX9e8+Ld26uYabsxerhxxa5dEz+eotVStPTJr4DmRPMRu8dHY7rJZ8NHJCPCM28H1S+LamBVy0ow7ylBoU2J9fn2jZEggMgHUxziRowIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999428; c=relaxed/simple;
	bh=U76I/hWykKRbyzMCtFBw6tfSwAXietSBOB/FdHQh8KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dks+2WUIi/s0R2BOgbeEe17LmeXrd/k4PQUg9Iws0ts+3ClnGOaPU7mf9fSt6JdvWntKKJFYZaqR/jzcfa6VByN5uGkR6dUtfIsk9Uonq7n8Xg1dZrOnWCsS67hEGzdl7+XTpmS0KSRuUy+tpMOISsbMMbLcznDi/wCH5vwLpbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxWOHANjxncDZCAA--.64265S3;
	Tue, 19 Nov 2024 14:57:04 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxDuG4NjxnB_5cAA--.5437S9;
	Tue, 19 Nov 2024 14:57:03 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] objtool/LoongArch: Get each table size of rodata
Date: Tue, 19 Nov 2024 14:56:52 +0800
Message-ID: <20241119065655.21123-8-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241119065655.21123-1-yangtiezhu@loongson.cn>
References: <20241119065655.21123-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxDuG4NjxnB_5cAA--.5437S9
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZryxuFyUJFWftF4Duw47Jrc_yoW5KF48pF
	95C3s8trWYqFy5WF47AF4SyrW3Jw48WryxGr9rG3WFy343tr9Yqay2qasIk3Z5JrZ8Cr1S
	qFWrKr1xuF4kArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==

When compling with Clang on LoongArch, there are unsorted table offset
of rodata if there exist many jump tables, it will get the wrong table
end and find the wrong jump destination instructions in add_jump_table().

Sort the rodata table offset by parsing ".rela.discard.tablejump_annotate"
and then get each table size of rodata corresponded with each table jump
instruction, it is used to check the table end and will break the process
when parsing ".rela.rodata" to avoid getting the wrong jump destination
instructions.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/special.c | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tools/objtool/arch/loongarch/special.c b/tools/objtool/arch/loongarch/special.c
index 9bba1e9318e0..454bd01226a4 100644
--- a/tools/objtool/arch/loongarch/special.c
+++ b/tools/objtool/arch/loongarch/special.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include <objtool/special.h>
+#include <objtool/warn.h>
 
 bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
@@ -8,6 +9,77 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 	return false;
 }
 
+struct table_info {
+	struct list_head jump_info;
+	unsigned long insn_offset;
+	unsigned long rodata_offset;
+};
+
+static void get_rodata_table_size_by_table_annotate(struct objtool_file *file,
+						    struct instruction *insn)
+{
+	struct section *rsec;
+	struct reloc *reloc;
+	struct list_head table_list;
+	struct table_info *orig_table;
+	struct table_info *next_table;
+	unsigned long tmp_insn_offset;
+	unsigned long tmp_rodata_offset;
+
+	rsec = find_section_by_name(file->elf, ".rela.discard.tablejump_annotate");
+	if (!rsec)
+		return;
+
+	INIT_LIST_HEAD(&table_list);
+
+	for_each_reloc(rsec, reloc) {
+		if (reloc->sym->type != STT_SECTION)
+			return;
+
+		orig_table = malloc(sizeof(struct table_info));
+		if (!orig_table) {
+			WARN("malloc failed");
+			return;
+		}
+
+		orig_table->insn_offset = reloc_addend(reloc);
+		reloc++;
+		orig_table->rodata_offset = reloc_addend(reloc);
+
+		list_add_tail(&orig_table->jump_info, &table_list);
+
+		if (reloc_idx(reloc) + 1 == sec_num_entries(rsec))
+			break;
+	}
+
+	list_for_each_entry(orig_table, &table_list, jump_info) {
+		next_table = list_next_entry(orig_table, jump_info);
+		list_for_each_entry_from(next_table, &table_list, jump_info) {
+			if (next_table->rodata_offset < orig_table->rodata_offset) {
+				tmp_insn_offset = next_table->insn_offset;
+				tmp_rodata_offset = next_table->rodata_offset;
+				next_table->insn_offset = orig_table->insn_offset;
+				next_table->rodata_offset = orig_table->rodata_offset;
+				orig_table->insn_offset = tmp_insn_offset;
+				orig_table->rodata_offset = tmp_rodata_offset;
+			}
+		}
+	}
+
+	list_for_each_entry(orig_table, &table_list, jump_info) {
+		if (insn->offset == orig_table->insn_offset) {
+			next_table = list_next_entry(orig_table, jump_info);
+			if (&next_table->jump_info == &table_list)
+				break;
+
+			while (next_table->rodata_offset == orig_table->rodata_offset)
+				next_table = list_next_entry(next_table, jump_info);
+
+			insn->table_size = next_table->rodata_offset - orig_table->rodata_offset;
+		}
+	}
+}
+
 struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     struct instruction *insn)
 {
-- 
2.42.0

