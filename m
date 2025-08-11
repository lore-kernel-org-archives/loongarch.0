Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8AC26C38C
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902195; cv=none; b=YgwFbMPT0g7Q7SS/SBtYx98QUSefhsxjv6weFTHTLX8+y2Eu3zp9SfTYNFgGB0yBUMsycM7x+0YkpGP8lCGQKNkzef1J5V9NvXg5nUmbtUF3iMtaQFLoeC+vhGpequcX9tyxrqS8ateSZfnCpjoXXbqeVvmUW14/XYLW+jG5BzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902195; c=relaxed/simple;
	bh=rRE/6MJKBTvko1sGv5ua9YlV7Trr/LlLl8NXqg6mnUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAkrNojUvkeDXOB3+5uEpubY9I+7xvmTmERHx8h4zIvI+EdjKRuf5y6PgYG2t/Ex6jcRfT5lKeDUcdrUJAeHTVAhujODqoqXGzhB5hGSezldlO7+BQN8v0p1VOm7uL74wh6OfK8ns0/WVNXvXxXTZnoOZKHFo9jrTz4II1NCBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyIDDIeB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyIDDIeB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so3416892a12.2
        for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754902192; x=1755506992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24UDtUSXpD7MISobVRN3TUNY/U8o8IyoI99Gh/qzulE=;
        b=GyIDDIeBTApAtj6jZxQ4xQK9zo9uHkzF+GT/qiTPb8rIOevPrirMld32vN6kymYNgb
         wHUBK73TsiKG0rwVx2FdFUtm/pld+LKRjKmMm4QiluSHgIt+SLVAfbzNBOk3bDTBPRcX
         a2k2G7NHP9NPvQy7viCGO4x68yrj4lTb+mnVJxLdqIFuQ/SKXy3L7b7haXRozKzT5Ba5
         YoyfJu3G/N9qzdNfcsOUKQEBvFVUgkGb4tRf5gWtg9LgmGrEY+xY96XTcJ/ZbL2+lMZu
         RuO+ffZVxmSGqTisOJ4kj1TaO+z9fgHYtSQFHrIVoRpxlP0gIg7wiNpq+mcoPiBXGd/X
         AYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902192; x=1755506992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24UDtUSXpD7MISobVRN3TUNY/U8o8IyoI99Gh/qzulE=;
        b=kOK1eBFFj18HAPzaW51egQtj3cY6jHeSwGHzTygKQ1RsbT3k0UpaS6iMP7zaBnb9CB
         0bqQ58VzRkumqsNnmsz5GPb0+6qtT8G/K15g7H6u2wC3djS3F0lvliaw+dJnFNXWr7L5
         VRf265dtgOT79CnUcCjL+7FzNlr/h9kl3ugFQo/t+5L7yrDyBKIE6W69dq0Ht0fR9b/E
         R3OMHB7h77BshPHefg0lxgBpQg1GDXB2DRRpky3wdGq+oJ5j4FIrpaFS9yvZLQMYwEc6
         dBG52RXGjC/05+jOXagGDqbfb9X6UAp7zWZqRwOod9L6GPUGJi8HWdNRFgkcgLjcYZ+6
         xJew==
X-Forwarded-Encrypted: i=1; AJvYcCWnkbBXnB+c2ZMvntr1fbe/g7sXSxuL6Ib5y6fW2CYI/+HrsfrjV3nPW9SOjV/NGMybDZFcwYGyGgY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzK27HRA40+US+JuVKHlqC0p2ReftOO19XC9lMKRQzt5FOlMtPb
	OeuFn7D6xSS8K9bigOqKJaWhWqv0frIiRlsPTX0Kj0kUzwt0Mo5gZB4y5vXDPNJCgd4pIgBweOv
	n8o8bQXMeQbnEjl7GI3ZHsQDlwCgc6JY=
X-Gm-Gg: ASbGnctZ78tOnNpXkS0UF7b6MJVE7RxflyF4hTndZk1kU5KiH5p9LMlk57xRrLAGa1i
	lCUiZDmk9PpR2q3rkro5Lf/udmRYRLepllXyNzM3U+HndRpgS2qpz/PKfs7VjFY16vjHM0doAso
	sY9MUQh6wVsK2Tv/HM1r8jKDVYPJLprAbIvFHI4cg75h346qWmDd9Fat1HxaVogi7qEWuJc/LLU
	3FUZzxI
