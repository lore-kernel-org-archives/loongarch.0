Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6586218E25
	for <loongarch@lists.linux.dev>; Thu,  7 Nov 2024 03:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730950177; cv=none; b=RvxIFwMX9kO3POEs+DTcdnUtpEAmoFEVolOPp3XhIq5OYb72Z94rriAatNkCbtei2iybp08XH2+4ZsH+nDXy1KZWi7KCaeF7zuHiCumQJFuKDYuiRLkwmy1n9fbekwNCzuKbZcR9YYXvioyYHPSxUAKhCVqjNYCQNpz5Lh3pqLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730950177; c=relaxed/simple;
	bh=Am8RxqOPxAWxK9fcRHsWRpairk+07nVsU2TU4MopQEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ht0uuwkF1BGR+/QzXe7uLE4ldRktkQWZaIbRYB4YRvb/AAnGtW7eKlwnpWQuLlZWD9h6m5Bk8rvEu72InAMlh0/cyt/0pN53hpekmgN27rEAH50+OaZA5zEGhbcMIVJIM2hxqJXGUTiWV5yJrCdPbT4iANEcI1xO4ooA/vV+wzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8Axjq8WNCxn4FU2AA--.18721S3;
	Thu, 07 Nov 2024 11:29:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front1 (Coremail) with SMTP id qMiowMBxnkcVNCxnNKhIAA--.64725S2;
	Thu, 07 Nov 2024 11:29:25 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH] arch: loongarch: fix loongarch S3 WARNING
Date: Thu,  7 Nov 2024 11:28:59 +0800
Message-Id: <20241107032859.18276-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxnkcVNCxnNKhIAA--.64725S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWw1xXr1DXFWkZrW8GF43XFc_yoW5CFykpr
	Wjyr4akrW8tryUXF42y3WDZr1DXF4DuF48AFWkK34UAw17Wr1ktF1jyr12gF1UAr4rCFW8
	Zr1xtw1SgFyUAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU

The enable_gpe_wakeup() function may call the preempt_schedule_common()
function, resulting in a thread switch and causing the CPU to be in an
interrupt enable state after the enable_gpe_wakeup() function returns,
leading to the warning as follow. Calling enable_gap_wakeup() before
local_irq_disable() to fix this waring.

[ C0] WARNING: ... at kernel/time/timekeeping.c:845 ktime_get+0xbc/0xc8
[ C0]         ...
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

And move enable_pci_wakeup() before local_irq_disable(), just in
case interrupt is enabled after the execution of enable_pci_wakeup()

Fixes: 366bb35a8e48 ("LoongArch: Add suspend (ACPI S3) support")
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 arch/loongarch/power/suspend.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/power/suspend.c b/arch/loongarch/power/suspend.c
index c9e594925..d0dc375b0 100644
--- a/arch/loongarch/power/suspend.c
+++ b/arch/loongarch/power/suspend.c
@@ -28,6 +28,13 @@ struct saved_registers {
 };
 static struct saved_registers saved_regs;
 
+void arch_suspend_disable_irqs(void)
+{
+	enable_gpe_wakeup();
+	enable_pci_wakeup();
+	local_irq_disable();
+}
+
 void loongarch_common_suspend(void)
 {
 	save_counter();
@@ -61,9 +68,6 @@ void loongarch_common_resume(void)
 
 int loongarch_acpi_suspend(void)
 {
-	enable_gpe_wakeup();
-	enable_pci_wakeup();
-
 	loongarch_common_suspend();
 
 	/* processor specific suspend */

base-commit: 73adbd92f3223dc0c3506822b71c6b259d5d537b
-- 
2.43.0

