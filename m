Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B317ED
	for <loongarch@lists.linux.dev>; Tue,  8 Nov 2022 01:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F88EC433D7
	for <loongarch@lists.linux.dev>; Tue,  8 Nov 2022 01:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667870187;
	bh=6af0qkxHzuZDMLXIVEMAOom72KqbQdlyKG8YHpaI6Zo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HtcriQudeNCKcKHCvm1w5/5RHPRTXVw7H7HuR9+YQ1k1xTh+OIPiMz1ygPFBEScBD
	 Sger3PBw4b7OOiodEbEAV22Q9vxWXt4Zm2xWuzsu2xqIPYVNXibqSjFzH+tnpP8eL1
	 ws4rGztS0SB7FbznX+I5dx4c6vJdTpQT7BMsn/984iSlPbXlmeR6cPorq0fOiv3sJr
	 ITSKyrcWbccicUXAFOgtnx8OjqYxcTZlP0YoJi4jsRYUG6SbFkKybgurRgpTp+nN1U
	 /SuqtqUXJ1GU5YGMKpFOCJ0Ub6pMVwJWbfCCBy5qiIv7XTa8J4tOK/c1TmhxSjeSr4
	 0+XTMMfHfRukA==
Received: by mail-ed1-f48.google.com with SMTP id 21so20315902edv.3
        for <loongarch@lists.linux.dev>; Mon, 07 Nov 2022 17:16:26 -0800 (PST)
X-Gm-Message-State: ACrzQf3DWew2Qtd1/BVEciPJI08V40SoNB7M7weJQEhgfWHfcQ/Ey4Hs
	ntSdQO5a18X9xUSQHcrH3TZPPamVBBLwnX2LF6U=
X-Google-Smtp-Source: AMsMyM7RFHyrnj9EmnVIa3H6txm03Bhmme/Egaznw0INoaUk76SBH1seIumGScyzR246/7THKy98Ki5McSTLQd3ftuk=
X-Received: by 2002:a05:6402:2937:b0:461:32aa:32da with SMTP id
 ee55-20020a056402293700b0046132aa32damr51797550edb.78.1667870185207; Mon, 07
 Nov 2022 17:16:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
 <CAMj1kXG3sJTPzWYx1hKaBeXPgD0xQXW-4NxgwZjWpQ-nGw=MhA@mail.gmail.com>
 <CAAhV-H7k2iq899t=JCGGuUTUZuwVyg3OJ+7vHfkGu1xHLV=s+g@mail.gmail.com> <CAMj1kXHdM2e2DTUiohzt5syHAj2xVsFYz5oyi-uv7B7vVp0gCQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHdM2e2DTUiohzt5syHAj2xVsFYz5oyi-uv7B7vVp0gCQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 8 Nov 2022 09:16:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4vfVEWEniHYcJVOh8=kiEwBViKdQqDBt6NaeUAZPZEaA@mail.gmail.com>
