Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6B4199FC5
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525854; cv=pass; b=SY74OJFZknBn1ndCyqtEYR5PKBp1HNYqRDz9vVRhbMka+N1ke0Jk94ABVLyxdkWKBeIeFtzHK7Dh2ft5rH5xbuZRJUdU0KHSSE3tWdLN9cUwZo93aEqZdlIG87gHJAzQKfc4nMM+yKlozH6hNoH1t3/iVyXGq+//s5yH+CWGueM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525854; c=relaxed/simple;
	bh=bPsd946f66nGkPH1XkLP2sgqdDzT6tVHNBLlCHEsCvc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LyNEsHTzfk7Q7S2KOz3NzCZ7rUJaP6jZIrBok7xeTYw/gOdocsJumhnppoOAneXgOJNvy7zyddXdRasGpKr+e2hsOBEf9iiZUuiTuFn+xgA1oMFxp74T4/aVqO1wIDEpNQ9NarGQrKxmbZQSn9Aw50t1rvNjGaEo+B8B5hHcCHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=YqXA6Rhw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="YqXA6Rhw"
ARC-Seal: i=1; a=rsa-sha256; t=1734525844; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iT7FnnwlZK4RRcEjBj9eP5PgP2KvNyR+5Ai+l6Q1FkO8lXz4rp9gihy0CyUIIxk9JU35e0MRaCZsA3lw7gvGbeT8sqcMhL3L2s2cNLnVngmHwmaOz00lWMHfgjHk/Z6MbfaxW8SHhkzOY3Cq81ScexpwxXLR1jRLFKbYG2vlijg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734525844; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bPsd946f66nGkPH1XkLP2sgqdDzT6tVHNBLlCHEsCvc=; 
	b=gAykCv3EGub42+Rr6q2H+bTGp24ZQvQ8heHprRDbYr9fUcK1HGCx/IAiu/p+EVY6xRrYle3pUz2LqquoLVOVZA0MqTxOf4zCh+CEE4w0Pgd0Rqs9C4ijsqj3Y1jS2Bo/sRk9f7imK08v+OvTetka63tVaQLcxAY9+DPtcGwMLgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734525844;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=bPsd946f66nGkPH1XkLP2sgqdDzT6tVHNBLlCHEsCvc=;
	b=YqXA6Rhw/shnYQe4DjIKK6NvtiDm0tPaLYOUnfpusGYMcRITq45zHTNKIQXkbMxZ
	GbS+Yq92NtJ+npwHNSh6w1RWgTvOpoMkM3tyjPPo565qpdM3q7MbPtgCW+mdEDNVryG
	U0kVqHEd0f0ng32hiGRsgPh5Xk3DX+PAPz9N6squnfZasv4fjhakk/dbAORHOMvGWm6
	Ef/a4sgarSldbRwWeTKMfhFbKtsE9R3cIYXPjA1x+xuD5duVHfDderEhqND92iz1LGx
	/eIunRSEPEdzqI8Od8edXRk7COGNdMhYtL+oczy2D5JN1KBwL/dJIl4oxsc7i39W0pY
	P+qsF9caDw==
Received: by mx.zohomail.com with SMTPS id 1734525842561755.677660485943;
	Wed, 18 Dec 2024 04:44:02 -0800 (PST)
Message-ID: <932a9a93c00082645df465862231f6d8c91f3bf6.camel@icenowy.me>
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
Date: Wed, 18 Dec 2024 20:43:54 +0800
In-Reply-To: <1090f735-8252-453f-b6c8-0ec35881ff32@linux.dev>
References: <20231009042841.635366-1-uwu@icenowy.me>
	 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
	 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
	 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
	 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
	 <dfc53da9-a1ab-4ab3-aba2-d100f7f28b9b@linux.dev>
	 <1e0f2174a72011cb1c78eeecbbf82a4ff108bf8a.camel@icenowy.me>
	 <e9fef25e-3f83-46e9-a17c-d9f83e178311@linux.dev>
	 <feb3545e650c04c8cc21c40dad36dbf4076b3ebc.camel@icenowy.me>
	 <1090f735-8252-453f-b6c8-0ec35881ff32@linux.dev>
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

=E5=9C=A8 2024-12-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 18:29 +0800=EF=BC=
=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 2024/12/18 13:47, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-12-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:05 +0800=EF=
=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi,
> > >=20
> > >=20
> > > On 2024/12/18 07:44, Icenowy Zheng wrote:
> > > > =E5=9C=A8 2024-12-03=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 00:23 +080=
0=EF=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Hi,
> > > > >=20
> > > > > On 10/10/23 20:26, Xi Ruoyao wrote:
> > > > > > On Tue, 2023-10-10 at 11:02 +0800, Sui Jingfeng wrote:
> > > > > >=20
> > > > > > > On LoongArch, cached mapping and uncached mappings are
> > > > > > > DMA-
> > > > > > > coherent and guaranteed by
> > > > > > > the hardware. While WC mappings is *NOT* DMA-coherent
> > > > > > > when 3D
> > > > > > > GPU
> > > > > > > is involved. Therefore,
> > > > > > > On downstream kernel, We disable write combine(WC)
> > > > > > > mappings
> > > > > > > at
> > > > > > > the drm drivers side.
> > > > > > Why it's only an issue when 3D GPU is involved?
> > > > > No one saying that only 3D GPU is suffer from this kind of
> > > > > issue,
> > > > > I just meant that the issue is there at least for GPU
> > > > >=20
> > > > > > What's the difference between 3D GPUs and other devices?=C2=A0
> > > > > > Is it
> > > > > > possible that the other
> > > > > > devices (say neural accelerators) start to perform DMA
> > > > > > accesses
> > > > > > in
> > > > > > a
> > > > > > similar way and then suddenly broken?
> > > > > You, the patch contributor or the maintainer or whatever
> > > > > stuff
> > > > > should carry on the test, right?
> > > > Well doing some test on PCIe peripherals need some professional
> > > > tool,
> > > > then I assume who raises the idea should do it, because not
> > > > everyone
> > > > can do.
> > >=20
> > > You are posting the patch, and then you are acclaiming that you
> > > are
> > > not even able to do sufficient test? right?
> > What I can test is that w/o this patch things break and w/ this
> > patch
> > things work.
>=20
>=20
> > If you are against this patch, you need to provide more effective
> > evidence / a better solution than my approach.
>=20
>=20
> I have told you several times, we are asking for hardware details.
> Why the Loongarch suffer from the WC bug, like the Loongson Mips?
> Why the performance of drm/ast's drop dramatically when your patch
> is applied?

Well the fact is that before applying this patch, graphical glitches
usually happen on amdgpu/radeon, and after applying this they
disappears -- this matches what happens when WC is enabled on MIPS
Loongson.

For the fact of drm/ast's dramatical drop, it's because write to the
framebuffer can no longer be reordered. In fact if using amdgpu/radeon
w/o graphical acceleration, the same issue happens. (This can be
clearly seen when on MIPS Loongson w/ RS780E -- outputing the boot log
can dramatically slow down the boot process).

What I can assume now is that the Loongson WC/WUC is safe for display
framebuffers, but not safe for GPU commands/textures/etc.

>=20
>=20
> > >=20

