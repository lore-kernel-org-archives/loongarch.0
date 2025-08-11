Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43112DCF45
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902785; cv=none; b=XIBHzrqbRygAxKgrE9RS6967mV57Y3JAOsw3cJ6S8EvVUBXljFK0zLnPQ7T2pfQLmOmLXrMv7yvAeNKeytRJFnz/wkss6b2O5/XthWw8bgHcyYBAda4nw056Nx7aDjEEQn4mqCD2Mc70wUfYYhHezRNvv6uRbpZQbzT25VHk+so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902785; c=relaxed/simple;
	bh=1wTEGa92YipwxVlxRVnJHRE/gFwAlCuafLgB7/r/kPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0xqmmoWtwSnKq8h59nCaoV6d1EaeOi7Vy2oK2qju+dhy1BjXl7ytvh1soxrU2HsWZ7ATNQRmfd0jgjw01ppONLfIBVRLb60/lOK4GQFHL/LVxGcxnb1SxBExX31m4PscNTGlpGiIqz2A5hfkAuR66gFNp8NB+hboyaPHc+kSBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pX7fB1Z3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pX7fB1Z3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C56C4CEF9
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 08:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754902784;
	bh=1wTEGa92YipwxVlxRVnJHRE/gFwAlCuafLgB7/r/kPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pX7fB1Z3vxwE6jlOl+YObygVoORDlj+HTlmtDAaPJJs/5r4H/tmYX1+69e8vIrNlS
	 o7QiPAW9ERmVO8sqqkn2mUwa4OwEZCiyVAqUlqDo+RPifpViqkHdQD/KnCfYFF8yPO
	 YEInzq+Hlkesw/By31qz+fcSe1t6+MGdgqrbBvOTKR3ey0B8mGVo1DH5ZFNiQMoEsi
	 WVXNBJqU2bKwzbjeXMhPuWvSuHr7MgM1ck8tgEM+m35GBS77DhHy5wZTPfD1/EfKjk
	 rHGjwYsvS9OCumn/jOB2RU5LLaGgh0yDp/hDPleEk7Eqz9PYl1iZeOe8Y1gIXx+sMx
	 WB2cf24qNgj7Q==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-617b36cc489so7985037a12.0
        for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 01:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIivovLU/KXWIS/XBMTsWVFC1XDR0fa7I2ncRAcN8NupAJW7V45gzP3lIE3qszQyL1gz7f8k3GiAk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBNsXz2ZU+neZP677GTmTXZb/2RLHltj0jBn8pekgjKGA2B3K/
	CFLAN2kdmOUx6a69GEJpZ1vdNQajJBjygiwPhidfEJejwfGF3QDZAAv8/cZ1Qqg6TI8j+U87NY6
	7XXE7GyCOGQnMBB7yFYj2+sMUJ0XEKQ0=
X-Google-Smtp-Source: AGHT+IFkKVoM15OgyHW4roeyInjiiYW2fvhUn72WQfiV4uqMLS6XIeQkYGWJECVAUW5SJUvcEDTWyuhX1hOSsQtOC5A=
X-Received: by 2002:a05:6402:5112:b0:615:a529:a988 with SMTP id
 4fb4d7f45d1cf-617e2bd8806mr9808339a12.14.1754902782955; Mon, 11 Aug 2025
 01:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <d9e92cfdb1ee69d98630286238e08a8df176718a.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H7hB1WU3GyzdcKvWaYuqNsEMMN2=g6gwGcOzU=_Ghd6zw@mail.gmail.com> <CAMpQs4+5CoXKBVqE+YPYPyMyZFbhXQLfqqqex3JCVusDS5AUTA@mail.gmail.com>
