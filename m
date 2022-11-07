Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A917C7
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 04:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D27CC433D6
	for <loongarch@lists.linux.dev>; Mon,  7 Nov 2022 04:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667794184;
	bh=WuEDuUO86BVD/cwR5x/btPKC56I4Iyes6NKNU/IiqFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eQiJeb9dnA/C35yR+/OqFyNEJXBImQFrw1p6jdZEZs525Y2//PPpK/d3mjCfNQ98C
	 UNJwG+7/KFnvHwgSSXPbyHyWxtM+k3b01uNOVH4ast3mPXX4G1sB46Dl1xNTG9lvhs
	 RKA0yV5Nki1/0HwbmnJ7xMhdlxxWOPonAgnJxx1nmyYWGiTSL6iQNUZlrTb887xlUO
	 Rj2I8WrpagIC3chMaJLKnHLfs4XeK4lUaY2hRjb2Dt5YM5JK7d63kSjh9jpr2JspV2
	 vtgsT3PEZFjN40tCy8usNH4pBairZhZ5PY2zb92wLOTDM9CAztKuvi52/hAThIiLJJ
	 9dSxSHTHJ/I4w==
Received: by mail-ed1-f41.google.com with SMTP id a5so15590846edb.11
        for <loongarch@lists.linux.dev>; Sun, 06 Nov 2022 20:09:44 -0800 (PST)
X-Gm-Message-State: ACrzQf1j/z61a4VTBza/DuGDwObS+JmEEwjXQJnTP//DEEr3+tMDQ2Rd
	+pvCUOPbJYje8GaInQiu91vNRiUrDDLABe3bnvw=
X-Google-Smtp-Source: AMsMyM7h+xjIdBVuNqTyX9GU2jkL+OAJfSbH9HZ78rqLU2R8tT42BROCm30F8FaWjnSUOaMRr1+TKtdMKvqBYK5yUJI=
X-Received: by 2002:a05:6402:1d4e:b0:461:c7bd:7d9c with SMTP id
 dz14-20020a0564021d4e00b00461c7bd7d9cmr47905283edb.284.1667794182704; Sun, 06
 Nov 2022 20:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106065619.2543121-1-zhoubinbin@loongson.cn> <5809ae1e16eca3b686e1bfc844a2a4fcf5d1ef85.camel@xry111.site>
In-Reply-To: <5809ae1e16eca3b686e1bfc844a2a4fcf5d1ef85.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 7 Nov 2022 12:09:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4q2SP2ddq=zAiTezTJ5BC+SaC2DQFrPBx_sz4iEZnLug@mail.gmail.com>
Message-ID: <CAAhV-H4q2SP2ddq=zAiTezTJ5BC+SaC2DQFrPBx_sz4iEZnLug@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Support booting with FDT from efi system table
To: Xi Ruoyao <xry111@xry111.site>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jianmin Lv <lvjianmin@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Ruoyao,

On Sun, Nov 6, 2022 at 3:55 PM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Sun, 2022-11-06 at 14:56 +0800, Binbin Zhou wrote:
> > Since commit 40cd01a9c324("efi/loongarch: libstub: remove dependency on
> > flattened DT"), we can parse the FDT from efi system table.
> >
> > And now, the Loongson-2K series cpus based on LoongArch support booting
> > with FDT, so we adds the relevant booting support as well as parameter
> > parsing.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  arch/loongarch/Kconfig             |  2 +
> >  arch/loongarch/include/asm/efi.h   |  1 +
> >  arch/loongarch/include/asm/setup.h |  1 +
> >  arch/loongarch/kernel/efi.c        | 27 ++++++++++-
> >  arch/loongarch/kernel/env.c        |  3 ++
> >  arch/loongarch/kernel/setup.c      | 75 +++++++++++++++++++++++++++++-
> >  6 files changed, 106 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 903096bd87f8..ce53d1fa2b64 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -111,6 +111,8 @@ config LOONGARCH
> >         select MODULES_USE_ELF_RELA if MODULES
> >         select NEED_PER_CPU_EMBED_FIRST_CHUNK
> >         select NEED_PER_CPU_PAGE_FIRST_CHUNK
> > +       select OF
> > +       select OF_EARLY_FLATTREE
>
> I don't like unconditionally enabling OF or OF_EARLY_FLATTREE because
> they are not needed for Loongson-3 workstations or servers.  And you are
> already fusing the code with #ifdef CONFIG_OF_EARLY_FLATTREE anyway:
I also don't like it. But the kernel test robot will use
allyesconfig/allnoconfig/allmodconfig/randconfig to test kernel
building. If we don't select OF unconditionally, there will be a ton
of build errors. :( And on the other hand, ARM64 & RISCV also selects
OF unconditionally.

Huacai
>
> /* snip */
>
> > diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> > index 1eb63fa9bc81..2f578f809a54 100644
> > --- a/arch/loongarch/kernel/setup.c
> > +++ b/arch/loongarch/kernel/setup.c
>
> /* snip */
>
> > +static void __init fdt_setup(void)
> > +{
> > +#ifdef CONFIG_OF_EARLY_FLATTREE
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>
