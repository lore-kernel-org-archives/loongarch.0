Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571C1841
	for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 09:05:51 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id t14so14028094vsr.9
        for <loongarch@lists.linux.dev>; Tue, 15 Nov 2022 01:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DPUEJYNpBZuDWaWvpWz9lTBlWL+Xs7ztgn+pfOxI9Vw=;
        b=za5gKQHyD5pfb+Psq9X451yj/JM/sWgade6c5blX+uuQ2wxffv7AkvmTo1P0h/EN09
         Fy3sp3m+6emgJD4ycOw+g6J0KpPXl5XJ4OaQJnxsOLH2lEe6hoCyMXfT53vfQSTIyZWl
         qUe0miJhOkndQKc0+RwVEGXuasFvwQrgZI2RXrJH/AzgtJ4tQq8kyB41Fi2JV57QBx/U
         e9mBNZw42y15hjRkxNZTAJAWw93sqE2R7+AsU0he/J3QreUibqfXO+mATPYzyaxUgkhB
         1bC/swUVlF2528bieS438IHPBlS1TDJHrlb3j/tkH3EUeo+EazNACSO3uUFi/bhFLYZJ
         8Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPUEJYNpBZuDWaWvpWz9lTBlWL+Xs7ztgn+pfOxI9Vw=;
        b=EGKdvli5YXKoNkS7hc7oCDB4FE+3GwYVsnYHGHzP4posHPuA6Io5z4g4uYjoAJjdo/
         UVVWBHgZIjhUfuXtAHh8nmdRuIsTPco8eBC6oYbMczP2PwcEYtX6G+9XnHbVkmdAtzEV
         9f2/zsWs+PJfxykONuxzOInaWYkPnd0zXVYxALPR9LRfUN+1V1MWH+TAox7wkoR7ttw3
         I/cqmI0l5D0w5ly5No5k556Y9PSJ8ZiL4fiN22SFajTR/2KRmmyG2xUFBZKKcUmbMXde
         GjC+a/+Qg9Bt8jFvUHwVXUJKbsMWKy4X2vQoXW3h6Y1BudQJn/PAXUIjbb/2YhgNptWB
         k5sg==
X-Gm-Message-State: ANoB5pkLYFfK4B7uqvVWVELr4W0xq2PVS6xkCHHN0Bwp0zvkPI9e3eHe
	dc6ozJ3znXSEwD1KjSnZmK47Qkr2rOBsLYzRpncytQ==
X-Google-Smtp-Source: AA0mqf7+HqkJSU4s6JQwT2ZWSckr32WEqchatmDr7NixiuSYebqcmgWdYUG8Gs6SmmejKZeaxlr8IJgVjjoKp9Fl4yw=
X-Received: by 2002:a05:6102:488:b0:3ac:38c7:1bdd with SMTP id
 n8-20020a056102048800b003ac38c71bddmr8089142vsa.9.1668503150211; Tue, 15 Nov
 2022 01:05:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221114095332.21079-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221114095332.21079-1-zhuyinbo@loongson.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Nov 2022 10:05:39 +0100
Message-ID: <CAMRc=McnEiSj1Q51pG3Lc8e+HcXE_uU7dm=1VoOa__xOgyoZPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: loongson: add dts/acpi gpio support
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	Arnaud Patard <apatard@mandriva.com>, Huacai Chen <chenhuacai@kernel.org>, 
	lvjianmin <lvjianmin@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Liu Peibao <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 14, 2022 at 10:53 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>
> The latest Loongson series platform use dts or acpi framework to
> register gpio device resources, such as the Loongson-2 series
> SoC of LOONGARCH architecture. In order to support dts, acpi and
> compatibility with previous platform device resources in driver,
> this patch was added.
>
> Signed-off-by: lvjianmin <lvjianmin@loongson.cn>
> Signed-off-by: zhanghongchen <zhanghongchen@loongson.cn>
> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v2:
>                 1. Fixup of_loongson_gpio_get_props and remove the parse logic about
>                    "loongson,conf_offset", "loongson,out_offset", "loongson,in_offset",
>                    "loongson,gpio_base", "loongson,support_irq" then kernel driver will
>                    initial them that depend compatible except "loongson,gpio_base".
>
>  arch/loongarch/include/asm/loongson.h         |  13 +
>  .../include/asm/mach-loongson2ef/loongson.h   |  12 +
>  .../include/asm/mach-loongson64/loongson.h    |  13 +
>  drivers/gpio/Kconfig                          |   6 +-
>  drivers/gpio/gpio-loongson.c                  | 422 +++++++++++++++---
>  5 files changed, 391 insertions(+), 75 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/loongson.h b/arch/loongarch/include/asm/loongson.h
> index 00db93edae1b..383fdda155f0 100644
> --- a/arch/loongarch/include/asm/loongson.h
> +++ b/arch/loongarch/include/asm/loongson.h
> @@ -60,6 +60,19 @@ static inline void xconf_writeq(u64 val64, volatile void __iomem *addr)
>         );
>  }
>
> +/* ============== Data structrues =============== */
> +
> +/* gpio data */
> +struct platform_gpio_data {
> +       u32 gpio_conf;
> +       u32 gpio_out;
> +       u32 gpio_in;
> +       u32 support_irq;
> +       char *label;
> +       int gpio_base;
> +       int ngpio;
> +};

This is a terrible name for an exported structure. You would at least
need some kind of a namespace prefix. But even then the need to add a
platform data structure is very questionable. We've moved past the
need for platform data in the kernel. I don't see anyone setting it up
in this series either. Could you provide more explanation on why you
would need it and who would use it?

> +
>  /* ============== LS7A registers =============== */
>  #define LS7A_PCH_REG_BASE              0x10000000UL
>  /* LPC regs */
> diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson.h
> index ca039b8dcde3..b261cea4fee1 100644
> --- a/arch/mips/include/asm/mach-loongson2ef/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson2ef/loongson.h
> @@ -315,4 +315,16 @@ extern unsigned long _loongson_addrwincfg_base;
>
>  #endif /* ! CONFIG_CPU_SUPPORTS_ADDRWINCFG */
>
> +/* ============== Data structrues =============== */
> +
> +/* gpio data */
> +struct platform_gpio_data {
> +       u32 gpio_conf;
> +       u32 gpio_out;
> +       u32 gpio_in;
> +       u32 support_irq;
> +       char *label;
> +       int gpio_base;
> +       int ngpio;
> +};

No idea why you would need to duplicate it like this either. And why
put it in arch/.

[snip]

I will hold off reviewing the rest of the patch until we get that clarified.

Bartosz
