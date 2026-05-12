Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAAA48C403
	for <loongarch@lists.linux.dev>; Tue, 12 May 2026 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574047; cv=none; b=NMWYlCv+6XxVDeM0lDk3YkubaZW5tlaf11vQNk0oM0LwErT3VI8ybgz8ii19Q9LozQ36nmvNkoeQoRq1+98X8RLJI2HF454gUac2gDj3wyjH/sv4RLrHm7VknavGkTgWD6AW7oWjW6QjQmL+dLRGMG8PbZlUCVO1hWWpirKqV98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574047; c=relaxed/simple;
	bh=uVDesHUhVeNNwivP/EaIPufI3y6cvuiZLh4SYfalMsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LY5yrXnqLE0CatBaJTTiAffeRr9se5Bjo49n0Hiv9dPU/d+Zsq/9e9n+xcgYeJAoF7rTYq8XNVimjNLV7zMvajyLCDzA/4U7LlloXSUcqAK7E+/w6iA1g9lGJWGTq1KnfCZGGL3zRzRkBx0xXQhE5QoyqNPYCGCYn4oIrwY9DpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx8erU4gJqbQsJAA--.27509S3;
	Tue, 12 May 2026 16:20:36 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxGMHO4gJqAwKAAA--.32306S5;
	Tue, 12 May 2026 16:20:36 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] LoongArch: kprobes: Fix single-stepping instruction slot preparation
Date: Tue, 12 May 2026 16:20:28 +0800
Message-ID: <20260512082029.2131-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260512082029.2131-1-yangtiezhu@loongson.cn>
References: <20260512082029.2131-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxGMHO4gJqAwKAAA--.32306S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zw17ZFy3WF15Kr1Dtr43Arc_yoW8ZrWrpF
	ZFkw15Xr4rXrW8G3srJw4Dur1Syan5Z3y2gF45Ca4Skw4YqrnIqF1xK3s0vFn8WwsYkF4S
	v3ZYyF9Yq3W8AacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

In arch_prepare_ss_slot(), the original code directly assigns instructions
to the buffer using raw memory stores. This approach has two significant
drawbacks on LoongArch:

1. Consistency: It skips the necessary instruction barrier synchronization
   required by the architecture. Without a local barrier, the instruction
   fetch unit might not observe the newly prepared instructions in the
   single-step slot, even on the local CPU.
2. Atomicity: Raw memory assignments do not guarantee that the instruction
   unit sees a complete instruction at all times, which is critical for
   the integrity of single-step execution.

Like RISC-V and ARM64, use larch_insn_patch_text() for slot preparation to
ensure the atomic instruction writes and proper local instruction barrier
execution.

Note that global stop_machine synchronization is not required here because
the single-step slot is executed only after a breakpoint exception, which
inherently provides a context synchronization event for the CPU to observe
the new instructions.

Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/kprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
index 04b5b05715cd..8e1b7a87c897 100644
--- a/arch/loongarch/kernel/kprobes.c
+++ b/arch/loongarch/kernel/kprobes.c
@@ -12,8 +12,8 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 
 static void arch_prepare_ss_slot(struct kprobe *p)
 {
-	p->ainsn.insn[0] = *p->addr;
-	p->ainsn.insn[1] = KPROBE_SSTEPBP_INSN;
+	larch_insn_patch_text(p->ainsn.insn, *p->addr);
+	larch_insn_patch_text(p->ainsn.insn + 1, KPROBE_SSTEPBP_INSN);
 	p->ainsn.restore = (unsigned long)p->addr + LOONGARCH_INSN_SIZE;
 }
 NOKPROBE_SYMBOL(arch_prepare_ss_slot);
-- 
2.42.0

