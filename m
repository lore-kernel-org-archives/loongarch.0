Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E75327BF4
	for <loongarch@lists.linux.dev>; Tue, 10 Feb 2026 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770724959; cv=pass; b=AXrX8RRa4/u46FcNuzgd4zAvw7zSzj5wc268wY9skNe7V9aMuD7VHIu1QnASa7sHzLktSMxMwdXG02O5mnpz5BYJokIctWbEokEOJJMp7JY9QNeo0BVqWPbn38UEP0TFZKnkGCZGjjONDkMNJ2nkgb5dCOv21Gm6inx9eRCDzRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770724959; c=relaxed/simple;
	bh=UigD3+OqF1+MEDsJ2x11N2Ieayddz/LZ6ZxRwaRYViU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kI4BQWnC9aph0zm8U1SUxTn6ipmZ4fQlB/TkB0CKv7pzD/br9GOph9rzIWOFnWEJVE71X0X17fjzpIw99ao1NpkzyHqv6dlf+u9XtWC0NsluA9Cp3iOgjDF4sQ2oU8rHjsA10Fx6coP6sLjWtlyWInOvsA6Eppru/hjfgvcJAlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsSVhlgI; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsSVhlgI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b885a18f620so854643366b.3
        for <loongarch@lists.linux.dev>; Tue, 10 Feb 2026 04:02:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770724955; cv=none;
        d=google.com; s=arc-20240605;
        b=KSyF6lMcC6exzi9llowteF61bRAoxfHNKNWdDJVhvAcSGa/DNGE7sjJ3sMUjSIRqRq
         QbVrNs4UjhecfWGw+hGoSD7wNDYDt19+aeAzrVAY/NLY01u4nAAHtp+NId0FDxD+MaGH
         4xZydpf7REhP59SkxePqmgnoiQWMuaAUEnuWrgJXvT2cW3QRskuNzrLIsrPhWRTepAKQ
         qwnY5f4DupbkUJJIPGSn16A4B6M/ROQHh5PULn++8GfwEMS9tG92JuZgkywxC1gJuJUJ
         g27EK288Idu7GVx3MPZ/rEQK3L68Ht5KZU1xqOG+EJJglmgKHaNpeCHzPXX3llBhEdhe
         djXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jlobonFksXUw3edm8WG+pAaHV9pn5FXEA80gC0oc9ww=;
        fh=wrob2KIh/QDsXqx/H6EIhCbZ1FZSLAfVn+p6ehcyOaU=;
        b=FTX/GBnZ0lC46b2sAIpf3hsXmIZOUl5qu3iKB/t/cqBq1UwTevMidmeyX+CaF/2WLk
         5aVb3WnZr1oUd0sB/AuVUzMnZtVu97wbJ0W+N2uO3yzYgjVShw9o737uCverkliug2Vv
         oArvd3jKobhWhmZcAxfeCrh4DbTL4J0hWtg721bvGejhg71s+BWFQpumcQtXLXxSShT7
         DkRAClFynENeEajBhAkmUfq/qu5r2y45aIusEAn3JM34csQF+vCyj+qW/+4fPLFc9SCg
         XsRQzXqd0GUxdy5MetKBka+0OXJ7hF9wA9Bm6hOR/BQgDFOAlzLpO8iisKbbLVeFzAcO
         XVjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770724955; x=1771329755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlobonFksXUw3edm8WG+pAaHV9pn5FXEA80gC0oc9ww=;
        b=CsSVhlgIaqLHfy6hxkFNLHtA2yWkacWth7u/dbOcLcWiW1KBA6pGxNxr0MBViZs305
         IPz3sv8e4K08T/K6qxGqfPAqBfmFKr89jcJqkjT2v2ZR0GyywOU75IRu+YNbumUaPD5X
         R+P6b9GIppR0eKIqZyPs7xofJfOtkDmfJJ904gEzNOc16KbbSfPHu/uXbfqqr4w5R4Vk
         VJPHN/+nUF+lSpLHc7Z1IU9mPGCO+qaWj7EV6S1OpQKfDVnaZOwYeIeCrlt4yAJdj5iB
         uyXbdkm/wL3dy0P+GcIwRMMAdWwNnzCrYBBAoL5Kx/7oF5KGa0BZPFwijMqGJ072ldQ5
         biXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770724955; x=1771329755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jlobonFksXUw3edm8WG+pAaHV9pn5FXEA80gC0oc9ww=;
        b=oDanB0QKUOBmZmJaqL11muwxYn3mk60Ux8f6aSgSbK6gtLyba78oKUMi9D+j77kyK8
         QsI4TXdZhowr4IrvtPrb2XdqJK4YCsLCgbfaEgE78CRVdwCIQchjaO26a5Wqmj59qE2Q
         OJ4WgsVT2qo/OL8k5NyIGvNR7Ro0MMzCFnLu3hZmbp0ma8yrTySkwbF6Kaj61eFsjKoz
         l50MM1Pk0ISPXHQd7vwTlIwRXaLZfikSKmGmnWa0twI7WuaJEgty0kaS8VT34nas+3NU
         h1sjK2oSVkOzWMhMumwXE9KN6KYiVUUScGYReaDSU/JK6r4w0UKGmkH/eCm9kMrGbXHP
         ecxg==
X-Forwarded-Encrypted: i=1; AJvYcCXjUtoqAIYhHakuTxTy0y0GmM5R+zM4VJhJGjH5PYLvgm31HIo5f9rEjEsvBGMYT0VCUYTUtXFfvZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNqBNaqfizNiYM8DNBoqaFKdcjOTW+3vyyaMF4aT01LNXI9q+z
	o8RFn+l+zB8wcfVgrRCTUbhhj2633DTsDOwHu5wXqLMofA6qgsRW7LK1e2wWXizVptl6bQJ5WBm
	gniQn+T9rgTlRjEw7Rb+fdRwtg0iSHG4=
