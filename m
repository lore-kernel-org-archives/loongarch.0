Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174EA1E8834
	for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992363; cv=none; b=Y3TWjeDHprUJVaHXp8RIHjIfr4Czx1Pv3X6ivAYmkZV1+wWOjHgI6bxEfE06K/2IuGsxDXlWjpSLRC0Ws1cF+yaxodnYnNeq/wj0SfvcTXdLJtebm5Luou0R+DZVX8aEgCX1V2CSO5Efdqc2eES0zrrgSyhHW3mae8Wxz/qJBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992363; c=relaxed/simple;
	bh=+QVfX6uapABdVeCjMpgWmzX0OQSpPJMdLuTtOhOojko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nd77opW9tQspoz3qKFz6dn4rq/BgRBagLlgeiC9IjQ+6xSi2KjF1KAojHLzzkYAuuBa0ctJa+KcdK446ETAZBmbg8g/U46C83ETRNwxkOh7j01nD+f1D9xR9rl+AWyrKuuA5/6BpTpMuq+lr2FcR1HN1u3K/SuHHx6Hnz0VXUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxjmtmVA5n538dAA--.42426S3;
	Tue, 15 Oct 2024 19:39:18 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front2 (Coremail) with SMTP id qciowMCxbcdkVA5n6E0uAA--.9583S3;
	Tue, 15 Oct 2024 19:39:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] objtool: Check various symbol types for jump table
Date: Tue, 15 Oct 2024 19:39:10 +0800
Message-ID: <20241015113915.12623-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241015113915.12623-1-yangtiezhu@loongson.cn>
References: <20241015113915.12623-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMCxbcdkVA5n6E0uAA--.9583S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFWDKF4kAF4kGrW3Aw4xGrX_yoW5GFykpF
	sxG345Kr4Yqr1xWwnrtFZY9Fy3Gws7WFnrJrZrKr4Fv3sFvr1rKFWakw1ay3WDGr1Svw47
	XF4Ygry7uF4UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

In the relocation section ".rela.rodata" of each .o file compiled with
LoongArch toolchain, there are various symbol types such as STT_NOTYPE,
STT_OBJECT, STT_FUNC in addition to the usual STT_SECTION, it needs to
use reloc symbol offset instead of reloc addend to find the destination
instruction in find_jump_table() and add_jump_table().

This is preparation for later patch on LoongArch, there is no effect
for the other archs with this patch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 6604f5d038aa..cda7306d07c2 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2079,6 +2079,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	unsigned int prev_offset = 0;
 	struct reloc *reloc = table;
 	struct alternative *alt;
+	unsigned long offset;
 
 	/*
 	 * Each @reloc is a switch table relocation which points to the target
@@ -2094,12 +2095,16 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
 			break;
 
+		if (reloc->sym->type == STT_SECTION)
+			offset = reloc_addend(reloc);
+		else
+			offset = reloc->sym->offset;
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
 
@@ -2137,6 +2142,7 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 {
 	struct reloc *table_reloc;
 	struct instruction *dest_insn, *orig_insn = insn;
+	unsigned long offset;
 
 	/*
 	 * Backward search using the @first_jump_src links, these help avoid
@@ -2160,7 +2166,13 @@ static struct reloc *find_jump_table(struct objtool_file *file,
 		table_reloc = arch_find_switch_table(file, insn);
 		if (!table_reloc)
 			continue;
-		dest_insn = find_insn(file, table_reloc->sym->sec, reloc_addend(table_reloc));
+
+		if (table_reloc->sym->type == STT_SECTION)
+			offset = reloc_addend(table_reloc);
+		else
+			offset = table_reloc->sym->offset;
+
+		dest_insn = find_insn(file, table_reloc->sym->sec, offset);
 		if (!dest_insn || !insn_func(dest_insn) || insn_func(dest_insn)->pfunc != func)
 			continue;
 
-- 
2.42.0

