Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380417CF
	for <loongarch@lists.linux.dev>; Thu, 16 Mar 2023 06:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFF0C433A0
	for <loongarch@lists.linux.dev>; Thu, 16 Mar 2023 06:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678949074;
	bh=zvFS/TOEtTKsNwP/ItqTiW4JqItHaOELI4VfvcYkdd4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mDfAH1RTXGjbg2DUabptTUcWiwz/QpN33/9hLQSjOhGncvmBS9oN9KTn2b7xS2d+e
	 mm2u48dafzCTYrAvO4/6J6GNC2gKDHbW6rmlFsJTvGOYbRRekSt+4/uFpgoJlFIiC+
	 punfCc1yltiQHMdPbTifG/aFIqLOe4VqNy6udtqJS504YoV7kVcctB2niYh6yN4HrE
	 dYU19yW1Hlm3LLERE6HN7jp7QzkUiORv2mKAYAtorlJPI27k+YPTkDd/FCiXEUk3jc
	 lyEKbIrdsChbFFCEqprhVd8rYP6mkVaMEZkG7FDkqaBmxXR+TREO2LfIyWByd3xgyU
	 +o8nSWIeRReDw==
Received: by mail-ed1-f48.google.com with SMTP id x13so3596633edd.1
        for <loongarch@lists.linux.dev>; Wed, 15 Mar 2023 23:44:34 -0700 (PDT)
X-Gm-Message-State: AO0yUKUbB+LVQUTxz/EPhp4FntWCPfVAPRwCSld0Q14AlUT1O/F4qOd4
	zjo9ZMzlHWPF9PRMjxdpQuscoTmBEGE3Fn2m4kI=
X-Google-Smtp-Source: AK7set/3r9MbasK5iZa7pkJUSbBg7QBMBsvXOQ4aVZXVRW+dTmrQt7ksO0X7zYgS+zKDFLAFzm1h+1GTkXb5jqB7TCY=
X-Received: by 2002:a17:906:9f03:b0:92f:fbac:7a69 with SMTP id
 fy3-20020a1709069f0300b0092ffbac7a69mr1135461ejc.10.1678949072749; Wed, 15
 Mar 2023 23:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230315085314.1083141-1-chenhuacai@loongson.cn> <545d8512-5bc1-5c76-246a-fcad529006a4@xen0n.name>
In-Reply-To: <545d8512-5bc1-5c76-246a-fcad529006a4@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 16 Mar 2023 14:44:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H73ew1MouBjNQouOWtcrmqh3vcRyCbW=EUu_P_3wuhR-A@mail.gmail.com>
Message-ID: <CAAhV-H73ew1MouBjNQouOWtcrmqh3vcRyCbW=EUu_P_3wuhR-A@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Make WriteCombine configurable for ioremap()
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, V4 is coming.

Huacai

On Thu, Mar 16, 2023 at 12:35=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wr=
ote:
>
> On 3/15/23 16:53, Huacai Chen wrote:
> > LoongArch maintains cache coherency in hardware, but when paired with
> > LS7A chipsets the WUC attribute (Weak-ordered UnCached, which is simila=
r
> > to WriteCombine) is out of the scope of cache coherency machanism for
> > PCIe devices (this is a PCIe protocol violation, which may be fixed in
> > newer chipsets).
> >
> > This means WUC can only used for write-only memory regions now, so this
> "can only be used for". Same for the Kconfig change.
> > option is disabled by default, making WUC silently fallback to SUC for
> > ioremap(). You can enable this option if the kernel is ensured to run o=
n
> > hardware without this bug.
> >
> > Kernel parameter writecombine=3Don/off can be used to override the Kcon=
fig
> > option.
> We normally want to document this in
> Documentation/admin-guide/kernel-parameters too. This can be done later
> (by you or me).
> >
> > Suggested-by: WANG Xuerui <kernel@xen0n.name>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> > V2: Add kernel prameter and update commit messages.
> > V3: Add a warning message for invalid kernel parameters.
> >
> >   arch/loongarch/Kconfig          | 16 ++++++++++++++++
> >   arch/loongarch/include/asm/io.h |  4 +++-
> >   arch/loongarch/kernel/setup.c   | 21 +++++++++++++++++++++
> >   3 files changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 7fd51257e0ed..3ddde336e6a5 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -447,6 +447,22 @@ config ARCH_IOREMAP
> >         protection support. However, you can enable LoongArch DMW-based
> >         ioremap() for better performance.
> >
> > +config ARCH_WRITECOMBINE
> > +     bool "Enable WriteCombine (WUC) for ioremap()"
> > +     help
> > +       LoongArch maintains cache coherency in hardware, but when paire=
d
> > +       with LS7A chipsets the WUC attribute (Weak-ordered UnCached, wh=
ich
> > +       is similar to WriteCombine) is out of the scope of cache cohere=
ncy
> > +       machanism for PCIe devices (this is a PCIe protocol violation, =
which
> > +       may be fixed in newer chipsets).
> > +
> > +       This means WUC can only used for write-only memory regions now,=
 so
> > +       this option is disabled by default, making WUC silently fallbac=
k to
> > +       SUC for ioremap(). You can enable this option if the kernel is =
ensured
> > +       to run on hardware without this bug.
> > +
> > +       You can override this setting via writecombine=3Don/off boot pa=
rameter.
> via the ...
> > +
> >   config ARCH_STRICT_ALIGN
> >       bool "Enable -mstrict-align to prevent unaligned accesses" if EXP=
ERT
> >       default y
> > diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/a=
sm/io.h
> > index 402a7d9e3a53..545e2708fbf7 100644
> > --- a/arch/loongarch/include/asm/io.h
> > +++ b/arch/loongarch/include/asm/io.h
> > @@ -54,8 +54,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t=
 offset, unsigned long size,
> >    * @offset:    bus address of the memory
> >    * @size:      size of the resource to map
> >    */
> > +extern pgprot_t pgprot_wc;
> > +
> >   #define ioremap_wc(offset, size)    \
> > -     ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL_WUC))
> > +     ioremap_prot((offset), (size), pgprot_val(pgprot_wc))
> >
> >   #define ioremap_cache(offset, size) \
> >       ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL))
> > diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setu=
p.c
> > index bae84ccf6d36..27f71f9531e1 100644
> > --- a/arch/loongarch/kernel/setup.c
> > +++ b/arch/loongarch/kernel/setup.c
> > @@ -160,6 +160,27 @@ static void __init smbios_parse(void)
> >       dmi_walk(find_tokens, NULL);
> >   }
> >
> > +#ifdef CONFIG_ARCH_WRITECOMBINE
> > +pgprot_t pgprot_wc =3D PAGE_KERNEL_WUC;
> > +#else
> > +pgprot_t pgprot_wc =3D PAGE_KERNEL_SUC;
> > +#endif
> > +
> > +EXPORT_SYMBOL(pgprot_wc);
> > +
> > +static int __init setup_writecombine(char *p)
> > +{
> > +     if (!strcmp(p, "on"))
> > +             pgprot_wc =3D PAGE_KERNEL_WUC;
> > +     else if (!strcmp(p, "off"))
> > +             pgprot_wc =3D PAGE_KERNEL_SUC;
> > +     else
> > +             pr_warn("Unknown writecombine setting \"%s\".\n", p);
> > +
> > +     return 0;
> > +}
> > +early_param("writecombine", setup_writecombine);
> > +
> >   static int usermem __initdata;
> >
> >   static int __init early_parse_mem(char *p)
>
> With the nits addressed:
>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
>
