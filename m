Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5C337F74F
	for <loongarch@lists.linux.dev>; Wed,  4 Feb 2026 06:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186958; cv=pass; b=ZApqNVPcMNMTTMsV5vY43WizBVHYtWAdxE2SnKw1GmZSsZNu31KmZHH39n61GffuFwK/5gVo5zP8OL0Hiy3MinAVYcMPjAyhctDF2QZQ5XRgJa4Q2o+CBFwpvYxKRPzhwcMQkQgk5dpgKip7KT5EiQpv9NKJqT9cTPPwBw7B50c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186958; c=relaxed/simple;
	bh=OPJ6hN99fILkc0gQaQdzFx5Dkfa45kS3jkjmQOQY6lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFLQ3ka4uEh453ZXHyhyJMf8EoYtLi3UAHtR8LykGVXbduP6Rg4IeI7q8UWfo/fHFXLj8TajkOFOWm9qYteov2Zxu4zHywFaA09xoJSfEBwPV1YSiHP7PeTE6nB5v2Amt2yz4TdSv11aki4+0pbHUy3stkUAJWoC4XCqD1Urp14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cj+cS1Gb; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj+cS1Gb"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dea72099eso7523865e87.0
        for <loongarch@lists.linux.dev>; Tue, 03 Feb 2026 22:35:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770186956; cv=none;
        d=google.com; s=arc-20240605;
        b=X5v+FKveIw27w62UZvSBTWTFSWUiN6GLot7jCoxskJU9eBqtQwXvRb+DESQLE8oxAL
         vW7nRyOA9AkAaHpyWrVMZtDIxIruyy8TIFGPeFfO25VDgxZjgSnQQFFZ61eGYOaM1hZR
         Cjiub0MZomFOR9K8+QBDgNS4k/MkLmi2K65RceZnP9FUAsWHQomlQOvIUSf2QCex4lS/
         z95wggYqUpCNXPz94en/L64pdGupp/VZCrBE4+T8ePbg2I/fZMPVw1PE4q00NZx3TTEN
         SAsmXF+AKDktVT4Z0YeBVYA9hvK2X3xXr5b5rHeHmG9plm+fNnPwYeIEeNVmiTsJoWdR
         ebCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BPp0z8Fv7wvLo+wR3RpA3lIEoxPehy2fBk8QQW+/QDY=;
        fh=qUoWjPOslkrgdk/qeI7Iu0B8O+P8oDFOrcDJ6jGT+PU=;
        b=EGX7madzc/twIhaQVi0vhxRxwDLZEXXrpzkMfvzUd4GSi4xfNFA+3OUAyYMuP5UQUx
         wRWZfj3XyXUurSYDtTxfAAr1qnAyKSjBSpSRTvkJKCwDDovWGkP6OhNhxWaBSNEjyHP4
         g5B1Y2uS3rsKOxLxyehDDCdHex9oQpQCxxv514D30Q6Zg3zQ/ilPOjSAfyFOe5/SGN4f
         J7BDhgblm143H7F1d9XEhhYXCul3sIndgXBeMAFGebc/tPeWFOhQDuWtLnODrB1G6QCq
         Nmuyp23Bd5E3hw7SZ3lWK6viDEvPVCgUAzKb2iec3RphYkZkphaSFg5sRZ3R5sC2lK59
         PpOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770186956; x=1770791756; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPp0z8Fv7wvLo+wR3RpA3lIEoxPehy2fBk8QQW+/QDY=;
        b=cj+cS1GbivF0IcftAsz9FDt1PoHtC+EI2JsvQjxpW7d087hF7CToA+8wV898iaabie
         OlQAgqQ9hWESS6RWn7xYqUWOwy3C/e0Nnw2s3RVd/QXywUcVPRSlbsvZYoGhQjiHzXxn
         SHdTw0ZtrK5NSdcF4X9ig0R5dP92HtvdH5lkkkOOINdXenU1E/lASvuUFRxExCJUh5vL
         5jUxgYsapfyq2rGsHsIwLvFYR4HEO1iXqi3c9K/r+ieBnMpLqe1wlxpihhe/+9OcZkgr
         KGGTcUCv2D8n9iLbttxj2WymqX09kGLdelVNQ/VFVySX4VcXqW+hzBhS2IFM3PV6HPDy
         UlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770186956; x=1770791756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPp0z8Fv7wvLo+wR3RpA3lIEoxPehy2fBk8QQW+/QDY=;
        b=O8N5z96ZSTNUMmxTip4+Jtf+russI79Xn4NQ+mMofELARS4nddDCbMG4zxpqskRcaF
         a0r4/8W4v289hBBRsEybpa/qYsqQycwMsTgy5l1oCFaecbLDCRu/p76LEofOzGw6WO96
         x7aOuOrl0Cx9uSgua9hAy92laO7JBcvazoS9Je71nuZhO63J4XU+ce0wTYhyAK0AZ/CG
         sNJvaLuYKMVwIHH2Y5SS7eNgW4rAuwdXAVCl/PaRSCJln9ne5cgC1kb82srzYMoTUgQq
         lOaAtk9gkU0/MiQDwbInsLaO3r5XU/5dVm2GOiJK0JTxaoCxGormvTC+4CxX2HwD5YNq
         7MWA==
