Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E7347363
	for <loongarch@lists.linux.dev>; Tue, 10 Oct 2023 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="an2pRto4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1696940825;
	bh=BLQz0b68UI9xKLLuezR5Ro6in6MfcDCmm75k9I9eZJc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=an2pRto4L/7BLmClMTvjeW3qmgUeuVqknrB8vMq/5uVvQx3YBkRY4yqCac982+n/p
	 r5LRIJnt07VsgTcfsBfA/HnM9pzeNIC6fs9da6FKd8y6MppJ0tUVkzR/Usxkw5dFXw
	 kG9sXOrRUZBrFAcWMIvNDI6CorO8FZgMXVm43Ryo=
Received: from [192.168.124.13] (unknown [113.140.11.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id DCE0B66B2D;
	Tue, 10 Oct 2023 08:27:01 -0400 (EDT)
Message-ID: <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
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
Date: Tue, 10 Oct 2023 20:26:59 +0800
In-Reply-To: <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
References: <20231009042841.635366-1-uwu@icenowy.me>
	 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
	 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
	 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
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

On Tue, 2023-10-10 at 11:02 +0800, Sui Jingfeng wrote:

>=20
> On LoongArch, cached mapping and uncached mappings are DMA-coherent and g=
uaranteed by
> the hardware. While WC mappings is *NOT* DMA-coherent when 3D GPU is invo=
lved. Therefore,
> On downstream kernel, We disable write combine(WC) mappings at the drm dr=
ivers side.

Why it's only an issue when 3D GPU is involved?  What's the difference
between 3D GPUs and other devices?  Is it possible that the other
devices (say neural accelerators) start to perform DMA accesses in a
similar way and then suddenly broken?

> - For buffers at VRAM(device memory), we replace the WC mappings with unc=
ached mappings.
> - For buffers reside in RAM, we replace the WC mappings with cached mappi=
ngs.
>=20
> By this way, we were able to minimum the side effects, and meet the usabl=
e requirements
> for all of the GPU drivers.

AFAIK there has been some clear NAK from DRM maintainers towards this
"approach".  So it's not possible to be applied upstream.

> For DMA non-coherent buffers, we should try to implement arch-specific dm=
a_map_ops,
> invalidate the CPU cache and flush the CPU write buffer before the device=
 do DMA. Instead
> of pretend to be DMA coherent for all buffers, a kernel cmdline is not a =
system level
> solution for all of GPU drivers and OS release.

IIUC this is a hardware bug of 7A1000 and 7A2000, so the proper location
of the workaround is in the bridge chip driver.  Or am I
misunderstanding something?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
