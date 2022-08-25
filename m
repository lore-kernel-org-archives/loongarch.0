Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21F2F28
	for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 11:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4808AC433D6
	for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661428512;
	bh=f/e3B6wUjuNzB0TM/IzPgJQ9aTuWduy9Zuu6Vz0PrUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dRDlniWM5ze8hhzX2uLK6AA0T5vQMGggFAX+Kf4j1GxpMMgPrg5qxMmX+hqygDiSq
	 DMsa4iLk9blLaBOM77vT7zwhbIkJ5ZhUHu9+/jyBf+riz/YJl0sY3pRGfXUR1C1tZP
	 NryOITybz5JW+g49nSdjIs+Y0xORPEA5WkXmz2JsjjB+7syOrcul6uRjF9K5Y76Fzj
	 pAONSC0OYqglvRdFEk5dRMuie13iGF+UpeYrzdRFiW2Tcfq0nqwlyZI7bqkEkEfGXY
	 8rfZsm4pgNLdBUZS1p7fLkBAxcC5vklMxjXXuWUYiVQVnOpnjsSnyG6N3ztMD17U2J
	 u2Ad5cDcWmN2Q==
Received: by mail-vs1-f45.google.com with SMTP id c3so20602188vsc.6
        for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 04:55:12 -0700 (PDT)
X-Gm-Message-State: ACgBeo3y5PMtOyQgUj2wttQj7eOiud7G7TEiakgjg0FhGFLRrf+zuohd
	JSU0K4GJJnaXpEvDWyNfDC1lclxj3aFn4HoN5iQ=
X-Google-Smtp-Source: AA6agR50ZS1mmx0vvDEtnTPGuxIvUdAsLM+IwsthI2C7H9ArmKACindrrTx38rZruDIchX707Kqv9dCUVxlmSFfLL0c=
X-Received: by 2002:a67:d59d:0:b0:390:4cf9:2804 with SMTP id
 m29-20020a67d59d000000b003904cf92804mr1392013vsj.78.1661428511193; Thu, 25
 Aug 2022 04:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819102037.2697798-1-chenhuacai@loongson.cn>
 <CAMj1kXGrWqaTeiSeK1vG=escABZg16cpekzzTTp5WaTwi3iUYg@mail.gmail.com>
 <CAMj1kXHec4pfkM6gGwpDPCRn-WbTQcpLam+MWpBph-1KAo1H4A@mail.gmail.com>
 <CAAhV-H7Wsjf9GAQVkBeu+PKbGOJ5nAxGY=E3zryu_8OK4qtnGA@mail.gmail.com>
 <CAAhV-H7-JGGjcFBenpwUz1itZvFK9f1pH88b1dcRtPcGKToojA@mail.gmail.com>
 <CAMj1kXFEaM7KULxygTABRXB2HHnmRbpSq4N3Q4bYaPOtJxEN2g@mail.gmail.com>
 <CAAhV-H4CuCSTv8G+bBy52P7kWEc9mapatJ-83mrLYmozG+5SXA@mail.gmail.com>
 <CAMj1kXF8u=M6R_9pCciY+5oWj6VbLcMEFFC=JYQm5aq1-c8eRg@mail.gmail.com>
 <CAAhV-H4Ttu_AKyqgYZqAon4fpyCU2ODGYmub85WKDf57KZwVDg@mail.gmail.com> <CAMj1kXHZ7Gb0fWM7AdoVpOzspMBVRtzzg2YT5Giuaf6VOLEpaA@mail.gmail.com>
In-Reply-To: <CAMj1kXHZ7Gb0fWM7AdoVpOzspMBVRtzzg2YT5Giuaf6VOLEpaA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 25 Aug 2022 19:54:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6rjQ9=LQkbkZAqvAXDgg6kq4y+x30ga-dCC-DQqYwQTw@mail.gmail.com>
Message-ID: <CAAhV-H6rjQ9=LQkbkZAqvAXDgg6kq4y+x30ga-dCC-DQqYwQTw@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Xi Ruoyao <xry111@xry111.site>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Ard,

