Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792936208;
	b=gc0cWSTxFWTmLN4Bu5lLIkWTXk/GBjnzuUMaS1UD6G3rf388938CFwTOJHmYBpSvDYlk
	 ip+8sRuCTojD9xM7lMBwGS7on+gUVnJ/1UQd4Z3pOuIVqQV3emLgugFlc4bOZOtRu/7IR
	 xTNJ3D5EZjOuSoNLwIM5HiU3475G9oGJAFTAJyA8OTdgPF/+M+Z1pLDSAtl7rj/M72qn6
	 bUdft/PxogQjJw6NLFV0jap0mL3ujK6KU3HxCKKo+WIk5ed6ClVQ/TNpuLU7kK2Av4j/k
	 HZ3OsYOt87ZP+sKDSQyOp5kxqJ4jtYrovG286+s3WJ1LZ8fW4MwV0rnH3Uz6IJunWLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=11N8xJz31IOScSiGSeqlFwZ6vb6hjEeokUSPcrLsgAk=;
	b=LP1MGlZWhLvWFT9bjUwWxtgfucmMJjAaWPbQD5g2TmHBqNJFREy7nlUD29zvXecSiTAW
	 Ytda4QcdRiYpJZdk8hmxRxFE/5f2a1k82c6xOxJsDw4uU3qAVYVPjSMYLIyhpfRHpXbwS
	 Q7du1WikfAgOZCMUdc5FbeEO+2A7g5DvdapCLM1GPNEga9TvEcKqrFa1ToxjASwPK16Nn
	 StUYoShfUJzvLeKtfJbtIqlGxz2IMjRH6/yrKqcEKQKTBfUqxN9JFwRmwolgQYUNjgI6I
	 lflOdPrZIX6Qcjfi+QMlwKA7RAMqmKx3c5MTZxXMeFIJ3iPp7dTLCPOfXSfPuAJ0jHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mMQLF2kf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFA6606A31B
	for <loongarch@lists.linux.dev>; Sun, 25 Oct 2026 13:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AFA6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mMQLF2kf
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c34bff61551so306546466b.2
        for <loongarch@lists.linux.dev>; Sun, 25 Oct 2026 06:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792936206; cv=none;
        d=google.com; s=arc-20260327;
        b=oOg9GBxa4ERyKQ4BUO2CdSYVN8D7l9nOrzjMq6Pj+wzJA+I9gGCEqPeul6rIVe56ik
         j4BwGqSFFao6GuosfiyI3hc9gkZXXjtnkovYNrNPCa5xJjoIpFr4b5myfdDVT8HOUjgG
         51Rmp+TQwmt3+6C7pVRdgAYoBFnCwkxPLkuaWrjz1st4s4oc6TDVaNHjhhgWLMMKjshR
         HY7cuie3kkqj9fHSOQJIM4lraDFRv7w58rvlWXXUZpheOuHe4y3JTyJCcUKXwNHRaZ+y
         yJUTTaPzN0MyXchkZIZoPEzGSIVvHBCrshvdfwVwzVmRchEMp/NBuQX0YucZ3CXvzbNC
         oHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11N8xJz31IOScSiGSeqlFwZ6vb6hjEeokUSPcrLsgAk=;
        fh=ou6mkGoTdG/KdSqXt5M1VhKvD6Krsy56RnH0AZL3f28=;
        b=VqaJiqr1/iQjT6kVytwe8u9icbANHmlZ34q7UZUWGKxx9Ycb++tx7VyCMw6mHGPANQ
         8FWApFjuLdl3LwOQOCELvMqc2/Z+wIRvuziTwy1WEotlQMWD66suqrCSl6QypuL5Iq4/
         gvs0Cxz6Z3WFYiMIlVqSGTTuvOmLJLW1Tg313PUQRKPFBNV8u8J37GNhSopeUBKFjdAJ
         bHcSYxBp2Av/i8lDcY4uyeXBcPTyCs475F6jPrInP4Mc7khmMks80+LXOx8ArDmNcaYX
         yPvPGUv7mjo0XPWrdwRuj4oGCVuTOD5wtjrUDeVt5C7r4YKE2rT645dsjRKhDAoOxMFU
         V74A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936206; x=1793541006; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11N8xJz31IOScSiGSeqlFwZ6vb6hjEeokUSPcrLsgAk=;
        b=mMQLF2kf5Wjuk4sVGZtSC3HywtLUTZa9XaHOKMyLSY1Y4p5jGhAoCsvKLCtHBDSvRz
         73LqWtjmiZ9gUwzuk3vWGOoO7QjVSo29ZiA4NRihAnFfWnuAcfCN9oOLTg9jT7q1TiGj
         BeCXT1i7rUhpcb/cywguNG9D9u4Xffo2T0EdCamcvChzGhR+Pxx49wyVS2B6/r2uAffZ
         kbkb6MkieIyCwYs9KPe4Qh6H4Rc5z50vsUjYqwMQFpSaB/ijlaiAzAZ1E5FCpXx+59LA
         VU7DlGZfzSLTu51mz4j1iqP54fvfR2yva3tdC8ja+yHBRFFF5fMWPeMWTmHEOEnUtTW0
         v8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936206; x=1793541006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11N8xJz31IOScSiGSeqlFwZ6vb6hjEeokUSPcrLsgAk=;
        b=ZK7ALdRLL0Orcefsv9BauirW6acuq2nlx8jD9E2yhNgN/l3Bvm58lz3AIRlGz8gwmJ
         Ye+SJFwHJ+8sHka+5DKrIdDbib1Zekc62jmmMas20HRqpAzGhoiZRAc19dEMlYemUdMJ
         6sxYNCIKBmLwWkWoE9hSBUVKAjlOU9pCtr+7zBsqNL6cCluTC/Lk+xwVnxSbswB22rZ7
         O7KAw5FSURGNt3WPzaH+yo+8E7/YuYeCWqL5m3aKdMQxIJdl2jsqOaaz41dupre0af65
         Zd24wX3SlCG8LH5ocfhATuNKrMsVQw7sS5SudTj9VRCAnhvXk2xsw9HvnxqtBpT4ezSQ
         ERtg==
