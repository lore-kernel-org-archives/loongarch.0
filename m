Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055F1DF97D
	for <loongarch@lists.linux.dev>; Mon, 18 Aug 2025 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500726; cv=none; b=D5GeSo57EYEX+zj1m8Lqz0vcDubNmpliWdEm4HZZoJkExcywgw+ertSqNJB14J8dT8jcZBLuDF8JdUpRA1xXocJNdTV8QuX4CZ5255/nO55aQgMCQIe9cCNucQUd5kjiT8MxXVAB03NH1Oq35gthpG4l3nn7trgkU6uYAKAeru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500726; c=relaxed/simple;
	bh=KPGdVAyfVGjLpPGHiZEXgt+sLnzTu05fyS8QQmmQ2i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UB0Alvm7+b2K9qz4LVSsXP/44coVcmpFAgvCm43YqpYqO1uWT6pRBhCgtBegfolCDHIrOuyWQZT42cAVpSEN1WLxCj3nYZzFhqqhrsjF8g0ZZRIw+z5E2C3MMUK/5/T6Yg/noFjhi8x4tmHVNemjGDdiIAUEAoyGXlMQMxLLiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1bfHhpQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1bfHhpQ"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-333f8f0dd71so29705101fa.1
        for <loongarch@lists.linux.dev>; Mon, 18 Aug 2025 00:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755500723; x=1756105523; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHsUL+h4LuU3pP71Ed95ISAuUKi9IsSaBNdtMsfJmNY=;
        b=X1bfHhpQX1aw6nN4s4hz2me7+y3VTo0JEvt95d3ee6BGLFsYQR5RkkNuGPwgTtoX6f
         7XuMfrGtXtkZ2PmqpdDAaPReaBqg6uD6u8lzUX3RmT6UOmQF7ScxwvGBuA8fIEyX8PTH
         EOYRUhq3daO8U+chI35BSwrbdqE2DcBNE3O/eSWgsomerSDqCaxFLUVsclOKt+GCj4BA
         HQWSJNR3yL2Qp/eCjhHbR5IX28Rs1CyjZ5bDwgZeRzgYk6AkopURD7Omz52gkZHZQsvx
         gRqrWhxVJjM9ReKPG+xkGhMo7zqOonxycLhDbKyGsfpcxd/5QrMvjdFG7LvzXwMj9+vN
         vtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500723; x=1756105523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHsUL+h4LuU3pP71Ed95ISAuUKi9IsSaBNdtMsfJmNY=;
        b=kFeIbG43xipC6B5VbLY58WbUygtVMf9C5X5zuXSk7difhXm85FlTRN5cPMW6KMycam
         j2XdHhkbswijuEOb+JAtejX/wRNOEyzQT1rUDBw+NUGnr6W9FGzIldnp4Rn7IsThHlYm
         AQpzs/PlV1z7k8BWQRdUrUoP9Egw8xrLCk0b9q7zQcnfbNVqrr/Byzr28/cMpWtm/RQT
         gG21+P1Pk3uDH80079pvbhlz9lWNumisOOZMAVDjd5ZccIqkp7HqdvqrY/yFNNyDTkhe
         B4PfPrSpfgg+8rIqY5ag9+uwmemTtTjjuN1Fd4AN5vsHva9NRkzzhcWtGpKx/pOKxUnI
         n7kA==
X-Forwarded-Encrypted: i=1; AJvYcCU+cv5k9UW1FRcVF98e02IOZHKfmAm9wkaoZ0VhqVvKGkUDksdWe03ZmffBT78U6gIbgn8FlwQbrQk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSF4fnLEc/bo5kxIzAbEdHnYwkqZo+j4pfYive70g1h9O54zkz
	ykCWR6Ce+ymbgpa2RNe+eFw9Ipgju530b36u9RY38Lnuri7+wdl5GTkwHqZBANjsJr7Vh5YZe94
	MOvWF/qYY54nB237gQACJ8PjUzKAArmg=
X-Gm-Gg: ASbGncuv4ieiW9fL46KAbkHXDmP7l6ffXQ14ToXXol+sko3hwwqPg6D263/KrpfpnJ9
	aOOjtPdHYvs+Zlq4tF4RHKWswEtoEaNpr+M8hWM7E+/VDncGaQzdeF083k0kCa4omT6Hi+WlBBr
	jibhRohxp5g9F9rLU3xIbaKswr8wGxmidXBa12pr7BKWr5FNcc/2NlcXLE8byH6ZkjM31tdhwnK
	i4ToXge1pQVqN1kiUM=
X-Google-Smtp-Source: AGHT+IFDuj56cYERGjPW+9wF7giB825tHomm1ZeTAk7dFt2+UOIIfPhfXqYy7W0LA7hF9aJ4nHmDoU+yiw145vgY7yo=
X-Received: by 2002:a05:651c:20cc:20b0:332:612b:6f49 with SMTP id
 38308e7fff4ca-33412c91ef0mr13268441fa.29.1755500722327; Mon, 18 Aug 2025
 00:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <47545b7ed4943a088b27021a0fdbeaf56947e833.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H4h5qZ8gCjoKMKd8wBYG+secmTrHdo+AY1A60rmhKrCoQ@mail.gmail.com> <CAMpQs4JgvCCxgNhmQ7XPHZ9HHohFW69vO7D6mpbBb3Q16u78ag@mail.gmail.com>
