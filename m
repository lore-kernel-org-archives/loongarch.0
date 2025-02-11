Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29161FA14B
	for <loongarch@lists.linux.dev>; Tue, 11 Feb 2025 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274627; cv=none; b=Kkm4ntLxNllnBn5Gq5AM6fYXJgXAdUJgTccw/RS4GppZL+kuSosgMfhncppdJozCSjyC3+X/DcazhPWV7/DVusxvvFsNhWf3rRJnh5Zg0b5Nu14sXUqOZ9VnksnJgfLjeeEb8f/+x2vBc1P88MBCLj3FLh550fOFUc9DvMVfbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274627; c=relaxed/simple;
	bh=I2bh1IgVEJP0j2X0fdv/oouyQUoy4UFx6/Fh1pbIfzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOXn/f0k/WpbJs22YGmgsPFgyWzeREqHzrbODGl18dtrav0WHwwtY52zo38yXa7WmcMiGXWx18wCllgh8jTjgslrzot/Ey6kUodkGjRWbbCxtvkEebfFre8FdwJn5Epso1X5J1+r3h033F8tfIHH3WaQu+Jz1e/cu+ape9CM6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3658OatnUSJyAA--.49934S3;
	Tue, 11 Feb 2025 19:50:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx3MR6OatnNPMLAA--.43600S3;
	Tue, 11 Feb 2025 19:50:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/7] objtool: Handle various symbol types of rodata
Date: Tue, 11 Feb 2025 19:50:10 +0800
Message-ID: <20250211115016.26913-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMBx3MR6OatnNPMLAA--.43600S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFWDKF47Ww48JF18Gw1Dtwc_yoW5Zr17pF
	sxG3y5Kr4Yqr1xWwnrtayvgFy3Jw4kWr47JrsrKryrZ3sFvr1rKFW2yw1ak3Z8Grnava17
	XrWYvryxGF4DA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU88HUDUUUUU==

In the relocation section ".rela.rodata" of each .o file compiled with
LoongArch toolchain, there are various symbol types such as STT_NOTYPE,
STT_OBJECT, STT_FUNC in addition to the usual STT_SECTION, it needs to
use reloc symbol offset instead of reloc addend to find the destination
instruction in find_jump_table() and add_jump_table().

For the most part, an absolute relocation type is used for rodata. In the
case of STT_SECTION, reloc->sym->offset is always zero, and for the other
symbol types, reloc_addend(reloc) is always zero, thus it can use a simple
statement "reloc->sym->offset + reloc_addend(reloc)" to obtain the symbol
offset for various symbol types.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 497cb8dfb3eb..a84e76e8eae4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1953,6 +1953,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	unsigned int prev_offset = 0;
 	struct reloc *reloc = table;
 	struct alternative *alt;
+	unsigned long sym_offset;
 
 	/*
 	 * Each @reloc is a switch table relocation which points to the target
@@ -1970,9 +1971,10 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
 			break;
 
+		sym_offset = reloc->sym->offset + reloc_addend(reloc);
+
 		/* Detect function pointers from contiguous objects: */
-		if (reloc->sym->sec == pfunc->sec &&
-		    reloc_addend(reloc) == pfunc->offset)
+		if (reloc->sym->sec == pfunc->sec && sym_offset == pfunc->offset)
 			break;
 
 		/*
@@ -1980,10 +1982,10 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		 * which point to the end of the function.  Ignore them.
 		 */
 		if (reloc->sym->sec == pfunc->sec &&
-		    reloc_addend(reloc) == pfunc->offset + pfunc->len)
+		    sym_offset == pfunc->offset + pfunc->len)
 			goto next;
 
-		dest_insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		dest_insn = find_insn(file, reloc->sym->sec, sym_offset);
 		if (!dest_insn)
 			break;
 
@@ -2022,6 +2024,7 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 	struct reloc *table_reloc;
 	struct instruction *dest_insn, *orig_insn = insn;
 	unsigned long table_size;
+	unsigned long sym_offset;
 
 	/*
 	 * Backward search using the @first_jump_src links, these help avoid
@@ -2045,7 +2048,10 @@ static void find_jump_table(struct objtool_file *file, struct symbol *func,
 		table_reloc = arch_find_switch_table(file, insn, &table_size);
 		if (!table_reloc)
 			continue;
-		dest_insn = find_insn(file, table_reloc->sym->sec, reloc_addend(table_reloc));
+
+		sym_offset = table_reloc->sym->offset + reloc_addend(table_reloc);
+
+		dest_insn = find_insn(file, table_reloc->sym->sec, sym_offset);
 		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
 			continue;
 
-- 
2.42.0

