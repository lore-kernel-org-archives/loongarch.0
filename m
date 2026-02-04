Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0753594F
	for <loongarch@lists.linux.dev>; Wed,  4 Feb 2026 05:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770183800; cv=pass; b=g2YAUGK7+yk8s6rG5kma1FSQJf0RdKnzoGw/A1nqZ2q9XLTjWKtJoKro3XgYrff+unSS0lsJw83NyHa+3UcNVZaT9bxceEpkPgPMYgKsmnDXwy1SB86tRk/uahyflcojnxPe7rO9ljSU4AsahdibuCp+pXxTFeMeYIBe0gW1Inc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770183800; c=relaxed/simple;
	bh=zPFVPmCmcOcYnQuEuH9JJtyahErTF7xD+xn4hX31KSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUjISmAfq427g+AT70lU2EaXYdy5FFv0CnOWG8163YvgUHWWg1SojyjaQg8Z+W8L/03dG4Y7HmC1oyK/MMskezK9LMDF7WwfYuMnmClVyaW2LxX+y+70135m5MOfM5HRThyzCChC51ImJcJN669dIpobcgENlAr2CF8FTLtdQ2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPolAu4D; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPolAu4D"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59de66fdb53so6050658e87.2
        for <loongarch@lists.linux.dev>; Tue, 03 Feb 2026 21:43:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770183798; cv=none;
        d=google.com; s=arc-20240605;
        b=WBbbBG6N5RsYYN3BUTOLCDiS9I+/shQQGZEfkAdUF5MuMCD+7y1Jmk8DZIKHib5UyF
         0DYCL04oELJSWrjkzh4nsr45oqm+bR7UYaIb2vne/XeXTe/BQQCyRPYheNxGDzvGZicI
         qSi8F9declJrGKaPVKZvYCB4OKHWLxTtGcjtIUNjJ8f4eCj57A3nLK24+I+Om4ySKgiI
         ixWjyl0Zr8RDx4AcwuBzUboTAaJaMcFuiPKX9+E5MaYvBEIZCecNsHPhIa3GA4ljbWzc
         KGFQXmUdPxFE6xH/ofrfFz9c14dkXT1wMmaQvzfx+fl8EfPNrLrYMa0kaKVbLE9ftTDq
         RWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QSJi97R9hFG0MQsbDlpL5CHjh0FH6IDEFC8BDQFDq64=;
        fh=CKVE7DPigyekYwO1RoT0SyMH+47zwSMmtskT2bwSqBg=;
        b=ewlyJQV1RpPDG4Yx3Sr90zn06HZkAMnkYookx4kuR5fsZZHgVZBKHhWlxz7cWYCA4W
         RNDBY2eI8qIhiECJgekV6hEMwQGXfGVUqSZ0ywONWQJBtcQFiCZcp/acf5mQG8Kw2fKo
         Uw1gfIkX4LCn+lgbJ/ykcgrsnaBpruBz8M3bbr7R76nMDnPptuuhw7/XAzRTPlZb9QcY
         sqVRqrKscNt+Pqbumtfg7OKgAd6d5OLZw+kUBwbuOscOkywPY+BG4mhyX0TdB7TDyGXo
         KXmwIwopU5eXrJZJmFOHv9DIPgFwmg3xMZ0lVpxEbXMmHr7LT+hgdk6hgrm1k3NiyTGc
         sakw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770183798; x=1770788598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSJi97R9hFG0MQsbDlpL5CHjh0FH6IDEFC8BDQFDq64=;
        b=RPolAu4DSdhMVcFfl9c9ETll9Cva1X6XQrLnRjPvdlwls9KuwAgT0XioPfdWPGBhac
         gH/ty6rm50s/wIjbKgftnBF0A/4TYLaJ44NImMZVlUKfzGWBXo4JufkzfV7S4l5XRYEe
         I7/u6juYpFW+h7xFz8OhHr5fw00bgZnjfCDZ67aT63AifZ64TKWJ8VmZBz4+s5vYh2Sq
         TgH1KK06TIpegPIrQT/n0TgZnu69i/mE+hJ6lOD0W9K2Q/4G/YTLWXdQYDowa5cceOO9
         WcTS7kUO7TAWvzWVbaHsrL/mFTE9SNRqLjlNVxL5obXS04mq4JgS0MEhQmCFcUaHlbSi
         Q3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770183798; x=1770788598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QSJi97R9hFG0MQsbDlpL5CHjh0FH6IDEFC8BDQFDq64=;
        b=XTu16vLoZWRcPV6qpFa1v6eEW/Q5DRXrDlY8Dcsn0RG0xwaPUIBdSs5CTZxXP3UALK
         j6jXTUWADETX/j1PZLjeOYgBhaT5mR5P6hQ6G28fULy2B0674b19T6wFCC4pKA+nTLBi
         WvlWMFpmP0uqppOO/5hZjw/5szinvx8BhIZszIbvpfWU5FcVcvLb3PgZ7PI9BYmkcGdP
         yXhB30EALjdIMQexTig+EiZNDgvUfe2rbpUIBybUyRHcKGYs06hstSkbcH9WYWVy0PFk
         lhMF16K7G2z7m+c3oqcwkB+q3+GlrHAy1j7syxNtTk3dUxgxlyBWKDPFmAa3Nr2uS4MR
         Pm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTMOh9bC4zTtvpM3HiQB2WJYJDenaAdF53lVGgEVTZ7u+7TPFC5ND/N7ffuxccIYDqV0YyFZ/V1eo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwSAvco3D7qhCh02uV/xQL+au5P5HbejAPwk93OUOcm2Naebw1
	yI8aBT75wuCvMgGuytw4tv55YfuwwQ2QPlDZpG0XjUKvogD/VG24HMTPt6qWLUqm6DIfpSnK0EQ
	+oqZS86WxLHD6EqZYBDxy1Ihs9BVBCQ0=
