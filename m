Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F239A37C11C
	for <loongarch@lists.linux.dev>; Wed,  4 Feb 2026 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770185961; cv=pass; b=gmyKE0jmtcYG08gsx0PLK4sKtyuln0HEXaT8h7fnDhisoWyif2qqMI0pAordZx6RyklKop3iQd++AEHZMpkmrp6N5GpUYmpsavnM16fzVlC3IUGJSXCTocT0C09/O1dcJZyvBJgxQnMz5yTg0V3xFDKpSwZ2+IUoMb1PwnX0pBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770185961; c=relaxed/simple;
	bh=bVfEmi98HwWlqMY00MAf1kHEVmJ1Wh37awqfJ88Gffo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5c0iWDcI4C91hrOqtid2ZWb6V1B2SKWHVUwSDHLN0zI4xkqVrForFjCq/4QKvxh3LUXKTJOx1ppH1Mh2YpaJ2I1qsksGtpRvBbnt5ae1mdf8QeouLfV913OxhvyfmbIoy1Fn2fI7PSSP3QN3bU7bFOAS+u67NX/4AevzN3UCr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJrodxi9; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJrodxi9"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8850aa5b56so1027964866b.2
        for <loongarch@lists.linux.dev>; Tue, 03 Feb 2026 22:19:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770185959; cv=none;
        d=google.com; s=arc-20240605;
        b=aP9YQoo17J7mmuYjkn/UBPo37TDWYNxyp0CbTxJTaLa+5AGslsixPtzwuMFqROBWKF
         K0PnLWa9SCVei3oGvpU4HYPwCByRX82+XN9yxf33ACFXLL0DqtMcw4qm6CNZU4/kcB7m
         ZSAaOD/5gO1Ybi17CnKTPYqdkFJUH3sOqw4RE04UOcXHsFYWVQKNobGA1rx3MGEmqWHu
         /kR/7ITSc+9gE4I+d0JLfUQgwAEd2GKVVjPKIT58gZqV3Cx7SRoVM4ABUPjIl3g5QPX4
         cQuU0qvAjciKjSC6KwaWF3xTs8RXL30zwV+4RF6AXRi05ZrJLPPTvSTUcOYq6sBDWtU1
         rcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVIVEenpiD1PXgrX2ztAIdmNemiB1u7jQRnU016vEfg=;
        fh=5BGGia2ZBQKny/nq8n6gdFtE2ITHlf6uZxWL7OJ1E38=;
        b=OfJtm8j255qpYpVZvVYKAQep+ozCEwt0Cpzy7EImgh+fVyaAMH5HtDI6Tq1ljGdUUH
         LkgyDHjx7zxX7ImzwwkXZXxYmDMNXao36ss0+IhKnZ5r5QWMQ+w3Ss0nlrBpRzwLz7/V
         +wwXFgWUcshFyXTnq7RkgB92W8TdZ6XrQqodLZbqbS1o1a1FZkcPhL8mydQvpvHh+3su
         ob1a0cdXSt3L2faJmjYoaHODZ27t/7Y7fLYZc2ynfDAMaVlNNqDjYBVbJ/jtIw3ScA0G
         kJpemToFoaQXkTMGDD0fqXwwFNgctfQmAzAKRotUGrc+6TUJM2L5mJMCGbOklRo5Q6NQ
         Txog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770185959; x=1770790759; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVIVEenpiD1PXgrX2ztAIdmNemiB1u7jQRnU016vEfg=;
        b=WJrodxi9KeeIjHTaH/KLHLB01e98IOYmArmob0aGnmgja2vu6RB5TVaTM/amk7dnXa
         wSgNXuUf4dJksgjO7H/y4imT81j+orpDyfuXb1lebDK94kISlTom66M0QFGw40VgWHl2
         7Ov7A3XbB25t/LPNHpwzACu2v8FUD4B4p021/m1CYvlqVRBo/XYSJBBMqUlTWj763011
         uzte+zB7FbblUS3YVnTsLxU2SGk9mfv7j5sGHwNiWs1YSMe7gUWznu1vzD+r3bg6n8/0
         O8EKb83lWsjhUkjFSkuidj/0sOV2HpXNaeUlAQHlR2Yyc4voVxtuMv4lhQZqhQh/4DfF
         kqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770185959; x=1770790759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NVIVEenpiD1PXgrX2ztAIdmNemiB1u7jQRnU016vEfg=;
        b=ec8uxCvZzt1i4bjk6orl32awNhcgY9X36KhM9PBBREHECKqPkbGdP8VJEjtUpj34Zx
         0qKidaaWDxzEDjqYtu5Xrspcao6rX+8IoUolmhq/MixDSNuIwmgdS9be3VgAuCIgd5Yo
         7/hgOiY6cbk6FRsa6bGX/FN81K9TQAr1LNew+FOmbUSwC6JBvcqLj7Cz0pVnnxQumNRF
         zN6dPS0aVI/JOlrorox26pMbdcUATYPtBLjj7bVP9sGLpUKj7iyRqvVqFqs7ZtFMZYT6
         3t1Fsaw7TNizWBNKNkITTfHDi79lRcAI1DYeVUK/t94avpuY/ocpjiV7Y+yzQgvoRnX+
         0gKg==
