Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2EA48B
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 20:36:09 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 1so14873551ybl.7
        for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 12:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ffVK8yqAhUy/OhUiWpfwiQeRb9vfkg2xW2w/cRvgmp4=;
        b=nu3s1s0tkqgG/V6gfUUR0jDBHO241Z2Q02/3bsAJgUH9hyDxN8+Wmwv5hSoESD2hwE
         mbAzn7ZXAq7nElQ8hXp3zX4HQrsN/dTCnfpNSSuqC61K4Wz7vm1Hou2VlYXsT7rILsMK
         2e5MMc3Wc12gqhOx+ObgrKNXadDAg6HNg2x1ZCgPLGt4aUupga/UyzM/z54RmxsBih30
         2vhm3OwFvRX7H6vu85Kz9wwCCqOCWnxz/CkjDI00qR6F8WJMAZnsL+78qCN4Wlo3UG7j
         rVITfThiY0FU/FnrBMzabKitY9erhvExF4Iu32yS7EoQvr7jVCjoMPxK/5b70XxODCk9
         elHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffVK8yqAhUy/OhUiWpfwiQeRb9vfkg2xW2w/cRvgmp4=;
        b=BXNkN1dNU5nv+qeEATnuHvBeou57M/M3qLdNBBd7kNVcSufwXGXTlgtAqWR54D1WYK
         5iwqF2GkGrKhYRiwSRv/lGmAGW9TT4yj8w2sbv8qAHUTX0Qaiy9yaKQGJJCkNhuB1vtM
         JGtPv6rg5abCxv8q7fHBolmt7A5R7Pe2NX2w27yMafawGmmpys9LgURt55xuD4cHh/j5
         OrWWps9VeHk0HcYHchwMQHrZdq1zXFY7M8ftZ03AfqmD83XchHz7L/S1M4MZEQVn6wp4
         7e91eDNnnR8cxF54SPg3LUSoEy39TFGKRxKe5x4AyyYjL4Pl0NLamf52IT1yeiDO0cF2
         RUfw==
X-Gm-Message-State: ANoB5pl4Mx1Ci8Rgq9AlX0BsP+mq350MZEyQiMB9nP257jG8iMvyVC34
	QZ/XbpZrR6O2zl13J+SLFj3MZSEcXIEWc8E5qRN2uQ==
X-Google-Smtp-Source: AA0mqf4CS52Hau/+WD0GVr3Atq6ZuHXn54OHpA8BjNuCq5Qb6+eIDNPSWbaHzJSKIECaXQPMyGcq4UuR2YB9ZaGuAG8=
X-Received: by 2002:a25:a241:0:b0:6ee:e865:c2e2 with SMTP id
 b59-20020a25a241000000b006eee865c2e2mr29663269ybi.206.1669667768154; Mon, 28
 Nov 2022 12:36:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221128064300.12021-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221128064300.12021-1-zhuyinbo@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Nov 2022 21:35:56 +0100
Message-ID: <CACRpkdZoD8v6pPStaKLf14houZk5e89ZBz5wZJVQJxJ1Xq37Ug@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] gpio: loongson: add gpio driver support
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

On Mon, Nov 28, 2022 at 7:43 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

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

v8 looks really nice.

> +static int loongson_gpio_to_irq(
> +                       struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct platform_device *pdev =
> +               container_of(chip->parent, struct platform_device, dev);
> +
> +       if (offset >= chip->ngpio)
> +               return -EINVAL;

You forgot to drop this.

With this fixed (and Bartosz requested fix):
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