X-Gm-Gg: AZuq6aI4ZoPH7ETVderqhAXYJRGVUFfMQVdLf6ngOL+7mca3FUyloPYRFSkYlgk9asF
	jNrBcBjEhhFcPHNudM1vb1oXsLJt8rHaV6AcVoMph8gunMcLKY4heU/rtMf7Y8sMjILtDNuwaek
	9Zr6pIy8cvWYPHcwO5lwRik2EV9UPywOMCKFUgzvt09v3XVkJ0RkgfLWwsxC4+gXYloxjk1y/WO
	dmtpkOYXBjHifg2yD8Mzx1/AnMF1gGDP4KGaB1V0wP1l0PMG/5+6qqua4skpHqZiMWr6q1ixRhl
	2FCirMsUBA==
X-Received: by 2002:a17:906:f595:b0:b83:1326:a504 with SMTP id
 a640c23a62f3a-b8f546a2f80mr118964266b.60.1770724954237; Tue, 10 Feb 2026
 04:02:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770605931.git.zhoubinbin@loongson.cn> <a0eac5b7ba0bcced9664ff64349e563da3d031b3.1770605931.git.zhoubinbin@loongson.cn>
 <aYoTtQ01VGXEW2Fu@lizhi-Precision-Tower-5810> <CAMpQs4JwDSWCXYFiPXNf1pKbYqUK+9hLXYsQsG+rQQqi_eZJwQ@mail.gmail.com>
In-Reply-To: <CAMpQs4JwDSWCXYFiPXNf1pKbYqUK+9hLXYsQsG+rQQqi_eZJwQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 10 Feb 2026 20:02:21 +0800
X-Gm-Features: AZwV_Qh19JlE9vSf5r1_Lgk0soTVFM4ClXo7_J90T1vOIasgyK6DG6AN_Q2Nd2w
Message-ID: <CAMpQs4KSyj3HFrY0Qn_ZByekVWu3-re__6TAE=nU+uC_VfKB8w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dmaengine: loongson: New driver for the Loongson
 Multi-Channel DMA controller
To: Frank Li <Frank.li@nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org, jeffbai@aosc.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Tue, Feb 10, 2026 at 3:41=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.com=
> wrote:
>
> Hi Frank:
>
> Thanks for your reply.
>
> On Tue, Feb 10, 2026 at 1:05=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote=
:
> >
> > On Mon, Feb 09, 2026 at 11:04:55AM +0800, Binbin Zhou wrote:
> > > This DMA controller appears in Loongson-2K0300 and Loongson-2K3000.
> > >
> > > It is a chain multi-channel controller that enables data transfers fr=
om
> > > memory to memory, device to memory, and memory to device, as well as
> > > channel prioritization configurable through the channel configuration
> > > registers.
> > >
> > > In addition, there are slight differences between Loongson-2K0300 and
> > > Loongson-2K3000, such as channel register offsets and the number of
> > > channels.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  MAINTAINERS                                  |   1 +
> > >  drivers/dma/loongson/Kconfig                 |  10 +
> > >  drivers/dma/loongson/Makefile                |   1 +
> > >  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 736 +++++++++++++++++=
++
> > >  4 files changed, 748 insertions(+)
> > >  create mode 100644 drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index d3cb541aee2a..61a39070d7a0 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -14778,6 +14778,7 @@ L:    dmaengine@vger.kernel.org
> > >  S:   Maintained
> > >  F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yam=
l
> > >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> > > +F:   drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > >  F:   drivers/dma/loongson/loongson2-apb-dma.c
> > >
> > >  LOONGSON LS2X I2C DRIVER
> > > diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kcon=
fig
> > > index 9dbdaef5a59f..28b3daeed4e3 100644
> > > --- a/drivers/dma/loongson/Kconfig
> > > +++ b/drivers/dma/loongson/Kconfig
> > > @@ -25,4 +25,14 @@ config LOONGSON2_APB_DMA
> > >         This DMA controller transfers data from memory to peripheral =
fifo.
> > >         It does not support memory to memory data transfer.
> > >
> > > +config LOONGSON2_APB_CMC_DMA
> > > +     tristate "Loongson2 Chain Multi-Channel DMA support"
> > > +     select DMA_ENGINE
> > > +     select DMA_VIRTUAL_CHANNELS
> > > +     help
> > > +       Support for the Loongson Chain Multi-Channel DMA controller d=
river.
> > > +       It is discovered on the Loongson-2K chip (Loongson-2K0300/Loo=
ngson-2K3000),
> > > +       which has 4/8 channels internally, enabling bidirectional dat=
a transfer
> > > +       between devices and memory.
> > > +
> > >  endif
> > > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Mak=
efile
> > > index 6cdd08065e92..48c19781e729 100644
> > > --- a/drivers/dma/loongson/Makefile
> > > +++ b/drivers/dma/loongson/Makefile
> > > @@ -1,3 +1,4 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >  obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > >  obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> > > +obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-cmc-dma.o
> > > diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/d=
ma/loongson/loongson2-apb-cmc-dma.c
> > > new file mode 100644
> > > index 000000000000..f598ad095686
> > > --- /dev/null
> > > +++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > > @@ -0,0 +1,736 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Looongson-2 Multi-Channel DMA Controller driver
> > > + *
> > > + * Copyright (C) 2024-2026 Loongson Technology Corporation Limited
> > > + */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/acpi_dma.h>
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/dmapool.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_dma.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "../dmaengine.h"
> > > +#include "../virt-dma.h"
> > > +
> > > +#define LOONGSON2_CMCDMA_ISR         0x0     /* DMA Interrupt Status=
 Register */
> > > +#define LOONGSON2_CMCDMA_IFCR                0x4     /* DMA Interrup=
t Flag Clear Register */
> > > +#define LOONGSON2_CMCDMA_CCR         0x8     /* DMA Channel Configur=
ation Register */
> > > +#define LOONGSON2_CMCDMA_CNDTR               0xc     /* DMA Channel =
Transmit Count Register */
> > > +#define LOONGSON2_CMCDMA_CPAR                0x10    /* DMA Channel =
Peripheral Address Register */
> > > +#define LOONGSON2_CMCDMA_CMAR                0x14    /* DMA Channel =
Memory Address Register */
> > > +
> > > +/* Bitfields of DMA interrupt status register */
> > > +#define LOONGSON2_CMCDMA_TCI         BIT(1) /* Transfer Complete Int=
errupt */
> > > +#define LOONGSON2_CMCDMA_HTI         BIT(2) /* Half Transfer Interru=
pt */
> > > +#define LOONGSON2_CMCDMA_TEI         BIT(3) /* Transfer Error Interr=
upt */
> > > +
> > > +#define LOONGSON2_CMCDMA_MASKI               \
> > > +     (LOONGSON2_CMCDMA_TCI | LOONGSON2_CMCDMA_HTI | LOONGSON2_CMCDMA=
_TEI)
> > > +
> > > +/* Bitfields of DMA channel x Configuration Register */
> > > +#define LOONGSON2_CMCDMA_CCR_EN              BIT(0) /* Stream Enable=
 */
