Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785E33C1
	for <loongarch@lists.linux.dev>; Wed, 23 Nov 2022 22:14:44 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 7so22416628ybp.13
        for <loongarch@lists.linux.dev>; Wed, 23 Nov 2022 14:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yxwq700cjgIpgfGXjXVMIWZf+/i54U4hiQu6wwaFrxs=;
        b=NERkzdTLp+gtlJdbWRZFxyzivY0ZJDPAXdfrGF3m/XML2U8DBM1f9y3bdLAgjKiZn8
         a2V5OxNDZdSmicHR0Vw2yjHPlWFDCC4yIun+usLgcmKTJw6n4FjYvRAlM4U1S0GaguhK
         GvFRvouAy/HCKKjynSlpWv5lqkA5xDE/awBDG+0n8wS3M+yA16vT8okceMIwiQIVGgwk
         cxulXw1lewEXbgR4GCJfE+rEyDVVODX0X8pAQ49ujkduB68QFJCDfQtd9TwO+QdAt6dl
         9wK2iOGcLfiqo8TB1jUMzOzWqE2LHkAioDTh6SGmTRDJyquX3/viOLFRcnbauKLHHilJ
         Soew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxwq700cjgIpgfGXjXVMIWZf+/i54U4hiQu6wwaFrxs=;
        b=xe/fkJKoKTPVJxl+pl5db8WBZGpzHbsPb0f2B+pigzx/pDwGjCQj22CtTLIuK8Oo2T
         QYzyo0Zjnywmc2IZTNx71v14HRFVdQY2ONWc9kVNdL+4kmCVWTuooSzEbGdsvkeYttfQ
         UZ7tmhV5FFmtAEoefONgiwph4GP0iEIIbapspltWYjdRQDXAnPDdcnkmUmHnORMHFi3m
         Liq1Vkt6LOQMB4HOjh4NUgtJybAdmXEOwR+0SsK1VjUpRXYymK4e+MP4daO3b1PKnAvh
         S2poi21yTMu4AXet6neT9GV463qjHFOZFC62dXHo2IpfzhJHR5Ng32xe9i/BhmAyoGy3
         ChjA==
X-Gm-Message-State: ANoB5pn2PBdf1tmqbcywiIsOIHtHgNjmkH3gFAg6e9EjNzX6roUKDbhW
	NGyIKeWU5wE+rv24JlJp2OXVOLyU+QhzXY9Ka+Jb0A==
X-Google-Smtp-Source: AA0mqf4bdwIwAUjV3qYMdxNw8Ige0lynYHKpcKkZxcAuLvYxsMbWkZsSuItzC/6TVTNtDTdGQ7fzuG7GrT5n9w66TJU=
X-Received: by 2002:a25:acd1:0:b0:6b4:b9e3:c64b with SMTP id
 x17-20020a25acd1000000b006b4b9e3c64bmr10342450ybd.238.1669241683091; Wed, 23
 Nov 2022 14:14:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221123080414.14005-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221123080414.14005-1-zhuyinbo@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Nov 2022 23:14:31 +0100
Message-ID: <CACRpkdZ5OJpMFH1Wi31TKQZskQtCmNGyySdkOpouiNW2t_jV6Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] gpio: loongson: add gpio driver support
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	Arnaud Patard <apatard@mandriva.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Hongchen Zhang <zhanghongchen@loongson.cn>, 
	Liu Peibao <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 23, 2022 at 9:04 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> The Loongson platforms GPIO controller contains 60 GPIO pins in total,
> 4 of which are dedicated GPIO pins, and the remaining 56 are reused
> with other functions. Each GPIO can set input/output and has the
> interrupt capability.
>
> This driver added support for Loongson GPIO controller and support to
> use DTS or ACPI to descibe GPIO device resources.
>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v6:

This is way better :)

I guess you notice how the driver gets smaller and smaller.
This is a good sign!

> +static int loongson_gpio_request(
> +                       struct gpio_chip *chip, unsigned int pin)
> +{
> +       if (pin >= chip->ngpio)
> +               return -EINVAL;
> +
> +       return 0;
> +}

Drop this altogether as discussed in my other reply.

> +static inline void __set_direction(struct loongson_gpio_chip *lgpio,
> +                       unsigned int pin, int input)
> +static void __set_level(struct loongson_gpio_chip *lgpio, unsigned int pin,
> +                       int high)

I missed this before. Also the use of __underscore for inner functions
is a bad habit IMO (because __underscore is also used for compiler
primitives such as __init which is confusing) The signature of these
functions is too generic. Name them loongson_commit_direction() or
loongson_commit_level() or something.

> +static int loongson_gpio_get_direction(
> +                               struct gpio_chip *chip, unsigned int pin)

thanks for implementing this!

> +       if (lgpio->p_data->mode == BIT_CTRL_MODE) {
> +               ret = bgpio_init(&lgpio->chip, dev, 8,
> +                               LOONGSON_GPIO_IN(lgpio),
> +                               LOONGSON_GPIO_OUT(lgpio), 0,
> +                               LOONGSON_GPIO_OEN(lgpio), NULL, 0);
> +               if (ret) {
> +                       dev_err(dev, "unable to init generic GPIO\n");
> +                       return ret;
> +               }
> +               lgpio->chip.ngpio = ngpios;

Neat!

> +               lgpio->chip.base = 0;

Drop this. It is good that the base is unpredictable so
people don't start to rely on it. (drivers/gpio/TODO)

> +       rval = device_property_read_u16_array(dev, "gsi_idx_map", NULL, 0);

But this gsi_idx_map is missing from your device tree bindings,
is it not?

Or what am I missing here? Sorry I might overlook something...

> +static int loongson_gpio_probe(struct platform_device *pdev)
> +{
> +       void __iomem *reg_base;
> +       struct loongson_gpio_chip *lgpio;
> +       struct device_node *np = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
> +
> +       lgpio = devm_kzalloc(dev, sizeof(*lgpio), GFP_KERNEL);
> +       if (!lgpio)
> +               return -ENOMEM;
> +
> +       loongson_gpio_get_props(pdev, lgpio);
> +
> +       lgpio->p_data = device_get_match_data(&pdev->dev);

lgpio->p_data = device_get_match_data(dev);


> +static int __init loongson_gpio_setup(void)
> +{
> +       return platform_driver_register(&loongson_gpio_driver);
> +}
> +postcore_initcall(loongson_gpio_setup);

Why does this have to be postcore_initcall()?

Yours,
Linus Walleij
