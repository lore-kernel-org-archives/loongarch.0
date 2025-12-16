Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AAA33436A
	for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765869729; cv=none; b=NBuajTVt+Wz+1KdAsa1aQTkLfSKxLxC123Y7HXMk2KAakr8bfBX6AlbYkIBhyIroIqz6ruxejhis0m0ds6TcDIIfxv1gJxInJCw6fRMsiW27OsBkJW7v7Q/07S9ADkNDWxVt9A6bKLc4Lnn+4qtTR9pau9Ewj9aCU72Gj1RM0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765869729; c=relaxed/simple;
	bh=51MWHgkxGI71sisGb/E7f7y8ZYnb9G7XuO+h+vxtYOc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OFEOPRO2nm2HKbGLcAp4KFU3pxLP1XaheKkWMZcGtnC+99C371Z5kopbOQZ4WUIMFkUkJglfqMls4cUy1IQB+5spRmB3xRheKcwJiZ44HRVUJwwrHp+Dxk2g2jTGWcYLFm5y2621sM3O5kRmW1bUodF0sSKmP0RDgeOhajR00CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=GAxUSiNQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q8mOthEb; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="GAxUSiNQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q8mOthEb"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C22711D000CB;
	Tue, 16 Dec 2025 02:22:05 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Tue, 16 Dec 2025 02:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765869725;
	 x=1765956125; bh=e1fWM5RLKqaza7Y9Iev0VIoNi7EFuym/SarsmGOAmq8=; b=
	GAxUSiNQOOTAkd2qNz03eS7LbVVmqnoZbAeZyxvpxuB4H6Fx/oINuqwn/RMlzxH3
	aiIYgg/FmNeTl6LmXAa/+0d0adITvnnaICC3fGaBOdItSUJRp7szDKASox6jORC/
	CdjeWeeMJ5GpTSaeMvLoIU8UPKNb22O2I910Q3e6VGDb0MH6ICI27gz8ueJyRR8v
	Su3QI2/PHHBEStnrO0RddOYx1VYnKjgt/lDPNb1lV62/ogqJ3ZYGqd38IOd7GoUF
	8b1XHYsRxiFh5eF6fn4A3HIOoRpi6GYqWU87B3qh6uGcCppvKvWRQmWWHUID4Pi2
	QMN5Y9vX+KTrdUQcLfgrOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765869725; x=
	1765956125; bh=e1fWM5RLKqaza7Y9Iev0VIoNi7EFuym/SarsmGOAmq8=; b=q
	8mOthEbNFtFYrAbDRS/7k2rhzDBCsmkJnbslF2dC0H9rhjgYk3sHXxtIx/saaukt
	QLGSNXxtjQORTTMxs2b/8qrjb6vltp9CouzpuoTrhsyz0RQhwJb8TIj9qzM0pMdT
	FgjRNb01KhX4SSDiPxunCGEabMALLsbDgEiqDmiBsPlj9CEjHffiLa3dhgT2fz3t
	PfC+vHL/hkWWp6lPd+KId+ICvdPlx/aluV0e1sELq9sDDQ6s5MKupCPBk95kXwVD
	wsyfs24T4HNCaWH/9nxqL7ck+to0ytcbdeNaz1HIqfziRFTCctsZ3fmuQpeR6LWb
	JiI5o3bDKPdCc08LigPEA==
X-ME-Sender: <xms:nAhBaftVLQ5H2j1uzDldw141hWuLljq9ly4_xerey4t56MLaUYrxyw>
    <xme:nAhBabTxf41FnydMus85XeFnQqbODtlc2_Xfwbh8GUcmG0lHXe4j8Jsz2wMVqUKCP
    2S-RT7qbr2eS0ej-nl7eZ5beidAPlMaiR_9GRRFWLng1LQANPDYJy4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefledtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehjvghffhgsrghisegrohhstgdrihhopdhrtghpthhtohepjhhirgiguh
    hnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegthhgvnhhhuhgrtggr
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhoohhnghgrrhgthheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhesgigvnhdtnhdrnhgrmh
    gvpdhrtghpthhtohepgihrhiduudduseigrhihudduuddrshhithgv
X-ME-Proxy: <xmx:nAhBaZWGyUHt7Os7ztVM6qR4boc3M6EsYI7UGtcqLm-rO1gfVdH00A>
    <xmx:nAhBaTqLYaspTdxM8jL--x-6tZK2H0dnDxQmTLs4g-EKT_XDiwlS4A>
    <xmx:nAhBaVS_8LRL_b7LQEivb8y8CMYudj-u7cnCr2rXNwVFto1nl8Bvkg>
    <xmx:nAhBad3pPx4w28Ha1CeGWNCM2jmttAdmtiUojs2Csgudrip9hPM0uw>
    <xmx:nQhBadhHx_liMF1YZwuXepPoIJy7nA0xeL2XEVfaNC1gczcEH0VWYeZm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 93545C40071; Tue, 16 Dec 2025 02:22:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AJuGVEOUT2_Z
Date: Tue, 16 Dec 2025 08:21:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Xi Ruoyao" <xry111@xry111.site>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Cc: "Mingcong Bai" <jeffbai@aosc.io>, loongarch@lists.linux.dev,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "open list" <linux-kernel@vger.kernel.org>
Message-Id: <98d93330-844e-493d-8d7e-3455340b78b7@app.fastmail.com>
In-Reply-To: <20251215033443.196159-2-xry111@xry111.site>
References: <20251215033443.196159-2-xry111@xry111.site>
Subject: Re: [PATCH] LoongArch: Don't define __ARCH_WANT_NEW_STAT for LA32
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Dec 15, 2025, at 04:34, Xi Ruoyao wrote:
> While on LA64 we had added __ARCH_WANT_NEW_STAT back for technological
> aesthetics reason, on LA32 the newstat family suffers Y2038 issue and it
> should not be used at all, as the commit 82b355d161c9 ("y2038: Remove
> newstat family from default syscall set") has already pointed out.
>
> Fixes: 14338e631afd ("LoongArch: Adjust system call for 32BIT/64BIT")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>

The patch looks good to me.

Note that unlike the referenced 82b355d161c9 patch, this is no
longer needed for correctness, since modern kernels generate
the asm/unistd.h from the syscall.tbl based on 
arch/loongarch/kernel/Makefile.syscalls, which leaves out the
references to newstat.

The patch is still useful of course, but only to slightly reduce
the size of the kernel image by eliminating dead code.

     Arnd
