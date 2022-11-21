Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A57E
	for <loongarch@lists.linux.dev>; Mon, 21 Nov 2022 06:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2080C433C1
	for <loongarch@lists.linux.dev>; Mon, 21 Nov 2022 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669013086;
	bh=ByEb9CzSYoiFO/dGpr0/iFSZVFlaCOW5X7TzSx2On4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rxN5CjUiUgd6nnQEwm2BqHZU66U99Edw2Wg3K+uqSakdnlIhQLO4t1YhEkeQO5asG
	 TTJ695e1zqRwakPikO8TFFB/I6LjA1F9rRsqQ55Qb/EaDCTL5ooha2f6UtGgkJS4en
	 aEwGG7Pu6ykmfVjZBYAz3srUm7HIDq+sZsOPv3m3mokyd8dGO0s3ozXISOuktfNnu8
	 a7vGDjwe04kSls31UCh/D4nhYKxUDHmNJY1OpxXST1dpyPNoCjkYn9XibGqtT0/zuW
	 rbbvX7SvTc5F+3ZfDlzouLN1iy8ELV2qRfLfF+o2NbRW2fVF4QT5ev+29F5ZlL0GTV
	 3cZJ/qg3K8H7Q==
Received: by mail-ed1-f47.google.com with SMTP id y24so9833783edi.10
        for <loongarch@lists.linux.dev>; Sun, 20 Nov 2022 22:44:46 -0800 (PST)
X-Gm-Message-State: ANoB5pkLfU7FKWFhR8vUWNI1rvKVLHOjU72Ftgr57HRqxXKztcRM9oQZ
	+R+G2+sE4/aaIozOz6W/ziCax/WqKRBbO+7bNv0=
X-Google-Smtp-Source: AA0mqf7VJWSKzNKbhsfEgKxPS55uh+3w7AlPSLx369LSwsBq3VOx8no34PQvyskfaD6k8f0Vv4259bYV63Hgb5YlvhA=
X-Received: by 2002:a05:6402:5003:b0:462:a25f:f0f2 with SMTP id
 p3-20020a056402500300b00462a25ff0f2mr14962234eda.156.1669013084932; Sun, 20
 Nov 2022 22:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn>
 <CAMj1kXG3sJTPzWYx1hKaBeXPgD0xQXW-4NxgwZjWpQ-nGw=MhA@mail.gmail.com>
 <df8e3b76-0594-e26a-b53c-c145b5abbd31@loongson.cn> <89f0adb3-ea3b-e275-b59e-22d30e67f77b@xen0n.name>
 <e832b206-9891-ab62-254c-c7a55e36d718@loongson.cn>
In-Reply-To: <e832b206-9891-ab62-254c-c7a55e36d718@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Nov 2022 14:44:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4mW-r2aHZh7=SBYRRKDSFmVwOsCYUPFLsi7CMyhkwf3w@mail.gmail.com>
Message-ID: <CAAhV-H4mW-r2aHZh7=SBYRRKDSFmVwOsCYUPFLsi7CMyhkwf3w@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: Jianmin Lv <lvjianmin@loongson.cn>, Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ard,

On Mon, Nov 7, 2022 at 4:44 PM Jianmin Lv <lvjianmin@loongson.cn> wrote:
>
>
>
> On 2022/11/7 =E4=B8=8A=E5=8D=8810:50, WANG Xuerui wrote:
> > On 2022/11/7 10:07, Jianmin Lv wrote:
> >>
> >>
> >> On 2022/11/6 =E4=B8=8B=E5=8D=8811:06, Ard Biesheuvel wrote:
> >>> On Sun, 6 Nov 2022 at 07:58, Binbin Zhou <zhoubinbin@loongson.cn> wro=
te:
> >>>>
> >>>> Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency=
 on
