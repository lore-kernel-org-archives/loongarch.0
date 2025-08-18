Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF40626E701
	for <loongarch@lists.linux.dev>; Mon, 18 Aug 2025 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510059; cv=none; b=kSHJGQCs8p985uBh5T/1DL/qH8FNTcgA15dzqUBGyqACnTVcR1opG6NaNbtWUDz8BYs7xn0BUEOeMb0OruUJOOMjaDc1gFyhfHfgfHascIsfYN24JbE4BRpOG4fjVWXAVanWDod+K/w/Z75BVaIVbMuel8H7ThFBhv5rY/T3IBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510059; c=relaxed/simple;
	bh=hcd/LXE3tq0FmZwKYylrYTmoPz8yAtARoiR/DV8P020=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQz/1fu4ysoZP1jBlg280tpbxAr084mhnadayKhJbeUUfk2GjdraUSLUvLWdQmXuNMhFktKcEVZYtqQ/aHzawLxxxLNktU28KZMFmq580qe/gGnRoDkh8ZtiFQIK85VBqk6oDW6B76UlC6jsriAPtUCugJuB8RvYBcbG7uKfhl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsr0dNJi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsr0dNJi"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-619487c8865so2499478a12.1
        for <loongarch@lists.linux.dev>; Mon, 18 Aug 2025 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755510056; x=1756114856; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOJjRWVOPzxNZaP1qKl5T6uQXMq+ZN2NpLXOIkGXeu8=;
        b=Gsr0dNJiK/f6YF8o/8y2aqNq7ir5qeTFK4Hu/DT7i+YZDWNOm/Qc3XaPG0uknTEvd4
         m4ntv6zwgBo9vEilbGtf16i50QaWaxNe2QFH9Irr9p3dGBdPdwn26e5kpZqD4RX+FUWE
         TThrfv58q0De/DW1EV7/nci34EgsUo5tZv9ajXAQOhyfiG64gdj3y+ulcI7A9lQqNnDX
         WK+jZyB41NysohhHjj+5cNr1psfsL6l1JpoO+Why0N8zHB+MTMGKDCEBkc3aluXHLTUn
         dZ0tl6qK48KsfCcKY66cbJyY114M8NQWIE2kE4MIsPuQfKw+gJOEidQSMciT50SE7kNz
         orkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510056; x=1756114856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOJjRWVOPzxNZaP1qKl5T6uQXMq+ZN2NpLXOIkGXeu8=;
        b=Lc7HqJjHkWI5U5e7pro6SMpn5mW7Li2A6fS7erP4fu17D5VUarcs2NPrVdDgLIXzlU
         3AKXooH8HttnLkLGH6cJaCAzXceYEpCcefiewFKI5MBAy3s8GRHmk5RLdFtuMmttgB9f
         Mg7vDVM1jssXZP/a5zcL7AmDNa/lJxK6K+64RA86V3N5LpT3V5pbROKkPNRXAj+d4iHI
         p6GKYyKe37h/5zoJoQiwAIWVoXKYErQUDCmZo9IMGPRgXDNvvrCcjtKk40fQS2rUUhmM
         QVpnUL0iXCm5b6MWcHj6n5KivOXbmyXYnNEEWl+gDKPwLvH8091AT9tV1rPkR+iqKYEO
         03kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2GoNLPwP0ReFbtK1EOD7BNrg7OVjmvOqTIPEr4V3KqnC1M+VLg9zF+Uc1x1fT3m/jLkw7OmrErtg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzML7EQ9HMeYcztHZ3hvfTR3vnPzUJ5IT95EW0lNdczIUEfCrS3
	0y8XMoFq4xClc9EtEFz7+7VPFnHc2t5TmyLjxFayOMnN+8k5DqsHOFhxDA0DnzfAa+acpmflYtC
	/DXJJlGwvKx3l59ALwvNRvxG2s6BquXtQ8TTC
X-Gm-Gg: ASbGncuS2nXFk/7ha2OpeorGLzuc0QCHljRJ1l47/HS9eQ/yYltfiJtItjXz4VK2tvG
	uBO1KybTSgLsYyZQKHwv5eVcnyQ6y6hoUKo6WaDSN04XJUAttXZQ/DI9eYVmD3E3VnCvkWejsSF
	EJWdPbYH9zjBvjXxzIXbHsiWIF94I5cvc7BBzj4uL0zKynTZgfAF1sg3v6XzlNPR4o/RmlYzxQc
	vMJiAWYhHAiLtUHGw==
X-Google-Smtp-Source: AGHT+IHp0UmWW2UaLhVJaYIR0yqe8Dam+rKGh2pWLy+njoco3WlqsBW5kQ+Ttg039INaMvj9jU9P+8OKwR3mwdhpHhs=
X-Received: by 2002:a17:907:72d2:b0:af9:3f53:ed1d with SMTP id
 a640c23a62f3a-afcdb273236mr1142406066b.16.1755510055999; Mon, 18 Aug 2025
 02:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com>
 <CAMpQs4JgvCCxgNhmQ7XPHZ9HHohFW69vO7D6mpbBb3Q16u78ag@mail.gmail.com> <CAJhJPsU+dVmnBnHgnNDL0Zro_KYN12c7+pw=720ju-w7veegMQ@mail.gmail.com>
In-Reply-To: <CAJhJPsU+dVmnBnHgnNDL0Zro_KYN12c7+pw=720ju-w7veegMQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 18 Aug 2025 17:40:43 +0800
X-Gm-Features: Ac12FXw16I7aogqr-1UaRJJv6IlheqoNzx6yaN68YbS9d6fLFkQRWBbtKitkvQ8
Message-ID: <CAMpQs4+smqstrmcReOYXtyJvgTdu=Yit8_Kq3kMdM=rM6ENKag@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Keguang:

Thanks for your reply.

On Mon, Aug 18, 2025 at 3:05=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail.=
com> wrote:
>
> On Mon, Aug 11, 2025 at 5:42=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.c=
om> wrote:
> >
> > Hi Huacai:
> >
> > Thanks for your reply.
> >
> > On Mon, Aug 11, 2025 at 2:36=E2=80=AFPM Huacai Chen <chenhuacai@kernel.=
org> wrote:
> > >
> > > Hi, Binbin,
> > >
> > > On Mon, Aug 11, 2025 at 2:02=E2=80=AFPM Binbin Zhou <zhoubinbin@loong=
son.cn> wrote:
> > > >
> > > > The second step in preparing to add Loongson-2K support is to chang=
e the
> > > > names of the driver files and Kconfig options from Loongson1-specif=
ic to
> > > > Loongson-generic.
> > > Is it possible to merge the first two patches? If not, it is better t=
o
> > > use loongson1 rather than loongson in the subject line of this patch.
> >
> > At first, I thought that separating the renaming of file prefixes from
> > the renaming of file names would make the changes clearer. Another
> > point is whether renaming Kconfig items would be considered API
> > breaking, even though no one is currently referencing them?
> >
> > Of course, if anyone thinks that separating them is unnecessary, I
> > will merge them in the next version.
>
> It=E2=80=99s reasonable to merge the first two patches.
> I agree.

OK. I will do it in the next version.
>
> > >
> > > Huacai
> > >
> > > >
> > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > ---
> > > >  MAINTAINERS                                                 | 2 +-
> > > >  drivers/mtd/nand/raw/Kconfig                                | 6 ++=
+---
> > > >  drivers/mtd/nand/raw/Makefile                               | 2 +-
> > > >  ...ongson1-nand-controller.c =3D> loongson-nand-controller.c} | 0
> > > >  4 files changed, 5 insertions(+), 5 deletions(-)
> > > >  rename drivers/mtd/nand/raw/{loongson1-nand-controller.c =3D> loon=
gson-nand-controller.c} (100%)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 4bac4ea21b64..cc502582c9f1 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -16722,7 +16722,7 @@ F:      Documentation/devicetree/bindings/*=
/loongson,ls1*.yaml
> > > >  F:     arch/mips/include/asm/mach-loongson32/
> > > >  F:     arch/mips/loongson32/
> > > >  F:     drivers/*/*loongson1*
> > > > -F:     drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > +F:     drivers/mtd/nand/raw/loongson-nand-controller.c
> > > >  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> > > >  F:     sound/soc/loongson/loongson1_ac97.c
> > > >
> > > > diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kc=
onfig
> > > > index 4b99d9c422c3..d9e3f13666ac 100644
> > > > --- a/drivers/mtd/nand/raw/Kconfig
> > > > +++ b/drivers/mtd/nand/raw/Kconfig
> > > > @@ -462,12 +462,12 @@ config MTD_NAND_NUVOTON_MA35
> > > >           Enables support for the NAND controller found on
> > > >           the Nuvoton MA35 series SoCs.
> > > >
> > > > -config MTD_NAND_LOONGSON1
> > > > -       tristate "Loongson1 NAND controller"
> > > > +config MTD_NAND_LOONGSON
> > > > +       tristate "Loongson NAND controller"
> > > >         depends on LOONGSON1_APB_DMA || COMPILE_TEST
> > > >         select REGMAP_MMIO
> > > >         help
> > > > -         Enables support for NAND controller on Loongson1 SoCs.
> > > > +         Enables support for NAND controller on Loongson family ch=
ips.
> > > >
> > > >  comment "Misc"
> > > >
> > > > diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/M=
akefile
> > > > index 711d043ad4f8..c182b9703a9e 100644
> > > > --- a/drivers/mtd/nand/raw/Makefile
> > > > +++ b/drivers/mtd/nand/raw/Makefile
> > > > @@ -59,7 +59,7 @@ obj-$(CONFIG_MTD_NAND_ROCKCHIP)               +=
=3D rockchip-nand-controller.o
> > > >  obj-$(CONFIG_MTD_NAND_PL35X)           +=3D pl35x-nand-controller.=
o
> > > >  obj-$(CONFIG_MTD_NAND_RENESAS)         +=3D renesas-nand-controlle=
r.o
> > > >  obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)    +=3D nuvoton-ma35d1-nand-co=
ntroller.o
> > > > -obj-$(CONFIG_MTD_NAND_LOONGSON1)       +=3D loongson1-nand-control=
ler.o
> > > > +obj-$(CONFIG_MTD_NAND_LOONGSON)                +=3D loongson-nand-=
controller.o
> > > >
> > > >  nand-objs :=3D nand_base.o nand_legacy.o nand_bbt.o nand_timings.o=
 nand_ids.o
> > > >  nand-objs +=3D nand_onfi.o
> > > > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/dri=
vers/mtd/nand/raw/loongson-nand-controller.c
> > > > similarity index 100%
> > > > rename from drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > rename to drivers/mtd/nand/raw/loongson-nand-controller.c
> > > > --
> > > > 2.47.3
> > > >
> > > >
> >
> > --
> > Thanks.
> > Binbin
>
>
>
> --
> Best regards,
>
> Keguang Zhang


--=20
Thanks.
Binbin
