Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B097F2579
	for <loongarch@lists.linux.dev>; Tue, 13 Dec 2022 09:45:56 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-381662c78a9so184323297b3.7
        for <loongarch@lists.linux.dev>; Tue, 13 Dec 2022 01:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iPtLftr9mLTiDAptPz9mvrZVG8hTqgqEvX9Avo9sl1g=;
        b=hKzXso9eZlsyOVFQUJDMuaKvlCYfZTlVdb6U8r74Fs35C7eVjSGT3Vkb/R5Mfy1xkU
         P/CF6pRg0fmWckEmcLfH8V5KvD8T9TojXNwpF63EKIicT5yAu+kYbbjx5rKWDemGf4VF
         UxSG6NeaM1rHYnlaN+4K9Mea/3hEf3+Uhd++yPx5AJfRwxGDngXAfpyX3lF47CjJuVa3
         p+VoyxfRz0LALyDmpZruXOj+MD28bDJnDJPPny3greWOjMnMGdMDE36d4ZVrDwEQoBdp
         Y46WZSZXo4KSrwnBBUFZ80g7pTpy4HSE4SMlSXz2jshf4Ilr2QoUHiX6xwUed84OZuVg
         BDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPtLftr9mLTiDAptPz9mvrZVG8hTqgqEvX9Avo9sl1g=;
        b=h0Wh4CzElXw7ziUgDbcgCsHtu4qYYMrRP6HilBzkBIgnOQ5rIo7MD8HwpCiJBKj2HV
         aw5hWlx4u2Sgeyyf3dVhWs+LYk2zcjxOdnS+6M1UUBJVx0IftAHkraVbG8uEH73IQqhQ
         UijKRKO5D2NqVOiWHC0W8VfMbY2vI1F0Xltg+431iE7iSI7U5hXMoR3YWIVFoz0cU2cJ
         mwLWo/zOkLaQki78rZXbld/3r2Jd4ijdyBNJ98ljcoEYjL4PiPyPaMK/9K6UYa1XTRql
         hnLYbe3r/52GOOpju0m+V0GZRenwsBh765k4HPGIgFUzJalsapbGu21frlyC+7S1gEmu
         OgUA==
X-Gm-Message-State: ANoB5pnG/HocK1DNDFKgjCFTkY6JlaTlHAz7yhiyQIRW7x4CgAvyTw2p
	1hCnZy6XhkVkuyDjnAT5MtUNPDGnrTPVbhPr0XliWQ==
X-Google-Smtp-Source: AA0mqf5KB4LYFTpAQUpghbjTaGUJ19gRvoZw0sTgHBYe53MAcw9jcGLIhvF3gdN62YzKc6H5k3qDSar0IR2TxwYnNPo=
X-Received: by 2002:a81:5d8:0:b0:3f5:b69c:387 with SMTP id 207-20020a8105d8000000b003f5b69c0387mr12925219ywf.359.1670924755634;
 Tue, 13 Dec 2022 01:45:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221121123803.3786-1-zhuyinbo@loongson.cn> <20221121123803.3786-2-zhuyinbo@loongson.cn>
 <CACRpkda1adiNwbTZHdAyHKny3r5FFMP_XXVGbo1vnCdw9U1gNg@mail.gmail.com>
 <8a7abd77-9540-efa8-6f67-908530e85399@loongson.cn> <CACRpkdb=wdydOYCcrpjLSyvfVO--_ezXsFQ46qwfVCiiTd5fNw@mail.gmail.com>
 <b78f02f4-4329-602e-ca8d-adbe911c2a54@loongson.cn>
In-Reply-To: <b78f02f4-4329-602e-ca8d-adbe911c2a54@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Dec 2022 10:45:43 +0100
Message-ID: <CACRpkdbrY2hV=JM3NJVdFyJbpXARKEhGMVpwrN9U=cP6LzyPQA@mail.gmail.com>
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

On Mon, Dec 12, 2022 at 9:34 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> > Don't do that because the GPIO maintainers love the
> > dynamic base and hate hardcoded bases. Set the base to -1
> > If you wonder why, read drivers/gpio/TODO.
>
> Hi Linus,
>
> I recenly verfied other peripheral on upstream, some peripheral driver
> need use gpio number,

What do you mean by upstream? If it is your own derivate kernel
(what we call *downstream) then it should be fixed, not
accommodated for.

If it is the mainline (Torvalds) kernel you are looking at legacy code
(such as boardfiles) which should be fixed or deleted. Beware that
the kernel contains much old code and bad examples which should
not be followed.

> but if use dynamic base that gpio number will be
> meaningless.  in additon I notice that many gpio driver don't use
> dynamic base, although bgpio_int was called.

Two wrongs does not make one right.
It is always possible to find bad examples in the kernel, because we
maintain lots of legacy code.
When in doubt, do what the maintainers say.
This maintainer says this: use a dynamic base.

> so I think the gpio number should be keep consistent with datasheet for
> some platform that need use gpio number.

So someone wrote a datasheet for a derivative, home-cooked kernel
that they had not bothered to synchronize with the community and
now the community should accommodate this mistake?

Sorry that is not how we work.

That datasheet is probably recommending old and bad practices, such
as using global GPIO numbers in drivers or using GPIO sysfs. The
GPIO maintainers do not approve of such stuff.

What about fixing the datasheet to say:
- We use dynamic GPIO number allocation
- Assign GPIOs to devices in the device tree with only HW GPIO number
  references = <&gpio HW_NUM GPIO_ACTIVE_HIGH>; etc
- For userspace access use libgpiod and /dev/gpiochipN, do not
  enable the legacy GPIO sysfs.

Yours,
Linus Walleij