X-Gm-Gg: AZuq6aIOOnD/dcw6PseuFCvGVcBrXjRyhQB2LpDfvHzMSJ7FO8Hgs4mOXg0voqwyYQQ
	aCdMDET1OFfqwxuseiaROAg/y3IEmSPVCInvX3roIH6N7xcLlBjWsMHQvvln6WnMd7e+o6sG4ML
	dBr2uw2UMHHWH0beMnRCxysP9BDeKnih7qVqDpnjBY2LmZ7bN6aivguWNUfVhKYerjmVnsWCBRg
	FqS3gWbGxRSSwNLXAHm4jz0DGoop0OuAtfLX6A9/Aw8Pnxy/KxSqmyfe5nrkyIEWnJ/ktb9WszO
	nL2rVXg52hTpeTCICM4JR8M7Awv/49gTKwOWqSNAKVaJZXpwuwaYU12o3P9eimyWZosr
X-Received: by 2002:a05:6512:340c:b0:59d:d551:8856 with SMTP id
 2adb3069b0e04-59e38c59155mr593281e87.48.1770183797626; Tue, 03 Feb 2026
 21:43:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1770119693.git.zhoubinbin@loongson.cn> <d7a73d1fe8a3e4e57055a15a6ec03170f0d8ca21.1770119693.git.zhoubinbin@loongson.cn>
In-Reply-To: <d7a73d1fe8a3e4e57055a15a6ec03170f0d8ca21.1770119693.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Wed, 4 Feb 2026 13:42:40 +0800
X-Gm-Features: AZwV_QhF-LvUnGZh1miRttDH8iCfO0e5TXYSBWWevas_BXwAX93FSFlLbvMfixs
Message-ID: <CAJhJPsVRZe_E6FsNBUa6K=GmPp3FXRrOH=yguvTY=K1cGwa62Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dmaengine: loongson: New directory for Loongson DMA
 controllers drivers
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 8:30=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Gather the Loongson DMA controllers under drivers/dma/loongson/
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  MAINTAINERS                                   |  2 +-
>  drivers/dma/Kconfig                           | 25 ++---------------
>  drivers/dma/Makefile                          |  3 +-
>  drivers/dma/loongson/Kconfig                  | 28 +++++++++++++++++++
>  drivers/dma/loongson/Makefile                 |  3 ++
>  .../dma/{ =3D> loongson}/loongson1-apb-dma.c    |  4 +--
>  .../dma/{ =3D> loongson}/loongson2-apb-dma.c    |  4 +--
>  7 files changed, 39 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/dma/loongson/Kconfig
>  create mode 100644 drivers/dma/loongson/Makefile
>  rename drivers/dma/{ =3D> loongson}/loongson1-apb-dma.c (99%)

The file loongson1-apb-dma.c was moved to drivers/dma/loongson/,
but the MAINTAINERS entry still refers to the old path.