X-Forwarded-Encrypted: i=1; AJvYcCUACE44plpOII9ZWDfSF5IFOmKmKMNfprralS3ylBFMTsZ+vTQ1fm8f9poM60DYifIu5No3DKWzg2U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQI6qXR3Fur9KhBhErCs6kdc6drgM5o8KK/nhKT6aEamga0hGI
	+IlRB1+wUTx0MbpnHWUoxwf01OQ33vx0PMY/uqmFjbt4ayFQVe/UnVpgqRH+l6+KnoHlT4mmVyN
	+eB53+NZcJmP+wNkDHS/Kgxvs9ZnQojU=
X-Gm-Gg: AZuq6aLMfnk6ASuabs3XCTI3Tu711IGTZzd7JOe/RtZXiIJSGZ+WRT4R3YLZv7u9hkI
	V80k8xnpZu5Ur67JQKTzyJsn9J+fRxyakxaJYwbgCfVUyS7HaABOmrlEdIGllw5u+IhIFXZmwy/
	eUYJMF2rqw6mUBXLLM/MCd6GhvYlUPhWxWa/0+ejT7XFsK0koVgLrAvI3ScnicIQg1/8y9Mcp3r
	kzgHY8h4risj/D2UhlwzAqriIbLzQe0Dp6lrKD2Ph+jxCqQvkSRFEYWMpurv6iCdCGdvAtazr4T
	vMR0AF0aLkEtVi5J0tSr8RsZ+SrFljfmH6izh92lvXCLOA3lZnuuYtXJZfFQrNh6m8/O
X-Received: by 2002:ac2:4e10:0:b0:59e:6f4:d21e with SMTP id
 2adb3069b0e04-59e38c30bc6mr627593e87.35.1770186955513; Tue, 03 Feb 2026
 22:35:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770119693.git.zhoubinbin@loongson.cn> <d7a73d1fe8a3e4e57055a15a6ec03170f0d8ca21.1770119693.git.zhoubinbin@loongson.cn>
 <CAJhJPsVRZe_E6FsNBUa6K=GmPp3FXRrOH=yguvTY=K1cGwa62Q@mail.gmail.com> <CAMpQs4JM43ePsYAA0GVeKc5_WJL1TWSm-K2RKXcYJjttR6k6-w@mail.gmail.com>
In-Reply-To: <CAMpQs4JM43ePsYAA0GVeKc5_WJL1TWSm-K2RKXcYJjttR6k6-w@mail.gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 4 Feb 2026 14:35:18 +0800
X-Gm-Features: AZwV_QiO7G4Ev4glVwn9PgtXPCuEnylN60ZTP0WNS0S1J--3jxgCaWQEGD8l0o4
Message-ID: <CAJhJPsXHZnC-BZu13YiMXNTP9VqE_0mnpOUBbnB7a6-GJy-n+w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dmaengine: loongson: New directory for Loongson DMA
 controllers drivers
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Binbin,

On Wed, Feb 4, 2026 at 2:19=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.com>=
 wrote:
