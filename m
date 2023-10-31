Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003B218E11
	for <loongarch@lists.linux.dev>; Tue, 31 Oct 2023 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="pMKLK08K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="my63bWY7"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 8F1903200A85;
	Tue, 31 Oct 2023 06:00:09 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 31 Oct 2023 06:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1698746409; x=1698832809; bh=zy3d22Xx9MRE6ZrJA2+1C3ACKZHE8r/2+Yw
	y56bYQMQ=; b=pMKLK08K/5fcHWfKZiN/rNdxJZpFkYTJon0Pe+MeTKGd4dsdx/t
	A73gM7E4X7FNU0b6PAaflaYEbch5gaGVuJg9o1OqSXkstfNWfhNfIpS/5w1Oc8uZ
	2T6YyANNlLWacnFN33dmcJivpkYTgRAaLY3QrecF3MEjRuLEc5i49RmGvYmGZpt6
	MLngdWIPZ5WXAMrNvVoe+oNipHJJppKVHl7KtzkuEtceoczoEKYI+2iC8CzA9qoZ
	DPaOLS/Nf9ubFYE3497PY94rKFHxJk2wW6xJrm74tXgcVvn0g2UY4nzr2qSoEp/G
	k+KvN/gBVfbLABugfWSBTpZB8TX6nrUSe6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1698746409; x=1698832809; bh=zy3d22Xx9MRE6ZrJA2+1C3ACKZHE8r/2+Yw
	y56bYQMQ=; b=my63bWY7eIBRQwSJf07uzAfJF0h5y5TqAP5AnI5nWk/39qmV0a9
	lXxesY1cfpPUOj3vN/jzK6kk7iy/7aKL8qrD7MZh6oScAPmzn/aFd4g1zorinxua
	T3qBtOHU5MSJaenLi+UzrzB6T+XDJ8dZGjVmt2JCvZ16QmbwG8+HRcCSKqi0X5QP
	3C5z6JREBtDJ0NEu5bP1l+WJLeXrWJvPNRXkuO7BF6l/XIEWmdqCyCOz92kesPh6
	HcYYDZhxNzp5WTEsw+5kidrgOZfrsbEbnkHq10hYW5pBsLkRJFjKqpwEuwrn7rIF
	O/ICIGJT0FyuGkHZkPyAYYG8RW7u23a3hxA==
X-ME-Sender: <xms:KNBAZbQyt_x948R6OvDOsPaKvYeut-mDEqq4iBmXC0Pzt-EHyQuW2w>
    <xme:KNBAZcxqdE9WKPx_nP4qRMvW3S2JOL2pAzRfV9ToUGD7jdMARqPuVaiYFYaZWWhc7
    r8Vhrn_DeDO2FYBgiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtvddgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekleevffehtdeigfekfefhffdtudffvdeuvedtffet
    heeuiefhgfetleekleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:KNBAZQ0Z9b9Oy80kVk6mXl3bv-Nr34y0twv-He7r8n8ia66s8S6BBA>
    <xmx:KNBAZbDEvJIOasQC0STcvszz0nwFehhBX-4A0mqpjm5vnADYou9ReA>
    <xmx:KNBAZUijmUG4yHI6WcqZIrBvXkT7_pnkpObsPA38wE3BomfhSLu0Pw>
    <xmx:KdBAZTTrxq4RgteKMAQWNRkoOprWtbcxxiqxZUyjClEFUBLdkSCIIA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7254036A0075; Tue, 31 Oct 2023 06:00:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <7cb0bf4b-ca0b-4c3e-b965-4e8cd7a805e6@app.fastmail.com>
In-Reply-To: <cover.1698717154.git.zhoubinbin@loongson.cn>
References: <cover.1698717154.git.zhoubinbin@loongson.cn>
Date: Tue, 31 Oct 2023 09:59:48 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Binbin Zhou" <zhoubinbin@loongson.cn>,
 "Binbin Zhou" <zhoubb.aaron@gmail.com>,
 "Huacai Chen" <chenhuacai@loongson.cn>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: "Huacai Chen" <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 devicetree@vger.kernel.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Jianmin Lv" <lvjianmin@loongson.cn>, "WANG Xuerui" <git@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] dt-bindings: interrupt-controller: Fix some
 loongson,liointc warnings
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82023=E5=B9=B410=E6=9C=8831=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8A=
=E5=8D=882:36=EF=BC=8CBinbin Zhou=E5=86=99=E9=81=93=EF=BC=9A
> Hi all:
>
> Some liointc-related DTBS_CHECK warnings were found when trying to
> introduce the Loongson-2K DTS{I} for LoongArch.
> This patch series attempts to fix those warnings, as well as fixing
> non-standard property naming.
>
> Of course, these fixes also apply to MIPS Loongson-2K1000/Loongson-3A
> dts{i}.
>
> Thanks.

For the whole series:

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Apologize for the bad design at the first place :-(
You tried really hard to get it fixed.

Thanks
- Jiaxun

>
> -----
> V3:
> patch(1/5):
>   - new patch, 'loongson,parent_int_map' renamed to 'loongson,parent-i=
nt-map';
> patch(2/5)(3/5):
>   - Separate the change points into separate patches;
> patch(4/5):
>  - new patch, make sure both parent map forms can be parsed;
> patch(5/5):
>  - new patch, fix 'loongson,parent_int_map' references in mips loongson
>    dts{i}.
>
> Link to V2:
> https://lore.kernel.org/all/20230821061315.3416836-1-zhoubinbin@loongs=
on.cn/
>
> V2:
> 1. Update commit message;
> 2. "interruprt-names" should be "required", the driver gets the parent
> interrupts through it;
> 3. Add more descriptions to explain the rationale for multiple nodes;
> 4. Rewrite if-else statements.
>
> Link to V1:
> https://lore.kernel.org/all/20230815084713.1627520-1-zhoubinbin@loongs=
on.cn/
>
> Binbin Zhou (5):
>   dt-bindings: interrupt-controller: loongson,liointc: Standardize the
>     naming of 'loongson,parent-int-map'
>   dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check
>     warning for reg-names
>   dt-bindings: interrupt-controller: loongson,liointc: Fix dtbs_check
>     for interrupt-names
>   irqchip/loongson-liointc: Fix 'loongson,parent_int_map' parse
>   MIPS: Loongson64: DTS: Fix 'loongson,parent_int_map' references
>
>  .../loongson,liointc.yaml                     | 44 +++++++++++++------
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  |  4 +-
>  .../dts/loongson/loongson64c-package.dtsi     |  2 +-
>  .../dts/loongson/loongson64g-package.dtsi     |  2 +-
>  .../dts/loongson/loongson64v_4core_virtio.dts |  2 +-
>  drivers/irqchip/irq-loongson-liointc.c        |  7 ++-
>  6 files changed, 41 insertions(+), 20 deletions(-)
>
> --=20
> 2.39.3

--=20
- Jiaxun
