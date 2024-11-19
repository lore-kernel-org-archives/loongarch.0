Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021E6198A10
	for <loongarch@lists.linux.dev>; Tue, 19 Nov 2024 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999428; cv=none; b=qFCxrpTMUhtNKnMLYyXkvBCK2TTULjxBI36Kd3kzvCtS2RX9/VqlchrrHe/nVPAGmAAyMPsGiyW2pbBvu1CSIokIruFU1da07xiM8gsNwycR4OmoiShAozksK5Ss+6MUonlBXXZCbz29yd+FsH3unq4SvR50GYzXJnR2p9QcM54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999428; c=relaxed/simple;
	bh=nnSsZRHm+jV+Tfoq0nNKNgiSjK/fN0EvobTeEl/KG68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlUiV7AaUfrLN0cRYZ59ISUQ72Ze8vTWP2J/3msasucAi1hHtESTQZfOtoa7f8OoFR5a+vWkifDlYlej6EM1vMxQ5ZUJy4R7AcC+AN7Aw1jW1d+tlcInzKw1emhVvDewpC/7RaF7HoKJwuEC+3RTWpCj/6qkK/CVTNUPT/yIxJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxeeC_NjxnbDZCAA--.64085S3;
	Tue, 19 Nov 2024 14:57:03 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxDuG4NjxnB_5cAA--.5437S8;
	Tue, 19 Nov 2024 14:57:03 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/10] objtool: Handle unsorted table offset of rodata
Date: Tue, 19 Nov 2024 14:56:51 +0800
Message-ID: <20241119065655.21123-7-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMCxDuG4NjxnB_5cAA--.5437S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw18uFWfGrWfWFWfJr4kKrX_yoW8uF4xpF
	15C3y8KrWYg34rKwnrt3WFgrW5Gw47Gry8Jr1xtry0v3sFvrnxtFZaka42kFyDW3y5W3WI
	vFZxKry8CFsrAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

When compling with Clang on LoongArch, there are unsorted table offset
of rodata if there exist many jump tables, it will get the wrong table
end and find the wrong jump destination instructions in add_jump_table(),
so it needs to check the table size of rodata to break the process when
parsing the relocation section of rodata.

This is preparation for later patch on LoongArch, there is no effect for
the other archs with this patch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c                 | 7 +++++++
 tools/objtool/include/objtool/check.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 17df3738e087..cad9e0c21123 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2093,6 +2093,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	struct alternative *alt;
 	unsigned long offset;
 	unsigned long rodata_entry_size;
+	unsigned long rodata_table_size = insn->table_size;
 
 	/*
 	 * Each @reloc is a switch table relocation which points to the target
@@ -2104,6 +2105,12 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (reloc != table && reloc == next_table)
 			break;
 
+		/* Handle the special cases compiled with Clang on LoongArch */
+		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
+		    reloc->sym->type == STT_SECTION && reloc != table &&
+		    reloc_offset(reloc) == reloc_offset(table) + rodata_table_size)
+			break;
+
 		/* Handle the special cases compiled with Clang on LoongArch */
 		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
 		    reloc_type(reloc) == R_LARCH_32_PCREL)
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index daa46f1f0965..11aafcc7b0c7 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -46,6 +46,7 @@ struct instruction {
 	struct section *sec;
 	unsigned long offset;
 	unsigned long immediate;
+	unsigned long table_size;
 
 	u8 len;
 	u8 prev_len;
-- 
2.42.0

