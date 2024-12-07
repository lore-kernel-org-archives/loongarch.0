Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F174C1798C
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 01:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733536766; cv=none; b=Nk6OjKVNGWe6syp6tW3oMJTiGzc58tBg80+LsDIOpLbpn6ACKhcbyFWGAXClPQhvQSYkMxLMANLybUGcv2YiychTbp34C0E5Q8R6sG3prItgOfiCH6chbdv/FRGlzw8XXC07bnOqR/aOS2JGFKOAKypwvufushXIQLy9hr3Mv5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733536766; c=relaxed/simple;
	bh=0CbpOPI4Xa7ty6GYDZyXKqQGKZIAwaVBL6eU1ORjlx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdgCj6XtHXOiqhGesTkFeft+vvxTbji7sU++MZmL8hX5TbiZRiudn9kNd8cVhH1MR9sx5oAvL3sxrQTwMqOlFjthqLDnT6mS31n6owuBe8zgDf2UCat1BFO5wzEn7BdJdFkarrV/jztbCjegaCMvFM7+R3xoizhwfhca2ZtYvdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxMK_5q1NnFa1SAA--.5661S3;
	Sat, 07 Dec 2024 09:59:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx_uD1q1Nn3Wd5AA--.42544S4;
	Sat, 07 Dec 2024 09:59:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/10] objtool: Handle different entry size of rodata
Date: Sat,  7 Dec 2024 09:59:07 +0800
Message-ID: <20241207015915.1159-3-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMBx_uD1q1Nn3Wd5AA--.42544S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw4fuF4DtryruF45CF13WrX_yoW5AF45pF
	srC3yrGr4Fgry3Gwnrta1kurZ8Gws2gryIqF9rJry8ArZrXr15JFWSyryUtF18XwsYgFWf
	XFZYgr15AF4qy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

In the most cases, the entry size of rodata is 8 bytes because the
relocation type is 64 bit, but when compiling with Clang on LoongArch,
there exists 32 bit relocation type, the entry size of rodata should
be 4 bytes in this case.

Add an arch-specific function arch_reloc_size() to assign the entry
size of rodata, the default value is 8 in the weak definition, it can
be overridden by archs that have different requirements.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/decode.c | 11 +++++++++++
 tools/objtool/check.c                 | 10 +++++++++-
 tools/objtool/include/objtool/arch.h  |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index 69b66994f2a1..b64205b89f6b 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -363,3 +363,14 @@ void arch_initial_func_cfi_state(struct cfi_init_state *state)
 	state->cfa.base = CFI_SP;
 	state->cfa.offset = 0;
 }
+
+unsigned int arch_reloc_size(struct reloc *reloc)
+{
+	switch (reloc_type(reloc)) {
+	case R_LARCH_32:
+	case R_LARCH_32_PCREL:
+		return 4;
+	default:
+		return 8;
+	}
+}
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f64435ad3514..7271e959520e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1943,6 +1943,11 @@ static int add_special_section_alts(struct objtool_file *file)
 	return ret;
 }
 
+__weak unsigned int arch_reloc_size(struct reloc *reloc)
+{
+	return 8;
+}
+
 static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 			  struct reloc *next_table)
 {
@@ -1954,6 +1959,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	struct reloc *reloc = table;
 	struct alternative *alt;
 	unsigned long sym_offset;
+	unsigned int entry_size;
 
 	/*
 	 * Each @reloc is a switch table relocation which points to the target
@@ -1967,8 +1973,10 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (reloc != table && reloc == next_table)
 			break;
 
+		entry_size = arch_reloc_size(reloc);
+
 		/* Make sure the table entries are consecutive: */
-		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
+		if (prev_offset && reloc_offset(reloc) != prev_offset + entry_size)
 			break;
 
 		sym_offset = reloc->sym->offset + reloc_addend(reloc);
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index d63b46a19f39..396f7c6c81c0 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -97,4 +97,6 @@ int arch_rewrite_retpolines(struct objtool_file *file);
 
 bool arch_pc_relative_reloc(struct reloc *reloc);
 
+unsigned int arch_reloc_size(struct reloc *reloc);
+
 #endif /* _ARCH_H */
-- 
2.42.0

