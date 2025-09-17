Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F519309DDD
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758108448; cv=none; b=NV7kh4NMTjGWcbi3ZYt6nGy7FK7loJTgVSr9ph+sXI0/ihQS9mWMuonXSvADgc1+oLGERqZL9Dd+vKiKMSAhKhw4v+g1DGmU5DGANovGdKb1mMwNPf28NA9Xnpj1vcD178FfgoHqUaPb08yLd80BqADRGV4iRQB6+X3A51zSSQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758108448; c=relaxed/simple;
	bh=5xt4C80mQGWhGn4QWQy8RJCY75EMFYpXXeicgnELsmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhId8+dP98goJH8KjWiKEAn8D6yDupbxvl4LM+pvC9sKBQHUarzeNmbeBMKY+XKVt1Fg4f1UmTAmBV0VvF9voisDBwOl06UZCWIy7SSyv1/NqSSK/jUokjkO7d0cFcJRHckHHoxmQ6MzK+wIr75gSbdnzfd0dl/jvk9QvC2npF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxWNEam8poG1kLAA--.24513S3;
	Wed, 17 Sep 2025 19:27:22 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxQ+QVm8por2abAA--.39884S5;
	Wed, 17 Sep 2025 19:27:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] LoongArch: Remove is_entry_func() related code
Date: Wed, 17 Sep 2025 19:27:16 +0800
Message-ID: <20250917112716.24415-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250917112716.24415-1-yangtiezhu@loongson.cn>
References: <20250917112716.24415-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxQ+QVm8por2abAA--.39884S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJryDCFW8Xr1rAF4rur15GFX_yoW8Gw15pF
	9xAwnrWrWFv3s2g34DXw1j9rWDZrn7XrnFgFZrKFyrW3Zrt3W3Cr1Fvw1j9FZ0y3yrWF1r
	XFnak3s0ka1DZ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

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

