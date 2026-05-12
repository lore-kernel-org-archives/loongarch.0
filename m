Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB2236F8E9
	for <loongarch@lists.linux.dev>; Tue, 12 May 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574049; cv=none; b=QwM9G2p8+aqq8Y2l3UE9YVRBZnxUPei9SQKsxDd3vH6O+znOGuCKJUk/rHDRY5oneaHuw0GA++kkYpwa7+Ii+RMX9nHcUz2kNopEVzHemqX8ikqkcE4cgqdSA2dVbnqjocrpj0w7Q80udRk69Ni0K4WiD5TDWnrLE0uapVW66vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574049; c=relaxed/simple;
	bh=m0pjb+lFxwODsmHUtZbhrvJuChOfG2RNq0/7PzBItJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnGxT4GegWpE8awm7IF2vUmwPTOdAgNTckOjr607Xg01SjNwgyjPf4Dt2B/ji5I0cBzokCydD4SX9+WAT51Wbjpjt+znEqD/y2rgLZEqdlHtidRMoC64DBD6V6U6ypb7qRCWGQYs05D7H5ZIp86gzcYcsEIEUTf9NUzliLsQfdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx13jd4gJqdwsJAA--.3181S3;
	Tue, 12 May 2026 16:20:45 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxGMHO4gJqAwKAAA--.32306S6;
	Tue, 12 May 2026 16:20:37 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] LoongArch: kprobes: Fix handling of fatal unrecoverable recursions
Date: Tue, 12 May 2026 16:20:29 +0800
Message-ID: <20260512082029.2131-5-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAxGMHO4gJqAwKAAA--.32306S6
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr1kGrW3Xr1xWrWkuF48AFc_yoW5WF1DpF
	WkAws0qrs5Ga18Za4qyw4UZrWFka1DArW7Gw4rAa4Yy3W5GF47tryxKrWUtFyrCr95Kw4I
	vFnYkrW0gFW7ArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

KPROBE_HIT_SS and KPROBE_REENTER are two types of fatal recursions
that can not be safely recovered in kprobes.

KPROBE_HIT_SS means that a kprobe is hit during single-stepping.
At this point, the architecture-specific single-step context is
already active. Nested single-stepping would corrupt the state,
as the kprobe control block (kcb) and hardware registers cannot
safely store multiple levels of stepping state.

KPROBE_REENTER means that a third-level recursion occurs when a
probe is hit while the system is already handling a nested probe
(second-level). The kcb only provides a single slot (prev_kprobe)
to backup the state. When a third probe is hit, there is no more
space to save the state without corrupting the first-level backup.

Kprobes work by replacing instructions with breakpoints. In order
to execute the original instruction and continue, it must be moved
to a temporary "single-step" slot. Since there is no backup space
left to set up this slot safely, the CPU would be forced to return
to the same original breakpoint address, triggering an endless loop.

Currently, the code only prints a warning and returns. This leads
to an infinite re-entry loop as the CPU repeatedly hits the same
trap and a "stuck" CPU core because preemption was disabled at the
start of the handler and never re-enabled in this early return path.

Fix the logic by:
1. Merging KPROBE_HIT_SS and KPROBE_REENTER cases, as both represent
   fatal recursions that cannot be safely recovered.
2. Balancing the preemption count with preempt_enable_no_resched() to
   maintain preemption balance before the system halts.
3. Replacing WARN_ON_ONCE() with BUG() to terminate the system. This
   aligns LoongArch with other architectures (x86, arm64, riscv) and
   prevents stack overflow while providing diagnostic information.

Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/kprobes.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
index 8e1b7a87c897..e6395a9dbaec 100644
--- a/arch/loongarch/kernel/kprobes.c
+++ b/arch/loongarch/kernel/kprobes.c
@@ -186,16 +186,17 @@ static bool reenter_kprobe(struct kprobe *p, struct pt_regs *regs,
 			   struct kprobe_ctlblk *kcb)
 {
 	switch (kcb->kprobe_status) {
-	case KPROBE_HIT_SS:
 	case KPROBE_HIT_SSDONE:
 	case KPROBE_HIT_ACTIVE:
 		kprobes_inc_nmissed_count(p);
 		setup_singlestep(p, regs, kcb, 1);
 		break;
+	case KPROBE_HIT_SS:
 	case KPROBE_REENTER:
+		preempt_enable_no_resched();
 		pr_warn("Failed to recover from reentered kprobes.\n");
 		dump_kprobe(p);
-		WARN_ON_ONCE(1);
+		BUG();
 		break;
 	default:
 		WARN_ON(1);
-- 
2.42.0

