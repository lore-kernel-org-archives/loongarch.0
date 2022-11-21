Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05135443A
	for <loongarch@lists.linux.dev>; Mon, 21 Nov 2022 13:30:42 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id y83so5460871yby.6
        for <loongarch@lists.linux.dev>; Mon, 21 Nov 2022 05:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GrD43smjCY3nWkLYSNjoj38of5EV+w5nYaqRZQqu6Z8=;
        b=TUNYh4I3FrTN2Qk4H0EaCgVdh6VtCUkHQrl7IF/WS7A8JSbSrytMpvO9LkK9Chb/uQ
         h9GLIhg4dMaSzvngUjH18KAVt1yZoCFimILjVFl+dkm1tcVzFl4XBl55R+EfA4twK5Ke
         gYoxXpoho+NKdd3nXtxHF6h0GjlyIWZ0OAKcvzgF0MIpF6dOinFEk36siwVhJValvUyc
         pueO/pGQ7t8JbKNXg4JSPMLpASYMygIVKHIG8S7hscoi39Di4OM/PV1uTKa10eaeqj5R
         UQRz5lOvq6w2vbh0ZmtgIp+lsq0Y3AkQwctNRFuHzu8YKxkvctDEQvbADmqbEAxKtIVt
         Kocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrD43smjCY3nWkLYSNjoj38of5EV+w5nYaqRZQqu6Z8=;
        b=uYFJKemvRMTogf/JEzErt+j+wyix8/3YKpr9hcB007n0xu9rgGfkGtl8Ru117ygP8m
         6NLUR6b8nkb3xhtnl3P7R9fj43/bsNfhE1KF7MU5NUQEi0C+jiimt5Z4ONwiRIlC82/Y
         a/gwqKTHD9WjztJ+6OcHkV7V2CblZRvhf4WUN8LDwqWx2aP9/hBrqT9YJmXJlJQ44pGz
         zS7ztoqX9+twc1m9GiOLoZRZ6dELFvfG0r73U4gj05dUZ5NMe7kkY69QAl8lxAUCjnbd
         eIvLc5Lq5LWLdaINBCXGOywyCFmqoZNHCOPXvXb2Kkac7B5eBTmdS3SkBtiS/HhtEbLE
         u6Ww==
X-Gm-Message-State: ANoB5pnFEK1G3cth9S9m6bLMrwEq0nPOxah6Qzer5XNPAgoKPHa3JMOf
	XmN9f61w60yIwFwp+NMf5q/R3fBtXXCYEAvMM3IgVw==
X-Google-Smtp-Source: AA0mqf534R8JnjgMAXUcVtn2pda2CXoOXsQXeOnwXivkvGmMe/kxz+dylSUO0uREdlZBWzAUitBn5prW6/5teaSJXAg=
X-Received: by 2002:a25:1843:0:b0:6dc:b9ec:7c87 with SMTP id
 64-20020a251843000000b006dcb9ec7c87mr563702yby.322.1669037441964; Mon, 21 Nov
 2022 05:30:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221121123803.3786-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221121123803.3786-1-zhuyinbo@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Nov 2022 14:30:30 +0100
Message-ID: <CACRpkdbZS1HCvnTPnEHS6WSBvHUHmHOHs1YejuMcN9STn0+uPA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] gpio: loongson2ef: move driver to original location
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	Arnaud Patard <apatard@mandriva.com>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 1:38 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> This gpio driver doesn't cover CPU_LOONGSON64 platforms, because
> of gpio address was wrong and I don't plan to support it thus
> move this driver to arch/mips/loongson2ef/ so that I can drop the
> shackles of the legacy driver and add a new driver that supports
> dts/acpi to support LoongArch platforms.
>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

Don't do this, we spent a lot of time to collect drivers in
in drivers/gpio this is counter to our ambitions to have the
drivers under drivers/* and only arch code under arch/*.

Create a new file named loongson2-64bit.c or so and just
ignore that this one exist is an option, as is actually
integrating this driver properly.

Yours,
Linus Walleij
