Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E98F68
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 11:06:26 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id A8A1232009C6;
	Wed,  9 Nov 2022 06:06:24 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 09 Nov 2022 06:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667991984; x=1668078384; bh=7EtEuasKtz
	gHPyKddnd98hdfKnY3Ul52iMZK3itGMBM=; b=NwH9j3uMaT9uJG5crR0zT5aH3H
	7pIJpkCIK4lmdtSKT8UvFsABfDXpmQoqu79XteY6BN+86Bq7WeP/JIyB9geAFb7P
	t09n5UkkGJKE2VbjaWiiBdMNfpbks4kNy7Z08HjY7kCRD5NeMwRD3Zg90bGI25xt
	WyCvRIv51oTcZn373Qrwc/9efGfBwcUG+G2tOwrYnRfOwoLuNwD32858SjJ2/BBK
	UL/pwzTqvYLy1OKdE7VbURaKlLEKKA9HbHC0ltaJPRopsqfrT4IRkWaUBo3tmpGL
	5qbzlRMmJiv8iS2cLyz3NIhqGqtNFCgklTXC6E7WMk/9ciw49Efib9oaYGVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1667991984; x=1668078384; bh=7EtEuasKtzgHPyKddnd98hdfKnY3
	Ul52iMZK3itGMBM=; b=PlQhlabjWF3u/2WY4/nzCTkmf159M3wAvcHmIFSpfVcJ
	miKTaV8FnK9Njac4PeR1f4g9V2VOSpx/i/t9SxKOdwQwQm/m3NQzlaDRu1qzS1Le
	3eUUqINmb/PMtM3Zf5Wd4KtsGNIaILCw1r8Xa4Q71yzkr78NO2OPxbdoORrMv9ZA
	EXY62hnQidQdQ90748Kp+SPCJYb0gN3ac8oZmcKRlSwxstLu5/eB1AKsIOxDbDm9
	bUwfAgDkPyzbUF/GeNqtNtIiTu3GcdxI19+FHKYtzIVBGN5NH1TsOsBPVzt5+aoB
	aJ9CzDSMXoQzgJ/fepccXs/1OkrhtWglhF7TFHipNQ==
X-ME-Sender: <xms:rolrY6y0gceKdOg7BHwcN-0n4Vchk6D0O4UDkR8-vuIRZzjS6WB2vA>
    <xme:rolrY2SREnls8gHeAau0n4XIVS_may2hdSmvwKA2rIRSqvY-cj9XcgqFbCcbgp3HZ
    nmmQxQlCg-meYim3PE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:rolrY8UXGPNnF4IBacEp9Frpn3pMXoQ7bgj2W4zK3AeJoO0f8ue4uw>
    <xmx:rolrYwiJHCssdBZEKftCUyGWPMpw45H-NH8GuNqNeTK-Xwf8Ik7bDQ>
    <xmx:rolrY8BM530kKtQZUDiRW1_Eeh0ndq7eb_s4eBWTfOiPEUrtSQdO6A>
    <xmx:sIlrY0ZVFCcgN7nkzd9ON27EYuQG0pEtomcWUmy3BV64eFUCZXTTMw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 611EAB60086; Wed,  9 Nov 2022 06:06:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <574d58b2-0e9a-4fa0-84a8-caf39a9bc37a@app.fastmail.com>
In-Reply-To: 
 <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
References: <20221104024835.3570-1-zhuyinbo@loongson.cn>
 <57c9f565-e75b-0c8f-fdce-9dc8c334d50f@loongson.cn>
 <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
Date: Wed, 09 Nov 2022 12:05:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Yinbo Zhu" <zhuyinbo@loongson.cn>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Cc: "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Hector Martin" <marcan@marcan.st>, "Lubomir Rintel" <lkundrak@v3.sk>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Hitomi Hasegawa" <hasegawa-hitomi@fujitsu.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Brian Norris" <briannorris@chromium.org>, "Sven Peter" <sven@svenpeter.dev>,
 loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, soc@kernel.org
Subject: Re: [PATCH v6 1/2] soc: loongson: add GUTS driver for loongson-2 platforms
Content-Type: text/plain

On Wed, Nov 9, 2022, at 11:15, Linus Walleij wrote:
> On Wed, Nov 9, 2022 at 11:03 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>
>> Hi maintainer,
>>
>> This patch I had verified that base on mainline 6.1-rc3 tree, it is
>> okay, if no other issue, please you help me merge it to upstream.
>
> Aren't these loongarch maintainers listed in MAINTAINERS able to
> merge this? Certainly Huacai can merge stuff to drivers/soc as
> need be. drivers/soc is a bit shared between different archs.

I'm generally happy to keep an eye on stuff in drivers/soc/ across
architectures and merge it through the soc tree, especially for
new platforms, but merging this through the loongarch tree works
as well.

Since the driver was already sent to soc@kernel.org, I can
simply pick it up through patchwork[1] when I do my next round
of merges. I'll leave this up to Huacai Chen and WANG Xuerui,
let me know if you prefer to merge it through the loongarch
tree.

    Arnd

[1] https://patchwork.kernel.org/project/linux-soc/list/