>
> Hi Keguang:
>
> On Wed, Feb 4, 2026 at 1:43=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail=
.com> wrote:
> >
> > On Tue, Feb 3, 2026 at 8:30=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson=
.cn> wrote:
> > >
> > > Gather the Loongson DMA controllers under drivers/dma/loongson/
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  MAINTAINERS                                   |  2 +-
> > >  drivers/dma/Kconfig                           | 25 ++---------------
> > >  drivers/dma/Makefile                          |  3 +-
> > >  drivers/dma/loongson/Kconfig                  | 28 +++++++++++++++++=
++
> > >  drivers/dma/loongson/Makefile                 |  3 ++
> > >  .../dma/{ =3D> loongson}/loongson1-apb-dma.c    |  4 +--
> > >  .../dma/{ =3D> loongson}/loongson2-apb-dma.c    |  4 +--
> > >  7 files changed, 39 insertions(+), 30 deletions(-)
> > >  create mode 100644 drivers/dma/loongson/Kconfig
> > >  create mode 100644 drivers/dma/loongson/Makefile
> > >  rename drivers/dma/{ =3D> loongson}/loongson1-apb-dma.c (99%)
> >
> > The file loongson1-apb-dma.c was moved to drivers/dma/loongson/,
> > but the MAINTAINERS entry still refers to the old path.
>
> In the MAINTAINERS, the loongson1 driver filename is matched using the
> wildcard `*`. This move operation appears to have no effect.
>
> As follows:
>
> MIPS/LOONGSON1 ARCHITECTURE
> M:      Keguang Zhang <keguang.zhang@gmail.com>
> L:      linux-mips@vger.kernel.org
> S:      Maintained
> F:      Documentation/devicetree/bindings/*/loongson,ls1*.yaml
> F:      arch/mips/boot/dts/loongson/loongson1*
> F:      arch/mips/configs/loongson1_defconfig
> F:      arch/mips/loongson32/
> F:      drivers/*/*loongson1*

