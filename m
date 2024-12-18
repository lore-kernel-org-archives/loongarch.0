Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F9199FC5
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525496; cv=pass; b=GGEQH9Yj65aeOdclc0VH2zGgFZGmvQh8ODAl0fC/u9tSCuZWsIipJAPPvfva9n0DHYXKcc4jkQfmZHHQv+kv10ot9wO3hlOi7PXNDhT8wTM4sUQ6AQEU7vQPlDOhiN0iEmSaHHHsO50tbjdD6kd6ETj0v+KTlhk7nxbNhlziw9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525496; c=relaxed/simple;
	bh=zydPGtCGoWKR5KxhVLjheLwfDpb873UH7etWzLz4uaY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IMGjMZNf5oIqhKw4YGg0Rv5g1vsv3LIBvoDbyobFJP44eBQ+2vvouu+2JtSZ0J1jrqWDa1I4eCCjhqLVBVR8UpPrcFEiDpRTJRQaGh3WeeFwcNkQVkSE2+k5NiPNY8dtXESJht6CSRJfl4xKdYaqwbyGeeUqNbkVd5qH4DBQfQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=CmaRzvuJ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="CmaRzvuJ"
ARC-Seal: i=1; a=rsa-sha256; t=1734525476; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OMN5v8nnfoT2rIoa4PmUzxmhQGK9+ViZ2y2SW7V+BUvkcaGEBzEQNIzlE3syZ1GzGJqi7HVtno8cnelRI2x/tXwHdgXfYFmhzvoez5y88z45Q5CI9OtUMdJN5a4nGAamo1XbrQgkYXrAC/RJR2lDb+Mg8/gZVy9EJi07elGA3Eo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734525476; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zydPGtCGoWKR5KxhVLjheLwfDpb873UH7etWzLz4uaY=; 
	b=RhsaKwRyeHS+8EP6bxuMbFrpC1Hd1K09sDzz6MBvS3y5WMAsI2XZ6DsHDv62KsmX3CFacqN0HWdbn59YsosSpxl/pvGRTNud2Es0srIWwV7bENlzPAR4NhE85EwgCH+2dAAnF/PdXOQJ8eV7P2xlH+QHZh/0bd1ozCyjGWavvbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734525476;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=zydPGtCGoWKR5KxhVLjheLwfDpb873UH7etWzLz4uaY=;
	b=CmaRzvuJw3eD8UzX4Z+jqngrk8vAiceZWd4jbrjA7MFVF/x3JOQEcFwneT+tEMWp
	PKWDsswZ6GLqCQWh9t6K9DcWvTpfeJbYqF8DmS3rtt1X6DkIvx0qTkomylU+bv3rXMK
	RbE2uIdkc6aTAwTJiYudxhN2aB58VVgtBGeGBnUdMHT5UgKe1nTjz8u4NntEkQlT0VR
	KVeuPTD4Vd292TJ4MZNl6bxLnihnwXPUNk0EbVTDU8Z3XpC7pXt8jaDKgz05T2M9iLX
	XP/hARqAdGSBts4E7WTMH3COj+lsIkkgh4Uq1eJxKWLHZrJAvM5+BEySjT3yobAEgOw
	bfedmUuEdw==
Received: by mx.zohomail.com with SMTPS id 1734525474525264.74488123585104;
	Wed, 18 Dec 2024 04:37:54 -0800 (PST)
Message-ID: <8d38328adea0d752b09a91f69e7a94d4804ac725.camel@icenowy.me>
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
From: Icenowy Zheng <uwu@icenowy.me>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Shuah <shuah@kernel.org>, Xi
 Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, Huacai Chen
 <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Baoquan He <bhe@redhat.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, David Hildenbrand <david@redhat.com>, Zhen Lei
 <thunder.leizhen@huawei.com>, Thomas Gleixner <tglx@linutronix.de>, Zhihong
 Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org,  "conduct@kernel.org" <conduct@kernel.org>
Date: Wed, 18 Dec 2024 20:37:42 +0800
In-Reply-To: <0ca63dfb-ece7-4ea5-a61c-a80fa0567c4d@linux.dev>
References: <20231009042841.635366-1-uwu@icenowy.me>
	 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
	 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
	 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
	 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
	 <dfc53da9-a1ab-4ab3-aba2-d100f7f28b9b@linux.dev>
	 <c27875eb-0989-401b-98c3-f6e0a3ab88c2@kernel.org>
	 <655c2b73-4ecf-4201-83b8-bbddfd68027e@linux.dev>
	 <0f3989e46dd24a0c972482ea570907e5d8cae87e.camel@icenowy.me>
	 <0ca63dfb-ece7-4ea5-a61c-a80fa0567c4d@linux.dev>
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

=E5=9C=A8 2024-12-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 18:05 +0800=EF=BC=
=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
>=20
> On 2024/12/18 14:23, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-12-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:24 +0800=EF=
=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi,
> > >=20
> > >=20
> > > On 2024/12/18 02:18, Shuah wrote:
> > > > On 12/2/24 09:23, Sui Jingfeng wrote:
> > > > > Hi,
> > > > >=20
> > > > > > IIUC this is a hardware bug of 7A1000 and 7A2000, so the
> > > > > > proper
> > > > > > location
> > > > > > of the workaround is in the bridge chip driver.=C2=A0 Or am I
> > > > > > misunderstanding something?
> > > > > >=20
> > > > > You are misunderstanding everything and ranting like a dog.
> > > > >=20
> > > > Sui Jingfeng,
> > > >=20
> > > > This is not the way to work with your fellow developers in the
> > > > community to express disagreements.
> > >=20
> > > I'm not expressing disagreements, but argue that the contributor
> > > and/or talker should provide *sufficient* hardware details and
> > > tests. Instead of pointless *ranting* in order to get harmful
> > > patch merged.
> > I don't think the original patch is harmful.
> >=20
>=20
> I have told you countless times, that is, disabling Write-Combine
> made the performance of BMC graphics(drm/ast) decrease dramatically.

So do the ast driver have any kind of command queues that needs to be
read by the card and executed? If it has, I assume it will break like
amdgpu/radeon if this is utilized (I remember ast has some 2D accel);
if it does not have, then maybe you can add an architecture-specific
pgprot type (e.g. pgprot_wuc), see how pgprot_noncached_wc is defined
for PowerPC or pgprot_device is defined for ARM64 -- in fact you may
find another architecture that have some page attribute that behave
like WUC on LongArch; and then utilize the newly introduced pgprot type
in drm/ast, instead of using WUC as pgprot_writecombine, which do not
exactly match (usual driver expect an ARM-like behavior of
pgprot_combine, I assume).

> And downstream Loongson developer really dislike related patch,
> and asking for solutions to me.
>=20
>=20
> > > The discussion completely not make scene at all.
> > >=20
> > >=20
> > > > I would recommend following up with an apology.
> > > >=20
> > > I will not apology to indecent contributors and/or maintainers
> > > like this, never.
> > >=20
> > >=20
> > > > thanks,
> > > > -- Shuah
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20