X-Forwarded-Encrypted: i=1; AKwUvBxMbpZWFRJ8FBOxjXehMwOXgRgmU6fXdPa5JSPfisyXet7X7c0Azgwmpxwd898PX6640Ofk9v240e0=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9FOXt54KzdXTk1uVDvpe1Oe2c6vv1Ws+MKSemRTbaaQHF1lK+
	Fl3qyLagGhFmU+sFwhB4QYZ+usuopXH6b1yDa890xk4JmCfh9AP/LlDYfQLtncz31bUPC0BC9tH
	N616h3Z2vd3td3vI13ryRMJJIFRNR7pI=
X-Gm-Gg: AYBFou1yJiKyXxek7NNoOaBP7E7MguJOWjPTYryxZNhJEIJd2qyd7p6VQouKGqX0iAj
	zs87Fl9WdtfVczUMUX4TDwjil/qMLwOkcEva9by+SU+AyjLMMdPyhZ1Awli4Q47NCJnq3c4quT1
	dVA7EwahorpH4k+ZQ8pWx30nlfkHibUbKKx2KWrktmDk8TO/R2kyXhHEsY+ASnUmBSL6wAtMo+h
	h1+kKkQx/6Q0PKTdT4eN0EtxCNhWXZB+Gs3vvBLLNGxqAGSGLvfUUWwhNvZmfdHzF6Y+prVOj1L
	TTGF8dohExgLm64AXdwyK/LMEnD8uQ1K3T5yxBBsLtYa8BHdeea15qvwqBWsH39LsWYSGjq9JTQ
	QWfF/VfFnXwOHzBY94BJFxphdlEO7fQ++ggg=
X-Received: by 2002:a17:907:2d88:b0:c34:c5e8:1dc5 with SMTP id
 a640c23a62f3a-c46bde24f21mr491383666b.20.1792936205685; Sun, 25 Oct 2026
 06:50:05 -0700 (PDT)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1791535540.git.zhoubinbin@loongson.cn> <54a6180b35353d2c03c5a752305636baacd02e9c.1791535540.git.zhoubinbin@loongson.cn>
 <CAAhV-H5s9o=9t7cmdh-C3TaAnfxeJkE-gKiD6s+mVn_XoN7GxA@mail.gmail.com>
