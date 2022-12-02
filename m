Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6725B4C71
	for <loongarch@lists.linux.dev>; Fri,  2 Dec 2022 16:11:58 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id y18so1816172uae.8
        for <loongarch@lists.linux.dev>; Fri, 02 Dec 2022 08:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TAefJrRL7K4A+RMGngmdLs8YqkmKSbBIjbXCxnKmhbs=;
        b=OTdGscoyyXY4sJr8w9cmCX0xSvhEErZUBMdHPPKX/5+iYfWQdgtRA4jjcNYzRwCGFQ
         rU6lS4qgX5LkqwunFDKXyrFmNIkukP6ir/ILfkqTFuvG0gbbtlUSljSwUxGUOl2HDdET
         SwhUO7sNYmbE+qzpnT3fuzzUzQU/YUivMVuklk0khfLjB7pEbm1EvNDxRMGtRV1KIzC0
         zeEhRu5/xAlTU2/SPZ8ZHZNt+Z3ZT0Wg+Odu6EdGqbdqbwDF2yJz/eh/QzqqDYuXMEDk
         3VHckgxrYQUX1IKG4EAs/X+d4p66OEl+1gbN16LQZjnW4pULS6EOCE0G+0jvhUMmmWVG
         oCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAefJrRL7K4A+RMGngmdLs8YqkmKSbBIjbXCxnKmhbs=;
        b=ghJ5kJ8eAie4K7bizl9KuaonkGTleJewiSXerOqdAAWxndeMWD9YauZXznZpYw1yVG
         D6w6l/S9jlC8MVbm643Y8e4DvMmt3sdiZDkb+hDMsPvz8AYZ4D/VAuXBtUFKiEz1zUEP
         CeTG/XAmkpmi5wU1BmNKhAZRi2daqblecnk8/LJC4+Gir703PsCXvuNbEbDIsz+qOyZd
         oxAeNgW3drffua7BL+4Kn40D2PcinmRMY8Sbs8zF8HqdL3heD1aojDW2zL9JvJVLvedb
         Lhndk9qexUHGMiFF1tx3ke2vm1ELKB8tRvaTaBBRUo9A0Q2DjbHf1aI3T1d5VO30hQOe
         7FCw==
X-Gm-Message-State: ANoB5pkZzIXVFLAch9B+PBuw18W7FGjB+rJAmVrjwU8tdRfB1iVOJA30
	AhcA2XaKU2IZSHUdOsxTwHrslWr3iwS2nro1H1v5Qw==
X-Google-Smtp-Source: AA0mqf6y8bCMPq1LTVZ8bKCUOnTJ4Vq1GPxxgwR2WlG4b/Lw466vVq5YLikadhKWjms/IOLGdHK46U6YPHGpuihZdkw=
X-Received: by 2002:ab0:734e:0:b0:419:18c7:58d with SMTP id
 k14-20020ab0734e000000b0041918c7058dmr17210680uap.119.1669997517287; Fri, 02
 Dec 2022 08:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221201123220.7893-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221201123220.7893-1-zhuyinbo@loongson.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Dec 2022 17:11:46 +0100
Message-ID: <CAMRc=MdSfw2-qbcOReEKnhNj4QaTy4mkJL+fH3m7nTBuLhxZaw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] gpio: loongson: add gpio driver support
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
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

On Thu, Dec 1, 2022 at 1:33 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>
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
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Both patches applied.

For the future: please reverse the order of patches and send dt
bindings before the driver code.

Bartosz