I have verified that drivers/*/*loongson1* does not cover
drivers/dma/loongson/loongson1-apb-dma.c.
Please consider adding one of the following entries to MAINTAINERS:
drivers/dma/loongson/loongson1-apb-dma.c
or
drivers/*/loongson/*loongson1*

Thanks!

> F:      drivers/mtd/nand/raw/loongson-nand-controller.c
> F:      drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> F:      sound/soc/loongson/loongson1_ac97.c
>
> >
> > >  rename drivers/dma/{ =3D> loongson}/loongson2-apb-dma.c (99%)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 5b11839cba9d..66807104af63 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -14776,7 +14776,7 @@ M:      Binbin Zhou <zhoubinbin@loongson.cn>
> > >  L:     dmaengine@vger.kernel.org
> > >  S:     Maintained
> > >  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.ya=
ml
> > > -F:     drivers/dma/loongson2-apb-dma.c
> > > +F:     drivers/dma/loongson/loongson2-apb-dma.c
> > >
> > >  LOONGSON LS2X I2C DRIVER
> > >  M:     Binbin Zhou <zhoubinbin@loongson.cn>
> > > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > > index 66cda7cc9f7a..1b84c5b11654 100644
> > > --- a/drivers/dma/Kconfig
> > > +++ b/drivers/dma/Kconfig
> > > @@ -376,29 +376,6 @@ config K3_DMA
> > >           Support the DMA engine for Hisilicon K3 platform
> > >           devices.
> > >
> > > -config LOONGSON1_APB_DMA
> > > -       tristate "Loongson1 APB DMA support"
> > > -       depends on MACH_LOONGSON32 || COMPILE_TEST
> > > -       select DMA_ENGINE
> > > -       select DMA_VIRTUAL_CHANNELS
> > > -       help
> > > -         This selects support for the APB DMA controller in Loongson=
1 SoCs,
> > > -         which is required by Loongson1 NAND and audio support.
> > > -
> > > -config LOONGSON2_APB_DMA
> > > -       tristate "Loongson2 APB DMA support"
> > > -       depends on LOONGARCH || COMPILE_TEST
> > > -       select DMA_ENGINE
> > > -       select DMA_VIRTUAL_CHANNELS
> > > -       help
> > > -         Support for the Loongson2 APB DMA controller driver. The
> > > -         DMA controller is having single DMA channel which can be
> > > -         configured for different peripherals like audio, nand, sdio
> > > -         etc which is in APB bus.
> > > -
> > > -         This DMA controller transfers data from memory to periphera=
l fifo.
> > > -         It does not support memory to memory data transfer.
> > > -
> > >  config LPC18XX_DMAMUX
> > >         bool "NXP LPC18xx/43xx DMA MUX for PL080"
> > >         depends on ARCH_LPC18XX || COMPILE_TEST
> > > @@ -774,6 +751,8 @@ source "drivers/dma/fsl-dpaa2-qdma/Kconfig"
> > >
> > >  source "drivers/dma/lgm/Kconfig"
> > >
> > > +source "drivers/dma/loongson/Kconfig"
> > > +
> > >  source "drivers/dma/stm32/Kconfig"
> > >
> > >  # clients
> > > diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> > > index a54d7688392b..a1c73415b79f 100644
> > > --- a/drivers/dma/Makefile
> > > +++ b/drivers/dma/Makefile
> > > @@ -49,8 +49,6 @@ obj-$(CONFIG_INTEL_IDMA64) +=3D idma64.o
> > >  obj-$(CONFIG_INTEL_IOATDMA) +=3D ioat/
> > >  obj-y +=3D idxd/
> > >  obj-$(CONFIG_K3_DMA) +=3D k3dma.o
> > > -obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > > -obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> > >  obj-$(CONFIG_LPC18XX_DMAMUX) +=3D lpc18xx-dmamux.o
> > >  obj-$(CONFIG_LPC32XX_DMAMUX) +=3D lpc32xx-dmamux.o
> > >  obj-$(CONFIG_MILBEAUT_HDMAC) +=3D milbeaut-hdmac.o
> > > @@ -88,6 +86,7 @@ obj-$(CONFIG_INTEL_LDMA) +=3D lgm/
> > >
> > >  obj-y +=3D amd/
> > >  obj-y +=3D mediatek/
> > > +obj-y +=3D loongson/
> > >  obj-y +=3D qcom/
> > >  obj-y +=3D stm32/
> > >  obj-y +=3D ti/
> > > diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kcon=
fig
> > > new file mode 100644
> > > index 000000000000..9dbdaef5a59f
> > > --- /dev/null
> > > +++ b/drivers/dma/loongson/Kconfig
> > > @@ -0,0 +1,28 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Loongson DMA controllers drivers
> > > +#
> > > +if MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
> > > +
> > > +config LOONGSON1_APB_DMA
> > > +       tristate "Loongson1 APB DMA support"
> > > +       select DMA_ENGINE
> > > +       select DMA_VIRTUAL_CHANNELS
> > > +       help
> > > +         This selects support for the APB DMA controller in Loongson=
1 SoCs,
> > > +         which is required by Loongson1 NAND and audio support.
> > > +
> > > +config LOONGSON2_APB_DMA
> > > +       tristate "Loongson2 APB DMA support"
> > > +       select DMA_ENGINE
> > > +       select DMA_VIRTUAL_CHANNELS
> > > +       help
> > > +         Support for the Loongson2 APB DMA controller driver. The
> > > +         DMA controller is having single DMA channel which can be
> > > +         configured for different peripherals like audio, nand, sdio
> > > +         etc which is in APB bus.
> > > +
> > > +         This DMA controller transfers data from memory to periphera=
l fifo.
> > > +         It does not support memory to memory data transfer.
> > > +
> > > +endif
> > > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Mak=
efile
> > > new file mode 100644
> > > index 000000000000..6cdd08065e92
> > > --- /dev/null
> > > +++ b/drivers/dma/loongson/Makefile
> > > @@ -0,0 +1,3 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > > +obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> > > diff --git a/drivers/dma/loongson1-apb-dma.c b/drivers/dma/loongson/l=
oongson1-apb-dma.c
> > > similarity index 99%
> > > rename from drivers/dma/loongson1-apb-dma.c
> > > rename to drivers/dma/loongson/loongson1-apb-dma.c
> > > index 255fe7eca212..e99247cf90c1 100644
> > > --- a/drivers/dma/loongson1-apb-dma.c
> > > +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> > > @@ -16,8 +16,8 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/slab.h>
> > >
> > > -#include "dmaengine.h"
> > > -#include "virt-dma.h"
> > > +#include "../dmaengine.h"
> > > +#include "../virt-dma.h"
> > >
> > >  /* Loongson-1 DMA Control Register */
> > >  #define LS1X_DMA_CTRL          0x0
> > > diff --git a/drivers/dma/loongson2-apb-dma.c b/drivers/dma/loongson/l=
oongson2-apb-dma.c
> > > similarity index 99%
> > > rename from drivers/dma/loongson2-apb-dma.c
> > > rename to drivers/dma/loongson/loongson2-apb-dma.c
> > > index c528f02b9f84..0cb607595d04 100644
> > > --- a/drivers/dma/loongson2-apb-dma.c
> > > +++ b/drivers/dma/loongson/loongson2-apb-dma.c
> > > @@ -17,8 +17,8 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/slab.h>
> > >
> > > -#include "dmaengine.h"
> > > -#include "virt-dma.h"
> > > +#include "../dmaengine.h"
> > > +#include "../virt-dma.h"
> > >
> > >  /* Global Configuration Register */
> > >  #define LDMA_ORDER_ERG         0x0
> > > --
> > > 2.47.3
> > >
> >
> >
> > --
> > Best regards,
> >
> > Keguang Zhang
>
> --
> Thanks.
> Binbin



--=20
Best regards,

Keguang Zhang