In-Reply-To: <CAAhV-H5s9o=9t7cmdh-C3TaAnfxeJkE-gKiD6s+mVn_XoN7GxA@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sun, 25 Oct 2026 21:49:50 +0800
X-Gm-Features: AclHuK_idPRy9EipjtEFGHZgI30NNUlQYHy_IsnIBv0rM8jYKsvWQlmXX8NixpI
Message-ID: <CAMpQs4L2SQrfwtf1byg9QvPt6TX+FgMS6zWd4UxLxseG3t=BRw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA
 mux driver
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 4:19=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Fri, Oct 9, 2026 at 5:20=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
> > implemented as a set of routing fields in the chip global configuration
> > registers CHIP_CTRL13/14/15, which select which physical channel of the
> > on-chip CMC DMA controller handles each peripheral DMA request.
> >
> > Add a driver that exposes these routing fields as an OF DMA router. The
> > router's allocation callback validates the <request> <channel> <flags>
> > specifier, programs the corresponding CHIP_CTRL register field, and the=
n
> > rewrites the specifier to <channel> <flags> so that the parent CMC DMA
> > controller's xlate is used.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  MAINTAINERS                                 |   1 +
> >  drivers/dma/loongson/Makefile               |   1 +
> >  drivers/dma/loongson/loongson2-apb-dmamux.c | 398 ++++++++++++++++++++
> >  3 files changed, 400 insertions(+)
> >  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 78622b255f88..0b0c6ea41c64 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15355,6 +15355,7 @@ F:      Documentation/devicetree/bindings/dma/l=
oongson,ls2k0300-dmamux.yaml
> >  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> >  F:     drivers/dma/loongson/loongson2-apb-cmc-dma.c
> >  F:     drivers/dma/loongson/loongson2-apb-dma.c
> > +F:     drivers/dma/loongson/loongson2-apb-dmamux.c
> >  F:     include/dt-bindings/dma/loongson,ls2k-dmamux.h
> >
> >  LOONGSON LS2X I2C DRIVER
> > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makef=
ile
> > index 48c19781e729..271fd38fa8f2 100644
> > --- a/drivers/dma/loongson/Makefile
> > +++ b/drivers/dma/loongson/Makefile
> > @@ -2,3 +2,4 @@
> >  obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> >  obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> >  obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-cmc-dma.o
> > +obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-dmamux.o
> Here we can use
> obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-cmc-dma.o
> loongson2-apb-dmamux.o

