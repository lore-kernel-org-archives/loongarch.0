Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A337F8DE
	for <loongarch@lists.linux.dev>; Wed,  4 Feb 2026 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187099; cv=pass; b=pXrYIX0+yY/s3kt8ldlPHnB+YiE8QW/ae+pkTxQgqM72Pwvn5hpT/yxKJbm5Nw1S37p77OY0F4mXV7tg6Sso3B1j/yGK8H5ny1SKOMUeT517/gEaz8rFNtCZ9tciFwzW+5U+rhIgQ8dYt5oaAmd/+0g8rbUAXfPKT/sOYjoSk1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187099; c=relaxed/simple;
	bh=G1czA/atzJVQ0I8k8+uEe7K7HnzEQCu/aZUYWjlKOms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIywOFx8gz5od5lWnbv2EFQggkudzNO3oGZ90yG3R9IqF4xiHsgRGh/Is3Up+ZGRoUB0vKtDJcFlBYHdhTW1DbcZlIhgIa/WPMe9gBycxVEzOf3jrEQ5n3a24WxXX3msNIf6QXElJRXO53sepqeKPtCJC5SlDV92GOT/l9o3rMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcDya6a+; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcDya6a+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so904979a12.0
        for <loongarch@lists.linux.dev>; Tue, 03 Feb 2026 22:38:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770187097; cv=none;
        d=google.com; s=arc-20240605;
        b=RQfJYYdq22GO2A+cT5XiOg7st3nqKxN91OxC+XkSuRSxsemVLx24XgsLPiUaOtkbWZ
         W3OU/+E2nhIZMw3bRPdyfGUj/bcHukkL/xmzAQYH3H7aYV3GVSiHKOb9PBMLwlMShAkD
         zpghfvxXnQpH68I8z783bVwiay7XBH+j/CgqQicZJCoutpcwvxaaidceA9i48dM2zelY
         DqykwpV/Hyk8D2/PW4/i2TW9DoEjpSX0cxrk3GQFtMZivQFc6E7jP5c/aQY9q/U3vZ0j
         Ok+0kCOVilYDbwt2ysp85pLD1EgdRJYLAucl+SK6hYz2rLzTtCT2/DDPE+6LKuvQsjz/
         sLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmAMbKQUycWizHRkwV+uncj9jKX+nJIb4YwsZPnmiOk=;
        fh=Ard1Nt9Ir5lSrjkGCv4OTFvSgOH69B0N/Uw31VZmkwE=;
        b=dCN9hK3/wCZiDRrmEyuOD2m0zvEqeV+p/wamivl1lLjrLbPoaZpOglmBXTBAho9Wy2
         JXaL/TIK9g5QEtWqZmcQ4QbQ7BuJlX/2BJUBFHKDkTkcHkIoL+bm9B0zVZ7hXrBfeEvD
         vdYwpUXWuUTBrJw64PLhgLTR0ee8ZLbCCPlA75HkSdFSG8YxhIoBi9p+DmCivlnSwkjq
         KMd7uUYsC1IQs2RtGGcwixr50Pai6pjP4VXPIRDSbSMUIPnZl7da8xSa14A7atgkai4D
         CU6zH52jG/WykqnC/G+J+3tVTsLTv3RgLgq6V66fozUys9dzVwlt+gzlbsgyUrEb5Lj0
         PANA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770187097; x=1770791897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmAMbKQUycWizHRkwV+uncj9jKX+nJIb4YwsZPnmiOk=;
        b=DcDya6a++xprS6TSkxRwQMMM6agAD/Rabyr9ZrrPYUXcGSwh2AZUFrw4/du6k8jsTc
         R8rut7jGFmzf/9q5egKjsfVKd7fak3msSSV/hMXO9YSrZMU9PEzQp+DMAiee1cfc8u4v
         qDE4rXlXAabKWj8CPEFQkPikJ5BR593h1hDqbIxpmTrUacPO75aDU+2ovwvTNL9eqdl6
         Kjvsr0+2eSMeQLeXwtfT0o0R/QdZniEgyWptIwLXPe8VfaXeMXej9k6FAIiUvYMYUZcE
         r+WNFFARhqW/GFrx27aoHXIGiy8MFz67Octw+5XIboCjjTvnATBOrHq4+vaK062klyqv
         2Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770187097; x=1770791897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmAMbKQUycWizHRkwV+uncj9jKX+nJIb4YwsZPnmiOk=;
        b=spTZ8f77XQQf9MbjkHw/T+ykta81EtKP3JFJUlIHuB4ALjK0Vr6dOAzLeCVvJZ7ybh
         2NDBzGuqxZx1Bon/Sb8VnKpFK8PUuj9QMwFXB0BhX/b50tBiLwwfdPnI/fpOFGSKj4oI
         GX9lOQTzyvEjH/qSl6zGwTCIijlSy1BCstsxQtKlzdv56TdnCTh8kTVXb2/vgXo3QJT4
         ItvH5F0W/D7HObI5x2dknYGxT+X4ZLLZnwC35T01S1G9y4lpJ3DMEaeN5hKVHic2zqCR
         22n6/A7W6CSa4TM8Rje7Ys4UIWnrVPeV/62qNPA2EB69mI/uEWtAFYTKlCLBBto5gunP
         IJTg==
