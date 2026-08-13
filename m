Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39B74195A7
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611925; cv=none; b=IfoLE3XdWeGj93a4HmciSNdiiROJhlKML7V7Mx3kNQ7YvP7dAAZtQnmR8ejonRopH34Oti/78pYwIPBD+u8m0lROxsuzw6UtRQbp/f0UkHSrf9SXEQVPztMXEHf9tmG+Qo0eiy0k4EL5B3ZmJ8Tqi1nsOcG0v6tP/DhYZL1YwOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611925; c=relaxed/simple;
	bh=3ZUyFQHbnYN/MGnBhmvVH2l9QYhH3mmgtNdPKm0adCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeSFGIYTuNS6JuI3Osj0xHwol9PET5Bo42dhsX46dfykDgWdE17ulxi4WWmUHiuO7zDYg6RzOhRLvYqOZKthPlNEb+ywWjQ4ecRZO7f5731aZ2p9jDNR98rq+xRLDcHtNlQRF+H9I6DDXVDv9fDW7UpHDkibCfFdphJGpqhOECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxQNHNiH1qLNsAAA--.2646S3;
	Thu, 13 Aug 2026 17:05:17 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx2c3FiH1qbCsDAA--.21078S2;
	Thu, 13 Aug 2026 17:05:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] LoongArch: Use current_stack_pointer in current_pt_regs()
Date: Thu, 13 Aug 2026 17:05:06 +0800
Message-ID: <20260813090506.15574-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx2c3FiH1qbCsDAA--.21078S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWF1rJr45KrW8ZrykZrWrJFc_yoW5Aw48pa
	93uFn7KF48CFyxAw1kta13Xr13Ja929347GFW3tw4SywnxXrn8XFn7WFy2kFWxAan5X340
	qFyay34jvFsxAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2DUUUUUUU

The current implementation of current_pt_regs() relies on the compiler
__builtin_frame_address(0). This introduces an unnecessary dependency
on the frame pointer register, which forces the compiler to generate
redundant prologue and epilogue code, create a larger stack frame, and
perform redundant memory operations to preserve the frame pointer even
in functions where it is otherwise unnecessary.

Optimize this by switching to current_stack_pointer, which explicitly
maps to the hardware stack pointer register. This allows the compiler
to compute the stack alignment directly from the natively maintained
$sp register, completely eliminating the overhead of preserving and
restoring the frame pointer on the stack memory.

As a prominent example, this optimization significantly improves the
hot-path function copy_thread(). A localized disassembly comparison
of copy_thread() illustrates the elimination of the frame pointer,
the reduction of stack frame size from 48 bytes down to 32 bytes,
and a more compact epilogue path:

Before:
00000000000004f0 <copy_thread>:
 4f0:   02ff4063        addi.d          $sp, $sp, -48
 4f4:   29c08076        st.d            $fp, $sp, 32
 4f8:   29c06077        st.d            $s0, $sp, 24
 4fc:   29c0a061        st.d            $ra, $sp, 40
 500:   02c0c076        addi.d          $fp, $sp, 48
 ...
 54c:   1400006e        lu12i.w         $t2, 3
 ...
 55c:   03bffdce        ori             $t2, $t2, 0xfff
 560:   00153ace        or              $t2, $fp, $t2
 564:   02fb05cd        addi.d          $t1, $t2, -319
 ...
 628:   28c0a061        ld.d            $ra, $sp, 40
 62c:   28c08076        ld.d            $fp, $sp, 32
 630:   28c06077        ld.d            $s0, $sp, 24
 634:   00150004        move            $a0, $zero
 638:   02c0c063        addi.d          $sp, $sp, 48
 63c:   4c000020        ret

After:
00000000000004f0 <copy_thread>:
 4f0:   02ff8063        addi.d          $sp, $sp, -32
 4f4:   29c04077        st.d            $s0, $sp, 16
 4f8:   29c06061        st.d            $ra, $sp, 24
 [ prologue st.d and addi.d for $fp are completely eliminated ]
 ...
 544:   1400006e        lu12i.w         $t2, 3
 ...
 554:   03bffdce        ori             $t2, $t2, 0xfff
 558:   0015386e        or              $t2, $sp, $t2
 55c:   02fb05cd        addi.d          $t1, $t2, -319
 ...
 620:   28c06061        ld.d            $ra, $sp, 24
 624:   28c04077        ld.d            $s0, $sp, 16
 628:   00150004        move            $a0, $zero
 [ epilogue ld.d for $fp is eliminated; exit path is shortened ]
 62c:   02c08063        addi.d          $sp, $sp, 32
 630:   4c000020        ret

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/ptrace.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
index e5d21e836d99..2a7ed442d905 100644
--- a/arch/loongarch/include/asm/ptrace.h
+++ b/arch/loongarch/include/asm/ptrace.h
@@ -170,11 +170,7 @@ static inline void die_if_kernel(const char *str, struct pt_regs *regs)
 		die(str, regs);
 }
 
-#define current_pt_regs()						\
-({									\
-	unsigned long sp = (unsigned long)__builtin_frame_address(0);	\
-	(struct pt_regs *)((sp | (THREAD_SIZE - 1)) + 1) - 1;		\
-})
+#define current_pt_regs() ((struct pt_regs *)((current_stack_pointer | (THREAD_SIZE - 1)) + 1) - 1)
 
 /* Helpers for working with the user stack pointer */
 
-- 
2.42.0

