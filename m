Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9091757C9F
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754894265; cv=none; b=kk4BMVGGNFPPQh7VyrP0eExKsdSWQn+IyZXL5dHpzVITpLFkxMs3Bj0nuyCiSZP3NR2A2Rbj5lfS2iTv+qCT7uGMalFc+vGaLcc4VDgxl/Uc7c98TbzMXAQQQeIIGWrEUVuaFE1A7GsArAy/9vbuYb/e7KfOOzikjmmUcVrNicw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754894265; c=relaxed/simple;
	bh=7d8t96b0qezUmXbQCCOoNOM2QKR/WsFqklcLiZwHGPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyHSj+GQZKhn744yIURnF/XPei9n/WuXVPVQv54pw9f3uDCJzOta9Hd4gVDgdUlgZDI+zmv4OfdbQTNu4ZFRybgFxPR8gY5PruQ/g4hbqfKlVdD/MBRDV9renZUrwxrU9WfKsl67RmVZioLl+XskPlwpxSNC4sAUjq1Ai8A8sGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zp5dLXu+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zp5dLXu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38131C4CEF9
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754894265;
	bh=7d8t96b0qezUmXbQCCOoNOM2QKR/WsFqklcLiZwHGPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zp5dLXu+Lq/q5B8Okvor9u08lpxr+S+HVBhmpMPd80dtJr1sFHquR6PDKVi2+AZmn
	 uhcjbvWUigWIavAXi7mNszMvkQ1iugom96haN6Unb56Xbw5EtGNljF1vcQJXEHH5Pl
	 ifJB0Ely/hijj0/aXhXTBk5CQlOtilYJokdVI9sJC1KM4khk17lXKKPkCwg/NqoLVD
	 kwx9QW7NxCZY682bOmlQIj31P0T+1hZvl+Zyp6Dm/8W3/Eovid9plWakw7Eyw35Kt7
	 3rgjbjIkCZeufls/05fsLSmF10c5j1zBJ2RUzkXAdYyIn1ejIDQVwa8hRNqKsbcbk7
	 +2zV2W+eJuzhg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6b7so4665388a12.2
        for <loongarch@lists.linux.dev>; Sun, 10 Aug 2025 23:37:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlKyBQGE3fvgO5ebg5BfgHijclWr3qO2POJQwOeq2qKIg7MM7m5W/7y7OeHQxamX1wQF84EffQCL8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyjzw3c9LcFA2ycEYvQvYa7lFaiaBQraPOSXZnCeGwnC3rbvXL
	R0SJgBN+BbW9RqJh/mkAn2A9A6xUeup28Z9yZArZJ4hBRnbmIbYhIinXPtzCqpJDaJptA4rOIkA
	/x4F1e0993UG9tjd40TqMOUaIy/yV+eQ=
X-Google-Smtp-Source: AGHT+IGfEMnAcApCso1Pq2FL+AFwDit+/6rHiFN1Xv32lctHH6W1GNaPJ2XUoinBbz1h7eQmwl0i3f08hpe/cuPyR80=
X-Received: by 2002:a17:907:86a0:b0:af9:621f:c219 with SMTP id
 a640c23a62f3a-af9c6525a5cmr1030367866b.51.1754894263682; Sun, 10 Aug 2025
 23:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <6b6ddac4728d3debcf2dbb7db82c6b69f9b4956f.1754890670.git.zhoubinbin@loongson.cn>
