Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353881110
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E492FC433C1
	for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666785852;
	bh=6LTuX/xQ6IMZD8m/CLE4a7GdIxVNvlWbr19szbGf1QI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s23nwGGiewFyEyzyfF9brla42Ei7tYB7OYegWuBHgiaJpUFoL89nBfX+XDw/C6bVt
	 OsgGZo4LqmPjw1iFkEVjWW4kFfzvXRFURp89+xNUzTxgReRBasOIcSGGZAAnltaJeq
	 3BgEuR5a5BrriacgPN53y9CtSc0S1Gdtm2nw/BhXtWa3GqojU8haFSSE5UEf1be6U8
	 vTBvMSTwTPNeP9YUNhyg1DJ4ASMDu4Y7VZ36cAu9bdsysZdMpk72YLRnTjGaKvMbxX
	 T407Yfsac24tzpGDV2Zt51Z1IM5WVK8ly3/13oChjHtKS1Jva+1WRCkE3IiLq50rI5
	 jJ/3X5mRUxD2Q==
Received: by mail-ej1-f46.google.com with SMTP id sc25so20505476ejc.12
        for <loongarch@lists.linux.dev>; Wed, 26 Oct 2022 05:04:12 -0700 (PDT)
X-Gm-Message-State: ACrzQf1FabnhuisVEyHqMLgifIo70/+flk8cjhyVG48dNjbu5TDpKzxq
	TPTDxJIyXP206S8J9ThFOMV03G+eT6FPt0I0YQE=
X-Google-Smtp-Source: AMsMyM6b4UIXWLoTsQpMjRB4UKQywbOMmW91BTJZlw7mq+lzs5nHy5Q4XTZdyDvnaIupM/uAgrsH5IkA6cfbPB+q4JI=
X-Received: by 2002:a17:907:2cf7:b0:78d:c7fc:29ff with SMTP id
 hz23-20020a1709072cf700b0078dc7fc29ffmr38046370ejc.748.1666785851109; Wed, 26
 Oct 2022 05:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221026030256.30512-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221026030256.30512-1-zhuyinbo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Oct 2022 20:03:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7jSMei+EDJ_vhoBh-kX-MVxs-vtwQwjsDnrx_zCSFAAw@mail.gmail.com>
Message-ID: <CAAhV-H7jSMei+EDJ_vhoBh-kX-MVxs-vtwQwjsDnrx_zCSFAAw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: add loongson2 clock include file
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Yinbo,

On Wed, Oct 26, 2022 at 11:03 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>
> This file defines all loongson2 soc clock indexes, it should be
I suggest to use regular names, i.e., don't use loongson2, Loongson2
or LOONGSON2, use Loongson-2 instead. (except in C code). And soc may
be SoC?

Huacai

> included in the device tree in which there's device using the
> clocks.
>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS                                   |  6 ++++
>  include/dt-bindings/clock/loongson,ls2k-clk.h | 29 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 include/dt-bindings/clock/loongson,ls2k-clk.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0be0f520c032..b6aae412de9c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11907,6 +11907,12 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
>  F:     drivers/thermal/loongson2_thermal.c
>
> +LOONGSON2 SOC SERIES CLOCK DRIVER
> +M:     Yinbo Zhu <zhuyinbo@loongson.cn>
> +L:     linux-clk@vger.kernel.org
> +S:     Maintained
> +F:     include/dt-bindings/clock/loongson,ls2k-clk.h
> +
>  LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
>  M:     Sathya Prakash <sathya.prakash@broadcom.com>
>  M:     Sreekanth Reddy <sreekanth.reddy@broadcom.com>
> diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-bindings/clock/loongson,ls2k-clk.h
> new file mode 100644
> index 000000000000..db1e27e792ff
> --- /dev/null
> +++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Author: Yinbo Zhu <zhuyinbo@loongson.cn>
> + * Copyright (C) 2022-2023 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_LOONGSON2_H
> +#define __DT_BINDINGS_CLOCK_LOONGSON2_H
> +
> +#define LOONGSON2_REF_100M                             0
> +#define LOONGSON2_NODE_PLL                             1
> +#define LOONGSON2_DDR_PLL                              2
> +#define LOONGSON2_DC_PLL                               3
> +#define LOONGSON2_PIX0_PLL                             4
> +#define LOONGSON2_PIX1_PLL                             5
> +#define LOONGSON2_NODE_CLK                             6
> +#define LOONGSON2_HDA_CLK                              7
> +#define LOONGSON2_GPU_CLK                              8
> +#define LOONGSON2_DDR_CLK                              9
> +#define LOONGSON2_GMAC_CLK                             10
> +#define LOONGSON2_DC_CLK                               11
> +#define LOONGSON2_APB_CLK                              12
> +#define LOONGSON2_USB_CLK                              13
> +#define LOONGSON2_SATA_CLK                             14
> +#define LOONGSON2_PIX0_CLK                             15
> +#define LOONGSON2_PIX1_CLK                             16
> +#define LOONGSON2_CLK_END                              17
> +
> +#endif
> --
> 2.31.1
>
>
