Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4BD7E4
	for <loongarch@lists.linux.dev>; Mon, 19 Sep 2022 06:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CE5C43140
	for <loongarch@lists.linux.dev>; Mon, 19 Sep 2022 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663569231;
	bh=qHWL4WdATNWAwk72mOr/16q6SJQs7sObRP3fl7UD6ig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GQ+RjgNs2DAFl7f7Pjr8b3giPjbus1Cx0XX+FkvZWiW+LoByaRZOtf42S7zLT3+5t
	 UTaH/HPHKhcZ7EsZKzBakpre4/+J3mcPlZCrvxv+A89N3CVAymtJ40guD0CUalrPHF
	 H17yVbxKtjEkdYq4WQs/SGtnC9j5fBz+Vrhn2mxKyK3tREDlWDZhuaQDLep6b2k5rv
	 vGPBsrqioS1o1cBKWGyACecVuH/vATTM7Znl4gPIMRnWiXPNNrMcbBcunos1+IfqfV
	 5GEuLGO6sj7oi8nXRwJa7E3e3gvovhx2ozmEt4dV2lGHtspG4SBe19CuL+zLUnt4xS
	 Mwxv2FnPwQ1Zw==
Received: by mail-lf1-f50.google.com with SMTP id i26so45335064lfp.11
        for <loongarch@lists.linux.dev>; Sun, 18 Sep 2022 23:33:51 -0700 (PDT)
X-Gm-Message-State: ACrzQf0aBmpSab1ZpPefUTkPqtXR2mPhU6mN9waTzKCRiNSyE4H40O6m
	HbA5Ur1eo3KVCFFKz5sxtz1qjxjVLbpZyPVNj5c=
X-Google-Smtp-Source: AMsMyM52yUt+ycJ0Ymsf2uNStsk+t/EEB9h3cAygM0MYTXeJ23B5gqMk5C8dokb4SG12lH2g7tY3h4LDMo26bOydXnM=
X-Received: by 2002:a05:6512:150e:b0:492:d9fd:9bdf with SMTP id
 bq14-20020a056512150e00b00492d9fd9bdfmr5398289lfb.583.1663569229022; Sun, 18
 Sep 2022 23:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220918213544.2176249-1-ardb@kernel.org> <20220918213544.2176249-12-ardb@kernel.org>
 <CAAhV-H6Ke88sirvX9ut7JLWy+xaERZ7BeMEf97WHRWbsLqZC0A@mail.gmail.com>
 <CAMj1kXHuQHuCt9Z=qWRH_aZY5_+LzpicyE=agMyAX+O14khL_g@mail.gmail.com>
 <CAAhV-H7-JFwcwz5pBt7WZxJ2CkeUvc07OLgWxB9z-QTkr=njWw@mail.gmail.com> <CAMj1kXFKmvSt1092xBUHVXf9NxDFDSDyPDNpwfGUKWGWAPAE9Q@mail.gmail.com>
In-Reply-To: <CAMj1kXFKmvSt1092xBUHVXf9NxDFDSDyPDNpwfGUKWGWAPAE9Q@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 19 Sep 2022 08:33:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHvAahn9kMvazoA=Zn6c7047zUP7zju6BEeMeATFORXEA@mail.gmail.com>
Message-ID: <CAMj1kXHvAahn9kMvazoA=Zn6c7047zUP7zju6BEeMeATFORXEA@mail.gmail.com>
Subject: Re: [PATCH 11/12] efi/loongarch: libstub: remove dependency on
 flattened DT
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-efi <linux-efi@vger.kernel.org>, loongarch@lists.linux.dev, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Sept 2022 at 08:22, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 19 Sept 2022 at 08:06, Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> >  Hi, Ard,
> >
> > On Mon, Sep 19, 2022 at 1:15 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Mon, 19 Sept 2022 at 03:58, Huacai Chen <chenhuacai@kernel.org> wrote:
> > > >
> > > > Hi, Ard,
> > > >
> > > > I think the parameters passed to the core kernel need to be discussed.
> > > > The old way (so-called old world):
> > > > a0=argc, a1=argv, a1=bpi
> > > >
> > > > The current way (so-called new world):
> > > > a0=efi boot flag, a1=fdt pointer
> > > >
> > > > The new way (in this patchset):
> > > > a0=efi boot flag, a1=systemtable, a2=cmdline
> > > >
> > > > I prefer to use the current way, there are 3 reasons:
> > > > 1, both acpi system and dt system can use the same parameters passing method;
> > >
> > > DT systems will use this too. The distinction is between EFI boot and
> > > non-EFI boot. We *really* should keep these separate, given the
> > > experience on ARM, where other projects invent ways to pass those
> > > values to the kernel without going through the stub.
> > In the last patch I see:
> > +               void *fdt_ptr = early_memremap_ro(fw_arg1, SZ_64K);
> > +
> > +               early_init_dt_scan(fdt_ptr);
> > +               early_init_fdt_reserve_self();
> > +
> >                 clear_bit(EFI_BOOT, &efi.flags);
> > So I suppose for the DT system that means a0=efi boot flag, a1=fdt
> > pointer, a2=cmdline? Then it is not exactly the same as the ACPI
> > system, but similar.
> >
>
> No, for non-EFI DT boot, the command line is passed via the DT, so
> a0=0x0 (non-efi), a1=DT, a2=0x0
>
> Do you intend to support non-EFI DT boot by the way?
>
> So
>
> a2  != 0x0 means old world
> a0 != 0x0 means EFI boot, a1 is the command line
> a0 == 0x0 means !EFI boot, a1 is the DT
>

Note: the above applies if we decide to merge the EFI boolean and the
system table pointer into register #0.
