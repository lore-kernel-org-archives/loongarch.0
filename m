Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8B03209
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 13:07:06 +0000 (UTC)
Received: from loongson.cn (unknown [223.106.24.7])
	by gateway (Coremail) with SMTP id _____8AxHLbvAmljnAoFAA--.4671S3;
	Mon, 07 Nov 2022 21:06:55 +0800 (CST)
Received: from [192.168.100.112] (unknown [223.106.24.7])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxbuDuAmljh3UOAA--.40123S3;
	Mon, 07 Nov 2022 21:06:55 +0800 (CST)
Message-ID: <03a8420c-068f-775c-8bef-9893b4ebf37b@loongson.cn>
Date: Mon, 7 Nov 2022 21:06:54 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 loongarch@lists.linux.dev
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
 <CAMj1kXG3sJTPzWYx1hKaBeXPgD0xQXW-4NxgwZjWpQ-nGw=MhA@mail.gmail.com>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <CAMj1kXG3sJTPzWYx1hKaBeXPgD0xQXW-4NxgwZjWpQ-nGw=MhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxbuDuAmljh3UOAA--.40123S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WFyrZFykWr4DtF15Gr18uFg_yoWfWw4Upr
	yDAFs8GF4rGF97JrWSqas5uFn8Xws3Kw1293W7Ka4UJFnFvrn7GrsYgr9I9Fyvva1kCF10
	vFWFg3ZF9F45t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jnUUUUUUUU=



