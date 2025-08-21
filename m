Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3227EFF1
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760455; cv=none; b=VpJOIs3u6AVQM4S1OLauFaMO6fBLOAxc7oTQBt+9+qnwspYMKb4b3G/aj+p1ztMDd8FItHL/FccHQmHWR34GSriTIaFFm7/0rsJf3aqgmKYnYcKatpFJfMFS5Rw7+Jo6ajbfYNVGhLDxbJYEJ0M7Yo20duHCg9MaE7Q5oD8jFZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760455; c=relaxed/simple;
	bh=n1Y2BGuH7iKG2GvW4qBG7ldoRWZvuNsMPhdicKLieQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMCt2UDTcjVMc319pL4wXVpSnoooVBDxD8PANk0FWYKnIneo+D0fKXo5yJJnsJ7yMv3ccLAhuafJOjXpcDJNYWP9ZkVUNRRUT277qnA4XjNJw7c8xQ1RutXGmrtpKNJ7jklDDeq/4a6WU/E8PUJ0d0cWnTxAAoiXuVw4rzCatuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwOYzBWV; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwOYzBWV"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6197efa570eso1199215a12.1
        for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755760451; x=1756365251; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d72kV5AqQ71r4FWlV/x/IF1vyWIU5hmO/NIRIMsWbyA=;
        b=YwOYzBWV2pOBW5mDtKr5PVq4DKu8mMdkeXslKTWLqlfICjDr2wBTulskfVYfYd3xy5
         V2O0KkMNxyRvoP3xvNtunFxGcS/41ED7ZgRt+G4Nz4VeowPxAhGrq7lp/RUVFlL3icsp
         7uWf7v5Z2/FdlRgtcf0RxIT9ZTEkeblycoFEOVKg5pc8AgVDbxOjK2bmn4wroOJA8Du8
         QMoZyxdoPbj3Orvghm1aYdox3aGg0NFCxVw9FMniVXNxtVe/W+71gq41hOnpujJ3Kg99
         yXb6d9UE8nziWwHzOvaaSlUtAH4m8xoMpT63fxhIbcBYbuZ/60OS8sgx09334bQqNziz
         sN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760451; x=1756365251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d72kV5AqQ71r4FWlV/x/IF1vyWIU5hmO/NIRIMsWbyA=;
        b=E/z0fEYMnEuSRQU4VrvEESz0yr7WVr7lmnPiEXGhgMRJPBt+0/hZKKrA4GDsIX0DJm
         Lnd73EAGGxYNywCA3XGokXnR8wOawuXP/GtIg/e76/lxQCeEy2Gcw+kEghQYzfbwPyv5
         o5nZtGjXW1iJzXxgwsIp+uOkRfPLbF+aL2QnCmU3CKXlYs6ko4O6YqX2J8or1cs6UfXk
         3Xu154ceN2X+GtwukpQf9SGKs2TZ2ZLUs66bbbT5wggs4Wl+BGFlRLU/vVNRuFi6Q/4h
         fcEoMPVylg07kIOU4VR55uLGmQKzvUaThuikuaFd7pjcysi+0xf2aXPUO1UfG3BTSv4F
         WWkw==
X-Forwarded-Encrypted: i=1; AJvYcCV9GCAiGji00GmxuufSDYavsvNFiflulg0BVrYrIQPTcQ0kjfJ2TmWWkVoJS3x0yrcDsLcTQck0e0g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqT7yFqkwC5tJtR4TyuHdsQb6yD6AGsMR24kFqg8GQoDoB+CdN
	2QWPrsXMh9ENIITVm9geq+ZrKGq4uYu7CIz4rewIDuFrTTe5X+78SlIFWOWslq2N1JvQl3+eHEq
	0r64cZzuHfpiN2/ucTxEzsnaJvjP5fcE=
X-Gm-Gg: ASbGncssEWYMfUANIyIjhmyLxBHpvftVJ37nh7+flEzyu7GzgEsnXPM7nByBwoLT3t4
	4qAzvCPGIVvmqqe+o6/jdZkHfj14oY4jS2FBS2cONrTFrwWVZD7q0XlP06ZMDig4QIFA6ill8cz
	i3jY78OlL+Um7qE6R21R1WY4jDphW6MfKJyFzRtpi4m1UwzqRwcZaO67D4DqjqNDxYzlfVTf0hz
	Rm8FPsToQ==
