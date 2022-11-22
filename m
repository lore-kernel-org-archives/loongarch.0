Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486DE187D
	for <loongarch@lists.linux.dev>; Tue, 22 Nov 2022 11:35:06 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8DxdPDps3xjeAQAAA--.57S3;
	Tue, 22 Nov 2022 19:35:05 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPuLms3xj8xoYAA--.62977S3;
	Tue, 22 Nov 2022 19:35:05 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 1/2] LoongArch: Support booting with FDT from efi system table
Date: Tue, 22 Nov 2022 19:32:34 +0800
Message-Id: <627b5196fcb0d71d2842fadec223d25023ec43e3.1669112023.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669112023.git.zhoubinbin@loongson.cn>
References: <cover.1669112023.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxPuLms3xj8xoYAA--.62977S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Cw43tFyrWFW7tw47Gw45ZFb_yoWDKFyrpr
	9rAr1kGrZ5WFn3J393JFyDur15Xw1kCw12g3WakFy8AF47Zr1DXr4vgr9FvF1jqw4kXFyF
	qFySga129F4UJaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxU2nYFDUUUU

Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
flattened DT"), we can parse the FDT from efi system table.

And now, LoongArch is coming to support booting with FDT, so we adds the
relevant booting support as well as parameter parsing.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/Kconfig             |  2 +
 arch/loongarch/include/asm/efi.h   |  1 +
 arch/loongarch/include/asm/setup.h |  1 +
 arch/loongarch/kernel/acpi.c       | 11 +++++-
 arch/loongarch/kernel/efi.c        | 19 +++++++++-
 arch/loongarch/kernel/env.c        |  3 ++
 arch/loongarch/kernel/reset.c      |  3 +-
 arch/loongarch/kernel/setup.c      | 61 +++++++++++++++++++++++++++++-
 arch/loongarch/kernel/smp.c        | 32 ++++++++++++++++
 arch/loongarch/pci/acpi.c          |  5 ++-
 10 files changed, 131 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 5c4f1dc87f84..ff6f2b7d0ec2 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -120,6 +120,8 @@ config LOONGARCH
 	select MODULES_USE_ELF_RELA if MODULES
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
+	select OF
+	select OF_EARLY_FLATTREE
 	select PCI
 	select PCI_DOMAINS_GENERIC
 	select PCI_ECAM if ACPI
diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/asm/efi.h
index 174567b00ddb..81e5d3371868 100644
--- a/arch/loongarch/include/asm/efi.h
+++ b/arch/loongarch/include/asm/efi.h
@@ -9,6 +9,7 @@
 
 void __init efi_init(void);
 void __init efi_runtime_init(void);
+void __init *efi_fdt_pointer(void);
 void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
 
 #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE */
diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index ca373f8e3c4d..b18baf878ed4 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -13,6 +13,7 @@
 
 extern unsigned long eentry;
 extern unsigned long tlbrentry;
+extern char original_cmdline[COMMAND_LINE_SIZE];
 extern void tlb_init(int cpu);
 extern void cpu_cache_init(void);
 extern void cache_error_setup(void);
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index c435ce320c59..8fceda717598 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -13,6 +13,7 @@
 #include <linux/irqdomain.h>
 #include <linux/memblock.h>
 #include <linux/serial_core.h>
+#include <linux/of_fdt.h>
 #include <asm/io.h>
 #include <asm/numa.h>
 #include <asm/loongson.h>
@@ -151,14 +152,14 @@ void __init acpi_boot_table_init(void)
 	 * If acpi_disabled, bail out
 	 */
 	if (acpi_disabled)
-		return;
+		goto fdt_earlycon;
 
 	/*
 	 * Initialize the ACPI boot-time table parser.
 	 */
 	if (acpi_table_init()) {
 		disable_acpi();
-		return;
+		goto fdt_earlycon;
 	}
 
 	loongson_sysconf.boot_cpu_id = read_csr_cpuid();
@@ -170,6 +171,12 @@ void __init acpi_boot_table_init(void)
 
 	/* Do not enable ACPI SPCR console by default */
 	acpi_parse_spcr(earlycon_acpi_spcr_enable, false);
+
+	return;
+
+fdt_earlycon:
+	if (earlycon_acpi_spcr_enable)
+		early_init_dt_scan_chosen_stdout();
 }
 
 #ifdef CONFIG_ACPI_NUMA
diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
index a31329971133..dc6d52bc7700 100644
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@ -27,17 +27,19 @@
 static unsigned long efi_nr_tables;
 static unsigned long efi_config_table;
 
-static unsigned long __initdata boot_memmap = EFI_INVALID_TABLE_ADDR;
+static unsigned long boot_memmap __initdata = EFI_INVALID_TABLE_ADDR;
+static unsigned long efi_fdt __initdata = EFI_INVALID_TABLE_ADDR;
 
 static efi_system_table_t *efi_systab;
 static efi_config_table_type_t arch_tables[] __initdata = {
 	{LINUX_EFI_BOOT_MEMMAP_GUID,	&boot_memmap,	"MEMMAP" },
+	{DEVICE_TREE_GUID,		&efi_fdt,	"EFIFDT" },
 	{},
 };
 
 void __init efi_runtime_init(void)
 {
-	if (!efi_enabled(EFI_BOOT))
+	if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
 		return;
 
 	if (efi_runtime_disabled()) {
@@ -101,3 +103,16 @@ void __init efi_init(void)
 		early_memunmap(tbl, sizeof(*tbl));
 	}
 }
+
+void __init *efi_fdt_pointer(void)
+{
+	if (!efi_systab) {
+		pr_err("Can't find EFI system table.\n");
+		return NULL;
+	}
+
+	if (efi_fdt == EFI_INVALID_TABLE_ADDR)
+		return NULL;
+
+	return (void *)early_memremap_ro(efi_fdt, sizeof(efi_fdt));
+}
diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
index 6d56a463b091..4fd6eb9398b4 100644
--- a/arch/loongarch/kernel/env.c
+++ b/arch/loongarch/kernel/env.c
@@ -11,6 +11,7 @@
 #include <asm/early_ioremap.h>
 #include <asm/bootinfo.h>
 #include <asm/loongson.h>
+#include <asm/setup.h>
 
 u64 efi_system_table;
 struct loongson_system_configuration loongson_sysconf;
@@ -27,6 +28,8 @@ void __init init_environ(void)
 		clear_bit(EFI_BOOT, &efi.flags);
 
 	strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
+	/* Save unparsed command line copy for FDT */
+	strscpy(original_cmdline, boot_command_line, COMMAND_LINE_SIZE);
 	early_memunmap(cmdline, COMMAND_LINE_SIZE);
 
 	efi_system_table = fw_arg2;
diff --git a/arch/loongarch/kernel/reset.c b/arch/loongarch/kernel/reset.c
index 9fad889a3c1b..1ef8c6383535 100644
--- a/arch/loongarch/kernel/reset.c
+++ b/arch/loongarch/kernel/reset.c
@@ -44,7 +44,8 @@ void machine_power_off(void)
 	smp_send_stop();
 #endif
 #ifdef CONFIG_PM
-	enable_pci_wakeup();
+	if (!acpi_disabled)
+		enable_pci_wakeup();
 #endif
 	do_kernel_power_off();
 #ifdef CONFIG_EFI
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 01ed0c3f0c78..6bc1b9b0186d 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -30,6 +30,9 @@
 #include <linux/dma-map-ops.h>
 #include <linux/suspend.h>
 #include <linux/swiotlb.h>
+#include <linux/of_fdt.h>
+#include <linux/of_address.h>
+#include <linux/libfdt.h>
 
 #include <asm/addrspace.h>
 #include <asm/alternative.h>
@@ -70,6 +73,7 @@ static const char dmi_empty_string[] = "        ";
  *
  * These are initialized so they are in the .data section
  */
+char original_cmdline[COMMAND_LINE_SIZE] __initdata;
 
 static int num_standard_resources;
 static struct resource *standard_resources;
@@ -288,6 +292,36 @@ static void __init check_kernel_sections_mem(void)
 	}
 }
 
