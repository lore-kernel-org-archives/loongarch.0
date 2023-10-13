Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E63168AF
	for <loongarch@lists.linux.dev>; Fri, 13 Oct 2023 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="FSXItkua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1697205206;
	bh=3qcLRTnBJA6r9AgprapzBnGL8upTT05UMS6QH3ySA9A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FSXItkuadwHJ6d78M3BciIszukol1681GVS95q+cv/EV3dPOS0UKKpc/1+PpoZxl+
	 8UDZUzsipey7Y+GcWgJZg75CgtWFPgxRt7gePhr7KgstPOftDX/jH91O76av5e2gBv
	 vgDip6zG+VrhdePUuspXQhR+gO/EAwnmNR5cVBK4=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id D675766935;
	Fri, 13 Oct 2023 09:53:22 -0400 (EDT)
Message-ID: <00d5150cadcb8b60004284ad43810adef52aab37.camel@xry111.site>
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
From: Xi Ruoyao <xry111@xry111.site>
To: Sui Jingfeng <suijingfeng@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
  Icenowy Zheng <uwu@icenowy.me>, Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Weihao Li
 <liweihao@loongson.cn>,  "Mike Rapoport (IBM)" <rppt@kernel.org>, Jun Yi
 <yijun@loongson.cn>, Baoquan He <bhe@redhat.com>,  "Matthew Wilcox
 (Oracle)" <willy@infradead.org>, David Hildenbrand <david@redhat.com>,
 Hongchen Zhang <zhanghongchen@loongson.cn>, Binbin Zhou
 <zhoubinbin@loongson.cn>, Zhen Lei <thunder.leizhen@huawei.com>, Tiezhu
 Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>,
 Zhihong Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Date: Fri, 13 Oct 2023 21:53:21 +0800
In-Reply-To: <049fbd3906b60f75be3900f20f6974967da374f3.camel@xry111.site>
References: <20231009042841.635366-1-uwu@icenowy.me>
	 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
	 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
	 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
	 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
	 <73ddfc81-3f94-4403-8bb2-d537742a7042@loongson.cn>
	 <049fbd3906b60f75be3900f20f6974967da374f3.camel@xry111.site>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-10-13 at 21:15 +0800, Xi Ruoyao wrote:
> Again, why this is only an issue with AMD or ATI GPUs?
>=20
> Can you provide some detailed documentations about this hardware issue
> so the community can help to figure out a solution?

3 years ago we had=C2=A0https://lkml.org/lkml/2020/8/10/255:

   In this case the patch is a clear NAK since you haven't root caused the
   issue and are just working around it in a very questionable manner.

and

   But when the hardware doesn't correctly implement WC for PCIe BARs, then=
=20
   this is a violation of the PCIe spec and a bit more serious issue for=
=20
   the whole platform.

So do we know the root cause now?  <rant>Or in all the 3 years we just
keep carrying a problematic workaround downstream, burying the head into
the sand like an ostrich, and self comforting with "oh they don't
understand our hardware"?!</rant>

Even if the problem is really "they don't understand our hardware" you
need to provide some materials to help people understanding the hardware
better.

If we cannot figure out the root cause or a proper fix is too difficult,
we should *at least* have a cmdline option and/or a configuration option
to allow the user to decide, like how we treat these spectre-like bugs.
"Should the option be enabled or disabled by default" can be debated
later.

And please try to fix the hardware, to me it will be a compelling reason
to pay some money for an upgrade :).

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