X-Google-Smtp-Source: AGHT+IF+k9SUz6zyVqSF+9mljNmWYDbyxGCUaIpKmc95esHu+s7a1zRl5eSkX2TCgiyiBZMPDxmQPdoQUdnrNKF0nb4=
X-Received: by 2002:a17:907:7f18:b0:ae9:b800:2283 with SMTP id
 a640c23a62f3a-af9c6452471mr1096461566b.15.1754902191593; Mon, 11 Aug 2025
 01:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <d9e92cfdb1ee69d98630286238e08a8df176718a.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H7hB1WU3GyzdcKvWaYuqNsEMMN2=g6gwGcOzU=_Ghd6zw@mail.gmail.com>
In-Reply-To: <CAAhV-H7hB1WU3GyzdcKvWaYuqNsEMMN2=g6gwGcOzU=_Ghd6zw@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 11 Aug 2025 16:49:38 +0800
X-Gm-Features: Ac12FXwGwpz408gg222z9rlreVaN48DovnkhWhDtbZvrKva62EZwQJUUuXN4LPw
Message-ID: <CAMpQs4+5CoXKBVqE+YPYPyMyZFbhXQLfqqqex3JCVusDS5AUTA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] mtd: rawnand: loongson: Add nand chip select support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:

On Mon, Aug 11, 2025 at 2:40=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Mon, Aug 11, 2025 at 2:03=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The page address register describes the page address of the starting
> > address for NAND read/write/erase operations.
> >
> > According to the manual, it consists of two parts:
> >         {chip select, page number}
> >
> > The `chip select` is fixed at 2 bits, and the `page number` is
> > determined based on the actual capacity of the single-chip memory.
> > Therefore we need to determine the `chip select` bits base on the `page
> > number`.
> >
> > For example, for a 1GB capacity chip (2K page size), it has 1M pages.
> > Thus, [19:0] is used to represent the page number, and [21:20]
> > represents the chip select.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../mtd/nand/raw/loongson-nand-controller.c   | 133 ++++++++++++++----
> >  1 file changed, 103 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/=
mtd/nand/raw/loongson-nand-controller.c
> > index 97cd566420a8..5a51c7d299cc 100644
> > --- a/drivers/mtd/nand/raw/loongson-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
> > @@ -82,6 +82,7 @@ struct loongson_nand_data {
> >         unsigned int op_scope_field;
> >         unsigned int hold_cycle;
> >         unsigned int wait_cycle;
> > +       unsigned int nand_cs;
> >         void (*set_addr)(struct loongson_nand_host *host, struct loongs=
on_nand_op *op);
> >  };
> >
> > @@ -90,6 +91,7 @@ struct loongson_nand_host {
> >         struct nand_chip chip;
> >         struct nand_controller controller;
> >         const struct loongson_nand_data *data;
> > +       unsigned int addr_cs_field;
> >         void __iomem *reg_base;
> >         struct regmap *regmap;
> >         /* DMA Engine stuff */
> > @@ -215,6 +217,26 @@ static int loongson_nand_parse_instructions(struct=
 nand_chip *chip, const struct
> >         return 0;
> >  }
> >
> > +static void loongson_nand_set_addr_cs(struct loongson_nand_host *host)
> > +{
> > +       struct nand_chip *chip =3D &host->chip;
> > +       struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +
> > +       if (!host->data->nand_cs)
> > +               return;
> > +
> > +       /*
> > +        * The Manufacturer/Chip ID read operation precedes attach_chip=
, at which point
> > +        * information such as NAND chip selection and capacity is unkn=
own. As a
> > +        * workaround, we use 128MB cellsize (2KB pagesize) as a fallba=
ck.
> > +        */
> > +       if (!mtd->writesize)
> > +               host->addr_cs_field =3D GENMASK(17, 16);
> > +
> > +       regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, host->add=
r_cs_field,
> > +                          host->data->nand_cs << __ffs(host->addr_cs_f=
ield));
> > +}
> > +
> >  static void ls1b_nand_set_addr(struct loongson_nand_host *host, struct=
 loongson_nand_op *op)