> >>>> flattened DT"), we can parse the FDT from efi system table.
> >>>>
> >>>> And now, the Loongson-2K series cpus based on LoongArch support boot=
ing
> >>>> with FDT, so we adds the relevant booting support as well as paramet=
er
> >>>> parsing.
> >>>>
> >>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>>> ---
> >>>>   arch/loongarch/Kconfig             |  2 +
> >>>>   arch/loongarch/include/asm/efi.h   |  1 +
> >>>>   arch/loongarch/include/asm/setup.h |  1 +
> >>>>   arch/loongarch/kernel/efi.c        | 27 ++++++++++-
> >>>>   arch/loongarch/kernel/env.c        |  3 ++
> >>>>   arch/loongarch/kernel/setup.c      | 75
> >>>> +++++++++++++++++++++++++++++-
> >>>>   6 files changed, 106 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> >>>> index 903096bd87f8..ce53d1fa2b64 100644
> >>>> --- a/arch/loongarch/Kconfig
> >>>> +++ b/arch/loongarch/Kconfig
> >>>> @@ -111,6 +111,8 @@ config LOONGARCH
> >>>>          select MODULES_USE_ELF_RELA if MODULES
> >>>>          select NEED_PER_CPU_EMBED_FIRST_CHUNK
> >>>>          select NEED_PER_CPU_PAGE_FIRST_CHUNK
> >>>> +       select OF
> >>>> +       select OF_EARLY_FLATTREE
> >>>>          select PCI
> >>>>          select PCI_DOMAINS_GENERIC
> >>>>          select PCI_ECAM if ACPI
> >>>> diff --git a/arch/loongarch/include/asm/efi.h
> >>>> b/arch/loongarch/include/asm/efi.h
> >>>> index 174567b00ddb..81e5d3371868 100644
> >>>> --- a/arch/loongarch/include/asm/efi.h
> >>>> +++ b/arch/loongarch/include/asm/efi.h
> >>>> @@ -9,6 +9,7 @@
> >>>>
> >>>>   void __init efi_init(void);
> >>>>   void __init efi_runtime_init(void);
> >>>> +void __init *efi_fdt_pointer(void);
> >>>>   void efifb_setup_from_dmi(struct screen_info *si, const char *opt)=
;
> >>>>
> >>>>   #define ARCH_EFI_IRQ_FLAGS_MASK  0x00000004  /* Bit 2: CSR.CRMD.IE=
 */
> >>>> diff --git a/arch/loongarch/include/asm/setup.h
> >>>> b/arch/loongarch/include/asm/setup.h
> >>>> index ca373f8e3c4d..b18baf878ed4 100644
> >>>> --- a/arch/loongarch/include/asm/setup.h
> >>>> +++ b/arch/loongarch/include/asm/setup.h
> >>>> @@ -13,6 +13,7 @@
> >>>>
> >>>>   extern unsigned long eentry;
> >>>>   extern unsigned long tlbrentry;
> >>>> +extern char original_cmdline[COMMAND_LINE_SIZE];
> >>>>   extern void tlb_init(int cpu);
> >>>>   extern void cpu_cache_init(void);
> >>>>   extern void cache_error_setup(void);
> >>>> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi=
.c
> >>>> index a31329971133..16dcd673e905 100644
> >>>> --- a/arch/loongarch/kernel/efi.c
> >>>> +++ b/arch/loongarch/kernel/efi.c
> >>>> @@ -37,7 +37,7 @@ static efi_config_table_type_t arch_tables[]
> >>>> __initdata =3D {
> >>>>
> >>>>   void __init efi_runtime_init(void)
> >>>>   {
> >>>> -       if (!efi_enabled(EFI_BOOT))
> >>>> +       if (!efi_enabled(EFI_BOOT) || !efi_systab->runtime)
> >>>
> >>> How can this happen? Why would we ever set EFI_BOOT if
> >>> efi_systab->runtime =3D=3D NULL?
> >>>
> >>
> >> Because some firmware (such as PMON) employed UEFI compatible
> >> implementaion without runtime (and set runtime null pointer).
> >
> > Hmm, is it really "UEFI-compatible" when it's without a UEFI runtime?
>
> To be frank, it seems that runtime should be always valid in UEFI
> complaint firmware (according to UEFI spec section 4.5, 8).
> Unfortunately, some machines shipped with *partially-compatible"
> (without runtime) firmware have been outside (maybe not many, I'm not
> sure). So, thinking about compatibility with them, the case have to be
> taken account, unless rather.
>
> > Anyway it's becoming increasingly difficult for community reviewers to
> > check things without corresponding firmware sources available... (and I
> > think, given the Loongson fork of PMON even back in the MIPS era is
> > effectively GPL'd [1], the LoongArch port of PMON could probably be GPL
> > as well, in which case it's totally fair for us to request the sources.=
)
> >
> > (I know the similar usage pattern i.e. making use of various UEFI
> > features but without a runtime was already widespread back in the MIPS
> > days of Loongson, but personally I don't think it's enough to justify
> > doing the same when it's 2022 and we're fully upstream.)
> >
> > [1]: https://github.com/loongson-community/pmon/blob/master/LICENSE.md
> >
> >> Maybe *noefi* in command line is enough for this without
> >> CONFIG_CMDLINE_FORCE simillar stuff configured?
> >
> > I think having/forcing users to add "noefi" themselves wouldn't be good
> > ergonomics? Manipulating the cmdline in the firmware could be more
> > acceptable but I'm not sure.
> >
>
> I think so, adding it in firmware internally (if using "noefi") maybe
> acceptable rather than adding it by users.
With Jianmin's explanation, do you think it is acceptable for
PMON-like firmware (emulates a systemtable but doesn't provide
runtime) to set efi boot flag to 1? Or the flag should be 0 unless
firmware is fully efi-compatible (has systemtable and runtime service
is available)?

Huacai
>
