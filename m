Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C383D6C
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 09:38:05 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.195])
	by gateway (Coremail) with SMTP id _____8DxDet7iolkWhMFAA--.10871S3;
	Wed, 14 Jun 2023 17:38:03 +0800 (CST)
Received: from localhost.localdomain (unknown [10.20.42.195])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTMp6iolkYnUaAA--.1107S2;
	Wed, 14 Jun 2023 17:38:02 +0800 (CST)
From: Liupu Wang <wangliupu@loongson.cn>
To: Liupu Wang <wangliupu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Marc Zyngier <maz@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	loongarch@lists.linux.dev
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Add SMT (Simultaneous Multi-Threading) support
Date: Wed, 14 Jun 2023 17:37:55 +0800
Message-Id: <20230614093755.88881-1-wangliupu@loongson.cn>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxTMp6iolkYnUaAA--.1107S2
X-CM-SenderInfo: pzdqwzplxs3qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKry7GFy8Kw4rJFWftFyrAFc_yoW3urWDpF
	9FkF18GrW8WFn5A397J3yrury5WwnrG3W2qa17Ka4rAF4UW34UXr1ktasrXFyUKws0ga1F
	vr95Ga1UKayUXabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=

From: Huacai Chen <chenhuacai@loongson.cn>

Loongson-3A6000 has SMT (Simultaneous Multi-Threading) support, each
physical core has two logical cores (threads). This patch add SMT probe
and scheduler support via ACPI PPTT.

If SCHED_SMT enabled, Loongson-3A6000 is treated as 4 cores, 8 threads;
If SCHED_SMT disabled, Loongson-3A6000 is treated as 8 cores, 8 threads.

Remove smp_num_siblings to support HMP (Heterogeneous Multi-Processing).

Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig                |  8 +++++++
 arch/loongarch/include/asm/acpi.h     |  9 ++++++++
 arch/loongarch/include/asm/cpu-info.h |  1 +
 arch/loongarch/kernel/acpi.c          | 32 +++++++++++++++++++++++++++
 arch/loongarch/kernel/proc.c          |  1 +
 arch/loongarch/kernel/smp.c           | 24 +++++++++-----------
 drivers/acpi/Kconfig                  |  2 +-
 7 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d38b066fc931..6d36b681068e 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -5,6 +5,7 @@ config LOONGARCH
 	select ACPI
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_MCFG if ACPI
+	select ACPI_PPTT if ACPI
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ARCH_BINFMT_ELF_STATE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
@@ -372,6 +373,13 @@ config EFI_STUB
 	  This kernel feature allows the kernel to be loaded directly by
 	  EFI firmware without the use of a bootloader.
 
+config SCHED_SMT
+	bool "SMT scheduler support"
+	default y
+	help
+	  Improves scheduler's performance when there are multiple
+	  threads in one physical core.
+
 config SMP
 	bool "Multi-Processing support"
 	help
diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 976a810352c6..5c78b5d2bfb7 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -13,6 +13,7 @@ extern int acpi_strict;
 extern int acpi_disabled;
 extern int acpi_pci_disabled;
 extern int acpi_noirq;
+extern int pptt_enabled;
 
 #define acpi_os_ioremap acpi_os_ioremap
 void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
@@ -30,6 +31,14 @@ static inline bool acpi_has_cpu_in_madt(void)
 }
 
 extern struct list_head acpi_wakeup_device_list;
+extern struct acpi_madt_core_pic acpi_core_pic[NR_CPUS];
+
+extern int __init parse_acpi_topology(void);
+
+static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
+{
+	return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
+}
 
 #endif /* !CONFIG_ACPI */
 
diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/include/asm/cpu-info.h
index cd73a6f57fe3..900589cb159d 100644
--- a/arch/loongarch/include/asm/cpu-info.h
+++ b/arch/loongarch/include/asm/cpu-info.h
@@ -54,6 +54,7 @@ struct cpuinfo_loongarch {
 	struct cache_desc	cache_leaves[CACHE_LEAVES_MAX];
 	int			core;   /* physical core number in package */
 	int			package;/* physical package number */
+	int			global_id; /* physical global thread number */
 	int			vabits; /* Virtual Address size in bits */
 	int			pabits; /* Physical Address size in bits */
 	unsigned int		ksave_mask; /* Usable KSave mask. */
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index 98f431157e4c..9450e09073eb 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -33,6 +33,8 @@ u64 acpi_saved_sp;
 
 #define PREFIX			"ACPI: "
 
+struct acpi_madt_core_pic acpi_core_pic[NR_CPUS];
+
 void __init __iomem * __acpi_map_table(unsigned long phys, unsigned long size)
 {
 
@@ -99,6 +101,7 @@ acpi_parse_processor(union acpi_subtable_headers *header, const unsigned long en
 
 	acpi_table_print_madt_entry(&header->common);
 #ifdef CONFIG_SMP
+	acpi_core_pic[processor->core_id] = *processor;
 	set_processor_mask(processor->core_id, processor->flags);
 #endif
 
@@ -140,6 +143,35 @@ static void __init acpi_process_madt(void)
 	loongson_sysconf.nr_cpus = num_processors;
 }
 
+int pptt_enabled;
+
+int __init parse_acpi_topology(void)
+{
+	int cpu, topology_id;
+
+	for_each_possible_cpu(cpu) {
+		topology_id = find_acpi_cpu_topology(cpu, 0);
+		if (topology_id < 0) {
+			pr_warn("Invalid BIOS PPTT\n");
+			return -ENOENT;
+		}
+
+		if (acpi_pptt_cpu_is_thread(cpu) <= 0)
+			cpu_data[cpu].core = topology_id;
+		else {
+			topology_id = find_acpi_cpu_topology(cpu, 1);
+			if (topology_id < 0)
+				return -ENOENT;
+
+			cpu_data[cpu].core = topology_id;
+		}
+	}
+
+	pptt_enabled = 1;
+
+	return 0;
+}
+
 #ifndef CONFIG_SUSPEND
 int (*acpi_suspend_lowlevel)(void);
 #else
diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 0d82907b5404..d4b270630bb5 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -49,6 +49,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t\t: %ld\n", n);
 	seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
 	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
+	seq_printf(m, "global_id\t\t: %d\n", cpu_data[n].global_id);
 	seq_printf(m, "CPU Family\t\t: %s\n", __cpu_family[n]);
 	seq_printf(m, "Model Name\t\t: %s\n", __cpu_full_name[n]);
 	seq_printf(m, "CPU Revision\t\t: 0x%02x\n", version);
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index ed167e244cda..062f3fe8df60 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2000, 2001 Silicon Graphics, Inc.
  * Copyright (C) 2000, 2001, 2003 Broadcom Corporation
  */
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/init.h>
@@ -37,10 +38,6 @@ EXPORT_SYMBOL(__cpu_number_map);
 int __cpu_logical_map[NR_CPUS];		/* Map logical to physical */
 EXPORT_SYMBOL(__cpu_logical_map);
 
-/* Number of threads (siblings) per CPU core */
-int smp_num_siblings = 1;
-EXPORT_SYMBOL(smp_num_siblings);
-
 /* Representing the threads (siblings) of each logical CPU */
 cpumask_t cpu_sibling_map[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(cpu_sibling_map);
@@ -228,9 +225,12 @@ void __init loongson_prepare_cpus(unsigned int max_cpus)
 {
 	int i = 0;
 
+	parse_acpi_topology();
+
 	for (i = 0; i < loongson_sysconf.nr_cpus; i++) {
 		set_cpu_present(i, true);
 		csr_mail_send(0, __cpu_logical_map[i], 0);
+		cpu_data[i].global_id = __cpu_logical_map[i];
 	}
 
 	per_cpu(cpu_state, smp_processor_id()) = CPU_ONLINE;
@@ -271,10 +271,10 @@ void loongson_init_secondary(void)
 	numa_add_cpu(cpu);
 #endif
 	per_cpu(cpu_state, cpu) = CPU_ONLINE;
-	cpu_data[cpu].core =
-		     cpu_logical_map(cpu) % loongson_sysconf.cores_per_package;
 	cpu_data[cpu].package =
 		     cpu_logical_map(cpu) / loongson_sysconf.cores_per_package;
+	cpu_data[cpu].core = pptt_enabled ? cpu_data[cpu].core :
+		     cpu_logical_map(cpu) % loongson_sysconf.cores_per_package;
 }
 
 void loongson_smp_finish(void)
@@ -380,14 +380,10 @@ static inline void set_cpu_sibling_map(int cpu)
 
 	cpumask_set_cpu(cpu, &cpu_sibling_setup_map);
 
-	if (smp_num_siblings <= 1)
-		cpumask_set_cpu(cpu, &cpu_sibling_map[cpu]);
-	else {
-		for_each_cpu(i, &cpu_sibling_setup_map) {
-			if (cpus_are_siblings(cpu, i)) {
-				cpumask_set_cpu(i, &cpu_sibling_map[cpu]);
-				cpumask_set_cpu(cpu, &cpu_sibling_map[i]);
-			}
+	for_each_cpu(i, &cpu_sibling_setup_map) {
+		if (cpus_are_siblings(cpu, i)) {
+			cpumask_set_cpu(i, &cpu_sibling_map[cpu]);
+			cpumask_set_cpu(cpu, &cpu_sibling_map[i]);
 		}
 	}
 }
diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ccbeab9500ec..00dd309b6682 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -542,10 +542,10 @@ config ACPI_PFRUT
 
 if ARM64
 source "drivers/acpi/arm64/Kconfig"
+endif
 
 config ACPI_PPTT
 	bool
-endif
 
 config ACPI_PCC
 	bool "ACPI PCC Address Space"
-- 
2.39.1

