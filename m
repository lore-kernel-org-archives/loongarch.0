Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4633A029
	for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 07:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868621; cv=none; b=p1zIyGeOCI9pMVdGo4QRFKOn8BigBJ+Kjdqg5fZydw2p5vwvPgcsUDUS8gvTHBRkxZZzmG99P/eWXJiWxR/7sLzT/orw7eN2u8tWK4V1uUEOyqWfmC/RVnQC1yMxaM0YOElfXIThAUkmpZyMaTYf2UbV2scJF5GTLAHHFqVodrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868621; c=relaxed/simple;
	bh=ghLyK5r4Hrf0z9fctS5+Y+6WIfj+p6fmNmiqUgOzxLs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MpTsrMyh0dfo/i7+XYh1uinY/EEzzSMOg9OBRwdAatnCHcPNC3TUbfZFz6agavaLLJZPBVcGE/66WryqsH7Nmn2tdGBiRwygrhQvxAXoCiy5qEJAFIDAlAjf12ONNpDA527Zik0i5wOr27fxyWetWEBt2Oho+YM1+WjGtK2xZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IpwhuP2a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K8mjlalk; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IpwhuP2a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K8mjlalk"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A88FC14001BB;
	Tue, 16 Dec 2025 02:03:33 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Tue, 16 Dec 2025 02:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1765868613;
	 x=1765955013; bh=AWRNwTo+uLZw5V2gKjOCo89S2Txd1oLsKgsIRS1XhFY=; b=
	IpwhuP2aSyLB1iS0TYogoOKXYhdANRMyKiREq18nEAFzoFwU3tXwGqWtbwCcLJaN
	uj2qZDf3Q8wS6dmCS5nh1Y3mxDwTERHo2GLWt3bwy0sm5zCJ3+Dur7HZpps0/X/c
	ggko2AZrfm7vf51ywM7vL2nK3TJE+LRPcxEX9VUjZtZsLhZ6tXsJW2ZjF5V6bFed
	spu/gjGmhw5fDzL8N1RGoZ2uXD/GQ6djBQrUGUc4j72OhFmMbzlP4vmD3YuqWbH3
	R3F+PTt23hKm3u58aFSvjCCiieUdtvpvasoDLSoVX3P/ufnjiJQsZKZ2cpsNj0aA
	DxntgI0GhAwUnv7E8EcQkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765868613; x=
	1765955013; bh=AWRNwTo+uLZw5V2gKjOCo89S2Txd1oLsKgsIRS1XhFY=; b=K
	8mjlalkkVfGnzcDfAb77DGkwKCgUA5jrQnAlBXQCFsR0knns4J++z5tZod5Bnj8e
	vxYpVWXo4+8pDFS/T14W68Udb5wlDk0+IeiNpKV98bxRk5OMiGMSQjvqJzFk6U37
	H1Jo2GdRE/Hp4opFuDABIboNV9j91lb5JVCMSc5KvGmnhs4gt79EZ5K0HpXN4nhC
	npYbFEQrumGWajiV1ZbPSAUiPs41v9cEKSuKLKl2+4Pjw6aeHtrYILksL4qknA0v
	sve7Loemmx9hxOjalmE7TZlvnExefYn8tsccxk6IiCWtpk7A1o44WUMo3mN5rARD
	JpV4qMKzwVNv71EDNfnJg==
X-ME-Sender: <xms:RARBad1LwjprxLV5J87eolsxLhgi3i9crUcGOkJBElSTQSUBqcluOA>
    <xme:RARBae6uLQadi__14f_X0fYRBCvYvk9RD1njoF3RWp9SehMPvpx7m1PA34_b-RJv2
    7pH_FOOBaTWc37e8x21gyAve63zgjsXNE-YWUz1bsV8PIPWkMk7Lyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefledtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhtefhuddtieegleeuiedttdehheduveffjeettdekvdeuiedt
    udejfeeijeeifeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjvghffhgsrghisegroh
    hstgdrihhopdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegt
    hhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhoohhnghgrrh
    gthheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhesgi
    gvnhdtnhdrnhgrmhgvpdhrtghpthhtohepgihrhiduudduseigrhihudduuddrshhithgv
X-ME-Proxy: <xmx:RARBafeRsu9Qpg2uwQS6-c3TEtdoZZUxN9Nchu0mIIE4DepH7j-glQ>
    <xmx:RARBafRvLZLgDPUvHWX0dvDeB6M_zFCFjYD0T8BQy9ZPPWIZYxAkzQ>
    <xmx:RARBaYY-uFBDwYv0Ex_D6-b9Zbydy3jc0BxvtFIK_RzKujqKWDh4QA>
    <xmx:RARBaSf-j0wBpBiBRW2vz0gU5CIBIDRr8h60px4So-dj9sJXQhd5AQ>
    <xmx:RQRBaSrqT_j0SL7OVrqKwN44X99dPzPZIjFmiuKGere_3NGBryjAvWMh>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D860F2CE0078; Tue, 16 Dec 2025 02:03:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AFIbK4W4Q_gV
Date: Tue, 16 Dec 2025 15:03:11 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Xi Ruoyao" <xry111@xry111.site>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Xuerui Wang" <kernel@xen0n.name>, "Arnd Bergmann" <arnd@arndb.de>
Cc: "Mingcong Bai" <jeffbai@aosc.io>, loongarch@lists.linux.dev,
 "open list" <linux-kernel@vger.kernel.org>
Message-Id: <72168037-f2e1-4107-bad6-ad2efdc6cbe7@app.fastmail.com>
In-Reply-To: <20251215033443.196159-2-xry111@xry111.site>
References: <20251215033443.196159-2-xry111@xry111.site>
Subject: Re: [PATCH] LoongArch: Don't define __ARCH_WANT_NEW_STAT for LA32
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 15 Dec 2025, at 11:34 AM, Xi Ruoyao wrote:
> While on LA64 we had added __ARCH_WANT_NEW_STAT back for technological
> aesthetics reason, on LA32 the newstat family suffers Y2038 issue and it
> should not be used at all, as the commit 82b355d161c9 ("y2038: Remove
> newstat family from default syscall set") has already pointed out.
>
> Fixes: 14338e631afd ("LoongArch: Adjust system call for 32BIT/64BIT")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>

That makes sense, we certainly don't want any y2038 syscall.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!

> ---
>  arch/loongarch/include/asm/unistd.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/unistd.h 
> b/arch/loongarch/include/asm/unistd.h
> index e2c0f3d86c7b..4a7e4a6b6627 100644
> --- a/arch/loongarch/include/asm/unistd.h
> +++ b/arch/loongarch/include/asm/unistd.h
> @@ -8,7 +8,10 @@
> 
>  #include <uapi/asm/unistd.h>
> 
> +#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
>  #define __ARCH_WANT_NEW_STAT
> +#endif
> +
>  #define __ARCH_WANT_SYS_CLONE
> 
>  #define NR_syscalls (__NR_syscalls)
> -- 
> 2.52.0

-- 
- Jiaxun
