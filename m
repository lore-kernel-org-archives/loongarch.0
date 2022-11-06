Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0323A9
	for <loongarch@lists.linux.dev>; Sun,  6 Nov 2022 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1667726138; bh=s2l/rrlZX1WfsQkdx6avz8od87Ml02pafJvSZ/gSMMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a442rPevr901MMtahb5dEVJS4JRgIiX/XAr14ObDZVF+rDYrfDAFfcnOjAo94wcuV
	 4yC76onrlK2g1lqpGGZVzZ3w7yBOitYNBJcNcDARXGTMucJ326+wgvJu8MoLCr5dqM
	 RzazB1N+dJKOe+Z1g2GxYZSROF8Px0kElPEg1q1g=
Received: from [100.100.57.122] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5C0D5600CE;
	Sun,  6 Nov 2022 17:15:38 +0800 (CST)
Message-ID: <ac5f393a-be3c-3cd2-4738-b0537bc6e84e@xen0n.name>
Date: Sun, 6 Nov 2022 17:15:37 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:108.0)
 Gecko/20100101 Thunderbird/108.0a1
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2022/11/6 14:56, Binbin Zhou wrote:
> Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
> flattened DT"), we can parse the FDT from efi system table.
> 
> And now, the Loongson-2K series cpus based on LoongArch support booting
> with FDT, so we adds the relevant booting support as well as parameter
> parsing.

CPU models or even indeed ISA subsets/levels have nothing to do with 
boot protocol support. Theoretically, there's nothing stopping 
Loongson-2 or even Loongson-1 models from enjoying full UEFI support, 
even if Loongson the company decides not to do so. I can't imagine any 
reason for mentioning Loongson-2K aside from company PR which generally 
doesn't belong in commit messages...

> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   arch/loongarch/Kconfig             |  2 +
>   arch/loongarch/include/asm/efi.h   |  1 +
>   arch/loongarch/include/asm/setup.h |  1 +
>   arch/loongarch/kernel/efi.c        | 27 ++++++++++-
>   arch/loongarch/kernel/env.c        |  3 ++
>   arch/loongarch/kernel/setup.c      | 75 +++++++++++++++++++++++++++++-
>   6 files changed, 106 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 903096bd87f8..ce53d1fa2b64 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -111,6 +111,8 @@ config LOONGARCH
>   	select MODULES_USE_ELF_RELA if MODULES
>   	select NEED_PER_CPU_EMBED_FIRST_CHUNK
>   	select NEED_PER_CPU_PAGE_FIRST_CHUNK
> +	select OF
> +	select OF_EARLY_FLATTREE

I agree with Ruoyao that maybe this should not be unconditionally enabled.

You may as well allow the user to select the DT options themselves 
without providing another MACH_xxx config, because the Loongson 2K1000LA 
and 2K0500 are also capable of at least LA64 baseline, thus still 
MACH_LOONGSON64.

