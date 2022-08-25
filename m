Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F387A1FCF
	for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 09:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A428CC433B5
	for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661421111;
	bh=BbCTgPl4E0xK2IvXIdO8MpqOTHqqvOLcD2vECLRoC6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F4RQyKxecGvMDiNjnAgZw+JqpD12k/ss6BAu2L01EIjAol8stldssh613QJw62HcD
	 a0q64AyDpnkzm/2tLkfyKCiGBVELlL85a7iKtd3DWg/QJTlh4JuSqN7wRkFdj0jSqH
	 dUsmCqHzwWk/wcSf7Bl3CqBnWdsPrvrU+eY4CKgKU5091t9R3oQ3S70IsO9Nk30DSS
	 kKg+GmI7BKFlwr9309R19OaZucFGMID4q4R4HQLwtkDHg7DZRtMFmtpGgjBYn1TTds
	 +lTQjQncekv6WbHibDMun+G3Lr8q/BVYXrDC/qkGtHkxBSZIAnlvnRUud1yN8UzWKJ
	 85JZ1cN0uQong==
Received: by mail-wm1-f54.google.com with SMTP id l33-20020a05600c1d2100b003a645240a95so2217586wms.1
        for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 02:51:51 -0700 (PDT)
X-Gm-Message-State: ACgBeo0kg6B9FyJnQLgdUlQEWW5BUQur6msF2MDP3/a2636bAUAAtkr4
	vgwiGTaByvp3WgUN70zi+2jks40n6D7LRhLfRGs=
X-Google-Smtp-Source: AA6agR66VUqlxxMdd5Fxbzb0VjQCI4fn396z4uzwH+hvMpGwJRW/8a9TA/7f45g4ZZJCGaR6CHFmyKptCHkcPNSgp0c=
X-Received: by 2002:a05:600c:384f:b0:3a6:603c:4338 with SMTP id
 s15-20020a05600c384f00b003a6603c4338mr7692960wmr.192.1661421109883; Thu, 25
 Aug 2022 02:51:49 -0700 (PDT)
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
 <CAMj1kXF8u=M6R_9pCciY+5oWj6VbLcMEFFC=JYQm5aq1-c8eRg@mail.gmail.com> <CAAhV-H4Ttu_AKyqgYZqAon4fpyCU2ODGYmub85WKDf57KZwVDg@mail.gmail.com>
In-Reply-To: <CAAhV-H4Ttu_AKyqgYZqAon4fpyCU2ODGYmub85WKDf57KZwVDg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 25 Aug 2022 11:51:38 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHZ7Gb0fWM7AdoVpOzspMBVRtzzg2YT5Giuaf6VOLEpaA@mail.gmail.com>
Message-ID: <CAMj1kXHZ7Gb0fWM7AdoVpOzspMBVRtzzg2YT5Giuaf6VOLEpaA@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Xi Ruoyao <xry111@xry111.site>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Aug 2022 at 11:47, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Ard,
>
> On Wed, Aug 24, 2022 at 9:28 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 24 Aug 2022 at 14:43, Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > Hi, Ard,
> > >
> > > On Wed, Aug 24, 2022 at 6:26 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Tue, 23 Aug 2022 at 05:15, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > >
> > > > > On Tue, Aug 23, 2022 at 11:11 AM Huacai Chen <chenhuacai@kernel.org> wrote:
> > > > > >
> > > > > > Hi, Ard,
> > > > > >
> > > > > > On Tue, Aug 23, 2022 at 2:03 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > >
> > > > > > > On Mon, 22 Aug 2022 at 12:44, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On Fri, 19 Aug 2022 at 12:20, Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > > > > > > >
> > > > > > > > > This patch adds efistub booting support, which is the standard UEFI boot
> > > > > > > > > protocol for us to use.
> > > > > > > > >
> > > > > > > > > We use generic efistub, which means we can pass boot information (i.e.,
> > > > > > > > > system table, memory map, kernel command line, initrd) via a light FDT
> > > > > > > > > and drop a lot of non-standard code.
> > > > > > > > >
> > > > > > > > > We use a flat mapping to map the efi runtime in the kernel's address
> > > > > > > > > space. In efi, VA = PA; in kernel, VA = PA + PAGE_OFFSET. As a result,
> > > > > > > > > flat mapping is not identity mapping, SetVirtualAddressMap() is still
> > > > > > > > > needed for the efi runtime.
> > > > > > > > >
> > > > > > > > > Tested-by: Xi Ruoyao <xry111@xry111.site>
> > > > > > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > > > > ---
> > > > > > > > > V1 --> V2:
> > > > > > > > > 1, Call SetVirtualAddressMap() in stub;
> > > > > > > > > 2, Use core kernel data directly in alloc_screen_info();
> > > > > > > > > 3, Remove the magic number in MS-DOS header;
> > > > > > > > > 4, Disable EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER;
> > > > > > > > > 5, Some other small changes suggested by Ard Biesheuvel.
> > > > > > > > >
> > > > > > > > > V2 --> V3:
> > > > > > > > > 1, Adjust Makefile to adapt zboot;
> > > > > > > > > 2, Introduce EFI_RT_VIRTUAL_OFFSET instead of changing flat_va_mapping.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Thanks for the update.
> > > > > > > >
> > > > > > > > I am going to queue this up in the efi/next tree. However, due to the
> > > > > > > > many changes to arch/loongarch in this patch, conflicts are not
> > > > > > > > unlikely, so I created a signed stable tag for the patch that you can
> > > > > > > > merge into the loongarch arch tree if you want.
> > > > > > > >
> > > > > > > > *However*, you must *not* rebase your tree after merging this tag.
> > > > > > > > Therefore, it is probably best that the merge of this tag appears as
> > > > > > > > the very first change on your PR to Linus for v6.1. Everything after
> > > > > > > > can be rebased at will (assuming there are no other impediments to
> > > > > > > > doing so)
> > > > > > > >
> > > > > > > > You can fetch it and merge it like so:
> > > > > > > >
> > > > > > > > git fetch -t git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
> > > > > > > > git verify-tag efi-loongarch-for-v6.1 # if you like
> > > > > > > > git merge efi-loongarch-for-v6.1
> > > > > > > >
> > > > > > > > and all your other v6.1 changes can go on top.
> > > > > > > >
> > > > > > > > This way, you can resolve conflicts locally without affecting the EFI
> > > > > > > > changes going via the other tree. The EFI stub for LoongArch change
> > > > > > > > will arrive into Linus's tree via whichever tree he pulls first: the
> > > > > > > > LoongArch one or the EFI one.
> > > > > > > >
> > > > > > > > I will rebase my zboot decompressor changes on top of this - I will cc
> > > > > > > > you again, as the LoongArch builds ok but still does not boot.
> > > > > > > >
> > > > > > >
> > > > > > > I have pushed a branch here that includes EFI decompressor support for LoongArch
> > > > > > >
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=efi-decompressor-v4
> > > > > > >
> > > > > > > You will need to enable CONFIG_EFI_ZBOOT and build the zImage.efi
> > > > > > > target. The resulting image should be bootable jus tlike the
> > > > > > > vmlinux.efi but for some reason, it produces the crash I reported
> > > > > > > earlier.
> > > > > > >
> > > > > > > Please give it a try, and if you manage to figure out what's wrong
> > > > > > > with my code, please let me know :-)
> > > > > > I will try zboot on my real machine. For the code, I prefer
> > > > > > vmlinuz.efi rather than zImage.efi for LoongArch since it keeps the
> > > > > > naming consistency.
> > > >
> > > > OK, I will rename it to vmlinuz.efi for all architectures then.
> > > I found RISC-V and ARM64 use Image for the normal kernel, so zImage
> > > may be a suitable name for them, can we use a variable for the
> > > compressed kernel? For example, use KBUILD_IMAGE directly, then we
> > > don't need to use the same name for all architectures.
> > >
> >
> > No. This is supposed to be a generic EFI boot method, and using
> > different names for the same thing on different architectures
> > interferes with that.
> We have already used a EFI_ZBOOT_PAYLOAD which is different across
> architectures, so using another KBUILD_IMAGE may have no problem? This
> can also let "make" rather than "make zImage.efi" to build the zboot
> kernel.
>