X-Google-Smtp-Source: AGHT+IF/gzSFnR8QEoExjxqmg99tfrdz12dCDe5b2qQ6U8hREAVE8SbvqbihBKEL2quYQG/vK0hoMW1ZY+G2bfY/7K4=
X-Received: by 2002:a17:907:9484:b0:af9:b4e9:8638 with SMTP id
 a640c23a62f3a-afe0745289amr140607166b.0.1755760450874; Thu, 21 Aug 2025
 00:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <89732d64415077ecd9f74c5853c542e62c0dfe26.1754890670.git.zhoubinbin@loongson.cn>
 <CAJhJPsW3KGL=FH5ZVqvRr-RD+ih09mFNuk7wGXepGVSw7bTaiw@mail.gmail.com>
In-Reply-To: <CAJhJPsW3KGL=FH5ZVqvRr-RD+ih09mFNuk7wGXepGVSw7bTaiw@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 21 Aug 2025 15:13:58 +0800
X-Gm-Features: Ac12FXwlluWwN2EL5-pW7xP4YIsIoV3SOA07dCKLtV974jNddA8n9MGvt4ISBvE
Message-ID: <CAMpQs4JyDTm_b0G-msqVO0nkxHHTOGoBDuUjYm+8+hpQKLZLyA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mtd: rawnand: loongson: Add Loongson-2K0500 NAND
 controller support
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Keguang:

Thanks for your reply.

