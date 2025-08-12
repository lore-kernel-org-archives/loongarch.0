Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13622853F8
	for <loongarch@lists.linux.dev>; Tue, 12 Aug 2025 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005250; cv=none; b=pKtkWVaF16ts40pLYFpw5ZJTYCxOecKehA79pDzApYTDrkBKus90nBrAnYEQPhc2zr4STBeUjdIqjjkqOLMGgeDgKaVc4M16T4rpokgqd9fvurgFWFUs41VaU86OhI5JFLBdcrt5x7vicA9k+Ai0wcIEJSl2sSxnj0gueeY5IN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005250; c=relaxed/simple;
	bh=YsfABY+geXyns0rel8JN53SfnmFhuUqAJoYdE0vpRKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unr6WNysKwLgZaE8GAPsN5ejnBsFWs0lbMLRCgTdpo9yISKPRRrHICBo6RPXD0QKeGO1rVQZR7reM3mr+1N4vMV0Ppu4sqERAL1UCH+u3owubyXs9LcHrP1spKXxkj7pg9P48gJT+Z4Q7xfaa+JoMgLRfwEK9wKXkDRYHtncq14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxaWo6QZtoIfg+AQ--.57821S3;
	Tue, 12 Aug 2025 21:27:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxdOQ0QZtoOLVGAA--.6029S3;
	Tue, 12 Aug 2025 21:27:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] objtool/LoongArch: Get table size correctly if LTO is enabled
Date: Tue, 12 Aug 2025 21:27:15 +0800
Message-ID: <20250812132716.1465-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250812132716.1465-1-yangtiezhu@loongson.cn>
References: <20250812132716.1465-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxdOQ0QZtoOLVGAA--.6029S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF47XFyftw1UAryUGFWDKFX_yoW5Cw4rpF
	W5C3srtrW5Xry2gw1ayayjgFW3t397GF12grnxK348Aw4aq3Waqa17Z3sIvFyFgrZ5Ar4I
	qrs3KryUGF4qyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist
many objtool warnings "sibling call from callable instruction with
modified stack frame".

For this special case, the related object file shows that there is
no generated relocation section '.rela.discard.tablejump_annotate'
for the table jump instruction jirl, thus objtool can not know that
what is the actual destination address.

It needs to do something on the LLVM side to make sure that there is
the relocation section '.rela.discard.tablejump_annotate' if LTO is
enabled, but in order to maintain compatibility for the current LLVM
compiler, this can be done in the kernel Makefile for now. Ensure it
is aware of linker with LTO, '--loongarch-annotate-tablejump' needs
to be passed via '-mllvm' to ld.lld.

Before doing the above changes, it should handle the special case of
the relocation section '.rela.discard.tablejump_annotate' to get the
correct table size first, otherwise there are many objtool warnings
and errors if LTO is enabled.

There are many different rodata for each function if LTO is enabled,
it is necessary to enhance get_rodata_table_size_by_table_annotate().

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/loongarch/20250731175655.GA1455142@ax162/
Fixes: b95f852d3af2 ("objtool/LoongArch: Add support for switch table")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/special.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/objtool/arch/loongarch/special.c b/tools/objtool/arch/loongarch/special.c
index e39f86d97002..a80b75f7b061 100644
--- a/tools/objtool/arch/loongarch/special.c
+++ b/tools/objtool/arch/loongarch/special.c
@@ -27,6 +27,7 @@ static void get_rodata_table_size_by_table_annotate(struct objtool_file *file,
 	struct table_info *next_table;
 	unsigned long tmp_insn_offset;
 	unsigned long tmp_rodata_offset;
+	bool is_valid_list = false;
 
 	rsec = find_section_by_name(file->elf, ".rela.discard.tablejump_annotate");
 	if (!rsec)
@@ -35,6 +36,12 @@ static void get_rodata_table_size_by_table_annotate(struct objtool_file *file,
 	INIT_LIST_HEAD(&table_list);
 
 	for_each_reloc(rsec, reloc) {
+		if (reloc->sym->sec->rodata)
+			continue;
+
+		if (strcmp(insn->sec->name, reloc->sym->sec->name))
+			continue;
+
 		orig_table = malloc(sizeof(struct table_info));
 		if (!orig_table) {
 			WARN("malloc failed");
@@ -49,6 +56,22 @@ static void get_rodata_table_size_by_table_annotate(struct objtool_file *file,
 
 		if (reloc_idx(reloc) + 1 == sec_num_entries(rsec))
 			break;
+
+		if (strcmp(insn->sec->name, (reloc + 1)->sym->sec->name)) {
+			list_for_each_entry(orig_table, &table_list, jump_info) {
+				if (orig_table->insn_offset == insn->offset) {
+					is_valid_list = true;
+					break;
+				}
+			}
+
+			if (!is_valid_list) {
+				list_del_init(&table_list);
+				continue;
+			}
+
+			break;
+		}
 	}
 
 	list_for_each_entry(orig_table, &table_list, jump_info) {
-- 
2.42.0

