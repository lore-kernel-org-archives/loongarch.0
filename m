Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8B318EFC6
	for <loongarch@lists.linux.dev>; Thu, 26 Sep 2024 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727334891; cv=none; b=ZXAh6rDYu7uwma9qt1dwcW+E+iqo+QmZ+FGUoopU6m4XgBhNU0zeLG0wzGj86dLgrdsjt7BVpbb3DK45vmpiChOX42bkvpXDRhOEdX+1fq7cDLVuu9jVIlxRI/XJKa0+x0V7LoE2rMYvOJ1sG5eihP3tavRJmx3/Oc06tauUKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727334891; c=relaxed/simple;
	bh=WlY3d7SLr1N+C4pY/PP84LyM8TYT0prgnbu6pk4uLws=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DSdNBmT6oWE/7opwBQWqzSF7VQAcF0KQIvB6nprRDI4oA1z0tmzWo4PyB/V+BbErKjiGC5HyToQYLyK3QOaKY7Xyu9ngl+Z/IRHfKsXmLG5/10tiNJHx/JER7ml6nyCedlu6YIzhovVKzYlXwbmYJ2yFwQ9mHMMwqbjsyx2/xZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=PMoB2KNR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WLetWrJ+; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="PMoB2KNR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WLetWrJ+"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1CDF41140253;
	Thu, 26 Sep 2024 03:14:49 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 26 Sep 2024 03:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727334889;
	 x=1727421289; bh=/T6ar3F0gXR/zaU63AYT1uaAqMFPYcSq6bUl+9VYhuk=; b=
	PMoB2KNRK9uvldBimKptBz1a/ORdeC/+Gxczc773IY6wYopp2EcC1/sEN9DA6p0N
	2fxL2DNJwCKxKwhZrc6EjD7WL6wXEO8O+zdNkwIKs53mZre2IlNt/VE+/zd5jyUI
	O50fDTunzBE2W14JSglvOTdJs2IjH8fM0P/VGARZjdO69tRDp8yefmbv83EB9hCS
	dsURRAWGVZHDxxA39oapMPieNrqWMRcUjeFtLq0xCkof8ZhUGH0Cj7BIt8txVHth
	r4tlHRAofzbcl+JqC/JZRQzYVctZemqBbbDCUQ4TzrJi6gYUkHO+jBDved8X2ck1
	y5k+6uz6Hv7+ztiEqd/Byw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727334889; x=
	1727421289; bh=/T6ar3F0gXR/zaU63AYT1uaAqMFPYcSq6bUl+9VYhuk=; b=W
	LetWrJ+UEuB+QV3R8zA+ndQHa/X8JiMW000u2v3zKIbNdwZJ7dCrydDwSK9qw3nf
	C/f0Wmdl1L7xiXMRJZ8W8Y8lRvQVd6E0NOhBqqUmbO7S0DaH3+EN0hdXuI4GhjZW
	JvbYgFF4VS+gFtcXXWI98+9EuVufxnOBrah+HCKBtHp/tDHWix36qy74VKnLzuny
	VcS+bCfM5vSXNmVWIDW+89NOibk25D7hCIC2tlkysAWRbTb9rb94miMJkCfd1PVr
	yTXR+60BaKmVdnYBq9ZMmreyQs3i76fG1NWSKnd9Gveyv31n5uFIc/QAGmPATPJ0
	X4Ts3OHE50gojGoU6/ooQ==
X-ME-Sender: <xms:6An1Zt_8OU-jE5gqCRt953O8HbkA53-0EtwRHk08x352CPjcoZ6IZA>
    <xme:6An1Zhsha5yiVnlFd719MH1sktDIbDxF0-h3yjFyDdNyvoffY0lQX8j4v857VxlNU
    j_8MPtkvV1kcMZxZeY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtiedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopehjvhgvthhtvghrsehkrghlrhgrhihinhgt
    rdgtohhmpdhrtghpthhtohephihsihhonhhnvggruheskhgrlhhrrgihihhntgdrtghomh
    dprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepghhuohhrvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihho
    nhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlohhonhhgrghrtghhsehlihhs
    thhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:6An1ZrCyn79DMvSAuCcgCq6i_t4gnthLW4in2IXB3c4NIZKg1EOy-w>
    <xmx:6An1ZhehrLA4MoqEwTf2EophW8Qe17hKoVYNoFMqnTTJxvviG3M07A>
    <xmx:6An1ZiMFswFt_m-jCYqNHf3vdlKihK4C50z0YrL_H_tKz2CyfGlDoA>
    <xmx:6An1Zjk-ASdXuvHyok7bvh6S-q-BvtZDgg_VnQzxoTeWJ5ZlDG4NJA>
    <xmx:6Qn1ZjlRN7popDqYqT9mNyGxuA75CHGpFDWh-avqB8KQkTZErTQ-4pT0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2B2142220071; Thu, 26 Sep 2024 03:14:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 26 Sep 2024 07:14:16 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <jvetter@kalrayinc.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 guoren <guoren@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, "Yann Sionneau" <ysionneau@kalrayinc.com>
Message-Id: <f47e66f9-ec20-4e75-b88f-d412339e797d@app.fastmail.com>
In-Reply-To: <20240925132420.821473-2-jvetter@kalrayinc.com>
References: <20240925132420.821473-1-jvetter@kalrayinc.com>
 <20240925132420.821473-2-jvetter@kalrayinc.com>
Subject: Re: [PATCH v6 1/5] Consolidate __memcpy_{to,from}io and __memset_io into
 iomap_copy.c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 25, 2024, at 13:24, Julian Vetter wrote:
> Various architectures have almost the same implementations for
> __memcpy_{to,from}io and __memset_io functions. So, consolidate them
> into the existing lib/iomap_copy.c.
>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>

You have a duplicated signoff here.


> +#ifndef __memcpy_fromio
> +void __memcpy_fromio(void *to, const volatile void __iomem *from, 
> size_t count);
> +#endif
> +
> +#ifndef __memcpy_toio
> +void __memcpy_toio(volatile void __iomem *to, const void *from, size_t 
> count);
> +#endif
> +
> +#ifndef __memset_io
> +void __memset_io(volatile void __iomem *dst, int c, size_t count);
> +#endif

I'm not entirely sure about the purpose of the #ifdef here, since
nothing ever overrides the double-underscore versions, both before
and after your patches.

Unless I'm missing something here, I think a more logical
sequence would be:

1. add the definitions in this file without the underscores,
   as memcpy_fromio/memcpy_toio/memset_io, with the #ifdef
   for that name that is always set at this point

2. replace the default implementation in asm-generic/io.h
   with extern prototypes, remove the #define from those

3. convert the other architectures, removing both the
   implementations and the prototypes.

     Arnd