On Thu, Aug 21, 2025 at 2:46=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail.=
com> wrote:
>
> On Mon, Aug 11, 2025 at 2:03=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The Loongson-2K0500 NAND controller is similar to the Loongson-1C.
> >
> > It supports a maximum capacity of 16GB FLASH per chip with a maximum
> > page size of 8KB, and it supports up to 4 chip selects and 4 RDY
> > signals.
> >
> > Its DMA controller is defaulted to APBDMA0.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/mtd/nand/raw/Kconfig                  |  2 +-
> >  .../mtd/nand/raw/loongson-nand-controller.c   | 55 ++++++++++++++++++-
> >  2 files changed, 54 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfi=
g
> > index d9e3f13666ac..7b0c5d06aa95 100644
> > --- a/drivers/mtd/nand/raw/Kconfig
> > +++ b/drivers/mtd/nand/raw/Kconfig
> > @@ -464,7 +464,7 @@ config MTD_NAND_NUVOTON_MA35
> >
> >  config MTD_NAND_LOONGSON
> >         tristate "Loongson NAND controller"
> > -       depends on LOONGSON1_APB_DMA || COMPILE_TEST
> > +       depends on LOONGSON1_APB_DMA || LOONGSON2_APB_DMA || COMPILE_TE=
ST
> >         select REGMAP_MMIO
> >         help
> >           Enables support for NAND controller on Loongson family chips.
> > diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/=
mtd/nand/raw/loongson-nand-controller.c
> > index 5a51c7d299cc..7a15df3fcd31 100644
> > --- a/drivers/mtd/nand/raw/loongson-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
> > @@ -3,6 +3,7 @@
> >   * NAND Controller Driver for Loongson family chips
> >   *
> >   * Copyright (C) 2015-2025 Keguang Zhang <keguang.zhang@gmail.com>
> > + * Copyright (C) 2025 Binbin Zhou <zhoubinbin@loongson.cn>
> >   */
> >
> >  #include <linux/kernel.h>
> > @@ -26,6 +27,7 @@
> >  #define LOONGSON_NAND_IDH_STATUS       0x14
> >  #define LOONGSON_NAND_PARAM            0x18
> >  #define LOONGSON_NAND_OP_NUM           0x1c
> > +#define LOONGSON_NAND_CS_RDY_MAP       0x20
> >
> >  /* Bitfields of nand command register */
> >  #define LOONGSON_NAND_CMD_OP_DONE      BIT(10)
> > @@ -40,6 +42,23 @@
> >  #define LOONGSON_NAND_CMD_READ         BIT(1)
> >  #define LOONGSON_NAND_CMD_VALID                BIT(0)
> >
> > +/* Bitfields of nand cs/rdy map register */
> > +#define LOONGSON_NAND_MAP_CS1_SEL      GENMASK(11, 8)
> > +#define LOONGSON_NAND_MAP_RDY1_SEL     GENMASK(15, 12)
> > +#define LOONGSON_NAND_MAP_CS2_SEL      GENMASK(19, 16)
> > +#define LOONGSON_NAND_MAP_RDY2_SEL     GENMASK(23, 20)
> > +#define LOONGSON_NAND_MAP_CS3_SEL      GENMASK(27, 24)
> > +#define LOONGSON_NAND_MAP_RDY3_SEL     GENMASK(31, 28)
> > +
> > +#define LOONGSON_NAND_CS_SEL0  BIT(0)
> > +#define LOONGSON_NAND_CS_SEL1  BIT(1)
> > +#define LOONGSON_NAND_CS_SEL2  BIT(2)
> > +#define LOONGSON_NAND_CS_SEL3  BIT(3)
> > +#define LOONGSON_NAND_CS_RDY0  BIT(0)
> > +#define LOONGSON_NAND_CS_RDY1  BIT(1)
> > +#define LOONGSON_NAND_CS_RDY2  BIT(2)
> > +#define LOONGSON_NAND_CS_RDY3  BIT(3)
> > +
> >  /* Bitfields of nand timing register */
> >  #define LOONGSON_NAND_WAIT_CYCLE_MASK  GENMASK(7, 0)
> >  #define LOONGSON_NAND_HOLD_CYCLE_MASK  GENMASK(15, 8)
> > @@ -53,6 +72,8 @@
> >  #define LOONGSON_NAND_READ_ID_SLEEP_US         1000
> >  #define LOONGSON_NAND_READ_ID_TIMEOUT_US       5000
> >
> > +#define LOONGSON_NAND_64BIT_DMA                BIT(0)
>
> It's strongly suggested to replace this flag with a dma_bits field in
> loongson_nand_host.
> Please see the comments below.
>
> > +
> >  #define BITS_PER_WORD                  (4 * BITS_PER_BYTE)
> >
> >  struct loongson_nand_host;
> > @@ -83,6 +104,7 @@ struct loongson_nand_data {
> >         unsigned int hold_cycle;
> >         unsigned int wait_cycle;
> >         unsigned int nand_cs;
>
> Add unsigned int dma_bits;
>
> > +       unsigned int flags;
> >         void (*set_addr)(struct loongson_nand_host *host, struct loongs=
on_nand_op *op);
> >  };
> >
> > @@ -751,7 +773,7 @@ static int loongson_nand_controller_init(struct loo=
ngson_nand_host *host)
> >         struct device *dev =3D host->dev;
> >         struct dma_chan *chan;
> >         struct dma_slave_config cfg =3D {};
> > -       int ret;
> > +       int ret, val;
> >
> >         host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &lo=
ongson_nand_regmap_config);
> >         if (IS_ERR(host->regmap))
> > @@ -761,6 +783,9 @@ static int loongson_nand_controller_init(struct loo=
ngson_nand_host *host)
> >                 regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, h=
ost->data->id_cycle_field,
> >                                    host->data->max_id_cycle << __ffs(ho=
st->data->id_cycle_field));
> >
> > +       if (host->data->flags & LOONGSON_NAND_64BIT_DMA)
> > +               dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> > +
>
> Sorry, all platforms should call dma_set_mask_and_coherent(),
> including Loongson-1, which I missed earlier.
>        ret =3D dma_set_mask_and_coherent(dev,
> DMA_BIT_MASK(host->data->dma_bits));
>        if (ret)
>                return dev_err_probe(dev, ret, "failed to set DMA mask\n")=
;
>

OK, if it is also required by Loongson-1, I will refactor this part.
In addition, I will address all of the following comments in the V4
patchset, as the V3 patchset[1] has already been submitted.

[1]: https://lore.kernel.org/all/cover.1755757841.git.zhoubinbin@loongson.c=
n/