>  rename drivers/dma/{ =3D> loongson}/loongson2-apb-dma.c (99%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..66807104af63 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14776,7 +14776,7 @@ M:      Binbin Zhou <zhoubinbin@loongson.cn>
>  L:     dmaengine@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> -F:     drivers/dma/loongson2-apb-dma.c
> +F:     drivers/dma/loongson/loongson2-apb-dma.c
>
>  LOONGSON LS2X I2C DRIVER
>  M:     Binbin Zhou <zhoubinbin@loongson.cn>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 66cda7cc9f7a..1b84c5b11654 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -376,29 +376,6 @@ config K3_DMA
>           Support the DMA engine for Hisilicon K3 platform
>           devices.
>
> -config LOONGSON1_APB_DMA
> -       tristate "Loongson1 APB DMA support"
> -       depends on MACH_LOONGSON32 || COMPILE_TEST
> -       select DMA_ENGINE
> -       select DMA_VIRTUAL_CHANNELS
> -       help
> -         This selects support for the APB DMA controller in Loongson1 So=
Cs,
> -         which is required by Loongson1 NAND and audio support.
> -
> -config LOONGSON2_APB_DMA
> -       tristate "Loongson2 APB DMA support"
> -       depends on LOONGARCH || COMPILE_TEST
> -       select DMA_ENGINE
> -       select DMA_VIRTUAL_CHANNELS
> -       help
> -         Support for the Loongson2 APB DMA controller driver. The
> -         DMA controller is having single DMA channel which can be
> -         configured for different peripherals like audio, nand, sdio
> -         etc which is in APB bus.
> -
> -         This DMA controller transfers data from memory to peripheral fi=
fo.
> -         It does not support memory to memory data transfer.
> -
>  config LPC18XX_DMAMUX
>         bool "NXP LPC18xx/43xx DMA MUX for PL080"
>         depends on ARCH_LPC18XX || COMPILE_TEST
> @@ -774,6 +751,8 @@ source "drivers/dma/fsl-dpaa2-qdma/Kconfig"
>
>  source "drivers/dma/lgm/Kconfig"
>
> +source "drivers/dma/loongson/Kconfig"
> +
>  source "drivers/dma/stm32/Kconfig"
>
>  # clients
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index a54d7688392b..a1c73415b79f 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -49,8 +49,6 @@ obj-$(CONFIG_INTEL_IDMA64) +=3D idma64.o
>  obj-$(CONFIG_INTEL_IOATDMA) +=3D ioat/
>  obj-y +=3D idxd/
>  obj-$(CONFIG_K3_DMA) +=3D k3dma.o
> -obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> -obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
>  obj-$(CONFIG_LPC18XX_DMAMUX) +=3D lpc18xx-dmamux.o
>  obj-$(CONFIG_LPC32XX_DMAMUX) +=3D lpc32xx-dmamux.o
>  obj-$(CONFIG_MILBEAUT_HDMAC) +=3D milbeaut-hdmac.o
> @@ -88,6 +86,7 @@ obj-$(CONFIG_INTEL_LDMA) +=3D lgm/
>
>  obj-y +=3D amd/
>  obj-y +=3D mediatek/
> +obj-y +=3D loongson/
>  obj-y +=3D qcom/
>  obj-y +=3D stm32/
>  obj-y +=3D ti/
> diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kconfig
> new file mode 100644
> index 000000000000..9dbdaef5a59f
> --- /dev/null
> +++ b/drivers/dma/loongson/Kconfig
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Loongson DMA controllers drivers
> +#
> +if MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
> +
> +config LOONGSON1_APB_DMA
> +       tristate "Loongson1 APB DMA support"
> +       select DMA_ENGINE
> +       select DMA_VIRTUAL_CHANNELS
> +       help
> +         This selects support for the APB DMA controller in Loongson1 So=
Cs,
> +         which is required by Loongson1 NAND and audio support.
> +
> +config LOONGSON2_APB_DMA
> +       tristate "Loongson2 APB DMA support"
> +       select DMA_ENGINE
> +       select DMA_VIRTUAL_CHANNELS
> +       help
> +         Support for the Loongson2 APB DMA controller driver. The
> +         DMA controller is having single DMA channel which can be
> +         configured for different peripherals like audio, nand, sdio
> +         etc which is in APB bus.
> +
> +         This DMA controller transfers data from memory to peripheral fi=
fo.
> +         It does not support memory to memory data transfer.
> +
> +endif
> diff --git a/drivers/dma/loongson/Makefile b/drivers/dma/loongson/Makefil=
e
> new file mode 100644
> index 000000000000..6cdd08065e92
> --- /dev/null
> +++ b/drivers/dma/loongson/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_LOONGSON1_APB_DMA) +=3D loongson1-apb-dma.o
> +obj-$(CONFIG_LOONGSON2_APB_DMA) +=3D loongson2-apb-dma.o
> diff --git a/drivers/dma/loongson1-apb-dma.c b/drivers/dma/loongson/loong=
son1-apb-dma.c
> similarity index 99%
> rename from drivers/dma/loongson1-apb-dma.c
> rename to drivers/dma/loongson/loongson1-apb-dma.c
> index 255fe7eca212..e99247cf90c1 100644
> --- a/drivers/dma/loongson1-apb-dma.c
> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> @@ -16,8 +16,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#include "dmaengine.h"
> -#include "virt-dma.h"
> +#include "../dmaengine.h"
> +#include "../virt-dma.h"
>
>  /* Loongson-1 DMA Control Register */
>  #define LS1X_DMA_CTRL          0x0
> diff --git a/drivers/dma/loongson2-apb-dma.c b/drivers/dma/loongson/loong=
son2-apb-dma.c
> similarity index 99%
> rename from drivers/dma/loongson2-apb-dma.c
> rename to drivers/dma/loongson/loongson2-apb-dma.c
> index c528f02b9f84..0cb607595d04 100644
> --- a/drivers/dma/loongson2-apb-dma.c
> +++ b/drivers/dma/loongson/loongson2-apb-dma.c
> @@ -17,8 +17,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#include "dmaengine.h"
> -#include "virt-dma.h"
> +#include "../dmaengine.h"
> +#include "../virt-dma.h"
>
>  /* Global Configuration Register */
>  #define LDMA_ORDER_ERG         0x0
> --
> 2.47.3
>


--=20
Best regards,

Keguang Zhang
