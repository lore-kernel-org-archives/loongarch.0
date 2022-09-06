Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B62F2F
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 10:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD0FC433C1
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662459400;
	bh=9/OqEY1AdGlYqFrskuBnDyzAXAsqqGEVaUN/RRhe4Ck=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WymsisIaz3vz6LLmtOOC+6uvrRVt/GXWVbZSpnpZSoDmvyfqWsVxCkdE31gaYzac9
	 o2EEnu+x5hVNwqHY1f6wcX80IUKdyDUYFZFnuH1dafiI2RkqRYLWsXlXiySwnErflw
	 saNrVf+hNX6PoZFNlDw8+lpqVYr1S/S9XCf9k84sT7ya7GWmXH/kUynUiPdiewtQ1W
	 biHvU9MKULbLxegUO22LJ1Y90ZJIxxLv4Mjev+7dEirObDHpyEBELbaqUBXNT/m2cH
	 mnRp/BPuFoDFJzqSN8MqeChSdC+5ppDIAfTlZZOLtk/0tBDCQGttx8kqefBjg5n6Mr
	 9kPzLAsp5eBeg==
Received: by mail-lj1-f171.google.com with SMTP id b26so11696513ljk.12
        for <loongarch@lists.linux.dev>; Tue, 06 Sep 2022 03:16:40 -0700 (PDT)
X-Gm-Message-State: ACgBeo3m8xrekSXci6hLCixC1wHpQ5YIyRpbXb1y8wYtFbRkFFxWMEim
	i7FojT1mRL4fARDv8+UibcQaTwCHeBZBeY+nKcQ=
X-Google-Smtp-Source: AA6agR7bCqtA9wfF/56sHk4Ok8Qx0P49OGcib8dcCcQP+4sW8tVKtZCBaiELe69/YxRifVz8zNZDbFKCayASELZEYKw=
X-Received: by 2002:a2e:9b0e:0:b0:268:cb68:575b with SMTP id
 u14-20020a2e9b0e000000b00268cb68575bmr7059563lji.152.1662459398847; Tue, 06
 Sep 2022 03:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220830104806.128365-1-xry111@xry111.site> <CAAhV-H5bH7xZTWLhqcZ_Bmh=RNaEVBy9523hmj-gTmitqqc8ag@mail.gmail.com>
 <c0ba2e23-5be3-924d-554a-2f10272c05bc@xen0n.name> <CAAhV-H7Dz21qRgwkMcJ0SnA9FNDN19E6mpa7C25LUitrO9LGeA@mail.gmail.com>
 <5b87173faeef587a2ffaaa6f58d34e0940231067.camel@xry111.site>
 <c53303bf-a5d2-098f-8975-efadbe0b2f2e@loongson.cn> <bc323d8578d2f6ec580066bab181788b305ae3c3.camel@xry111.site>
 <CAAhV-H4N_XvmP9KA1M5crU44kHr33MZUVSsMY4Ugu5wQSv_LOQ@mail.gmail.com>
 <97291c0fe5a660c844475ff019c8db6af77ecf86.camel@xry111.site>
 <CAAhV-H6wzw-MV+h225rM4PfK_HY0tAdSXcUG-2Hx+_gfhzQ4_g@mail.gmail.com>
 <ae2652c5e140d407d523d7f35bee672cebe1b7a2.camel@xry111.site>
 <CAAhV-H56TQeU54JjvNQg2qZ6L1aSbzbaM2a=VQr9ZcAn4uthyg@mail.gmail.com>
 <8d0f96e2977c5c78f17bb410087f2aad986ef5a4.camel@xry111.site>
 <CAAhV-H7LjkY+XAzGs2K3544+CGOztCd4V8BuSjMJwZCgfBLDow@mail.gmail.com>
 <CAMj1kXE6YHCVj9DDbxLEZnS-ceZT__xe1XAcUcpXcd6eYb=UEw@mail.gmail.com>
 <CAAhV-H5NT-bq2jb3Kh-5wyCwVeG6t6pkLkPSRRC5XKrC33j1Nw@mail.gmail.com> <CAAhV-H6RqKT0OiVhZqJr9Tts-4JuH-oPNAc66q6fTcqdi7jAQw@mail.gmail.com>
