Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61B476034
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 01:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733536771; cv=none; b=BvRmwdchj1WzFzJfBSthPIlsntdeeZdtE68dU2XgVe92UZ6IAaok2Q3/FRzcS6+CnPa/U2Hcw3f25oVVW/g9qe4+IxibHB4EPaSkFFm6eEQPLyivbj3/8+d6E4AZcX8SKETjC7/aHjE+KnNDHjd/z8tXk4yWdU0a9WEt6du+rrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733536771; c=relaxed/simple;
	bh=9Q7dz9jM5oZIZ8a2FKoquMcBtbWYyAdtBn1B+G4tBco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEEbhB/DG+QigRePyvGx5lu5uJqPtq5rvmq6oWt5O9k1CF09FbcsUUMCNTIQVsjacv1DbRhlhWFDEVhUxGHNT6P2WcTy94pXpapJMUcJFofe0LdRb4UdFdWDcA6IdNZJvF0/FJSrYPf6wcid7tWCa5jvZ1qcEuyiP6ugah9MAkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxCeH+q1NnJa1SAA--.29694S3;
	Sat, 07 Dec 2024 09:59:26 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx_uD1q1Nn3Wd5AA--.42544S8;
	Sat, 07 Dec 2024 09:59:26 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/10] objtool/LoongArch: Get each table size of rodata
Date: Sat,  7 Dec 2024 09:59:11 +0800
Message-ID: <20241207015915.1159-7-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241207015915.1159-1-yangtiezhu@loongson.cn>
References: <20241207015915.1159-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx_uD1q1Nn3Wd5AA--.42544S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF48uw1UZw43uw4DJF1xXrc_yoWrWFWrpF
	95C34DtrWYqFy8WF47JF4ayrW3Jw48Wry7Gr9rKw1Fy343tr9Yqay2vasIk3Z5JrZ8Cr1S
	qFWrKr1xuF4kArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

When compiling with Clang on LoongArch, there are unsorted table offset
of rodata if there exist many jump tables, it will get the wrong table
end and find the wrong jump destination instructions in add_jump_table().

Sort the rodata table offset by parsing ".rela.discard.tablejump_annotate"
and then get each table size of rodata corresponded with each table jump
instruction, it is used to check the table end and will break the process
when parsing ".rela.rodata" to avoid getting the wrong jump destination
instructions.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/special.c | 83 ++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tools/objtool/arch/loongarch/special.c b/tools/objtool/arch/loongarch/special.c
index f933f6b5bac6..c1db0c59f9a1 100644
--- a/tools/objtool/arch/loongarch/special.c
+++ b/tools/objtool/arch/loongarch/special.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include <string.h>
 #include <objtool/special.h>
+#include <objtool/warn.h>
 
 bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
@@ -9,6 +10,87 @@ bool arch_support_alt_relocation(struct special_alt *special_alt,
 	return false;
 }
 
+struct table_info {
+	struct list_head jump_info;
+	unsigned long insn_offset;
+	unsigned long rodata_offset;
+};
+
+static void get_rodata_table_size_by_table_annotate(struct objtool_file *file,
+						    struct instruction *insn,
+						    unsigned long *table_size)
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
+		if (reloc->sym->type != STT_SECTION) {
+			*table_size = 0;
+			return;
+		}
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
+			if (&next_table->jump_info == &table_list) {
+				*table_size = 0;
+				return;
+			}
+
+			while (next_table->rodata_offset == orig_table->rodata_offset) {
+				next_table = list_next_entry(next_table, jump_info);
+				if (&next_table->jump_info == &table_list) {
+					*table_size = 0;
+					return;
+				}
+			}
+
+			*table_size = next_table->rodata_offset - orig_table->rodata_offset;
+		}
+	}
+}
+
 static struct reloc *find_reloc_by_table_annotate(struct objtool_file *file,
 						  struct instruction *insn,
 						  unsigned long *table_size)
@@ -30,6 +112,7 @@ static struct reloc *find_reloc_by_table_annotate(struct objtool_file *file,
 
 		offset = reloc->sym->offset + reloc_addend(reloc);
 		if (insn->offset == offset) {
+			get_rodata_table_size_by_table_annotate(file, insn, table_size);
 			reloc++;
 			return reloc;
 		}
-- 
2.42.0

