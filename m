Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D01221F15
	for <loongarch@lists.linux.dev>; Tue, 10 Feb 2026 01:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770686856; cv=pass; b=pX2D9QAttUhj70Ce/iKpzDzUHr9VeBIazAFfFxdQ5EshKmHwwPk4LytV+C065QoeqG/2ZinwK0UMt5WEcqTlezU/WKaLJp9ZHTrVfeg15G142o1jITuco7kQAC44sgbpKU5z+/h9nRgyiEKV9qpT62COA/s3zAMpbdMt07jqi5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770686856; c=relaxed/simple;
	bh=SCjo7Ef55zh44/8UoLsoSqyzqn7OjE/L4/11ImGPxkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3WmBEUYIas6+LGrWrCp5GqzWkIXdO0DA8D2kpa5kWbd5NPyQZV3GFoG/B9PcicS4kFujRmZQKMiRrn6+PQndXm5eylfhYA7GztN3gbFA4jBt+JvR4bIkpxbJhaoqXnl44erk5X6L1xiXkfkOL9850AX+ik/9gomzf5lNzahYAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO3nDRXs; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO3nDRXs"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65939428896so7499447a12.1
        for <loongarch@lists.linux.dev>; Mon, 09 Feb 2026 17:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770686853; cv=none;
        d=google.com; s=arc-20240605;
        b=h4YQva5bm3/5hGyq0L/dVp8TjuLWYsKUA4R10LDXvEU7Qw21ZTNzgK3zks/B3DWgh0
         yCaHWG0ygA+tKp5LlFQMUgjV3sQjulyIcQ092pi097CHUyjrSlrBZD+Um3CKZSngPv8m
         BtvrS4pR/Dt/x15CBSI9yzEHu3d+SV9Y+U8fgPpvV127xqLTD4gtkSHSXptrrJMUIvCA
         6yyI6DjvVsY7sQR5p1Ra0UWRafgG1+WUgwvohSc7YTP+u3a8cv7/PU1UJppayXqQTrKl
         eLwiT85PkNjUD2xe8uGEm4NGlpN4gt8fsQKQQLkSBwMJsbI4PxdGc8sIv2qQtGe7Th4D
         egHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sePhY3+7FDed9E+NZqtmjotVtiqisjqNp0aqjZx4AYw=;
        fh=XDJB+YcB6giSEiqzkAcBi8PTS2GmZmRBcXp8vK6vc3o=;
        b=TZD4Z8Iz9S1ViRVILuooV75BBGYwEEcZbKPRL95rl+xsNx0NH0qiTEQXNDti93QnUR
         iitvhruM6tG/ckM8hLkxqrdHz3SOjDfgQX9Urfmu3UrXEp3yZk1IZa2cwCff6UPPVm2O
         Q0u80KMblJFhZlpSlYLxeJBwpaw17+Ki0DhfmshYkyjsfVrVN2c1zLOu23mWoj5Z09lO
         MgMuFSNrAI4IvTac3qkwRsBLvtVszfD8pQBSRgCaC2nJcwxzKKmKxEbw7hr5QqYv560M
         WLvJw4mUb0QyK86jEfkfgnKg1IJUl9tZpthxZIDkbB++1ArkC56tqPZQSafs0qQQwupN
         PXqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770686853; x=1771291653; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sePhY3+7FDed9E+NZqtmjotVtiqisjqNp0aqjZx4AYw=;
        b=hO3nDRXs2NUwncE/0FUzsqOP/wFzL/wbs43TqHpPArwa4zXSzauqK2AxqtpLmHUVJL
         zAhjy/pFQs6A4ZKjUmceBKwElt+rMPIgGb8ISSV7oTIKRM3Yx9wOQQvy5h7IG+cop7TH
         NdtXUkS7rfoljBrXQR+SHALSKpfMdN+82ICCVip+GHow79Cyu2Qk6eyDHBnae9VCbN8T
         CbBKZNXWqIrRHbetwLDHsX1d5aY317dcjXQDRn92cp+vW13j/rvNYt7mA/jWC0RZNn1D
         bKFYbGuNNh4eS1jWr82MWTzJeaQdmpMjhWrEoETvvo18AHz56jMU5PXY/LR6ZewB/un7
         ywhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770686853; x=1771291653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sePhY3+7FDed9E+NZqtmjotVtiqisjqNp0aqjZx4AYw=;
        b=oCf1Gb8skdPch5A+4BIDLNnrQ21S8T9srTj+1b6mUNZkNMnz4JzgOhYwV59MBn0OnS
         rjL0yUcJAb6ryTbdCJLMyVsGSJ0Ey+gp3cHyMLe6crbqDwd+0Tf2iVikpWJKx9+b4PGm
         yEBrImdiGmNsKyns44XGI+/mvEhVkC60Lh8Fc2IbOhHIfmwbtmMswv88+k7RfZs1FykY
         p94WMiBEJ2m7cfX4GRsCMorDewweWhl2bkO4FUtlaU7tt+zas304KHaPthUIPP72Rs3O
         zZS7Qk/H05jrXdAonNy7nfq3gqNohoCwh7RVaXKxnjYyOdwNZI5FYejFGiskli+tk6WZ
         VWNg==
