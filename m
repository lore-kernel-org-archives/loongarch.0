Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAE418652
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxVugU+iNlNE4wAA--.57360S3;
	Mon, 09 Oct 2023 21:03:16 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxzt4P+iNlksscAA--.62948S8;
	Mon, 09 Oct 2023 21:03:16 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 6/8] objtool: Check local label in add_dead_ends()
Date: Mon,  9 Oct 2023 21:03:08 +0800
Message-Id: <1696856590-30298-7-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1696856590-30298-1-git-send-email-yangtiezhu@loongson.cn>
References: <1696856590-30298-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Cxzt4P+iNlksscAA--.62948S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWryUXryUtryDKF1DCw48GrX_yoWrWr15pF
	43C343Kr42yr13Zw47tF1kWasxWw4kGFnrJ39rKF1rAryIvanxKw1ayw15uas8Wr12vw45
	Xay5Kay3uryDA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsZqXUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

When update the latest upstream gcc and binutils which enables linker
relaxation by default, it generates more objtool warnings on LoongArch,
like this:

  init/main.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable

We can see that the reloc sym name is local label instead of section
in relocation section '.rela.discard.unreachable', in this case, the
reloc sym type is STT_NOTYPE instead of STT_SECTION. Let us check it
to not return -1, then use reloc->sym->offset instead of reloc addend
which is 0 to find the corresponding instruction. At the same time,
replace the variable "addend" with "offset" to reflect the reality.

Here are some detailed info:
[fedora@linux 6.6.test]$ gcc --version
gcc (GCC) 14.0.0 20231009 (experimental)
[fedora@linux 6.6.test]$ as --version
GNU assembler (GNU Binutils) 2.41.50.20231009
[fedora@linux 6.6.test]$ readelf -r init/main.o | grep -A 2 "rela.discard.unreachable"
Relocation section '.rela.discard.unreachable' at offset 0x4b70 contains 1 entry:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000000  00de00000063 R_LARCH_32_PCREL  0000000000000228 .L466^B1 + 0

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index a9cb224..eee5621 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -611,7 +611,7 @@ static int add_dead_ends(struct objtool_file *file)
 	struct section *rsec;
 	struct reloc *reloc;
 	struct instruction *insn;
-	s64 addend;
+	unsigned long offset;
 
 	/*
 	 * Check for manually annotated dead ends.
@@ -622,26 +622,29 @@ static int add_dead_ends(struct objtool_file *file)
 
 	for_each_reloc(rsec, reloc) {
 
-		if (reloc->sym->type != STT_SECTION) {
+		if (reloc->sym->type == STT_SECTION) {
+			offset = reloc_addend(reloc);
+		} else if ((reloc->sym->type == STT_NOTYPE) &&
+			    strncmp(reloc->sym->name, ".L", 2) == 0) {
+			offset = reloc->sym->offset;
+		} else {
 			WARN("unexpected relocation symbol type in %s", rsec->name);
 			return -1;
 		}
 
-		addend = reloc_addend(reloc);
-
-		insn = find_insn(file, reloc->sym->sec, addend);
+		insn = find_insn(file, reloc->sym->sec, offset);
 		if (insn)
 			insn = prev_insn_same_sec(file, insn);
-		else if (addend == reloc->sym->sec->sh.sh_size) {
+		else if (offset == reloc->sym->sec->sh.sh_size) {
 			insn = find_last_insn(file, reloc->sym->sec);
 			if (!insn) {
 				WARN("can't find unreachable insn at %s+0x%" PRIx64,
-				     reloc->sym->sec->name, addend);
+				     reloc->sym->sec->name, offset);
 				return -1;
 			}
 		} else {
 			WARN("can't find unreachable insn at %s+0x%" PRIx64,
-			     reloc->sym->sec->name, addend);
+			     reloc->sym->sec->name, offset);
 			return -1;
 		}
 
@@ -661,26 +664,29 @@ static int add_dead_ends(struct objtool_file *file)
 
 	for_each_reloc(rsec, reloc) {
 
-		if (reloc->sym->type != STT_SECTION) {
+		if (reloc->sym->type == STT_SECTION) {
+			offset = reloc_addend(reloc);
+		} else if ((reloc->sym->type == STT_NOTYPE) &&
+			    strncmp(reloc->sym->name, ".L", 2) == 0) {
+			offset = reloc->sym->offset;
+		} else {
 			WARN("unexpected relocation symbol type in %s", rsec->name);
 			return -1;
 		}
 
-		addend = reloc_addend(reloc);
-
-		insn = find_insn(file, reloc->sym->sec, addend);
+		insn = find_insn(file, reloc->sym->sec, offset);
 		if (insn)
 			insn = prev_insn_same_sec(file, insn);
-		else if (addend == reloc->sym->sec->sh.sh_size) {
+		else if (offset == reloc->sym->sec->sh.sh_size) {
 			insn = find_last_insn(file, reloc->sym->sec);
 			if (!insn) {
 				WARN("can't find reachable insn at %s+0x%" PRIx64,
-				     reloc->sym->sec->name, addend);
+				     reloc->sym->sec->name, offset);
 				return -1;
 			}
 		} else {
 			WARN("can't find reachable insn at %s+0x%" PRIx64,
-			     reloc->sym->sec->name, addend);
+			     reloc->sym->sec->name, offset);
 			return -1;
 		}
 
-- 
2.1.0

