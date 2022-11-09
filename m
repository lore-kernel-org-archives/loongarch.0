Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F362829B2
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 13:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09D1C43144
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668001829;
	bh=JXJE+UkmxV/bEoK+uDW9006jORQJ6AVu7BducFdKokk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tF7+ZmNOfln4m/+FDBXatx8F2MNUJJPW+L+WrcgZb4jLosZ+hqq7RD5lHud+FhbeU
	 nxwKVESIke+d9kWcHzHOVcDRNAvrpwBWNWP3kl1Z3MreMjEb5GIz/7IU5XuZGfa/FH
	 41EguDBiL9K+/LGs0/UFXaBP1oD9TrQdo028zJgvYdau8DQrlcqjQPh5AKCBWBUTwy
	 ZtXaaxBGBFoX0+AafOq7tMn9o1zw/aoXiDrasi/Pjmy108UQDzf1CNOQsazxx4Wyvf
	 aCuChwx88BcryvJ5x8Tk4RCGEY/i64YI1WHeo1WY2fYx6VB56hJzy4IU+EKgTa0i8Y
	 VoMsDXGHggtsw==
Received: by mail-ed1-f54.google.com with SMTP id a13so27384061edj.0
        for <loongarch@lists.linux.dev>; Wed, 09 Nov 2022 05:50:29 -0800 (PST)
X-Gm-Message-State: ACrzQf2AwphtB9Pf5iaBgIovSW9YcBDRVE9w60a+1VzCD4BM22IpXjpM
	DOcAEVUYRLz+JcZLIpj+ib3M6GMCAU6QVXycpFs=
X-Google-Smtp-Source: AMsMyM6WLv9p7Gte5mzlDRVJrE+UDbKXhAeueZxYrQyvYD6S6210FLztfuk5bbTlDxCYRqdHLsIcRZg2wsPnYeJiNhs=
X-Received: by 2002:aa7:c913:0:b0:462:e375:a1fe with SMTP id
 b19-20020aa7c913000000b00462e375a1femr59877700edt.156.1668001827731; Wed, 09
 Nov 2022 05:50:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221104024835.3570-1-zhuyinbo@loongson.cn> <57c9f565-e75b-0c8f-fdce-9dc8c334d50f@loongson.cn>
 <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com> <574d58b2-0e9a-4fa0-84a8-caf39a9bc37a@app.fastmail.com>
In-Reply-To: <574d58b2-0e9a-4fa0-84a8-caf39a9bc37a@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 9 Nov 2022 21:50:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H64s-2gNMd0-F21kUzieh5G-MbBnA0k6J8EP2_7SpevaA@mail.gmail.com>
Message-ID: <CAAhV-H64s-2gNMd0-F21kUzieh5G-MbBnA0k6J8EP2_7SpevaA@mail.gmail.com>
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

Hi, all,

On Wed, Nov 9, 2022 at 7:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Nov 9, 2022, at 11:15, Linus Walleij wrote:
> > On Wed, Nov 9, 2022 at 11:03 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
> >
> >> Hi maintainer,
> >>
> >> This patch I had verified that base on mainline 6.1-rc3 tree, it is
> >> okay, if no other issue, please you help me merge it to upstream.
> >
> > Aren't these loongarch maintainers listed in MAINTAINERS able to
> > merge this? Certainly Huacai can merge stuff to drivers/soc as
> > need be. drivers/soc is a bit shared between different archs.
>
> I'm generally happy to keep an eye on stuff in drivers/soc/ across
> architectures and merge it through the soc tree, especially for
> new platforms, but merging this through the loongarch tree works
> as well.
So drivers/soc is similar to drivers/platform that can be merged
through corresponding architecture trees?

>
> Since the driver was already sent to soc@kernel.org, I can
> simply pick it up through patchwork[1] when I do my next round
> of merges. I'll leave this up to Huacai Chen and WANG Xuerui,
> let me know if you prefer to merge it through the loongarch
> tree.
I'm happy that this series be merged through your linux-arch tree, but
if it is better (I'm not sure which is better) to go through loongarch
tree I can also merge it later. However, I have some comments about
this version. :)

Huacai
>
>     Arnd
>
> [1] https://patchwork.kernel.org/project/linux-soc/list/
