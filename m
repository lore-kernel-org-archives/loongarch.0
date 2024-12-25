Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC732101EE
	for <loongarch@lists.linux.dev>; Wed, 25 Dec 2024 02:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735093775; cv=none; b=PVclGZySTVq/8u2QBHw3JZQX6YSenMBlx7H6qpTksk+NkWPC9zqx8zebmZjRWDWf9J8EpuDdgj89QOXFMBYWpA6b6MAvM4BsDrsgn4t2kuGRwNY26nIkkErMoDUAuW73KP7rnQB8VLeDyFdDehHYWWEJ1c9tFYB93ZYI+fBd/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735093775; c=relaxed/simple;
	bh=3YfA55JdhpnBe8ei/uom0KnS+MaV4Vg9UAj51Q9tWGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgiOspTepRcUSA5RbATKCx64sNzdBSH9XYpBZGFDYMBDNGopquCYdoF9lf9IPp6JMpE9gTR3qiJ9gTtm8Iaahzgv8G76D4v0Uhaof+FFgkctP3c82BJv8I/9iQDzH3/Q+wxI5U/eTQsrKH60i8sqYgN2ti6wj9rgheStr+mANyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8AxUa8BbmtncT9aAA--.46977S3;
	Wed, 25 Dec 2024 10:29:22 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front1 (Coremail) with SMTP id qMiowMCx3sUAbmtnvFsIAA--.35929S2;
	Wed, 25 Dec 2024 10:29:21 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH V2] LoongArch: Fix warnings during S3 suspend
Date: Wed, 25 Dec 2024 10:29:19 +0800
Message-Id: <20241225022919.29573-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx3sUAbmtnvFsIAA--.35929S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw43Jry3Kr4UXFy5GFyxCrX_yoWrJr4rpr
	Wqyr48CrW0kry8AFsFy3WDur1DXF4DuF4Ivr4vkryUAw17Ww1kXr1Iyry7KF17Aw45CFWr
	Zr1xtr1ftFyDAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU74lkDUUUU

From: Huacai Chen <chenhuacai@loongson.cn>

The enable_gpe_wakeup() function calls acpi_enable_all_wakeup_gpes(),
and the later one may call the preempt_schedule_common() function,
resulting in a thread switch and causing the CPU to be in an interrupt
enabled state after the enable_gpe_wakeup() function returns, leading
to the warnings as follow.

[ C0] WARNING: ... at kernel/time/timekeeping.c:845 ktime_get+0xbc/0xc8
[ C0]          ...
[ C0] Call Trace:
[ C0] [<90000000002243b4>] show_stack+0x64/0x188
[ C0] [<900000000164673c>] dump_stack_lvl+0x60/0x88
[ C0] [<90000000002687e4>] __warn+0x8c/0x148
[ C0] [<90000000015e9978>] report_bug+0x1c0/0x2b0
[ C0] [<90000000016478e4>] do_bp+0x204/0x3b8
[ C0] [<90000000025b1924>] exception_handlers+0x1924/0x10000
[ C0] [<9000000000343bbc>] ktime_get+0xbc/0xc8
[ C0] [<9000000000354c08>] tick_sched_timer+0x30/0xb0
[ C0] [<90000000003408e0>] __hrtimer_run_queues+0x160/0x378
[ C0] [<9000000000341f14>] hrtimer_interrupt+0x144/0x388
[ C0] [<9000000000228348>] constant_timer_interrupt+0x38/0x48
[ C0] [<90000000002feba4>] __handle_irq_event_percpu+0x64/0x1e8
[ C0] [<90000000002fed48>] handle_irq_event_percpu+0x20/0x80
[ C0] [<9000000000306b9c>] handle_percpu_irq+0x5c/0x98
[ C0] [<90000000002fd4a0>] generic_handle_domain_irq+0x30/0x48
[ C0] [<9000000000d0c7b0>] handle_cpu_irq+0x70/0xa8
[ C0] [<9000000001646b30>] handle_loongarch_irq+0x30/0x48
[ C0] [<9000000001646bc8>] do_vint+0x80/0xe0
[ C0] [<90000000002aea1c>] finish_task_switch.isra.0+0x8c/0x2a8
[ C0] [<900000000164e34c>] __schedule+0x314/0xa48
[ C0] [<900000000164ead8>] schedule+0x58/0xf0
[ C0] [<9000000000294a2c>] worker_thread+0x224/0x498
[ C0] [<900000000029d2f0>] kthread+0xf8/0x108
[ C0] [<9000000000221f28>] ret_from_kernel_thread+0xc/0xa4
[ C0]
[ C0] ---[ end trace 0000000000000000 ]---

The root cause is acpi_enable_all_wakeup_gpes() uses a mutex to protect
acpi_hw_enable_all_wakeup_gpes(), and acpi_ut_acquire_mutex() may cause
a thread switch. Since there is no longer concurrent execution during
loongarch_acpi_suspend(), we can call acpi_hw_enable_all_wakeup_gpes()
directly in enable_gpe_wakeup().

Fixes: 366bb35a8e48 ("LoongArch: Add suspend (ACPI S3) support")
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/acpi.h | 2 ++
 arch/loongarch/power/platform.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 313f66f7913a..fc2eff0535f8 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -52,6 +52,8 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
 extern int loongarch_acpi_suspend(void);
 extern int (*acpi_suspend_lowlevel)(void);
 
+acpi_status acpi_hw_enable_all_wakeup_gpes(void);
+
 static inline unsigned long acpi_get_wakeup_address(void)
 {
 #ifdef CONFIG_SUSPEND
diff --git a/arch/loongarch/power/platform.c b/arch/loongarch/power/platform.c
index 0909729dc2e1..5bbdb9fd76e5 100644
--- a/arch/loongarch/power/platform.c
+++ b/arch/loongarch/power/platform.c
@@ -17,7 +17,7 @@ void enable_gpe_wakeup(void)
 	if (acpi_gbl_reduced_hardware)
 	       return;
 
-	acpi_enable_all_wakeup_gpes();
+	acpi_hw_enable_all_wakeup_gpes();
 }
 
 void enable_pci_wakeup(void)
-- 
2.43.5

