Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5814618C02E
	for <loongarch@lists.linux.dev>; Mon, 17 Aug 2026 03:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786939157; cv=none; b=UBtoc9z0DELGvGyBaZLxCg4Ds8+bPnVRDXxIV+49vn+Xqsl6oivtxjyvG/YQW7mqxMkG2uOB5/VdE1zLNWZo3yn3V4tvFlJvQJhCV/aiP8yW5Od0Qm8UlOl/urOu0L7uPtJUxH/aD5x+Aj8D46NEzVEIQAv7fzLRyAsDSbUvNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786939157; c=relaxed/simple;
	bh=/azja+DigKC35vbRcMH+13nwQRW59K/IouueAxRoSEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sY5nAIn7M2YtrV5xZrq2KDgZz+B/AZ+mDmfGYui0OH8xKHg9iySAlFmGFDsgwEwmoKhjev9IuoVQgr93ceURJI4HMbybmzrUQXjIwCQHaJ7En0abk5nHBIUylIQ1CyTEQm+/aEq0O0bBemZGInI93NJYh10KEXbHlg+OPtS5EzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxD9MQh4JqcL0BAA--.5342S3;
	Mon, 17 Aug 2026 11:59:13 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxTs8Mh4JqKXsHAA--.48950S2;
	Mon, 17 Aug 2026 11:59:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vincent Li <vincent.mc.li@gmail.com>
Subject: [PATCH v1] LoongArch: Fix __smp_mb__{before,after}_atomic()
Date: Mon, 17 Aug 2026 11:59:08 +0800
Message-ID: <20260817035908.460-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs8Mh4JqKXsHAA--.48950S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCrW7ZF15Xr4ftF1kGF1fKrX_yoWrur17pF
	W7Ar4jkr48JF4UX3WUA3WUZF1kXa1kuF47J3yrKryjvF1jgr1jyr1UKr13uFyUCws5XFya
	va1qq34fKFyUGagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU88Ma5UUUUU==

When testing the BPF selftest "sudo ./test_progs -t timer_lockup", there
is a kernel lockup and panic:

  watchdog: BUG: soft lockup - CPU#1 stuck for 8s! [test_progs:39601]
  Kernel panic - not syncing: softlockup: hung tasks
  ...
  Call Trace:
  [<9000000000c6d2a4>] show_stack+0xf4/0x1c0
  [<9000000000c66ad4>] dump_stack_lvl+0x84/0xc8
  [<9000000000c40c10>] vpanic+0x278/0x4bc
  [<9000000000c40e98>] panic+0x44/0x48
  [<9000000000e8b000>] watchdog_timer_fn+0x500/0x520
  [<9000000000dfd9a4>] __hrtimer_run_queues+0xc4/0x530
  [<9000000000dffe90>] hrtimer_interrupt+0x140/0x320
  [<9000000000c701e4>] constant_timer_interrupt+0x34/0x50
  [<9000000000d956b8>] __handle_irq_event_percpu+0xe8/0x560
  [<9000000000d95b4c>] handle_irq_event_percpu+0x1c/0x80
  [<9000000000d9e4c4>] handle_percpu_irq+0x74/0xd0
  [<9000000000d945d4>] generic_handle_domain_irq+0x34/0x90
  [<9000000001c4ee84>] handle_cpu_irq+0x64/0xa0
  [<9000000002ac0fa8>] handle_loongarch_irq+0x28/0x40
  [<9000000002ac103c>] do_vint+0x7c/0xf0
  [<9000000002ad9e4c>] _raw_spin_unlock_irqrestore+0x8c/0xc0
  [<9000000000dfe9e0>] hrtimer_try_to_cancel.part.0+0x70/0x350
  [<9000000000dfed58>] hrtimer_cancel+0x38/0x80
  [<9000000000f6d944>] bpf_timer_cancel+0x94/0x1e0
  [<ffff80000200fad0>] bpf_prog_108ab87b32f22e44_timer_cb1+0xb0/0xfc
  [<9000000000f6b838>] bpf_timer_cb+0x98/0x170
  [<9000000000dfdaac>] __hrtimer_run_queues+0x1cc/0x530
  [<9000000000dfde94>] hrtimer_run_softirq+0x84/0xd0
  [<9000000000caa584>] handle_softirqs+0x154/0x7a0
  [<9000000000cab0a4>] do_softirq+0xb4/0x120
  [<9000000000cab27c>] __local_bh_enable_ip+0x16c/0x1c0
  [<900000000271d9e0>] bpf_test_run+0x1c0/0x5c0
  [<900000000271f548>] bpf_prog_test_run_skb+0x6e8/0xe20
  [<9000000000f39940>] __sys_bpf+0x1690/0x2c50
  [<9000000000f3af28>] sys_bpf+0x28/0x40
  [<9000000002ac2d68>] do_syscall+0x108/0x5e0
  [<9000000000c6a850>] handle_syscall+0xd0/0x170

In bpf_timer_cancel() of kernel/bpf/helpers.c, it explicitly notes that
"Need full barrier after relaxed atomic_inc" to expect a full hardware
barrier to ensure global visibility, but there is only an empty barrier
for smp_mb__after_atomic().

As LoongArch is a weakly-ordered architecture, without a data barrier,
the physical ordering of "store-before-load" cannot be guaranteed. As
a result, a subsequent read can bypass a prior relaxed atomic write
during lockless dependency checks. This allows both CPUs to experience
store-load reordering and simultaneously bypass the lockless deadlock
detection in the software, leading them to proceed into hrtimer_cancel()
and trigger a severe ABBA deadlock in the BPF core during the concurrent
test runs, resulting in a kernel panic.

Upgrade __smp_mb__after_atomic() to __smp_mb(), which generates the data
barrier instruction DBAR to provide full barrier after relaxed atomic_inc.
While at it, also upgrade __smp_mb__before_atomic() to __smp_mb().

With this patch, the lockless "store-before-load" ordering is enforced by
the DBAR instruction. The BPF timer_lockup selftest was stressed for 5000
consecutive loops on a physical LoongArch machine without encountering any
further lockups or warnings:

  for i in {1..5000}; do sudo ./test_progs -t timer_lockup; done

Reported-by: Vincent Li <vincent.mc.li@gmail.com>
Closes: https://lore.kernel.org/loongarch/CAK3+h2xOSEZUHhou7N2cRL-aGrZCNSm45g+P7thObMe+fpgYCA@mail.gmail.com/
Fixes: 46859ac8af52 ("LoongArch: Add multi-processor (SMP) support")

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/barrier.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/barrier.h b/arch/loongarch/include/asm/barrier.h
index 4b663f197706..adfe343dfa65 100644
--- a/arch/loongarch/include/asm/barrier.h
+++ b/arch/loongarch/include/asm/barrier.h
@@ -57,8 +57,8 @@
 #define __WEAK_LLSC_MB		"			\n"
 #endif
 
-#define __smp_mb__before_atomic()	barrier()
-#define __smp_mb__after_atomic()	barrier()
+#define __smp_mb__before_atomic()	__smp_mb()
+#define __smp_mb__after_atomic()	__smp_mb()
 
 /**
  * array_index_mask_nospec() - generate a ~0 mask when index < size, 0 otherwise
-- 
2.42.0

