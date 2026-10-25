Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792916396;
	b=Giu4xOb9B+6aVZaF8w732xAPhXfH5cfpzClwdzplcdhuVvw1U53Wy6QWtqvsavrkzMiq
	 ao7eCdfLcDh7ooZk6tZyEja5yXvk9xG12d4HmaWODwZiSxwHO5yR9bRIP+b2zNV6il6Jc
	 dBHYoESqlsFkDGlH3ikcTY49L+QPzwzk0gzP4eUtHE8xg5UqO5XvobkhNYxZ8N0BPwFBV
	 Xp2RQG1bpfBEprn9kmJPj70EtXTVjMzofYUkDTNMwK/1W17FuhuKLJBCgrZbFBy8zdc6D
	 sWcSKpxacUblCelhwSs7Bzw2QkjYJipiBuPajggUUZNdYHl4NpxVOd29eKkLo6Dmwqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792916396;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L5vQuDzdFc2/TL510zPfdcRtJl0VtToAbSliAS1HTxU=;
	b=S6gpiNwaNVUSxl+iamij6SWKdvafpNpMEAXNkFZz8Z6cisM4uhHwNo/+5txsgtg4lGPp
	 LCBbClzHMtroZrG04bukABynD5qHCEsTrjSn7tZTR/uBqXjmhv1HBN7u/Lp6m7kbbgdEt
	 CpZjPJWlNQ93ZopxRmjOpRFzXC4R2IPnnyy7hxUgKHPt/l/+iCmcXOJwvYZpl1MuAHTDl
	 pdDjqNUHbDjLWt/xp9ykl6frW87uS7r46NL/g8RcOkpT5m8qTscADgqspchiHC8nnpp7Y
	 e27Ft8tpy1X1hSjivY3o+JUhrlAASB7IDorhSbkxp3Dc7+3MpMfGOgiGHfSMVQihkSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzAKHX8L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DA8606A31B
	for <loongarch@lists.linux.dev>; Sun, 25 Oct 2026 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzAKHX8L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7C81F01829
	for <loongarch@lists.linux.dev>; Sun, 25 Oct 2026 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792916395;
	bh=L5vQuDzdFc2/TL510zPfdcRtJl0VtToAbSliAS1HTxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WzAKHX8LEKtVY9zk/E0YetCkq2IqbixZ7eZFlY/NmT7GiAah5KaknkLqcn/zwSbwJ
	 gHqHvRfXpLvPvoidVb/SYEEyIRzBPFcZRrw6wbGd5qfYPf7NbCBTgfx20xfv2Wkujn
	 zzUzIRMCKFFAahKL7MCARqNDC7m9S1ZVCXl7Ju+dIfftNXxyRIW46fUFdhNdAJsNga
	 rWQU/U8ZL4VSyU2YWSMSNWbkigaHIvS20j8s0vfWNAI2DTwwq/74JxrdKrJIcm5pCI
	 oQMFEzgwDvIPUHei0BYUSvS/FSdsgBeEht2Y7Rxb0tBdoN+zKRlT8vduTVsgmNsExX
	 zFDpd3TNw47NA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so4077664a12.1
        for <loongarch@lists.linux.dev>; Sun, 25 Oct 2026 01:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLHQ7djh11M8dU6AhQxCc/srEOYghShT2iayzrjSSibAbom8+6sOPoTUPMKteRFfNFiKuKtDQPZOI=@lists.linux.dev
X-Gm-Message-State: AFq9FYLJ/fQMzil/Uy9FYZyd2fxu0b1BWzrYSOPceutHaIoFKRj8/cIp
	7bqGDYtBMNVn5LvMv2bqhNZ1g0JbHN1i6KLBpNoUGsJ/aJ5OzauCJUQimwFk7jzUC2rGfjYeNKq
	rhuS5BbZ6W8m5/wQkeA89V9lW0CccikI=
