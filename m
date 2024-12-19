Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3730A78F4A
	for <loongarch@lists.linux.dev>; Thu, 19 Dec 2024 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734584076; cv=pass; b=Sz0sivlAFiMol7D8ssYfOcGi5eyq8YvOEebbkQSLdCdc/j6Y+4aR7TeKTdC05hMPTf+dS/PZPmZYjSb3aqtwYrs3g5tuRYRJwCkjKOj0GE82a+LHAf2pQsoNqABWMH4dz7/fmvtzKei0oyjSEa8cAEbTwqPO9yJd+wLATEZxVR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734584076; c=relaxed/simple;
	bh=s4YkKR54rImjy3DOeXxHiD7Ddlvk9iYz6pCxfFKhz2Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TxxZUnvss1ktCt/7aRwMRGZ98Xv4qgBf0eZJbeOH9xPfWMjJevmjUrFYxvnLL107GGA3mMw5igPdkadD/eciWhq3SnSicAPIPKIFvWe10HOg1MkQ+v7GC8Ji53l+qdBlzvYx0ANupkKS1nQlNOvX3td2YUTydhGJNVbJSr/JynI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=Y8MCmweO; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Y8MCmweO"
ARC-Seal: i=1; a=rsa-sha256; t=1734584066; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PWgPkf/GWO3OJ0s89Mmmmz6SrAMMnjSSEoaEG2MVJxnknfuXGuPhd7V51IbM73GfYfi5gWGl2HeRWlrns8kayk5PS8ZJe1lk6ountYazfZRkDSd6KN21aQC00lP2vIndWx9zfD3j+SyOImnF5K8q7zpRVfs6vXyrdDoii2CZ1yI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734584066; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=s4YkKR54rImjy3DOeXxHiD7Ddlvk9iYz6pCxfFKhz2Y=; 
	b=l28DsGyz2G6bVFeRc7Ij8h53lU5RuCrwkAJrJJe/twqVICsipEs+Bo7WyDExKA4buCXZYPcGHT+j3dMycbl8csv519oiwCC8VKUOdMiunk1qkc2DIzw1BKFz5BuQ7iNA6AbV2TB4SRIIZ0ZxQmsxvYxUFw+N31Vk14w7Ug3SiCI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734584066;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=s4YkKR54rImjy3DOeXxHiD7Ddlvk9iYz6pCxfFKhz2Y=;
	b=Y8MCmweONchwixpQGnIoBBmNE5Sp1VVKs6qq4MZutWEJLdTJTzTZ19aToXHuWBcS
	HAZ42Zm3ZTJM5lyF4tXR/JQj2Dv7KjRLXe9dm1GT0I/onc71vY68JE/lEr5en0eyqFq
	oLrhJlN6GZAiHmzk++GzKIRT46b9QkrKFft0D5NtW2/qIXkO8RtjTu6BHdYbApcd/pe
	FR1sOqyX0mmqIAIM6KlVJOZfFFbxTr/+E7TyC8umFrziFoiLiRSTpZ4cGxoSVzAuq4Q
	QO119HIQnIJKPQosdwqQkuPpNaD12tC+dh71/mXARO2p3bUe5UFWAdfdMpuC0OLgUaT
	oAsW0K/obg==
Received: by mx.zohomail.com with SMTPS id 1734584064476121.6883212663821;
	Wed, 18 Dec 2024 20:54:24 -0800 (PST)
Message-ID: <7913a77287f228366de6960b5c5afd2edc301ef2.camel@icenowy.me>
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
Date: Thu, 19 Dec 2024 12:54:16 +0800
In-Reply-To: <147eda64-0673-4698-a79d-0bd367c80b70@linux.dev>
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
	 <8d38328adea0d752b09a91f69e7a94d4804ac725.camel@icenowy.me>
	 <147eda64-0673-4698-a79d-0bd367c80b70@linux.dev>
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

