Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D240629B2
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 13:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929EFC433B5
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668002240;
	bh=bQ9psWmqhNKRvRhqcqZSUqbNX7maz6eciXaRkDx473U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iH1cEZqZCUIIbwNmz+g4PfUCa4CX96Tk8hbT9oNJMz6e8ExeJG85+eLeW1F4C0FjE
	 Vf9Rj9clNZ5CGJ7x769SG6/9MbWpm0GmkTswYb+l15+9ceahkFcHkyFKL/coRY4QxZ
	 vDAT9TlwPRgjLHngOSkZxOS/lV7SxrLdamTvrH0MeuRWWlfAmWeok0Ijdoy55O8aWX
	 aXzvNJT9PeOT5ueQ5UiJEQ1/oQxDdU5o58LprMRtqjdp3hPmZ6osCRYiZu/daPThx2
	 Ihlc6M5TWtad38zzBnQXob7KwZw9RYi5w+sut0Md/H9kB+WqTwwpEX20+ZTBk2k+j3
	 BcH4TF4zHHFjA==
Received: by mail-ed1-f47.google.com with SMTP id z18so27341920edb.9
        for <loongarch@lists.linux.dev>; Wed, 09 Nov 2022 05:57:20 -0800 (PST)
X-Gm-Message-State: ACrzQf3E0sLpcW/ZLhgr+Wojtmw02J92dYFdIgg0FnIdN6qTfJwk3QEL
	D7Abth47GoRAHQaKaqpX3U09WEm0xR7aYlEm6rY=
X-Google-Smtp-Source: AMsMyM7ray38j3CKFJTXluOelRpOe7Peso4k3n/brs7j2/q8f5jlB2Xu9kkNMxx2YgTFCUH/SmVxvAyxDrCLMEttxVg=
X-Received: by 2002:a05:6402:1817:b0:462:a25f:f0f2 with SMTP id
 g23-20020a056402181700b00462a25ff0f2mr1132607edy.156.1668002238720; Wed, 09
 Nov 2022 05:57:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221104024835.3570-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221104024835.3570-1-zhuyinbo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 9 Nov 2022 21:57:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4mpNp6wEGY0xOJgf5Kjm1EKXBUZdSKoGeacN5_CVuxtA@mail.gmail.com>
Message-ID: <CAAhV-H4mpNp6wEGY0xOJgf5Kjm1EKXBUZdSKoGeacN5_CVuxtA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] soc: loongson: add GUTS driver for loongson-2 platforms
To: Yinbo Zhu <zhuyinbo@loongson.cn>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Hector Martin <marcan@marcan.st>, Lubomir Rintel <lkundrak@v3.sk>, 
	Conor Dooley <conor.dooley@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Heiko Stuebner <heiko@sntech.de>, 
	Brian Norris <briannorris@chromium.org>, Sven Peter <sven@svenpeter.dev>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Yinbo,

On Fri, Nov 4, 2022 at 10:48 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>
> The global utilities block controls PCIE device enabling, alternate
> function selection for multiplexed signals, consistency of HDA, USB
> and PCIE, configuration of memory controller, rtc controller, lio
> controller, and clock control.
>
> This patch adds a driver to manage and access global utilities block
> for loongarch architecture Loongson-2 SoCs. Initially only reading SVR
Replace loongarch with LoongArch.

> and registering soc device are supported. Other guts accesses, such
> as reading PMON configuration by default, should eventually be added
> into this driver as well.
Replace PMON with BIOS is better.