在 2022/11/6 23:06, Ard Biesheuvel 写道:
> On Sun, 6 Nov 2022 at 07:58, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>>
>> Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
>> flattened DT"), we can parse the FDT from efi system table.
>>
>> And now, the Loongson-2K series cpus based on LoongArch support booting
>> with FDT, so we adds the relevant booting support as well as parameter
>> parsing.
>>
>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>> ---
>>   arch/loongarch/Kconfig             |  2 +
>>   arch/loongarch/include/asm/efi.h   |  1 +
>>   arch/loongarch/include/asm/setup.h |  1 +
>>   arch/loongarch/kernel/efi.c        | 27 ++++++++++-
>>   arch/loongarch/kernel/env.c        |  3 ++
>>   arch/loongarch/kernel/setup.c      | 75 +++++++++++++++++++++++++++++-
>>   6 files changed, 106 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 903096bd87f8..ce53d1fa2b64 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -111,6 +111,8 @@ config LOONGARCH
>>          select MODULES_USE_ELF_RELA if MODULES
>>          select NEED_PER_CPU_EMBED_FIRST_CHUNK
>>          select NEED_PER_CPU_PAGE_FIRST_CHUNK
>> +       select OF
>> +       select OF_EARLY_FLATTREE
>>          select PCI
>>          select PCI_DOMAINS_GENERIC
>>          select PCI_ECAM if ACPI
>> diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/asm/efi.h
>> index 174567b00ddb..81e5d3371868 100644
>> --- a/arch/loongarch/include/asm/efi.h
>> +++ b/arch/loongarch/include/asm/efi.h
>> @@ -9,6 +9,7 @@
>>
>>   void __init efi_init(void);
>>   void __init efi_runtime_init(void);
>> +void __init *efi_fdt_pointer(void);
>>   void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
>>
>>   #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE */
>> diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
>> index ca373f8e3c4d..b18baf878ed4 100644
>> --- a/arch/loongarch/include/asm/setup.h
>> +++ b/arch/loongarch/include/asm/setup.h
>> @@ -13,6 +13,7 @@
>>
>>   extern unsigned long eentry;
>>   extern unsigned long tlbrentry;
>> +extern char original_cmdline[COMMAND_LINE_SIZE];
>>   extern void tlb_init(int cpu);
>>   extern void cpu_cache_init(void);
>>   extern void cache_error_setup(void);
>> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
>> index a31329971133..16dcd673e905 100644
>> --- a/arch/loongarch/kernel/efi.c
>> +++ b/arch/loongarch/kernel/efi.c
>> @@ -37,7 +37,7 @@ static efi_config_table_type_t arch_tables[] __initdata = {
>>
>>   void __init efi_runtime_init(void)
>>   {
>> -       if (!efi_enabled(EFI_BOOT))
>> +       if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
> 
> How can this happen? Why would we ever set EFI_BOOT if
> efi_systab->runtime == NULL?
> 
>>                  return;
>>
>>          if (efi_runtime_disabled()) {
>> @@ -101,3 +101,28 @@ void __init efi_init(void)
>>                  early_memunmap(tbl, sizeof(*tbl));
>>          }
>>   }
>> +
>> +/* parse the fdt pointer from efi system table */
>> +void __init *efi_fdt_pointer(void)
>> +{
>> +       int i;
>> +       void *fdt = NULL;
>> +       efi_config_table_t *tables;
>> +
>> +       if (!efi_systab) {
>> +               pr_err("Can't find EFI system table.\n");
>> +               return NULL;
>> +       }
>> +
>> +       tables = (efi_config_table_t *) efi_systab->tables;
>> +
>> +       for (i = 0; i < efi_systab->nr_tables; i++)
>> +               if (efi_guidcmp(tables[i].guid, DEVICE_TREE_GUID) == 0) {
>> +                       fdt = (void *)early_memremap_ro(
>> +                                       (resource_size_t)tables[i].table,
>> +                                       sizeof(efi_config_table_t));
>> +                       break;
>> +               }
>> +
>> +       return fdt;
>> +}
> 
Hi Ard:

> Please use the existing config table discovery mechanism for this.

Sorry, Regarding the mechanism related to config table discovery you 
mentioned, I only found the get_fdt() or get_efi_config_table() 
interfaces in driver/firmware/efi/libstub. Unfortunately, both of them 
cannot be referenced in our case.

So which mechanism are you referring to specifically?

Thanks.

Binbin

> 
>> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
>> index 6d56a463b091..4fd6eb9398b4 100644
>> --- a/arch/loongarch/kernel/env.c
>> +++ b/arch/loongarch/kernel/env.c
>> @@ -11,6 +11,7 @@
>>   #include <asm/early_ioremap.h>
>>   #include <asm/bootinfo.h>
>>   #include <asm/loongson.h>
>> +#include <asm/setup.h>
>>
>>   u64 efi_system_table;
>>   struct loongson_system_configuration loongson_sysconf;
>> @@ -27,6 +28,8 @@ void __init init_environ(void)
>>                  clear_bit(EFI_BOOT, &efi.flags);
>>
>>          strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
>> +       /* Save unparsed command line copy for FDT */
> 
> Why is this necessary?
> 
>> +       strscpy(original_cmdline, boot_command_line, COMMAND_LINE_SIZE);
>>          early_memunmap(cmdline, COMMAND_LINE_SIZE);
>>
>>          efi_system_table = fw_arg2;
>> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
>> index 1eb63fa9bc81..2f578f809a54 100644
>> --- a/arch/loongarch/kernel/setup.c
>> +++ b/arch/loongarch/kernel/setup.c
>> @@ -29,6 +29,9 @@
>>   #include <linux/device.h>
>>   #include <linux/dma-map-ops.h>
>>   #include <linux/swiotlb.h>
>> +#include <linux/of_fdt.h>
>> +#include <linux/of_address.h>
>> +#include <linux/libfdt.h>
>>
>>   #include <asm/addrspace.h>
>>   #include <asm/bootinfo.h>
>> @@ -67,6 +70,7 @@ static const char dmi_empty_string[] = "        ";
>>    *
>>    * These are initialized so they are in the .data section
>>    */
>> +char original_cmdline[COMMAND_LINE_SIZE] __initdata;
>>
>>   static int num_standard_resources;
>>   static struct resource *standard_resources;
>> @@ -281,6 +285,47 @@ static void __init check_kernel_sections_mem(void)
>>          }
>>   }
>>
>> +static void __init bootcmdline_init(char **cmdline_p)
>> +{
>> +       /*
>> +        * If CONFIG_CMDLINE_FORCE is enabled then initializing the command line
>> +        * is trivial - we simply use the built-in command line unconditionally &
>> +        * unmodified.
>> +        */
>> +       if (IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
>> +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>> +               return;
>> +       }
>> +
>> +#ifdef CONFIG_OF_FLATTREE
>> +       /*
>> +        * This is for CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER.
>> +        *
>> +        * If CONFIG_CMDLINE_BOOTLOADER is enabled, we need to determine if the
>> +        * system is ACPI-based or FDT-based.
>> +        *
>> +        * For ACPI-based system: nothing need to do.
>> +        *
>> +        * For FDT-based system: the boot_command_line will be overwritten by
>> +        * early_init_dt_scan_chosen(), so we need to append original_cmdline(the
>> +        * original copy of boot_command_line) to boot_command_line.
>> +        *
>> +        * As for the built-in command line, if CONFIG_CMDLINE_EXTEND is enabled,
>> +        * both ACPI-based and FDT-based system will append the built-in command
>> +        * line to the boot_command_line themselves, and no additional processing
>> +        * is required here.
>> +        */
>> +       if (initial_boot_params) {
>> +               if (boot_command_line[0])
>> +                       strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
>> +
>> +               strlcat(boot_command_line, original_cmdline, COMMAND_LINE_SIZE);
>> +       }
>> +#endif
>> +
>> +       *cmdline_p = boot_command_line;
>> +}
>> +
>>   /*
>>    * arch_mem_init - initialize memory management subsystem
>>    */
>> @@ -291,6 +336,8 @@ static void __init arch_mem_init(char **cmdline_p)
>>
>>          check_kernel_sections_mem();
>>
>> +       early_init_fdt_scan_reserved_mem();
>> +
>>          /*
>>           * In order to reduce the possibility of kernel panic when failed to
>>           * get IO TLB memory under CONFIG_SWIOTLB, it is better to allocate
>> @@ -413,20 +460,44 @@ static void __init prefill_possible_map(void)
>>   }
>>   #endif
>>
>> +static void __init fdt_setup(void)
>> +{
>> +#ifdef CONFIG_OF_EARLY_FLATTREE
>> +       void *fdt_pointer;
>> +
>> +       /* ACPI-based systems do not require parsing fdt */
>> +       if (acpi_os_get_root_pointer())
>> +               return;
>> +
>> +       /* Look for a device tree configuration table entry */
>> +       fdt_pointer = efi_fdt_pointer();
>> +       if (!fdt_pointer || fdt_check_header(fdt_pointer))
>> +               return;
>> +
>> +       early_init_dt_scan(fdt_pointer);
>> +       early_init_fdt_reserve_self();
>> +       early_init_dt_scan_chosen_stdout();
>> +
> 
> The FDT is only a hardware description, right? So why are we scanning
> /chosen here?
> 
>> +       max_low_pfn = PFN_PHYS(memblock_end_of_DRAM());
>> +#endif
>> +}
>> +
>>   void __init setup_arch(char **cmdline_p)
>>   {
>>          cpu_probe();
>> -       *cmdline_p = boot_command_line;
>>
>> +       pagetable_init();
>>          init_environ();
>>          efi_init();
>> +       fdt_setup();
>>          memblock_init();
>> -       pagetable_init();
>> +       bootcmdline_init(cmdline_p);
>>          parse_early_param();
>>          reserve_initrd_mem();
>>
>>          platform_init();
>>          arch_mem_init(cmdline_p);
>> +       unflatten_and_copy_device_tree();
>>
>>          resource_init();
>>   #ifdef CONFIG_SMP
>> --
>> 2.31.1
>>

