Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E91F11193
	for <loongarch@lists.linux.dev>; Mon, 23 Oct 2023 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxg_C6KjZle+YzAA--.35753S3;
	Mon, 23 Oct 2023 16:11:38 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxG9y0KjZlQRAvAA--.34174S9;
	Mon, 23 Oct 2023 16:11:38 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4 7/8] objtool: Check local label in read_unwind_hints()
Date: Mon, 23 Oct 2023 16:11:30 +0800
Message-Id: <1698048691-19521-8-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1698048691-19521-1-git-send-email-yangtiezhu@loongson.cn>
References: <1698048691-19521-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8AxG9y0KjZlQRAvAA--.34174S9
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFyrZw45KFWrCw4xWF47ZFc_yoW8uw13pF
	W3G3yYgr40qryxuw17Ga48WasxKws7uF17trZrGr4rAr9Fvr15KasIyr1F9asrWr15uw4U
	Zas5Ka4j9a1qvabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8-txDUUUUU==
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
 tools/objtool/check.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 8ddf02f..c2ebb96 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2224,6 +2224,7 @@ static int read_unwind_hints(struct objtool_file *file)
 	struct unwind_hint *hint;
 	struct instruction *insn;
 	struct reloc *reloc;
+	unsigned long offset;
 	int i;
 
 	sec = find_section_by_name(file->elf, ".discard.unwind_hints");
@@ -2251,7 +2252,16 @@ static int read_unwind_hints(struct objtool_file *file)
 			return -1;
 		}
 
-		insn = find_insn(file, reloc->sym->sec, reloc_addend(reloc));
+		if (reloc->sym->type == STT_SECTION) {
+			offset = reloc_addend(reloc);
+		} else if (reloc->sym->local_label) {
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