In-Reply-To: <CAMpQs4JgvCCxgNhmQ7XPHZ9HHohFW69vO7D6mpbBb3Q16u78ag@mail.gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 18 Aug 2025 15:04:44 +0800
X-Gm-Features: Ac12FXy8IgHpqnLhbDZ9zWhgCTvDjrg_nDf6Gd34HT-rNlcS5yYHJjBmchXh0JY
Message-ID: <CAJhJPsU+dVmnBnHgnNDL0Zro_KYN12c7+pw=720ju-w7veegMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] mtd: rawnand: loongson: Rename loongson1 to loongson
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:42=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.com=
> wrote:
>
> Hi Huacai:
>
> Thanks for your reply.
>
> On Mon, Aug 11, 2025 at 2:36=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Binbin,
> >
> > On Mon, Aug 11, 2025 at 2:02=E2=80=AFPM Binbin Zhou <zhoubinbin@loongso=
n.cn> wrote:
> > >
> > > The second step in preparing to add Loongson-2K support is to change =
the
> > > names of the driver files and Kconfig options from Loongson1-specific=
 to
> > > Loongson-generic.
> > Is it possible to merge the first two patches? If not, it is better to
> > use loongson1 rather than loongson in the subject line of this patch.
>
> At first, I thought that separating the renaming of file prefixes from
> the renaming of file names would make the changes clearer. Another
> point is whether renaming Kconfig items would be considered API
> breaking, even though no one is currently referencing them?
>
> Of course, if anyone thinks that separating them is unnecessary, I
> will merge them in the next version.

It=E2=80=99s reasonable to merge the first two patches.
I agree.

> >
> > Huacai
> >
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  MAINTAINERS                                                 | 2 +-
> > >  drivers/mtd/nand/raw/Kconfig                                | 6 +++-=
--
> > >  drivers/mtd/nand/raw/Makefile                               | 2 +-
> > >  ...ongson1-nand-controller.c =3D> loongson-nand-controller.c} | 0
> > >  4 files changed, 5 insertions(+), 5 deletions(-)
> > >  rename drivers/mtd/nand/raw/{loongson1-nand-controller.c =3D> loongs=
on-nand-controller.c} (100%)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 4bac4ea21b64..cc502582c9f1 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16722,7 +16722,7 @@ F:      Documentation/devicetree/bindings/*/l=
oongson,ls1*.yaml
> > >  F:     arch/mips/include/asm/mach-loongson32/
> > >  F:     arch/mips/loongson32/
> > >  F:     drivers/*/*loongson1*
> > > -F:     drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > +F:     drivers/mtd/nand/raw/loongson-nand-controller.c
> > >  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> > >  F:     sound/soc/loongson/loongson1_ac97.c
> > >
> > > diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kcon=
fig
> > > index 4b99d9c422c3..d9e3f13666ac 100644
> > > --- a/drivers/mtd/nand/raw/Kconfig
> > > +++ b/drivers/mtd/nand/raw/Kconfig
> > > @@ -462,12 +462,12 @@ config MTD_NAND_NUVOTON_MA35
> > >           Enables support for the NAND controller found on
> > >           the Nuvoton MA35 series SoCs.
> > >
> > > -config MTD_NAND_LOONGSON1
> > > -       tristate "Loongson1 NAND controller"
> > > +config MTD_NAND_LOONGSON
> > > +       tristate "Loongson NAND controller"
> > >         depends on LOONGSON1_APB_DMA || COMPILE_TEST
> > >         select REGMAP_MMIO
> > >         help
> > > -         Enables support for NAND controller on Loongson1 SoCs.
> > > +         Enables support for NAND controller on Loongson family chip=
s.
> > >
> > >  comment "Misc"
> > >
> > > diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Mak=
efile
> > > index 711d043ad4f8..c182b9703a9e 100644
> > > --- a/drivers/mtd/nand/raw/Makefile
> > > +++ b/drivers/mtd/nand/raw/Makefile
> > > @@ -59,7 +59,7 @@ obj-$(CONFIG_MTD_NAND_ROCKCHIP)               +=3D =
rockchip-nand-controller.o
> > >  obj-$(CONFIG_MTD_NAND_PL35X)           +=3D pl35x-nand-controller.o
> > >  obj-$(CONFIG_MTD_NAND_RENESAS)         +=3D renesas-nand-controller.=
o
> > >  obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)    +=3D nuvoton-ma35d1-nand-cont=
roller.o
> > > -obj-$(CONFIG_MTD_NAND_LOONGSON1)       +=3D loongson1-nand-controlle=
r.o
> > > +obj-$(CONFIG_MTD_NAND_LOONGSON)                +=3D loongson-nand-co=
ntroller.o
> > >
> > >  nand-objs :=3D nand_base.o nand_legacy.o nand_bbt.o nand_timings.o n=
and_ids.o
> > >  nand-objs +=3D nand_onfi.o
> > > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drive=
rs/mtd/nand/raw/loongson-nand-controller.c
> > > similarity index 100%
> > > rename from drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > rename to drivers/mtd/nand/raw/loongson-nand-controller.c
> > > --
> > > 2.47.3
> > >
> > >
>
> --
> Thanks.
> Binbin



--
Best regards,

Keguang Zhang
