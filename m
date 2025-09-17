Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F9820F08E
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 01:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071424; cv=none; b=UzrlxDd1G6RiISabd1bs2qdrQ7Nf00/lvKjWaLMqlhxGDIfGm2tG4szkgay+ZICwk8Moz0vdZuLwnO38kbYPs/iXYWn8i2l+w71R0uavhatk5hyV1D1SATj2FeHFb2fhtfLByoW0yibfgn/eQroNmA+BNeeswgekhCNSoev0uSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071424; c=relaxed/simple;
	bh=5xt4C80mQGWhGn4QWQy8RJCY75EMFYpXXeicgnELsmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdBOe+6T7Gaj5/8OCnt3bTHGnuKmoZRN50f8e0j4mXdO28xa44+NDPDdGy13n3miyO9jWAtzddWAxkrraPhhE1RuiEHCig59ADTYCLmdrEIizbYwCLIrdCaGQ/8yuWOguXCiYD3KHhBkPajCx+3/762vkMkKZkN7UOrncVqO4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxVNB9CspoKi4LAA--.23750S3;
	Wed, 17 Sep 2025 09:10:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+RwCsposWOaAA--.35728S6;
	Wed, 17 Sep 2025 09:10:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] LoongArch: Remove is_entry_func() related code
Date: Wed, 17 Sep 2025 09:10:07 +0800
Message-ID: <20250917011007.4540-5-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250917011007.4540-1-yangtiezhu@loongson.cn>
References: <20250917011007.4540-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+RwCsposWOaAA--.35728S6
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJryDCFW8Xr1rAF4rur15GFX_yoW8Gw15pF
	9xAwnrWrWFv3s2g34DXw1j9rWDZrn7XrnFgFZrKFyrW3Zrt3W3Cr1Fvw1j9FZ0y3yrWF1r
	XFnak3s0ka1DZ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUoxR6UUUUU

For now, there is UNWIND_HINT_END_OF_STACK for the entry points
kernel_entry() and smpboot_entry(), just remove is_entry_func()
related code.

Link: https://lore.kernel.org/lkml/kjiyla6qj3l7ezspitulrdoc5laj2e6hoecvd254hssnpddczm@g6nkaombh6va/
Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/unwind_orc.c | 11 -----------
 1 file changed, 11 deletions(-)

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