In-Reply-To: <CAMpQs4+5CoXKBVqE+YPYPyMyZFbhXQLfqqqex3JCVusDS5AUTA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Aug 2025 16:59:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6JyGdg8hA2vsrPGFAysSk3F9KJqmS1A2Gqwx52Q2x2_A@mail.gmail.com>
X-Gm-Features: Ac12FXykj1aDpEGzpUGYiIBJLu6jg1PIrAjdFAtO2QD9VBc-BK6E7OY3-aUL40w
Message-ID: <CAAhV-H6JyGdg8hA2vsrPGFAysSk3F9KJqmS1A2Gqwx52Q2x2_A@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] mtd: rawnand: loongson: Add nand chip select support
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 4:49=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.com=
> wrote:
>
> Hi:
>
> On Mon, Aug 11, 2025 at 2:40=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Binbin,
> >
> > On Mon, Aug 11, 2025 at 2:03=E2=80=AFPM Binbin Zhou <zhoubinbin@loongso=
n.cn> wrote:
> > >
> > > The page address register describes the page address of the starting
> > > address for NAND read/write/erase operations.
> > >
> > > According to the manual, it consists of two parts:
> > >         {chip select, page number}
> > >
> > > The `chip select` is fixed at 2 bits, and the `page number` is
> > > determined based on the actual capacity of the single-chip memory.
> > > Therefore we need to determine the `chip select` bits base on the `pa=
ge
> > > number`.
> > >
> > > For example, for a 1GB capacity chip (2K page size), it has 1M pages.
> > > Thus, [19:0] is used to represent the page number, and [21:20]
> > > represents the chip select.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  .../mtd/nand/raw/loongson-nand-controller.c   | 133 ++++++++++++++--=
--
> > >  1 file changed, 103 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/driver=
s/mtd/nand/raw/loongson-nand-controller.c
> > > index 97cd566420a8..5a51c7d299cc 100644
> > > --- a/drivers/mtd/nand/raw/loongson-nand-controller.c
> > > +++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
> > > @@ -82,6 +82,7 @@ struct loongson_nand_data {
> > >         unsigned int op_scope_field;
> > >         unsigned int hold_cycle;
> > >         unsigned int wait_cycle;
> > > +       unsigned int nand_cs;
> > >         void (*set_addr)(struct loongson_nand_host *host, struct loon=
gson_nand_op *op);
> > >  };
> > >
> > > @@ -90,6 +91,7 @@ struct loongson_nand_host {
> > >         struct nand_chip chip;
> > >         struct nand_controller controller;
> > >         const struct loongson_nand_data *data;
> > > +       unsigned int addr_cs_field;
> > >         void __iomem *reg_base;
> > >         struct regmap *regmap;
> > >         /* DMA Engine stuff */
> > > @@ -215,6 +217,26 @@ static int loongson_nand_parse_instructions(stru=
ct nand_chip *chip, const struct
> > >         return 0;
> > >  }
> > >
> > > +static void loongson_nand_set_addr_cs(struct loongson_nand_host *hos=
t)
> > > +{
> > > +       struct nand_chip *chip =3D &host->chip;
> > > +       struct mtd_info *mtd =3D nand_to_mtd(chip);
> > > +
> > > +       if (!host->data->nand_cs)
> > > +               return;
> > > +
> > > +       /*
> > > +        * The Manufacturer/Chip ID read operation precedes attach_ch=
ip, at which point
> > > +        * information such as NAND chip selection and capacity is un=
known. As a
> > > +        * workaround, we use 128MB cellsize (2KB pagesize) as a fall=
back.
> > > +        */
> > > +       if (!mtd->writesize)
> > > +               host->addr_cs_field =3D GENMASK(17, 16);
> > > +
> > > +       regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, host->a=
ddr_cs_field,
> > > +                          host->data->nand_cs << __ffs(host->addr_cs=
_field));
> > > +}
> > > +
> > >  static void ls1b_nand_set_addr(struct loongson_nand_host *host, stru=
ct loongson_nand_op *op)
> > >  {
> > >         struct nand_chip *chip =3D &host->chip;
> > > @@ -263,6 +285,8 @@ static void ls1c_nand_set_addr(struct loongson_na=
nd_host *host, struct loongson_
> > >                         regmap_update_bits(host->regmap, LOONGSON_NAN=
D_ADDR2, mask, val);
> > >                 }
> > >         }
> > > +
> > > +       loongson_nand_set_addr_cs(host);
> > >  }
> > >
> > >  static void loongson_nand_trigger_op(struct loongson_nand_host *host=
, struct loongson_nand_op *op)
> > > @@ -603,42 +627,89 @@ static int loongson_nand_exec_op(struct nand_ch=
ip *chip, const struct nand_opera
> > >         return nand_op_parser_exec_op(chip, &loongson_nand_op_parser,=
 op, check_only);
> > >  }
> > >
> > > -static int loongson_nand_attach_chip(struct nand_chip *chip)
> > > +static int loongson_nand_get_chip_capacity(struct nand_chip *chip)
> > >  {
> > >         struct loongson_nand_host *host =3D nand_get_controller_data(=
chip);
> > >         u64 chipsize =3D nanddev_target_size(&chip->base);
> > > -       int cell_size =3D 0;
> > > +       struct mtd_info *mtd =3D nand_to_mtd(chip);
> > >
> > > -       switch (chipsize) {
> > > -       case SZ_128M:
> > > -               cell_size =3D 0x0;
> > > -               break;
> > > -       case SZ_256M:
> > > -               cell_size =3D 0x1;
> > > -               break;
> > > -       case SZ_512M:
> > > -               cell_size =3D 0x2;
> > > -               break;
> > > -       case SZ_1G:
> > > -               cell_size =3D 0x3;
> > > -               break;
> > > -       case SZ_2G:
> > > -               cell_size =3D 0x4;
> > > -               break;
> > > -       case SZ_4G:
> > > -               cell_size =3D 0x5;
> > > -               break;
> > > -       case SZ_8G:
> > > -               cell_size =3D 0x6;
> > > -               break;
> > > -       case SZ_16G:
> > > -               cell_size =3D 0x7;
> > > -               break;
> > > -       default:
> > > -               dev_err(host->dev, "unsupported chip size: %llu MB\n"=
, chipsize);
> > > -               return -EINVAL;
> > > +       if (mtd->writesize =3D=3D SZ_4K && chipsize =3D=3D SZ_2G) {
> > > +               host->addr_cs_field =3D GENMASK(20, 19);
> > > +               return 0x4;
> > >         }
> > I think you want to sort this part by the return value, but "return
> > 0x4" has already break it.
> >
> > So I think it is better to use a big switch-case for writesize, and
> > sort the big switch-case by writesize.
>
> How about:
>
>         switch (mtd->writesize) {
>         case SZ_512:
>                 switch (chipsize) {
>                 case SZ_8M:
>                         host->addr_cs_field =3D GENMASK(15, 14);
>                         return 0x9;
>                 case SZ_16M:
>                         host->addr_cs_field =3D GENMASK(16, 15);
>                         return 0xa;
>                 case SZ_32M:
>                         host->addr_cs_field =3D GENMASK(17, 16);
>                         return 0xb;
>                 case SZ_64M:
>                         host->addr_cs_field =3D GENMASK(18, 17);
>                         return 0xc;
>                 case SZ_128M:
>                         host->addr_cs_field =3D GENMASK(19, 18);
>                         return 0xd;
>                 }
>                 break;
>         case SZ_2K:
>                 switch (chipsize) {
>                 case SZ_128M:
>                         host->addr_cs_field =3D GENMASK(17, 16);
>                         return 0;
Use 0x0 for consistency.

>                 case SZ_256M:
>                         host->addr_cs_field =3D GENMASK(18, 17);
>                         return 0x1;
>                 case SZ_512M:
>                         host->addr_cs_field =3D GENMASK(19, 18);
>                         return 0x2;
>                 case SZ_1G:
>                         host->addr_cs_field =3D GENMASK(20, 19);
>                         return 0x3;
>                 }
>                 break;
>         case SZ_4K:
>                 if (chipsize =3D=3D SZ_2G) {
>                         host->addr_cs_field =3D GENMASK(20, 19);
>                         return 0x4;
>                 }
>                 break;
>         case SZ_8K:
>                 switch (chipsize) {
>                 case SZ_4G:
>                         host->addr_cs_field =3D GENMASK(20, 19);
>                         return 0x5;
>                 case SZ_8G:
>                         host->addr_cs_field =3D GENMASK(21, 20);
>                         return 0x6;
>                 case SZ_16G:
>                         host->addr_cs_field =3D GENMASK(22, 21);
>                         return 0x7;
>                 }
>                 break;
>         default:
>                 break;
The default branch is unneeded. Others are OK for me.

Huacai

>         }
>
>         dev_err(host->dev, "Unsupported chip size: %llu MB with page
> size %u B\n",
>                 chipsize, mtd->writesize);
> >
> > Huacai
> >
> > >
> > > +       if (mtd->writesize =3D=3D SZ_2K) {
> > > +               switch (chipsize) {
> > > +               case SZ_128M:
> > > +                       host->addr_cs_field =3D GENMASK(17, 16);
> > > +                       return 0;
> > > +               case SZ_256M:
> > > +                       host->addr_cs_field =3D GENMASK(18, 17);
> > > +                       return 0x1;
> > > +               case SZ_512M:
> > > +                       host->addr_cs_field =3D GENMASK(19, 18);
> > > +                       return 0x2;
> > > +               case SZ_1G:
> > > +                       host->addr_cs_field =3D GENMASK(20, 19);
> > > +                       return 0x3;
> > > +               default:
> > > +                       goto err;
> > > +               }
> > > +       }
> > > +
> > > +       if (mtd->writesize =3D=3D SZ_8K) {
> > > +               switch (chipsize) {
> > > +               case SZ_4G:
> > > +                       host->addr_cs_field =3D GENMASK(20, 19);
> > > +                       return 0x5;
> > > +               case SZ_8G:
> > > +                       host->addr_cs_field =3D GENMASK(21, 20);
> > > +                       return 0x6;
> > > +               case SZ_16G:
> > > +                       host->addr_cs_field =3D GENMASK(22, 21);
> > > +                       return 0x7;
> > > +               default:
> > > +                       goto err;
> > > +               }
> > > +       }
> > > +
> > > +       if (mtd->writesize =3D=3D SZ_512) {
> > > +               switch (chipsize) {
> > > +               case SZ_8M:
> > > +                       host->addr_cs_field =3D GENMASK(15, 14);
> > > +                       return 0x9;
> > > +               case SZ_16M:
> > > +                       host->addr_cs_field =3D GENMASK(16, 15);
> > > +                       return 0xa;
> > > +               case SZ_32M:
> > > +                       host->addr_cs_field =3D GENMASK(17, 16);
> > > +                       return 0xb;
> > > +               case SZ_64M:
> > > +                       host->addr_cs_field =3D GENMASK(18, 17);
> > > +                       return 0xc;
> > > +               case SZ_128M:
> > > +                       host->addr_cs_field =3D GENMASK(19, 18);
> > > +                       return 0xd;
> > > +               default:
> > > +                       goto err;
> > > +               }
> > > +       }
> > > +
> > > +err:
> > > +       dev_err(host->dev, "Unsupported chip size: %llu MB with page =
size %u B\n",
> > > +               chipsize, mtd->writesize);
> > > +       return -EINVAL;
> > > +}
> > > +
> > > +static int loongson_nand_attach_chip(struct nand_chip *chip)
> > > +{
> > > +       struct loongson_nand_host *host =3D nand_get_controller_data(=
chip);
> > > +       int cell_size =3D 0;
> > > +
> > > +       cell_size =3D loongson_nand_get_chip_capacity(chip);
> > > +       if (cell_size < 0)
> > > +               return cell_size;
> > > +
> > >         switch (chip->ecc.engine_type) {
> > >         case NAND_ECC_ENGINE_TYPE_NONE:
> > >                 break;
> > > @@ -818,6 +889,7 @@ static const struct loongson_nand_data ls1b_nand_=
data =3D {
> > >         .status_field =3D GENMASK(15, 8),
> > >         .hold_cycle =3D 0x2,
> > >         .wait_cycle =3D 0xc,
> > > +       .nand_cs =3D 0x0,
> > >         .set_addr =3D ls1b_nand_set_addr,
> > >  };
> > >
> > > @@ -828,6 +900,7 @@ static const struct loongson_nand_data ls1c_nand_=
data =3D {
> > >         .op_scope_field =3D GENMASK(29, 16),
> > >         .hold_cycle =3D 0x2,
> > >         .wait_cycle =3D 0xc,
> > > +       .nand_cs =3D 0x0,
> > >         .set_addr =3D ls1c_nand_set_addr,
> > >  };
> > >
> > > --
> > > 2.47.3
> > >
> > >
>
> --
> Thanks.
> Binbin
