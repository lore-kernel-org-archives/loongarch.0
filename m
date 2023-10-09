Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A742D18654
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxXesU+iNlOU4wAA--.22075S3;
	Mon, 09 Oct 2023 21:03:16 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxzt4P+iNlksscAA--.62948S9;
	Mon, 09 Oct 2023 21:03:16 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 7/8] objtool: Check local label in read_unwind_hints()
Date: Mon,  9 Oct 2023 21:03:09 +0800
Message-Id: <1696856590-30298-8-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1696856590-30298-1-git-send-email-yangtiezhu@loongson.cn>
References: <1696856590-30298-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Cxzt4P+iNlksscAA--.62948S9
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFyrZw45KFWrCw4xWF47ZFc_yoW8trW5pF
	W3C34agr40qry7uw17tFy8WasxKws7CF17trZrGr4rAry2qw15KF9Iyr15tF9rWr15uw47
	XF98Ka4293WqyabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIwIDUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

When update the latest upstream gcc and binutils which enables linker
relaxation by default, it generates more objtool warnings on LoongArch.

We can see that the reloc sym name is local label instead of section
in relocation section '.rela.discard.unwind_hints', in this case, the
reloc sym type is STT_NOTYPE instead of STT_SECTION. Let us check it
to not return -1, then use reloc->sym->offset instead of reloc addend
which is 0 to find the corresponding instruction.

Here are some detailed info:
[fedora@linux 6.6.test]$ gcc --version
gcc (GCC) 14.0.0 20231009 (experimental)
[fedora@linux 6.6.test]$ as --version
GNU assembler (GNU Binutils) 2.41.50.20231009
[fedora@linux 6.6.test]$ readelf -r arch/loongarch/kernel/entry.o | grep -A 2 "rela.discard.unwind_hints"
Relocation section '.rela.discard.unwind_hints' at offset 0x458 contains 7 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000000  000800000063 R_LARCH_32_PCREL  000000000000001c .Lhere_1 + 0

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index eee5621..607a745 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2227,6 +2227,7 @@ static int read_unwind_hints(struct objtool_file *file)
 	struct unwind_hint *hint;
 	struct instruction *insn;
 	struct reloc *reloc;
+	unsigned long offset;
 	int i;
 
 	sec = find_section_by_name(file->elf, ".discard.unwind_hints");
@@ -2254,7 +2255,17 @@ static int read_unwind_hints(struct objtool_file *file)
 			return -1;
 		}
 
-		insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		if (reloc->sym->type == STT_SECTION) {
+			offset = reloc_addend(reloc);
+		} else if ((reloc->sym->type == STT_NOTYPE) &&
+			strncmp(reloc->sym->name, ".L", 2) == 0) {
+			offset = reloc->sym->offset;
+		} else {
+			WARN("unexpected relocation symbol type in %s", sec->rsec->name);
+			return -1;
+		}
+
+		insn = find_insn(file, reloc->sym->sec, offset);
 		if (!insn) {
 			WARN("can't find insn for unwind_hints[%d]", i);
 			return -1;
-- 
2.1.0

