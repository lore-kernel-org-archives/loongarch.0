Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCF57F
	for <loongarch@lists.linux.dev>; Sun,  6 Nov 2022 06:58:34 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.24.7])
	by gateway (Coremail) with SMTP id _____8Cxq9gRW2dj4L8EAA--.15658S3;
	Sun, 06 Nov 2022 14:58:25 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.24.7])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxZ1cOW2djGvANAA--.21150S2;
	Sun, 06 Nov 2022 14:58:23 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] LoongArch: Support booting with FDT from efi system table
Date: Sun,  6 Nov 2022 14:56:19 +0800
Message-Id: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxZ1cOW2djGvANAA--.21150S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Xw1rWw1DXr4ktrWUWw1fXrb_yoW3Xw47pr
	y7Ars3Grs5GFn7JrZ3JFykurs8Xws2kw1ag3W2kFykAF47Zr1DWr4vgr9IvFyqqa1kAFyF
	qFWFga129F4UJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==

Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
flattened DT"), we can parse the FDT from efi system table.

And now, the Loongson-2K series cpus based on LoongArch support booting
with FDT, so we adds the relevant booting support as well as parameter
parsing.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/Kconfig             |  2 +
 arch/loongarch/include/asm/efi.h   |  1 +
 arch/loongarch/include/asm/setup.h |  1 +
 arch/loongarch/kernel/efi.c        | 27 ++++++++++-
 arch/loongarch/kernel/env.c        |  3 ++
 arch/loongarch/kernel/setup.c      | 75 +++++++++++++++++++++++++++++-
 6 files changed, 106 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 903096bd87f8..ce53d1fa2b64 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -111,6 +111,8 @@ config LOONGARCH
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
diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
index a31329971133..16dcd673e905 100644
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@ -37,7 +37,7 @@ static efi_config_table_type_t arch_tables[] __initdata = {
 
 void __init efi_runtime_init(void)
 {
-	if (!efi_enabled(EFI_BOOT))
+	if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
 		return;
 
 	if (efi_runtime_disabled()) {
@@ -101,3 +101,28 @@ void __init efi_init(void)
 		early_memunmap(tbl, sizeof(*tbl));
 	}
 }
+
+/* parse the fdt pointer from efi system table */
+void __init *efi_fdt_pointer(void)
+{
+	int i;
+	void *fdt = NULL;
+	efi_config_table_t *tables;
+
+	if (!efi_systab) {
+		pr_err("Can't find EFI system table.\n");
+		return NULL;
+	}
+
+	tables = (efi_config_table_t *) efi_systab->tables;
+
+	for (i = 0; i < efi_systab->nr_tables; i++)
+		if (efi_guidcmp(tables[i].guid, DEVICE_TREE_GUID) == 0) {
+			fdt = (void *)early_memremap_ro(
+					(resource_size_t)tables[i].table,
+					sizeof(efi_config_table_t));
+			break;
+		}
+
+	return fdt;
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
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 1eb63fa9bc81..2f578f809a54 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -29,6 +29,9 @@
 #include <linux/device.h>
 #include <linux/dma-map-ops.h>
 #include <linux/swiotlb.h>
+#include <linux/of_fdt.h>
+#include <linux/of_address.h>
+#include <linux/libfdt.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -67,6 +70,7 @@ static const char dmi_empty_string[] = "        ";
  *
  * These are initialized so they are in the .data section
  */
+char original_cmdline[COMMAND_LINE_SIZE] __initdata;
 
 static int num_standard_resources;
 static struct resource *standard_resources;
@@ -281,6 +285,47 @@ static void __init check_kernel_sections_mem(void)
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
+	 * This is for CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER.
+	 *
+	 * If CONFIG_CMDLINE_BOOTLOADER is enabled, we need to determine if the
+	 * system is ACPI-based or FDT-based.
+	 *
+	 * For ACPI-based system: nothing need to do.
+	 *
+	 * For FDT-based system: the boot_command_line will be overwritten by
+	 * early_init_dt_scan_chosen(), so we need to append original_cmdline(the
+	 * original copy of boot_command_line) to boot_command_line.
+	 *
+	 * As for the built-in command line, if CONFIG_CMDLINE_EXTEND is enabled,
+	 * both ACPI-based and FDT-based system will append the built-in command
+	 * line to the boot_command_line themselves, and no additional processing
+	 * is required here.
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
@@ -291,6 +336,8 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	check_kernel_sections_mem();
 
+	early_init_fdt_scan_reserved_mem();
+
 	/*
 	 * In order to reduce the possibility of kernel panic when failed to
 	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to allocate
@@ -413,20 +460,44 @@ static void __init prefill_possible_map(void)
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
+	early_init_dt_scan_chosen_stdout();
+
+	max_low_pfn = PFN_PHYS(memblock_end_of_DRAM());
+#endif
+}
+
 void __init setup_arch(char **cmdline_p)
 {
 	cpu_probe();
-	*cmdline_p = boot_command_line;
 
+	pagetable_init();
 	init_environ();
 	efi_init();
+	fdt_setup();
 	memblock_init();
-	pagetable_init();
+	bootcmdline_init(cmdline_p);
 	parse_early_param();
 	reserve_initrd_mem();
 
 	platform_init();
 	arch_mem_init(cmdline_p);
+	unflatten_and_copy_device_tree();
 
 	resource_init();
 #ifdef CONFIG_SMP
-- 
2.31.1

