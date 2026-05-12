Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D07936F91E
	for <loongarch@lists.linux.dev>; Tue, 12 May 2026 08:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574040; cv=none; b=V4dMVvXhdmthpmx3P01GVBHIhYAOqWBCwnTg+AhRJ5S5/ibO77M0c9NYq0TiieOSi6Snl41ADPGacZT1dAKqLFTcKSBebmlXR/60aONUG3vk4dnzmaymwrmDz1kW4e6CreTzgIMQTLmx+DkhUtEzture/WDzPKKj1Q/VVKpC6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574040; c=relaxed/simple;
	bh=5GLlnGoBzMq39eOFhbgKUL8oXZswvWpq9RVaq9yEBsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNK79akUSyTEPiOWbGYoQKPjKVZzr3gA88Z4DJBPEkV15fn2g/cnmhOuMufMw38GpCTi+JcOmrxHSYCXXkx14DY7tkJYDsjBfDBCqbqS+y0kRMlJWr9jK4+Uqgkuf58qzGWnNheoPpZD7kPCEOcQl/RmIXTdHNkdWUnb2maGkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx4erT4gJqagsJAA--.27814S3;
	Tue, 12 May 2026 16:20:35 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxGMHO4gJqAwKAAA--.32306S4;
	Tue, 12 May 2026 16:20:33 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] LoongArch: kprobes: Use larch_insn_text_copy() to patch instructions
Date: Tue, 12 May 2026 16:20:27 +0800
Message-ID: <20260512082029.2131-3-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAxGMHO4gJqAwKAAA--.32306S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxArW3Aw17GFW3Xw45Xw47GFX_yoW5Gw1kpF
	WDCwn0qr4kWF18WFyDJw4UZr1ft3ykuayUWa17A3yrtr4UXryqqFn7KrZ7JF909w4F9F4f
	Zr1qvFZ5XFyDA3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j83kZUUUUU=

On SMP systems, kprobe handlers would occasionally fail to execute on
certain CPU cores. The issue is hard to reproduce and typically occurs
randomly under high system load.

The root cause is a software-side instruction hazard. According to the
LoongArch Reference Manual, while the cache coherency is maintained by
hardware, software must explicitly use the "IBAR" instruction to ensure
the instruction fetch unit (IFU) observes the effects of recent stores.

The current arch_arm_kprobe() and arch_disarm_kprobe() only execute the
"IBAR" barrier (via flush_insn_slot -> local_flush_icache_range) on the
local CPU. This leaves a vulnerable window where remote CPU cores may
continue executing stale instructions from their pipelines or prefetch
buffers, as they have not executed an "IBAR" since the code modification.

Switch to larch_insn_text_copy() to fix this:
1. Synchronization: It uses stop_machine_cpuslocked() to synchronize all
   online CPUs, ensuring no CPU is executing the target code area during
   modification.
2. Visibility: By passing cpu_online_mask to stop_machine_cpuslocked(),
   the callback text_copy_cb() is executed on all online cores. Each CPU
   core invokes local_flush_icache_range() to execute "IBAR", clearing
   instruction hazards system-wide and ensuring the "break" instruction
   is visible to the fetch units of all cores.
3. Robustness: It properly manages memory write permissions (ROX/RW) for
   the kernel text segment during patching, ensuring compatibility with
   CONFIG_STRICT_KERNEL_RWX.

Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/kprobes.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
index 8ba391cfabb0..04b5b05715cd 100644
--- a/arch/loongarch/kernel/kprobes.c
+++ b/arch/loongarch/kernel/kprobes.c
@@ -60,16 +60,18 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
 /* Install breakpoint in text */
 void arch_arm_kprobe(struct kprobe *p)
 {
-	*p->addr = KPROBE_BP_INSN;
-	flush_insn_slot(p);
+	u32 insn = KPROBE_BP_INSN;
+
+	larch_insn_text_copy(p->addr, &insn, LOONGARCH_INSN_SIZE);
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
 
 /* Remove breakpoint from text */
 void arch_disarm_kprobe(struct kprobe *p)
 {
-	*p->addr = p->opcode;
-	flush_insn_slot(p);
+	u32 insn = p->opcode;
+
+	larch_insn_text_copy(p->addr, &insn, LOONGARCH_INSN_SIZE);
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
 
-- 
2.42.0

