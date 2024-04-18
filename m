Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5842815B129
	for <loongarch@lists.linux.dev>; Thu, 18 Apr 2024 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713438339; cv=none; b=ISTwgg8PHut4Gejmqr29IOzgRuZ1QUVZvAfHIcWIXzJFXNMXAAOgQgPKKvmF6H6FFsv5U38QYUeis+5OLFyyt+uvSv0lI1gBPCXnS1IqQONeK00oSdA5hGzIac5lckwuuIDYsm1osTtdFBZxLhybB3pMg2D4K7GEuT+wy/H6uy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713438339; c=relaxed/simple;
	bh=lUKbfHT2CeWuRaF2K1IWI2/Tr2D9SeaelyavaVNWbf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmSdzjMNUSbsjG8qN/lT/XqQZ8rfjQLFcogA7UzlPuAzW6aV/BVpZFtrf9TgtFBZEOtGRPXSUh2WNRI89k2iHi7KkHqgwzbVEbl6m+cwfWHrsbKMCCnzI56raXX5JyRw9IRs4qv1Nx2asZK8/zObu7H7bimwD8RVfE35lZYzcrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxOLpz_iBmPj0pAA--.12397S3;
	Thu, 18 Apr 2024 19:05:23 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxuhJx_iBm9g1_AA--.34063S2;
	Thu, 18 Apr 2024 19:05:21 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v5] LoongArch: Give chance to build under !CONFIG_SMP
Date: Thu, 18 Apr 2024 19:05:20 +0800
Message-ID: <20240418110520.16915-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxuhJx_iBm9g1_AA--.34063S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jr4UKFWDJw4kZF13Xw4DZFc_yoW3XrWrpF
	yqyr4Dtr4rGrn7Aryqy3yrWr15Jr1kG3y2qFy2k3y8GFnrX348Xr4vgFnIqFyUKwsYgFWI
	vFn3Wa4aqF1UAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

In the current code, SMP is selected in Kconfig for LoongArch, the users
can not unset it, this is reasonable for a multiprocessor machine. But as
the help info of config SMP said, if you have a system with only one CPU,
say N. On a uniprocessor machine, the kernel will run faster if you say N
here.

The Loongson-2K0500 is a single-core CPU for applications like industrial
control, printing terminals, and BMC (Baseboard Management Controller),
there are many development boards, products and solutions on the market,
so it is better and necessary to give a chance to build under !CONFIG_SMP
for a uniprocessor machine.

First of all, do not select SMP for config LOONGARCH in Kconfig to make it
possible to unset CONFIG_SMP. Then, do some changes to fix the warnings and
errors if CONFIG_SMP is not set.

(1) Define get_ipi_irq() only if CONFIG_SMP is set to fix the warning:
arch/loongarch/kernel/irq.c:90:19: warning: 'get_ipi_irq' defined but not used [-Wunused-function]

(2) Add "#ifdef CONFIG_SMP" in asm/smp.h to fix the warning:
./arch/loongarch/include/asm/smp.h:49:9: warning: "raw_smp_processor_id" redefined
   49 | #define raw_smp_processor_id raw_smp_processor_id
      |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/smp.h:198:9: note: this is the location of the previous definition
  198 | #define raw_smp_processor_id()                  0

(3) Define machine_shutdown() as empty under !CONFIG_SMP to fix the error:
arch/loongarch/kernel/machine_kexec.c: In function 'machine_shutdown':
arch/loongarch/kernel/machine_kexec.c:233:25: error: implicit declaration of function 'cpu_device_up'; did you mean 'put_device'? [-Wimplicit-function-declaration]

(4) Make config SCHED_SMT depends on SMP to fix many errors such as:
kernel/sched/core.c: In function 'sched_core_find':
kernel/sched/core.c:310:43: error: 'struct rq' has no member named 'cpu'

(5) Define cpu_logical_map(cpu) as 0 under !CONFIG_SMP in asm/smp.h,
then include asm/smp.h in asm/acpi.h (because acpi.h is included in
linux/irq.h indirectly) to fix many build errors under drivers/irqchip
such as:
drivers/irqchip/irq-loongson-eiointc.c: In function 'cpu_to_eio_node':
drivers/irqchip/irq-loongson-eiointc.c:59:16: error: implicit declaration of function 'cpu_logical_map' [-Wimplicit-function-declaration]

(6) Do not write per_cpu_offset(0) to PERCPU_BASE_KS when resume
because per_cpu_offset(x) is defined as __per_cpu_offset[x]) only
under CONFIG_SMP in include/asm-generic/percpu.h, just save the
value of PERCPU_BASE_KS when suspend and restore it when resume
to fix the error:
arch/loongarch/power/suspend.c: In function 'loongarch_common_resume':
arch/loongarch/power/suspend.c:47:21: error: implicit declaration of function 'per_cpu_offset' [-Wimplicit-function-declaration]

When running the UnixBench tests with "-c 1" single-streamed pass,
the improvement in performance is about 9 percent with this patch.

