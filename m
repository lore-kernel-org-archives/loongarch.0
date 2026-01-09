Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBD32F4A19
	for <loongarch@lists.linux.dev>; Fri,  9 Jan 2026 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961427; cv=none; b=agLvkKqiCMkddct3zxZ8ZQyE4FebsLRsHDGeXshDEMtwYjVxunf2sDvaAbEN6O7tsQ8OQK1ZwYLsmGi0gIATUGrL+tpWaZH9K2GnxI8o5/4RalHXrj3aqNjmbyEqabun3Y5UZb78wm490ua+BDvprZEN7R98M3pHgC9J8iicXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961427; c=relaxed/simple;
	bh=6fsWm23aFipLTeeCxjFW6duv8rFkLtYf6/0aMTkaATA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YNrtb8dCqU9LUNS+XXcuxkap+0tYvrl3klBlY/SD0ofWvtJXFrmuh0/gConEga/xK7Dfmpb7+zgdiU7546dfEZmcsJrpRVka7UhiPsoqrjjc5NAagxymlDiHFakAsH1s5eI+sl4QMb2oyQrBnpnhR1i6u354x4EeKFZfH6prTTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=tvWLIlfw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ygIErW7o; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="tvWLIlfw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ygIErW7o"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7E9C37A0163;
	Fri,  9 Jan 2026 07:23:45 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Fri, 09 Jan 2026 07:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767961425;
	 x=1768047825; bh=xVgBe4ZzKjzIgLuNqi1RVipDOZIEChNX55kA0PFF52w=; b=
	tvWLIlfwzWQmc8SpOY1CuM/y35AacAtleY/C/IUq4Kd0uN84TCgaAKDwq3lkEDDZ
	abJwsHhl8UBHbe2nHe/lx2PNE5fPzXOqk36P2eglK5Kq7bZGU9JnTgUyzqS493V8
	nJoi5nsIx0vRTXLJpAiS8qVWyc0tA8ybiw8J2iLsEUE0VEDViLxhSkZFH/zwVFtD
	2PIaGPgpDt9e4mE/FKl1Z92sMjnQxjkHzgZaa2YuhK6/pwFJRXX1JcONBB/xtBO6
	i00UifJF+zK/mO0X3GgNgXO9vy5zw5KrQX0A6h1x+Iix/qlyGtVmUO0z5p3T7ltV
	IxNT/aKrOxF+wYIitNK5rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767961425; x=
	1768047825; bh=xVgBe4ZzKjzIgLuNqi1RVipDOZIEChNX55kA0PFF52w=; b=y
	gIErW7ocsBPgMwCh343nG9Vh5+mHSNg9V3OxxqjWvrC4gI3ZeeX2baJh74ehvsTV
	vED58G6Y4IGuB/2NpXiP/sXPyjlTz62hjRWR+KAxm8bCSc3Fam07FKkuihwwyhaA
	oPR6XQaZ6RWnhuaW1y8Jr949DKEU3UQT63NBb1Ll+ZYzW+zfnbSlfX0cxrT4ym0y
	waXkLTvQAov9KK5KkI2o37zC31F4BjY8qNOWJf7UWg0ANIWcF+Q7rJ054Juu4hO6
	nhCXpTo2gzu4gNbBPxYWCbvwynX2dinstxXUuwiqSUp4PfaUkO3n5/RXzIG9ivhr
	SccWwQBeFKdFnI1iHdYiA==
X-ME-Sender: <xms:UfNgaZwujiNYH5pMxMjrpZFNc9-EQ8FsEnWh0kIitTQnsNoiFM8OTA>
    <xme:UfNgaUHUyPxmw8AmPnmXWyEUX5w7gjUyuEZKUPd03mdXZylq7l8IKMqmQeN0XpHKI
    jgaqnmSzUX3vl6Wov561patZ6gjPQVKD9kdZhhVnKAKDKHCcgq__S_D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdekkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhvghnhhhurggtrg
    hisehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlohhonhhgrghrtghhsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheptghhvghnhhhurggtrghisehlohhonhhgshhonhdrtghnpdhrtghpthhtohep
    lhhigihuvghfvghngheslhhoohhnghhsohhnrdgtnhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UfNgadz2F42FmP_EeacXa_iExDI0gMm_X0TKPlWM2ry2esZ74VnDZQ>
    <xmx:UfNgaYPi_YQNSPV8ACLD6e8hXfscKi1UGAbKrPbpaGeLFm_Tbi6AYQ>
    <xmx:UfNgaWWaZzJikI5sV6vKOb20Z24XbLzUBz-SjiNDhM-ZJuDfKnRBCg>
    <xmx:UfNgaU1_vXTbGsLkB06IhsXPRZNk8vO-ag7dQ8L5UneLf8joosxUAA>
    <xmx:UfNgadB-oFQNgH0YNIniz7FiH-x766Um1Pq3owoa_utUYVfMChLmi6Z9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E99B22CE0072; Fri,  9 Jan 2026 07:23:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AWDk16gtyiWw
Date: Fri, 09 Jan 2026 12:23:23 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Gleixner" <tglx@kernel.org>,
 "Huacai Chen" <chenhuacai@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Xuefeng Li" <lixuefeng@loongson.cn>, "Huacai Chen" <chenhuacai@gmail.com>
Message-Id: <57748542-d86e-4528-bea3-8f8d8f1abbed@app.fastmail.com>
In-Reply-To: <87bjj3rnra.ffs@tglx>
References: <20251223080437.3367240-1-chenhuacai@loongson.cn>
 <20251223080437.3367240-2-chenhuacai@loongson.cn> <87bjj3rnra.ffs@tglx>
Subject: Re: [PATCH 1/7] irqchip/loongarch-avec: Adjust irqchip driver for 32BIT/64BIT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, 9 Jan 2026, at 12:09 PM, Thomas Gleixner wrote:
> On Tue, Dec 23 2025 at 16:04, Huacai Chen wrote:
>
>> csr_read64() is only available on 64BIT LoongArch platform, so use
>> recently added adaptive csr_read() instead, so as to make the driver
>> work on both 32BIT and 64BIT platform.
>>
>> BTW, make avecintc_enable() be a no-op since it is only needed by 64BIT
>> platform.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> I assume Jiaxun is the author, which means that this lacks a
>
>   From: Jiaxun
>
> line in the mail body before the change log starts. Please try again.

Yes, Huacai could you please get it fixed?

>
>>  static inline void avecintc_enable(void)
>>  {
>> +#ifdef CONFIG_MACH_LOONGSON64
>>  	u64 value;
>>  
>>  	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
>>  	value |= IOCSR_MISC_FUNC_AVEC_EN;
>>  	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
>> +#endif
>
> Can't this be:
>
>       if (IS_ENABLED(CONFIG_MACH_LOONGSON64))
>
> which is preferred over ifdeffery?

Sadly, iocsr_read64 symbol is only available on 64 bit systems,
so it must be guarded somehow.

Thanks

>
> Thanks,
>
>         tglx

-- 
- Jiaxun
