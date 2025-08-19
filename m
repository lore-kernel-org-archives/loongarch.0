Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF873115AE
	for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594781; cv=none; b=m9a8QAEMrViT3ThwoVj55ESEbeR7XSOAqtoIw7z1dFBDBqZsdLDdyOo/r2POCL+EKl2K9Ud5QpW0rvEhCS/cwrPppIDxQHvqj6WRPIVvtnxMPbotsC558gAokHL8DzyzIaJWugX7vL3K4/h0NLYLZVRKC+vorkp+RPOCv9Hhg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594781; c=relaxed/simple;
	bh=hX23j7dsulnQb3qwm/yyEwPtVm2ztW5gUNa134AftPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hu10lp1s9mrcBdp9KCZZnjCUzgggu6iSddHm0WbHylf7NdO5irx3bmDWIY/mwvb2Uy/Wg73/5vXfynuCHGGj29qaE200Z3D1JVqAFPLM89J9HEAFhS1xUQV/w8zsC+PPlyT90zQPPr+LvxEcTjJP0AY0Tp2kY6yp2nourki+KPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERDbWP1e; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERDbWP1e"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-333f8ef379dso42083481fa.1
        for <loongarch@lists.linux.dev>; Tue, 19 Aug 2025 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755594777; x=1756199577; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74yGB6r3oeNjA2oTCbBBDNzTu4wMGUZh+SF3lzw9h8M=;
        b=ERDbWP1eUQC9dlAs96WgwVZW6ArSkpfJ9WHz+7VWlK5dRpNbKW6nB6lgSxAjiYloib
         bcFYPCThqB0UwTRnJUYAPTdCYK/c+1bIZk2mKdK+H/ArKkFlmMppZM+24xOC/F5qTKEQ
         Bly+htmyrzUXksRzm2DojV7wbBL2Ge04dMh5aQfrxT50dtZBL7pzpfKzCvZjP587bs9N
         wb0VgfjA1QIhUaxThWw7yjsNbWQ12Q6qjVnpToRTemPWKf1pn1wo6MOHFOFWmg2Ns3ZP
         T/mGOgw9l5A+4I9KFiTHHy3n3BdPWrAotxu31heZruP4tsycBhhib47IduS0Y1keeWy3
         CFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594777; x=1756199577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74yGB6r3oeNjA2oTCbBBDNzTu4wMGUZh+SF3lzw9h8M=;
        b=r+OAw8UyYWbkEzfcEVeVSOwG4tPPajA8CgIgMVD97J1+cYJQ8vCvCfotUEdaKDxa3K
         CDGpZX/5xX9VBQ6emF7m8loTe3Wh+MzHcyJZRyhd9XE2g3Bjn4GiHJW1WBQ/FkPZ+kzV
         pbIBc9f4yBJ7gNkyItqDCWSRszvfkzEqTreY080/L7HdeAiqg3tSBjWvCzjBit+tRtI4
         Uro1y3VY5qtUa8cn4jmWN0PkTs1t4NorJs9scctRzPL2Qq5WwhlAextDT6z7e0BWE7+i
         mAZdCkkwlrNe6Pe7JZpFX66ZSdbVXTHPhV970LVL2HYX8Av8Jcm3jYJhCAKyxksGkfma
         6dJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaqd3sYwVj5FWMI4Sr9MTsn5WL51ehgqOsPw8WaXTVk92Z9lQlvk8CgY1Y7RIZLkkTtGVDLu10hdY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeinGDnxQ2TqWgjX3kgyOeNoVeAyWj2fQfsvWj4fcJka0kWE4F
	ofyHvWHYj2y+pRf8yKzbaV0fOrTQaYegOahLp/BXJX9TUJURX9e2oyiXGIA/4uibXT7Dt+/BGRn
	DMyXrcIY9jTcyQDIL6Rui9Ms5a8TDI3M=
X-Gm-Gg: ASbGnctim2Lz9HoFl9rfRJbyRD7t6uZpjhqwWmggS86AaUbDo+Fg21tidm59mqtXYwr
	SKyM/UTvJq0+3oamE4zvrCva+D3y98Lc8bjuFtSrmJfgfLw9Yg5ynCnoAFFLP5MSGParBJga3U6
	3HZ1roYbmQRyBbe/sjqHDekMH9uMNDVDmIIBMG0jHEDWaSo+n2IYlwZfR16F7/8idPDT9mqaW6z
	4y6LEG8YvzK5o1/6YFnfl+UGLK4jg==
X-Google-Smtp-Source: AGHT+IHnCuZwkUNL1S6jdDpuNsRm5DlUTzPVT+cua3tzwYB1PmVSOA+kfkXsI/P6mD4sLALRxJQB+xCbYxyTxrtWi78=
X-Received: by 2002:a2e:b8d6:0:b0:333:b6b0:e665 with SMTP id
 38308e7fff4ca-335307086d0mr5235541fa.30.1755594776962; Tue, 19 Aug 2025
 02:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <6b6ddac4728d3debcf2dbb7db82c6b69f9b4956f.1754890670.git.zhoubinbin@loongson.cn>
 <CAAhV-H49xGqd-Y+ffwwwVaES5ZGoCWp2dN_tSETFtBjsjgbC9A@mail.gmail.com>
