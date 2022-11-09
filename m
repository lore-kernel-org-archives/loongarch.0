Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF2129B2
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1668002431;
	bh=Ews65r4y2x+UHZvJJk7wXKfdlpp6YZLRGLLHPu4DZpc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ha4gxdm9cLM96VCWy6RWfDZcLShBR/G6OaDedILXBox2ZNKSkyb80M8GOB6NreAu3
	 qUlREHCsR3QCxqJpB12pz42N/MUaf1ycUm73nGHFeV+kSfKlHxPI9xodCmqHmp7tmH
	 5zX85FGHc05xFuPwbSlnh0D+JTTcQE5rHOIfYIpA=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B1BEE66883;
	Wed,  9 Nov 2022 09:00:27 -0500 (EST)
Message-ID: <80accd6a82d35902c08acbafcd10426b81d15bec.camel@xry111.site>
Subject: Re: [PATCH v6 1/2] soc: loongson: add GUTS driver for loongson-2
 platforms
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Hector
 Martin <marcan@marcan.st>, Lubomir Rintel <lkundrak@v3.sk>, Conor Dooley
 <conor.dooley@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Heiko Stuebner
 <heiko@sntech.de>, Brian Norris <briannorris@chromium.org>, Sven Peter
 <sven@svenpeter.dev>,  loongarch@lists.linux.dev,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org, soc@kernel.org
Date: Wed, 09 Nov 2022 22:00:26 +0800
In-Reply-To: <CAAhV-H4mpNp6wEGY0xOJgf5Kjm1EKXBUZdSKoGeacN5_CVuxtA@mail.gmail.com>
References: <20221104024835.3570-1-zhuyinbo@loongson.cn>
	 <CAAhV-H4mpNp6wEGY0xOJgf5Kjm1EKXBUZdSKoGeacN5_CVuxtA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2022-11-09 at 21:57 +0800, Huacai Chen wrote:
> Hi, Yinbo,
>=20
> On Fri, Nov 4, 2022 at 10:48 AM Yinbo Zhu <zhuyinbo@loongson.cn>
> wrote:
> >=20
> > The global utilities block controls PCIE device enabling, alternate
> > function selection for multiplexed signals, consistency of HDA, USB
> > and PCIE, configuration of memory controller, rtc controller, lio
> > controller, and clock control.
> >=20
> > This patch adds a driver to manage and access global utilities block
> > for loongarch architecture Loongson-2 SoCs. Initially only reading
> > SVR
> Replace loongarch with LoongArch.
>=20
> > and registering soc device are supported. Other guts accesses, such
> > as reading PMON configuration by default, should eventually be added
> > into this driver as well.
> Replace PMON with BIOS is better.

Or just "firmware"?  I remember Xuerui (or another guy?) has said
"nobody should use the term BIOS for non-x86 platforms in 2022".

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