You are welcome to continue to comment on that patchset as well.
> >         chan =3D dma_request_chan(dev, "rxtx");
> >         if (IS_ERR(chan))
> >                 return dev_err_probe(dev, PTR_ERR(chan), "failed to req=
uest DMA channel\n");
> > @@ -776,7 +801,14 @@ static int loongson_nand_controller_init(struct lo=
ongson_nand_host *host)
> >
> >         init_completion(&host->dma_complete);
> >
> > -       return 0;
> > +       val =3D FIELD_PREP(LOONGSON_NAND_MAP_CS1_SEL, LOONGSON_NAND_CS_=
SEL1)
> > +           | FIELD_PREP(LOONGSON_NAND_MAP_RDY1_SEL, LOONGSON_NAND_CS_R=
DY1)
> > +           | FIELD_PREP(LOONGSON_NAND_MAP_CS2_SEL, LOONGSON_NAND_CS_SE=
L2)
> > +           | FIELD_PREP(LOONGSON_NAND_MAP_RDY2_SEL, LOONGSON_NAND_CS_R=
DY2)
> > +           | FIELD_PREP(LOONGSON_NAND_MAP_CS3_SEL, LOONGSON_NAND_CS_SE=
L3)
> > +           | FIELD_PREP(LOONGSON_NAND_MAP_RDY3_SEL, LOONGSON_NAND_CS_R=
DY3);
> > +
> > +       return regmap_write(host->regmap, LOONGSON_NAND_CS_RDY_MAP, val=
);
>
> Chip selects should be set before requesting the DMA channel.
>
> >  }
> >
> >  static int loongson_nand_chip_init(struct loongson_nand_host *host)
> > @@ -890,6 +922,7 @@ static const struct loongson_nand_data ls1b_nand_da=
ta =3D {
> >         .hold_cycle =3D 0x2,
> >         .wait_cycle =3D 0xc,
> >         .nand_cs =3D 0x0,
>
> Add .dma_bits =3D 32,
>
> > +       .flags =3D 0,
>
> The assignment `.flags =3D 0x0` is redundant and can be removed.
>
> >         .set_addr =3D ls1b_nand_set_addr,
> >  };
> >
> > @@ -901,6 +934,19 @@ static const struct loongson_nand_data ls1c_nand_d=
ata =3D {
> >         .hold_cycle =3D 0x2,
> >         .wait_cycle =3D 0xc,
> >         .nand_cs =3D 0x0,
>
> Add .dma_bits =3D 32,
>
> > +       .flags =3D 0,
>
> Ditto.
>
> > +       .set_addr =3D ls1c_nand_set_addr,
> > +};
> > +
> > +static const struct loongson_nand_data ls2k0500_nand_data =3D {
> > +       .max_id_cycle =3D 6,
> > +       .id_cycle_field =3D GENMASK(14, 12),
> > +       .status_field =3D GENMASK(23, 16),
> > +       .op_scope_field =3D GENMASK(29, 16),
> > +       .hold_cycle =3D 0x4,
> > +       .wait_cycle =3D 0x12,
> > +       .nand_cs =3D 0x0,
> > +       .flags =3D LOONGSON_NAND_64BIT_DMA,
>
> Replace LOONGSON_NAND_64BIT_DMA with .dma_bits =3D 64,
>
> >         .set_addr =3D ls1c_nand_set_addr,
> >  };
> >
> > @@ -913,6 +959,10 @@ static const struct of_device_id loongson_nand_mat=
ch[] =3D {
> >                 .compatible =3D "loongson,ls1c-nand-controller",
> >                 .data =3D &ls1c_nand_data,
> >         },
> > +       {
> > +               .compatible =3D "loongson,ls2k0500-nand-controller",
> > +               .data =3D &ls2k0500_nand_data,
> > +       },
> >         { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, loongson_nand_match);
> > @@ -929,5 +979,6 @@ static struct platform_driver loongson_nand_driver =
=3D {
> >  module_platform_driver(loongson_nand_driver);
> >
> >  MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
> > +MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
> >  MODULE_DESCRIPTION("Loongson NAND Controller Driver");
> >  MODULE_LICENSE("GPL");
> > --
> > 2.47.3
> >
>
>
> --
> Best regards,
>
> Keguang Zhang

--=20
Thanks.
Binbin
