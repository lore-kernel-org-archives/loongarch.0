Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD85013BAF1
	for <loongarch@lists.linux.dev>; Thu, 19 Dec 2024 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734590096; cv=pass; b=dSYYjCXR4LDAMntWNUKSPgjK6YLuz+GyN8ZGBpQdAHWSDF2jLOfn7fONZbM2TIXgv0tDaJDPW7jQ0ZGk7FBxj7oMASsFKHH3ow7DEkzWwZGKf7noL8KhomZn+bXi0GuFEIzY/FsJhv8sJyTCrWrjWbrtF/jQiQ3ebD4yNkdXenE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734590096; c=relaxed/simple;
	bh=X5fx8CjVkQyQD6A25nE8ANwLSyDJ6nBLQUYdNE0EB5M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rVN1Trx6dvXEfnVeZZOwlNUc8Ssx3UZuMSlOlu+Nhdhn5nV+8Wz3JOWUBkIc0rezueopMH0+Y1C4fIKD2isPhv3iSkbLRzCRLAhUrbDG3UorM3WhxAYsHKIHjwysh5ESLpZ3CKhQHOO3Y690wTenj216J6ySX4Iu0WkhpSS1Fmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=jSM6HUqN; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="jSM6HUqN"
ARC-Seal: i=1; a=rsa-sha256; t=1734590085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IErqo3xYd62R6fXb2KR1IRqsCklgr0lgS7EiNrN6zDplxAM0Oh0/x8RCZHD7hC1umjYzw4fRgANKo1Tk6etf/NPuwF3eiS2x/8x2BMsXQFLoEtnJ4/oc2EJ9Xzehkltw+Ij/xEL8dpanVNPl36aEqvpiqMqDvThoqsxg+PamUOM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734590085; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X5fx8CjVkQyQD6A25nE8ANwLSyDJ6nBLQUYdNE0EB5M=; 
	b=MHedB3P7FFqnBvZN7WzEwGb4Bjygv5XpppS5FTPz8gSE5HjOE4sc9KHPpsUI74v5/TDph2CtA6GQ2zwmmi0pjrqrBmjbv8LESGUCv7kOyJKdjwle6ONSWesySCRLI4poG4LTXslk5aSqGaJXyXn5a8Hmwj/dMqPmgBjYw1I8ZDI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734590085;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=X5fx8CjVkQyQD6A25nE8ANwLSyDJ6nBLQUYdNE0EB5M=;
	b=jSM6HUqNG9RlAf2xmhxB9bmmfDm49EkA9Sdwo1upBIHzUevoUQv9DxMOyjk1AZAt
	YPRqQDUHiSknQlhAr3GYj03WXF887nkuIfF0WRb1aKatfMiMpPdMI7n08FcZ4FbSVff
	RWvSiNwxyu/7L8xMpiM0Fj7V7h1J8YTIL7DaUhBAfaNpG3wePY7+pxpntlzbPQVUsLl
	Xo5RZgJSs0cWDx2KDoCmGeXNRh1JCuLWOINGacGGl+6xIthX1eHUm5tRA4144GYDL0r
	vZ5QqzA+ED0LAoabik7edBFydMRKCc/pSUgXLcFhMgCr/VDXq4ccIeChpj5LLNaXImi
	bAFXyvFXfw==
Received: by mx.zohomail.com with SMTPS id 1734590083382821.4701941908438;
	Wed, 18 Dec 2024 22:34:43 -0800 (PST)
Message-ID: <8348a0abe70ce9ddd584cf7170946bd8646578cd.camel@icenowy.me>
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
Date: Thu, 19 Dec 2024 14:34:34 +0800
In-Reply-To: <c9fd9cdc-4116-4181-a1b5-2b5dd1e37f56@linux.dev>
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
	 <932a9a93c00082645df465862231f6d8c91f3bf6.camel@icenowy.me>
	 <80e0813a-0651-41cf-a82d-776acbf1a5bc@linux.dev>
	 <ffd9ab359d2234e7ed680f161152d95c449e96bd.camel@icenowy.me>
	 <c9fd9cdc-4116-4181-a1b5-2b5dd1e37f56@linux.dev>
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

=E5=9C=A8 2024-12-19=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 13:49 +0800=EF=BC=
=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 2024/12/19 12:49, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-12-19=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 10:54 +0800=EF=
=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > > On 2024/12/18 20:43, Icenowy Zheng wrote:
> > > > For the fact of drm/ast's dramatical drop, it's because write
> > > > to
> > > > the
> > > > framebuffer can no longer be reordered.
> > >=20
> > > No, your understanding is wrong, very very wrong and a big wrong.
> > >=20
> > > It's not because it can't reorder the write. Rather, it's because
> > > that the CPU can't do write gathering and can't do burst write
> > > any
> > > more.
> > Write gathering is a kind of write reordering,
>=20
>=20
> No, your understanding is broken.
>=20
> Write gathering *isn't* a kind of write reordering.
> Its doesn't have to reorder, it just cache the write operation with
> the CPU's write buffer.
>=20
>=20
> > comparing to strongly
> > ordered writing (which is literally one byte per write).
> >=20
> > > So do you still think your patch is harmless?
> > Well, I said that performance w/o correctness is meaningless.
>=20
>=20
> The point is that Write-Combine on drm/ast will get both correctness
> and performance.

But in general writecombining is broken (if it's broken in one place,
it's broken and not totally right, and needs to be handled).

I said in another mail that if you want to keep this performance, you
should add another pgprot_ type instead of using pgprot_writecombine
(which breaks other drivers).

>=20
>=20
> > >=20