+static void __init bootcmdline_init(char **cmdline_p)
+{
+	/*
+	 * If CONFIG_CMDLINE_FORCE is enabled then initializing the command line
+	 * is trivial - we simply use the built-in command line unconditionally &
+	 * unmodified.
+	 */
+	if (IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
+		strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+		return;
+	}
+
+#ifdef CONFIG_OF_FLATTREE
+	/*
+	 * If CONFIG_CMDLINE_BOOTLOADER is enabled and we are in FDT-based system,
+	 * the boot_command_line will be overwritten by early_init_dt_scan_chosen().
+	 * So we need to append original_cmdline(the original copy of
+	 * boot_command_line) to boot_command_line.
+	 */
+	if (initial_boot_params) {
+		if (boot_command_line[0])
+			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+
+		strlcat(boot_command_line, original_cmdline, COMMAND_LINE_SIZE);
+	}
+#endif
+
+	*cmdline_p = boot_command_line;
+}
+
 /*
  * arch_mem_init - initialize memory management subsystem
  */
@@ -298,6 +332,8 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	check_kernel_sections_mem();
 
+	early_init_fdt_scan_reserved_mem();
+
 	/*
 	 * In order to reduce the possibility of kernel panic when failed to
 	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to allocate
@@ -424,20 +460,43 @@ static void __init prefill_possible_map(void)
 }
 #endif
 
+static void __init fdt_setup(void)
+{
+#ifdef CONFIG_OF_EARLY_FLATTREE
+	void *fdt_pointer;
+
+	/* ACPI-based systems do not require parsing fdt */
+	if (acpi_os_get_root_pointer())
+		return;
+
+	/* Look for a device tree configuration table entry */
+	fdt_pointer = efi_fdt_pointer();
+	if (!fdt_pointer || fdt_check_header(fdt_pointer))
+		return;
+
+	early_init_dt_scan(fdt_pointer);
+	early_init_fdt_reserve_self();
+
+	max_low_pfn = PFN_PHYS(memblock_end_of_DRAM());
+#endif
+}
+
 void __init setup_arch(char **cmdline_p)
 {
 	cpu_probe();
-	*cmdline_p = boot_command_line;
 
 	init_environ();
 	efi_init();
+	fdt_setup();
 	memblock_init();
 	pagetable_init();
+	bootcmdline_init(cmdline_p);
 	parse_early_param();
 	reserve_initrd_mem();
 
 	platform_init();
 	arch_mem_init(cmdline_p);
+	unflatten_and_copy_device_tree();
 
 	resource_init();
 #ifdef CONFIG_SMP
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 90ddcac0df9b..a0c7edb240d1 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -170,8 +170,40 @@ irqreturn_t loongson_ipi_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void __init fdt_smp_setup(void)
+{
+#ifdef CONFIG_OF
+	struct device_node *node = NULL;
+	unsigned int cpu, cpuid;
+
+	for_each_of_cpu_node(node) {
+		if (!of_device_is_available(node))
+			continue;
+
+		cpuid = of_get_cpu_hwid(node, 0);
+		if (cpuid >= nr_cpu_ids)
+			continue;
+
+		if (cpuid == loongson_sysconf.boot_cpu_id)
+			cpu = 0;
+		else
+			cpu = cpumask_next_zero(-1, cpu_present_mask);
+
+		num_processors++;
+		set_cpu_possible(cpu, true);
+		set_cpu_present(cpu, true);
+		__cpu_number_map[cpuid] = cpu;
+		__cpu_logical_map[cpu] = cpuid;
+	}
+
+	loongson_sysconf.nr_cpus = num_processors;
+#endif
+}
+
 void __init loongson_smp_setup(void)
 {
+	fdt_smp_setup();
+
 	cpu_data[0].core = cpu_logical_map(0) % loongson_sysconf.cores_per_package;
 	cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
 
diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
index 8235ec92b41f..dd7df7a985fd 100644
--- a/arch/loongarch/pci/acpi.c
+++ b/arch/loongarch/pci/acpi.c
@@ -27,9 +27,12 @@ void pcibios_add_bus(struct pci_bus *bus)
 int pcibios_root_bridge_prepare(struct pci_host_bridge *bridge)
 {
 	struct pci_config_window *cfg = bridge->bus->sysdata;
-	struct acpi_device *adev = to_acpi_device(cfg->parent);
+	struct acpi_device *adev = NULL;
 	struct device *bus_dev = &bridge->bus->dev;
 
+	if (!acpi_disabled)
+		adev = to_acpi_device(cfg->parent);
+
 	ACPI_COMPANION_SET(&bridge->dev, adev);
 	set_dev_node(bus_dev, pa_to_nid(cfg->res.start));
 
-- 
2.31.1

