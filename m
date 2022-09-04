Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3202C3C17
	for <loongarch@lists.linux.dev>; Sun,  4 Sep 2022 21:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA673C433D6
	for <loongarch@lists.linux.dev>; Sun,  4 Sep 2022 21:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662328781;
	bh=D+iyzZIHB2cM5PZLFOtFUR+KWPyV6ywMqPuWdApmM+M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K2LzFLQyGJok6JeQsjj/cNPKxF/VyLZPjbwvm99nHTyDEvphrvqkoc9ma4MYc/u/X
	 XyoxdSErW9gGvarq0hWx1KodOQjKRpEjuvtB95SkVCEVhcbk5LsoaPuVB0Nfa+yLhb
	 wlGuwySvA+XaaV1ynjWyP9g91iATXtakTaXCAW+yqsXLHF6aXEti8QjGi9B0BcMqQr
	 V6Z6BWzW7C2KOvnPxlrcsLEtTo3poe+ZxISr3Kf81/AEfo/fe6vmejoLj22Dg706eM
	 RucZGhZ6nruKasTKVjJLiCtuCuUcFMwQnYXL1KzzMdo6fnIqUQJ+qlr+FHaGFFPVxE
	 42WVqyc36jR1g==
Received: by mail-lj1-f169.google.com with SMTP id w19so7492636ljj.7
        for <loongarch@lists.linux.dev>; Sun, 04 Sep 2022 14:59:41 -0700 (PDT)
X-Gm-Message-State: ACgBeo16H4pj8CaIYABp1vXYGhC7v0WCQ7XbN24UCzEiKLVJHCnVB6xx
	tLu0qmxj8rlTyt7el6Qebk3MqD0qmO4X6Ij4aRA=
X-Google-Smtp-Source: AA6agR4MDdbTuFXMI/wun5KB8TsOF09ANKpd3b5UDdG9HJexkppqLqpmAclTBX5zWDCvsDWLv7CK19uDxdpLR1z4rbA=
X-Received: by 2002:a2e:710c:0:b0:264:ed38:e57f with SMTP id
 m12-20020a2e710c000000b00264ed38e57fmr9027418ljc.189.1662328779881; Sun, 04
 Sep 2022 14:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819102037.2697798-1-chenhuacai@loongson.cn>
 <9b6f0aeaebbd36882b5b40d655f9ccd20c7be496.camel@xry111.site>
 <CAMj1kXFOd+gMHbi6MH0KHWkBEKN9V0LeZbyGRw8h630OxtMrdA@mail.gmail.com>
 <CAAhV-H6MR=rWhecY_uuiXAysED-BBJhKhGHj2cCkefJiPOo-ZQ@mail.gmail.com> <CAAhV-H4KXVUBgNoQxOFiEj2AH-ojhnrEJ8QLvNrALY69MhXF3w@mail.gmail.com>
In-Reply-To: <CAAhV-H4KXVUBgNoQxOFiEj2AH-ojhnrEJ8QLvNrALY69MhXF3w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 4 Sep 2022 23:59:28 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHJv_6mLhMikg+ic7=EUABLdrX3f__eBbHntrpGHjRfXg@mail.gmail.com>
Message-ID: <CAMj1kXHJv_6mLhMikg+ic7=EUABLdrX3f__eBbHntrpGHjRfXg@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add efistub booting support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-efi <linux-efi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Sept 2022 at 15:24, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Ard,
>
> On Thu, Sep 1, 2022 at 6:40 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > Hi, Ard,
> >
> > On Sat, Aug 27, 2022 at 3:14 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Sat, 27 Aug 2022 at 06:41, Xi Ruoyao <xry111@xry111.site> wrote:
> > > >
> > > > Tested V3 with the magic number check manually removed in my GRUB build.
> > > > The system boots successfully.  I've not tested Arnd's zBoot patch yet.
> > >
> > > I am Ard not Arnd :-)
> > >
> > > Please use this branch when testing the EFI decompressor:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=efi-decompressor-v4
> > The root cause of LoongArch zboot boot failure has been found, it is a
> > binutils bug, latest toolchain with the below patch can solve the
> > problem.
> >
> > diff --git a/bfd/elfnn-loongarch.c b/bfd/elfnn-loongarch.c
> > index 5b44901b9e0..fafdc7c7458 100644
> > --- a/bfd/elfnn-loongarch.c
> > +++ b/bfd/elfnn-loongarch.c
> > @@ -2341,9 +2341,10 @@ loongarch_elf_relocate_section (bfd
> > *output_bfd, struct bfd_link_info *info,
> >      case R_LARCH_SOP_PUSH_PLT_PCREL:
> >        unresolved_reloc = false;
> >
> > -      if (resolved_to_const)
> > +      if (!is_undefweak && resolved_to_const)
> >          {
> >            relocation += rel->r_addend;
> > +          relocation -= pc;
> >            break;
> >          }
> >        else if (is_undefweak)
> >
> >
> > Huacai
> Now the patch is submitted here:
> https://sourceware.org/pipermail/binutils/2022-September/122713.html
>

Great. Given the severity of this bug, I imagine that building the
LoongArch kernel will require a version of binutils that carries this
fix.

Therefore, i will revert back to the original approach for accessing
uncompressed_size, using an extern declaration with an __aligned(1)
attribute.

> And I have some other questions about kexec: kexec should jump to the
> elf entry or the pe entry? I think is the elf entry, because if we
> jump to the pe entry, then SVAM will be executed twice (but it should
> be executed only once). However, how can we jump to the elf entry if
> we use zboot? Maybe it is kexec-tool's responsibility to decompress
> the zboot kernel image?
>

Yes, very good point. Kexec kernels cannot boot via the EFI entry
point, as the boot services will already be shutdown. So the kexec
kernel needs to boot via the same entrypoint in the core kernel that
the EFI stub calls when it hands over.

For the EFI zboot image in particular, we will need to teach kexec how
to decompress them. The zboot image has a header that
a) describes it as a EFI linux zimg
b) describes the start and end offset of the compressed payload
c) describes which compression algorithm was used.

This means that any non-EFI loader (including kexec) should be able to
extract the inner PE/COFF image and decompress it. For arm64 and
RISC-V, this is sufficient as the EFI and raw images are the same. For
LoongArch, I suppose it means we need a way to enter the core kernel
directly via the entrypoint that the EFI stub uses when handing over
(and pass the original DT argument so the kexec kernel has access to
the EFI and ACPI firmware tables)