> > > +#define LOONGSON2_CMCDMA_CCR_TCIE    BIT(1) /* Transfer Complete Int=
errupt Enable */
> > > +#define LOONGSON2_CMCDMA_CCR_HTIE    BIT(2) /* Half Transfer Complet=
e Interrupt Enable */
> > > +#define LOONGSON2_CMCDMA_CCR_TEIE    BIT(3) /* Transfer Error Interr=
upt Enable */
> > > +#define LOONGSON2_CMCDMA_CCR_DIR     BIT(4) /* Data Transfer Directi=
on */
> > > +#define LOONGSON2_CMCDMA_CCR_CIRC    BIT(5) /* Circular mode */
> > > +#define LOONGSON2_CMCDMA_CCR_PINC    BIT(6) /* Peripheral increment =
mode */
> > > +#define LOONGSON2_CMCDMA_CCR_MINC    BIT(7) /* Memory increment mode=
 */
> > > +#define LOONGSON2_CMCDMA_CCR_PSIZE_MASK      GENMASK(9, 8)
> > > +#define LOONGSON2_CMCDMA_CCR_MSIZE_MASK      GENMASK(11, 10)
> > > +#define LOONGSON2_CMCDMA_CCR_PL_MASK GENMASK(13, 12)
> > > +#define LOONGSON2_CMCDMA_CCR_M2M     BIT(14)
> > > +
> > > +#define LOONGSON2_CMCDMA_CCR_CFG_MASK        \
> > > +     (LOONGSON2_CMCDMA_CCR_PINC | LOONGSON2_CMCDMA_CCR_MINC | LOONGS=
ON2_CMCDMA_CCR_PL_MASK)
> > > +
> > > +#define LOONGSON2_CMCDMA_CCR_IRQ_MASK        \
> > > +     (LOONGSON2_CMCDMA_CCR_TCIE | LOONGSON2_CMCDMA_CCR_HTIE | LOONGS=
ON2_CMCDMA_CCR_TEIE)
> > > +
> > > +#define LOONGSON2_CMCDMA_STREAM_MASK \
> > > +     (LOONGSON2_CMCDMA_CCR_CFG_MASK | LOONGSON2_CMCDMA_CCR_IRQ_MASK)
> > > +
> > > +#define LOONGSON2_CMCDMA_BUSWIDTHS   (BIT(DMA_SLAVE_BUSWIDTH_1_BYTE)=
 | \
