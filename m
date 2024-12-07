Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA5D17993
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 01:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733536767; cv=none; b=XUcOoEKTimFY8DGEf4q7xdzIPj12wUZBt7F6rduj6h7Eegfk3Aqw0wrpbNaZeL7rIWk8cL1bDFoEnhSSkIAiyR37MOWTVt14LvzMe0KJEnVrwnEbDUU00mLr6+bcnowysLzQ/62TyGJJpmwEt1rlp54YObIHrvExmd4efO0zaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733536767; c=relaxed/simple;
	bh=N/F2zjofPysRYI7xOdfPGnfrL6z85FVliafcbYErn30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KN92VXmN753Zb4jEKloOiIDXRQIkkID+J6O4wakWII1+U7RjrxVynS2bb5lmZdznBLl+NQyR7j6KoIYy712HPZPg3D7qoqLn8IXcPyZQfIawBSQB/+OM/co2hFsnYL74omN/Ef7fI8S05f8VSBlAaGydw37lPwxpi9YIg8RZdA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxG+L6q1NnGa1SAA--.29224S3;
	Sat, 07 Dec 2024 09:59:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx_uD1q1Nn3Wd5AA--.42544S5;
	Sat, 07 Dec 2024 09:59:22 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/10] objtool: Handle PC relative relocation type
Date: Sat,  7 Dec 2024 09:59:08 +0800
Message-ID: <20241207015915.1159-4-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMBx_uD1q1Nn3Wd5AA--.42544S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw1UCF13WF4xKrW3Aw1fAFc_yoWrGw4fpF
	srC398Gr4Fgr1fW347t3WkWFZ8Gws7Wry2qFyDAryrZrZFqw15tr4xAFn8Wa1UXwsYgayx
	ZFZYgw17AF4qvwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

When compiling on LoongArch, there exists PC relative relocation type,
it needs to get the symbol offset with "S + A - PC" according to the
spec of "ELF for the LoongArch Architecture".

Add an arch-specific function arch_adjust_offset() to assign the symbol
offset, the default value is "reloc->sym->offset + reloc_addend(reloc)"
in the weak definition, it can be overridden by archs that have different
requirements.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/decode.c         | 20 +++++++++++++++----
 .../objtool/arch/loongarch/include/arch/elf.h |  7 +++++++
 tools/objtool/check.c                         |  7 ++++++-
 tools/objtool/include/objtool/arch.h          |  1 +
 4 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index b64205b89f6b..431eb4757458 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -5,10 +5,7 @@
 #include <asm/inst.h>
 #include <asm/orc_types.h>
 #include <linux/objtool_types.h>
-
-#ifndef EM_LOONGARCH
-#define EM_LOONGARCH	258
-#endif
+#include <arch/elf.h>
 
 int arch_ftrace_match(char *name)
 {
@@ -374,3 +371,18 @@ unsigned int arch_reloc_size(struct reloc *reloc)
 		return 8;
 	}
 }
+
+unsigned long arch_adjust_offset(struct reloc *reloc, struct reloc *table)
+{
+	switch (reloc_type(reloc)) {
+	case R_LARCH_32_PCREL:
+	case R_LARCH_64_PCREL:
+		if (reloc->sym->type == STT_SECTION)
+			return reloc->sym->offset + reloc_addend(reloc) -
+			       (reloc_offset(reloc) - reloc_offset(table));
+		else
+			return reloc->sym->offset;
+	default:
+		return reloc->sym->offset + reloc_addend(reloc);
+	}
+}
diff --git a/tools/objtool/arch/loongarch/include/arch/elf.h b/tools/objtool/arch/loongarch/include/arch/elf.h
index 9623d663220e..ec79062c9554 100644
--- a/tools/objtool/arch/loongarch/include/arch/elf.h
+++ b/tools/objtool/arch/loongarch/include/arch/elf.h
@@ -18,6 +18,13 @@
 #ifndef R_LARCH_32_PCREL
 #define R_LARCH_32_PCREL	99
 #endif
+#ifndef R_LARCH_64_PCREL
+#define R_LARCH_64_PCREL	109
+#endif
+
+#ifndef EM_LOONGARCH
+#define EM_LOONGARCH		258
+#endif
 
 #define R_NONE			R_LARCH_NONE
 #define R_ABS32			R_LARCH_32
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 7271e959520e..4a23aae40c03 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1948,6 +1948,11 @@ __weak unsigned int arch_reloc_size(struct reloc *reloc)
 	return 8;
 }
 
+__weak unsigned long arch_adjust_offset(struct reloc *reloc, struct reloc *table)
+{
+	return reloc->sym->offset + reloc_addend(reloc);
+}
+
 static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 			  struct reloc *next_table)
 {
@@ -1979,7 +1984,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (prev_offset && reloc_offset(reloc) != prev_offset + entry_size)
 			break;
 
-		sym_offset = reloc->sym->offset + reloc_addend(reloc);
+		sym_offset = arch_adjust_offset(reloc, table);
 
 		/* Detect function pointers from contiguous objects: */
 		if (reloc->sym->sec == pfunc->sec && sym_offset == pfunc->offset)
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index 396f7c6c81c0..34f41ba6d910 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -98,5 +98,6 @@ int arch_rewrite_retpolines(struct objtool_file *file);
 bool arch_pc_relative_reloc(struct reloc *reloc);
 
 unsigned int arch_reloc_size(struct reloc *reloc);
+unsigned long arch_adjust_offset(struct reloc *reloc, struct reloc *table);
 
 #endif /* _ARCH_H */
-- 
2.42.0

