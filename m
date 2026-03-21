Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F953019DC
	for <loongarch@lists.linux.dev>; Sat, 21 Mar 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774093597; cv=none; b=Tn8vE8g44EAXhxLeU1NS3dDJy5Ww7jMCQU76SOa2QGaZMNgTbkIl/4jy6FsGCYwPcczklM1dUxaBl6QqKjy4VKc8ybl/wlA82FYM+VKfHzZerfmMHMDqwMt5SaizM54WFSyQur3+hux3mAvTT5zD3ZZZ/xKr1DnqwQ9WKUbwl3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774093597; c=relaxed/simple;
	bh=bztXV4euuPrhRT2ssHTIluQzRVGTAJjq9VmInF4hpTU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=scytPenQU9sWwiIeDajNcP8FeNFFHQg84xBCtFz6u6lq/LWpY91yCt/AOfdT7b86mIylwUTzn6fsKzpeRRw2ooqdhP2oAYVmrYc7zWgtfkxnyh4ebSn6B+iJeUrOD5QlI/NkYBwrDcenj4ncEzVj78CN2zi4j3e6cc5jTTk5I8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=vHAyyWtX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kAUUtRgg; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="vHAyyWtX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kAUUtRgg"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 149491D00156;
	Sat, 21 Mar 2026 07:46:35 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Sat, 21 Mar 2026 07:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1774093594;
	 x=1774179994; bh=e7e4Se+PfjWD7DOyw/X91rALDV7hJ0KrQaseFUWVQgs=; b=
	vHAyyWtX0UqGQnj16ggZX6bt0eX74BoOuMb+XpEGZor64mTEVVQXAgrk9ioiNyuq
	HHg4EmHO/QTDegb7RsIbFGn47b9aDIj6HET4abye4OA9lVA8m7V8bENL7SQUeaHm
	liGv6fAWXEcANkpXVs4tVuOvmMN0183pkjvYEWULVgv3FtogKSLfhtNfkKsJV4Wp
	iTYHZpqH5/d9LnfuYM9zhAsoAbJC8AIQ9BC9Ocv/KQhSGsW45XpxyzEj0vqmObf4
	AMlm+pnnkjBb6DK3OpUjmMpAlgR1Iv8ExrGUn9IJnCWMEAvg+Tnma0yD46nHZdx4
	6i7FyYD/6oVsYuT5BWXbeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774093594; x=
	1774179994; bh=e7e4Se+PfjWD7DOyw/X91rALDV7hJ0KrQaseFUWVQgs=; b=k
	AUUtRggc6LCBuOnkjvPDth6FE8Vq6XNISyE12G5J3nQ/heY3O7kt9B17vKItMsiv
	wTGLEE2pDm3ugGip4o/sisK9FjjdEL/cCvB7ctzNAB1x51nLx0JZVRwtxrHSd+O0
	n/lkaT21pUpt0JdhRjuqqjB5f2gKFe0sGaO1/AF00FMCNNwN0tH4hvwiqA3PVOzQ
	UR20x8yCsbOlz/XUyEwVzKqftYNt4m1iWFZ5prekrxSwdyzzVvjHqu5oUo1aELoN
	Edvll+9ivkHBZUiD4Lne36gLEKHSOrDe4fNe0/rDT10rhR6V1d2VlS+ukPIBVYEz
	o/fc23O4rmYzO8CXJTSvA==
X-ME-Sender: <xms:GoW-aTQiv7u021WEIWEcKyhn_eE2Lx-4f_NHhVekiwzr6WnHTHp6xg>
    <xme:GoW-afkbmySIDvyjwr7x6-cWtJMlyFyXKiVLd_d7r6TF0e6_56liFPdkFxtGY0VmP
    J1ymLBsuwRxNwFhynMMMqA4bRu3BSJJU6THWv7ROU8_XbcTN8uVa_Ce>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddvjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnug
    esrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepuhifuhesihgtvghnohif
    hidrmhgvpdhrtghpthhtohepiihhvghnghigihhnghgurgesihhstggrshdrrggtrdgtnh
    dprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhonh
    hgrghrtghhsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:GoW-afXrO5aCGGk3sE5evmF7ZyTXf5ataKg4QHBpzH4DRvdhK7BauQ>
    <xmx:GoW-aYAICP2YFXjoOTjkovh-ovaU9vOXePb1M_4H36tRB7scwcEefQ>
    <xmx:GoW-abIO8ip4cklICkyBjlcWDA4xoqYfgayOP80VaxYq8z5s1RxTjQ>
    <xmx:GoW-aWv97QDauatGmf82XB1LR0fd_84NTe_RZTnlngxk1IcBmjYhRw>
    <xmx:GoW-aX--qOnht7nj8RuzBvBD1cCRVjbCBJiGiim6hH2I72GK8JJ_s4AP>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BDE772CE0072; Sat, 21 Mar 2026 07:46:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A59YFox_m8Ms
Date: Sat, 21 Mar 2026 11:46:13 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 "Thomas Gleixner" <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Xuerui Wang" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Icenowy Zheng" <uwu@icenowy.me>, "Yao Zi" <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-Id: <e2d1afb3-d137-4795-9bc3-e08711a767e5@app.fastmail.com>
In-Reply-To: <20260321092032.3502701-7-zhengxingda@iscas.ac.cn>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
 <20260321092032.3502701-7-zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v4 6/6] irqchip/loongson-pch-lpc: Enable building on MIPS
 Loongson64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sat, 21 Mar 2026, at 9:20 AM, Icenowy Zheng wrote:
> As the driver can now support OF-based platforms, it's now possible to
> use it on MIPS Loongson64 machines.
>
> Drop the requirement of LOONGARCH for this driver, to allow build on
> both MIPS-based and LoongArch-based Loongson systems.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>  drivers/irqchip/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index f07b00d7fef90..f2eee2bd61dd0 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -761,7 +761,6 @@ config LOONGSON_PCH_MSI
> 
>  config LOONGSON_PCH_LPC
>  	bool "Loongson PCH LPC Controller"
> -	depends on LOONGARCH
>  	depends on MACH_LOONGSON64 || LOONGARCH
>  	default MACH_LOONGSON64
>  	select IRQ_DOMAIN_HIERARCHY
> -- 
> 2.52.0

-- 
- Jiaxun