=E5=9C=A8 2024-12-19=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 11:17 +0800=EF=BC=
=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
>=20
> On 2024/12/18 20:37, Icenowy Zheng wrote:
> > =E5=9C=A8 2024-12-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 18:05 +0800=EF=
=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi,
> > >=20
> > >=20
> > > On 2024/12/18 14:23, Icenowy Zheng wrote:
> > > > =E5=9C=A8 2024-12-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:24 +080=
0=EF=BC=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Hi,
> > > > >=20
> > > > >=20
> > > > > On 2024/12/18 02:18, Shuah wrote:
> > > > > > On 12/2/24 09:23, Sui Jingfeng wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > > IIUC this is a hardware bug of 7A1000 and 7A2000, so
> > > > > > > > the
> > > > > > > > proper
> > > > > > > > location
> > > > > > > > of the workaround is in the bridge chip driver.=C2=A0 Or am
> > > > > > > > I
> > > > > > > > misunderstanding something?
> > > > > > > >=20
> > > > > > > You are misunderstanding everything and ranting like a
> > > > > > > dog.
> > > > > > >=20
> > > > > > Sui Jingfeng,
> > > > > >=20
> > > > > > This is not the way to work with your fellow developers in
> > > > > > the
> > > > > > community to express disagreements.
> > > > > I'm not expressing disagreements, but argue that the
> > > > > contributor
> > > > > and/or talker should provide *sufficient* hardware details
> > > > > and
> > > > > tests. Instead of pointless *ranting* in order to get harmful
> > > > > patch merged.
> > > > I don't think the original patch is harmful.
> > > >=20
> > > I have told you countless times, that is, disabling Write-Combine
> > > made the performance of BMC graphics(drm/ast) decrease
> > > dramatically.
> > So do the ast driver have any kind of command queues that needs to
> > be
> > read by the card and executed? If it has, I assume it will break
> > like
> > amdgpu/radeon if this is utilized (I remember ast has some 2D
> > accel);
> > if it does not have, then maybe you can add an architecture-
> > specific
> > pgprot type (e.g. pgprot_wuc), see how pgprot_noncached_wc is
> > defined
> > for PowerPC or pgprot_device is defined for ARM64
>=20
>=20
> drm/ast driver doesn't perform DMA to/from system RAM so far.
>=20
>=20
> > =C2=A0 -- in fact you may
> > find another architecture that have some page attribute that behave
> > like WUC on LongArch; and then utilize the newly introduced pgprot
> > type
> > in drm/ast, instead of using WUC as pgprot_writecombine, which do
> > not
> > exactly match (usual driver expect an ARM-like behavior of
> > pgprot_combine, I assume).
>=20
>=20
> This exactly saying that your patch is unqualified, because its not
> entirely an arch-specific problem.

Well I don't declare that there is one architecture, I am only saying
"may".

I am only describing the fact that architectures can have custom
pgprot_*() functions that maps to some architecture details when
mapping to generic pgprot_*() is not appropriate.

>=20
> Your patch, together with other WC disable patch make the WC mapping
> of LoongArch completely broken. then you told us "you don't think
> the original patch is harmful" ???

WC mapping is not broken now. WC is only an optimization, not a
requirement.

If you see `include/linux/pgtable.h`, you will find the fallback
implementation of pgprot_writecombine() is just pgprot_noncached(),
which is just strongly ordered.

However the original implementation that maps WC to LoongArch WUC is
what is broken, so broken that observable by desktop end-users.

>=20
>=20
> > > And downstream Loongson developer really dislike related patch,
> > > and asking for solutions to me.
> > >=20
> > >=20
> > > > > The discussion completely not make scene at all.
> > > > >=20
> > > > >=20
> > > > > > I would recommend following up with an apology.
> > > > > >=20
> > > > > I will not apology to indecent contributors and/or
> > > > > maintainers
> > > > > like this, never.
> > > > >=20
> > > > >=20
> > > > > > thanks,
> > > > > > -- Shuah
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > >=20

