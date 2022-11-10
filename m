Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A606364
	for <loongarch@lists.linux.dev>; Thu, 10 Nov 2022 00:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2558C43141
	for <loongarch@lists.linux.dev>; Thu, 10 Nov 2022 00:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668040879;
	bh=VjEtLrKzvgiLhEm+ej2iaT8NQcZGa3jjGonq3IJbJQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nuM5N4haGG66KC4/btGKfg9rFCz5/sgDwmLHziFjSFtxNIeV1u/xhA+hlF/hbSTLt
	 vuCPcRsHV3bNRCMLwRdqGOZcfjTY+bz0Hu43yhNRDyd0foXvoQNNPL56p0ou0IWskZ
	 WhvZIWMOLXImDNOLAiTp7Qk8kgr1TrdrrMH4GCMSWQ1FxiPhtIC6QaaZA7KdqqBQBm
	 7xj2RBBk7Ia/UwD4QF2scKFPzOb2Xy0YZdPYd8uxB6PnEcDOyoz3l/eLHrtpPHsd8m
	 8SfHDc37d/fEKMQfmguBAq9VwV0JS1QQPTKsLeb44rtvkTt6MzGqH076Aj7mhPEtIh
	 XzLHfAKtgMbnw==
Received: by mail-ed1-f49.google.com with SMTP id z18so715764edb.9
        for <loongarch@lists.linux.dev>; Wed, 09 Nov 2022 16:41:19 -0800 (PST)
X-Gm-Message-State: ACrzQf1rE5DKD8Gikbjm3JCM7Rk/3wJJLiPHBHWyzEvDWRafDAxY82EG
	Q3ygr0YusywsQOdXu+8LCsCAxEF52py/gnbg6yw=
X-Google-Smtp-Source: AMsMyM42tP13Sp94y9qkGoPYG7IJv7Z3aYG0AMLIJjkUDCvEbPvqe92Fu2keAeuXGqxYLRErZDBNs/jphgahMASxEZ4=
X-Received: by 2002:a05:6402:c9a:b0:462:32bf:613a with SMTP id
 cm26-20020a0564020c9a00b0046232bf613amr1282679edb.78.1668040878061; Wed, 09
 Nov 2022 16:41:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221104024835.3570-1-zhuyinbo@loongson.cn> <57c9f565-e75b-0c8f-fdce-9dc8c334d50f@loongson.cn>
 <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
 <574d58b2-0e9a-4fa0-84a8-caf39a9bc37a@app.fastmail.com> <CAAhV-H64s-2gNMd0-F21kUzieh5G-MbBnA0k6J8EP2_7SpevaA@mail.gmail.com>
 <0b2ca852-61b2-4e88-b389-f102994d5b2d@app.fastmail.com>
In-Reply-To: <0b2ca852-61b2-4e88-b389-f102994d5b2d@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 10 Nov 2022 08:41:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4G0YFKhtOejQbs=F83JwOAbRCyTLpteA2yJ7d7kFPHPg@mail.gmail.com>
Message-ID: <CAAhV-H4G0YFKhtOejQbs=F83JwOAbRCyTLpteA2yJ7d7kFPHPg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] soc: loongson: add GUTS driver for loongson-2 platforms
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hector Martin <marcan@marcan.st>, 
	Lubomir Rintel <lkundrak@v3.sk>, "Conor.Dooley" <conor.dooley@microchip.com>, 
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Brian Norris <briannorris@chromium.org>, Sven Peter <sven@svenpeter.dev>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 9, 2022 at 11:08 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Nov 9, 2022, at 14:50, Huacai Chen wrote:
> > On Wed, Nov 9, 2022 at 7:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Wed, Nov 9, 2022, at 11:15, Linus Walleij wrote:
> >> > On Wed, Nov 9, 2022 at 11:03 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
> >> >
> >> >> Hi maintainer,
> >> >>
> >> >> This patch I had verified that base on mainline 6.1-rc3 tree, it is
> >> >> okay, if no other issue, please you help me merge it to upstream.
> >> >
> >> > Aren't these loongarch maintainers listed in MAINTAINERS able to
> >> > merge this? Certainly Huacai can merge stuff to drivers/soc as
> >> > need be. drivers/soc is a bit shared between different archs.
> >>
> >> I'm generally happy to keep an eye on stuff in drivers/soc/ across
> >> architectures and merge it through the soc tree, especially for
> >> new platforms, but merging this through the loongarch tree works
> >> as well.
> > So drivers/soc is similar to drivers/platform that can be merged
> > through corresponding architecture trees?
>
> Right, I think in both cases, there is no top-level subsystem
> maintainer, but the rules are specific to the second-level
> hierarchy: most parts of drivers/platform/ happen to go
> through the x86 platform maintainer trees, and for drivers/soc
> we merge most stuff through the soc tree, but a few parts
> of each have different maintainers.
>
> >> Since the driver was already sent to soc@kernel.org, I can
> >> simply pick it up through patchwork[1] when I do my next round
> >> of merges. I'll leave this up to Huacai Chen and WANG Xuerui,
> >> let me know if you prefer to merge it through the loongarch
> >> tree.
> > I'm happy that this series be merged through your linux-arch tree, but
> > if it is better (I'm not sure which is better) to go through loongarch
> > tree I can also merge it later. However, I have some comments about
> > this version. :)
>
> I would prefer the soc tree, and will just apply the
> patches from Yinbo Zhu directly this time as I already
> have them in my queue. If there are more than a few
> drivers/soc/loongarch/ patches in the future, maybe you can
> pick them up into a separate branch and forward those
> to soc@kernel.org.
>
> Note that I have two separate roles here: I have the
> asm-generic tree that I maintain for patches to
> include/asm-generic as well as the occasional new
> architecture review as I did for loongarch.
>
> The other one is the group maintained soc tree that
> is mainly for Arm device tree files, but also contains
> soc specific code (arch/arm/mach-*), defconfig files,
> drivers (drivers/{soc,firmware,memory,reset}). This is
> now extended to arch/riscv and occasionally other
> architectures as well, so drivers/soc/loongson fits
> well in here.
OK, then let this series go through soc tree.

Huacai
>
>      Arnd
