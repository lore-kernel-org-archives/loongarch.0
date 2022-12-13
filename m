Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0072579
	for <loongarch@lists.linux.dev>; Tue, 13 Dec 2022 09:36:36 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id d131so16935392ybh.4
        for <loongarch@lists.linux.dev>; Tue, 13 Dec 2022 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Hd26A52tCpr/TZckO2AVYLVhE5lfnmKa/PoDrSKaIA=;
        b=G3H1wlAZpdpmQYEieqdVuJKIsOzW5NXXiQInR7B8S9KT3ra2veBRSQ/BqZ5EWCjQqs
         qYKAfPqCdD3slKR8pI+qp+du4ChkVYmD3V8WcqYibXxIjPCiBekfspJkhEAVlP3OczhF
         HDS6JM968T9/yi1meoD9tZaH2RtYsxwA7eocXUdrhSNLmiNDC4boRIpo1rv3SPqy4+Q+
         KcgVKC78qG9irgH4Q1aashBRhUUBRhn9pXpf3FgxB3Oru21hgDkIxo8IKywySuk23/xH
         u0GehlP7GwmfIXOGXG8SISBiNcf6tIA4LMTXganXiVNdWS01R/7rwXbiJwPuaGt7qlSf
         j6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Hd26A52tCpr/TZckO2AVYLVhE5lfnmKa/PoDrSKaIA=;
        b=nR0BgixzcNcBbHTOGTj4tWXuaJDieA1CZU7kf+WNo2AuOf93l3p3ZH68LXfaNFFlv7
         Zk5W7SHRyWbVm/w9rw6+hsYdLQjS+2qo0FYvlUNoj66bCF6QuFWmWdN7llZBVHYV/v7B
         7P5VA0kC6CY1M569pzgV4DaUsHvZGniway0r7UsXuG+zb0rRPPAqQ5g+lUZ2Lg/KC318
         Jzvr42ROupVHmRdEppbcRFeKDtF523x3ex0kjV3L4KYhWudjMqbgiaGRT4jm7FeqPOqy
         rakBSiSYgFIWLrtvSnpfsKE+IAQfFSQtZx57pixfsaHs1s0OkXmIx0FezTKujSGnzh13
         KLCA==
X-Gm-Message-State: ANoB5pnABmHEvMEZ7alVX1J3VpQkT4X2rl1tnM44atVzsQ+Imz1gysk6
	5cth0ou8kz3xyeA99YUXyhIqzQUWDo0cjv7hY0CgRw==
X-Google-Smtp-Source: AA0mqf7nZkHxiu+fKuIysqXHZF7UfBmLi0ZBnxPGnQLtOGWmyCu8e8cxfKokNJEIdxwKsyPc4kMyW8JbkbnRGby4zNA=
X-Received: by 2002:a25:d2ce:0:b0:710:f2e2:eb92 with SMTP id
 j197-20020a25d2ce000000b00710f2e2eb92mr2950219ybg.304.1670924195683; Tue, 13
 Dec 2022 01:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221121123803.3786-1-zhuyinbo@loongson.cn> <20221121123803.3786-2-zhuyinbo@loongson.cn>
 <CACRpkda1adiNwbTZHdAyHKny3r5FFMP_XXVGbo1vnCdw9U1gNg@mail.gmail.com>
 <8a7abd77-9540-efa8-6f67-908530e85399@loongson.cn> <CACRpkdb=wdydOYCcrpjLSyvfVO--_ezXsFQ46qwfVCiiTd5fNw@mail.gmail.com>
 <4c02570e-03d5-85f1-73fb-b66d6170c875@loongson.cn> <CACRpkdbgP9m40t_Ky4H+SQi9TELikomT2M-JpF7+auKmzOxQdg@mail.gmail.com>
 <ce858832-c052-1797-ffeb-2dbe654cbdd1@loongson.cn>
In-Reply-To: <ce858832-c052-1797-ffeb-2dbe654cbdd1@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Dec 2022 10:36:24 +0100
Message-ID: <CACRpkda0VerZhVGMJJjMYyAWdobvSLj4=eWxBjh+5ubmxvFcjQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: loongson: add gpio driver support
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

On Mon, Dec 12, 2022 at 9:13 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> mask_irq/unmask_irq/irq_ack/ function always be called by
> handle_level_irq/handle_edge_irq in current irq domain. and the
> handle_level_irq/handle_edge_irq will be called  by handle_irq_desc that
> ask know which irq is.
>
> when a peripheral need to use a gpio irq that gpio irq driver need know
> irq status and call irq desc->irq_handler.
>
> so I don't got it about which case it is unnecessary to know which irq.

Sorry I don't understand what you are asking, can you elaborate?

Do you mean that you don't know which driver will not call ->to_irq()
on the gpiochip? That would be any driver that takes an IRQ directly in
the device tree:

gpio: gpio {
    interrupt-controller;
    #interrupt-cells = <2>;
    ....
};

device {
    interrupts = <&gpio 14 IRQ_TYPE_LEVEL_HIGH>;
    ....
};

This case will only call the irqchip callbacks and will never call
the .to_irq() on the gpio_chip.

> > You find an example of a hierarchical GPIO irqchip using the
> > GPIOLIB_IRQCHIP in drivers/gpio/gpio-ixp4xx.c.
>
> Loongson-2 gpio irq hardware only a enable register, and when a gpio irq
> happen, then will has a such flow:  "cpuintc -> liointc -> gpioinc ->
> generic_handle_domain_irq -> handle_level_irq ->
> peripheral-action(action->handler)"
>
> generic_handle_domain_irq need rely on specific hwirq that ask gpio irq
> hardware has a status register but Loongson-2 gpio irq hardware doesn't
> have it.
>
> so I still think it wasn't appropriate that for loongson-2 gpio driver
> add a irq chip.

generic_handle_domain_irq() is of no concern, what matters is if
your interrupt is hierarchical or not, the callback in the GPIO chip
can be a simple remapping of the numberspace followed by
a call to the parent callbacks.

Yours,
Linus Walleij
