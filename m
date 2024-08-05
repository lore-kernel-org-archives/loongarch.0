Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A40813D51E
	for <loongarch@lists.linux.dev>; Mon,  5 Aug 2024 03:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722828427; cv=none; b=QIC+l+SlUf0BbmwNXwdwAxkw0yWfGlEHJ7pGAQNmSD+07wq4EsG7Z1r4GCluK8j4N9knWHLWVbpx8NoXAxZzAn8jonaLgpWfkkeiTvR/Vu8okIcEGPJt0jnteLzM5LkdhSjSPJh/Z9/tMhyMq8addsu007JqwB0189sE8EBrU30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722828427; c=relaxed/simple;
	bh=dQdc4zvokUMe37PQ1p3xMiSz2t9xWE7Hfgtf9NLWvBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbvXiLkTdmVh9n5VY1mQpMtRpn/NF4JmY8lEDHHW0a4F0ih0zZEG7GQz+8A+GedjaK9qqDDDVlmCsyfAdW471PfDxKCDbNBEvi+HaYJEgliC8lIHwTJBGZD6fV3fq33+k0790i1PCyPcYo7hNKacw1+CzWZd/r/OD3xR333KZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxmOmHRrBmIdAHAA--.25232S3;
	Mon, 05 Aug 2024 11:27:03 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxkeGFRrBmgeADAA--.20473S5;
	Mon, 05 Aug 2024 11:27:03 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] LoongArch: Remove STACK_FRAME_NON_STANDARD(do_syscall)
Date: Mon,  5 Aug 2024 11:27:00 +0800
Message-ID: <20240805032700.16038-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240805032700.16038-1-yangtiezhu@loongson.cn>
References: <20240805032700.16038-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxkeGFRrBmgeADAA--.20473S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFykWr15JFyDtw4fWr48uFX_yoWDWrg_WF
	1xKw1UWrWrtF42v3Z5t3W5uF4xZw1kJFsakFn2gry7Ka43JrZ8JFyYv345CF1q9aykWrZ5
	urWkX3s0y34FyosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

For now, it can remove STACK_FRAME_NON_STANDARD(do_syscall) because
there is no objtool warning "do_syscall+0x11c: return with modified
stack frame", then there is handle_syscall() which is the previous
frame of do_syscall() in the call trace when executing the command
"echo l > /proc/sysrq-trigger".

Fixes: a0f7085f6a63 ("LoongArch: Add RANDOMIZE_KSTACK_OFFSET support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/syscall.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
index ba5d0930a74f..168bd97540f8 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -79,7 +79,3 @@ void noinstr __no_stack_protector do_syscall(struct pt_regs *regs)
 
 	syscall_exit_to_user_mode(regs);
 }
-
-#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
-STACK_FRAME_NON_STANDARD(do_syscall);
-#endif
-- 
2.42.0