Message-ID: <CAAhV-H4vfVEWEniHYcJVOh8=kiEwBViKdQqDBt6NaeUAZPZEaA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 7, 2022 at 9:33 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 7 Nov 2022 at 05:24, Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > Hi, Ard,
> >
> > On Sun, Nov 6, 2022 at 11:06 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Sun, 6 Nov 2022 at 07:58, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
> > > >
> > > > Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
> > > > flattened DT"), we can parse the FDT from efi system table.
> > > >
> > > > And now, the Loongson-2K series cpus based on LoongArch support booting
> > > > with FDT, so we adds the relevant booting support as well as parameter
> > > > parsing.
> > > >
> > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > ---
> > > >  arch/loongarch/Kconfig             |  2 +
> > > >  arch/loongarch/include/asm/efi.h   |  1 +
> > > >  arch/loongarch/include/asm/setup.h |  1 +
> > > >  arch/loongarch/kernel/efi.c        | 27 ++++++++++-
> > > >  arch/loongarch/kernel/env.c        |  3 ++
> > > >  arch/loongarch/kernel/setup.c      | 75 +++++++++++++++++++++++++++++-
> > > >  6 files changed, 106 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > > index 903096bd87f8..ce53d1fa2b64 100644
> > > > --- a/arch/loongarch/Kconfig
> > > > +++ b/arch/loongarch/Kconfig
> > > > @@ -111,6 +111,8 @@ config LOONGARCH
> > > >         select MODULES_USE_ELF_RELA if MODULES
> > > >         select NEED_PER_CPU_EMBED_FIRST_CHUNK
> > > >         select NEED_PER_CPU_PAGE_FIRST_CHUNK
> > > > +       select OF
> > > > +       select OF_EARLY_FLATTREE
> > > >         select PCI
> > > >         select PCI_DOMAINS_GENERIC
> > > >         select PCI_ECAM if ACPI
> > > > diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/asm/efi.h
> > > > index 174567b00ddb..81e5d3371868 100644
> > > > --- a/arch/loongarch/include/asm/efi.h
> > > > +++ b/arch/loongarch/include/asm/efi.h
> > > > @@ -9,6 +9,7 @@
> > > >
> > > >  void __init efi_init(void);
> > > >  void __init efi_runtime_init(void);
> > > > +void __init *efi_fdt_pointer(void);
> > > >  void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
> > > >
> > > >  #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE */
> > > > diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
> > > > index ca373f8e3c4d..b18baf878ed4 100644
> > > > --- a/arch/loongarch/include/asm/setup.h
> > > > +++ b/arch/loongarch/include/asm/setup.h
> > > > @@ -13,6 +13,7 @@
> > > >
> > > >  extern unsigned long eentry;
> > > >  extern unsigned long tlbrentry;
> > > > +extern char original_cmdline[COMMAND_LINE_SIZE];
> > > >  extern void tlb_init(int cpu);
> > > >  extern void cpu_cache_init(void);
> > > >  extern void cache_error_setup(void);
> > > > diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
> > > > index a31329971133..16dcd673e905 100644
> > > > --- a/arch/loongarch/kernel/efi.c
> > > > +++ b/arch/loongarch/kernel/efi.c
> > > > @@ -37,7 +37,7 @@ static efi_config_table_type_t arch_tables[] __initdata = {
> > > >
> > > >  void __init efi_runtime_init(void)
> > > >  {
> > > > -       if (!efi_enabled(EFI_BOOT))
> > > > +       if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
> > >
> > > How can this happen? Why would we ever set EFI_BOOT if
> > > efi_systab->runtime == NULL?
> > >
> > > >                 return;
> > > >
> > > >         if (efi_runtime_disabled()) {
> > > > @@ -101,3 +101,28 @@ void __init efi_init(void)
> > > >                 early_memunmap(tbl, sizeof(*tbl));
> > > >         }
> > > >  }
> > > > +
> > > > +/* parse the fdt pointer from efi system table */
> > > > +void __init *efi_fdt_pointer(void)
> > > > +{
> > > > +       int i;
> > > > +       void *fdt = NULL;
> > > > +       efi_config_table_t *tables;
> > > > +
> > > > +       if (!efi_systab) {
> > > > +               pr_err("Can't find EFI system table.\n");
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > > +       tables = (efi_config_table_t *) efi_systab->tables;
> > > > +
> > > > +       for (i = 0; i < efi_systab->nr_tables; i++)
> > > > +               if (efi_guidcmp(tables[i].guid, DEVICE_TREE_GUID) == 0) {
> > > > +                       fdt = (void *)early_memremap_ro(
> > > > +                                       (resource_size_t)tables[i].table,
> > > > +                                       sizeof(efi_config_table_t));
> > > > +                       break;
> > > > +               }
> > > > +
> > > > +       return fdt;
> > > > +}
> > >
> > > Please use the existing config table discovery mechanism for this.
> > >
> > > > diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> > > > index 6d56a463b091..4fd6eb9398b4 100644
> > > > --- a/arch/loongarch/kernel/env.c
> > > > +++ b/arch/loongarch/kernel/env.c
> > > > @@ -11,6 +11,7 @@
> > > >  #include <asm/early_ioremap.h>
> > > >  #include <asm/bootinfo.h>
> > > >  #include <asm/loongson.h>
> > > > +#include <asm/setup.h>
> > > >
> > > >  u64 efi_system_table;
> > > >  struct loongson_system_configuration loongson_sysconf;
> > > > @@ -27,6 +28,8 @@ void __init init_environ(void)
> > > >                 clear_bit(EFI_BOOT, &efi.flags);
> > > >
> > > >         strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
> > > > +       /* Save unparsed command line copy for FDT */
> > >
> > > Why is this necessary?
> > >
> > > > +       strscpy(original_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> > > >         early_memunmap(cmdline, COMMAND_LINE_SIZE);
> > > >
> > > >         efi_system_table = fw_arg2;
> > > > diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> > > > index 1eb63fa9bc81..2f578f809a54 100644
> > > > --- a/arch/loongarch/kernel/setup.c
> > > > +++ b/arch/loongarch/kernel/setup.c
> > > > @@ -29,6 +29,9 @@
> > > >  #include <linux/device.h>
> > > >  #include <linux/dma-map-ops.h>
> > > >  #include <linux/swiotlb.h>
> > > > +#include <linux/of_fdt.h>
> > > > +#include <linux/of_address.h>
> > > > +#include <linux/libfdt.h>
> > > >
> > > >  #include <asm/addrspace.h>
> > > >  #include <asm/bootinfo.h>
> > > > @@ -67,6 +70,7 @@ static const char dmi_empty_string[] = "        ";
> > > >   *
> > > >   * These are initialized so they are in the .data section
> > > >   */
> > > > +char original_cmdline[COMMAND_LINE_SIZE] __initdata;
> > > >
> > > >  static int num_standard_resources;
> > > >  static struct resource *standard_resources;
> > > > @@ -281,6 +285,47 @@ static void __init check_kernel_sections_mem(void)
> > > >         }
> > > >  }
> > > >
> > > > +static void __init bootcmdline_init(char **cmdline_p)
> > > > +{
> > > > +       /*
> > > > +        * If CONFIG_CMDLINE_FORCE is enabled then initializing the command line
> > > > +        * is trivial - we simply use the built-in command line unconditionally &
> > > > +        * unmodified.
> > > > +        */
> > > > +       if (IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
> > > > +               strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> > > > +               return;
> > > > +       }
> > > > +
> > > > +#ifdef CONFIG_OF_FLATTREE
> > > > +       /*
> > > > +        * This is for CONFIG_CMDLINE_EXTEND or CONFIG_CMDLINE_BOOTLOADER.
> > > > +        *
> > > > +        * If CONFIG_CMDLINE_BOOTLOADER is enabled, we need to determine if the
> > > > +        * system is ACPI-based or FDT-based.
> > > > +        *
> > > > +        * For ACPI-based system: nothing need to do.
> > > > +        *
> > > > +        * For FDT-based system: the boot_command_line will be overwritten by
> > > > +        * early_init_dt_scan_chosen(), so we need to append original_cmdline(the
> > > > +        * original copy of boot_command_line) to boot_command_line.
> > > > +        *
> > > > +        * As for the built-in command line, if CONFIG_CMDLINE_EXTEND is enabled,
> > > > +        * both ACPI-based and FDT-based system will append the built-in command
> > > > +        * line to the boot_command_line themselves, and no additional processing
> > > > +        * is required here.
> > > > +        */
> > > > +       if (initial_boot_params) {
> > > > +               if (boot_command_line[0])
> > > > +                       strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> > > > +
> > > > +               strlcat(boot_command_line, original_cmdline, COMMAND_LINE_SIZE);
> > > > +       }
> > > > +#endif
> > > > +
> > > > +       *cmdline_p = boot_command_line;
> > > > +}
> > > > +
> > > >  /*
> > > >   * arch_mem_init - initialize memory management subsystem
> > > >   */
> > > > @@ -291,6 +336,8 @@ static void __init arch_mem_init(char **cmdline_p)
> > > >
> > > >         check_kernel_sections_mem();
> > > >
> > > > +       early_init_fdt_scan_reserved_mem();
> > > > +
> > > >         /*
> > > >          * In order to reduce the possibility of kernel panic when failed to
> > > >          * get IO TLB memory under CONFIG_SWIOTLB, it is better to allocate
> > > > @@ -413,20 +460,44 @@ static void __init prefill_possible_map(void)
> > > >  }
> > > >  #endif
> > > >
> > > > +static void __init fdt_setup(void)
> > > > +{
> > > > +#ifdef CONFIG_OF_EARLY_FLATTREE
> > > > +       void *fdt_pointer;
> > > > +
> > > > +       /* ACPI-based systems do not require parsing fdt */
> > > > +       if (acpi_os_get_root_pointer())
> > > > +               return;
> > > > +
> > > > +       /* Look for a device tree configuration table entry */
> > > > +       fdt_pointer = efi_fdt_pointer();
> > > > +       if (!fdt_pointer || fdt_check_header(fdt_pointer))
> > > > +               return;
> > > > +
> > > > +       early_init_dt_scan(fdt_pointer);
> > > > +       early_init_fdt_reserve_self();
> > > > +       early_init_dt_scan_chosen_stdout();
> > > > +
> > >
> > > The FDT is only a hardware description, right? So why are we scanning
> > > /chosen here?
> > We scan the chosen node here in order to configure earlycon as early
> > as possible, this is very useful for debugging. ARM64 does similar
> > things in acpi_boot_table_init(), but I think fdt_setup() is more
> > suitable.
> >
>
> Do you mean for the /chosen/stdout-path node?
Yes.