X-Received: by 2002:a05:6402:448c:b0:6b1:d2ee:3933 with SMTP id
 4fb4d7f45d1cf-6b443122e1cmr5036368a12.45.1792916393592; Sun, 25 Oct 2026
 01:19:53 -0700 (PDT)
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
In-Reply-To: <54a6180b35353d2c03c5a752305636baacd02e9c.1791535540.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Oct 2026 16:19:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5s9o=9t7cmdh-C3TaAnfxeJkE-gKiD6s+mVn_XoN7GxA@mail.gmail.com>
X-Gm-Features: AclHuK87Nz-siV_1h94HZiErIw95AdvaGDUsSMYLDb1N_pU5439lWqar8k2C89Y
Message-ID: <CAAhV-H5s9o=9t7cmdh-C3TaAnfxeJkE-gKiD6s+mVn_XoN7GxA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: loongson: Add Loongson-2K0300 APB DMA
 mux driver
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Fri, Oct 9, 2026 at 5:20=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> The Loongson-2K0300 DMA mux is not a standalone DMA controller. It is
> implemented as a set of routing fields in the chip global configuration
> registers CHIP_CTRL13/14/15, which select which physical channel of the
> on-chip CMC DMA controller handles each peripheral DMA request.
>
> Add a driver that exposes these routing fields as an OF DMA router. The
> router's allocation callback validates the <request> <channel> <flags>
> specifier, programs the corresponding CHIP_CTRL register field, and then
> rewrites the specifier to <channel> <flags> so that the parent CMC DMA
> controller's xlate is used.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/dma/loongson/Makefile               |   1 +
>  drivers/dma/loongson/loongson2-apb-dmamux.c | 398 ++++++++++++++++++++
>  3 files changed, 400 insertions(+)
>  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 78622b255f88..0b0c6ea41c64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15355,6 +15355,7 @@ F:      Documentation/devicetree/bindings/dma/loo=
ngson,ls2k0300-dmamux.yaml
>  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
>  F:     drivers/dma/loongson/loongson2-apb-cmc-dma.c
>  F:     drivers/dma/loongson/loongson2-apb-dma.c
> +F:     drivers/dma/loongson/loongson2-apb-dmamux.c
>  F:     include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>  LOONGSON LS2X I2C DRIVER
> diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makefil=
e
> index 48c19781e729..271fd38fa8f2 100644
> --- a/drivers/dma/loongson/Makefile
> +++ b/drivers/dma/loongson/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
>  obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
>  obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-cmc-dma.o
> +obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-dmamux.o
Here we can use
obj-$(CONFIG_LOONGSON2_APB_CMC_DMA) +=3D loongson2-apb-cmc-dma.o
loongson2-apb-dmamux.o

Huacai