>   	select PCI
>   	select PCI_DOMAINS_GENERIC
>   	select PCI_ECAM if ACPI
> diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/asm/efi.h
> index 174567b00ddb..81e5d3371868 100644
> --- a/arch/loongarch/include/asm/efi.h
> +++ b/arch/loongarch/include/asm/efi.h
> @@ -9,6 +9,7 @@
>   
>   void __init efi_init(void);
>   void __init efi_runtime_init(void);
> +void __init *efi_fdt_pointer(void);
>   void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
>   
>   #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE */
> diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
> index ca373f8e3c4d..b18baf878ed4 100644
> --- a/arch/loongarch/include/asm/setup.h
> +++ b/arch/loongarch/include/asm/setup.h
> @@ -13,6 +13,7 @@
>   
>   extern unsigned long eentry;
>   extern unsigned long tlbrentry;
> +extern char original_cmdline[COMMAND_LINE_SIZE];
>   extern void tlb_init(int cpu);
>   extern void cpu_cache_init(void);
>   extern void cache_error_setup(void);
> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
> index a31329971133..16dcd673e905 100644
> --- a/arch/loongarch/kernel/efi.c
> +++ b/arch/loongarch/kernel/efi.c
> @@ -37,7 +37,7 @@ static efi_config_table_type_t arch_tables[] __initdata = {
>   
>   void __init efi_runtime_init(void)
>   {
> -	if (!efi_enabled(EFI_BOOT))
> +	if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
>   		return;
>   
>   	if (efi_runtime_disabled()) {
> @@ -101,3 +101,28 @@ void __init efi_init(void)
>   		early_memunmap(tbl, sizeof(*tbl));
>   	}
>   }
> +
> +/* parse the fdt pointer from efi system table */
> +void __init *efi_fdt_pointer(void)
> +{
> +	int i;
> +	void *fdt = NULL;
> +	efi_config_table_t *tables;
> +
> +	if (!efi_systab) {
> +		pr_err("Can't find EFI system table.\n");
> +		return NULL;
> +	}
> +
> +	tables = (efi_config_table_t *) efi_systab->tables;
> +
> +	for (i = 0; i < efi_systab->nr_tables; i++)
> +		if (efi_guidcmp(tables[i].guid, DEVICE_TREE_GUID) == 0) {
> +			fdt = (void *)early_memremap_ro(
> +					(resource_size_t)tables[i].table,
> +					sizeof(efi_config_table_t));
> +			break;
> +		}
> +
> +	return fdt;
> +}
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 6d56a463b091..4fd6eb9398b4 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -11,6 +11,7 @@
>   #include <asm/early_ioremap.h>
>   #include <asm/bootinfo.h>
>   #include <asm/loongson.h>
> +#include <asm/setup.h>
>   
>   u64 efi_system_table;
>   struct loongson_system_configuration loongson_sysconf;
> @@ -27,6 +28,8 @@ void __init init_environ(void)
>   		clear_bit(EFI_BOOT, &efi.flags);
>   
>   	strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
> +	/* Save unparsed command line copy for FDT */
> +	strscpy(original_cmdline, boot_command_line, COMMAND_LINE_SIZE);
>   	early_memunmap(cmdline, COMMAND_LINE_SIZE);
>   
>   	efi_system_table = fw_arg2;
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index 1eb63fa9bc81..2f578f809a54 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -29,6 +29,9 @@
>   #include <linux/device.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/swiotlb.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_address.h>
> +#include <linux/libfdt.h>
>   
>   #include <asm/addrspace.h>
>   #include <asm/bootinfo.h>
> @@ -67,6 +70,7 @@ static const char dmi_empty_string[] = "        ";
>    *
>    * These are initialized so they are in the .data section
>    */
> +char original_cmdline[COMMAND_LINE_SIZE] __initdata;
>   
>   static int num_standard_resources;
>   static struct resource *standard_resources;
> @@ -281,6 +285,47 @@ static void __init check_kernel_sections_mem(void)
>   	}
>   }
>   
> +static void __init bootcmdline_init(char **cmdline_p)
> +{
> +	/*
> +	 * If CONFIG_CMDLINE_FORCE is enabled then initializing the command line
> +	 * is trivial - we simply use the built-in command line unconditionally &
> +	 * unmodified.
> +	 */
> +	if (IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
> +		strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +		return;
> +	}
> +
> +#ifdef CONFIG_OF_FLATTREE
> +	/*
> +	 * This is for CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER.

Why mention CONFIG_CMDLINE_EXTEND and CONFIG_CMDLINE_BOOTLOADER if 
you're guarding the block with CONFIG_OF_FLATTREE?

> +	 *
> +	 * If CONFIG_CMDLINE_BOOTLOADER is enabled, we need to determine if the
> +	 * system is ACPI-based or FDT-based.
> +	 *
> +	 * For ACPI-based system: nothing need to do.

nit: "nothing to do".

> +	 *
> +	 * For FDT-based system: the boot_command_line will be overwritten by
> +	 * early_init_dt_scan_chosen(), so we need to append original_cmdline(the
> +	 * original copy of boot_command_line) to boot_command_line.
> +	 *
> +	 * As for the built-in command line, if CONFIG_CMDLINE_EXTEND is enabled,
> +	 * both ACPI-based and FDT-based system will append the built-in command
> +	 * line to the boot_command_line themselves, and no additional processing
> +	 * is required here.
> +	 */
> +	if (initial_boot_params) {
> +		if (boot_command_line[0])
> +			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> +
> +		strlcat(boot_command_line, original_cmdline, COMMAND_LINE_SIZE);
> +	}
> +#endif
> +
> +	*cmdline_p = boot_command_line;
> +}
> +
>   /*
>    * arch_mem_init - initialize memory management subsystem
>    */
> @@ -291,6 +336,8 @@ static void __init arch_mem_init(char **cmdline_p)
>   
>   	check_kernel_sections_mem();
>   
> +	early_init_fdt_scan_reserved_mem();
> +
>   	/*
>   	 * In order to reduce the possibility of kernel panic when failed to
>   	 * get IO TLB memory under CONFIG_SWIOTLB, it is better to allocate
> @@ -413,20 +460,44 @@ static void __init prefill_possible_map(void)
>   }
>   #endif
>   
> +static void __init fdt_setup(void)
> +{
> +#ifdef CONFIG_OF_EARLY_FLATTREE
> +	void *fdt_pointer;
> +
> +	/* ACPI-based systems do not require parsing fdt */
> +	if (acpi_os_get_root_pointer())
> +		return;
> +
> +	/* Look for a device tree configuration table entry */
> +	fdt_pointer = efi_fdt_pointer();
> +	if (!fdt_pointer || fdt_check_header(fdt_pointer))
> +		return;
> +
> +	early_init_dt_scan(fdt_pointer);
> +	early_init_fdt_reserve_self();
> +	early_init_dt_scan_chosen_stdout();
> +
> +	max_low_pfn = PFN_PHYS(memblock_end_of_DRAM());
> +#endif
> +}
> +
>   void __init setup_arch(char **cmdline_p)
>   {
>   	cpu_probe();
> -	*cmdline_p = boot_command_line;
>   
> +	pagetable_init();
>   	init_environ();
>   	efi_init();
> +	fdt_setup();
>   	memblock_init();
> -	pagetable_init();
> +	bootcmdline_init(cmdline_p);
>   	parse_early_param();
>   	reserve_initrd_mem();
>   
>   	platform_init();
>   	arch_mem_init(cmdline_p);
> +	unflatten_and_copy_device_tree();
>   
>   	resource_init();
>   #ifdef CONFIG_SMP

I haven't reviewed as throughly as I'd like to though, and this is in 
part because I can't test the changes at all without an open-source 
LoongArch DT firmware available for QEMU. (Hint hint)

And, although we're already aware of the part-UEFI and part-FDT usage 
pattern, and the arch UEFI code already has consideration for such, it 
still makes me a bit wary because you risk losing standards compliance 
and creating maintenance burden for admins/users/devs alike by relying 
on this not-really-UEFI-but-advertising-as-such thing. I'd still suggest 
you try throwing together something fully DT, to at least experiment a 
little with. You already have to rewrite pretty much everything with all 
the boot protocol changes in the past few months, so this would probably 
not even hurt, and the burden on the LoongArch/generic UEFI infra could 
be lessened even further if this plays out. And you can always continue 
working on this change if it turns out infeasible to do so.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