X-Forwarded-Encrypted: i=1; AJvYcCXO424Yci7OcmwHG0XUu0qSnEB+zkKAh3g2pk2ZNteiPCMcJWdncbi4WgghuwI9eMqFB9gfyU/xii8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwffvfDb3+5F+SZtgLlt21ftHQpTIg8LAYo5BGbonVhYo1GYnIa
	P5iPwU32BO6noRCUHMP9YeCrNM8mrBUS6CKBSXM8RvJO8Sro2dcCqXh6bhplkYIy/D/uVKYYLdJ
	9zRdfvpcPdg9U6iZLUeKUZU9DdWfKFuA=
X-Gm-Gg: AZuq6aJQbH8Dfj7dYE71jBXAk1yg7NnXlbjUU5OiEQ87x7tD+2gFEf9k0TBlt00ACjf
	fT2e2yOKSCYImrmaLmKSqOcV4WKK0EXE/rAesW0cZkTeej4HfgFg00j22mSlfGWuEFA0rpr4ndN
	wD3kaYJJWjyqmg8cVjBSViMh5jEjvIHJDs8jsmIsn1+JsmtZA4bdahrxjv4NZ+Z43DyJSFTZAZO
	TM9Di7ZzuHxZYu937op4iikF5x12IO41TcyzNxWG+KZGa7411vh2fHJxrmFKp7/Jcv72ERm
X-Received: by 2002:a05:6402:146b:b0:658:1528:669 with SMTP id
 4fb4d7f45d1cf-65a0d144dcbmr262464a12.9.1770686853202; Mon, 09 Feb 2026
 17:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770605931.git.zhoubinbin@loongson.cn> <d62faafc653efab602c8d6bfcdcee1cb217171b9.1770605931.git.zhoubinbin@loongson.cn>
 <aYoPyWS7o27G-AHh@lizhi-Precision-Tower-5810>
In-Reply-To: <aYoPyWS7o27G-AHh@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 10 Feb 2026 09:27:21 +0800
X-Gm-Features: AZwV_Qi5_a-cKTFI06iITBG5Gu1YQfAyT8X0Ih3cxfFWjkoclvcfYBubQp9RiT0
Message-ID: <CAMpQs4+NHVQTcxdsBYp6H7c4FZpsuTo=QpKKY09sgpppDEiuNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dmaengine: loongson: New directory for Loongson
 DMA controllers drivers
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

