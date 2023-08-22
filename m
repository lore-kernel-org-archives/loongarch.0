Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB61EA5
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 01:04:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 74037580B0C;
	Mon, 21 Aug 2023 21:04:09 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 21 Aug 2023 21:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692666249; x=1692673449; bh=qh
	2CEBnXfgbEiktWUfRJjND/5Zat3Dd90949X0OO51Q=; b=H/HSy01numTud2NhfV
	iwYgxWNVHTY7qmQo2LJUW/vLLjoZoXpmIt/7C1aA7YOzJsjziV6twMQVydM8Ihd5
	YgEKlFt6JxGCF5zx7tRVwP0E/vqK2EnqmssDd5tzEAyQ9cJmxBoM3FNwFhJGAz/7
	IgR2DxPGEDaskpggR08r28NCSaxyAO1yGUK/jCq4BGsrgQGY4P8JOohdOnBrXAxV
	TQ+Btl6lHiCGpLCOjvBcCOqFYyzfamVZQ++ZMCgH3dCzBk7C/3JFr7V5NDoa95kn
	xPIVmwcjW8fXjok0rtIYeOVPY3Pnr1wNvJhq3zyDw1vSNl5rN5dV6vNoMebQ1+f/
	bQCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692666249; x=1692673449; bh=qh2CEBnXfgbEi
	ktWUfRJjND/5Zat3Dd90949X0OO51Q=; b=O7SKG7KQHhG7tXidrMdNKr+WyRw0t
	dkXpvWRFazxtDK4PomrIPwyM+9S6Ub5Ip/ZQ5nbl4LiqOiA58oeofiuJEM5gLS7P
	2gms/5u+Jd4pHfbWLGzdZA+LsS70aaBvYVMztjRIaHz2z77hszu3t62LgSxbtcgc
	SNjNh+cnq/DasFADiC21yL38GEC8zRF+xLlie+6wtXPbFsioaofYWEpJFnRCoY4W
	oiMOTg2E3Xrla8abD+izeZtcGiXNELBD7OXDa8tClxNeI8MQJJwx5fHqIGAe2xYd
	+UUagAfkST6p85heilhUhwZ9Ee6Fmm6A5BIkAj2mVMTuZrJ+mDN2Zl3RA==
X-ME-Sender: <xms:iAnkZJ9YK-iCxdeJWVdDS90L4ZuIv0_9bOkKmqOprzMBbmOoI9QCvg>
    <xme:iAnkZNuxnai4KRWbLirda7qYBUMv_U3BrFXcweu7_Cv9-WuQDpBkNOg9fV9JeHTZ5
    UCnN3T00ZAYnUzrCzY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvtddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:iAnkZHDUM1Bt3-3KTwZiB6I0MfHCZMUbT167o-q7vvB1YTcHYTUnYw>
    <xmx:iAnkZNd_EfM-meaNWCblZxXKJxVn41Tb1LEUysNtibp1mboCRTmyFQ>
    <xmx:iAnkZONcxr99azeIyV0m47kJAkNUzMS9ouiavhmzoesUd0xjggimQA>
    <xmx:iQnkZKm8VF6a4MKJf9NNVNHXWrv_lKptknMxkDw0SYz6jFizNlOZOA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 62E01B60089; Mon, 21 Aug 2023 21:04:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-647-g545049cfe6-fm-20230814.001-g545049cf
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <556a5e72-4001-4d28-affb-831f5c8f9e26@app.fastmail.com>
In-Reply-To: <20230803063703.5659-1-zhuyinbo@loongson.cn>
References: <20230803063703.5659-1-zhuyinbo@loongson.cn>
Date: Mon, 21 Aug 2023 21:03:48 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yinbo Zhu" <zhuyinbo@loongson.cn>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org,
 "Ulf Hansson" <ulf.hansson@linaro.org>
Cc: "Jianmin Lv" <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
 "Liu Peibao" <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn,
 loongarch@lists.linux.dev, "Liu Yun" <liuyun@loongson.cn>
Subject: Re: [PATCH v6 0/2] soc: loongson2_pm: add power management support
Content-Type: text/plain

On Thu, Aug 3, 2023, at 02:37, Yinbo Zhu wrote:
> Loongson-2 platform support Power Management Controller (ACPI) and this
> series patch was to add PM driver that base on dts and PM binding support.
>
> Change in v6:
> 		1. The patch "[PATCH v3 1/3] loongarch: export some arch-specific
> 		   pm interfaces" had been merged into mainline tree in v6.5-rc1
> 		   thus this v6 series patch need drop it and need depend on it
> 		   and it's patch link was:
> https://lore.kernel.org/all/20230615091757.24686-2-zhuyinbo@loongson.cn/
> 		2. Adding Ulf Hansson to Cc.
> 		3. Adding soc@kernel.org to Cc.
> 		4. Keep indented with one tab +2 spaces in Kconfig help text.

I talked to WANG Xuerui on IRC, and he was able to clarify some of the
missing bits of information for me, after which I merged both patches,
even though my concerns are not fully addressed:

- I still think that branching into ROM code from the kernel is a mistake
  and we should have never allowed that as an ad-hoc interface in the ACPI
  variant to start with. It's hard to change that now though, and having
  a DT interface to access the same entry point does not really make it
  worse. This might need a redesign for future firmware though, to have
  a proper runtime interface

- The bigger problem I still see is the DT-enabled boot with PMon without
  the UEFI firmware. This does not impact the DT binding, but I would
  consider all non-UEFI booting firmware images broken and not supported
  by the kernel, as we originally discussed when merging the kernel.
  These should still be fixable by upgrading PMon to a UEFI-enabled
  version.

     Arnd