X-Forwarded-Encrypted: i=1; AJvYcCVK/bW1NHXdLZ9Ke+omNxoHcH1dFDVsCf5J2wr4w1/ol9RBejd5p3+WSi8lI4L6f8ffYK0E/jQ2oAM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwpMGU5DO0O3jvUN1IQ1tzZMGHei82685EEgmwbSib15OUs2vB
	1xr2qUyemZ22orMfOOWOKbS3U/9aIKYofIAwG1/hHw1VAjW/Y4vMMrlG+Qqoa3suojw7vwPlNFg
	bGga3yFWfILonSNwc/OCJGWn5VG9MrGQ=
X-Gm-Gg: AZuq6aIedi/BjZWh4buWMNSmwcqz09k0kyyqUl2u21zJMuXjIXGqCdZPa/jhASjo7Qx
	Kk7BJdAaih1/3h8OEiK0Rbi3vYE0FHLNMOuaxDzwOxxoGHmAx7fwre2xztxuIAXYtvXoLcxY8Yy
	GHNihhanNIQICYsgTqyogaw7NiuBuMkupdcT9jg7Ea4VLEUibh/mWx5yBrw5K+8izy2hdWfS2kY
	Ay3g2VruuCZSqHrdofF2/GLNPER5nLFOte4DRf/ksd8YH3459oYoeiG9jgPFVeT3s9Lamc0nhK9
	L29H0Q==
X-Received: by 2002:a17:907:1c88:b0:b88:4224:815b with SMTP id
 a640c23a62f3a-b8e9f916070mr149447666b.3.1770187096906; Tue, 03 Feb 2026
 22:38:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770119693.git.zhoubinbin@loongson.cn> <d7a73d1fe8a3e4e57055a15a6ec03170f0d8ca21.1770119693.git.zhoubinbin@loongson.cn>
 <CAJhJPsVRZe_E6FsNBUa6K=GmPp3FXRrOH=yguvTY=K1cGwa62Q@mail.gmail.com>
 <CAMpQs4JM43ePsYAA0GVeKc5_WJL1TWSm-K2RKXcYJjttR6k6-w@mail.gmail.com> <CAJhJPsXHZnC-BZu13YiMXNTP9VqE_0mnpOUBbnB7a6-GJy-n+w@mail.gmail.com>
In-Reply-To: <CAJhJPsXHZnC-BZu13YiMXNTP9VqE_0mnpOUBbnB7a6-GJy-n+w@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 4 Feb 2026 14:38:04 +0800
X-Gm-Features: AZwV_Qh2oEmLUd_ddWtCs_wCyqukUmQaKhtMX0y9BvYgZyKogQ8PSKcUYrrILUc
Message-ID: <CAMpQs4LNZ-ukbFq5rLLFhVegYQBvHijnDp7pEp4uz7ebGZE_NQ@mail.gmail.com>
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