OK. I will do it in the next version.
>
> Huacai
>
> > diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/=
loongson/loongson2-apb-dmamux.c
> > new file mode 100644
> > index 000000000000..01bd3ce4ca25
> > --- /dev/null
> > +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
> > @@ -0,0 +1,398 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Loongson2 SoC APB DMA Mux Controller
> > + *
> > + * Copyright (C) 2026 Loongson Technology Corporation Limited
> > + *
> > + * Device tree bindings:
> > + *
> > + *   2K0300:
> > + *     dma_mux: dma-mux@16000134 {
> > + *             compatible =3D "loongson,ls2k0300-dmamux";
> > + *             reg =3D <0x0 0x16000134 0x0 0xc>;
> > + *             #dma-cells =3D <3>;
> > + *             dma-masters =3D <&dma>;
> > + *             dma-requests =3D <22>;
> > + *     };
> > + *
> > + * DMA specifier: <request> <channel> <flags>
> > + *   - request: peripheral request ID (LS2K0300_DMA_*)
> > + *   - channel: target physical DMA channel
> > + *   - flags:   channel configuration flags forwarded to the parent DM=
A
> > + *              controller
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/dmaengine.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_dma.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +#include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> > +
> > +/* Loongson-2K0300 registers definitions */
> > +#define LS2K0300_CHIP_CTRL13           0x00
> > +#define LS2K0300_CHIP_CTRL14           0x04
> > +#define LS2K0300_CHIP_CTRL15           0x08
> > +
> > +/* CHIP_CTRL13 bitfields */
> > +#define CTRL13_UART0_DMA_MAP           GENMASK(17, 16)
> > +#define CTRL13_UART1_DMA_MAP           GENMASK(19, 18)
> > +#define CTRL13_UART2_DMA_MAP           GENMASK(21, 20)
> > +#define CTRL13_UART3_DMA_MAP           GENMASK(23, 22)
> > +#define CTRL13_UART4_DMA_MAP           GENMASK(25, 24)
> > +#define CTRL13_UART5_DMA_MAP           GENMASK(27, 26)
> > +#define CTRL13_UART6_DMA_MAP           GENMASK(29, 28)
> > +#define CTRL13_UART7_DMA_MAP           GENMASK(31, 30)
> > +
> > +/* CHIP_CTRL14 bitfields */
> > +#define CTRL14_UART8_DMA_MAP           GENMASK(1, 0)
> > +#define CTRL14_UART9_DMA_MAP           GENMASK(3, 2)
> > +#define CTRL14_I2C0_DMA_MAP            GENMASK(5, 4)
> > +#define CTRL14_I2C1_DMA_MAP            GENMASK(7, 6)
> > +#define CTRL14_I2C2_DMA_MAP            GENMASK(9, 8)
> > +#define CTRL14_I2C3_DMA_MAP            GENMASK(11, 10)
> > +#define CTRL14_SPI2_DMA_MAP            GENMASK(13, 12)
> > +#define CTRL14_SPI3_DMA_MAP            GENMASK(15, 14)
> > +#define CTRL14_I2S_DMA_MAP             GENMASK(17, 16)
> > +#define CTRL14_ADC_DMA_MAP             GENMASK(20, 18)
> > +#define CTRL14_CAN0_DMA_MAP            GENMASK(23, 21)
> > +#define CTRL14_CAN1_DMA_MAP            GENMASK(26, 24)
> > +#define CTRL14_CAN2_DMA_MAP            GENMASK(29, 27)
> > +#define CTRL14_CAN3_DMA_MAP            GENMASK(31, 30)
> > +
> > +/* CHIP_CTRL15 bitfields */
> > +#define CTRL15_CAN3_DMA_MAP_HI         BIT(0)
> > +
> > +#define LS2K0300_DMA_MAX_CHANNEL       7
> > +
> > +/**
> > + * enum loongson2_dmamux_type - Type of the mapping field
> > + * @LOONGSON_DMAMUX_PAIR: 2-bit field, value selects a channel pair
> > + *                        (0/1, 2/3, 4/5, 6/7).
> > + * @LOONGSON_DMAMUX_SINGLE: 3-bit field, value selects a single channe=
l
> > + *                          or controller index directly.
> > + */
> > +enum loongson2_dmamux_type {
> > +       LOONGSON_DMAMUX_PAIR,
> > +       LOONGSON_DMAMUX_SINGLE,
> > +};
> > +
> > +/**
> > + * struct loongson2_dmamux_map - DMA request to register bitfield mapp=
ing
> > + * @reg: Register offset from the controller base
> > + * @mask: Bitfield mask within the register
> > + * @type: Mapping type (pair or single)
> > + * @high_reg: Optional extension register offset (0 if unused)
> > + * @high_shift: Bit position in the extension register
> > + */
> > +struct loongson2_dmamux_map {
> > +       u32 reg;
> > +       u32 mask;
> > +       enum loongson2_dmamux_type type;
> > +       u32 high_reg;
> > +       u8 high_shift;
> > +};
> > +
> > +/**
> > + * struct loongson2_dmamux_config - SoC-specific DMA mux configuration
> > + * @maps: Pointer to the request mapping table
> > + * @num_maps: Number of entries in @maps
> > + * @max_channel: Highest valid channel/controller index
> > + * @parent_args_count: Number of cells to write to dma_spec->args[]
> > + *                     when forwarding to the parent xlate.
> > + */
> > +struct loongson2_dmamux_config {
> > +       const struct loongson2_dmamux_map *maps;
> > +       u32 num_maps;
> > +       u32 max_channel;
> > +       u32 parent_args_count;
> > +};
> > +
> > +/**
> > + * struct loongson2_dmamux - DMA mux controller state
> > + * @base: I/O-mapped register base
> > + * @lock: Protects register read-modify-write sequences
> > + * @dma_router: Router structure passed to of_dma_router_register()
> > + * @config: SoC-specific configuration
> > + */
> > +struct loongson2_dmamux {
> > +       void __iomem *base;
> > +       spinlock_t lock;        /* Protects register read-modify-write =
sequences */
> > +       struct dma_router dma_router;
> > +       const struct loongson2_dmamux_config *config;
> > +};
> > +
> > +/* Loongson-2K0300 mapping table */
> > +static const struct loongson2_dmamux_map ls2k0300_dmamux_maps[] =3D {
> > +       [LS2K0300_DMA_UART0] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART0_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART1] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART1_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART2] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART2_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART3] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART3_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART4] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART4_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART5] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART5_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART6] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART6_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART7] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART7_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART8] =3D { LS2K0300_CHIP_CTRL14, CTRL14_UART8_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_UART9] =3D { LS2K0300_CHIP_CTRL14, CTRL14_UART9_D=
MA_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_I2C0]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C0_DM=
A_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_I2C1]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C1_DM=
A_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_I2C2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C2_DM=
A_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_I2C3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C3_DM=
A_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_SPI2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_SPI2_DM=
A_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_SPI3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_SPI3_DM=
A_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_I2S]   =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2S_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_ADC]   =3D { LS2K0300_CHIP_CTRL14, CTRL14_ADC_DMA=
_MAP, LOONGSON_DMAMUX_SINGLE,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_CAN0]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN0_DM=
A_MAP, LOONGSON_DMAMUX_SINGLE,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_CAN1]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN1_DM=
A_MAP, LOONGSON_DMAMUX_SINGLE,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_CAN2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN2_DM=
A_MAP, LOONGSON_DMAMUX_SINGLE,
> > +                                0, 0 },
> > +       [LS2K0300_DMA_CAN3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN3_DM=
A_MAP, LOONGSON_DMAMUX_SINGLE,
> > +                                LS2K0300_CHIP_CTRL15, 0 },
> > +};
> > +
> > +static const struct loongson2_dmamux_config ls2k0300_dmamux_config =3D=
 {
> > +       .maps                   =3D ls2k0300_dmamux_maps,
> > +       .num_maps               =3D ARRAY_SIZE(ls2k0300_dmamux_maps),
> > +       .max_channel            =3D LS2K0300_DMA_MAX_CHANNEL,
> > +       .parent_args_count      =3D 2,
> > +};
> > +
> > +static inline u32 loongson2_dmamux_read(struct loongson2_dmamux *mux, =
u32 reg)
> > +{
> > +       return readl(mux->base + reg);
> > +}
> > +
> > +static inline void loongson2_dmamux_write(struct loongson2_dmamux *mux=
, u32 reg, u32 val)
> > +{
> > +       writel(val, mux->base + reg);
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_set_route() - Program the DMA request route
> > + * @mux:     DMA mux controller
> > + * @request: Peripheral DMA request ID
> > + * @channel: Target physical DMA channel or controller index
> > + *
> > + * Computes the register value according to the mapping type:
> > + *   - PAIR   : channel / 2 selects the pair index
> > + *   - SINGLE : channel is written directly
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u3=
2 request, u32 channel)
> > +{
> > +       const struct loongson2_dmamux_map *map;
> > +       u32 reg_val, route_val, high_val =3D 0;
> > +
> > +       if (request >=3D mux->config->num_maps)
> > +               return -EINVAL;
> > +
> > +       if (channel > mux->config->max_channel)
> > +               return -EINVAL;
> > +
> > +       map =3D &mux->config->maps[request];
> > +
> > +       switch (map->type) {
> > +       case LOONGSON_DMAMUX_PAIR:
> > +               route_val =3D channel / 2;
> > +               break;
> > +       case LOONGSON_DMAMUX_SINGLE:
> > +               route_val =3D channel;
> > +               if (map->high_reg)
> > +                       high_val =3D (channel >> 2) & 0x1;
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       guard(spinlock_irqsave)(&mux->lock);
> > +
> > +       /* Write the primary register field */
> > +       reg_val =3D loongson2_dmamux_read(mux, map->reg);
> > +       reg_val &=3D ~map->mask;
> > +       reg_val |=3D field_prep(map->mask, route_val);
> > +       loongson2_dmamux_write(mux, map->reg, reg_val);
> > +
> > +       /* Write the extension register field if present */
> > +       if (map->high_reg) {
> > +               reg_val =3D loongson2_dmamux_read(mux, map->high_reg);
> > +               reg_val &=3D ~BIT(map->high_shift);
> > +               reg_val |=3D high_val << map->high_shift;
> > +               loongson2_dmamux_write(mux, map->high_reg, reg_val);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_route_allocate() - DMA router allocation callback
> > + * @dma_spec: OF DMA specifier <request> <channel> <flags>
> > + * @ofdma:    Router's of_dma structure; ofdma->dma_router points to o=
ur
> > + *            struct dma_router embedded in struct loongson2_dmamux.
> > + *
> > + * Return: NULL as route_data (nothing to free), or an ERR_PTR on fail=
ure.
> > + */
> > +static void *loongson2_dmamux_route_allocate(struct of_phandle_args *d=
ma_spec,
> > +                                            struct of_dma *ofdma)
> > +{
> > +       struct loongson2_dmamux *mux;
> > +       u32 request, channel, flags;
> > +       int ret;
> > +
> > +       if (!ofdma->dma_router)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       mux =3D container_of(ofdma->dma_router, struct loongson2_dmamux=
, dma_router);
> > +
> > +       if (dma_spec->args_count !=3D 3)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       request =3D dma_spec->args[0];
> > +       channel =3D dma_spec->args[1];
> > +       flags =3D dma_spec->args[2];
> > +
> > +       if (request >=3D mux->config->num_maps ||
> > +           channel > mux->config->max_channel)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       /* Program the SoC-specific route register */
> > +       ret =3D loongson2_dmamux_set_route(mux, request, channel);
> > +       if (ret)
> > +               return ERR_PTR(ret);
> > +
> > +       /* The of_node_put() will be done in of_dma_router_xlate functi=
on */
> > +       dma_spec->np =3D of_parse_phandle(ofdma->of_node, "dma-masters"=
, 0);
> > +       if (!dma_spec->np)
> > +               return ERR_PTR(-ENODEV);
> > +
> > +       dma_spec->args[0] =3D channel;
> > +       dma_spec->args[1] =3D flags;
> > +       dma_spec->args_count =3D mux->config->parent_args_count;
> > +
> > +       return NULL;
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_route_free() - DMA router free callback
> > + * @dev: Back pointer to the router's device
> > + * @route_data: Router-specific data returned by route_allocate
> > + *
> > + * The driver does not allocate any per-route resources, so this callb=
ack
> > + * is intentionally empty. It must still be provided because the OF DM=
A
> > + * core calls it unconditionally on some error paths (e.g. -EPROBE_DEF=
ER)
> > + * without checking for a NULL pointer.
> > + */
> > +static void loongson2_dmamux_route_free(struct device *dev, void *rout=
e_data)
> > +{
> > +}
> > +
> > +/**
> > + * loongson2_dmamux_unregister_of_dma() - devm action to unregister th=
e router
> > + * @data: Pointer to struct loongson2_dmamux
> > + *
> > + * Called automatically by the device-managed resource framework both =
on
> > + * probe failure and on driver removal, ensuring the OF DMA router is
> > + * always unregistered.
> > + */
> > +static void loongson2_dmamux_unregister_of_dma(void *data)
> > +{
> > +       struct loongson2_dmamux *mux =3D data;
> > +
> > +       of_dma_router_free(mux->dma_router.dev->of_node);
> > +}
> > +
> > +static int loongson2_dmamux_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct loongson2_dmamux *mux;
> > +       u32 dma_requests;
> > +       int ret;
> > +
> > +       mux =3D devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> > +       if (!mux)
> > +               return -ENOMEM;
> > +
> > +       mux->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(mux->base))
> > +               return PTR_ERR(mux->base);
> > +
> > +       spin_lock_init(&mux->lock);
> > +       mux->config =3D &ls2k0300_dmamux_config;
> > +
> > +       ret =3D of_property_read_u32(dev->of_node, "dma-requests", &dma=
_requests);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "missing dma-requests pr=
operty\n");
> > +
> > +       if (dma_requests !=3D mux->config->num_maps)
> > +               return dev_err_probe(dev, -EINVAL,
> > +                                    "dma-requests=3D%u mismatches driv=
er num_maps=3D%u",
> > +                                    dma_requests, mux->config->num_map=
s);
> > +
> > +       mux->dma_router.dev =3D dev;
> > +       mux->dma_router.route_free =3D loongson2_dmamux_route_free;
> > +
> > +       platform_set_drvdata(pdev, mux);
> > +
> > +       ret =3D of_dma_router_register(dev->of_node, loongson2_dmamux_r=
oute_allocate,
> > +                                    &mux->dma_router);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret,
> > +                                    "Failed to register DMA router");
> > +
> > +       ret =3D devm_add_action_or_reset(dev, loongson2_dmamux_unregist=
er_of_dma, mux);
> > +       if (ret)
> > +               return ret;
> > +
> > +       dev_info(dev,
> > +                "Loongson2 DMA Mux Controller registered (max_channel=
=3D%u, requests=3D%u)",
> > +                mux->config->max_channel, mux->config->num_maps);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id loongson2_dmamux_of_match[] =3D {
> > +       { .compatible =3D "loongson,ls2k0300-dmamux" },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, loongson2_dmamux_of_match);
> > +
> > +static struct platform_driver loongson2_dmamux_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "loongson2-dmamux",
> > +               .of_match_table =3D loongson2_dmamux_of_match,
> > +       },
> > +       .probe =3D loongson2_dmamux_probe,
> > +};
> > +module_platform_driver(loongson2_dmamux_driver);
> > +
> > +MODULE_DESCRIPTION("Loongson2 SoC DMA Mux Controller driver");
> > +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.52.0
> >
> >

--=20
Thanks.
Binbin
