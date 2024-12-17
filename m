Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636B31E489
	for <loongarch@lists.linux.dev>; Tue, 17 Dec 2024 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734479078; cv=pass; b=kv/y7YQYlhBKKH1n+RZJ+nlQZnDUmwQZmmyXn78U4VQ32XCbIW3hbhophiVveNo1S6Bp67cSrTNBIBYgHM4JqDRSrd1p+hni9Jz1DeF7qGDec5bm7AYyaBWFxoEhl03qXVSjLYn5dAAkjTGbHZODGOq7wywGbGTmuJvMv3iEgZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734479078; c=relaxed/simple;
	bh=AB64UShFJ8WpqV/QMs16z/nKoRnied29/v15iIWzLhw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VZD5wUAoTrGmonA1bKF7uCFpoZv2Jw9YdHn1KZwvcjVcpi7LDNGu/iHYTjQBBEagSYfvoXAWxggmgKCnojU3xeZHfc+QsdDGU5IUfrAuGYL2WBzbNUyWeezCBCP73+8ZgJgCDPJxSdrFF0t/y7L20sw8s7/C9LNiufhSAE43PVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=cArVyOlP; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="cArVyOlP"
ARC-Seal: i=1; a=rsa-sha256; t=1734479056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=euh4pOAeAopr+f5GKpsboky9KWEpUadrtYPP/5CGl4JjSfkL3l+CM/JhL06uismZTniK++3Qd9c9i32tCJFo94MTqzkEHkmoLtzOMBNgyUC7yUCgOGjC6qzu04Wsii76ypxVTWof0HpbABwd+mQQTRI7eCgWJLMC4pWVmWzgA6U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734479056; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AB64UShFJ8WpqV/QMs16z/nKoRnied29/v15iIWzLhw=; 
	b=acKMOLO5pOyrSQTxLfaCaLf9L8BcZpemKzQFNe9CYN9+CLOeX05yhZF8jYAgbg/V+u1ryu1djuAnpBP1UT6Fe9Y0o2idptwIO/8wc7UNHB5G/93Vhp7DbzmnQiZB4vI6aXcB5xlEqeBDhr6rG+d2KBMwv+V1HELXkZb56zxrCH0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734479056;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=AB64UShFJ8WpqV/QMs16z/nKoRnied29/v15iIWzLhw=;
	b=cArVyOlPPMtTi5bsQiTmEwt5/04pnswYauG9bl1/mVgcrlx7CfjtFwvB0tCYxHhx
	AxV/xA36sec/M26wtO/dWglI9+OP7wPCFKBs65X33HmdhEofZZ2Y/FqLwO2PnEfo92j
	YEuTK2KaE4EE1xn8xQy4Jx68nXHmrsWejZAk/YzK/nhrdpbw35AuPmy3ohkvnZgMIVR
	z4qc0HwkT7kcWYt7oa9tKFeekaYGTr2B1pG6ZufsV+MiHs78IRK9cqeNFzlv4E2EBhs
	KWMNDpb0wM/O9Hg9vs34ngeTBkApP1fGyfdUbmJ7B0QVd9zP/ghJfRAVMD1BwcYhskY
	IuIiH52a4w==
Received: by mx.zohomail.com with SMTPS id 1734479053255463.96433856451597;
	Tue, 17 Dec 2024 15:44:13 -0800 (PST)
Message-ID: <1e0f2174a72011cb1c78eeecbbf82a4ff108bf8a.camel@icenowy.me>
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
From: Icenowy Zheng <uwu@icenowy.me>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Xi Ruoyao <xry111@xry111.site>, 
	WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Baoquan He <bhe@redhat.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, David Hildenbrand <david@redhat.com>, Zhen Lei
 <thunder.leizhen@huawei.com>, Thomas Gleixner <tglx@linutronix.de>, Zhihong
 Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Dec 2024 07:44:08 +0800