> diff --git a/drivers/dma/loongson/loongson2-apb-dmamux.c b/drivers/dma/lo=
ongson/loongson2-apb-dmamux.c
> new file mode 100644
> index 000000000000..01bd3ce4ca25
> --- /dev/null
> +++ b/drivers/dma/loongson/loongson2-apb-dmamux.c
> @@ -0,0 +1,398 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Loongson2 SoC APB DMA Mux Controller
> + *
> + * Copyright (C) 2026 Loongson Technology Corporation Limited
> + *
> + * Device tree bindings:
> + *
> + *   2K0300:
> + *     dma_mux: dma-mux@16000134 {
> + *             compatible =3D "loongson,ls2k0300-dmamux";
> + *             reg =3D <0x0 0x16000134 0x0 0xc>;
> + *             #dma-cells =3D <3>;
> + *             dma-masters =3D <&dma>;
> + *             dma-requests =3D <22>;
> + *     };
> + *
> + * DMA specifier: <request> <channel> <flags>
> + *   - request: peripheral request ID (LS2K0300_DMA_*)
> + *   - channel: target physical DMA channel
> + *   - flags:   channel configuration flags forwarded to the parent DMA
> + *              controller
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/dmaengine.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> +
> +/* Loongson-2K0300 registers definitions */
> +#define LS2K0300_CHIP_CTRL13           0x00
> +#define LS2K0300_CHIP_CTRL14           0x04
> +#define LS2K0300_CHIP_CTRL15           0x08
> +
> +/* CHIP_CTRL13 bitfields */
> +#define CTRL13_UART0_DMA_MAP           GENMASK(17, 16)
> +#define CTRL13_UART1_DMA_MAP           GENMASK(19, 18)
> +#define CTRL13_UART2_DMA_MAP           GENMASK(21, 20)
> +#define CTRL13_UART3_DMA_MAP           GENMASK(23, 22)
> +#define CTRL13_UART4_DMA_MAP           GENMASK(25, 24)
> +#define CTRL13_UART5_DMA_MAP           GENMASK(27, 26)
> +#define CTRL13_UART6_DMA_MAP           GENMASK(29, 28)
> +#define CTRL13_UART7_DMA_MAP           GENMASK(31, 30)
> +
> +/* CHIP_CTRL14 bitfields */
> +#define CTRL14_UART8_DMA_MAP           GENMASK(1, 0)
> +#define CTRL14_UART9_DMA_MAP           GENMASK(3, 2)
> +#define CTRL14_I2C0_DMA_MAP            GENMASK(5, 4)
> +#define CTRL14_I2C1_DMA_MAP            GENMASK(7, 6)
> +#define CTRL14_I2C2_DMA_MAP            GENMASK(9, 8)
> +#define CTRL14_I2C3_DMA_MAP            GENMASK(11, 10)
> +#define CTRL14_SPI2_DMA_MAP            GENMASK(13, 12)
> +#define CTRL14_SPI3_DMA_MAP            GENMASK(15, 14)
> +#define CTRL14_I2S_DMA_MAP             GENMASK(17, 16)
> +#define CTRL14_ADC_DMA_MAP             GENMASK(20, 18)
> +#define CTRL14_CAN0_DMA_MAP            GENMASK(23, 21)
> +#define CTRL14_CAN1_DMA_MAP            GENMASK(26, 24)
> +#define CTRL14_CAN2_DMA_MAP            GENMASK(29, 27)
> +#define CTRL14_CAN3_DMA_MAP            GENMASK(31, 30)
> +
> +/* CHIP_CTRL15 bitfields */
> +#define CTRL15_CAN3_DMA_MAP_HI         BIT(0)
> +
> +#define LS2K0300_DMA_MAX_CHANNEL       7
> +
> +/**
> + * enum loongson2_dmamux_type - Type of the mapping field
> + * @LOONGSON_DMAMUX_PAIR: 2-bit field, value selects a channel pair
> + *                        (0/1, 2/3, 4/5, 6/7).
> + * @LOONGSON_DMAMUX_SINGLE: 3-bit field, value selects a single channel
> + *                          or controller index directly.
> + */
> +enum loongson2_dmamux_type {
> +       LOONGSON_DMAMUX_PAIR,
> +       LOONGSON_DMAMUX_SINGLE,
> +};
> +
> +/**
> + * struct loongson2_dmamux_map - DMA request to register bitfield mappin=
g
> + * @reg: Register offset from the controller base
> + * @mask: Bitfield mask within the register
> + * @type: Mapping type (pair or single)
> + * @high_reg: Optional extension register offset (0 if unused)
> + * @high_shift: Bit position in the extension register
> + */
> +struct loongson2_dmamux_map {
> +       u32 reg;
> +       u32 mask;
> +       enum loongson2_dmamux_type type;
> +       u32 high_reg;
> +       u8 high_shift;
> +};
> +
> +/**
> + * struct loongson2_dmamux_config - SoC-specific DMA mux configuration
> + * @maps: Pointer to the request mapping table
> + * @num_maps: Number of entries in @maps
> + * @max_channel: Highest valid channel/controller index
> + * @parent_args_count: Number of cells to write to dma_spec->args[]
> + *                     when forwarding to the parent xlate.
> + */
> +struct loongson2_dmamux_config {
> +       const struct loongson2_dmamux_map *maps;
> +       u32 num_maps;
> +       u32 max_channel;
> +       u32 parent_args_count;
> +};
> +
> +/**
> + * struct loongson2_dmamux - DMA mux controller state
> + * @base: I/O-mapped register base
> + * @lock: Protects register read-modify-write sequences
> + * @dma_router: Router structure passed to of_dma_router_register()
> + * @config: SoC-specific configuration
> + */
> +struct loongson2_dmamux {
> +       void __iomem *base;
> +       spinlock_t lock;        /* Protects register read-modify-write se=
quences */
> +       struct dma_router dma_router;
> +       const struct loongson2_dmamux_config *config;
> +};
> +
> +/* Loongson-2K0300 mapping table */
> +static const struct loongson2_dmamux_map ls2k0300_dmamux_maps[] =3D {
> +       [LS2K0300_DMA_UART0] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART0_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART1] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART1_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART2] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART2_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART3] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART3_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART4] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART4_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART5] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART5_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART6] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART6_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART7] =3D { LS2K0300_CHIP_CTRL13, CTRL13_UART7_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART8] =3D { LS2K0300_CHIP_CTRL14, CTRL14_UART8_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_UART9] =3D { LS2K0300_CHIP_CTRL14, CTRL14_UART9_DMA=
_MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_I2C0]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C0_DMA_=
MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_I2C1]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C1_DMA_=
MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_I2C2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C2_DMA_=
MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_I2C3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2C3_DMA_=
MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_SPI2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_SPI2_DMA_=
MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_SPI3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_SPI3_DMA_=
MAP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_I2S]   =3D { LS2K0300_CHIP_CTRL14, CTRL14_I2S_DMA_M=
AP, LOONGSON_DMAMUX_PAIR,
> +                                0, 0 },
> +       [LS2K0300_DMA_ADC]   =3D { LS2K0300_CHIP_CTRL14, CTRL14_ADC_DMA_M=
AP, LOONGSON_DMAMUX_SINGLE,
> +                                0, 0 },
> +       [LS2K0300_DMA_CAN0]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN0_DMA_=
MAP, LOONGSON_DMAMUX_SINGLE,
> +                                0, 0 },
> +       [LS2K0300_DMA_CAN1]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN1_DMA_=
MAP, LOONGSON_DMAMUX_SINGLE,
> +                                0, 0 },
> +       [LS2K0300_DMA_CAN2]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN2_DMA_=
MAP, LOONGSON_DMAMUX_SINGLE,
> +                                0, 0 },
> +       [LS2K0300_DMA_CAN3]  =3D { LS2K0300_CHIP_CTRL14, CTRL14_CAN3_DMA_=
MAP, LOONGSON_DMAMUX_SINGLE,
> +                                LS2K0300_CHIP_CTRL15, 0 },
> +};
> +
> +static const struct loongson2_dmamux_config ls2k0300_dmamux_config =3D {
> +       .maps                   =3D ls2k0300_dmamux_maps,
> +       .num_maps               =3D ARRAY_SIZE(ls2k0300_dmamux_maps),
> +       .max_channel            =3D LS2K0300_DMA_MAX_CHANNEL,
> +       .parent_args_count      =3D 2,
> +};
> +
> +static inline u32 loongson2_dmamux_read(struct loongson2_dmamux *mux, u3=
2 reg)
> +{
> +       return readl(mux->base + reg);
> +}
> +
> +static inline void loongson2_dmamux_write(struct loongson2_dmamux *mux, =
u32 reg, u32 val)
> +{
> +       writel(val, mux->base + reg);
> +}
> +
> +/**
> + * loongson2_dmamux_set_route() - Program the DMA request route
> + * @mux:     DMA mux controller
> + * @request: Peripheral DMA request ID
> + * @channel: Target physical DMA channel or controller index
> + *
> + * Computes the register value according to the mapping type:
> + *   - PAIR   : channel / 2 selects the pair index
> + *   - SINGLE : channel is written directly
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +static int loongson2_dmamux_set_route(struct loongson2_dmamux *mux, u32 =
request, u32 channel)
> +{
> +       const struct loongson2_dmamux_map *map;
> +       u32 reg_val, route_val, high_val =3D 0;
> +
> +       if (request >=3D mux->config->num_maps)
> +               return -EINVAL;
> +
> +       if (channel > mux->config->max_channel)
> +               return -EINVAL;
> +
> +       map =3D &mux->config->maps[request];
> +
> +       switch (map->type) {
> +       case LOONGSON_DMAMUX_PAIR:
> +               route_val =3D channel / 2;
> +               break;
> +       case LOONGSON_DMAMUX_SINGLE:
> +               route_val =3D channel;
> +               if (map->high_reg)
> +                       high_val =3D (channel >> 2) & 0x1;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       guard(spinlock_irqsave)(&mux->lock);
> +
> +       /* Write the primary register field */
> +       reg_val =3D loongson2_dmamux_read(mux, map->reg);
> +       reg_val &=3D ~map->mask;
> +       reg_val |=3D field_prep(map->mask, route_val);
> +       loongson2_dmamux_write(mux, map->reg, reg_val);
> +
> +       /* Write the extension register field if present */
> +       if (map->high_reg) {
> +               reg_val =3D loongson2_dmamux_read(mux, map->high_reg);
> +               reg_val &=3D ~BIT(map->high_shift);
> +               reg_val |=3D high_val << map->high_shift;
> +               loongson2_dmamux_write(mux, map->high_reg, reg_val);
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * loongson2_dmamux_route_allocate() - DMA router allocation callback
> + * @dma_spec: OF DMA specifier <request> <channel> <flags>
> + * @ofdma:    Router's of_dma structure; ofdma->dma_router points to our
> + *            struct dma_router embedded in struct loongson2_dmamux.
> + *
> + * Return: NULL as route_data (nothing to free), or an ERR_PTR on failur=
e.
> + */
> +static void *loongson2_dmamux_route_allocate(struct of_phandle_args *dma=
_spec,
> +                                            struct of_dma *ofdma)
> +{
> +       struct loongson2_dmamux *mux;
> +       u32 request, channel, flags;
> +       int ret;
> +
> +       if (!ofdma->dma_router)
> +               return ERR_PTR(-EINVAL);
> +
> +       mux =3D container_of(ofdma->dma_router, struct loongson2_dmamux, =
dma_router);
> +
> +       if (dma_spec->args_count !=3D 3)
> +               return ERR_PTR(-EINVAL);
> +
> +       request =3D dma_spec->args[0];
> +       channel =3D dma_spec->args[1];
> +       flags =3D dma_spec->args[2];
> +
> +       if (request >=3D mux->config->num_maps ||
> +           channel > mux->config->max_channel)
> +               return ERR_PTR(-EINVAL);
> +
> +       /* Program the SoC-specific route register */
> +       ret =3D loongson2_dmamux_set_route(mux, request, channel);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       /* The of_node_put() will be done in of_dma_router_xlate function=
 */
> +       dma_spec->np =3D of_parse_phandle(ofdma->of_node, "dma-masters", =
0);
> +       if (!dma_spec->np)
> +               return ERR_PTR(-ENODEV);
> +
> +       dma_spec->args[0] =3D channel;
> +       dma_spec->args[1] =3D flags;
> +       dma_spec->args_count =3D mux->config->parent_args_count;
> +
> +       return NULL;
> +}
> +
> +/**
> + * loongson2_dmamux_route_free() - DMA router free callback
> + * @dev: Back pointer to the router's device
> + * @route_data: Router-specific data returned by route_allocate
> + *
> + * The driver does not allocate any per-route resources, so this callbac=
k
> + * is intentionally empty. It must still be provided because the OF DMA
> + * core calls it unconditionally on some error paths (e.g. -EPROBE_DEFER=
)
> + * without checking for a NULL pointer.
> + */
> +static void loongson2_dmamux_route_free(struct device *dev, void *route_=
data)
> +{
> +}
> +
> +/**
> + * loongson2_dmamux_unregister_of_dma() - devm action to unregister the =
router
> + * @data: Pointer to struct loongson2_dmamux
> + *
> + * Called automatically by the device-managed resource framework both on
> + * probe failure and on driver removal, ensuring the OF DMA router is
> + * always unregistered.
> + */
> +static void loongson2_dmamux_unregister_of_dma(void *data)
> +{
> +       struct loongson2_dmamux *mux =3D data;
> +
> +       of_dma_router_free(mux->dma_router.dev->of_node);
> +}
> +
> +static int loongson2_dmamux_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct loongson2_dmamux *mux;
> +       u32 dma_requests;
> +       int ret;
> +
> +       mux =3D devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> +       if (!mux)
> +               return -ENOMEM;
> +
> +       mux->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(mux->base))
> +               return PTR_ERR(mux->base);
> +
> +       spin_lock_init(&mux->lock);
> +       mux->config =3D &ls2k0300_dmamux_config;
> +
> +       ret =3D of_property_read_u32(dev->of_node, "dma-requests", &dma_r=
equests);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "missing dma-requests prop=
erty\n");
> +
> +       if (dma_requests !=3D mux->config->num_maps)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "dma-requests=3D%u mismatches driver=
 num_maps=3D%u",
