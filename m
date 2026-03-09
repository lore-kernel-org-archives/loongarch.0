Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3042D2495
	for <loongarch@lists.linux.dev>; Mon,  9 Mar 2026 05:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773032798; cv=pass; b=C6t0RfHgmCQXy0M0nrGAVFRRZk9Da1tAbMK3LmAnEGVLXRE9WwR9apuqW502iCVD12divy/oGK7AHUZts1RxA7z+JtkB8ppBlyX1YQYbe64ak1quqHVN82NJL8NgGHv83DkBIeZS5UcjyK6/kTuqfTN4qNRTUiwAe6eWATv45xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773032798; c=relaxed/simple;
	bh=GIMVmStjtbmmcCRCeCm9myZpzjRNN8wQyjoVN50bJm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KK3wypa9DSLpWXD38sDoDsbbCYC0AGkazS7B6/VwNZhySVAYycVe9S9xMtQOFGiTy/X6oUdhTDrM2nKMzBqNX0IqPVCs+5jU8k6WJN0NyrPHKskhSGQo9o8onar1eirdruTBVEq2FnxyTYl/98mmS5vbbJcLic1RB5vVpuZfueQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu6K+W79; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu6K+W79"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a1362c9a3cso3433796e87.2
        for <loongarch@lists.linux.dev>; Sun, 08 Mar 2026 22:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773032795; cv=none;
        d=google.com; s=arc-20240605;
        b=HBBf7SO8vS0Ay6QxzCNo49Bz+RzB6QTHvKRXE0DFtow5WaAQ2p6f77/XOJiEXaUhxQ
         4FeECz8u1BJuCErs+P9R2206dGEVGioc67k1TTRkI9VcvnkJUmGAi2bDCx4rul+GuZlA
         4NGZe5NcHkOTXAdRVmmnU1GlQsBQHVUR4PqeFIYzHYOmaCtHEDx0fouuNMVRtIYUBs/7
         I01keitpnAww5gAASXJ4v6VRqAt1SiO0skZoBXreOUeD8CMuyUkk8MubMMuNP/yG2hmP
         /yhw3UfC/nbV8/kGEIEPvQWOSsoUKwRPhfo3Jr85+2pspi76zBoy/7LY/recvt/jPKYg
         X1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xRboZoSgRCmPY0VANyUKksmp/XjUE2Df8hgoiGF3Klk=;
        fh=OTIwp9c/azbYpQ3H2FULVwKQbNirkXMBP7vcBUzkigQ=;
        b=MSP9kzDlx+UWglDg71T0e4cQ9JoSYhAvOx+nnx762FlpIsi8BbTXvBHeK8tgub1jrd
         VGbNO2IxRlsmZCk3NAkiycHVL5Y7XtkVMFXDOp4/h7oc0wXKrsS23WLz4viF9DV0j4Xb
         T2Bvh8b7NxrdsdlDnfvBS6gy2JZsmBKTtN4kPX4n4a7kA6P1gwHvwBczpd6dklsAETDd
         2ADW3KSxdm48NxKdU7EZvvLKNdhHAigI+niRbFyVcKBRCabqzaVodm/D4Dzr9R6tkT3X
         IP7xZvYvL6RDor4cEbrLvyViW89ng9xHGA2JrI61B3a+nLM1U4oOQlMIhszCoQYs5tZq
         ONbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773032795; x=1773637595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRboZoSgRCmPY0VANyUKksmp/XjUE2Df8hgoiGF3Klk=;
        b=Cu6K+W7907g31bjRQ+s0NI0qI38QJvK8PxMc5c/TncDvbrWyZMnTVaeOLRjO0X/pku
         bsj2lJu9XkmXd5UlRsrPmZOtC2uU7i8eAp54JtqBvCIhVNwF2kKfPKob1ixygf1Ai1e2
         dugXAW6+M6wTYboRYKVHNLm2D5rGg5xO+rcm4/i+eo9v7BBDF2FyLSx6AK3+TOZx4Sac
         CDBLsCAQ2Lx+LoMcKAaWkCc9WyPZCOYaDN9pEhHmBtGw5BTXgQ3tmg55TO/kfjc+v+U3
         Ria7xxKT/DqaMeuju7y1wLq+u8jxJMt7TWxtZz8pMn4ILyaOC/agpkAXqUhhfDuZ2BIn
         8DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773032795; x=1773637595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xRboZoSgRCmPY0VANyUKksmp/XjUE2Df8hgoiGF3Klk=;
        b=GAjV31RLE+WgmXQzRx0P1P66/f1pjGVlvG04UruG00I8Aw3Z1+oKf00CmBNtwx614N
         1NCkuIpuGMzQa9grZrQ5QCefcV/jXxlPi+E0vNV79bd41O9g4HyxT0CPvo2DXgge58hp
         qgdpMJ3dUcgDpwWS7hR5abFbJQi29kGdAJYfJcGyMI4bf/ji0FLYrjnpy5S/lICTmUze
         /X0AornmAIHLRYuKQy+kIBTAnH819EcvG0M6ln6NVTqydxuBuwjrbhghwDmcXMmtw5IK
         Ik2/G8Mja1B2WMaZBLb8MtFHAhReFS1++zfmNXHirr7hd6gxsYZyuZAcny+a4/ci4UNw
         Bd7g==
X-Forwarded-Encrypted: i=1; AJvYcCV+MnXzLV5lsYt3rjYuCRpz+wZ6CpsmPZviWADl/QdCoGCeQxPWs9FD4ggNsyI6ennqID05zQLCyUk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKX1vYqFQ8gcNxdkkL3EIvuCMzqpfmvQrmNksbU1YsqkxeyxNx
	UoBokv1sJHkhy8XPANnjVFBdT/4YYa+9a4awvOBJGxl137/TEK8R40d6OmAGpdKaKsZAIe0MOdk
	JC194RGGvy35OWojYnjB/lKrS8SF4MWM=
