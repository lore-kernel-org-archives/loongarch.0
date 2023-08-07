Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AEB210D;
	Mon,  7 Aug 2023 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1691392638;
	bh=+OenNrBzAmqFCbFqHNyWHPn56bzmSEBQTvxhWepBQiA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VRJ1o5A9UvpCUETjuIkPFZjnkaR0N0Zss8H5NkKo0TFrWaQtMpDI//g3JxQRUlTmk
	 bLTUri9IuPCHa1ZxfbJlcHJTPQnNKCtQifWMgtbNhlmc6ixF0DzNbG2sozy2SmgWiB
	 1d9qypQ1r3O0MikTFYD0MqpxUvORLTGj5UGiFXx0=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 46BC1659AD;
	Mon,  7 Aug 2023 03:17:05 -0400 (EDT)
Message-ID: <254baed00504ef3cec36e58540a3fdcca346a407.camel@xry111.site>
Subject: Re: [PATCH v2] LoongArch: Replace -ffreestanding with finer-grained
 -fno-builtin's
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, WANG Xuerui
 <git@xen0n.name>,  Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 07 Aug 2023 15:16:59 +0800
In-Reply-To: <d591bfef-9146-abf6-04d0-96600ebb7a15@xen0n.name>
References: <20230806083021.2243574-1-kernel@xen0n.name>
	 <CAAhV-H4ypd-+z-KbeGM6C_mNk0aggk2yhdDik-XfPNWqsO=j=A@mail.gmail.com>
	 <d591bfef-9146-abf6-04d0-96600ebb7a15@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2023-08-06 at 18:31 +0800, WANG Xuerui wrote:
> > > +cflags-y +=3D -fno-builtin-memcpy -fno-builtin-memmove -fno-builtin-=
memset

Can we only apply them for GCC <=3D 13?  I think with GCC 14 the built-in
implementations are quite reasonable (well, maybe it's some human ego
because I wrote them :).

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
