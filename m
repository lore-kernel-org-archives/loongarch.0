Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21F131B13E
	for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595681; cv=none; b=htLhH6nJ7ngcqvU6pFloMUk3m2YionJQ6OCGi4tRaIzyozuPaCaGcqCAf8Nw5sis/S/HfCmkOSoKK4vpSrAeWOAMVmJ2e+7TbfsQsxmB734W6Cpohz7NhCOlaS3TzcCpXx3zRXD8r6G/bLkFZufHGIMwOM885I6ANax2yGvlX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595681; c=relaxed/simple;
	bh=KWI4eZgc4fZizU2DDU16/Bjf7Td+w6kwVmljHyukkQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scV+T+1UcWExRk6P22/+PJ07zFvkukTAbWirbw6h8gq2kuwwwHW6V9mLyQcRV5fclhkD8fCOuisATSjJfAp7v10/ZgXf/GSJgnQsgrIupFJ4BhknuqxHYelWYpTH0yTubDlm/O+XiVXqRQ/XdKGTGR2/jZGlIvQkiTaZo7VMryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIZdAKNf; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIZdAKNf"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-333f8f2d6c2so41814831fa.1
        for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 02:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755595678; x=1756200478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OQkr6zykDfsHE43g8uaPbe9t9idtDlDUqfpuMPRDjU=;
        b=iIZdAKNf2qtSgP8A8IXuotJjtjRQXG1pnHsgqMguu1TUugO4/a2NVJqoup2IeJWFz9
         dRpMa6iJYk1o+fJBZilsrvEN7k3U6m+SzKG7tMAc6GqANj7pXOK2X73pxJ112Q2lK3jE
         aGzA0PMwwQkk/HlneddjYYmEK6TW1rkNaSwWgyovv1wjjlvN3pQMRKgLu/BG3XXZY7b0
         MVSalPLfkCRZg7o4QxSAJ0o5CmhKXJUepb+Yl7FC+zNTFjLZskcw02OfXeiWQHv+EdYg
         6NRKpWisSCoXaumSqUlehrebsLuN1Fvb1YGsHaE4ug5Hy8RJFVMLdxy+W5r23FDKEefw
         +1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595678; x=1756200478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OQkr6zykDfsHE43g8uaPbe9t9idtDlDUqfpuMPRDjU=;
        b=RXGsd/LET3E5yVzwUP71+2zzY5RdHzR55rMikb813DAj/xL2TABkDxuOt70+mfMGY5
         rtykn1JA74dqCjRLl1tsnKh8xbK+zwLlmM6c0WSOimoEe9gWMKfBdQdWYFspPXeX80ud
         CTcYxi/5wr12/ioTsCHGFPf0noo3ldpVgNcEZkySsZCtuEjSbYTkNDmZDIaRxQyX0LAP
         bDn01FRQiPGBADRePKjhKNomeKVo3WJgIwZboWm2mAnoMdChI80n9iBsvjGx3VuHjpec
         Srbkn5zAFPw+MSnRi9mC0s/H5oH8icL8m5iYhTklrh2CXYNblZsAmy6+wb/+CxCr+PuM
         LqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUypH+gkWHwIlIivldXNh2ho3bOBGNNnzqceI8SS4Ef3iM0j7moMR72J3dSTVaY4yJv3f1gQjcglpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEA+mTJ7chDz7EG04Fcp4hIhwLYH61hALddWRiOk2PUfzE/n1I
	4poxSXV+iY3CmjHIx6ZxMZPLlJ+2zWxfp+Mqfu8o803S3wGZSyPV4NqvY8vX6oCLoxYvfXrNXju
	tj9Sl/0JtkV2Nrlic0vgJi2QSTlRn08E=
X-Gm-Gg: ASbGncsvAqjzs3lFzSu55Gi2nO86UkLgYBLgqHad/AxbbO18QuGi6qMT61J2awY+pBF
	XzpcTq0yDk2SJx+yyN0xrO+NKkvoMrgMnXp7xFDkcMsDJESEVyfTjWj7YnbMKED13/kq+SIxgGd
	PuL2/m57zmVdZz1ySLBAROiEYH2RYs83Xc9nBDK+HRHxCU+pZEl+GpBUoJUtOchXCjlm0qeAM8v
	fMheAlkHQXRlr1LaSI=
X-Google-Smtp-Source: AGHT+IEzOSfuxMJN7nTWT11FErQMVotgyyYjG92JFtcnWqBAmEKBJN8oajoc8gRwD1X0zsZaM4IuiSvFpHzuKEMw1kE=
X-Received: by 2002:a2e:be9a:0:b0:330:4b87:7a43 with SMTP id
 38308e7fff4ca-3353073f5e8mr6234191fa.36.1755595677641; Tue, 19 Aug 2025
 02:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <d9e92cfdb1ee69d98630286238e08a8df176718a.1754890670.git.zhoubinbin@loongson.cn>
In-Reply-To: <d9e92cfdb1ee69d98630286238e08a8df176718a.1754890670.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 19 Aug 2025 17:27:21 +0800
X-Gm-Features: Ac12FXyoRJ82OzwQIguJkpDhNh3-mSKVf4Ur7V22rbg7xjXzky8k7BOMvrP3KFA
Message-ID: <CAJhJPsWAUDUNb-JvNBN_ZVVXThZcvNCrL5XV=DAWzm2JJ=r=3Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] mtd: rawnand: loongson: Add nand chip select support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 2:03=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> The page address register describes the page address of the starting
> address for NAND read/write/erase operations.
>
> According to the manual, it consists of two parts:
>         {chip select, page number}
>
> The `chip select` is fixed at 2 bits, and the `page number` is
> determined based on the actual capacity of the single-chip memory.
> Therefore we need to determine the `chip select` bits base on the `page
> number`.
>
> For example, for a 1GB capacity chip (2K page size), it has 1M pages.
> Thus, [19:0] is used to represent the page number, and [21:20]
> represents the chip select.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../mtd/nand/raw/loongson-nand-controller.c   | 133 ++++++++++++++----
>  1 file changed, 103 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mt=
d/nand/raw/loongson-nand-controller.c
> index 97cd566420a8..5a51c7d299cc 100644
> --- a/drivers/mtd/nand/raw/loongson-nand-controller.c
> +++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
> @@ -82,6 +82,7 @@ struct loongson_nand_data {
>         unsigned int op_scope_field;
>         unsigned int hold_cycle;
>         unsigned int wait_cycle;
> +       unsigned int nand_cs;
>         void (*set_addr)(struct loongson_nand_host *host, struct loongson=
_nand_op *op);
>  };
>
> @@ -90,6 +91,7 @@ struct loongson_nand_host {
>         struct nand_chip chip;
>         struct nand_controller controller;
>         const struct loongson_nand_data *data;
> +       unsigned int addr_cs_field;
>         void __iomem *reg_base;
>         struct regmap *regmap;
>         /* DMA Engine stuff */
> @@ -215,6 +217,26 @@ static int loongson_nand_parse_instructions(struct n=
and_chip *chip, const struct
>         return 0;
>  }
>
> +static void loongson_nand_set_addr_cs(struct loongson_nand_host *host)
> +{
> +       struct nand_chip *chip =3D &host->chip;
> +       struct mtd_info *mtd =3D nand_to_mtd(chip);
> +
> +       if (!host->data->nand_cs)
> +               return;
> +
> +       /*
> +        * The Manufacturer/Chip ID read operation precedes attach_chip, =
at which point
> +        * information such as NAND chip selection and capacity is unknow=
n. As a
> +        * workaround, we use 128MB cellsize (2KB pagesize) as a fallback=
.
> +        */
> +       if (!mtd->writesize)
> +               host->addr_cs_field =3D GENMASK(17, 16);
> +
> +       regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, host->addr_=
cs_field,
> +                          host->data->nand_cs << __ffs(host->addr_cs_fie=
ld));
> +}
> +
>  static void ls1b_nand_set_addr(struct loongson_nand_host *host, struct l=
oongson_nand_op *op)
>  {
>         struct nand_chip *chip =3D &host->chip;
> @@ -263,6 +285,8 @@ static void ls1c_nand_set_addr(struct loongson_nand_h=
ost *host, struct loongson_
>                         regmap_update_bits(host->regmap, LOONGSON_NAND_AD=
DR2, mask, val);
>                 }
>         }
> +
> +       loongson_nand_set_addr_cs(host);
>  }
>
>  static void loongson_nand_trigger_op(struct loongson_nand_host *host, st=
ruct loongson_nand_op *op)
> @@ -603,42 +627,89 @@ static int loongson_nand_exec_op(struct nand_chip *=
chip, const struct nand_opera
>         return nand_op_parser_exec_op(chip, &loongson_nand_op_parser, op,=
 check_only);
>  }
>
> -static int loongson_nand_attach_chip(struct nand_chip *chip)
> +static int loongson_nand_get_chip_capacity(struct nand_chip *chip)
>  {
>         struct loongson_nand_host *host =3D nand_get_controller_data(chip=
);
>         u64 chipsize =3D nanddev_target_size(&chip->base);
> -       int cell_size =3D 0;
> +       struct mtd_info *mtd =3D nand_to_mtd(chip);
>
> -       switch (chipsize) {
> -       case SZ_128M:
> -               cell_size =3D 0x0;
> -               break;
> -       case SZ_256M:
> -               cell_size =3D 0x1;
> -               break;
> -       case SZ_512M:
> -               cell_size =3D 0x2;
> -               break;
> -       case SZ_1G:
> -               cell_size =3D 0x3;
> -               break;
> -       case SZ_2G:
> -               cell_size =3D 0x4;
> -               break;
> -       case SZ_4G:
> -               cell_size =3D 0x5;
> -               break;
> -       case SZ_8G:
> -               cell_size =3D 0x6;
> -               break;
> -       case SZ_16G:
> -               cell_size =3D 0x7;
> -               break;
> -       default:
> -               dev_err(host->dev, "unsupported chip size: %llu MB\n", ch=
ipsize);
> -               return -EINVAL;
> +       if (mtd->writesize =3D=3D SZ_4K && chipsize =3D=3D SZ_2G) {
> +               host->addr_cs_field =3D GENMASK(20, 19);
> +               return 0x4;
>         }
>
> +       if (mtd->writesize =3D=3D SZ_2K) {
> +               switch (chipsize) {
> +               case SZ_128M:
> +                       host->addr_cs_field =3D GENMASK(17, 16);
> +                       return 0;
> +               case SZ_256M:
> +                       host->addr_cs_field =3D GENMASK(18, 17);
> +                       return 0x1;
> +               case SZ_512M:
> +                       host->addr_cs_field =3D GENMASK(19, 18);
> +                       return 0x2;
> +               case SZ_1G:
> +                       host->addr_cs_field =3D GENMASK(20, 19);
> +                       return 0x3;
> +               default:
> +                       goto err;
> +               }
> +       }
> +
> +       if (mtd->writesize =3D=3D SZ_8K) {
> +               switch (chipsize) {
> +               case SZ_4G:
> +                       host->addr_cs_field =3D GENMASK(20, 19);
> +                       return 0x5;
> +               case SZ_8G:
> +                       host->addr_cs_field =3D GENMASK(21, 20);
> +                       return 0x6;
> +               case SZ_16G:
> +                       host->addr_cs_field =3D GENMASK(22, 21);
> +                       return 0x7;
> +               default:
> +                       goto err;
> +               }
> +       }
> +
> +       if (mtd->writesize =3D=3D SZ_512) {
> +               switch (chipsize) {
> +               case SZ_8M:
> +                       host->addr_cs_field =3D GENMASK(15, 14);
> +                       return 0x9;
> +               case SZ_16M:
> +                       host->addr_cs_field =3D GENMASK(16, 15);
> +                       return 0xa;
> +               case SZ_32M:
> +                       host->addr_cs_field =3D GENMASK(17, 16);
> +                       return 0xb;
> +               case SZ_64M:
> +                       host->addr_cs_field =3D GENMASK(18, 17);
> +                       return 0xc;
> +               case SZ_128M:
> +                       host->addr_cs_field =3D GENMASK(19, 18);
> +                       return 0xd;
> +               default:
> +                       goto err;
> +               }
> +       }
> +
> +err:
> +       dev_err(host->dev, "Unsupported chip size: %llu MB with page size=
 %u B\n",
> +               chipsize, mtd->writesize);
> +       return -EINVAL;
> +}
> +
> +static int loongson_nand_attach_chip(struct nand_chip *chip)
> +{
> +       struct loongson_nand_host *host =3D nand_get_controller_data(chip=
);
> +       int cell_size =3D 0;
> +
> +       cell_size =3D loongson_nand_get_chip_capacity(chip);
> +       if (cell_size < 0)
> +               return cell_size;
> +
>         switch (chip->ecc.engine_type) {
>         case NAND_ECC_ENGINE_TYPE_NONE:
>                 break;
> @@ -818,6 +889,7 @@ static const struct loongson_nand_data ls1b_nand_data=
 =3D {
>         .status_field =3D GENMASK(15, 8),
>         .hold_cycle =3D 0x2,
>         .wait_cycle =3D 0xc,
> +       .nand_cs =3D 0x0,

The assignment `.nand_cs =3D 0x0` is redundant and can be removed.

>         .set_addr =3D ls1b_nand_set_addr,
>  };
>
> @@ -828,6 +900,7 @@ static const struct loongson_nand_data ls1c_nand_data=
 =3D {
>         .op_scope_field =3D GENMASK(29, 16),
>         .hold_cycle =3D 0x2,
>         .wait_cycle =3D 0xc,
> +       .nand_cs =3D 0x0,

Ditto.

>         .set_addr =3D ls1c_nand_set_addr,
>  };
>
> --
> 2.47.3
>


--=20
Best regards,

Keguang Zhang
