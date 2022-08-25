Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB161FCF
	for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 10:14:12 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id by6so18927403ljb.11
        for <loongarch@lists.linux.dev>; Thu, 25 Aug 2022 03:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=vgLOhLMNaPgyt79pWSZmf3zH4CD10rKsVzQSr07ITDg=;
        b=hiyiogHchgZlaW5+UrTA0Jbl9H9U6vzFEs03yb0nMM8W9Vo3EfhpfxnzNmS0+BTRiF
         0KmH1d2rfURGDVNNMUSSvmHKjCik+uJDvjqiTGJm38ccC7HwP8Bt1K1jWSNQiMbdOa9S
         vWU8iPJQYMksv5IT1sfHsG3zpIc4tcPHlSx9i9cpJnjv4cJYDcn2CEaOcm8/Z1GAyOd1
         cAlpeA+RI7gR68pdm6x5mMWGxsYsy9NLJvC8kp6tpQyAhvvYB2qakwq1nTr97jfq187h
         W+oSIFJwif3QreL2tlzuikNNxBn6kG/SjpXonEC2KTP5nELTB0839Ua0KOGEHc8BJsZT
         yk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=vgLOhLMNaPgyt79pWSZmf3zH4CD10rKsVzQSr07ITDg=;
        b=LAdQjohPr+jfjKLuqOKffRJs5eU+x/NBMoE4GFSA0l9p+K92Q92V7Z8E7gGK/7hV9z
         vDhR3unAtN3Ml8LETnZc/t50AYrSQYFy6qbwsONbFQxsH8mrAaU2ozDBOXh0TQ6hSxFZ
         saWw3OSGLE+A09u1VyV3nT5OS8eeEU/4Nd/aCSi/+nQBdJ0j+pXqWsEQJqsF01aK5Rbq
         4CG/DwqFxUELoyc7Ti4Gc+a3dszriq5yH+vAEjlWr/1fg5FP6Y2cz6U7eRiagAuvjw6d
         x9puhBqpoyWNpmZXrC93/TOrZMtQm/GtiTNkDa2H1OLYnuqK2F5AnW+qJhjMyMy90mGW
         Qp9A==
X-Gm-Message-State: ACgBeo0AgL5yT66hE7gFoXts33StM37JL6rAiEeqZeh0Gys+DcxEYPzA
	g5UAdzPmyMOJZiLKdOzVRFbl0FIwfEysrFhM0UuSG8gxkWcwaQ==
X-Google-Smtp-Source: AA6agR585kjRs3CRRIc9pEMmUF/8OJEj5NGQebPeV00cYzC8nIMGHPaYHvgs1+lgehOuoP/vIuKT45ZIxTBPP9JeTuE=
X-Received: by 2002:a2e:b710:0:b0:261:d4c2:3432 with SMTP id
 j16-20020a2eb710000000b00261d4c23432mr870455ljo.440.1661422450748; Thu, 25
 Aug 2022 03:14:10 -0700 (PDT)
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
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 25 Aug 2022 18:13:59 +0800
Message-ID: <CACWXhK=nhYWWOFMbj8wGWK7VR=a-JdAQ2GtLJzWmm6diMA3HMA@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Xi Ruoyao <xry111@xry111.site>, Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Aug 2022 at 17:51, Ard Biesheuvel <ardb@kernel.org> wrote:
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

Hi, Ard,

We tried to remove __aligned(1), but it doesn't work. We disassembled
zImage.efi.elf and found that uncompressed_size and _gzdata_end are
very far apart.

// s4: uncompressed_size
2f94:   1c012afb        pcaddu12i       $s4, 2391(0x957)
2f98:   02ff837b        addi.d          $s4, $s4, -32(0xfe0)

// s1: _gzdata_end
2fa4:   1c012a98        pcaddu12i       $s1, 2388(0x954)
2fa8:   02c0f318        addi.d          $s1, $s1, 60(0x3c)

Thanks,
Feiyang

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
>
