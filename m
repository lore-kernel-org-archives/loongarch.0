Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587B2360EF4
	for <loongarch@lists.linux.dev>; Mon, 22 Jun 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111567; cv=none; b=OQ3Mioeer5yoTtFbHK99lhXtPMotcTWnxUOi0eN8HfrKRQpCGHuIHmyjz5DSa6bnMpWgIaHIZY2JBw9oLje85IcRDCGsM3LzHUWkYU0uwlq50oD6yQ+xD3Bmfg7UC0Cxj9BE8WJgGb84Vz/INhzPaBiUu8Be8BNDGTfCgK5oDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111567; c=relaxed/simple;
	bh=SunVqTbbcHe4j9+DNc8+TpOP6zhpxhhrWrMF6LO8tvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vm9+V5wgPtRw5ZXlNG9/XJ8P3PdM7cQlkaQ/CVVSYhkWr71OObIQH326wX/XgTN2ULcLslZjbGuYHCxH8se48CQAv2hEmJMIW4H83g/efjr03JFfSqh0XnijHKL8YxwHdEasjlDqW8W2mfpayLCx/YJ3N7sT8R7lmnSkSLDtaoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8DxrcBL3ThqvoAWAA--.34399S3;
	Mon, 22 Jun 2026 14:59:23 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJCxdcBG3ThqUrOuAA--.59367S2;
	Mon, 22 Jun 2026 14:59:23 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Report dying CPU to RCU in stop_this_cpu()
Date: Mon, 22 Jun 2026 14:59:10 +0800
Message-ID: <20260622065910.3961592-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxdcBG3ThqUrOuAA--.59367S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFW3Xw47JrW7WFy3Jr17XFc_yoW8KF48pr
	WFkrn5Zr4kWF1vv398J34xWr9Fy393Gw13X3Z3GrZ3Aay5tr1DZw1IqFyqqFyF9393u34I
	vFn0v3yvv3WUAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1LiSJUUUUU==

This is a port of MIPS commit 9f3f3bdc6d9dac1 ("MIPS: smp: report dying
CPU to RCU in stop_this_cpu()"). smp_send_stop() parks all secondary
CPUs in stop_this_cpu(). And the function marks the CPU offline for the
scheduler via set_cpu_online(false) but never informs RCU, so RCU keeps
expecting a quiescent state from CPUs that are now spinning forever with
interrupts disabled.

As long as nothing waits for an RCU grace period after smp_send_stop()
this is harmless, which is why it went unnoticed. However, since commit
91840be8f710370 ("irq_work: Fix use-after-free in irq_work_single() on
PREEMPT_RT"), irq_work_sync() calls synchronize_rcu() on architectures
without an irq_work self-IPI, i.e. where arch_irq_work_has_interrupt()
returns false. Any irq_work_sync() issued in the reboot/shutdown/halt
path after smp_send_stop() then blocks on a grace period that can never
complete, hanging the reboot:

  WARNING: CPU: 0 PID: 15 at kernel/irq_work.c:144 irq_work_queue_on
  ...
  rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
  rcu: Offline CPU 1 blocking current GP.
  rcu: Offline CPU 2 blocking current GP.
  rcu: Offline CPU 3 blocking current GP.

This issue needs some hacks to reproduce, and it was not noticed on
LoongArch because arch_irq_work_has_interrupt() usually returns true.

Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring
the generic CPU-hotplug offline path, so RCU stops waiting on the parked
CPUs and grace periods can still complete. LoongArch shuts down all CPUs
here without going through the CPU-hotplug mechanism, so this report is
not otherwise issued.

Cc: <stable@vger.kernel.org>
Fixes: 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT")
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index c191c680de66..5d792256bbb9 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -707,6 +707,7 @@ static void stop_this_cpu(void *dummy)
 	set_cpu_online(smp_processor_id(), false);
 	calculate_cpu_foreign_map();
 	local_irq_disable();
+	rcutree_report_cpu_dead();
 	while (true);
 }
 
-- 
2.52.0

