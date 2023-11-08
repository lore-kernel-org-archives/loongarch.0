Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B53457F;
	Wed,  8 Nov 2023 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="MficXfBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1699435561;
	bh=MHoYlRRQlIaoUMXp6XFV+fXjXSg5at/8hlArEgvyOGw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MficXfBcy/PeVIszIdkJ/wcbacN1X29Zv2MYs9r7+0eTynX3O5GqU8OuH95oV8nBQ
	 x5Jdlj66FywhaQsrHPfvm8zVjdgySZ7zoqxFXM5/D8twIMpHfDsUvmVpTdZ5HwYF9V
	 ssCVf4Q9x3oNOYRrJVEMFWWtsFt11BFVj8vfrK7U=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id CCAA466A03;
	Wed,  8 Nov 2023 04:25:58 -0500 (EST)
Message-ID: <4075b4dad9bedbc3def5dfe75f66f3e5d49ce6d5.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Disable module from accessing external data
 directly
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Rui <wangrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn, Fangrui Song <maskray@google.com>
Date: Wed, 08 Nov 2023 17:25:56 +0800
In-Reply-To: <CAHirt9jQHTRGdv4rShgvWHEbG1vzuLkNDbxLP7x4eMtuB3BB5g@mail.gmail.com>
References: <20231108040447.288870-1-wangrui@loongson.cn>
	 <d32d8a26dcd75a840727cdb50546b621d34d326b.camel@xry111.site>
	 <CAHirt9jQHTRGdv4rShgvWHEbG1vzuLkNDbxLP7x4eMtuB3BB5g@mail.gmail.com>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-11-08 at 17:20 +0800, WANG Rui wrote:
> > then the linked binary triggers a SIGBUS.=C2=A0 Ideally this should be
> > detected by the linker at link time, but currently the BFD linker
> > fails
> > to detect this error (FWIW this flaw is caused by a really nasty
> > method
> > for the medium code model implementation).=C2=A0 So to me -fno-direct-
> > access-
> > external-data is the default.=C2=A0 I also grepped for -fdirect-access-
> > external-data in the kernel building system but I've not found any
> > match.
> >=20
> > Are you using a different version of Clang, or maybe Clang has some
> > configuration-time option to make -fdirect-access-external-data the
> > default?
>=20
> The clang enables `direct-access-external-data` by default in PIC and
> disables it by default in no-PIC. This also applies to PIE. [1]

Oh sh*t:

xry111@nanmen2 ~ $ clang t1.c -O2 -fno-pie -no-pie
xry111@nanmen2 ~ $ ./a.out
Bus error (core dumped)

I'll consider it a Clang bug then.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