On Wed, Feb 4, 2026 at 2:35=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail.c=
om> wrote:
>
> Binbin,
>
> On Wed, Feb 4, 2026 at 2:19=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.co=
m> wrote:
> >
> > Hi Keguang:
> >
> > On Wed, Feb 4, 2026 at 1:43=E2=80=AFPM Keguang Zhang <keguang.zhang@gma=
il.com> wrote:
> > >
> > > On Tue, Feb 3, 2026 at 8:30=E2=80=AFPM Binbin Zhou <zhoubinbin@loongs=
on.cn> wrote:
> > > >
> > > > Gather the Loongson DMA controllers under drivers/dma/loongson/
> > > >
> > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > ---
> > > >  MAINTAINERS                                   |  2 +-
> > > >  drivers/dma/Kconfig                           | 25 ++-------------=
--
> > > >  drivers/dma/Makefile                          |  3 +-
> > > >  drivers/dma/loongson/Kconfig                  | 28 +++++++++++++++=
++++
> > > >  drivers/dma/loongson/Makefile                 |  3 ++
> > > >  .../dma/{ =3D> loongson}/loongson1-apb-dma.c    |  4 +--
> > > >  .../dma/{ =3D> loongson}/loongson2-apb-dma.c    |  4 +--
> > > >  7 files changed, 39 insertions(+), 30 deletions(-)
> > > >  create mode 100644 drivers/dma/loongson/Kconfig
> > > >  create mode 100644 drivers/dma/loongson/Makefile
> > > >  rename drivers/dma/{ =3D> loongson}/loongson1-apb-dma.c (99%)
> > >
> > > The file loongson1-apb-dma.c was moved to drivers/dma/loongson/,
> > > but the MAINTAINERS entry still refers to the old path.
> >
> > In the MAINTAINERS, the loongson1 driver filename is matched using the
> > wildcard `*`. This move operation appears to have no effect.
> >
> > As follows:
> >
> > MIPS/LOONGSON1 ARCHITECTURE
> > M:      Keguang Zhang <keguang.zhang@gmail.com>
> > L:      linux-mips@vger.kernel.org
> > S:      Maintained
> > F:      Documentation/devicetree/bindings/*/loongson,ls1*.yaml
> > F:      arch/mips/boot/dts/loongson/loongson1*
> > F:      arch/mips/configs/loongson1_defconfig
> > F:      arch/mips/loongson32/
> > F:      drivers/*/*loongson1*
>
> I have verified that drivers/*/*loongson1* does not cover
> drivers/dma/loongson/loongson1-apb-dma.c.
> Please consider adding one of the following entries to MAINTAINERS:
> drivers/dma/loongson/loongson1-apb-dma.c

OK. I will add this.
> or
> drivers/*/loongson/*loongson1*
>
> Thanks!
>
> > F:      drivers/mtd/nand/raw/loongson-nand-controller.c
> > F:      drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> > F:      sound/soc/loongson/loongson1_ac97.c
> >
> > >
> > > >  rename drivers/dma/{ =3D> loongson}/loongson2-apb-dma.c (99%)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 5b11839cba9d..66807104af63 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -14776,7 +14776,7 @@ M:      Binbin Zhou <zhoubinbin@loongson.cn=
>
> > > >  L:     dmaengine@vger.kernel.org
> > > >  S:     Maintained
> > > >  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.=
yaml
> > > > -F:     drivers/dma/loongson2-apb-dma.c
> > > > +F:     drivers/dma/loongson/loongson2-apb-dma.c
> > > >
> > > >  LOONGSON LS2X I2C DRIVER
> > > >  M:     Binbin Zhou <zhoubinbin@loongson.cn>
> > > > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > > > index 66cda7cc9f7a..1b84c5b11654 100644
> > > > --- a/drivers/dma/Kconfig
> > > > +++ b/drivers/dma/Kconfig
> > > > @@ -376,29 +376,6 @@ config K3_DMA
> > > >           Support the DMA engine for Hisilicon K3 platform
> > > >           devices.
> > > >
> > > > -config LOONGSON1_APB_DMA
> > > > -       tristate "Loongson1 APB DMA support"
> > > > -       depends on MACH_LOONGSON32 || COMPILE_TEST
> > > > -       select DMA_ENGINE
> > > > -       select DMA_VIRTUAL_CHANNELS
> > > > -       help
> > > > -         This selects support for the APB DMA controller in Loongs=
on1 SoCs,
> > > > -         which is required by Loongson1 NAND and audio support.
> > > > -
> > > > -config LOONGSON2_APB_DMA
> > > > -       tristate "Loongson2 APB DMA support"
> > > > -       depends on LOONGARCH || COMPILE_TEST
> > > > -       select DMA_ENGINE
> > > > -       select DMA_VIRTUAL_CHANNELS
> > > > -       help
> > > > -         Support for the Loongson2 APB DMA controller driver. The
> > > > -         DMA controller is having single DMA channel which can be
> > > > -         configured for different peripherals like audio, nand, sd=
io
> > > > -         etc which is in APB bus.
> > > > -
> > > > -         This DMA controller transfers data from memory to periphe=
ral fifo.
> > > > -         It does not support memory to memory data transfer.
> > > > -
> > > >  config LPC18XX_DMAMUX
> > > >         bool "NXP LPC18xx/43xx DMA MUX for PL080"
> > > >         depends on ARCH_LPC18XX || COMPILE_TEST
> > > > @@ -774,6 +751,8 @@ source "drivers/dma/fsl-dpaa2-qdma/Kconfig"
> > > >
> > > >  source "drivers/dma/lgm/Kconfig"
> > > >
> > > > +source "drivers/dma/loongson/Kconfig"
> > > > +
> > > >  source "drivers/dma/stm32/Kconfig"
> > > >
> > > >  # clients
> > > > diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> > > > index a54d7688392b..a1c73415b79f 100644
> > > > --- a/drivers/dma/Makefile
> > > > +++ b/drivers/dma/Makefile
> > > > @@ -49,8 +49,6 @@ obj-$(CONFIG_INTEL_IDMA64) +=3D idma64.o
> > > >  obj-$(CONFIG_INTEL_IOATDMA) +=3D ioat/
> > > >  obj-y +=3D idxd/
> > > >  obj-$(CONFIG_K3_DMA) +=3D k3dma.o
> > > > -obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > > > -obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> > > >  obj-$(CONFIG_LPC18XX_DMAMUX) +=3D lpc18xx-dmamux.o
> > > >  obj-$(CONFIG_LPC32XX_DMAMUX) +=3D lpc32xx-dmamux.o
> > > >  obj-$(CONFIG_MILBEAUT_HDMAC) +=3D milbeaut-hdmac.o
> > > > @@ -88,6 +86,7 @@ obj-$(CONFIG_INTEL_LDMA) +=3D lgm/
> > > >
> > > >  obj-y +=3D amd/
> > > >  obj-y +=3D mediatek/
> > > > +obj-y +=3D loongson/
> > > >  obj-y +=3D qcom/
> > > >  obj-y +=3D stm32/
> > > >  obj-y +=3D ti/
> > > > diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kc=
onfig
> > > > new file mode 100644
> > > > index 000000000000..9dbdaef5a59f
> > > > --- /dev/null
> > > > +++ b/drivers/dma/loongson/Kconfig
> > > > @@ -0,0 +1,28 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +#
> > > > +# Loongson DMA controllers drivers
> > > > +#
> > > > +if MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
> > > > +
> > > > +config LOONGSON1_APB_DMA
> > > > +       tristate "Loongson1 APB DMA support"
> > > > +       select DMA_ENGINE
> > > > +       select DMA_VIRTUAL_CHANNELS
> > > > +       help
> > > > +         This selects support for the APB DMA controller in Loongs=
on1 SoCs,
> > > > +         which is required by Loongson1 NAND and audio support.
> > > > +
> > > > +config LOONGSON2_APB_DMA
> > > > +       tristate "Loongson2 APB DMA support"
> > > > +       select DMA_ENGINE
> > > > +       select DMA_VIRTUAL_CHANNELS
> > > > +       help
> > > > +         Support for the Loongson2 APB DMA controller driver. The
> > > > +         DMA controller is having single DMA channel which can be
> > > > +         configured for different peripherals like audio, nand, sd=
io
> > > > +         etc which is in APB bus.
> > > > +
> > > > +         This DMA controller transfers data from memory to periphe=
ral fifo.
> > > > +         It does not support memory to memory data transfer.
> > > > +
> > > > +endif
> > > > diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/M=
akefile
> > > > new file mode 100644
> > > > index 000000000000..6cdd08065e92
> > > > --- /dev/null
> > > > +++ b/drivers/dma/loongson/Makefile
> > > > @@ -0,0 +1,3 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> > > > +obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> > > > diff --git a/drivers/dma/loongson1-apb-dma.c b/drivers/dma/loongson=
/loongson1-apb-dma.c
> > > > similarity index 99%
> > > > rename from drivers/dma/loongson1-apb-dma.c
> > > > rename to drivers/dma/loongson/loongson1-apb-dma.c
> > > > index 255fe7eca212..e99247cf90c1 100644
> > > > --- a/drivers/dma/loongson1-apb-dma.c
> > > > +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> > > > @@ -16,8 +16,8 @@
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/slab.h>
> > > >
> > > > -#include "dmaengine.h"
> > > > -#include "virt-dma.h"
> > > > +#include "../dmaengine.h"
> > > > +#include "../virt-dma.h"
> > > >
> > > >  /* Loongson-1 DMA Control Register */
> > > >  #define LS1X_DMA_CTRL          0x0
> > > > diff --git a/drivers/dma/loongson2-apb-dma.c b/drivers/dma/loongson=
/loongson2-apb-dma.c
> > > > similarity index 99%
> > > > rename from drivers/dma/loongson2-apb-dma.c
> > > > rename to drivers/dma/loongson/loongson2-apb-dma.c
> > > > index c528f02b9f84..0cb607595d04 100644
> > > > --- a/drivers/dma/loongson2-apb-dma.c
> > > > +++ b/drivers/dma/loongson/loongson2-apb-dma.c
> > > > @@ -17,8 +17,8 @@
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/slab.h>
> > > >
> > > > -#include "dmaengine.h"
> > > > -#include "virt-dma.h"
> > > > +#include "../dmaengine.h"
> > > > +#include "../virt-dma.h"
> > > >
> > > >  /* Global Configuration Register */
> > > >  #define LDMA_ORDER_ERG         0x0
> > > > --
> > > > 2.47.3
> > > >
> > >
> > >
> > > --
> > > Best regards,
> > >
> > > Keguang Zhang
> >
> > --
> > Thanks.
> > Binbin
>
>
>
> --
> Best regards,
>
> Keguang Zhang

--=20
Thanks.
Binbin