On Thu, Aug 25, 2022 at 5:51 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 25 Aug 2022 at 11:47, Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > Hi, Ard,
> >
> > On Wed, Aug 24, 2022 at 9:28 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Wed, 24 Aug 2022 at 14:43, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > >
> > > > Hi, Ard,
> > > >
> > > > On Wed, Aug 24, 2022 at 6:26 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > >
> > > > > On Tue, 23 Aug 2022 at 05:15, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, Aug 23, 2022 at 11:11 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > > >
> > > > > > > Hi, Ard,
> > > > > > >
> > > > > > > On Tue, Aug 23, 2022 at 2:03 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On Mon, 22 Aug 2022 at 12:44, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, 19 Aug 2022 at 12:20, Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > > > > > > > >
> > > > > > > > > > This patch adds efistub booting support, which is the standard UEFI boot
> > > > > > > > > > protocol for us to use.
> > > > > > > > > >
> > > > > > > > > > We use generic efistub, which means we can pass boot information (i.e.,
> > > > > > > > > > system table, memory map, kernel command line, initrd) via a light FDT
> > > > > > > > > > and drop a lot of non-standard code.
> > > > > > > > > >
> > > > > > > > > > We use a flat mapping to map the efi runtime in the kernel's address
> > > > > > > > > > space. In efi, VA = PA; in kernel, VA = PA + PAGE_OFFSET. As a result,
> > > > > > > > > > flat mapping is not identity mapping, SetVirtualAddressMap() is still
> > > > > > > > > > needed for the efi runtime.
> > > > > > > > > >
> > > > > > > > > > Tested-by: Xi Ruoyao <xry111@xry111.site>
> > > > > > > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > > > > > ---
> > > > > > > > > > V1 --> V2:
> > > > > > > > > > 1, Call SetVirtualAddressMap() in stub;
> > > > > > > > > > 2, Use core kernel data directly in alloc_screen_info();
> > > > > > > > > > 3, Remove the magic number in MS-DOS header;
> > > > > > > > > > 4, Disable EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER;
> > > > > > > > > > 5, Some other small changes suggested by Ard Biesheuvel.
> > > > > > > > > >
> > > > > > > > > > V2 --> V3:
> > > > > > > > > > 1, Adjust Makefile to adapt zboot;
> > > > > > > > > > 2, Introduce EFI_RT_VIRTUAL_OFFSET instead of changing flat_va_mapping.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks for the update.
> > > > > > > > >
> > > > > > > > > I am going to queue this up in the efi/next tree. However, due to the
> > > > > > > > > many changes to arch/loongarch in this patch, conflicts are not
> > > > > > > > > unlikely, so I created a signed stable tag for the patch that you can
> > > > > > > > > merge into the loongarch arch tree if you want.
> > > > > > > > >
> > > > > > > > > *However*, you must *not* rebase your tree after merging this tag.
> > > > > > > > > Therefore, it is probably best that the merge of this tag appears as
> > > > > > > > > the very first change on your PR to Linus for v6.1. Everything after
> > > > > > > > > can be rebased at will (assuming there are no other impediments to
> > > > > > > > > doing so)
> > > > > > > > >
> > > > > > > > > You can fetch it and merge it like so:
> > > > > > > > >
> > > > > > > > > git fetch -t git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
> > > > > > > > > git verify-tag efi-loongarch-for-v6.1 # if you like
> > > > > > > > > git merge efi-loongarch-for-v6.1
> > > > > > > > >
> > > > > > > > > and all your other v6.1 changes can go on top.
> > > > > > > > >
> > > > > > > > > This way, you can resolve conflicts locally without affecting the EFI
> > > > > > > > > changes going via the other tree. The EFI stub for LoongArch change
> > > > > > > > > will arrive into Linus's tree via whichever tree he pulls first: the
> > > > > > > > > LoongArch one or the EFI one.
> > > > > > > > >
> > > > > > > > > I will rebase my zboot decompressor changes on top of this - I will cc
> > > > > > > > > you again, as the LoongArch builds ok but still does not boot.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I have pushed a branch here that includes EFI decompressor support for LoongArch
> > > > > > > >
> > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=efi-decompressor-v4
> > > > > > > >
> > > > > > > > You will need to enable CONFIG_EFI_ZBOOT and build the zImage.efi
> > > > > > > > target. The resulting image should be bootable jus tlike the
> > > > > > > > vmlinux.efi but for some reason, it produces the crash I reported
> > > > > > > > earlier.
> > > > > > > >
> > > > > > > > Please give it a try, and if you manage to figure out what's wrong
> > > > > > > > with my code, please let me know :-)
> > > > > > > I will try zboot on my real machine. For the code, I prefer
> > > > > > > vmlinuz.efi rather than zImage.efi for LoongArch since it keeps the
> > > > > > > naming consistency.
> > > > >
> > > > > OK, I will rename it to vmlinuz.efi for all architectures then.
> > > > I found RISC-V and ARM64 use Image for the normal kernel, so zImage
> > > > may be a suitable name for them, can we use a variable for the
> > > > compressed kernel? For example, use KBUILD_IMAGE directly, then we
> > > > don't need to use the same name for all architectures.
> > > >
> > >
> > > No. This is supposed to be a generic EFI boot method, and using
> > > different names for the same thing on different architectures
> > > interferes with that.
> > We have already used a EFI_ZBOOT_PAYLOAD which is different across
> > architectures, so using another KBUILD_IMAGE may have no problem? This
> > can also let "make" rather than "make zImage.efi" to build the zboot
> > kernel.
> >
>
> This is not about how we define KBUILD_IMAGE internally. If you prefer
> to build the zboot kernel by default, we can set KBUILD_IMAGE to
> vmlinuz.efi for LoongArch if CONFIG_EFI_ZBOOT=y.
>
> What I was referring to is external consumers: other projects such as
> GRUB, systemd-boot or the distros. Using zImage.efi on some
> architectures and vmlinuz.efi on other ones only creates confusion, so
> we should stick to a single one. I don't mind switching the other
> architectures to vmlinuz.efi as well.
OK, I know. vmlinuz.efi is good to me, but if it makes RISC-V or ARM64
uncomfortable, we can name it zboot.efi for all architectures. :)

