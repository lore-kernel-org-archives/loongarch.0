Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84066BA41
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 13:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF38C43144
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 13:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667827454;
	bh=RBn2ETTgPZGRldSq0G6TrRJAZWvtSG0CTA8cq3P+wNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RjHQtpZ7qBlan35CDluL1AikN5i60B4HSmHpTvz3ZTUGWqe0nHndiKHGAQEPs88lJ
	 6c5fTteGxhv7WJGt/vZwncST9nHQNSu7GeRmI2j5+SVvksX7Ga/BPwjY+cejVU8l2D
	 8JCXZd4uCblgGbCHMxAlpcq3abfJPIdLdSoOilt9hvyYtxzpvXGQzGH4lRAZsFP+fJ
	 UVv3HoC98d8WxbN6UsbIJ8+0IpHdTcr7qw76vk22RmJBz4+m0ngcUvaXk8Py3+ahI8
	 vDuMn4tfENpR+9VObceV6WQepq611qlJNZRBNBfIpGsYLqOl8Fe6ROxSqTAWGr6yhr
	 I3Xujt+f/pZ5w==
Received: by mail-lj1-f171.google.com with SMTP id u2so16243218ljl.3
        for <loongarch@lists.linux.dev>; Mon, 07 Nov 2022 05:24:14 -0800 (PST)
X-Gm-Message-State: ACrzQf3MFRqIOoQOBEGWI9jYCM3lCFWAo8oC3jRJxdw1cn4nDTC2z5KJ
	IAkCuD7Lau42nxmV6yg2RofGVnln4+uDSBPTisE=
X-Google-Smtp-Source: AMsMyM4nH/0K6ees45WdOMjMCKgSz8DhfSnULJD746ZNL7rOdfkzqo4li/aasQyw36uBobazomnAfFu4LflZrb/EYMk=
X-Received: by 2002:a2e:87cd:0:b0:277:3662:3be4 with SMTP id
 v13-20020a2e87cd000000b0027736623be4mr16967130ljj.415.1667827452211; Mon, 07
 Nov 2022 05:24:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
 <CAMj1kXG3sJTPzWYx1hKaBeXPgD0xQXW-4NxgwZjWpQ-nGw=MhA@mail.gmail.com> <03a8420c-068f-775c-8bef-9893b4ebf37b@loongson.cn>