> >  {
> >         struct nand_chip *chip =3D &host->chip;
> > @@ -263,6 +285,8 @@ static void ls1c_nand_set_addr(struct loongson_nand=
_host *host, struct loongson_
> >                         regmap_update_bits(host->regmap, LOONGSON_NAND_=
ADDR2, mask, val);
> >                 }
> >         }
> > +
> > +       loongson_nand_set_addr_cs(host);
> >  }
> >
> >  static void loongson_nand_trigger_op(struct loongson_nand_host *host, =
struct loongson_nand_op *op)
> > @@ -603,42 +627,89 @@ static int loongson_nand_exec_op(struct nand_chip=
 *chip, const struct nand_opera
> >         return nand_op_parser_exec_op(chip, &loongson_nand_op_parser, o=
p, check_only);
> >  }
> >
> > -static int loongson_nand_attach_chip(struct nand_chip *chip)
> > +static int loongson_nand_get_chip_capacity(struct nand_chip *chip)
> >  {
> >         struct loongson_nand_host *host =3D nand_get_controller_data(ch=
ip);
> >         u64 chipsize =3D nanddev_target_size(&chip->base);
> > -       int cell_size =3D 0;
> > +       struct mtd_info *mtd =3D nand_to_mtd(chip);
> >
> > -       switch (chipsize) {
> > -       case SZ_128M:
> > -               cell_size =3D 0x0;
> > -               break;
> > -       case SZ_256M:
> > -               cell_size =3D 0x1;
> > -               break;
> > -       case SZ_512M:
> > -               cell_size =3D 0x2;
> > -               break;
> > -       case SZ_1G:
> > -               cell_size =3D 0x3;
> > -               break;
> > -       case SZ_2G:
> > -               cell_size =3D 0x4;
> > -               break;
> > -       case SZ_4G:
> > -               cell_size =3D 0x5;
> > -               break;
> > -       case SZ_8G:
> > -               cell_size =3D 0x6;
> > -               break;
> > -       case SZ_16G:
> > -               cell_size =3D 0x7;
> > -               break;
> > -       default:
> > -               dev_err(host->dev, "unsupported chip size: %llu MB\n", =
chipsize);
> > -               return -EINVAL;
> > +       if (mtd->writesize =3D=3D SZ_4K && chipsize =3D=3D SZ_2G) {
> > +               host->addr_cs_field =3D GENMASK(20, 19);
> > +               return 0x4;
> >         }
> I think you want to sort this part by the return value, but "return
> 0x4" has already break it.
>
> So I think it is better to use a big switch-case for writesize, and
> sort the big switch-case by writesize.

How about:

        switch (mtd->writesize) {
        case SZ_512:
                switch (chipsize) {
                case SZ_8M:
                        host->addr_cs_field =3D GENMASK(15, 14);
                        return 0x9;
                case SZ_16M:
                        host->addr_cs_field =3D GENMASK(16, 15);
                        return 0xa;
                case SZ_32M:
                        host->addr_cs_field =3D GENMASK(17, 16);
                        return 0xb;
                case SZ_64M:
                        host->addr_cs_field =3D GENMASK(18, 17);
                        return 0xc;
                case SZ_128M:
                        host->addr_cs_field =3D GENMASK(19, 18);
                        return 0xd;
                }
                break;
        case SZ_2K:
                switch (chipsize) {
                case SZ_128M:
                        host->addr_cs_field =3D GENMASK(17, 16);
                        return 0;
                case SZ_256M:
                        host->addr_cs_field =3D GENMASK(18, 17);
                        return 0x1;
                case SZ_512M:
                        host->addr_cs_field =3D GENMASK(19, 18);
                        return 0x2;
                case SZ_1G:
                        host->addr_cs_field =3D GENMASK(20, 19);
                        return 0x3;
                }
                break;
        case SZ_4K:
                if (chipsize =3D=3D SZ_2G) {
                        host->addr_cs_field =3D GENMASK(20, 19);
                        return 0x4;
                }
                break;
        case SZ_8K:
                switch (chipsize) {
                case SZ_4G:
                        host->addr_cs_field =3D GENMASK(20, 19);
                        return 0x5;
                case SZ_8G:
                        host->addr_cs_field =3D GENMASK(21, 20);
                        return 0x6;
                case SZ_16G:
                        host->addr_cs_field =3D GENMASK(22, 21);
                        return 0x7;
                }
                break;
        default:
                break;
        }

        dev_err(host->dev, "Unsupported chip size: %llu MB with page
size %u B\n",
                chipsize, mtd->writesize);
>
> Huacai
>
> >
> > +       if (mtd->writesize =3D=3D SZ_2K) {
> > +               switch (chipsize) {
> > +               case SZ_128M:
> > +                       host->addr_cs_field =3D GENMASK(17, 16);
> > +                       return 0;
> > +               case SZ_256M:
> > +                       host->addr_cs_field =3D GENMASK(18, 17);
> > +                       return 0x1;
> > +               case SZ_512M:
> > +                       host->addr_cs_field =3D GENMASK(19, 18);
> > +                       return 0x2;
> > +               case SZ_1G:
> > +                       host->addr_cs_field =3D GENMASK(20, 19);
> > +                       return 0x3;
> > +               default:
> > +                       goto err;
> > +               }
> > +       }
> > +
> > +       if (mtd->writesize =3D=3D SZ_8K) {
> > +               switch (chipsize) {
> > +               case SZ_4G:
> > +                       host->addr_cs_field =3D GENMASK(20, 19);
> > +                       return 0x5;
> > +               case SZ_8G:
> > +                       host->addr_cs_field =3D GENMASK(21, 20);
> > +                       return 0x6;
> > +               case SZ_16G:
> > +                       host->addr_cs_field =3D GENMASK(22, 21);
> > +                       return 0x7;
> > +               default:
> > +                       goto err;
> > +               }
> > +       }
> > +
> > +       if (mtd->writesize =3D=3D SZ_512) {
> > +               switch (chipsize) {
> > +               case SZ_8M:
> > +                       host->addr_cs_field =3D GENMASK(15, 14);
> > +                       return 0x9;
> > +               case SZ_16M:
> > +                       host->addr_cs_field =3D GENMASK(16, 15);
> > +                       return 0xa;
> > +               case SZ_32M:
> > +                       host->addr_cs_field =3D GENMASK(17, 16);
> > +                       return 0xb;
> > +               case SZ_64M:
> > +                       host->addr_cs_field =3D GENMASK(18, 17);
> > +                       return 0xc;
> > +               case SZ_128M:
> > +                       host->addr_cs_field =3D GENMASK(19, 18);
> > +                       return 0xd;
> > +               default:
> > +                       goto err;
> > +               }
> > +       }
> > +
> > +err:
> > +       dev_err(host->dev, "Unsupported chip size: %llu MB with page si=
ze %u B\n",
> > +               chipsize, mtd->writesize);
> > +       return -EINVAL;
> > +}
> > +
> > +static int loongson_nand_attach_chip(struct nand_chip *chip)
> > +{
> > +       struct loongson_nand_host *host =3D nand_get_controller_data(ch=
ip);
> > +       int cell_size =3D 0;
> > +
> > +       cell_size =3D loongson_nand_get_chip_capacity(chip);
> > +       if (cell_size < 0)
> > +               return cell_size;
> > +
> >         switch (chip->ecc.engine_type) {
> >         case NAND_ECC_ENGINE_TYPE_NONE:
> >                 break;
> > @@ -818,6 +889,7 @@ static const struct loongson_nand_data ls1b_nand_da=
ta =3D {
> >         .status_field =3D GENMASK(15, 8),
> >         .hold_cycle =3D 0x2,
> >         .wait_cycle =3D 0xc,
> > +       .nand_cs =3D 0x0,
> >         .set_addr =3D ls1b_nand_set_addr,
> >  };
> >
> > @@ -828,6 +900,7 @@ static const struct loongson_nand_data ls1c_nand_da=
ta =3D {
> >         .op_scope_field =3D GENMASK(29, 16),
> >         .hold_cycle =3D 0x2,
> >         .wait_cycle =3D 0xc,
> > +       .nand_cs =3D 0x0,
> >         .set_addr =3D ls1c_nand_set_addr,
> >  };
> >
> > --
> > 2.47.3
> >
> >

--=20
Thanks.
Binbin