Huacai

>
> > >
> > > > And I have tried your zboot series on a real machine, it has the same
> > > > problem as you tried in QEMU. I will try to find the root cause with
> > > > my colleagues.
> > > >
> > >
> > > Yes please.
> > We made the following changes and it works on LoongArch. But we don't
> > know why the existing method didn't work. Our guess is that the linker
> > calculates the address incorrectly.
> >
>
> Could it be due to the misalignment? Could this be a toolchain issue
> with __aligned(1)?
>
>
> > diff --git a/drivers/firmware/efi/libstub/zboot.c
> > b/drivers/firmware/efi/libstub/zboot.c
> > index f8eb4c7b41d1..ce3bd1affa1a 100644
> > --- a/drivers/firmware/efi/libstub/zboot.c
> > +++ b/drivers/firmware/efi/libstub/zboot.c
> > @@ -29,7 +29,6 @@ static unsigned long free_mem_ptr, free_mem_end_ptr;
> >  #endif
> >
> >  extern char _gzdata_start[], _gzdata_end[];
> > -extern u32 uncompressed_size __aligned(1);
> >
> >  static void log(efi_char16_t str[])
> >  {
> > @@ -53,6 +52,7 @@ efi_status_t __efiapi efi_zboot_entry(efi_handle_t handle,
> >         unsigned long image_buffer;
> >         efi_handle_t child_handle;
> >         efi_char16_t *exit_data;
> > +       u32 uncompressed_size;
> >         efi_status_t status;
> >         int ret;
> >
> > @@ -68,6 +68,9 @@ efi_status_t __efiapi efi_zboot_entry(efi_handle_t handle,
> >                 return status;
> >         }
> >
> > +       // The uncompressed size is appended at the end of the image
> > +       uncompressed_size = *(u32 *)(_gzdata_end - 4);
> > +
> >         status = efi_allocate_pages(uncompressed_size, &image_buffer,
> > ULONG_MAX);
> >         if (status != EFI_SUCCESS) {
> >                 log(L"Failed to allocate memory\n");
> > diff --git a/drivers/firmware/efi/libstub/zboot.lds
> > b/drivers/firmware/efi/libstub/zboot.lds
> > index d6ba89a0c294..7a1059a8a47b 100644
> > --- a/drivers/firmware/efi/libstub/zboot.lds
> > +++ b/drivers/firmware/efi/libstub/zboot.lds
> > @@ -33,7 +33,5 @@ SECTIONS
> >
> >  PROVIDE(__efistub__gzdata_size = ABSOLUTE(. - __efistub__gzdata_start));
> >
> > -PROVIDE(__efistub_uncompressed_size = __efistub__gzdata_end - 4);
> > -
> >  PROVIDE(__data_rawsize = ABSOLUTE(_edata - _etext));
> >  PROVIDE(__data_size = ABSOLUTE(_end - _etext));
> >
> > Huacai
