Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD4B13AD3F
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 05:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734500892; cv=pass; b=Wna+SS0b109DmKoH8mkwkb210L4WZ8ITVrtQ/oS+puni+idfXGHysYoYijn/v1/lLTrXNNP82KDY42od2rYy1x46088UISCBHYT6g68jDVo1YZTghzyP2FD5UuEwDWelQ/AllIJ0Bqk+YvEBTus0HwS51/7KsxphgxD0PI3kQxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734500892; c=relaxed/simple;
	bh=pWH3b2T+Pamtac8rBhzguCKtKd6nDm5h6hU3sIOUIrI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YVjKSF9bOs3my8YT4QHcj+HrJPgunmA4yqzeXen8SfDN3Af0vlGbGnT04yu5fC//bRjRfU1HlvroWQpEhc4tApzp97nyJP8lcSAR6mhDXCd+3QPaLmwXWpoSJ+pHyYYEh67JqtcKMPZIFWP0rlCztg4f+L9cbxCpV7fvxkdu9qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=RTY6NadR; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="RTY6NadR"
ARC-Seal: i=1; a=rsa-sha256; t=1734500880; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MgHIvizIq4dN/1P7JZYJDLvjUaryZ5ttcmA2sV8CPJ4DV4Ek8qEkHM5t/tvtVnkzPG0Jl06wNZYIF7Iw96mxalU5hf3Q8mMG7yvolfdABJ13dHkS0uexJpdMwfqmghK//7WUIO+vUf4NSVpJbl+50ct0sEx1UzUasBTDGb+v/44=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734500880; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pWH3b2T+Pamtac8rBhzguCKtKd6nDm5h6hU3sIOUIrI=; 
	b=itKnMNyB8bXoXn7iN5KO10Oo1an+KjKu/ftm3o3OQRl+lqqWCSxW0Qvqf6XVH+ppNz43+GD3kupyREtZrQ+ki420cJnAt3BKcnzO2+yRpD0uby8mfCDMI9xKt6XamrRGNb24vsSNEDXE4NSiWIVkNJxtbZMJGXC+4Y5tZfWMXDU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734500880;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=pWH3b2T+Pamtac8rBhzguCKtKd6nDm5h6hU3sIOUIrI=;
	b=RTY6NadRm3YTljlgiE/QtSe3rg8VUzH8OUsHuw+KNfFRrWjippYGUwQCLp7AoZu3
	ZHzTZfm0rqiSL9//mv6W8EmB2OrzbFovqlOjjhxWLPiHQPPIYQbmHD2KLo3CKsaL932
	90CQiJYPetKF1BJ4Z6m3XabZF9/lZrqNks9Qm8c1cr7yL6EiLjWy3O65nvQygMWYa6K
	SWUnP1hvsSesUnNsYYHGBy0+Is9YjkYnhKMRTKyhTolGWQtBIwU5I623+Okve+C3JwL
	BFiNJLBppqIiGFcFY3s2cifT2LBmNTh1uwJYuoQaM49g/IA5rw1g3lJDF+/7z3ONXWE
	kb1MWwMmJQ==
Received: by mx.zohomail.com with SMTPS id 17345008777611005.8823450438407;
	Tue, 17 Dec 2024 21:47:57 -0800 (PST)
Message-ID: <feb3545e650c04c8cc21c40dad36dbf4076b3ebc.camel@icenowy.me>
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
Date: Wed, 18 Dec 2024 13:47:46 +0800
In-Reply-To: <e9fef25e-3f83-46e9-a17c-d9f83e178311@linux.dev>
References: <20231009042841.635366-1-uwu@icenowy.me>
	 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
	 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
	 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
	 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
	 <dfc53da9-a1ab-4ab3-aba2-d100f7f28b9b@linux.dev>
	 <1e0f2174a72011cb1c78eeecbbf82a4ff108bf8a.camel@icenowy.me>
	 <e9fef25e-3f83-46e9-a17c-d9f83e178311@linux.dev>
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

=E5=9C=A8 2024-12-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:05 +0800=EF=BC=
=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
>=20
> On 2024/12/18 07:44, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-12-03=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 00:23 +0800=EF=
=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi,
> > >=20
> > > On 10/10/23 20:26, Xi Ruoyao wrote:
> > > > On Tue, 2023-10-10 at 11:02 +0800, Sui Jingfeng wrote:
> > > >=20
> > > > > On LoongArch, cached mapping and uncached mappings are DMA-
> > > > > coherent and guaranteed by
> > > > > the hardware. While WC mappings is *NOT* DMA-coherent when 3D
> > > > > GPU
> > > > > is involved. Therefore,
> > > > > On downstream kernel, We disable write combine(WC) mappings
> > > > > at
> > > > > the drm drivers side.
> > > > Why it's only an issue when 3D GPU is involved?
> > > No one saying that only 3D GPU is suffer from this kind of issue,
> > > I just meant that the issue is there at least for GPU
> > >=20
> > > > What's the difference between 3D GPUs and other devices?=C2=A0 Is i=
t
> > > > possible that the other
> > > > devices (say neural accelerators) start to perform DMA accesses
> > > > in
> > > > a
> > > > similar way and then suddenly broken?
> > > You, the patch contributor or the maintainer or whatever stuff
> > > should carry on the test, right?
> > Well doing some test on PCIe peripherals need some professional
> > tool,
> > then I assume who raises the idea should do it, because not
> > everyone
> > can do.
>=20
>=20
> You are posting the patch, and then you are acclaiming that you are
> not even able to do sufficient test? right?

What I can test is that w/o this patch things break and w/ this patch
things work.

If you are against this patch, you need to provide more effective
evidence / a better solution than my approach.

Trying to make the problem more complex without providing extra
evidence isn't constructive.

>=20
>=20