>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Change in v6:
>                 1. Add full name spelling about GUTS in Kconfig.
>                 2. Add reviewed-by information.
> Change in v5:
>                 1. Add all history change log information.
> Change in v4:
>                 1. Remove menu information in Kconfig.
> Change in v3:
>                 1. Replace string loongson2/Loongson2 with Loongson-2/loongson-2
>                    in commit message, Kconfig, Makefile file.
>                 2. Replace string LOONGSON2 with LOONGSON-2.
> Change in v2:
>                 1. Add architecture support commit log description.
>                 2. Add other guts accesses plan commit log description.
>                 3. Add "depends on LOONGARCH || COMPILE_TEST" for
>                    LOONGSON2_GUTS in Kconfig.
>                 4. Move the scfg_guts to .c file from .h and delete .h.
>                 5. Remove __packed on scfg_guts.
>
>  MAINTAINERS                           |   6 +
>  drivers/soc/Kconfig                   |   1 +
>  drivers/soc/Makefile                  |   1 +
>  drivers/soc/loongson/Kconfig          |  18 +++
>  drivers/soc/loongson/Makefile         |   6 +
>  drivers/soc/loongson/loongson2_guts.c | 189 ++++++++++++++++++++++++++
>  6 files changed, 221 insertions(+)
>  create mode 100644 drivers/soc/loongson/Kconfig
>  create mode 100644 drivers/soc/loongson/Makefile
>  create mode 100644 drivers/soc/loongson/loongson2_guts.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c9dc5ddbd9fe..20ce056ae207 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12041,6 +12041,12 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/pinctrl/loongson,ls2k-pinctrl.yaml
>  F:     drivers/pinctrl/pinctrl-loongson2.c
>
> +LOONGSON-2 SOC SERIES GUTS DRIVER
> +M:     Yinbo Zhu <zhuyinbo@loongson.cn>
> +L:     loongarch@lists.linux.dev
> +S:     Maintained
> +F:     drivers/soc/loongson/loongson2_guts.c
> +
>  LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
>  M:     Sathya Prakash <sathya.prakash@broadcom.com>
>  M:     Sreekanth Reddy <sreekanth.reddy@broadcom.com>
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index e461c071189b..5dbb09f843f7 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -13,6 +13,7 @@ source "drivers/soc/fujitsu/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
>  source "drivers/soc/litex/Kconfig"
> +source "drivers/soc/loongson/Kconfig"
>  source "drivers/soc/mediatek/Kconfig"
>  source "drivers/soc/microchip/Kconfig"
>  source "drivers/soc/pxa/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 69ba6508cf2c..fff513bd522d 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -18,6 +18,7 @@ obj-y                         += imx/
>  obj-y                          += ixp4xx/
>  obj-$(CONFIG_SOC_XWAY)         += lantiq/
>  obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
> +obj-y                          += loongson/
>  obj-y                          += mediatek/
>  obj-y                          += microchip/
>  obj-y                          += pxa/
> diff --git a/drivers/soc/loongson/Kconfig b/drivers/soc/loongson/Kconfig
> new file mode 100644
> index 000000000000..df52599ae87b
> --- /dev/null
> +++ b/drivers/soc/loongson/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Loongson-2 series SoC drivers
> +#
> +
> +config LOONGSON2_GUTS
> +       tristate "Loongson-2 SoC Global UtiliTieS (GUTS) register block"
> +       depends on LOONGARCH || COMPILE_TEST
> +       select SOC_BUS
> +       help
> +         The global utilities block controls PCIE device enabling, alternate
> +         function selection for multiplexed signals, consistency of HDA, USB
> +         and PCIE, configuration of memory controller, rtc controller, lio
> +         controller, and clock control. This patch adds a driver to manage
> +         and access global utilities block for loongarch architecture Loongson-2
> +         SoCs. Initially only reading SVR and registering soc device are
> +         supported. Other guts accesses, such as reading PMON configuration by
> +         default, should eventually be added into this driver as well.
The same, replace PMON with BIOS is better.