In-Reply-To: <CAAhV-H6RqKT0OiVhZqJr9Tts-4JuH-oPNAc66q6fTcqdi7jAQw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 Sep 2022 12:16:27 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGBevDYDxyb9_gDHLaQneydnXvGkAsPXD3o9kf0-BrNMQ@mail.gmail.com>
Message-ID: <CAMj1kXGBevDYDxyb9_gDHLaQneydnXvGkAsPXD3o9kf0-BrNMQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] LoongArch: Support toolchain with new relocation types
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, Jinyang He <hejinyang@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Youling Tang <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Sept 2022 at 10:59, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Tue, Sep 6, 2022 at 4:20 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > On Tue, Sep 6, 2022 at 3:18 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Tue, 6 Sept 2022 at 06:43, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > >
> > > > Hi, Ruoyao,
> > > >
> > > > On Tue, Sep 6, 2022 at 12:27 PM Xi Ruoyao <xry111@xry111.site> wrote:
> > > > >
> > > > > On Tue, 2022-09-06 at 09:52 +0800, Huacai Chen wrote:
> > > > > > >   cflags-$(CONFIG_LOONGARCH)     := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > > > > > > -                                  -fpic
> > > > > > > +                                  -fpie
> > > > > > >
> > > > > > >   cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
> > > > > > >
> > > > > > > (Some explanation: -fpic does not only mean "generate position-
> > > > > > > independent code", but "generate position-independent code *suitable for
> > > > > > > use in a shared library*".  On LoongArch -mdirect-extern-access cannot
> > > > > > > work for a shared library so the "-fpic -mdirect-extern-access"
> > > > > > > combination is rejected deliberately.)
> > > > > > >
> > > > > > > Not sure how to submit these changes properly...  Do you prefer me to
> > > > > > > send V8 of this series or a single patch on top of your tree on GitHub?
> > > > >
> > > > > > Don't need V8, I will squash it into the previous patch myself. But
> > > > > > can we keep efistub as is?
> > > > >
> > > > > No, we can't allow -mdirect-extern-access -fpic on LoongArch because
> > > > > without copy relocation such a combination just does not make sense (i.
> > > > > e. we cannot find a sensible way to handle such a combination in GCC).
> > > > > So such a combination will cause GCC refuse to run.
> > > > >
> > > > > Note that -fpic/-fPIC is "position-independent code *suitable for
> > > > > use in a shared library*", while -fpie/-fPIE is more like just
> > > > > "position-independent code".  The names of those options are confusing.
> > > > > (When -fpic was invented first time, people mostly believed "PIC had
> > > > > been only for shared libraries", so it's named -fpic instead of -shlib
> > > > > or something.)  IMO in the EFI stub for other ports, -fpie should be
> > > > > used instead of -fpic as well because the EFI stub is not similar to a
> > > > > shared library in any means.
> > > > You are right, but I guess that Ard doesn't want to squash the efistub
> > > > change into the LoongArch efistub support patch. :)
> > > >
> > >
> > > I don't mind changing the stable tag at this point - I don't have
> > > anything queued up on top of it at the moment.
> > >
> > > But I don't see the actual patch: please send me the delta patch that
> > > you want to apply, and I will update it. Then, you can rebase your
> > > v6.1 tree on top of it.
> > OK, Ruoyao, please send a patch to change the efistub cflags. Thank you.
> Oh, I think you needn't send, just showing the diff to Ard is OK. :)
>
> diff --git a/drivers/firmware/efi/libstub/Makefile
> b/drivers/firmware/efi/libstub/Makefile
> index 8931ed24379e..8c1225b92492 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -27,7 +27,7 @@ cflags-$(CONFIG_ARM)          := $(subst
> $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>  cflags-$(CONFIG_RISCV)         := $(subst
> $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>                                    -fpic
>  cflags-$(CONFIG_LOONGARCH)     := $(subst
> $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> -                                  -fpic
> +                                  -fpie
>
>  cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
>

I have merged this into the patch, and updated the tag

efi-loongarch-for-v6.1
ead384d956345681e1ddf97890d5e15ded015f07

It should be in linux-next tomorrow, you can merge the tag now from
git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
