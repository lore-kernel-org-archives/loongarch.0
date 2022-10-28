Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE0C23A3
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 11:42:33 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id i10so3049518qkl.12
        for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 04:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4nl/yqB7JCdClSGpG/ZOGD2vqHnwuwrCcASM1BkB0c=;
        b=a57mpQWbEEJOhp9YUTYfDTMzoO4ot3lAYdhjhKi+bBYvrmTBoU4El50dearP5eiKdX
         mbSvm8xbnaYmu509n+YAZOBPvRJ9Oq+2Jp7EtXpzMeFhYvA2Ri8rwuFyVyG2jHJp2g3w
         NwPymRHgpOKde85D2mQh8oHtPI1H9+9AGG+5dXxMQahBKu8OiJ+m0pJItXKfpi8U26KW
         auxF7A44kEcA6F0/LZvJAmLaZyOkHxNRd/+bf8GOwEHDBVwC/Ktbi9jUb9xUF3wMFHpY
         xSshQnZhdD4PDKpdV7wv6G2/AEj4E2l5A7I65tIHZ4pJNHvMH5/Ui0Wm64aMtsbP5V+w
         N/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4nl/yqB7JCdClSGpG/ZOGD2vqHnwuwrCcASM1BkB0c=;
        b=Ya8MiIXHkXnpWiIE2fLtTTfjQlrd3A28PkOigZUIoa7iHLaBWRBV+guTRwyOVQvNgZ
         SNzOyOpfxrCXS1D1ddvsDonbFFab3wbcyWhFW07TvS1natkIuWe1bR/0KpuYFiuPQ8Gv
         42mJ1Hf2ehOh0dUeXbUlQvcttaFhZ4QiEIPgEIkZQJTpgkpp8WBUa4liWVqLwYYv0PJe
         DK8BrgNg+wAWDoxkavmCx4XS97rYaN1PVQpZf2F3+ZsF3NqiKgCfkRoV2IkeHI8yq3Cn
         0OOPMs6QpEu9vvuV3XjIG29Y6QR91WCFeazZ0CbSAqXoSsMKfe8f0vxCzcRROxEt/59a
         Askg==
X-Gm-Message-State: ACrzQf1B1lzd6Ms+N+j5CwVVmIJn4zc2gSDfNZBX84wZCNf9oqdbVDXE
	4DlvNUJMdMT0Oo7svyKM9Ht/tQ==
X-Google-Smtp-Source: AMsMyM4sd0CoRJgxFJv2RpxVf3ohbMa+KmVGqtd5yUL9dA2lUFymsH4viwvhEtZpnzQ60EpapBBYHg==
X-Received: by 2002:a05:620a:22c3:b0:6ec:53bb:d296 with SMTP id o3-20020a05620a22c300b006ec53bbd296mr38031213qki.158.1666957352120;
        Fri, 28 Oct 2022 04:42:32 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bl7-20020a05620a1a8700b006b5cc25535fsm2719103qkb.99.2022.10.28.04.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:42:31 -0700 (PDT)
Message-ID: <b63f7fde-4e51-00c5-b060-335e54f73f46@linaro.org>
Date: Fri, 28 Oct 2022 07:42:28 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v6 2/3] clk: clk-loongson2: add clock controller driver
 support
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yang Li <yang.lee@linux.alibaba.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221028061922.19045-1-zhuyinbo@loongson.cn>
 <20221028061922.19045-2-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028061922.19045-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2022 02:19, Yinbo Zhu wrote:
> This driver provides support for clock controller on Loongson-2 SoC
> , the Loongson-2 SoC uses a 100MHz clock as the PLL reference clock
> , there are five independent PLLs inside, each of which PLL can

Same problem as in other patch - no new lines before commas.

