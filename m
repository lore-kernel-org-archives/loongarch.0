Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE44154B9
	for <loongarch@lists.linux.dev>; Fri, 13 Oct 2023 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="TPTLZoSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1697202930;
	bh=hxUB6QsYvQndxByR8nkgIwYDWVox7o8wrc2RqZWj+bc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TPTLZoSWy35vD+BljSD2VfbVzPHiM+D5/Purwp2uAUd9ZHAlEkjw0iAe1JJ3FfkXY
	 e+MwHv4ChA9Jm6d03dMT9zpFcazATAyr1k8p2sBeHXE1JTFKHyxndFsEe6yY8SRFnd
	 gUeImKziK+qKaPVQolcUtsSyJ44Gh+Ohkod20/4c=
Received: from [IPv6:240e:358:11e2:500:dc73:854d:832e:3] (unknown [IPv6:240e:358:11e2:500:dc73:854d:832e:3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id EFFD866930;
	Fri, 13 Oct 2023 09:15:18 -0400 (EDT)
Message-ID: <049fbd3906b60f75be3900f20f6974967da374f3.camel@xry111.site>
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
Date: Fri, 13 Oct 2023 21:15:10 +0800
In-Reply-To: <73ddfc81-3f94-4403-8bb2-d537742a7042@loongson.cn>
References: <20231009042841.635366-1-uwu@icenowy.me>
	 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
	 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
	 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
	 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
	 <73ddfc81-3f94-4403-8bb2-d537742a7042@loongson.cn>
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

On Fri, 2023-10-13 at 20:51 +0800, Sui Jingfeng wrote:
> Hi,
>=20
>=20
> On 2023/10/10 20:26, Xi Ruoyao wrote:
> > > - For buffers at VRAM(device memory), we replace the WC mappings with=
 uncached mappings.
> > > - For buffers reside in RAM, we replace the WC mappings with cached m=
appings.
> > >=20
> > > By this way, we were able to minimum the side effects, and meet the u=
sable requirements
> > > for all of the GPU drivers.
> > AFAIK there has been some clear NAK from DRM maintainers towards this
> > "approach".=C2=A0 So it's not possible to be applied upstream.
>=20
>=20
> Yeah, domain specific reviewers are really hard to persuade to accept our=
 solution.
> Probably because they are not know our hardware very well.

The problem: why this is only an issue with DRM devices?  Work around it
in DRM subsystem just does not make sense to me, at all.

You cannot exclude the possibility that another subsystem will start to
hit the same issue in the future.  Then such a "solution" will cause #if
CONFIG_LOONGARCH scattering everywhere and doing so is completely
unmaintainable.

> But the side effects of this patch is really too hurt to accept. In this =
case, if you really want to make
> a progress by workaround.

This is not a valid reason.  For example, the spectre-like bug
workarounds hurts the performance as well, but we enable them on
affected CPUs by default.

> I think you could try scan the PCI device in the whole
> system on boot time. Turn off the WC mappings when there is a AMD or ATI =
GPUs found.

Again, why this is only an issue with AMD or ATI GPUs?

Can you provide some detailed documentations about this hardware issue
so the community can help to figure out a solution?

> Leave the the WC mappings open at the rest of cases. But this is yet anot=
her ugly
> workaround. Perhaps it is a bit of better than this because there is no w=
ay left.

And this also won't work with PCI hotplug, I'm not sure if it's
supported now but I'm 99% sure you'll add it in the future.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