In-Reply-To: <03a8420c-068f-775c-8bef-9893b4ebf37b@loongson.cn>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 7 Nov 2022 14:24:00 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG6XCFpJHZmXjqmWoVY2GPmrTZG2hEeD2LtUsCeQEVfbw@mail.gmail.com>
Message-ID: <CAMj1kXG6XCFpJHZmXjqmWoVY2GPmrTZG2hEeD2LtUsCeQEVfbw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Nov 2022 at 14:07, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
>
>
> =E5=9C=A8 2022/11/6 23:06, Ard Biesheuvel =E5=86=99=E9=81=93:
> > On Sun, 6 Nov 2022 at 07:58, Binbin Zhou <zhoubinbin@loongson.cn> wrote=
:
> >>
> >> Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency o=
n
> >> flattened DT"), we can parse the FDT from efi system table.
> >>
> >> And now, the Loongson-2K series cpus based on LoongArch support bootin=
g
> >> with FDT, so we adds the relevant booting support as well as parameter
> >> parsing.
> >>
> >> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >> ---
> >>   arch/loongarch/Kconfig             |  2 +
> >>   arch/loongarch/include/asm/efi.h   |  1 +
> >>   arch/loongarch/include/asm/setup.h |  1 +
> >>   arch/loongarch/kernel/efi.c        | 27 ++++++++++-
> >>   arch/loongarch/kernel/env.c        |  3 ++
> >>   arch/loongarch/kernel/setup.c      | 75 ++++++++++++++++++++++++++++=
+-
> >>   6 files changed, 106 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >> index 903096bd87f8..ce53d1fa2b64 100644
> >> --- a/arch/loongarch/Kconfig
> >> +++ b/arch/loongarch/Kconfig
> >> @@ -111,6 +111,8 @@ config LOONGARCH
> >>          select MODULES_USE_ELF_RELA if MODULES
> >>          select NEED_PER_CPU_EMBED_FIRST_CHUNK
> >>          select NEED_PER_CPU_PAGE_FIRST_CHUNK
> >> +       select OF
> >> +       select OF_EARLY_FLATTREE
> >>          select PCI
> >>          select PCI_DOMAINS_GENERIC
> >>          select PCI_ECAM if ACPI
> >> diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include=
/asm/efi.h
> >> index 174567b00ddb..81e5d3371868 100644
> >> --- a/arch/loongarch/include/asm/efi.h
> >> +++ b/arch/loongarch/include/asm/efi.h
> >> @@ -9,6 +9,7 @@
> >>
> >>   void __init efi_init(void);
> >>   void __init efi_runtime_init(void);
> >> +void __init *efi_fdt_pointer(void);
> >>   void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
> >>
> >>   #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE *=
/
> >> diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/inclu=
de/asm/setup.h
> >> index ca373f8e3c4d..b18baf878ed4 100644
> >> --- a/arch/loongarch/include/asm/setup.h
> >> +++ b/arch/loongarch/include/asm/setup.h
> >> @@ -13,6 +13,7 @@
> >>
> >>   extern unsigned long eentry;
> >>   extern unsigned long tlbrentry;
> >> +extern char original_cmdline[COMMAND_LINE_SIZE];
> >>   extern void tlb_init(int cpu);
> >>   extern void cpu_cache_init(void);
> >>   extern void cache_error_setup(void);
> >> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
> >> index a31329971133..16dcd673e905 100644
> >> --- a/arch/loongarch/kernel/efi.c
> >> +++ b/arch/loongarch/kernel/efi.c
> >> @@ -37,7 +37,7 @@ static efi_config_table_type_t arch_tables[] __initd=
ata =3D {
> >>
> >>   void __init efi_runtime_init(void)
> >>   {
> >> -       if (!efi_enabled(EFI_BOOT))
> >> +       if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
> >
> > How can this happen? Why would we ever set EFI_BOOT if
> > efi_systab->runtime =3D=3D NULL?
> >
> >>                  return;
> >>
> >>          if (efi_runtime_disabled()) {
> >> @@ -101,3 +101,28 @@ void __init efi_init(void)
> >>                  early_memunmap(tbl, sizeof(*tbl));
> >>          }
> >>   }
> >> +
> >> +/* parse the fdt pointer from efi system table */
> >> +void __init *efi_fdt_pointer(void)
> >> +{
> >> +       int i;
> >> +       void *fdt =3D NULL;
> >> +       efi_config_table_t *tables;
> >> +
> >> +       if (!efi_systab) {
> >> +               pr_err("Can't find EFI system table.\n");
> >> +               return NULL;
> >> +       }
> >> +
> >> +       tables =3D (efi_config_table_t *) efi_systab->tables;
> >> +
> >> +       for (i =3D 0; i < efi_systab->nr_tables; i++)
> >> +               if (efi_guidcmp(tables[i].guid, DEVICE_TREE_GUID) =3D=
=3D 0) {
> >> +                       fdt =3D (void *)early_memremap_ro(
> >> +                                       (resource_size_t)tables[i].tab=
le,
> >> +                                       sizeof(efi_config_table_t));
> >> +                       break;
> >> +               }
> >> +
> >> +       return fdt;
> >> +}
> >
> Hi Ard:
>
> > Please use the existing config table discovery mechanism for this.
>
> Sorry, Regarding the mechanism related to config table discovery you
> mentioned, I only found the get_fdt() or get_efi_config_table()
> interfaces in driver/firmware/efi/libstub. Unfortunately, both of them
> cannot be referenced in our case.
>
> So which mechanism are you referring to specifically?
>

Please look at how the existing LoongArch code uses efi_config_parse_tables=
()
