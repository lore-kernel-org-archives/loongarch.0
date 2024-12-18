Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0C14D430
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503032; cv=pass; b=Zd+hxJ1CViL0bx897+Sui/iApbHB0jlSRPz+8Mw8ErnPK1BhEMJLlxsxNRFAxkklyGTvi7N3ObXbF1WLE845wW43tfBftOhahVNgT/KFKzXGZV0kGO5fNTLBztzE2o/0BAgyTCXCJZCv5Pjitrms5T/Hn5l63cClMjnTO+YHrac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503032; c=relaxed/simple;
	bh=SdyXMIXwhDtuFs0AkHQIhapER8DmeBnS5LAFp8fjg8o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DcE4JThGonv6vAQHBe90vX7tEcAdw1+piYwjzeH+LUbHJ1w+yqJ1VkkMtPEOAZ540J7BAp8aAw+LT9b1eQC/otxoJy8Jhwgviiwfdr8dHGutwIR4xIOl0cA7sgmevEwXXCekZaLGJ5rD/GInhjyIGaonh8urchHsEfR2pgJBFIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=jZ4MZCuB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="jZ4MZCuB"
ARC-Seal: i=1; a=rsa-sha256; t=1734503021; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S3nbsSxVCn2zMH2Ur/xk3/PT5gYzHXUgnNl75s51KJZjYL3UDXkHyMbnpCiQQRcWSTVWA6qVEnuWWLjsmoAA0m4KtEFWf1XbPAIfxzYs/3XQmD5k8WF9ColFBW16iPWa6QiZvmQvcS4zwInFYO6F64/+rADGvz3f69xYieRx7n8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734503021; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SdyXMIXwhDtuFs0AkHQIhapER8DmeBnS5LAFp8fjg8o=; 
	b=Z6teiG2TX7fyiBsq7vhz4F2m6g1zD0BrBe3nVylD250klpadWgl5huGZKDUR4ks+Xe9xNG+ZlSuZWPYQ6bSG6kaq1awWT8+IKfuCTqsKQd4QO4AX7BaiibaI+F4pB8w5t5lyqP4dF4dttGyv21rmnfonZqOIUgw9Oby/mJ3MOss=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734503021;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=SdyXMIXwhDtuFs0AkHQIhapER8DmeBnS5LAFp8fjg8o=;
	b=jZ4MZCuBJu+PDHn57XfULGnOvTxz3KLpmDXlalYMfzq0RJo/FmFKOMrskC3FB28p
	vkZHieze7zmQX5HXPfFgUiI9fQ2zc7l73pKjMgezOOGU0JzqhNpcGC3WVtm62/K4v7Y
	4ny9DZOKSKI4kEYi+bcfVMiIlNDR60RMDi+siWhdvwq3ZWSaSEINZIIMSyx0ILXZ2hs
	E+DOW4eDCmX+IvMxjuSMKcHGksUqhx096dl0FWlCmZrMvHbDhcjViWNttWxIThvnpBc
	b4S5xrBTdg1V0cXj75gbjBJMrFntOHDzRFY9mu3TYClNtoWQTTSKwYFo4wVmEqw8iGr
	u7fRSoZYmg==
Received: by mx.zohomail.com with SMTPS id 1734503020094198.01486104999674;
	Tue, 17 Dec 2024 22:23:40 -0800 (PST)
Message-ID: <0f3989e46dd24a0c972482ea570907e5d8cae87e.camel@icenowy.me>
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
Date: Wed, 18 Dec 2024 14:23:31 +0800
In-Reply-To: <655c2b73-4ecf-4201-83b8-bbddfd68027e@linux.dev>
References: <20231009042841.635366-1-uwu@icenowy.me>
	 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
	 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
	 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
	 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
	 <dfc53da9-a1ab-4ab3-aba2-d100f7f28b9b@linux.dev>
	 <c27875eb-0989-401b-98c3-f6e0a3ab88c2@kernel.org>
	 <655c2b73-4ecf-4201-83b8-bbddfd68027e@linux.dev>
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

=E5=9C=A8 2024-12-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:24 +0800=EF=BC=
=8CSui Jingfeng=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
>=20
> On 2024/12/18 02:18, Shuah wrote:
> > On 12/2/24 09:23, Sui Jingfeng wrote:
> > > Hi,
> > >=20
> >=20
> > > > IIUC this is a hardware bug of 7A1000 and 7A2000, so the proper
> > > > location
> > > > of the workaround is in the bridge chip driver.=C2=A0 Or am I
> > > > misunderstanding something?
> > > >=20
> > >=20
> > > You are misunderstanding everything and ranting like a dog.
> > >=20
> >=20
> > Sui Jingfeng,
> >=20
> > This is not the way to work with your fellow developers in the
> > community to express disagreements.
>=20
>=20
> I'm not expressing disagreements, but argue that the contributor
> and/or talker should provide *sufficient* hardware details and
> tests. Instead of pointless *ranting* in order to get harmful
> patch merged.

I don't think the original patch is harmful.

It changes wrong things to corect, do not break known-good things,
although I assume it will slightly harm the performance -- but I think
performance w/o correctness is just meaningless. In the perspective of
graphics, you can nearly always "enhance your performance" by sending
everything to /dev/null and pretend them to be done.

>=20
> The discussion completely not make scene at all.
>=20
>=20
> > I would recommend following up with an apology.
> >=20
>=20
> I will not apology to indecent contributors and/or maintainers
> like this, never.
>=20
>=20
> > thanks,
> > -- Shuah
> >=20
> >=20
> >=20
> >=20
> >=20

