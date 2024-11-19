Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E60614C5A1
	for <loongarch@lists.linux.dev>; Tue, 19 Nov 2024 06:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999422; cv=none; b=tjJIDAYnA+m0xoy4EeQIsoAADBwvCp6/O9xLExC6f6GE/cOhVlvirJNEgiHJ0u60buX8ILTh5xVF00jb35ASjzTpVfu3jmRRL/3WiKa40yQIwTMhPFMUM5SQa/eNDO9Masv5rnHAB8jAgObe1hxwPV7n+G4W+jWYIHJGgwbmh0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999422; c=relaxed/simple;
	bh=WQBjV7XvQFc38Q87Jv1cXvfn27Td+pGBvefYsoaVrgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+eZ6Dr9loC4srthofNeofZagnm0+b5lYMGKV2oq3B+Rh+VC2yJfeyRB3EiIxBGxexBGSI14y+fjDZXT4mAPJcb17WDmjBLagimi4taUn3tsVS6VvC2o6Bpm4zvR2EwQlhvrBsQXfWAzdVUexxE4WxPuF/u28pdlITsEv7xr0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxuuC6NjxnUzZCAA--.152S3;
	Tue, 19 Nov 2024 14:56:58 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxDuG4NjxnB_5cAA--.5437S3;
	Tue, 19 Nov 2024 14:56:58 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/10] objtool: Handle various symbol types of rodata
Date: Tue, 19 Nov 2024 14:56:46 +0800
Message-ID: <20241119065655.21123-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMCxDuG4NjxnB_5cAA--.5437S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFWDKF4kAF4kGFWfGw18Xrc_yoW5Ww4xpF
	sxG3y5Kr45Xr1fWws7tFW0gF9xGws7WrnrJ39rKr1rA3sIqF1rKFWSkr1ay3WDGr1Fva17
	XF1Y9ry7uF4UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

In the relocation section ".rela.rodata" of each .o file compiled with
LoongArch toolchain, there are various symbol types such as STT_NOTYPE,
STT_OBJECT, STT_FUNC in addition to the usual STT_SECTION, it needs to
use reloc symbol offset instead of reloc addend to find the destination
instruction in find_jump_table() and add_jump_table().

This is preparation for later patch on LoongArch, there is no effect for
the other archs with this patch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 6604f5d038aa..9601235e908d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2079,6 +2079,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	unsigned int prev_offset = 0;
 	struct reloc *reloc = table;
 	struct alternative *alt;
+	unsigned long offset;
 
 	/*
 	 * Each @reloc is a switch table relocation which points to the target
@@ -2094,12 +2095,19 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
 			break;
 
+		if (reloc->sym->type == STT_SECTION) {
+			/* Addend field in the relocation entry associated with the symbol */
+			offset = reloc_addend(reloc);
+		} else {
+			/* The address of the symbol in the relocation entry */
+			offset = reloc->sym->offset;
+		}
+
 		/* Detect function pointers from contiguous objects: */
-		if (reloc->sym->sec == pfunc->sec &&
-		    reloc_addend(reloc) == pfunc->offset)
+		if (reloc->sym->sec == pfunc->sec && offset == pfunc->offset)
 			break;
 
-		dest_insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		dest_insn = find_insn(file, reloc->sym->sec, offset);
 		if (!dest_insn)
 			break;
 
@@ -2137,6 +2145,7 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 {
 	struct reloc *table_reloc;
 	struct instruction *dest_insn, *orig_insn = insn;
+	unsigned long offset;
 
 	/*
 	 * Backward search using the @first_jump_src links, these help avoid
@@ -2160,7 +2169,16 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 		table_reloc = arch_find_switch_table(file, insn);
 		if (!table_reloc)
 			continue;
-		dest_insn = find_insn(file, table_reloc->sym->sec, reloc_addend(table_reloc));
+
+		if (table_reloc->sym->type == STT_SECTION) {
+			/* Addend field in the relocation entry associated with the symbol */
+			offset = reloc_addend(table_reloc);
+		} else {
+			/* The address of the symbol in the relocation entry */
+			offset = table_reloc->sym->offset;
+		}
+
+		dest_insn = find_insn(file, table_reloc->sym->sec, offset);
 		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
 			continue;
 
-- 
2.42.0