On Tue, Feb 10, 2026 at 12:48=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Feb 09, 2026 at 11:04:18AM +0800, Binbin Zhou wrote:
> > Gather the Loongson DMA controllers under drivers/dma/loongson/
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  MAINTAINERS                                   |  3 +-
> >  drivers/dma/Kconfig                           | 25 ++---------------
> >  drivers/dma/Makefile                          |  3 +-
> >  drivers/dma/loongson/Kconfig                  | 28 +++++++++++++++++++
> >  drivers/dma/loongson/Makefile                 |  3 ++
> >  .../dma/{ =3D> loongson}/loongson1-apb-dma.c    |  4 +--
> >  .../dma/{ =3D> loongson}/loongson2-apb-dma.c    |  4 +--
> >  7 files changed, 40 insertions(+), 30 deletions(-)
> >  create mode 100644 drivers/dma/loongson/Kconfig
> >  create mode 100644 drivers/dma/loongson/Makefile
> >  rename drivers/dma/{ =3D> loongson}/loongson1-apb-dma.c (99%)
> >  rename drivers/dma/{ =3D> loongson}/loongson2-apb-dma.c (99%)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f630328ca6ae..27f77b68d596 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14777,7 +14777,7 @@ M:    Binbin Zhou <zhoubinbin@loongson.cn>
> >  L:   dmaengine@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> > -F:   drivers/dma/loongson2-apb-dma.c
> > +F:   drivers/dma/loongson/loongson2-apb-dma.c
> >
> >  LOONGSON LS2X I2C DRIVER
> >  M:   Binbin Zhou <zhoubinbin@loongson.cn>
> > @@ -17515,6 +17515,7 @@ F:    arch/mips/boot/dts/loongson/loongson1*
> >  F:   arch/mips/configs/loongson1_defconfig
> >  F:   arch/mips/loongson32/
> >  F:   drivers/*/*loongson1*
> > +F:   drivers/dma/loongson/loongson1-apb-dma.c
> >  F:   drivers/mtd/nand/raw/loongson-nand-controller.c
> >  F:   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> >  F:   sound/soc/loongson/loongson1_ac97.c
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index 66cda7cc9f7a..1b84c5b11654 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -376,29 +376,6 @@ config K3_DMA
> >         Support the DMA engine for Hisilicon K3 platform
> >         devices.
> >
> > -config LOONGSON1_APB_DMA
> > -     tristate "Loongson1 APB DMA support"
> > -     depends on MACH_LOONGSON32 || COMPILE_TEST
> > -     select DMA_ENGINE
> > -     select DMA_VIRTUAL_CHANNELS
> > -     help
> > -       This selects support for the APB DMA controller in Loongson1 So=
Cs,
> > -       which is required by Loongson1 NAND and audio support.
> > -
> > -config LOONGSON2_APB_DMA
> > -     tristate "Loongson2 APB DMA support"
> > -     depends on LOONGARCH || COMPILE_TEST
> > -     select DMA_ENGINE
> > -     select DMA_VIRTUAL_CHANNELS
> > -     help
> > -       Support for the Loongson2 APB DMA controller driver. The
> > -       DMA controller is having single DMA channel which can be
> > -       configured for different peripherals like audio, nand, sdio
> > -       etc which is in APB bus.
> > -
> > -       This DMA controller transfers data from memory to peripheral fi=
fo.
> > -       It does not support memory to memory data transfer.
> > -
> >  config LPC18XX_DMAMUX
> >       bool "NXP LPC18xx/43xx DMA MUX for PL080"
> >       depends on ARCH_LPC18XX || COMPILE_TEST
> > @@ -774,6 +751,8 @@ source "drivers/dma/fsl-dpaa2-qdma/Kconfig"
> >
> >  source "drivers/dma/lgm/Kconfig"
> >
> > +source "drivers/dma/loongson/Kconfig"
> > +
> >  source "drivers/dma/stm32/Kconfig"
> >
> >  # clients
> > diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> > index a54d7688392b..a1c73415b79f 100644
> > --- a/drivers/dma/Makefile
> > +++ b/drivers/dma/Makefile
> > @@ -49,8 +49,6 @@ obj-$(CONFIG_INTEL_IDMA64) +=3D idma64.o
> >  obj-$(CONFIG_INTEL_IOATDMA) +=3D ioat/
> >  obj-y +=3D idxd/
> >  obj-$(CONFIG_K3_DMA) +=3D k3dma.o
> > -obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > -obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> >  obj-$(CONFIG_LPC18XX_DMAMUX) +=3D lpc18xx-dmamux.o
> >  obj-$(CONFIG_LPC32XX_DMAMUX) +=3D lpc32xx-dmamux.o
> >  obj-$(CONFIG_MILBEAUT_HDMAC) +=3D milbeaut-hdmac.o
> > @@ -88,6 +86,7 @@ obj-$(CONFIG_INTEL_LDMA) +=3D lgm/
> >
> >  obj-y +=3D amd/
> >  obj-y +=3D mediatek/
> > +obj-y +=3D loongson/
>
> keep alphabet order

Sorry, I'll fix it in the next version.
>
> Frank
> >  obj-y +=3D qcom/
> >  obj-y +=3D stm32/
> >  obj-y +=3D ti/
> > diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kconfi=
g
> > new file mode 100644
> > index 000000000000..9dbdaef5a59f
> > --- /dev/null
> > +++ b/drivers/dma/loongson/Kconfig
> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Loongson DMA controllers drivers
> > +#
> > +if MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
> > +
> > +config LOONGSON1_APB_DMA
> > +     tristate "Loongson1 APB DMA support"
> > +     select DMA_ENGINE
> > +     select DMA_VIRTUAL_CHANNELS
> > +     help
> > +       This selects support for the APB DMA controller in Loongson1 So=
Cs,
> > +       which is required by Loongson1 NAND and audio support.
> > +
> > +config LOONGSON2_APB_DMA
> > +     tristate "Loongson2 APB DMA support"
> > +     select DMA_ENGINE
> > +     select DMA_VIRTUAL_CHANNELS
> > +     help
> > +       Support for the Loongson2 APB DMA controller driver. The
> > +       DMA controller is having single DMA channel which can be
> > +       configured for different peripherals like audio, nand, sdio
> > +       etc which is in APB bus.
> > +
> > +       This DMA controller transfers data from memory to peripheral fi=
fo.
> > +       It does not support memory to memory data transfer.
> > +
> > +endif
> > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makef=
ile
> > new file mode 100644
> > index 000000000000..6cdd08065e92
> > --- /dev/null
> > +++ b/drivers/dma/loongson/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > +obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> > diff --git a/drivers/dma/loongson1-apb-dma.c b/drivers/dma/loongson/loo=
ngson1-apb-dma.c
> > similarity index 99%
> > rename from drivers/dma/loongson1-apb-dma.c
> > rename to drivers/dma/loongson/loongson1-apb-dma.c
> > index 255fe7eca212..e99247cf90c1 100644
> > --- a/drivers/dma/loongson1-apb-dma.c
> > +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> > @@ -16,8 +16,8 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >
> > -#include "dmaengine.h"
> > -#include "virt-dma.h"
> > +#include "../dmaengine.h"
> > +#include "../virt-dma.h"
> >
> >  /* Loongson-1 DMA Control Register */
> >  #define LS1X_DMA_CTRL                0x0
> > diff --git a/drivers/dma/loongson2-apb-dma.c b/drivers/dma/loongson/loo=
ngson2-apb-dma.c
> > similarity index 99%
> > rename from drivers/dma/loongson2-apb-dma.c
> > rename to drivers/dma/loongson/loongson2-apb-dma.c
> > index c528f02b9f84..0cb607595d04 100644
> > --- a/drivers/dma/loongson2-apb-dma.c
> > +++ b/drivers/dma/loongson/loongson2-apb-dma.c
> > @@ -17,8 +17,8 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >
> > -#include "dmaengine.h"
> > -#include "virt-dma.h"
> > +#include "../dmaengine.h"
> > +#include "../virt-dma.h"
> >
> >  /* Global Configuration Register */
> >  #define LDMA_ORDER_ERG               0x0
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin
