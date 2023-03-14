Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE57320A
	for <loongarch@lists.linux.dev>; Tue, 14 Mar 2023 11:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2F9C43445
	for <loongarch@lists.linux.dev>; Tue, 14 Mar 2023 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678792136;
	bh=OA6KR2crzzzR9Ukx7n2CH23lqKjV+m4N692TlNZxihc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lpcFJONiPnzvetcJup+PpheaviAfR+fwRf2AXvXeg9m1IJmIreSsT6M3tDiONV7uI
	 bxOo4y0bNpqN6H56oPrWAiLIS07cnLFwIKNMCQ65e3qi38S7qEGfH+S2f+gswXG9zo
	 GDxL3sdve00xCVwMuC5e1+A3t+yQaKgwTOApHESKvNXSr9+0nKGXlXaLdeDo/ZjbN4
	 JCOQj8jk+iJA8iI4m6qLXAIQ3o0FF4RC+IIhxqb6e2k3Jaq6SUY5hCxusBsalyNqQG
	 Rcz420vhDSSBReQPOoaOKvKnSoKYMwYbR2eSierwXa4oVPmVtOnuNHAAuZa39mBhc4
	 Z2Uoe0CE++CWg==
Received: by mail-ed1-f48.google.com with SMTP id cy23so60247352edb.12
        for <loongarch@lists.linux.dev>; Tue, 14 Mar 2023 04:08:56 -0700 (PDT)
X-Gm-Message-State: AO0yUKU5NiryoWJQ7twivyTOmxeaVwHNB5IUgdqU7upJWFHxX0jordfn
	ye5A4+E+vh6dSZqrtdMsiYIGmmHW5pdHZGD7arM=
X-Google-Smtp-Source: AK7set+2Yx/9604mwX187ROYtJW0as0er0LBAbwEa+eOI1tHp2PW1Kup/ysGLIb+GaaHOQaCAfjJKThiHyLqI6OHUi8=
X-Received: by 2002:a50:99d6:0:b0:4fc:f0b8:7da0 with SMTP id
 n22-20020a5099d6000000b004fcf0b87da0mr2969704edb.1.1678792134759; Tue, 14 Mar
 2023 04:08:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230314085433.4078119-1-chenhuacai@loongson.cn>
 <21f5aba50b7732b48d2610a5015186adf6bdfb38.camel@xry111.site>
 <CAAhV-H4TpQuq9sE2H=zbO8cvwn3Aer_pu1a-DU9L9OSR1bQX=g@mail.gmail.com> <939c8d17-6166-0c9b-6c58-6d49fd89841f@xen0n.name>
In-Reply-To: <939c8d17-6166-0c9b-6c58-6d49fd89841f@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 14 Mar 2023 19:08:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H67z6QJO6L=Z6O=2Ywmt01iWSSa66E3xNKCAa3UPRxs9g@mail.gmail.com>
Message-ID: <CAAhV-H67z6QJO6L=Z6O=2Ywmt01iWSSa66E3xNKCAa3UPRxs9g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Make WriteCombine configurable for ioremap()
To: WANG Xuerui <kernel@xen0n.name>
Cc: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@loongson.cn>, 
	loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 6:12=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 2023/3/14 18:02, Huacai Chen wrote:
> > Hi, Ruoyao,
> >
> > On Tue, Mar 14, 2023 at 5:41=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> =
wrote:
> >>
> >> On Tue, 2023-03-14 at 16:54 +0800, Huacai Chen wrote:
> >>> LoongArch maintains cache coherency in hardware, but when works with
> >>> LS7A chipsets the WUC attribute (Weak-ordered UnCached, which is simi=
lar
> >>> to WriteCombine) is out of the scope of cache coherency machanism for
> >>> PCIe devices (this is a PCIe protocol violation, may be fixed in newe=
r
> >>> chipsets).
> >>
> >> IIUC all launched LS7A models (7A1000 and 7A2000) suffers this issue?
> > Yes, very unfortunately, but this issue is only observed in the amdgpu
> > driver now.
>
> It's PCIe protocol violation after all, and we can never be sure about
> the vast amount of hardware untested on loongarch after all. Miserable
> as the performance hit may get, we don't really have another choice,
> unfortunately. Someone needs to lecture the LS7A team real hard!
>
> >>
> >>> This means WUC can only used for write-only memory regions now, so th=
is
> >>> option is disabled by default (means WUC falls back to SUC for iorema=
p).
> >>> You can enable this option if the kernel is ensured to run on bug-fre=
e
> >>> hardwares.
> >>
> >> Hmm, is it possible to make a PCI quirk so SUC/WUC will be decided
> >> automatically from the vendor:device ID of the PCI root controller?
> >> Then we don't need to rely on the user or distro maintainer to select =
an
> >> option.  I see there is already many architecture-dependant #if
> >> directives in drivers/pci/quirks.c so I guess such a quirk is acceptab=
le
> >> in PCI tree...
> > Not a good idea, pci quirks need too long a time to review, and we
> > don't know when this issue can be fixed in hardware.
> >
> >>
> >> If a PCI quirk is not possible, then is it possible to make a kernel
> >> command line option, leaving this CONFIG as the default value of the
> >> option?  I guess in the future many LoongArch users will just install =
a
> >> binary distro, then it would be much easier to edit grub.cfg than
> >> rebuilding the kernel when they finally buy a compliant PCIe controlle=
r.
> > If we use command line parameter, we can remove this Kconfig option.
>
> An option is still useful as specifying the compile-time default for
> such a kernel parameter, IMO.
I will update commit messages and add a kernel parameter, thanks.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
