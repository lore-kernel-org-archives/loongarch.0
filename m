Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB1A847C
	for <loongarch@lists.linux.dev>; Mon, 14 Nov 2022 20:09:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 9B0CA5C01C0;
	Mon, 14 Nov 2022 15:09:38 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 14 Nov 2022 15:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1668456578; x=1668542978; bh=LR9Oot9dV3
	p/sGrwT31gG+j2rSTcoLkSED15p73795Q=; b=RUB0ESW0+BaX89e0krEsUsA8CK
	AtInxoM2OwKTrBQgSoo5CfTbwvoUSqrj7Ymk5AYhFFZsKP6LQ8i+meOKeqnHLnzD
	0QPRCcHTe6yetyDdVOApBAV5sHyI2D5Yfgc9sBtmts6qkui+tHWYEOGq8ZgxmyC0
	NK3hve5GjiHRruNtrBkPAPsQinOf/VlwqoGOnbyEtPtuDsQMCZ0kqHw/GxRn8AVN
	gYcl2BgrV7/hQtPns4X7RCQIYPbLKEYXSjcJypnaJ/1ZR1uxsBbZITuXQmcbPJlj
	BRRkTft6f9xDzmoMgfEAYl9KJ1DMxrsBqBYAQKMLIE/ecz/lnjuJhWNleekg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668456578; x=1668542978; bh=LR9Oot9dV3p/sGrwT31gG+j2rSTc
	oLkSED15p73795Q=; b=kYinAXvfb+bPRrjG7hkwa9rTdjFzIj9MOLKIheleg5zx
	doSjGVh9eCju4S4p/HNIxH4RYpCshd6tJvUpT+1cr3nfmDVZhbrtWSOMCVnl6adM
	ZYkAarikNUPtlET21y7dZkUHRIIQK1denE39eBNhX9zBMwyAMZDs0yEaCGBtuQDK
	Cl25Dm/wdRgiaVApo7ySyrU/BeDgT4ng5AE51/iOBKbQMC18JGeXKw2CiHi9zVjn
	2CC2JwuUqH8KYwPb7+OEneUFzqCcpkWG9X8ZSOwzkG+2U6AfCI1ao0fx5nUtD/vj
	4JaBnMB34YjIq17SLXH0kG695nryUoO3e6qVqDVisA==
X-ME-Sender: <xms:gKByYym7c_GDr5IHfpqCH2cI1U9lt0Hr98AdbpVG2oy1uyNr1kzl7w>
    <xme:gKByY52iLygN_eOjANO3Oyzv2nl99rEkyBVHDzTqzMonAvBpxWZzdWkvKQcJxG2wK
    9XbjhLe7R2FUi2gBS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:gaByYwqjfe79TcWGfeLK01KCJg-5_ksdvP5rBoMGSNgASwWJz9GSAg>
    <xmx:gaByY2nTFKoumcd73d_Clr3Z7bbaSaax-UFKgenDelwPQGvAjlT-yw>
    <xmx:gaByYw0e3k_0RYin8FvbOrTcgUnSzaxFivvpxISivdV6cuwayNp2Hw>
    <xmx:gqByY3s31fBP0SRr3lSBoFnh1H8PTix3wNenZJ8w3h6CMb-9lnPpfw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EB13DB60086; Mon, 14 Nov 2022 15:09:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <b9c0711c-6efc-4d84-af4e-62e585ac2fa6@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H4Y5qHSXr2uHvMYpXMgvm5fU7WQmcALB+86OYkgM1XbOg@mail.gmail.com>
References: <20221027125253.3458989-1-chenhuacai@loongson.cn>
 <CAAhV-H4Y5qHSXr2uHvMYpXMgvm5fU7WQmcALB+86OYkgM1XbOg@mail.gmail.com>
Date: Mon, 14 Nov 2022 21:09:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Huacai Chen" <chenhuacai@kernel.org>,
 "Huacai Chen" <chenhuacai@loongson.cn>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andy Lutomirski" <luto@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Dinh Nguyen" <dinguyen@kernel.org>, loongarch@lists.linux.dev,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Xuefeng Li" <lixuefeng@loongson.cn>, guoren <guoren@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Feiyang Chen" <chenfeiyang@loongson.cn>
Subject: Re: [PATCH V14 0/4] mm/sparse-vmemmap: Generalise helpers and enable for
 LoongArch
Content-Type: text/plain

On Sat, Nov 12, 2022, at 11:26, Huacai Chen wrote:
> Hi, Arnd,
>
> Just a gentle ping, is this series good enough now? I think the last
> problem (static-key.h inclusion) has also been solved.

Yes, this looks fine to me. Sorry I didn't have this on my
radar any more.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I guess the series should be merged through Andrew's linux-mm
tree. Let me know if for some reason I should pick it up into
the asm-generic tree instead.

     Arnd
