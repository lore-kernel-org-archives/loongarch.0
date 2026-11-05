Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880332;
	b=wSsrV4TCb9icJqCLSzONhABf63dOEc8iqN7LB5PzcXIfahqPuUJsRIvgQp7eRz3pAWLv
	 h6IRR3fpLnMnHNLX8nQEK0+ff6rgkm4F+P7zv76JFNJV+NTs1ffaoegkSWkq+75GYrxsD
	 yaZNeStKAZ9KuMTtqOnxJNEZE8VFW4+pXKRRfP74eMYV1CDqgcTmQCC+pxdLN5d4FRnIp
	 zB2Ax9Bw1cqSY3pMIEIlwqJOSmmCmOAEoSQu33aA62YydFZ1YNyzl+ySNmEcpcWYljW1p
	 Apf6xreofr9DMYyx1WbPeC3Kir+xKbcc/IeLtLPGeMOjwF1oKrpCidu0djFoDsm2vVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xxqwL3Dda53UbBWezaEVuIeSAMM2Wm5na/CSFudsxxc=;
	b=wX9pkCcFYFYwExIayKlY32qioahVvvzvsqy4VYwcGtTsEy5XvNCudJ1U+ELawWhw/LUe
	 94ns5Cboa49ZpXwQ/qm0fJmDY2yVP9bt/9H4+LCX6Rzrw5pcxrKSKpz5NW3N2xfNgLMYC
	 3oXVYU+secF/Xh+yxfAKdx4nbgC+6FHEOFHcftcloNy1/gxBEWIaBQAtn6485PRGJhXTb
	 ZrNRz+3hhm5KGV8DhW7VbmjsbUEotlz27f5WVa9WgVJUHvVWDEqcrws6NM1kqdzgCt5E2
	 qvZbIH8FEFEBWX9P47OnvXeZnxF7ix20tUQR11g0PYu6wsG6gkiyC4IYIs0HJ89Phag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LVrBVLj/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D90606A326
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 12:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D90606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVrBVLj/
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so722874e0c.0
        for <loongarch@lists.linux.dev>; Thu, 05 Nov 2026 04:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880331; cv=none;
        d=google.com; s=arc-20260327;
        b=PPddmaR2WOKDGdKVT++KiDuR/94oZdWz5V4AfTU88nX3CeyfF6WzT4+UVmOgWayRja
         ZdRx0yKUSTZOBZEktIh1yN+cE1lbXWqlG4ZOlRVegi2JfVwgFsdYJ84MzNWNohXmY/Tt
         erGV9GPsfZfekcPWkOO4nwTu9oW/jWyfk2+KJGOcTd+hvJuHo43vMH5ewXq/h4iGRhDL
         RPW/9rL8f2d6EVcVClfX8pGrzhd1quJmX+rqbdLZxxL9B+JWRLJfUSFIFVSwLIV6nA2H
         YT0Jt6/H7hlkYSxU6loaU9cE3XLZH7W69TlTYUZTJudESQO3Bpx5sYnwaKIupZhZCtK2
         lymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xxqwL3Dda53UbBWezaEVuIeSAMM2Wm5na/CSFudsxxc=;
        fh=zL7WSbKcDYkjJFix03aR3ylzJpMtoBVqE8zcnTli7mw=;
        b=a8RdAsR4xE+7OR1KO09RZKzTJMZzHAt/517IR6rznA0KXBzjFIWFa1OqmL1yLNXoq1
         FFa1AZT0rUvzKlwb7pjdEz6X/ecDnzReeJlVLaOHci8MDNoeNt8o4OHnM7vHAMmCtSZC
         KAQLK9RNDTB2JmWw+P93tgm4HeccR4j+4Zy8moNg5psZBTRFL4RpqVAhpxRLQsDF5cSY
         sH1sDbrLUy0wBDhu4AAzAqMXGRyraFnEn4iXlGUp9i1zOcTh48m5RBy8Pc1xb7zkkAl/
         61CzX9IHsuQCSAOynbIgeK+T66C3sgFmle7El8kN2HmwgW7A1LOiBPzhgKxroZDwj1p7
         1dUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880331; x=1794485131; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xxqwL3Dda53UbBWezaEVuIeSAMM2Wm5na/CSFudsxxc=;
        b=LVrBVLj/Y6uNg8a6WmYsQ7+bFVfOk1g641OgfVR1L9lC2NTcL09ak6Y76rPM/P4qSx
         DUNTzXBXB+Kn4W5iVbbr6SvPmVBdm08YbWDz4mxYBGyKcYuDxFMLUVQtPOc+yv1am5zP
         e91HWnknC1e8Ei0+BJuFCBrDOTne7dL/SiKvQ1uigyYH3FnU+Dzpd03EL2eZyihB8CJ0
         N8xLuaq0hF3lslaxbYl4sCL6Zp3YnNojNzWBx2yXytuk0LpmRjH7KNgWQO/bml/P2I/Q
         5N0lZmpgDW/rpayPHced/CCV2FTA8fmcUI0/5rPfU+t5Ujqf6pLvBsXD12dN2YE1SBB5
         lD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880331; x=1794485131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxqwL3Dda53UbBWezaEVuIeSAMM2Wm5na/CSFudsxxc=;
        b=YBbp8nisMlVKPjd4fFCNQu//OWP0uMF8x2ur2YB7tgtORvnKUlHbozLDPT5aBQs3A7
         kvV0eKQ7+9qiLdFBqU5yEkfwAlwfghJ5vxPSCqlcyeV4c9fuXUUDrfyqk/yYmSpHeQtj
         MHWXO6Y1NwG104H53rMVTWid3tbmzQcGdfCbs0POYMXV2O3eB8haavift8u/ZXxvR0Lg
         /WE9C73koFGMpxHJdSNn33kkNbF2KAyz/16dxatKsubwQER7AfuUIR9HwRVozvVtyxmx
         tqQQirbN5w0pDvm6C9Q54PofjF8PQpwx4GyH8vqAaxA9TJ7qrkip+mlo86hdvEK+Nhq6
         QzTw==