> > > +                                      BIT(DMA_SLAVE_BUSWIDTH_2_BYTES=
) | \
> > > +                                      BIT(DMA_SLAVE_BUSWIDTH_4_BYTES=
))
> > > +
> > > +enum loongson2_cmc_dma_width {
> > > +     LOONGSON2_CMCDMA_BYTE,
> > > +     LOONGSON2_CMCDMA_HALF_WORD,
> > > +     LOONGSON2_CMCDMA_WORD,
> > > +};
> > > +
> > > +struct loongson2_cmc_dma_chan_reg {
> > > +     u32 ccr;
> > > +     u32 cndtr;
> > > +     u32 cpar;
> > > +     u32 cmar;
> > > +};
> > > +
> > > +struct loongson2_cmc_dma_sg_req {
> > > +     u32 len;
> > > +     struct loongson2_cmc_dma_chan_reg chan_reg;
> > > +};
> > > +
> > > +struct loongson2_cmc_dma_desc {
> > > +     struct virt_dma_desc vdesc;
> > > +     bool cyclic;
> > > +     u32 num_sgs;
> > > +     struct loongson2_cmc_dma_sg_req sg_req[] __counted_by(num_sgs);
> > > +};
> > > +
> > > +struct loongson2_cmc_dma_chan {
> > > +     struct virt_dma_chan vchan;
> > > +     struct dma_slave_config dma_sconfig;
> > > +     struct loongson2_cmc_dma_desc *desc;
> > > +     u32 id;
> > > +     u32 irq;
> > > +     u32 next_sg;
> > > +     struct loongson2_cmc_dma_chan_reg chan_reg;
> > > +};
> > > +
> > > +struct loongson2_cmc_dma_config {
> > > +     u32 max_channels;
> > > +     u32 chan_reg_offset;
> > > +};
> > > +
> > > +struct loongson2_cmc_dma_dev {
> > > +     struct dma_device ddev;
> > > +     struct clk *dma_clk;
> > > +     void __iomem *base;
> > > +     u32 nr_channels;
> > > +     u32 chan_reg_offset;
> > > +     struct loongson2_cmc_dma_chan chan[] __counted_by(nr_channels);
> > > +};
> > > +
> > > +static const struct loongson2_cmc_dma_config ls2k0300_cmc_dma_config=
 =3D {
> > > +     .max_channels =3D 8,
> > > +     .chan_reg_offset =3D 0x14,
> > > +};
> > > +
> > > +static const struct loongson2_cmc_dma_config ls2k3000_cmc_dma_config=
 =3D {
> > > +     .max_channels =3D 4,
> > > +     .chan_reg_offset =3D 0x18,
> > > +};
> > > +
> > > +static struct loongson2_cmc_dma_dev *lmdma_get_dev(struct loongson2_=
cmc_dma_chan *lchan)
> > > +{
> > > +     return container_of(lchan->vchan.chan.device, struct loongson2_=
cmc_dma_dev, ddev);
> > > +}
> > > +
> > > +static struct loongson2_cmc_dma_chan *to_lmdma_chan(struct dma_chan =
*chan)
> > > +{
> > > +     return container_of(chan, struct loongson2_cmc_dma_chan, vchan.=
chan);
> > > +}
> > > +
> > > +static struct loongson2_cmc_dma_desc *to_lmdma_desc(struct virt_dma_=
desc *vdesc)
> > > +{
> > > +     return container_of(vdesc, struct loongson2_cmc_dma_desc, vdesc=
);
> > > +}
> > > +
> > > +static struct device *chan2dev(struct loongson2_cmc_dma_chan *lchan)
> > > +{
> > > +     return &lchan->vchan.chan.dev->device;
> > > +}
> > > +
> > > +static u32 loongson2_cmc_dma_read(struct loongson2_cmc_dma_dev *ldde=
v, u32 reg, u32 id)
> > > +{
> > > +     return readl(lddev->base + (reg + lddev->chan_reg_offset * id))=
;
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_write(struct loongson2_cmc_dma_dev *ld=
dev, u32 reg, u32 id, u32 val)
> > > +{
> > > +     writel(val, lddev->base + (reg + lddev->chan_reg_offset * id));
> > > +}
> > > +
> > > +static int loongson2_cmc_dma_get_width(struct loongson2_cmc_dma_chan=
 *lchan,
> > > +                                    enum dma_slave_buswidth width)
> > > +{
> > > +     switch (width) {
> > > +     case DMA_SLAVE_BUSWIDTH_1_BYTE:
> > > +             return LOONGSON2_CMCDMA_BYTE;
> > > +     case DMA_SLAVE_BUSWIDTH_2_BYTES:
> > > +             return LOONGSON2_CMCDMA_HALF_WORD;
> > > +     case DMA_SLAVE_BUSWIDTH_4_BYTES:
> > > +             return LOONGSON2_CMCDMA_WORD;
> >
> > is ffs() helper in case your hardware support more buswidth in future?
>
> It seems there's no need for us to do this.
> The data width setting bit in the DMA channel configuration register
> only has two bits (LOONGSON2_CMCDMA_CCR_PSIZE_MASK). The bitmask
> values are: 8-bit/16-bit/32-bit/reserved.

Sorry, I checked again, the ffs() helper can make the code cleaner:

static int loongson2_cmc_dma_get_width(enum dma_slave_buswidth width)
{
        switch (width) {
        case DMA_SLAVE_BUSWIDTH_1_BYTE:
        case DMA_SLAVE_BUSWIDTH_2_BYTES:
        case DMA_SLAVE_BUSWIDTH_4_BYTES:
                return ffs(width) - 1;
        default:
                return -EINVAL;
        }
}

And the enum loongson2_cmc_dma_width{ } can be dropped.

> >
> > > +     default:
> > > +             dev_err(chan2dev(lchan), "Dma bus width not supported\n=
");
> > > +             return -EINVAL;
> > > +     }
> > > +}
> > > +
> > > +static int loongson2_cmc_dma_slave_config(struct dma_chan *chan, str=
uct dma_slave_config *config)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
> > > +
> > > +     memcpy(&lchan->dma_sconfig, config, sizeof(*config));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_irq_clear(struct loongson2_cmc_dma_cha=
n *lchan, u32 flags)
> > > +{
> > > +     struct loongson2_cmc_dma_dev *lddev =3D lmdma_get_dev(lchan);
> > > +     u32 ifcr;
> > > +
> > > +     ifcr =3D flags << (4 * lchan->id);
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_IFCR, 0, ifcr);
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_stop(struct loongson2_cmc_dma_chan *lc=
han)
> > > +{
> > > +     struct loongson2_cmc_dma_dev *lddev =3D lmdma_get_dev(lchan);
> > > +     u32 ccr;
> > > +
> > > +     ccr =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CCR, lch=
an->id);
> > > +     ccr &=3D ~(LOONGSON2_CMCDMA_CCR_IRQ_MASK | LOONGSON2_CMCDMA_CCR=
_EN);
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id,=
 ccr);
> > > +
> > > +     loongson2_cmc_dma_irq_clear(lchan, LOONGSON2_CMCDMA_MASKI);
> > > +}
> > > +
> > > +static int loongson2_cmc_dma_terminate_all(struct dma_chan *chan)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
> > > +     unsigned long flags;
> > > +
> > > +     LIST_HEAD(head);
> > > +
> > > +     spin_lock_irqsave(&lchan->vchan.lock, flags);
> > > +     if (lchan->desc) {
> > > +             vchan_terminate_vdesc(&lchan->desc->vdesc);
> > > +             loongson2_cmc_dma_stop(lchan);
> > > +             lchan->desc =3D NULL;
> > > +     }
> > > +     vchan_get_all_descriptors(&lchan->vchan, &head);
> > > +     spin_unlock_irqrestore(&lchan->vchan.lock, flags);
> > > +
> > > +     vchan_dma_desc_free_list(&lchan->vchan, &head);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_synchronize(struct dma_chan *chan)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
> > > +
> > > +     vchan_synchronize(&lchan->vchan);
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_start_transfer(struct loongson2_cmc_dm=
a_chan *lchan)
> > > +{
> > > +     struct loongson2_cmc_dma_dev *lddev =3D lmdma_get_dev(lchan);
> > > +     struct loongson2_cmc_dma_sg_req *sg_req;
> > > +     struct loongson2_cmc_dma_chan_reg *reg;
> > > +     struct virt_dma_desc *vdesc;
> > > +
> > > +     loongson2_cmc_dma_stop(lchan);
> > > +
> > > +     if (!lchan->desc) {
> > > +             vdesc =3D vchan_next_desc(&lchan->vchan);
> > > +             if (!vdesc)
> > > +                     return;
> > > +
> > > +             list_del(&vdesc->node);
> > > +             lchan->desc =3D to_lmdma_desc(vdesc);
> > > +             lchan->next_sg =3D 0;
> > > +     }
> > > +
> > > +     if (lchan->next_sg =3D=3D lchan->desc->num_sgs)
> > > +             lchan->next_sg =3D 0;
> > > +
> > > +     sg_req =3D &lchan->desc->sg_req[lchan->next_sg];
> > > +     reg =3D &sg_req->chan_reg;
> > > +
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id,=
 reg->ccr);
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CNDTR, lchan->i=
d, reg->cndtr);
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CPAR, lchan->id=
, reg->cpar);
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CMAR, lchan->id=
, reg->cmar);
> > > +
> > > +     lchan->next_sg++;
> > > +
> > > +     /* Start DMA */
> > > +     reg->ccr |=3D LOONGSON2_CMCDMA_CCR_EN;
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, lchan->id,=
 reg->ccr);
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_configure_next_sg(struct loongson2_cmc=
_dma_chan *lchan)
> > > +{
> > > +     struct loongson2_cmc_dma_dev *lddev =3D lmdma_get_dev(lchan);
> > > +     struct loongson2_cmc_dma_sg_req *sg_req;
> > > +     u32 ccr, id =3D lchan->id;
> > > +
> > > +     if (lchan->next_sg =3D=3D lchan->desc->num_sgs)
> > > +             lchan->next_sg =3D 0;
> > > +
> > > +     /* stop to update mem addr */
> > > +     ccr =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CCR, id)=
;
> > > +     ccr &=3D ~LOONGSON2_CMCDMA_CCR_EN;
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, id, ccr);
> > > +
> > > +     sg_req =3D &lchan->desc->sg_req[lchan->next_sg];
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CMAR, id, sg_re=
q->chan_reg.cmar);
> > > +
> > > +     /* start transition */
> > > +     ccr |=3D LOONGSON2_CMCDMA_CCR_EN;
> > > +     loongson2_cmc_dma_write(lddev, LOONGSON2_CMCDMA_CCR, id, ccr);
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_handle_chan_done(struct loongson2_cmc_=
dma_chan *lchan)
> > > +{
> > > +     if (!lchan->desc)
> > > +             return;
> > > +
> > > +     if (lchan->desc->cyclic) {
> > > +             vchan_cyclic_callback(&lchan->desc->vdesc);
> > > +             /* LOONGSON2_CMCDMA_CCR_CIRC mode don't need update reg=
ister */
> > > +             if (lchan->desc->num_sgs =3D=3D 1)
> > > +                     return;
> > > +             loongson2_cmc_dma_configure_next_sg(lchan);
> > > +             lchan->next_sg++;
> > > +     } else {
> > > +             if (lchan->next_sg =3D=3D lchan->desc->num_sgs) {
> > > +                     vchan_cookie_complete(&lchan->desc->vdesc);
> > > +                     lchan->desc =3D NULL;
> > > +             }
> > > +             loongson2_cmc_dma_start_transfer(lchan);
> > > +     }
> > > +}
> > > +
> > > +static irqreturn_t loongson2_cmc_dma_chan_irq(int irq, void *devid)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D devid;
> > > +     struct loongson2_cmc_dma_dev *lddev =3D lmdma_get_dev(lchan);
> > > +     u32 ists, status, scr;
> > > +
> > > +     spin_lock(&lchan->vchan.lock);
> > > +
> > > +     ists =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_ISR, 0)=
;
> > > +     scr =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CCR, lch=
an->id);
> > > +
> > > +     status =3D (ists >> (4 * lchan->id)) & LOONGSON2_CMCDMA_MASKI;
> > > +     status &=3D scr;
> > > +
> > > +     if (status & LOONGSON2_CMCDMA_TCI)
> > > +             loongson2_cmc_dma_handle_chan_done(lchan);
> > > +
> > > +     if (status & LOONGSON2_CMCDMA_HTI)
> > > +             loongson2_cmc_dma_irq_clear(lchan, LOONGSON2_CMCDMA_HTI=
);
> > > +
> > > +     if (status & LOONGSON2_CMCDMA_TEI)
> > > +             dev_err(chan2dev(lchan), "DMA Transform Error\n");
> > > +
> > > +     loongson2_cmc_dma_irq_clear(lchan, status);
> >
> > irq clear should before loongson2_cmc_dma_handle_chan_done() incase you
> > missed irq, if loongson2_cmc_dma_handle_chan_done() trigger new irq bef=
ore
> > your call irq_cler().

Yes, this part should be refracted, how about the following code:

        spin_lock(&lchan->vchan.lock);

        ccr =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CCR, lchan->=
id);
        ists =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_ISR, 0);
        status =3D (ists >> (4 * lchan->id)) & LOONGSON2_CMCDMA_MASKI;

        if (status & LOONGSON2_CMCDMA_TCI) {
                loongson2_cmc_dma_irq_clear(lchan, LOONGSON2_CMCDMA_TCI);
                if (ccr & LOONGSON2_CMCDMA_CCR_TCIE)
                        loongson2_cmc_dma_handle_chan_done(lchan);
                status &=3D ~LOONGSON2_CMCDMA_TCI;
        }

        if (status & LOONGSON2_CMCDMA_HTI) {
                loongson2_cmc_dma_irq_clear(lchan, LOONGSON2_CMCDMA_HTI);
                status &=3D ~LOONGSON2_CMCDMA_HTI;
        }

        if (status & LOONGSON2_CMCDMA_TEI) {
                loongson2_cmc_dma_irq_clear(lchan, LOONGSON2_CMCDMA_HTI);
                dev_err(chan2dev(lchan), "DMA Transform Error\n");
                if (!(ccr & LOONGSON2_CMCDMA_CCR_EN))
                        dev_err(chan2dev(lchan), "chan disabled by HW\n");
        }

        spin_unlock(&lchan->vchan.lock);

