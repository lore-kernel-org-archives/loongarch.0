Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB572579
	for <loongarch@lists.linux.dev>; Wed, 27 Sep 2023 02:26:09 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5346b64f17aso2889890a12.2
        for <loongarch@lists.linux.dev>; Tue, 26 Sep 2023 19:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695781568; x=1696386368; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=;
        b=Aydk6SNSaao85SSUYwrXnWXY7z0YB4NoTbKLWVExCoqQZIAEsA8mZmp4dVT8Y88oj8
         9V1qv5tcNiDEHzq5dSwDJ5Mv431r8SuwQQSNnMPElF80Tgf2fIt1hQa/vlayfRT2nOlB
         kn+iiyodSm0QBU5SvzYASzY8PLEbcmvakGdiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695781568; x=1696386368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=;
        b=G774+H+6AmSsIbX3nooVZV5/aFORFdBNmXunTN9BhUsuaIX2PfaM+g8pkDXTf0A32G
         ahTM4XUAGOaLMhqtBtlUlipvmdM80tRGDN1boe4vMGLD6OorJ9acEuSR4IFGfOoLkCec
         c+PSZi+hJdIN5/xZGceAJ1S8LQf5rSBBglx7VKWxcdJeWWeJbTpvUE++Pa4wI/J1IpSz
         E4MhaD6O2u8Q2KKu3B3Ol6RrJNSnGldJy8kDmGwqnH8c6eL0fyMfxiI9Hew1x6caLvqN
         O3oXoa49zeflBdt1uF8mPdZqb2ci5CaedlTlPGcJDcbSGN1UaftTAQ3nZQL7uPPkJfox
         G8+w==
X-Gm-Message-State: AOJu0YzTv2UV3hZZNV56TjKhwkUlIz7+Hi18ArIN9CM+VHJMz5pHkG+h
	3P3B5YxyGarPyQPJnuGzuwwCkGB9+2pwjsVhv0A=
X-Google-Smtp-Source: AGHT+IHCCOjXb8+6pc5O9HOXdlXxVDhFBKsFiifAI3BglZZL/BL8JlMYEB/1h28CGguKKA8HQFS3La5RDl0OFTUHTbc=
X-Received: by 2002:a17:906:9a:b0:9b2:9d6f:2949 with SMTP id
 26-20020a170906009a00b009b29d6f2949mr400624ejc.57.1695781568293; Tue, 26 Sep
 2023 19:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:25:56 +0000
Message-ID: <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Li Yang <leoyang.li@nxp.com>, Herve Codina <herve.codina@bootlin.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Huisong Li <lihuisong@huawei.com>, Krzysztof Halasa <khalasa@piap.pl>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>, 
	Shang XiaoJing <shangxiaojing@huawei.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Zev Weiss <zev@bewilderbeest.net>, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	zhang songyi <zhang.songyi@zte.com.cn>, Lubomir Rintel <lkundrak@v3.sk>, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, Nick Alcock <nick.alcock@oracle.com>, 
	Yang Yingliang <yangyingliang@huawei.com>, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Sept 2023 at 09:55, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> this series converts all platform drivers below drivers/soc to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
>
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>
> As there is no single maintainer team for drivers/soc, I suggest the
> individual maintainers to pick up "their" patches.

I'd be happy if Arnd merged the lot at once. Arnd, what do you think?

If that will be too messy then I understand. I have queued the aspeed
ones locally and will push that out if we decide that's the best way
to go.

Thanks for doing this cleanup Uwe.

Cheers,

Joel