> provide up to three sets of frequency dependent clock outputs.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
>  MAINTAINERS                  |   1 +
>  arch/loongarch/Kconfig       |   1 +
>  arch/loongarch/kernel/time.c |   3 +
>  drivers/clk/Kconfig          |   9 ++
>  drivers/clk/Makefile         |   1 +
>  drivers/clk/clk-loongson2.c  | 285 +++++++++++++++++++++++++++++++++++
>  6 files changed, 300 insertions(+)
>  create mode 100644 drivers/clk/clk-loongson2.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 14af7ebf2be1..5136684fb6c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11911,6 +11911,7 @@ LOONGSON-2 SOC SERIES CLOCK DRIVER
>  M:	Yinbo Zhu <zhuyinbo@loongson.cn>
>  L:	linux-clk@vger.kernel.org
>  S:	Maintained
> +F:	drivers/clk/clk-loongson2.c
>  F:	include/dt-bindings/clock/loongson,ls2k-clk.h
>  
>  LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 26aeb1408e56..8b65f349cd6e 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -122,6 +122,7 @@ config LOONGARCH
>  	select USE_PERCPU_NUMA_NODE_ID
>  	select USER_STACKTRACE_SUPPORT
>  	select ZONE_DMA32
> +	select COMMON_CLK
>  
>  config 32BIT
>  	bool
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index 786735dcc8d6..09f20bc81798 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/sched_clock.h>
>  #include <linux/spinlock.h>
> +#include <linux/of_clk.h>
>  
>  #include <asm/cpu-features.h>
>  #include <asm/loongarch.h>
> @@ -214,6 +215,8 @@ int __init constant_clocksource_init(void)
>  
>  void __init time_init(void)
>  {
> +	of_clk_init(NULL);
> +
>  	if (!cpu_has_cpucfg)
>  		const_clock_freq = cpu_clock_freq;
>  	else
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 48f8f4221e21..e85a3ed88d4c 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -428,6 +428,15 @@ config COMMON_CLK_K210
>  	help
>  	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>  
> +config COMMON_CLK_LOONGSON2

Messed up order.

> +	bool "Clock driver for Loongson-2 SoC"
> +	depends on COMMON_CLK && OF
> +	help
> +	  This driver provides support for Clock Controller that base on
> +	  Common Clock Framework Controller (CCF) on Loongson-2 SoC. The
> +	  Clock Controller can generates and supplies clock to various
> +	  peripherals within the SoC.
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index d5db170d38d2..8ccc7436052f 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -75,6 +75,7 @@ obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+= clk-renesas-pcie.o
>  obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
>  obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
>  obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
> +obj-$(CONFIG_COMMON_CLK_LOONGSON2)	+= clk-loongson2.o

Messed up order.

>  
>  # please keep this section sorted lexicographically by directory path name
>  obj-y					+= actions/
> diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
> new file mode 100644
> index 000000000000..359fede40112
> --- /dev/null
> +++ b/drivers/clk/clk-loongson2.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Author: Yinbo Zhu <zhuyinbo@loongson.cn>
> + * Copyright (C) 2022-2023 Loongson Technology Corporation Limited
> + */
> +
> +#include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <dt-bindings/clock/loongson,ls2k-clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/slab.h>
> +#include <linux/clk.h>
> +
> +#define LOONGSON2_PLL_MULT_SHIFT		32
> +#define LOONGSON2_PLL_MULT_WIDTH		10
> +#define LOONGSON2_PLL_DIV_SHIFT			26
> +#define LOONGSON2_PLL_DIV_WIDTH			6
> +#define LOONGSON2_APB_FREQSCALE_SHIFT		20
> +#define LOONGSON2_APB_FREQSCALE_WIDTH		3
> +#define LOONGSON2_USB_FREQSCALE_SHIFT		16
> +#define LOONGSON2_USB_FREQSCALE_WIDTH		3
> +#define LOONGSON2_SATA_FREQSCALE_SHIFT		12
> +#define LOONGSON2_SATA_FREQSCALE_WIDTH		3
> +
> +void __iomem *loongson2_pll_base;

This must be static.

> +static DEFINE_SPINLOCK(loongson2_clk_lock);
> +static struct clk_hw **hws;
> +static struct clk_hw_onecell_data *clk_hw_data;

You have way too many file-scope variables. I would expect 0 and this
being a driver.

Best regards,
Krzysztof