X-Forwarded-Encrypted: i=1; AKwUvByEUemRF//3WFKqBItKzP8kVoNYCKwUrGT8vdkpY+rzfk0AdktWd/C8SAO3V/OZJA6UPf8xQ/Cx5fg=@lists.linux.dev
X-Gm-Message-State: APuU4Z89hwQkPOtIoBw1LLBxZTISMQw71NYVXwjSRGbzNNzEscSy2dyW
	3IPtj+HF88FXu6p3HKh5mEXKgEWuYJQ8wVrbQnh5vQh5Rro49dnA/rOqcOSnukohh0Vu/rBSZpF
	CbPqwppxKIyYOVbgx58KclpbDb5W17eM=
X-Gm-Gg: AYBFou0X6u8O2EgNF70NhmnU05hndk+Ey5zkldZ4GWz8o4F+KhKv5G+uo1/RutELnYc
	IemcMfSWSqvVk1JaMWjOLZVScXaWjWuL/KnmUPY4aVsHlIggnmqIQdZMA3QJFhvcTCffwOirz73
	S2BIpfICbg/iIYtnRN7SR29eOlsmCEOAgsBE2GVx94Fz75vuZ+qCkN7qVZWsRVrgam5UC5IYJzm
	cSEofaUEsRlkeSB5kMkOhabAqB/YjupFAMtNXKSBI4miZlCoB6U46IuXvBZQFSUMRrTdREprw8V
	hsjz5RHmEm5H0Bg1bxyh+ChB/88vz5FgQq36/w4q1ZPrbXP2ADauStBftZGSVUHVniRtoFSreJz
	pQiR72lWW1fBldUXiLqJjV3pIFFi0jeVJH8Gk
X-Received: by 2002:a05:6123:109:b0:5ea:98fb:e9de with SMTP id
 71dfb90a1353d-5ec685210d5mr9091876e0c.3.1793880330706; Thu, 05 Nov 2026
 04:05:30 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793689461.git.zhoubinbin@loongson.cn> <17c0bde3ddc14f6f34eea98558f535d772e79623.1793689461.git.zhoubinbin@loongson.cn>
 <CAAhV-H4k_GkOOus2zGA=Cmnu9oo3HAeeCK2msGB41=NvPsvb=g@mail.gmail.com>
In-Reply-To: <CAAhV-H4k_GkOOus2zGA=Cmnu9oo3HAeeCK2msGB41=NvPsvb=g@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 5 Nov 2026 20:05:16 +0800
X-Gm-Features: AclHuK9ToNv3NE6Q1nKbC9dHcVxl3FTNA8v4hp3-w7uQab45XBn-378EpEIK4o4
Message-ID: <CAMpQs4+hk+hKqYcYgvQo23x8ctkCrd8MMjedpk_3DqP9VXkV1g@mail.gmail.com>
Subject: Re: [PATCH 6/8] spi: loongson: Move private definitions into the core driver
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Mark Brown <broonie@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:

On Wed, Nov 4, 2026 at 6:04=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Binbin,
>
> On Tue, Nov 3, 2026 at 3:08=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > The Loongson SPI register definitions and the private controller
> > structure are only used by the core driver.  Move them from the shared
> > header into spi-loongson-core.c and rename the structure to
> > loongson_spi_priv to make it clear that it is driver-private data.
> Moving is OK but renaming is unnecessary.

I agree this patch does too much and mixes the move with
unnecessary renaming and cleanups. Keeping the current structure and
naming seems better for now.

I'll drop this patch and respin the series without it.