> >
> > > +
> > > +     spin_unlock(&lchan->vchan.lock);
> > > +
> > > +     return IRQ_HANDLED;
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_issue_pending(struct dma_chan *chan)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
> > > +     unsigned long flags;
> > > +
> > > +     spin_lock_irqsave(&lchan->vchan.lock, flags);
> > > +     if (vchan_issue_pending(&lchan->vchan) && !lchan->desc) {
> > > +             dev_dbg(chan2dev(lchan), "vchan %pK: issued\n", &lchan-=
>vchan);
> > > +             loongson2_cmc_dma_start_transfer(lchan);
> > > +     }
> > > +     spin_unlock_irqrestore(&lchan->vchan.lock, flags);
> > > +}
> > > +
> > > +static int loongson2_cmc_dma_set_xfer_param(struct loongson2_cmc_dma=
_chan *lchan,
> > > +                                         enum dma_transfer_direction=
 direction,
> > > +                                         enum dma_slave_buswidth *bu=
swidth, u32 buf_len)
> > > +{
> > > +     struct dma_slave_config sconfig =3D lchan->dma_sconfig;
> > > +     int dev_width;
> > > +     u32 ccr;
> > > +
> > > +     switch (direction) {
> > > +     case DMA_MEM_TO_DEV:
> > > +             dev_width =3D loongson2_cmc_dma_get_width(lchan, sconfi=
g.dst_addr_width);
> > > +             if (dev_width < 0)
> > > +                     return dev_width;
> > > +             lchan->chan_reg.cpar =3D sconfig.dst_addr;
> > > +             ccr =3D LOONGSON2_CMCDMA_CCR_DIR;
> > > +             *buswidth =3D sconfig.dst_addr_width;
> > > +             break;
> > > +     case DMA_DEV_TO_MEM:
> > > +             dev_width =3D loongson2_cmc_dma_get_width(lchan, sconfi=
g.src_addr_width);
> > > +             if (dev_width < 0)
> > > +                     return dev_width;
> > > +             lchan->chan_reg.cpar =3D sconfig.src_addr;
> > > +             ccr =3D LOONGSON2_CMCDMA_CCR_MINC;
> > > +             *buswidth =3D sconfig.src_addr_width;
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     ccr |=3D FIELD_PREP(LOONGSON2_CMCDMA_CCR_PSIZE_MASK, dev_width)=
 |
> > > +            FIELD_PREP(LOONGSON2_CMCDMA_CCR_MSIZE_MASK, dev_width);
> > > +
> > > +     /* Set DMA control register */
> > > +     lchan->chan_reg.ccr &=3D ~(LOONGSON2_CMCDMA_CCR_PSIZE_MASK | LO=
ONGSON2_CMCDMA_CCR_MSIZE_MASK);
> > > +     lchan->chan_reg.ccr |=3D ccr;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static struct dma_async_tx_descriptor *
> > > +loongson2_cmc_dma_prep_slave_sg(struct dma_chan *chan, struct scatte=
rlist *sgl, u32 sg_len,
> > > +                             enum dma_transfer_direction direction,
> > > +                             unsigned long flags, void *context)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
> > > +     struct loongson2_cmc_dma_desc *desc;
> > > +     enum dma_slave_buswidth buswidth;
> > > +     struct scatterlist *sg;
> > > +     u32 num_items, i;
> > > +     int ret;
> > > +
> > > +     desc =3D kzalloc(struct_size(desc, sg_req, sg_len), GFP_NOWAIT)=
;
> > > +     if (!desc)
> > > +             return NULL;
> > > +
> > > +     for_each_sg(sgl, sg, sg_len, i) {
> > > +             ret =3D loongson2_cmc_dma_set_xfer_param(lchan, directi=
on, &buswidth, sg_dma_len(sg));
> > > +             if (ret)
> > > +                     return NULL;
> > > +
> > > +             desc->sg_req[i].len =3D sg_dma_len(sg);
> > > +
> > > +             num_items =3D desc->sg_req[i].len / buswidth;
> > > +             if (num_items >=3D SZ_64K) {
> > > +                     dev_err(chan2dev(lchan), "Number of items not s=
upported\n");
> > > +                     kfree(desc);
> > > +                     return NULL;
> >
> > if use sg_nents_for_dma(), you can use multi sg to trasfer more than 64=
K
> > data.
>
> Sorry, are you referring to sg_nents_for_len()?
> 64K is a hardware limitation of the controller, so it seems impossible
> to resolve it using that function, right?
>
> >
> > > +             }
> > > +             desc->sg_req[i].chan_reg.ccr =3D lchan->chan_reg.ccr;
> > > +             desc->sg_req[i].chan_reg.cpar =3D lchan->chan_reg.cpar;
> > > +             desc->sg_req[i].chan_reg.cmar =3D sg_dma_address(sg);
> > > +             desc->sg_req[i].chan_reg.cndtr =3D num_items;
> > > +     }
> > > +
> > > +     desc->num_sgs =3D sg_len;
> > > +     desc->cyclic =3D false;
> > > +
> > > +     return vchan_tx_prep(&lchan->vchan, &desc->vdesc, flags);
> > > +}
> > > +
> > > +static struct dma_async_tx_descriptor *
> > > +loongson2_cmc_dma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t =
buf_addr, size_t buf_len,
> > > +                               size_t period_len, enum dma_transfer_=
direction direction,
> > > +                               unsigned long flags)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
> > > +     struct loongson2_cmc_dma_desc *desc;
> > > +     enum dma_slave_buswidth buswidth;
> > > +     u32 num_periods, num_items, i;
> > > +     int ret;
> > > +
> > > +     if (unlikely(buf_len % period_len))
> > > +             return NULL;
> > > +
> > > +     ret =3D loongson2_cmc_dma_set_xfer_param(lchan, direction, &bus=
width, period_len);
> > > +     if (ret)
> > > +             return NULL;
> > > +
> > > +     num_items =3D period_len / buswidth;
> > > +     if (num_items >=3D SZ_64K) {
> > > +             dev_err(chan2dev(lchan), "Number of items not supported=
\n");
> > > +             return NULL;
> > > +     }
> > > +
> > > +     /* Enable Circular mode */
> > > +     if (buf_len =3D=3D period_len)
> > > +             lchan->chan_reg.ccr |=3D LOONGSON2_CMCDMA_CCR_CIRC;
> > > +
> > > +     num_periods =3D buf_len / period_len;
> > > +     desc =3D kzalloc(struct_size(desc, sg_req, num_periods), GFP_NO=
WAIT);
> > > +     if (!desc)
> > > +             return NULL;
> > > +
> > > +     for (i =3D 0; i < num_periods; i++) {
> > > +             desc->sg_req[i].len =3D period_len;
> > > +             desc->sg_req[i].chan_reg.ccr =3D lchan->chan_reg.ccr;
> > > +             desc->sg_req[i].chan_reg.cpar =3D lchan->chan_reg.cpar;
> > > +             desc->sg_req[i].chan_reg.cmar =3D buf_addr;
> > > +             desc->sg_req[i].chan_reg.cndtr =3D num_items;
> > > +             buf_addr +=3D period_len;
> > > +     }
> > > +
> > > +     desc->num_sgs =3D num_periods;
> > > +     desc->cyclic =3D true;
> > > +
> > > +     return vchan_tx_prep(&lchan->vchan, &desc->vdesc, flags);
> > > +}
> > > +
> > > +static size_t loongson2_cmc_dma_desc_residue(struct loongson2_cmc_dm=
a_chan *lchan,
> > > +                                          struct loongson2_cmc_dma_d=
esc *desc, u32 next_sg)
> > > +{
> > > +     struct loongson2_cmc_dma_dev *lddev =3D lmdma_get_dev(lchan);
> > > +     u32 residue, width, ndtr, ccr, i;
> > > +
> > > +     ccr =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CCR, lch=
an->id);
> > > +     width =3D FIELD_GET(LOONGSON2_CMCDMA_CCR_PSIZE_MASK, ccr);
> > > +
> > > +     ndtr =3D loongson2_cmc_dma_read(lddev, LOONGSON2_CMCDMA_CNDTR, =
lchan->id);
> > > +     residue =3D ndtr << width;
> > > +
> > > +     if (lchan->desc->cyclic && next_sg =3D=3D 0)
> > > +             return residue;
> > > +
> > > +     for (i =3D next_sg; i < desc->num_sgs; i++)
> > > +             residue +=3D desc->sg_req[i].len;
> > > +
> > > +     return residue;
> > > +}
> > > +
> > > +static enum dma_status loongson2_cmc_dma_tx_status(struct dma_chan *=
chan, dma_cookie_t cookie,
> > > +                                                struct dma_tx_state =
*state)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
> > > +     struct virt_dma_desc *vdesc;
> > > +     enum dma_status status;
> > > +     unsigned long flags;
> > > +
> > > +     status =3D dma_cookie_status(chan, cookie, state);
> > > +     if (status =3D=3D DMA_COMPLETE || !state)
> > > +             return status;
> > > +
> > > +     spin_lock_irqsave(&lchan->vchan.lock, flags);
> > > +     vdesc =3D vchan_find_desc(&lchan->vchan, cookie);
> > > +     if (lchan->desc && cookie =3D=3D lchan->desc->vdesc.tx.cookie)
> > > +             state->residue =3D loongson2_cmc_dma_desc_residue(lchan=
, lchan->desc, lchan->next_sg);
> > > +     else if (vdesc)
> > > +             state->residue =3D loongson2_cmc_dma_desc_residue(lchan=
, to_lmdma_desc(vdesc), 0);
> > > +
> > > +     spin_unlock_irqrestore(&lchan->vchan.lock, flags);
> > > +
> > > +     return status;
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_free_chan_resources(struct dma_chan *c=
han)
> > > +{
> > > +     vchan_free_chan_resources(to_virt_chan(chan));
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_desc_free(struct virt_dma_desc *vdesc)
> > > +{
> > > +     kfree(to_lmdma_desc(vdesc));
> > > +}
> > > +
> > > +static bool loongson2_cmc_dma_acpi_filter(struct dma_chan *chan, voi=
d *param)
> > > +{
> > > +     struct loongson2_cmc_dma_chan *lchan =3D to_lmdma_chan(chan);
> > > +     struct acpi_dma_spec *dma_spec =3D param;
> > > +
> > > +     memset(&lchan->chan_reg, 0, sizeof(struct loongson2_cmc_dma_cha=
n_reg));
> > > +     lchan->chan_reg.ccr =3D dma_spec->chan_id & LOONGSON2_CMCDMA_ST=
REAM_MASK;
> > > +
> > > +     return true;
> > > +}
> > > +
> > > +static int loongson2_cmc_dma_acpi_controller_register(struct loongso=
n2_cmc_dma_dev *lddev)
> > > +{
> > > +     struct device *dev =3D lddev->ddev.dev;
> > > +     struct acpi_dma_filter_info *info;
> > > +     int ret;
> > > +
> > > +     if (!has_acpi_companion(dev))
> > > +             return 0;
> > > +
> > > +     info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> > > +     if (!info)
> > > +             return -ENOMEM;
> > > +
> > > +     dma_cap_zero(info->dma_cap);
> > > +     info->dma_cap =3D lddev->ddev.cap_mask;
> > > +     info->filter_fn =3D loongson2_cmc_dma_acpi_filter;
> > > +
> > > +     ret =3D devm_acpi_dma_controller_register(dev, acpi_dma_simple_=
xlate, info);
> > > +     if (ret)
> > > +             dev_err(dev, "could not register acpi_dma_controller\n"=
);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static struct dma_chan *loongson2_cmc_dma_of_xlate(struct of_phandle=
_args *dma_spec,
> > > +                                                struct of_dma *ofdma=
)
> > > +{
> > > +     struct loongson2_cmc_dma_dev *lddev =3D ofdma->of_dma_data;
> > > +     struct device *dev =3D lddev->ddev.dev;
> > > +     struct loongson2_cmc_dma_chan *lchan;
> > > +     struct dma_chan *chan;
> > > +
> > > +     if (dma_spec->args_count < 2)
> > > +             return NULL;
> > > +
> > > +     if (dma_spec->args[0] >=3D lddev->nr_channels) {
> > > +             dev_err(dev, "Invalid channel id\n");
> > > +             return NULL;
> > > +     }
> > > +
> > > +     lchan =3D &lddev->chan[dma_spec->args[0]];
> > > +     chan =3D dma_get_slave_channel(&lchan->vchan.chan);
> > > +     if (!chan) {
> > > +             dev_err(dev, "No more channels available\n");
> > > +             return NULL;
> > > +     }
> > > +
> > > +     memset(&lchan->chan_reg, 0, sizeof(struct loongson2_cmc_dma_cha=
n_reg));
> > > +     lchan->chan_reg.ccr =3D dma_spec->args[1] & LOONGSON2_CMCDMA_ST=
REAM_MASK;
> > > +
> > > +     return chan;
> > > +}
> > > +
> > > +static int loongson2_cmc_dma_of_controller_register(struct loongson2=
_cmc_dma_dev *lddev)
> > > +{
> > > +     struct device *dev =3D lddev->ddev.dev;
> > > +     int ret;
> > > +
> > > +     if (!dev->of_node)
> > > +             return 0;
> > > +
> > > +     ret =3D of_dma_controller_register(dev->of_node, loongson2_cmc_=
dma_of_xlate, lddev);
> > > +     if (ret)
> > > +             dev_err(dev, "could not register of_dma_controller\n");
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int loongson2_cmc_dma_probe(struct platform_device *pdev)
> > > +{
> > > +     const struct loongson2_cmc_dma_config *config;
> > > +     struct loongson2_cmc_dma_chan *lchan;
> > > +     struct loongson2_cmc_dma_dev *lddev;
> > > +     struct device *dev =3D &pdev->dev;
> > > +     struct dma_device *ddev;
> > > +     u32 nr_chans, i;
> > > +     int ret;
> > > +
> > > +     config =3D (const struct loongson2_cmc_dma_config *)device_get_=
match_data(dev);
> > > +     if (!config)
> > > +             return -EINVAL;
> > > +
> > > +     ret =3D device_property_read_u32(dev, "dma-channels", &nr_chans=
);
> > > +     if (ret || nr_chans > config->max_channels) {
> > > +             dev_err(dev, "missing or invalid dma-channels property\=
n");
> > > +             nr_chans =3D config->max_channels;
> > > +     }
> > > +
> > > +     lddev =3D devm_kzalloc(dev, struct_size(lddev, chan, nr_chans),=
 GFP_KERNEL);
> > > +     if (!lddev)
> > > +             return -ENOMEM;
> > > +
> > > +     lddev->base =3D devm_platform_ioremap_resource(pdev, 0);
> > > +     if (IS_ERR(lddev->base))
> > > +             return PTR_ERR(lddev->base);
> > > +
> > > +     platform_set_drvdata(pdev, lddev);
> > > +     lddev->nr_channels =3D nr_chans;
> > > +     lddev->chan_reg_offset =3D config->chan_reg_offset;
> > > +
> > > +     lddev->dma_clk =3D devm_clk_get_optional_enabled(dev, NULL);
> > > +     if (IS_ERR(lddev->dma_clk))
> > > +             return dev_err_probe(dev, PTR_ERR(lddev->dma_clk), "Fai=
led to get dma clock\n");
> > > +
> > > +     ddev =3D &lddev->ddev;
> > > +     ddev->dev =3D dev;
> > > +
> > > +     dma_cap_zero(ddev->cap_mask);
> > > +     dma_cap_set(DMA_SLAVE, ddev->cap_mask);
> > > +     dma_cap_set(DMA_PRIVATE, ddev->cap_mask);
> > > +     dma_cap_set(DMA_CYCLIC, ddev->cap_mask);
> > > +
> > > +     ddev->device_free_chan_resources =3D loongson2_cmc_dma_free_cha=
n_resources;
> > > +     ddev->device_config =3D loongson2_cmc_dma_slave_config;
> > > +     ddev->device_prep_slave_sg =3D loongson2_cmc_dma_prep_slave_sg;
> > > +     ddev->device_prep_dma_cyclic =3D loongson2_cmc_dma_prep_dma_cyc=
lic;
> > > +     ddev->device_issue_pending =3D loongson2_cmc_dma_issue_pending;
> > > +     ddev->device_synchronize =3D loongson2_cmc_dma_synchronize;
> > > +     ddev->device_tx_status =3D loongson2_cmc_dma_tx_status;
> > > +     ddev->device_terminate_all =3D loongson2_cmc_dma_terminate_all;
> > > +
> > > +     ddev->src_addr_widths =3D LOONGSON2_CMCDMA_BUSWIDTHS;
> > > +     ddev->dst_addr_widths =3D LOONGSON2_CMCDMA_BUSWIDTHS;
> > > +     ddev->directions =3D BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
> > > +     INIT_LIST_HEAD(&ddev->channels);
> >
> > where use this 'channels' ?
>
> It will be used by global functions such as `dma_async_device_register()`=
.
> >
> > Frank
> > > +
> > > +     for (i =3D 0; i < nr_chans; i++) {
> > > +             lchan =3D &lddev->chan[i];
> > > +
> > > +             lchan->id =3D i;
> > > +             lchan->vchan.desc_free =3D loongson2_cmc_dma_desc_free;
> > > +             vchan_init(&lchan->vchan, ddev);
> > > +     }
> > > +
> > > +     ret =3D dmaenginem_async_device_register(ddev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     for (i =3D 0; i < nr_chans; i++) {
> > > +             lchan =3D &lddev->chan[i];
> > > +
> > > +             lchan->irq =3D platform_get_irq(pdev, i);
> > > +             if (lchan->irq < 0)
> > > +                     return lchan->irq;
> > > +
> > > +             ret =3D devm_request_irq(dev, lchan->irq, loongson2_cmc=
_dma_chan_irq, IRQF_SHARED,
> > > +                                    dev_name(chan2dev(lchan)), lchan=
);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     ret =3D loongson2_cmc_dma_acpi_controller_register(lddev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     return loongson2_cmc_dma_of_controller_register(lddev);
> > > +}
> > > +
> > > +static void loongson2_cmc_dma_remove(struct platform_device *pdev)
> > > +{
> > > +     of_dma_controller_free(pdev->dev.of_node);
> > > +}
> > > +
> > > +static const struct of_device_id loongson2_cmc_dma_of_match[] =3D {
> > > +     { .compatible =3D "loongson,ls2k0300-dma", .data =3D &ls2k0300_=
cmc_dma_config },
> > > +     { .compatible =3D "loongson,ls2k3000-dma", .data =3D &ls2k3000_=
cmc_dma_config },
> > > +     { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
> > > +
> > > +static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] =
=3D {
> > > +     { "LOON0014", .driver_data =3D (kernel_ulong_t)&ls2k3000_cmc_dm=
a_config },
> > > +     { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
> > > +
> > > +static struct platform_driver loongson2_cmc_dma_driver =3D {
> > > +     .driver =3D {
> > > +             .name =3D "loongson2-apb-cmc-dma",
> > > +             .of_match_table =3D loongson2_cmc_dma_of_match,
> > > +             .acpi_match_table =3D loongson2_cmc_dma_acpi_match,
> > > +     },
> > > +     .probe =3D loongson2_cmc_dma_probe,
> > > +     .remove =3D loongson2_cmc_dma_remove,
> > > +};
> > > +module_platform_driver(loongson2_cmc_dma_driver);
> > > +
> > > +MODULE_DESCRIPTION("Looongson-2 Multi-Channel DMA Controller driver"=
);
> > > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.52.0
> > >
>
> --
> Thanks.
> Binbin

--=20
Thanks.
Binbin
