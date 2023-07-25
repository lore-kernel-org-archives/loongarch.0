Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8166213ADF
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 08:15:20 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxqOqThL9kCKQJAA--.14665S3;
	Tue, 25 Jul 2023 16:15:15 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLCOOhL9kAFg6AA--.7611S7;
	Tue, 25 Jul 2023 16:15:15 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v1 5/6] objtool: Add skipped member in struct reloc
Date: Tue, 25 Jul 2023 16:15:09 +0800
Message-Id: <1690272910-11869-6-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
References: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8CxLCOOhL9kAFg6AA--.7611S7
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFWxZFy3tw13Aw1rXrW3twc_yoW5tr4kpF
	4DG3y7KFW8Xr17Gw12qF4UC3y5W3sruFyxJrWUAry0krnrXrn8Jw4ayr1jyFyUWr4YgFW5
	XFyYg34Utr1qvwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

There exist multiple relocation types in one location, such as a pair of
R_LARCH_ADD32 and R_LARCH_SUB32 in section .rela.discard.unreachable and
.rela.discard.reachable on LoongArch.

Here is an example:

$ readelf -rW init/main.o

Relocation section '.rela.discard.unreachable' at offset 0x3e20 contains 2 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  0000000a00000032 R_LARCH_ADD32          0000000000000000 .init.text + 230
0000000000000000  0000001a00000037 R_LARCH_SUB32          0000000000000000 L0^A + 0

Relocation section '.rela.discard.reachable' at offset 0x4a00 contains 6 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  0000000a00000032 R_LARCH_ADD32          0000000000000000 .init.text + ae0
0000000000000000  0000002800000037 R_LARCH_SUB32          0000000000000000 L0^A + 0
0000000000000004  0000000a00000032 R_LARCH_ADD32          0000000000000000 .init.text + b88
0000000000000004  0000002b00000037 R_LARCH_SUB32          0000000000000004 L0^A + 0
0000000000000008  0000000200000032 R_LARCH_ADD32          0000000000000000 .text + 23c
0000000000000008  0000002e00000037 R_LARCH_SUB32          0000000000000008 L0^A + 0

In order to silence the related objtool warnings, add skipped member
in struct reloc to record and skip the latter relocation.

Co-developed-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Co-developed-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c               | 4 ++++
 tools/objtool/elf.c                 | 6 ++++++
 tools/objtool/include/objtool/elf.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 9e5e462..602318e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -594,6 +594,8 @@ static int add_dead_ends(struct objtool_file *file)
 		goto reachable;
 
 	for_each_reloc(rsec, reloc) {
+		if (reloc->skipped)
+			continue;
 
 		if (reloc->sym->type != STT_SECTION) {
 			WARN("unexpected relocation symbol type in %s", rsec->name);
@@ -633,6 +635,8 @@ static int add_dead_ends(struct objtool_file *file)
 		return 0;
 
 	for_each_reloc(rsec, reloc) {
+		if (reloc->skipped)
+			continue;
 
 		if (reloc->sym->type != STT_SECTION) {
 			WARN("unexpected relocation symbol type in %s", rsec->name);
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index d420b5d..bd950d4 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -975,6 +975,12 @@ static int read_relocs(struct elf *elf)
 				return -1;
 			}
 
+			if (!(strcmp(rsec->name, ".rela.discard.unreachable")) ||
+			    !(strcmp(rsec->name, ".rela.discard.reachable"))) {
+				if (reloc->sym->type != STT_SECTION)
+					reloc->skipped = true;
+			}
+
 			elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
 			reloc->sym_next_reloc = sym->relocs;
 			sym->relocs = reloc;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index c532d70..4141837 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -75,6 +75,7 @@ struct reloc {
 	struct section *sec;
 	struct symbol *sym;
 	struct reloc *sym_next_reloc;
+	bool skipped;
 };
 
 struct elf {
-- 
2.1.0