> +                                    dma_requests, mux->config->num_maps)=
;
> +
> +       mux->dma_router.dev =3D dev;
> +       mux->dma_router.route_free =3D loongson2_dmamux_route_free;
> +
> +       platform_set_drvdata(pdev, mux);
> +
> +       ret =3D of_dma_router_register(dev->of_node, loongson2_dmamux_rou=
te_allocate,
> +                                    &mux->dma_router);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to register DMA router");
> +
> +       ret =3D devm_add_action_or_reset(dev, loongson2_dmamux_unregister=
_of_dma, mux);
> +       if (ret)
> +               return ret;
> +
> +       dev_info(dev,
> +                "Loongson2 DMA Mux Controller registered (max_channel=3D=
%u, requests=3D%u)",
> +                mux->config->max_channel, mux->config->num_maps);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id loongson2_dmamux_of_match[] =3D {
> +       { .compatible =3D "loongson,ls2k0300-dmamux" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, loongson2_dmamux_of_match);
> +
> +static struct platform_driver loongson2_dmamux_driver =3D {
> +       .driver =3D {
> +               .name =3D "loongson2-dmamux",
> +               .of_match_table =3D loongson2_dmamux_of_match,
> +       },
> +       .probe =3D loongson2_dmamux_probe,
> +};
> +module_platform_driver(loongson2_dmamux_driver);
> +
> +MODULE_DESCRIPTION("Loongson2 SoC DMA Mux Controller driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> --
> 2.52.0
>
>