This is not about how we define KBUILD_IMAGE internally. If you prefer
to build the zboot kernel by default, we can set KBUILD_IMAGE to
vmlinuz.efi for LoongArch if CONFIG_EFI_ZBOOT=y.

What I was referring to is external consumers: other projects such as
GRUB, systemd-boot or the distros. Using zImage.efi on some
architectures and vmlinuz.efi on other ones only creates confusion, so
we should stick to a single one. I don't mind switching the other
architectures to vmlinuz.efi as well.

> >
> > > And I have tried your zboot series on a real machine, it has the same
> > > problem as you tried in QEMU. I will try to find the root cause with
> > > my colleagues.
> > >
> >
> > Yes please.
> We made the following changes and it works on LoongArch. But we don't
> know why the existing method didn't work. Our guess is that the linker
> calculates the address incorrectly.
>

Could it be due to the misalignment? Could this be a toolchain issue
with __aligned(1)?


> diff --git a/drivers/firmware/efi/libstub/zboot.c
> b/drivers/firmware/efi/libstub/zboot.c
> index f8eb4c7b41d1..ce3bd1affa1a 100644
> --- a/drivers/firmware/efi/libstub/zboot.c
> +++ b/drivers/firmware/efi/libstub/zboot.c
> @@ -29,7 +29,6 @@ static unsigned long free_mem_ptr, free_mem_end_ptr;
>  #endif
>
>  extern char _gzdata_start[], _gzdata_end[];
> -extern u32 uncompressed_size __aligned(1);
>
>  static void log(efi_char16_t str[])
>  {
> @@ -53,6 +52,7 @@ efi_status_t __efiapi efi_zboot_entry(efi_handle_t handle,
>         unsigned long image_buffer;
>         efi_handle_t child_handle;
>         efi_char16_t *exit_data;
> +       u32 uncompressed_size;
>         efi_status_t status;
>         int ret;
>
> @@ -68,6 +68,9 @@ efi_status_t __efiapi efi_zboot_entry(efi_handle_t handle,
>                 return status;
>         }
>
> +       // The uncompressed size is appended at the end of the image
> +       uncompressed_size = *(u32 *)(_gzdata_end - 4);
> +
>         status = efi_allocate_pages(uncompressed_size, &image_buffer,
> ULONG_MAX);
>         if (status != EFI_SUCCESS) {
>                 log(L"Failed to allocate memory\n");
> diff --git a/drivers/firmware/efi/libstub/zboot.lds
> b/drivers/firmware/efi/libstub/zboot.lds
> index d6ba89a0c294..7a1059a8a47b 100644
> --- a/drivers/firmware/efi/libstub/zboot.lds
> +++ b/drivers/firmware/efi/libstub/zboot.lds
> @@ -33,7 +33,5 @@ SECTIONS
>
>  PROVIDE(__efistub__gzdata_size = ABSOLUTE(. - __efistub__gzdata_start));
>
> -PROVIDE(__efistub_uncompressed_size = __efistub__gzdata_end - 4);
> -
>  PROVIDE(__data_rawsize = ABSOLUTE(_edata - _etext));
>  PROVIDE(__data_size = ABSOLUTE(_end - _etext));
>
> Huacai