By the way, it is helpful to debug and analysis the kernel issue
of multi-core system under !CONFIG_SMP.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v5:
  -- Drop the changes of arch/loongarch/kernel/acpi.c
  -- Define cpu_logical_map(cpu) as 0 under !CONFIG_SMP
  -- Squash the changes of suspend.c into one single patch

 arch/loongarch/Kconfig                | 2 +-
 arch/loongarch/include/asm/acpi.h     | 1 +
 arch/loongarch/include/asm/smp.h      | 5 +++++
 arch/loongarch/kernel/irq.c           | 2 ++
 arch/loongarch/kernel/machine_kexec.c | 2 +-
 arch/loongarch/power/suspend.c        | 4 +++-
 6 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a5f300ec6f28..8d892de0b7a8 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -174,7 +174,6 @@ config LOONGARCH
 	select PCI_QUIRKS
 	select PERF_USE_VMALLOC
 	select RTC_LIB
-	select SMP
 	select SPARSE_IRQ
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	select SYSCTL_ARCH_UNALIGN_NO_WARN
@@ -420,6 +419,7 @@ config EFI_STUB
 
 config SCHED_SMT
 	bool "SMT scheduler support"
+	depends on SMP
 	default y
 	help
 	  Improves scheduler's performance when there are multiple
diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 49e29b29996f..313f66f7913a 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -8,6 +8,7 @@
 #ifndef _ASM_LOONGARCH_ACPI_H
 #define _ASM_LOONGARCH_ACPI_H
 
+#include <asm/smp.h>
 #include <asm/suspend.h>
 
 #ifdef CONFIG_ACPI
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index f81e5f01d619..8190b093a687 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -6,6 +6,7 @@
 #ifndef __ASM_SMP_H
 #define __ASM_SMP_H
 
+#ifdef CONFIG_SMP
 #include <linux/atomic.h>
 #include <linux/bitops.h>
 #include <linux/linkage.h>
@@ -101,4 +102,8 @@ static inline void __cpu_die(unsigned int cpu)
 }
 #endif
 
+#else /* !CONFIG_SMP */
+#define cpu_logical_map(cpu)	0
+#endif /* CONFIG_SMP */
+
 #endif /* __ASM_SMP_H */
diff --git a/arch/loongarch/kernel/irq.c b/arch/loongarch/kernel/irq.c
index 883e5066ae44..e791fa275ec5 100644
--- a/arch/loongarch/kernel/irq.c
+++ b/arch/loongarch/kernel/irq.c
@@ -87,6 +87,7 @@ static void __init init_vec_parent_group(void)
 	acpi_table_parse(ACPI_SIG_MCFG, early_pci_mcfg_parse);
 }
 
+#ifdef CONFIG_SMP
 static int __init get_ipi_irq(void)
 {
 	struct irq_domain *d = irq_find_matching_fwnode(cpuintc_handle, DOMAIN_BUS_ANY);
@@ -96,6 +97,7 @@ static int __init get_ipi_irq(void)
 
 	return -EINVAL;
 }
+#endif
 
 void __init init_IRQ(void)
 {
diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index 2dcb9e003657..8ae641dc53bb 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -225,6 +225,7 @@ void crash_smp_send_stop(void)
 
 void machine_shutdown(void)
 {
+#ifdef CONFIG_SMP
 	int cpu;
 
 	/* All CPUs go to reboot_code_buffer */
@@ -232,7 +233,6 @@ void machine_shutdown(void)
 		if (!cpu_online(cpu))
 			cpu_device_up(get_cpu_device(cpu));
 
-#ifdef CONFIG_SMP
 	smp_call_function(kexec_shutdown_secondary, NULL, 0);
 #endif
 }
diff --git a/arch/loongarch/power/suspend.c b/arch/loongarch/power/suspend.c
index 166d9e06a64b..8571818b93dc 100644
--- a/arch/loongarch/power/suspend.c
+++ b/arch/loongarch/power/suspend.c
@@ -24,6 +24,7 @@ struct saved_registers {
 	u64 kpgd;
 	u32 pwctl0;
 	u32 pwctl1;
+	u64 pcpu_base;
 };
 static struct saved_registers saved_regs;
 
@@ -36,6 +37,7 @@ void loongarch_common_suspend(void)
 	saved_regs.pwctl1 = csr_read32(LOONGARCH_CSR_PWCTL1);
 	saved_regs.ecfg = csr_read32(LOONGARCH_CSR_ECFG);
 	saved_regs.euen = csr_read32(LOONGARCH_CSR_EUEN);
+	saved_regs.pcpu_base = csr_read64(PERCPU_BASE_KS);
 
 	loongarch_suspend_addr = loongson_sysconf.suspend_addr;
 }
@@ -44,7 +46,7 @@ void loongarch_common_resume(void)
 {
 	sync_counter();
 	local_flush_tlb_all();
-	csr_write64(per_cpu_offset(0), PERCPU_BASE_KS);
+	csr_write64(saved_regs.pcpu_base, PERCPU_BASE_KS);
 	csr_write64(eentry, LOONGARCH_CSR_EENTRY);
 	csr_write64(eentry, LOONGARCH_CSR_MERRENTRY);
 	csr_write64(tlbrentry, LOONGARCH_CSR_TLBRENTRY);
-- 
2.42.0