X-Forwarded-Encrypted: i=1; AJvYcCVJa9eeYgSrhGSyHkf6uhpS9ApRKSdbR8RaRRKEUgdCuOr2iGY3LLWE5mceN54TgI4JPumEMpsa/8A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8alMSqy3ju/KzprlyWPzgzIEHq6t9B8XUOhQ3PwmmZivvrwJ0
	NwnfaVv/U8oofcvjAgaGZQo6R05tc5v5klKfEoxz6j2UX+k7cOWcLoyxJvwjsDk2NAGfLQvfOhR
	h+YFTmmhTIGWFWt+QaAW/0vx6BEsLVp0=
X-Gm-Gg: AZuq6aIlEkF9CacQdqku4BKGSdzp4Iu3+Ow+tYCf+L4e2NFdAr3GK0YuI+hl3V0Q7zo
	sKb44FMjSL6JGrhFBZLyst/IwrtSO/b4gM1gvFhWPT651tsEEsmJsB2HDs8ABzmGv8ycbKWVMOl
	E0qUrlVgX2P/hdiYka4vafyRbUpd8COooPVQQoIkoNNBff+Fo2JNmIdPJfbhmbAECI0jEyPhO85
	ZDBCxwJUQYK4p+jvxQ9DxCt3sDR6ZV/ox38YBXvSakmlDodCWdAty6qP5NlAhBizDBJto8=
X-Received: by 2002:a17:907:6d27:b0:b87:3174:9bbe with SMTP id
 a640c23a62f3a-b8e9f544c5bmr119028966b.61.1770185958835; Tue, 03 Feb 2026
 22:19:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770119693.git.zhoubinbin@loongson.cn> <d7a73d1fe8a3e4e57055a15a6ec03170f0d8ca21.1770119693.git.zhoubinbin@loongson.cn>
 <CAJhJPsVRZe_E6FsNBUa6K=GmPp3FXRrOH=yguvTY=K1cGwa62Q@mail.gmail.com>
In-Reply-To: <CAJhJPsVRZe_E6FsNBUa6K=GmPp3FXRrOH=yguvTY=K1cGwa62Q@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 4 Feb 2026 14:19:06 +0800
X-Gm-Features: AZwV_QjF3YyiqoE0PKGT64ezLZ8uAEjt6J21_QDxrbC7oBPA-19LzeMuSNLcgVs
Message-ID: <CAMpQs4JM43ePsYAA0GVeKc5_WJL1TWSm-K2RKXcYJjttR6k6-w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dmaengine: loongson: New directory for Loongson DMA
 controllers drivers
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Keguang:

On Wed, Feb 4, 2026 at 1:43=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail.c=
om> wrote:
>
> On Tue, Feb 3, 2026 at 8:30=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > Gather the Loongson DMA controllers under drivers/dma/loongson/
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  MAINTAINERS                                   |  2 +-
> >  drivers/dma/Kconfig                           | 25 ++---------------
> >  drivers/dma/Makefile                          |  3 +-
> >  drivers/dma/loongson/Kconfig                  | 28 +++++++++++++++++++
> >  drivers/dma/loongson/Makefile                 |  3 ++
> >  .../dma/{ =3D> loongson}/loongson1-apb-dma.c    |  4 +--
> >  .../dma/{ =3D> loongson}/loongson2-apb-dma.c    |  4 +--
> >  7 files changed, 39 insertions(+), 30 deletions(-)
> >  create mode 100644 drivers/dma/loongson/Kconfig
> >  create mode 100644 drivers/dma/loongson/Makefile
> >  rename drivers/dma/{ =3D> loongson}/loongson1-apb-dma.c (99%)
>
> The file loongson1-apb-dma.c was moved to drivers/dma/loongson/,
> but the MAINTAINERS entry still refers to the old path.