In-Reply-To: <CAAhV-H49xGqd-Y+ffwwwVaES5ZGoCWp2dN_tSETFtBjsjgbC9A@mail.gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 19 Aug 2025 17:12:19 +0800
X-Gm-Features: Ac12FXy9EWtTLFIu2NHkn6-CTHcJ75AsCdxMDVkloBJBm5iSg6mvcqHHleFWEfw
Message-ID: <CAJhJPsWOgaKwfGPD9+BF9OtBpDwvOvr6-jX56Rh0PNRpWew3jw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mtd: rawnand: loongson: Add 6-byte NAND ID reading support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 2:37=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Mon, Aug 11, 2025 at 2:02=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > From: Keguang Zhang <keguang.zhang@gmail.com>
> >
> > Loongson-1C and Loongson-2K SoCs support NAND flash chips with 6-byte I=
D.
> > However, the current implementation only handles 5-byte ID which can le=
ad
> > to incorrect chip detection.
> >
> > Extend loongson_nand_read_id_type_exec() to support 6-byte NAND ID.
> >
> > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../mtd/nand/raw/loongson-nand-controller.c   | 29 +++++++++++++++----
> >  1 file changed, 23 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/=
mtd/nand/raw/loongson-nand-controller.c
> > index b5a7be0fcacc..97cd566420a8 100644
> > --- a/drivers/mtd/nand/raw/loongson-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
> > @@ -50,6 +50,9 @@
> >  #define LOONGSON_NAND_COL_ADDR_CYC     2U
> >  #define LOONGSON_NAND_MAX_ADDR_CYC     5U
> >
> > +#define LOONGSON_NAND_READ_ID_SLEEP_US         1000
> > +#define LOONGSON_NAND_READ_ID_TIMEOUT_US       5000
> > +
> >  #define BITS_PER_WORD                  (4 * BITS_PER_BYTE)
> >
> >  struct loongson_nand_host;
> > @@ -73,6 +76,8 @@ struct loongson_nand_op {
> >  };
> >
> >  struct loongson_nand_data {
> > +       unsigned int max_id_cycle;
> > +       unsigned int id_cycle_field;
> >         unsigned int status_field;
> >         unsigned int op_scope_field;
> >         unsigned int hold_cycle;
> > @@ -458,10 +463,10 @@ static int loongson_nand_read_id_type_exec(struct=
 nand_chip *chip, const struct
> >         struct loongson_nand_op op =3D {};
> >         int i, ret;
> >         union {
> > -               char ids[5];
> > +               char ids[6];
> >                 struct {
> >                         int idl;
> > -                       char idh;
> > +                       u16 idh;
> >                 };
> >         } nand_id;
> >
> > @@ -469,11 +474,16 @@ static int loongson_nand_read_id_type_exec(struct=
 nand_chip *chip, const struct
> >         if (ret)
> >                 return ret;
> >
> > -       nand_id.idl =3D readl(host->reg_base + LOONGSON_NAND_IDL);
> > -       nand_id.idh =3D readb(host->reg_base + LOONGSON_NAND_IDH_STATUS=
);
> > +       ret =3D regmap_read_poll_timeout(host->regmap, LOONGSON_NAND_ID=
L, nand_id.idl, nand_id.idl,
> > +                                      LOONGSON_NAND_READ_ID_SLEEP_US,
> > +                                      LOONGSON_NAND_READ_ID_TIMEOUT_US=
);
> The last two lines can be merged.
>
No, merging them would exceed 100 columns.

> Huacai
>
> > +       if (ret)
> > +               return ret;
> >
> > -       for (i =3D 0; i < min(sizeof(nand_id.ids), op.orig_len); i++)
> > -               op.buf[i] =3D nand_id.ids[sizeof(nand_id.ids) - 1 - i];
> > +       nand_id.idh =3D readw(host->reg_base + LOONGSON_NAND_IDH_STATUS=
);
> > +
> > +       for (i =3D 0; i < min(host->data->max_id_cycle, op.orig_len); i=
++)
> > +               op.buf[i] =3D nand_id.ids[host->data->max_id_cycle - 1 =
- i];
> >
> >         return ret;
> >  }
> > @@ -676,6 +686,10 @@ static int loongson_nand_controller_init(struct lo=
ongson_nand_host *host)
> >         if (IS_ERR(host->regmap))
> >                 return dev_err_probe(dev, PTR_ERR(host->regmap), "faile=
d to init regmap\n");
> >
> > +       if (host->data->id_cycle_field)
> > +               regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, h=
ost->data->id_cycle_field,
> > +                                  host->data->max_id_cycle << __ffs(ho=
st->data->id_cycle_field));
> > +
> >         chan =3D dma_request_chan(dev, "rxtx");
> >         if (IS_ERR(chan))
> >                 return dev_err_probe(dev, PTR_ERR(chan), "failed to req=
uest DMA channel\n");
> > @@ -800,6 +814,7 @@ static void loongson_nand_remove(struct platform_de=
vice *pdev)
> >  }
> >
> >  static const struct loongson_nand_data ls1b_nand_data =3D {
> > +       .max_id_cycle =3D 5,
> >         .status_field =3D GENMASK(15, 8),
> >         .hold_cycle =3D 0x2,
> >         .wait_cycle =3D 0xc,
> > @@ -807,6 +822,8 @@ static const struct loongson_nand_data ls1b_nand_da=
ta =3D {
> >  };
> >
> >  static const struct loongson_nand_data ls1c_nand_data =3D {
> > +       .max_id_cycle =3D 6,
> > +       .id_cycle_field =3D GENMASK(14, 12),
> >         .status_field =3D GENMASK(23, 16),
> >         .op_scope_field =3D GENMASK(29, 16),
> >         .hold_cycle =3D 0x2,
> > --
> > 2.47.3
> >



--=20
Best regards,

Keguang Zhang