>
> Huacai
>
> >
> > The shared header now only contains the exported init function and the
> > PM ops declaration, which reduces the surface exposed to the PCI and
> > platform glue drivers.
> >
> > While at it, update the copyright years and add MODULE_AUTHOR() entries
> > to the PCI and platform drivers.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  drivers/spi/spi-loongson-core.c | 252 +++++++++++++++++++-------------
> >  drivers/spi/spi-loongson-pci.c  |  19 +--
> >  drivers/spi/spi-loongson-plat.c |  11 +-
> >  drivers/spi/spi-loongson.h      |  53 +------
> >  4 files changed, 173 insertions(+), 162 deletions(-)
> >
> > diff --git a/drivers/spi/spi-loongson-core.c b/drivers/spi/spi-loongson=
-core.c
> > index 91d7acbe4302..082248f29ae7 100644
> > --- a/drivers/spi/spi-loongson-core.c
> > +++ b/drivers/spi/spi-loongson-core.c
> > @@ -1,21 +1,71 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > -// Loongson SPI Support
> > -// Copyright (C) 2023 Loongson Technology Corporation Limited
> > +//
> > +// Loongson SPI Controller driver
> > +//
> > +// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
> >
> >  #include <linux/clk.h>
> > -#include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/export.h>
> >  #include <linux/init.h>
> > -#include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
> > -#include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/spi/spi.h>
> >
> >  #include "spi-loongson.h"
> >
> > +/* SPI controller register offsets */
> > +#define LOONGSON_SPI_SPCR_REG          0x00
> > +#define LOONGSON_SPI_SPSR_REG          0x01
> > +#define LOONGSON_SPI_FIFO_REG          0x02
> > +#define LOONGSON_SPI_SPER_REG          0x03
> > +#define LOONGSON_SPI_PARA_REG          0x04
> > +#define LOONGSON_SPI_SFCS_REG          0x05
> > +#define LOONGSON_SPI_TIMI_REG          0x06
> > +
> > +/* SPCR bits */
> > +#define LOONGSON_SPI_SPCR_SPR          GENMASK(1, 0)
> > +#define LOONGSON_SPI_SPCR_CPHA         BIT(2)
> > +#define LOONGSON_SPI_SPCR_CPOL         BIT(3)
> > +#define LOONGSON_SPI_SPCR_SPE          BIT(6)
> > +#define LOONGSON_SPI_SPCR_SPIE         BIT(7)
> > +
> > +/* SPSR bits */
> > +#define LOONGSON_SPI_SPSR_RFEMPTY      BIT(0)
> > +#define LOONGSON_SPI_SPSR_RFFULL       BIT(1)
> > +#define LOONGSON_SPI_SPSR_WFEMPTY      BIT(2)
> > +#define LOONGSON_SPI_SPSR_WFFULL       BIT(3)
> > +#define LOONGSON_SPI_SPSR_WCOL         BIT(6)
> > +#define LOONGSON_SPI_SPSR_SPIF         BIT(7)
> > +
> > +/* SPER bits */
> > +#define LOONGSON_SPI_SPER_SPRE         GENMASK(1, 0)
> > +
> > +/* SFC_PARAM bits */
> > +#define LOONGSON_SPI_PARA_MEM_EN       BIT(0)
> > +
> > +#define LOONGSON_SPI_DIV_MIN           2
> > +#define LOONGSON_SPI_DIV_MAX           4096
> > +
> > +struct loongson_spi_suspend_store {
> > +       unsigned char           spcr;
> > +       unsigned char           sper;
> > +       unsigned char           spsr;
> > +       unsigned char           para;
> > +       unsigned char           sfcs;
> > +       unsigned char           timi;
> > +};
> > +
> > +struct loongson_spi_priv {
> > +       struct spi_controller   *controller;
> > +       void __iomem            *base;
> > +       unsigned int            hz;
> > +       unsigned int            mode;
> > +       u64                     clk_rate;
> > +       struct loongson_spi_suspend_store lss;
> > +};
> > +
> >  static const struct {
> >         unsigned int    div;
> >         unsigned char   spr;
> > @@ -35,38 +85,38 @@ static const struct {
> >         {4096, 3, 2 },
> >  };
> >
> > -static inline void loongson_spi_write_reg(struct loongson_spi *spi, un=
signed char reg,
> > +static inline void loongson_spi_write_reg(struct loongson_spi_priv *pr=
iv, unsigned char reg,
> >                                           unsigned char data)
> >  {
> > -       writeb(data, spi->base + reg);
> > +       writeb(data, priv->base + reg);
> >  }
> >
> > -static inline char loongson_spi_read_reg(struct loongson_spi *spi, uns=
igned char reg)
> > +static inline char loongson_spi_read_reg(struct loongson_spi_priv *pri=
v, unsigned char reg)
> >  {
> > -       return readb(spi->base + reg);
> > +       return readb(priv->base + reg);
> >  }
> >
> >  static void loongson_spi_set_cs(struct spi_device *spi, bool en)
> >  {
> > -       int cs;
> > +       struct loongson_spi_priv *priv =3D spi_controller_get_devdata(s=
pi->controller);
> >         unsigned char mask =3D (BIT(4) | BIT(0)) << spi_get_chipselect(=
spi, 0);
> > -       unsigned char val =3D en ? mask :  (BIT(0) << spi_get_chipselec=
t(spi, 0));
> > -       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(spi->controller);
> > +       unsigned char val =3D en ? mask : (BIT(0) << spi_get_chipselect=
(spi, 0));
> > +       int cs;
> >
> > -       cs =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SFCS_RE=
G) & ~mask;
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SFCS_REG, val=
 | cs);
> > +       cs =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SFCS_REG) & ~ma=
sk;
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SFCS_REG, val | cs);
> >  }
> >
> > -static int loongson_spi_set_clk(struct loongson_spi *loongson_spi, uns=
igned int hz)
> > +static int loongson_spi_set_clk(struct loongson_spi_priv *priv, unsign=
ed int hz)
> >  {
> >         unsigned long div;
> >         unsigned char val;
> >         unsigned int i;
> >
> > -       if (!hz || !loongson_spi->clk_rate)
> > +       if (!hz || !priv->clk_rate)
> >                 return -EINVAL;
> >
> > -       div =3D DIV_ROUND_UP_ULL(loongson_spi->clk_rate, hz);
> > +       div =3D DIV_ROUND_UP_ULL(priv->clk_rate, hz);
> >         if (div < LOONGSON_SPI_DIV_MIN)
> >                 div =3D LOONGSON_SPI_DIV_MIN;
> >
> > @@ -78,106 +128,106 @@ static int loongson_spi_set_clk(struct loongson_=
spi *loongson_spi, unsigned int
> >         if (i =3D=3D ARRAY_SIZE(loongson_spi_div_table))
> >                 return -EINVAL;
> >
> > -       val =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPCR_R=
EG);
> > +       val =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SPCR_REG);
> >         val &=3D ~GENMASK(1, 0);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG,
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPCR_REG,
> >                                val | loongson_spi_div_table[i].spr);
> >
> > -       val =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPER_R=
EG);
> > +       val =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SPER_REG);
> >         val &=3D ~GENMASK(1, 0);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPER_REG,
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPER_REG,
> >                                val | loongson_spi_div_table[i].spre);
> >
> > -       loongson_spi->hz =3D hz;
> > +       priv->hz =3D hz;
> >
> >         return 0;
> >  }
> >
> > -static void loongson_spi_set_mode(struct loongson_spi *loongson_spi,
> > +static void loongson_spi_set_mode(struct loongson_spi_priv *priv,
> >                                   struct spi_device *spi)
> >  {
> >         unsigned char val;
> >
> > -       val =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPCR_R=
EG);
> > +       val =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SPCR_REG);
> >         val &=3D ~(LOONGSON_SPI_SPCR_CPOL | LOONGSON_SPI_SPCR_CPHA);
> > +
> >         if (spi->mode & SPI_CPOL)
> >                 val |=3D LOONGSON_SPI_SPCR_CPOL;
> > +
> >         if (spi->mode & SPI_CPHA)
> >                 val |=3D LOONGSON_SPI_SPCR_CPHA;
> >
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, val=
);
> > -       loongson_spi->mode =3D spi->mode;
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPCR_REG, val);
> > +       priv->mode =3D spi->mode;
> >  }
> >
> > -static int loongson_spi_update_state(struct loongson_spi *loongson_spi=
,
> > -                               struct spi_device *spi, struct spi_tran=
sfer *t)
> > +static int loongson_spi_update_state(struct loongson_spi_priv *priv, s=
truct spi_device *spi,
> > +                                    struct spi_transfer *t)
> >  {
> >         int ret;
> >
> > -       if (t && loongson_spi->hz !=3D t->speed_hz) {
> > -               ret =3D loongson_spi_set_clk(loongson_spi, t->speed_hz)=
;
> > +       if (t && priv->hz !=3D t->speed_hz) {
> > +               ret =3D loongson_spi_set_clk(priv, t->speed_hz);
> >                 if (ret)
> >                         return ret;
> >         }
> >
> > -       if ((spi->mode ^ loongson_spi->mode) & SPI_MODE_X_MASK)
> > -               loongson_spi_set_mode(loongson_spi, spi);
> > +       if ((spi->mode ^ priv->mode) & SPI_MODE_X_MASK)
> > +               loongson_spi_set_mode(priv, spi);
> >
> >         return 0;
> >  }
> >
> >  static int loongson_spi_setup(struct spi_device *spi)
> >  {
> > -       struct loongson_spi *loongson_spi;
> > +       struct loongson_spi_priv *priv =3D spi_controller_get_devdata(s=
pi->controller);
> >
> > -       loongson_spi =3D spi_controller_get_devdata(spi->controller);
> >         if (spi->bits_per_word % 8)
> >                 return -EINVAL;
> >
> >         if (spi_get_chipselect(spi, 0) >=3D spi->controller->num_chipse=
lect)
> >                 return -EINVAL;
> >
> > -       loongson_spi->hz =3D 0;
> > +       priv->hz =3D 0;
> >         loongson_spi_set_cs(spi, !(spi->mode & SPI_CS_HIGH));
> >
> >         return 0;
> >  }
> >
> >  static int loongson_spi_write_read_8bit(struct spi_device *spi, const =
u8 **tx_buf,
> > -                                       u8 **rx_buf, unsigned int num)
> > +                                       u8 **rx_buf)
> >  {
> > -       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(spi->controller);
> > +       struct loongson_spi_priv *priv =3D spi_controller_get_devdata(s=
pi->controller);
> >         unsigned char status;
> >         int ret;
> >
> >         if (tx_buf && *tx_buf)
> > -               loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_FIFO_=
REG, *((*tx_buf)++));
> > +               loongson_spi_write_reg(priv, LOONGSON_SPI_FIFO_REG, *((=
*tx_buf)++));
> >         else
> > -               loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_FIFO_=
REG, 0);
> > +               loongson_spi_write_reg(priv, LOONGSON_SPI_FIFO_REG, 0);
> >
> > -       ret =3D readb_poll_timeout(loongson_spi->base + LOONGSON_SPI_SP=
SR_REG,
> > +       ret =3D readb_poll_timeout(priv->base + LOONGSON_SPI_SPSR_REG,
> >                                  status,
> >                                  !(status & LOONGSON_SPI_SPSR_RFEMPTY),
> >                                  1, USEC_PER_MSEC);
> >
> >         if (rx_buf && *rx_buf)
> > -               *(*rx_buf)++ =3D loongson_spi_read_reg(loongson_spi, LO=
ONGSON_SPI_FIFO_REG);
> > +               *(*rx_buf)++ =3D loongson_spi_read_reg(priv, LOONGSON_S=
PI_FIFO_REG);
> >         else
> > -               loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_FIFO_R=
EG);
> > +               loongson_spi_read_reg(priv, LOONGSON_SPI_FIFO_REG);
> >
> >         return ret;
> >  }
> >
> >  static int loongson_spi_write_read(struct spi_device *spi, struct spi_=
transfer *xfer)
> >  {
> > -       int ret;
> > -       unsigned int count;
> > +       unsigned int count =3D xfer->len;
> >         const u8 *tx =3D xfer->tx_buf;
> >         u8 *rx =3D xfer->rx_buf;
> > +       int ret;
> >
> > -       count =3D xfer->len;
> >         do {
> > -               ret =3D loongson_spi_write_read_8bit(spi, &tx, &rx, cou=
nt);
> > +               ret =3D loongson_spi_write_read_8bit(spi, &tx, &rx);
> >                 if (ret)
> >                         break;
> >         } while (--count);
> > @@ -185,25 +235,25 @@ static int loongson_spi_write_read(struct spi_dev=
ice *spi, struct spi_transfer *
> >         return ret;
> >  }
> >
> > -static int loongson_spi_prepare_message(struct spi_controller *ctlr, s=
truct spi_message *m)
> > +static int loongson_spi_prepare_message(struct spi_controller *host, s=
truct spi_message *m)
> >  {
> > -       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(ctlr);
> > +       struct loongson_spi_priv *priv =3D spi_controller_get_devdata(h=
ost);
> >         unsigned char para;
> >
> > -       para =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_PARA_=
REG);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG,
> > +       para =3D loongson_spi_read_reg(priv, LOONGSON_SPI_PARA_REG);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_PARA_REG,
> >                                para & ~LOONGSON_SPI_PARA_MEM_EN);
> >
> >         return 0;
> >  }
> >
> > -static int loongson_spi_transfer_one(struct spi_controller *ctrl, stru=
ct spi_device *spi,
> > +static int loongson_spi_transfer_one(struct spi_controller *host, stru=
ct spi_device *spi,
> >                                      struct spi_transfer *xfer)
> >  {
> > -       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(spi->controller);
> > +       struct loongson_spi_priv *priv =3D spi_controller_get_devdata(s=
pi->controller);
> >         int ret;
> >
> > -       ret =3D loongson_spi_update_state(loongson_spi, spi, xfer);
> > +       ret =3D loongson_spi_update_state(priv, spi, xfer);
> >         if (ret)
> >                 return ret;
> >
> > @@ -213,33 +263,33 @@ static int loongson_spi_transfer_one(struct spi_c=
ontroller *ctrl, struct spi_dev
> >         return 0;
> >  }
> >
> > -static int loongson_spi_unprepare_message(struct spi_controller *ctrl,=
 struct spi_message *m)
> > +static int loongson_spi_unprepare_message(struct spi_controller *host,=
 struct spi_message *m)
> >  {
> > -       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(ctrl);
> > +       struct loongson_spi_priv *priv =3D spi_controller_get_devdata(h=
ost);
> >         unsigned char para;
> >
> >         /* Restore the hardware SPI Flash read path */
> > -       para =3D loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_PARA_=
REG);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG,
> > +       para =3D loongson_spi_read_reg(priv, LOONGSON_SPI_PARA_REG);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_PARA_REG,
> >                                para | LOONGSON_SPI_PARA_MEM_EN);
> >
> >         return 0;
> >  }
> >
> > -static void loongson_spi_reginit(struct loongson_spi *loongson_spi_dev=
)
> > +static void loongson_spi_reginit(struct loongson_spi_priv *priv)
> >  {
> >         unsigned char val;
> >
> > -       val =3D loongson_spi_read_reg(loongson_spi_dev, LOONGSON_SPI_SP=
CR_REG);
> > +       val =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SPCR_REG);
> >         val &=3D ~LOONGSON_SPI_SPCR_SPE;
> > -       loongson_spi_write_reg(loongson_spi_dev, LOONGSON_SPI_SPCR_REG,=
 val);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPCR_REG, val);
