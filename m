Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523D181
	for <loongarch@lists.linux.dev>; Mon, 29 Aug 2022 05:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1661749441;
	bh=Y2IBo/yl2C21cbNjWkR6HnBtpOv/rW+e5okc63SzE28=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=P3sv8B03EouV3Ol4B/8SyCFj9bDuGenC3FLHapba4ePX9gDXNlKUXa1RIxoS7cutG
	 np8fe//5yYYP/nuXnDl8V/knGoy6Q+puDybEF9QznTZhTNAC9AJIWxJgc49hM6QN/H
	 EiJDe8tPTYijqqqGrcdLlfw6R8On7gRaaQimjiok=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 4863A66817;
	Mon, 29 Aug 2022 01:04:00 -0400 (EDT)
Message-ID: <927f85844e31f0563523622134b5d01af6991e60.camel@xry111.site>
Subject: Re: [PATCH 0/8] LoongArch: Support toolchain with new relocation
 types
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Youling Tang <tangyouling@loongson.cn>, Jinyang
 He <hejinyang@loongson.cn>
Date: Mon, 29 Aug 2022 13:03:58 +0800
In-Reply-To: <CAAhV-H5tB9nvD8Uufn5SQ1s0hzob4TuxRTaSri-cxHVqtRH6uw@mail.gmail.com>
References: <20220827175436.156464-1-xry111@xry111.site>
	 <CAAhV-H4+=CqeRUUt+XPZ2Nf=1GRgHtTFyMuVu-y6QdgQgD4mog@mail.gmail.com>
	 <b681993ca92d5243a73e23303ff9386ad03cf05a.camel@xry111.site>
	 <CAAhV-H5tB9nvD8Uufn5SQ1s0hzob4TuxRTaSri-cxHVqtRH6uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2022-08-29 at 12:33 +0800, Huacai Chen wrote:
> > If we'll drop support for old GCC/Binutils, we can drop patch 5 (it's
> > only needed for the combination of old GCC and new Binutils).=C2=A0 The=
n
> > squash 4 and 7.=C2=A0 8 should still be standalone IMO.

> Whether we can drop old toolchains depends on Arnd. :)

I'd like to prepare V6 after we can make a final decision.

> But even if we should support old toolchains, I think we only need to
> consider new binutils + new gcc and old binutils + old gcc, I don't
> think new binutils + old gcc and old binutils + new gcc can exist in
> the real world.

Generally, how do we report an unsupported configuration in kernel
building system?  With a $(error, "message") in the Makefile, or in some
header with a #error?  I don't want to leave an unsupported
configuration silently generating modules which can't be loaded by the
kernel.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