In the MAINTAINERS, the loongson1 driver filename is matched using the
wildcard `*`. This move operation appears to have no effect.

As follows:

MIPS/LOONGSON1 ARCHITECTURE
M:      Keguang Zhang <keguang.zhang@gmail.com>
L:      linux-mips@vger.kernel.org
S:      Maintained
F:      Documentation/devicetree/bindings/*/loongson,ls1*.yaml
F:      arch/mips/boot/dts/loongson/loongson1*
F:      arch/mips/configs/loongson1_defconfig
F:      arch/mips/loongson32/
F:      drivers/*/*loongson1*
F:      drivers/mtd/nand/raw/loongson-nand-controller.c
F:      drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
F:      sound/soc/loongson/loongson1_ac97.c

>
> >  rename drivers/dma/{ =3D> loongson}/loongson2-apb-dma.c (99%)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5b11839cba9d..66807104af63 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14776,7 +14776,7 @@ M:      Binbin Zhou <zhoubinbin@loongson.cn>
> >  L:     dmaengine@vger.kernel.org
> >  S:     Maintained
> >  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> > -F:     drivers/dma/loongson2-apb-dma.c
> > +F:     drivers/dma/loongson/loongson2-apb-dma.c
> >
> >  LOONGSON LS2X I2C DRIVER
> >  M:     Binbin Zhou <zhoubinbin@loongson.cn>
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index 66cda7cc9f7a..1b84c5b11654 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -376,29 +376,6 @@ config K3_DMA
> >           Support the DMA engine for Hisilicon K3 platform
> >           devices.
> >
> > -config LOONGSON1_APB_DMA
> > -       tristate "Loongson1 APB DMA support"
> > -       depends on MACH_LOONGSON32 || COMPILE_TEST
> > -       select DMA_ENGINE
> > -       select DMA_VIRTUAL_CHANNELS
> > -       help
> > -         This selects support for the APB DMA controller in Loongson1 =
SoCs,
> > -         which is required by Loongson1 NAND and audio support.
> > -
> > -config LOONGSON2_APB_DMA
> > -       tristate "Loongson2 APB DMA support"
> > -       depends on LOONGARCH || COMPILE_TEST
> > -       select DMA_ENGINE
> > -       select DMA_VIRTUAL_CHANNELS
> > -       help
> > -         Support for the Loongson2 APB DMA controller driver. The
> > -         DMA controller is having single DMA channel which can be
> > -         configured for different peripherals like audio, nand, sdio
> > -         etc which is in APB bus.
> > -
> > -         This DMA controller transfers data from memory to peripheral =
fifo.
> > -         It does not support memory to memory data transfer.
> > -
> >  config LPC18XX_DMAMUX
> >         bool "NXP LPC18xx/43xx DMA MUX for PL080"
> >         depends on ARCH_LPC18XX || COMPILE_TEST
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
> > +       tristate "Loongson1 APB DMA support"
> > +       select DMA_ENGINE
> > +       select DMA_VIRTUAL_CHANNELS
> > +       help
> > +         This selects support for the APB DMA controller in Loongson1 =
SoCs,
> > +         which is required by Loongson1 NAND and audio support.
> > +
> > +config LOONGSON2_APB_DMA
> > +       tristate "Loongson2 APB DMA support"
> > +       select DMA_ENGINE
> > +       select DMA_VIRTUAL_CHANNELS
> > +       help
> > +         Support for the Loongson2 APB DMA controller driver. The
> > +         DMA controller is having single DMA channel which can be
> > +         configured for different peripherals like audio, nand, sdio
> > +         etc which is in APB bus.
> > +
> > +         This DMA controller transfers data from memory to peripheral =
fifo.
> > +         It does not support memory to memory data transfer.
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
> >  #define LS1X_DMA_CTRL          0x0
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
> >  #define LDMA_ORDER_ERG         0x0
> > --
> > 2.47.3
> >
>
>
> --
> Best regards,
>
> Keguang Zhang

--=20
Thanks.
Binbin