In-Reply-To: <6b6ddac4728d3debcf2dbb7db82c6b69f9b4956f.1754890670.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 11 Aug 2025 14:37:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H49xGqd-Y+ffwwwVaES5ZGoCWp2dN_tSETFtBjsjgbC9A@mail.gmail.com>
X-Gm-Features: Ac12FXxbTT750dgKQ0qF-YxJ472Kiw5CWbv592pJMs2LDxPid6stBAPMaKfL9uI
Message-ID: <CAAhV-H49xGqd-Y+ffwwwVaES5ZGoCWp2dN_tSETFtBjsjgbC9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mtd: rawnand: loongson: Add 6-byte NAND ID reading support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Mon, Aug 11, 2025 at 2:02=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> From: Keguang Zhang <keguang.zhang@gmail.com>
>
> Loongson-1C and Loongson-2K SoCs support NAND flash chips with 6-byte ID.
> However, the current implementation only handles 5-byte ID which can lead
> to incorrect chip detection.
>
> Extend loongson_nand_read_id_type_exec() to support 6-byte NAND ID.
>
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../mtd/nand/raw/loongson-nand-controller.c   | 29 +++++++++++++++----
>  1 file changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mt=
d/nand/raw/loongson-nand-controller.c
> index b5a7be0fcacc..97cd566420a8 100644
> --- a/drivers/mtd/nand/raw/loongson-nand-controller.c
> +++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
> @@ -50,6 +50,9 @@
>  #define LOONGSON_NAND_COL_ADDR_CYC     2U
>  #define LOONGSON_NAND_MAX_ADDR_CYC     5U
>
> +#define LOONGSON_NAND_READ_ID_SLEEP_US         1000
> +#define LOONGSON_NAND_READ_ID_TIMEOUT_US       5000
> +
>  #define BITS_PER_WORD                  (4 * BITS_PER_BYTE)
>
>  struct loongson_nand_host;
> @@ -73,6 +76,8 @@ struct loongson_nand_op {
>  };
>
>  struct loongson_nand_data {
> +       unsigned int max_id_cycle;
> +       unsigned int id_cycle_field;
>         unsigned int status_field;
>         unsigned int op_scope_field;
>         unsigned int hold_cycle;
> @@ -458,10 +463,10 @@ static int loongson_nand_read_id_type_exec(struct n=
and_chip *chip, const struct
>         struct loongson_nand_op op =3D {};
>         int i, ret;
>         union {
> -               char ids[5];
> +               char ids[6];
>                 struct {
>                         int idl;
> -                       char idh;
> +                       u16 idh;
>                 };
>         } nand_id;
>
> @@ -469,11 +474,16 @@ static int loongson_nand_read_id_type_exec(struct n=
and_chip *chip, const struct
>         if (ret)
>                 return ret;
>
> -       nand_id.idl =3D readl(host->reg_base + LOONGSON_NAND_IDL);
> -       nand_id.idh =3D readb(host->reg_base + LOONGSON_NAND_IDH_STATUS);
> +       ret =3D regmap_read_poll_timeout(host->regmap, LOONGSON_NAND_IDL,=
 nand_id.idl, nand_id.idl,
> +                                      LOONGSON_NAND_READ_ID_SLEEP_US,
> +                                      LOONGSON_NAND_READ_ID_TIMEOUT_US);
The last two lines can be merged.

Huacai

> +       if (ret)
> +               return ret;
>
> -       for (i =3D 0; i < min(sizeof(nand_id.ids), op.orig_len); i++)
> -               op.buf[i] =3D nand_id.ids[sizeof(nand_id.ids) - 1 - i];
> +       nand_id.idh =3D readw(host->reg_base + LOONGSON_NAND_IDH_STATUS);
> +
> +       for (i =3D 0; i < min(host->data->max_id_cycle, op.orig_len); i++=
)
> +               op.buf[i] =3D nand_id.ids[host->data->max_id_cycle - 1 - =
i];
>
>         return ret;
>  }
> @@ -676,6 +686,10 @@ static int loongson_nand_controller_init(struct loon=
gson_nand_host *host)
>         if (IS_ERR(host->regmap))
>                 return dev_err_probe(dev, PTR_ERR(host->regmap), "failed =
to init regmap\n");
>
> +       if (host->data->id_cycle_field)
> +               regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, hos=
t->data->id_cycle_field,
> +                                  host->data->max_id_cycle << __ffs(host=
->data->id_cycle_field));
> +
>         chan =3D dma_request_chan(dev, "rxtx");
>         if (IS_ERR(chan))
>                 return dev_err_probe(dev, PTR_ERR(chan), "failed to reque=
st DMA channel\n");
> @@ -800,6 +814,7 @@ static void loongson_nand_remove(struct platform_devi=
ce *pdev)
>  }
>
>  static const struct loongson_nand_data ls1b_nand_data =3D {
> +       .max_id_cycle =3D 5,
>         .status_field =3D GENMASK(15, 8),
>         .hold_cycle =3D 0x2,
>         .wait_cycle =3D 0xc,
> @@ -807,6 +822,8 @@ static const struct loongson_nand_data ls1b_nand_data=
 =3D {
>  };
>
>  static const struct loongson_nand_data ls1c_nand_data =3D {
> +       .max_id_cycle =3D 6,
> +       .id_cycle_field =3D GENMASK(14, 12),
>         .status_field =3D GENMASK(23, 16),
>         .op_scope_field =3D GENMASK(29, 16),
>         .hold_cycle =3D 0x2,
> --
> 2.47.3
>
