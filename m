Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B251419A9
	for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720775713; cv=none; b=mDWdbVSHnyhyDuXUCO01Tbhm+EQg0wghfwQmSWJS7pYygsmGhfMp1Ac2qjm6QvJw7TDZETMGmE342U7mzCyIaA4q4BFP1slkb8Jr13ryHHMSFcGhxAsmiFIyowN10I5TSDWMwJc1l/Y84ZXB+YYfKtxJRP5toDB96dLAAeqkXgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720775713; c=relaxed/simple;
	bh=9wyGsUvhpp3BzmrvpcjXeXePCvmZCL6LjpIIvAlGvGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urOqF7qpA1B42yT6rShd75K1MBiyozikXmvU2U4YTELj5QUbSTjvy2JSw2WdFWz1pY12lNYXMs8ripCOrFJM5H08nNvQ7KSXTGB+eqtpIrBZAS9A/v40Jcbd0w+46yHM8EotbdJXdwvZPLSDeRETmfxoGzv5+hniwj35t13aQ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx7vAd9JBmK6EDAA--.10892S3;
	Fri, 12 Jul 2024 17:15:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXcca9JBmW65FAA--.28188S4;
	Fri, 12 Jul 2024 17:15:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/4] objtool: Check various types in add_jump_table()
Date: Fri, 12 Jul 2024 17:15:04 +0800
Message-ID: <20240712091506.28140-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240712091506.28140-1-yangtiezhu@loongson.cn>
References: <20240712091506.28140-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxXcca9JBmW65FAA--.28188S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7try3AryfXFWkWrW7XFyfKrX_yoW8AryUpF
	sxG345Kr4avr17WanxtF1kWF98Kwn7WFnrJrsrKF4FvryIyr45KFy2kw13C3WDJr12vw47
	Xr45try7WF4UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
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
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/check.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c89c0d8c35d7..6fa4100206d0 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2027,6 +2027,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 	unsigned int prev_offset = 0;
 	struct reloc *reloc = table;
 	struct alternative *alt;
+	unsigned long offset;
 
 	/*
 	 * Each @reloc is a switch table relocation which points to the target
@@ -2042,12 +2043,27 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
 		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
 			break;
 
+		if (reloc->sym->type == STT_SECTION) {
+			offset = reloc_addend(reloc);
+		} else if (reloc->sym->local_label) {
+			offset = reloc->sym->offset;
+		} else if (reloc->sym->type == STT_FUNC) {
+			offset = reloc->sym->offset;
+		} else if (reloc->sym->type == STT_OBJECT) {
+			offset = reloc->sym->offset;
+		} else if (reloc->sym->type == STT_NOTYPE) {
+			offset = reloc->sym->offset;
+		} else {
+			WARN("unexpected relocation symbol type in %s: %d",
+			     table->sec->name, reloc->sym->type);
+			return -1;
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
 
-- 
2.42.0