In-Reply-To: <dfc53da9-a1ab-4ab3-aba2-d100f7f28b9b@linux.dev>
References: <20231009042841.635366-1-uwu@icenowy.me>
	 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
	 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
	 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
	 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
	 <dfc53da9-a1ab-4ab3-aba2-d100f7f28b9b@linux.dev>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2024-12-03=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 00:23 +0800=EF=BC=
=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> On 10/10/23 20:26, Xi Ruoyao wrote:
> > On Tue, 2023-10-10 at 11:02 +0800, Sui Jingfeng wrote:
> >=20
> > >=20
> > > On LoongArch, cached mapping and uncached mappings are DMA-
> > > coherent and guaranteed by
> > > the hardware. While WC mappings is *NOT* DMA-coherent when 3D GPU
> > > is involved. Therefore,
> > > On downstream kernel, We disable write combine(WC) mappings at
> > > the drm drivers side.
> >=20
> > Why it's only an issue when 3D GPU is involved?=20
>=20
> No one saying that only 3D GPU is suffer from this kind of issue,
> I just meant that the issue is there at least for GPU
>=20
> > What's the difference between 3D GPUs and other devices?=C2=A0 Is it
> > possible that the other
> > devices (say neural accelerators) start to perform DMA accesses in
> > a
> > similar way and then suddenly broken?
>=20
> You, the patch contributor or the maintainer or whatever stuff
> should carry on the test, right?

Well doing some test on PCIe peripherals need some professional tool,
then I assume who raises the idea should do it, because not everyone
can do.

>=20
> We are not intended to against the patch though.
>=20
> > > - For buffers at VRAM(device memory), we replace the WC mappings
> > > with uncached mappings.
> > > - For buffers reside in RAM, we replace the WC mappings with
> > > cached mappings.
> > >=20
> > > By this way, we were able to minimum the side effects, and meet
> > > the usable requirements
> > > for all of the GPU drivers.
> >=20
> > AFAIK there has been some clear NAK from DRM maintainers towards
> > this
> > "approach".=C2=A0 So it's not possible to be applied upstream.
>=20
> That's your guys problems, stealing other programmer's patch.
> And then, submit it to upstream without knowing and/or presenting
> decent hardware details.
>=20
>=20
> > > For DMA non-coherent buffers, we should try to implement arch-
> > > specific dma_map_ops,
> > > invalidate the CPU cache and flush the CPU write buffer before
> > > the device do DMA. Instead
> > > of pretend to be DMA coherent for all buffers, a kernel cmdline
> > > is not a system level
> > > solution for all of GPU drivers and OS release.
> >=20
> > IIUC this is a hardware bug of 7A1000 and 7A2000, so the proper
> > location
> > of the workaround is in the bridge chip driver.=C2=A0 Or am I
> > misunderstanding something?
> >=20
>=20
> You are misunderstanding everything and ranting like a dog.
>=20
> The write buffers are inside the CPU, and the write-combine is
> related
> to *both* the CPU side and the GPU side. The GPU side could choose
> no snooping access mode, while the CPU side have to address such
> request
> properly.

Well I think the radeon driver unconditionally maps VRAM with WC
property, and only map system memory with WC when
drm_arch_can_wc_memory() test passes, this is why blocklisting
LoongArch in drm_arch_can_wc_memory() do not solve all problems; and
for the GPU to access its own memory (VRAM), snooping the CPU sounds
not acceptable.

>=20
> What's we arguing is that if this is a hardware bug of north bridge,
> we
> at least still should be able to use WC at the CPU side, that is, WC
> on
> system pages should be usable without any issue. While the weird
> commit
> disable everything.

Well, what's the point of using WC on system pages?

Why don't we just use normal cached property? I think non-cached memory
attributes are only there for communication with peripherals, and at
least 3A5000/6000, no meaningful DMA-capable peripheral could be
accessible w/o the bridge chip.

>=20
>=20