> diff --git a/drivers/soc/loongson/Makefile b/drivers/soc/loongson/Makefile
> new file mode 100644
> index 000000000000..263c486df638
> --- /dev/null
> +++ b/drivers/soc/loongson/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Makefile for the Linux Kernel SoC Loongson-2 specific device drivers
> +#
> +
> +obj-$(CONFIG_LOONGSON2_GUTS)           += loongson2_guts.o
> diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
> new file mode 100644
> index 000000000000..8f3d5465c7e8
> --- /dev/null
> +++ b/drivers/soc/loongson/loongson2_guts.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Author: Yinbo Zhu <zhuyinbo@loongson.cn>
> + * Copyright (C) 2022-2023 Loongson Technology Corporation Limited
> + */
> +
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/of_fdt.h>
> +#include <linux/sys_soc.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +static struct soc_device_attribute soc_dev_attr;
> +static struct soc_device *soc_dev;
> +
> +/*
> + * Global Utility Registers.
> + *
> + * Not all registers defined in this structure are available on all chips, so
> + * you are expected to know whether a given register actually exists on your
> + * chip before you access it.
> + *
> + * Also, some registers are similar on different chips but have slightly
> + * different names.  In these cases, one name is chosen to avoid extraneous
> + * #ifdefs.
> + */
> +struct scfg_guts {
> +       u32     svr;            /* Version Register */
> +       u8      res0[4];
> +       u16     feature;        /* Feature Register */
> +       u32     vendor;         /* Vendor Register */
> +       u8      res1[6];
> +       u32     id;
> +       u8      res2[0x3ff8 - 0x18];
> +       u32     chip;
> +};
> +
> +static struct guts {
> +       struct scfg_guts __iomem *regs;
> +       bool little_endian;
> +} *guts;
> +
> +struct loongson2_soc_die_attr {
> +       char    *die;
> +       u32     svr;
> +       u32     mask;
> +};
> +
> +/* SoC die attribute definition for Loongson-2 platform */
> +static const struct loongson2_soc_die_attr loongson2_soc_die[] = {
> +
> +       /*
> +        * LA-based SoCs Loongson-2 Series
Use LoongArch instead of LA when possible.

> +        */
> +
> +       /* Die: 2k1000la, SoC: 2k1000la */
> +       { .die          = "2K1000LA",
Just use 2K1000 is better than 2K1000LA, I think.

Huacai
> +         .svr          = 0x00000013,
> +         .mask         = 0x000000ff,
> +       },
> +       { },
> +};
> +
> +static const struct loongson2_soc_die_attr *loongson2_soc_die_match(
> +       u32 svr, const struct loongson2_soc_die_attr *matches)
> +{
> +       while (matches->svr) {
> +               if (matches->svr == (svr & matches->mask))
> +                       return matches;
> +               matches++;
> +       };
> +
> +       return NULL;
> +}
> +
> +static u32 loongson2_guts_get_svr(void)
> +{
> +       u32 svr = 0;
> +
> +       if (!guts || !guts->regs)
> +               return svr;
> +
> +       if (guts->little_endian)
> +               svr = ioread32(&guts->regs->svr);
> +       else
> +               svr = ioread32be(&guts->regs->svr);
> +
> +       return svr;
> +}
> +
> +static int loongson2_guts_probe(struct platform_device *pdev)
> +{
> +       struct device_node *root, *np = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
> +       struct resource *res;
> +       const struct loongson2_soc_die_attr *soc_die;
> +       const char *machine;
> +       u32 svr;
> +
> +       /* Initialize guts */
> +       guts = devm_kzalloc(dev, sizeof(*guts), GFP_KERNEL);
> +       if (!guts)
> +               return -ENOMEM;
> +
> +       guts->little_endian = of_property_read_bool(np, "little-endian");
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       guts->regs = ioremap(res->start, res->end - res->start + 1);
> +       if (IS_ERR(guts->regs))
> +               return PTR_ERR(guts->regs);
> +
> +       /* Register soc device */
> +       root = of_find_node_by_path("/");
> +       if (of_property_read_string(root, "model", &machine))
> +               of_property_read_string_index(root, "compatible", 0, &machine);
> +       of_node_put(root);
> +       if (machine)
> +               soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
> +
> +       svr = loongson2_guts_get_svr();
> +       soc_die = loongson2_soc_die_match(svr, loongson2_soc_die);
> +       if (soc_die) {
> +               soc_dev_attr.family = devm_kasprintf(dev, GFP_KERNEL,
> +                                                    "Loongson %s", soc_die->die);
> +       } else {
> +               soc_dev_attr.family = devm_kasprintf(dev, GFP_KERNEL, "Loongson");
> +       }
> +       if (!soc_dev_attr.family)
> +               return -ENOMEM;
> +       soc_dev_attr.soc_id = devm_kasprintf(dev, GFP_KERNEL,
> +                                            "svr:0x%08x", svr);
> +       if (!soc_dev_attr.soc_id)
> +               return -ENOMEM;
> +       soc_dev_attr.revision = devm_kasprintf(dev, GFP_KERNEL, "%d.%d",
> +                                              (svr >>  4) & 0xf, svr & 0xf);
> +       if (!soc_dev_attr.revision)
> +               return -ENOMEM;
> +
> +       soc_dev = soc_device_register(&soc_dev_attr);
> +       if (IS_ERR(soc_dev))
> +               return PTR_ERR(soc_dev);
> +
> +       pr_info("Machine: %s\n", soc_dev_attr.machine);
> +       pr_info("SoC family: %s\n", soc_dev_attr.family);
> +       pr_info("SoC ID: %s, Revision: %s\n",
> +               soc_dev_attr.soc_id, soc_dev_attr.revision);
> +
> +       return 0;
> +}
> +
> +static int loongson2_guts_remove(struct platform_device *dev)
> +{
> +       soc_device_unregister(soc_dev);
> +
> +       return 0;
> +}
> +
> +/*
> + * Table for matching compatible strings, for device tree
> + * guts node, for Loongson-2 SoCs.
> + */
> +static const struct of_device_id loongson2_guts_of_match[] = {
> +       { .compatible = "loongson,ls2k-chipid", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, loongson2_guts_of_match);
> +
> +static struct platform_driver loongson2_guts_driver = {
> +       .driver = {
> +               .name = "loongson2-guts",
> +               .of_match_table = loongson2_guts_of_match,
> +       },
> +       .probe = loongson2_guts_probe,
> +       .remove = loongson2_guts_remove,
> +};
> +
> +static int __init loongson2_guts_init(void)
> +{
> +       return platform_driver_register(&loongson2_guts_driver);
> +}
> +core_initcall(loongson2_guts_init);
> +
> +static void __exit loongson2_guts_exit(void)
> +{
> +       platform_driver_unregister(&loongson2_guts_driver);
> +}
> +module_exit(loongson2_guts_exit);
> --
> 2.20.1
>
>