> >
> > -       loongson_spi_write_reg(loongson_spi_dev, LOONGSON_SPI_SPSR_REG,
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPSR_REG,
> >                                (LOONGSON_SPI_SPSR_SPIF | LOONGSON_SPI_S=
PSR_WCOL));
> >
> > -       val =3D loongson_spi_read_reg(loongson_spi_dev, LOONGSON_SPI_SP=
CR_REG);
> > +       val =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SPCR_REG);
> >         val |=3D LOONGSON_SPI_SPCR_SPE;
> > -       loongson_spi_write_reg(loongson_spi_dev, LOONGSON_SPI_SPCR_REG,=
 val);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPCR_REG, val);
> >  }
> >
> >  static int loongson_spi_get_clk_rate(struct device *dev, u64 *clk_rate=
)
> > @@ -265,74 +315,73 @@ static int loongson_spi_get_clk_rate(struct devic=
e *dev, u64 *clk_rate)
> >
> >  int loongson_spi_init_controller(struct device *dev, void __iomem *reg=
s)
> >  {
> > -       struct spi_controller *controller;
> > -       struct loongson_spi *spi;
> > +       struct loongson_spi_priv *priv;
> > +       struct spi_controller *host;
> >         int ret;
> >
> > -       controller =3D devm_spi_alloc_host(dev, sizeof(struct loongson_=
spi));
> > -       if (controller =3D=3D NULL)
> > +       host =3D devm_spi_alloc_host(dev, sizeof(*priv));
> > +       if (!host)
> >                 return -ENOMEM;
> >
> > -       controller->mode_bits =3D SPI_MODE_X_MASK | SPI_CS_HIGH;
> > -       controller->setup =3D loongson_spi_setup;
> > -       controller->prepare_message =3D loongson_spi_prepare_message;
> > -       controller->transfer_one =3D loongson_spi_transfer_one;
> > -       controller->unprepare_message =3D loongson_spi_unprepare_messag=
e;
> > -       controller->set_cs =3D loongson_spi_set_cs;
> > -       controller->num_chipselect =3D 4;
> > -       dev_set_drvdata(dev, controller);
> > +       host->mode_bits =3D SPI_MODE_X_MASK | SPI_CS_HIGH;
> > +       host->setup =3D loongson_spi_setup;
> > +       host->prepare_message =3D loongson_spi_prepare_message;
> > +       host->transfer_one =3D loongson_spi_transfer_one;
> > +       host->unprepare_message =3D loongson_spi_unprepare_message;
> > +       host->set_cs =3D loongson_spi_set_cs;
> > +       host->num_chipselect =3D 4;
> > +       dev_set_drvdata(dev, host);
> >
> > -       spi =3D spi_controller_get_devdata(controller);
> > -       spi->base =3D regs;
> > -       spi->controller =3D controller;
> > +       priv =3D spi_controller_get_devdata(host);
> > +       priv->base =3D regs;
> > +       priv->controller =3D host;
> >
> > -       ret =3D loongson_spi_get_clk_rate(dev, &spi->clk_rate);
> > +       ret =3D loongson_spi_get_clk_rate(dev, &priv->clk_rate);
> >         if (ret)
> >                 return dev_err_probe(dev, ret, "unable to get clock rat=
e");
> >
> > -       loongson_spi_reginit(spi);
> > -
> > -       spi->mode =3D 0;
> > +       loongson_spi_reginit(priv);
> > +       priv->mode =3D 0;
> >
> > -       return devm_spi_register_controller(dev, controller);
> > +       return devm_spi_register_controller(dev, host);
> >  }
> >  EXPORT_SYMBOL_NS_GPL(loongson_spi_init_controller, "SPI_LOONGSON_CORE"=
);
> >
> >  static int loongson_spi_suspend(struct device *dev)
> >  {
> > -       struct spi_controller *controller =3D dev_get_drvdata(dev);
> > -       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(controller);
> > +       struct spi_controller *host =3D dev_get_drvdata(dev);
> > +       struct loongson_spi_priv *priv =3D spi_controller_get_devdata(h=
ost);
> >         int ret;
> >
> > -       ret =3D spi_controller_suspend(controller);
> > +       ret =3D spi_controller_suspend(host);
> >         if (ret)
> >                 return ret;
> >
> > -       loongson_spi->lss.spcr =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_SPCR_REG);
> > -       loongson_spi->lss.sper =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_SPER_REG);
> > -       loongson_spi->lss.spsr =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_SPSR_REG);
> > -       loongson_spi->lss.para =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_PARA_REG);
> > -       loongson_spi->lss.sfcs =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_SFCS_REG);
> > -       loongson_spi->lss.timi =3D loongson_spi_read_reg(loongson_spi, =
LOONGSON_SPI_TIMI_REG);
> > +       priv->lss.spcr =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SPC=
R_REG);
> > +       priv->lss.sper =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SPE=
R_REG);
> > +       priv->lss.spsr =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SPS=
R_REG);
> > +       priv->lss.para =3D loongson_spi_read_reg(priv, LOONGSON_SPI_PAR=
A_REG);
> > +       priv->lss.sfcs =3D loongson_spi_read_reg(priv, LOONGSON_SPI_SFC=
S_REG);
> > +       priv->lss.timi =3D loongson_spi_read_reg(priv, LOONGSON_SPI_TIM=
I_REG);
> >
> >         return 0;
> >  }
> >
> >  static int loongson_spi_resume(struct device *dev)
> >  {
> > -       struct spi_controller *controller =3D dev_get_drvdata(dev);
> > -       struct loongson_spi *loongson_spi =3D spi_controller_get_devdat=
a(controller);
> > +       struct spi_controller *host =3D dev_get_drvdata(dev);
> > +       struct loongson_spi_priv *priv =3D spi_controller_get_devdata(h=
ost);
> >
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, loo=
ngson_spi->lss.spcr);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPER_REG, loo=
ngson_spi->lss.sper);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_PARA_REG, loo=
ngson_spi->lss.para);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SFCS_REG, loo=
ngson_spi->lss.sfcs);
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_TIMI_REG, loo=
ngson_spi->lss.timi);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPCR_REG, priv->lss.s=
pcr);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPER_REG, priv->lss.s=
per);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_PARA_REG, priv->lss.p=
ara);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SFCS_REG, priv->lss.s=
fcs);
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_TIMI_REG, priv->lss.t=
imi);
> >
> > -       loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPSR_REG,
> > +       loongson_spi_write_reg(priv, LOONGSON_SPI_SPSR_REG,
> >                                LOONGSON_SPI_SPSR_SPIF | LOONGSON_SPI_SP=
SR_WCOL);
> >
> > -       spi_controller_resume(controller);
> > +       spi_controller_resume(host);
> >
> >         return 0;
> >  }
> > @@ -342,4 +391,5 @@ DEFINE_SIMPLE_DEV_PM_OPS(loongson_spi_dev_pm_ops, l=
oongson_spi_suspend, loongson
> >  EXPORT_SYMBOL_NS_GPL(loongson_spi_dev_pm_ops, "SPI_LOONGSON_CORE");
> >
> >  MODULE_DESCRIPTION("Loongson SPI core driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> >  MODULE_LICENSE("GPL");
> > diff --git a/drivers/spi/spi-loongson-pci.c b/drivers/spi/spi-loongson-=
pci.c
> > index ccc26efd88fe..ad90be956e1e 100644
> > --- a/drivers/spi/spi-loongson-pci.c
> > +++ b/drivers/spi/spi-loongson-pci.c
> > @@ -1,31 +1,31 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > +//
> >  // PCI interface driver for Loongson SPI Support
> > -// Copyright (C) 2023 Loongson Technology Corporation Limited
> > +//
> > +// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
> >
> >  #include <linux/pci.h>
> >
> >  #include "spi-loongson.h"
> >
> > -static int loongson_spi_pci_register(struct pci_dev *pdev,
> > -                       const struct pci_device_id *ent)
> > +static int loongson_spi_pci_register(struct pci_dev *pdev, const struc=
t pci_device_id *ent)
> >  {
> > -       int ret;
> > -       void __iomem *reg_base;
> >         struct device *dev =3D &pdev->dev;
> > -       int pci_bar =3D 0;
> > +       void __iomem *reg_base;
> > +       int pci_bar =3D 0, ret;
> >
> >         ret =3D pcim_enable_device(pdev);
> >         if (ret < 0)
> > -               return dev_err_probe(dev, ret, "cannot enable pci devic=
e\n");
> > +               return dev_err_probe(dev, ret, "cannot enable pci devic=
e");
> >
> >         reg_base =3D pcim_iomap_region(pdev, pci_bar, pci_name(pdev));
> >         ret =3D PTR_ERR_OR_ZERO(reg_base);
> >         if (ret)
> > -               return dev_err_probe(dev, ret, "failed to request and r=
emap memory\n");
> > +               return dev_err_probe(dev, ret, "failed to request and r=
emap memory");
> >
> >         ret =3D loongson_spi_init_controller(dev, reg_base);
> >         if (ret)
> > -               return dev_err_probe(dev, ret, "failed to initialize co=
ntroller\n");
> > +               return dev_err_probe(dev, ret, "failed to initialize co=
ntroller");
> >
> >         return 0;
> >  }
> > @@ -49,5 +49,6 @@ static struct pci_driver loongson_spi_pci_driver =3D =
{
> >  module_pci_driver(loongson_spi_pci_driver);
> >
> >  MODULE_DESCRIPTION("Loongson spi pci driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> >  MODULE_LICENSE("GPL");
> >  MODULE_IMPORT_NS("SPI_LOONGSON_CORE");
> > diff --git a/drivers/spi/spi-loongson-plat.c b/drivers/spi/spi-loongson=
-plat.c
> > index 6f8202264341..dcfbdd50e996 100644
> > --- a/drivers/spi/spi-loongson-plat.c
> > +++ b/drivers/spi/spi-loongson-plat.c
> > @@ -1,6 +1,8 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > +//
> >  // Platform driver for Loongson SPI Support
> > -// Copyright (C) 2023 Loongson Technology Corporation Limited
> > +//
> > +// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
> >
> >  #include <linux/err.h>
> >  #include <linux/platform_device.h>
> > @@ -9,9 +11,9 @@
> >
> >  static int loongson_spi_platform_probe(struct platform_device *pdev)
> >  {
> > -       int ret;
> > -       void __iomem *reg_base;
> >         struct device *dev =3D &pdev->dev;
> > +       void __iomem *reg_base;
> > +       int ret;
> >
> >         reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(reg_base))
> > @@ -19,7 +21,7 @@ static int loongson_spi_platform_probe(struct platfor=
m_device *pdev)
> >
> >         ret =3D loongson_spi_init_controller(dev, reg_base);
> >         if (ret)
> > -               return dev_err_probe(dev, ret, "failed to initialize co=
ntroller\n");
> > +               return dev_err_probe(dev, ret, "failed to initialize co=
ntroller");
> >
> >         return 0;
> >  }
> > @@ -42,5 +44,6 @@ static struct platform_driver loongson_spi_plat_drive=
r =3D {
> >  module_platform_driver(loongson_spi_plat_driver);
> >
> >  MODULE_DESCRIPTION("Loongson spi platform driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> >  MODULE_LICENSE("GPL");
> >  MODULE_IMPORT_NS("SPI_LOONGSON_CORE");
> > diff --git a/drivers/spi/spi-loongson.h b/drivers/spi/spi-loongson.h
> > index 89efd4ce69d8..c8b722bc5fb5 100644
> > --- a/drivers/spi/spi-loongson.h
> > +++ b/drivers/spi/spi-loongson.h
> > @@ -1,56 +1,13 @@
> >  /* SPDX-License-Identifier: GPL-2.0+ */
> > -/* Header File for Loongson SPI Driver. */
> > -/* Copyright (C) 2023 Loongson Technology Corporation Limited */
> > +//
> > +// Loongson SPI Support - common header
> > +//
> > +// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
> >
> >  #ifndef __LINUX_SPI_LOONGSON_H
> >  #define __LINUX_SPI_LOONGSON_H
> >
> > -#include <linux/bits.h>
> > -#include <linux/pm.h>
> > -#include <linux/types.h>
> > -
> > -#define        LOONGSON_SPI_SPCR_REG   0x00
> > -#define        LOONGSON_SPI_SPSR_REG   0x01
> > -#define        LOONGSON_SPI_FIFO_REG   0x02
> > -#define        LOONGSON_SPI_SPER_REG   0x03
> > -#define        LOONGSON_SPI_PARA_REG   0x04
> > -#define        LOONGSON_SPI_SFCS_REG   0x05
> > -#define        LOONGSON_SPI_TIMI_REG   0x06
> > -
> > -/* Bits definition for Loongson SPI register */
> > -#define        LOONGSON_SPI_PARA_MEM_EN        BIT(0)
> > -#define        LOONGSON_SPI_SPCR_CPHA  BIT(2)
> > -#define        LOONGSON_SPI_SPCR_CPOL  BIT(3)
> > -#define        LOONGSON_SPI_SPCR_SPE   BIT(6)
> > -#define        LOONGSON_SPI_SPSR_RFEMPTY       BIT(0)
> > -#define        LOONGSON_SPI_SPSR_WCOL  BIT(6)
> > -#define        LOONGSON_SPI_SPSR_SPIF  BIT(7)
> > -
> > -#define LOONGSON_SPI_DIV_MIN           2
> > -#define LOONGSON_SPI_DIV_MAX           4096
> > -
> > -struct device;
> > -struct spi_controller;
> > -
> > -struct loongson_spi_suspend_store {
> > -       unsigned char           spcr;
> > -       unsigned char           sper;
> > -       unsigned char           spsr;
> > -       unsigned char           para;
> > -       unsigned char           sfcs;
> > -       unsigned char           timi;
> > -};
> > -
> > -struct loongson_spi {
> > -       struct  spi_controller  *controller;
> > -       void __iomem            *base;
> > -       int                     cs_active;
> > -       unsigned int            hz;
> > -       unsigned int            mode;
> > -       u64                     clk_rate;
> > -       struct loongson_spi_suspend_store lss;
> > -};
> > -
> >  int loongson_spi_init_controller(struct device *dev, void __iomem *reg=
);
> >  extern const struct dev_pm_ops loongson_spi_dev_pm_ops;
> > +
> >  #endif /* __LINUX_SPI_LOONGSON_H */
> > --
> > 2.52.0
> >
> >

--=20
Thanks.
Binbin
