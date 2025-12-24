Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2054E315D26
	for <loongarch@lists.linux.dev>; Wed, 24 Dec 2025 10:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572544; cv=none; b=HUCSuqmvkJ0UCsmzldDc5TiAMCw55xs/mXK6PoSKgr1OVmdF1KnzbWznpaYAcs1wcFk+XWa2JMPncC7uqGuFNanDcHvCAesCjY2I0vyjbKIS46JnUp0Fj4tuq54o0iVyM/HapntdyJ1p+Vc4AI0HHTSQXY+ir6jvczaS8CvUD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572544; c=relaxed/simple;
	bh=ypFvyZm69/jminGaNJwnlAaaP6Sr0+rLixYiHkjbf/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiZigbhtvielZDZGZHe+SpHF0rxqpdrBYNuvmB+QviRfIgQky6V2u2K1ghijHAIPjVuDNU4HELRBi/NbR7ucJeuZzCT3Ha6PhRZxc2lQ8VvOMivaSvf+GnzBCm6iBoqf2bA6Qcw07P4c5LLnk7GruqQZMS+qDuqmwqiooe8EXu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxnsP6wUtp37kCAA--.9134S3;
	Wed, 24 Dec 2025 18:35:38 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCx2+D0wUtpGjsEAA--.13037S4;
	Wed, 24 Dec 2025 18:35:37 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] LoongArch: Remove is_entry_func() and kernel_entry_end
Date: Wed, 24 Dec 2025 18:35:16 +0800
Message-ID: <20251224103516.12654-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251224103516.12654-1-yangtiezhu@loongson.cn>
References: <20251224103516.12654-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx2+D0wUtpGjsEAA--.13037S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WrWxZF1rtr47Ar4fCw1DXFc_yoW8CF15pF
	9xAr1DXrWF9F97t34DXw109rWDJrn7Ww1agF9rKFyrGF12qr13Zr1Fvw1DXF90q3yFgFWr
	XFnY9r90ka1UAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1LvtUUUUU=

For now, the related codes of is_entry_func() are useless, so they can be
removed. Then the symbol kernel_entry_end is not used any more, so it can
be removed too.

Link: https://lore.kernel.org/lkml/kjiyla6qj3l7ezspitulrdoc5laj2e6hoecvd254hssnpddczm@g6nkaombh6va/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/head.S       |  2 --
 arch/loongarch/kernel/unwind_orc.c | 11 -----------
 2 files changed, 13 deletions(-)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index ce7f6c04f4ab..7f288e89573b 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -144,5 +144,3 @@ SYM_CODE_START(smpboot_entry)
 SYM_CODE_END(smpboot_entry)
 
 #endif /* CONFIG_SMP */
-
-SYM_ENTRY(kernel_entry_end, SYM_L_GLOBAL, SYM_A_NONE)
diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 0d5fa64a2225..710f82d73797 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -348,14 +348,6 @@ void unwind_start(struct unwind_state *state, struct task_struct *task,
 }
 EXPORT_SYMBOL_GPL(unwind_start);
 
-static bool is_entry_func(unsigned long addr)
-{
-	extern u32 kernel_entry;
-	extern u32 kernel_entry_end;
-
-	return addr >= (unsigned long)&kernel_entry && addr < (unsigned long)&kernel_entry_end;
-}
-
 static inline unsigned long bt_address(unsigned long ra)
 {
 	extern unsigned long eentry;
@@ -402,9 +394,6 @@ bool unwind_next_frame(struct unwind_state *state)
 	/* Don't let modules unload while we're reading their ORC data. */
 	guard(rcu)();
 
-	if (is_entry_func(state->pc))
-		goto end;
-
 	orc = orc_find(state->pc);
 	if (!orc) {
 		/*
-- 
2.42.0

