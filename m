Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819608F78
	for <loongarch@lists.linux.dev>; Tue,  8 Nov 2022 12:11:55 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id u24so22088264edd.13
        for <loongarch@lists.linux.dev>; Tue, 08 Nov 2022 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mzMlRiYVPoJeiMegBbQ1MjhjUAcP2BQ4/F4++yECz0k=;
        b=GBzcjxcTtY7cjcCkSCQAIGHks2ribsjrH6lBTtbG/1zwiEhQlsnJaSbsqWIDSpSOFx
         gJ6vlVgZq0l1FPcHLDk7jVXjlQ09V1dSyORgcpzPxrcHaQIAAMaR7a79x2DQ8AjUhDRz
         JMSHe1Q0tSvaXY4Pm09q1nRDHcwJZNo3OelsxpJBoi8C2q5sBwP+dCKAYZwBnAOhhu7f
         0aTgOUlr+3G93d5ICdGrtgnqHR0oAI81DJiwEiIC8Z6SnaSq/fzV9s0eUgMTPpF/ueZY
         N3lw/eDF0TozdSQV7+4aMpm8/4Zw++xw6a1SretE87N2695SH3E7QEONPdbUartnY7F4
         JuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzMlRiYVPoJeiMegBbQ1MjhjUAcP2BQ4/F4++yECz0k=;
        b=FqWejpflUyIc4jQrXXn7X1/q+Pw6YiXaltiWcG8IfFMa5jqxBB4Q4MEwwKMRVN5sXV
         Ipl7nr6u1c0irXWE/6Q4xDc6VKfc+T8wWUhm7xV1uPtLGZ3Td63Q+vpFJ542GT264MWJ
         tpCoYZ6crCPEi799B6n9W4cAUUfNgSArmemNj9pmORhppTqpTd06LZn9X9aY4/bqF6Lv
         5SU8IICvmNPrRqZT4gba9WQW/97zBgl5liSpQskcm7QqtH5Mly9OG+3I1W4f/WAK80Wx
         hfl9sPpEq1mriKyG1f/bTlTr+UnkmwURBgSXPnw39gXAFECxRU4+kfI39xZM771ycnx3
         hU8Q==
X-Gm-Message-State: ACrzQf11oBilSvheaVkePpKf4c7ePHVfYpO2HcYUUK84HLaGIbPT+Aes
	9gFHr0tAc99luGmqGxMQGm+/0YA2ZpnwjnbjrUe+9w==
X-Google-Smtp-Source: AMsMyM5kiWVSRjqdEOc/GfF/lf+nlKsl0ToMTcnzZ4XbNPlmja/gkGsp1SDtfcczBpZBE8Xvq90EA3Kh3ciEP69xttM=
X-Received: by 2002:aa7:d6d1:0:b0:463:ba50:e574 with SMTP id
 x17-20020aa7d6d1000000b00463ba50e574mr37546370edr.158.1667909513741; Tue, 08
 Nov 2022 04:11:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221108092107.28996-1-zhuyinbo@loongson.cn> <20221108092107.28996-2-zhuyinbo@loongson.cn>
In-Reply-To: <20221108092107.28996-2-zhuyinbo@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:11:42 +0100
Message-ID: <CACRpkdbJFNhE1acJ5eNncvfK0VZgW=pCB3716Rv3KahdK1dokQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: gpio: add loongson series gpio
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, richard.liu@st.com, 
	Arnaud Patard <apatard@mandriva.com>, Hongbing Hu <huhb@lemote.com>, 
	Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Yinbo,

thanks for your patch!

On Tue, Nov 8, 2022 at 10:21 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> Add the Loongson series gpio binding with DT schema format using
> json-schema.
>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

> +  gpio-ranges: true

So you are using GPIO ranges... and...

> +  loongson,gpio_base:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This option indicate the first GPIO number in this node.

Then you have added this to reimplement gpio ranges.

It also shows in the driver.

Drop gpio_base altogether (we do not encode linux-specific properties
into the device trees) and use gpio-ranges as they are intended to
map between the GPIO numberspace and the pin control pin number
space.

See
Documentation/devicetree/bindings/gpio/gpio.txt
for documentation on gpio-ranges, also look how other drivers are
using them.

Yours,
Linus Walleij