X-Gm-Gg: ATEYQzxAvG86Z7qri935gweMVl5rjhU/cpfBMUTqW/JSOyc9vH2beeVty6PU7e1+QUi
	Hyr++llhlSME9eqrPYYiWeS5gbByyrMF4m8OmTZjfdTVvHv56gfIf19utATgvTMUgIuSr8emJ6s
	TBrgDH0ODfMx7tskPUgiVu/lYOLTVKRXHoa+NJxGUOLTux2j0LybZpE64PbyGeo4C4GIjqrv3Fw
	7A8+hQ8sdQMu7SyG15F6xpOYzjodCe28ASWd8KXI/SJlGKDm0CkBK+5MXT7sveH2/kMI4D/KZME
	7ADyU1lpiqlUVgEVxhXmXH8+WeiL9LewA9KQ0KwLlSOrWA47phnERqtExdQ16DbBOKbq9Rbb0qJ
	zS98i
X-Received: by 2002:ac2:5bc4:0:b0:5a1:34a3:757f with SMTP id
 2adb3069b0e04-5a13ccf2956mr2349267e87.25.1773032794332; Sun, 08 Mar 2026
 22:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1772853681.git.zhoubinbin@loongson.cn> <0a0853a85630724741061f6fe08680610e49a06e.1772853681.git.zhoubinbin@loongson.cn>
In-Reply-To: <0a0853a85630724741061f6fe08680610e49a06e.1772853681.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 9 Mar 2026 13:05:57 +0800
X-Gm-Features: AaiRm51GSn_HaYCy7NTYWTwsmJ10yQbxHNd2i-pSCRpSalZ_FyuzjKsqLsqZXP4
Message-ID: <CAJhJPsWB8ma0Lfu=h=LZw2RkWX2wTV-S5q0BzJ0XLFdsgkfM8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dmaengine: loongson: New directory for Loongson
 DMA controllers drivers
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>

On Sat, Mar 7, 2026 at 11:25=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Gather the Loongson DMA controllers under drivers/dma/loongson/
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  MAINTAINERS                                   |  3 +-
>  drivers/dma/Kconfig                           | 25 ++--------------
>  drivers/dma/Makefile                          |  3 +-
>  drivers/dma/loongson/Kconfig                  | 30 +++++++++++++++++++
>  drivers/dma/loongson/Makefile                 |  3 ++
>  .../dma/{ =3D> loongson}/loongson1-apb-dma.c    |  4 +--
>  .../dma/{ =3D> loongson}/loongson2-apb-dma.c    |  4 +--
>  7 files changed, 42 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/dma/loongson/Kconfig
>  create mode 100644 drivers/dma/loongson/Makefile
>  rename drivers/dma/{ =3D> loongson}/loongson1-apb-dma.c (99%)
>  rename drivers/dma/{ =3D> loongson}/loongson2-apb-dma.c (99%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..e8cd1e2dac13 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14953,7 +14953,7 @@ M:      Binbin Zhou <zhoubinbin@loongson.cn>
>  L:     dmaengine@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> -F:     drivers/dma/loongson2-apb-dma.c
> +F:     drivers/dma/loongson/loongson2-apb-dma.c
>
>  LOONGSON LS2X I2C DRIVER
>  M:     Binbin Zhou <zhoubinbin@loongson.cn>
> @@ -17721,6 +17721,7 @@ F:      arch/mips/boot/dts/loongson/loongson1*
>  F:     arch/mips/configs/loongson1_defconfig
>  F:     arch/mips/loongson32/
>  F:     drivers/*/*loongson1*
> +F:     drivers/dma/loongson/loongson1-apb-dma.c
>  F:     drivers/mtd/nand/raw/loongson-nand-controller.c
>  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
>  F:     sound/soc/loongson/loongson1_ac97.c
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
> index a54d7688392b..963b10494ee5 100644
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
> @@ -87,6 +85,7 @@ obj-$(CONFIG_FSL_DPAA2_QDMA) +=3D fsl-dpaa2-qdma/
>  obj-$(CONFIG_INTEL_LDMA) +=3D lgm/
>
>  obj-y +=3D amd/
> +obj-y +=3D loongson/
>  obj-y +=3D mediatek/
>  obj-y +=3D qcom/
>  obj-y +=3D stm32/
> diff --git a/drivers/dma/loongson/Kconfig b/drivers/dma/loongson/Kconfig
> new file mode 100644
> index 000000000000..0a865a8fd3a6
> --- /dev/null
> +++ b/drivers/dma/loongson/Kconfig
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Loongson DMA controllers drivers
> +#
> +if MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
> +
> +config LOONGSON1_APB_DMA
> +       tristate "Loongson1 APB DMA support"
> +       depends on MACH_LOONGSON32 || COMPILE_TEST
> +       select DMA_ENGINE
> +       select DMA_VIRTUAL_CHANNELS
> +       help
> +         This selects support for the APB DMA controller in Loongson1 So=
Cs,
> +         which is required by Loongson1 NAND and audio support.
> +
> +config LOONGSON2_APB_DMA
> +       tristate "Loongson2 APB DMA support"
> +       depends on MACH_LOONGSON64 || COMPILE_TEST
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
> index 2e347aba9af8..89786cbd20ab 100644
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
> index b981475e6779..fc7d9f4a96ec 100644
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
> 2.52.0
>


--=20
Best regards,

Keguang Zhang
