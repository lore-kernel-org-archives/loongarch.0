Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3403838A
	for <loongarch@lists.linux.dev>; Tue, 30 Jan 2024 06:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706595460; cv=none; b=FBl28DjgF43I8aJoXLRqsHqEcLjcNbKIiDUe/mbo+sJZzJHZamrygAIQa34JScdNLWj44sEzGCz7euh0lvzz7QqmNd+TzUs/l1tJo/HBtgcnPte3bjyXGnALbpImYU6pcRab+7oRq2Y/AFouLl079HpwniaVk208e9/klSm1pF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706595460; c=relaxed/simple;
	bh=S0dLhOoOjHqllmMRbdI054iuekaMA3L7e5M6fpkR0uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4E8n6HD6J98KLbyxaRqmUPJCxRe1IR36JxSWQ9Dmzjlj+OAuUR0xY9xV+g4DXWOwKn+PPvUu3O2yi9+B8axkxEqHGg5a6ZkIDEFVkMAXEGnfJxJJMwst+smwiNcfOYgLMSzRpeGDrpVprZHrnKSfOjaTq0cUvp/47QCJjITBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3+uBlLhlEjYIAA--.25196S3;
	Tue, 30 Jan 2024 14:17:37 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxnhN7lLhlYXQnAA--.34034S8;
	Tue, 30 Jan 2024 14:17:36 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] objtool: Check local label in read_unwind_hints()
Date: Tue, 30 Jan 2024 14:17:28 +0800
Message-ID: <20240130061730.21118-7-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130061730.21118-1-yangtiezhu@loongson.cn>
References: <20240130061730.21118-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxnhN7lLhlYXQnAA--.34034S8
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFW3ArWxurWUtw4UtFyxZwc_yoW8Kry5pF
	W3G3y3Wr40qry7Zw17ta48W3sxKws7CF17trZrGrWrAry2qw15K3ZIyr1ayFyqgr4Y9w4U
	XF9Yga4j9a1qywcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

When update the latest upstream gcc and binutils, it generates some
objtool warnings on LoongArch, like this:

  arch/loongarch/kernel/entry.o: warning: objtool: ret_from_fork+0x0: unreachable instruction

We can see that the reloc sym name is local label instead of section
in relocation section '.rela.discard.unwind_hints', in this case, the
reloc sym type is STT_NOTYPE instead of STT_SECTION. Let us check it
to not return -1, then use reloc->sym->offset instead of reloc addend
which is 0 to find the corresponding instruction.

Here are some detailed info:
[fedora@linux 6.8.test]$ gcc --version
gcc (GCC) 14.0.1 20240129 (experimental)
[fedora@linux 6.8.test]$ as --version
GNU assembler (GNU Binutils) 2.42.50.20240129
[fedora@linux 6.8.test]$ readelf -r arch/loongarch/kernel/entry.o | grep -A 3 "rela.discard.unwind_hints"
Relocation section '.rela.discard.unwind_hints' at offset 0x3a8 contains 7 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000000  000a00000063 R_LARCH_32_PCREL  0000000000000000 .Lhere_1 + 0
00000000000c  000b00000063 R_LARCH_32_PCREL  00000000000000a8 .Lhere_50 + 0

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d0e82c729dd9..1009d144f756 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2227,6 +2227,7 @@ static int read_unwind_hints(struct objtool_file *file)
 	struct unwind_hint *hint;
 	struct instruction *insn;
 	struct reloc *reloc;
+	unsigned long offset;
 	int i;
 
 	sec = find_section_by_name(file->elf, ".discard.unwind_hints");
@@ -2254,7 +2255,16 @@ static int read_unwind_hints(struct objtool_file *file)
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
2.42.0

