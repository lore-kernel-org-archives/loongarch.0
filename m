Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A21459FA
	for <loongarch@lists.linux.dev>; Sat, 21 Mar 2026 09:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774084520; cv=pass; b=VZc/fiXK1V9hqfd/Pgvu9+FMqm4ZfDIMDIwAI3Iwz1MG3ZrQJmfNrkL1k7ZpiYgdAFybUp+7CuRzNZEmAq/0cx4XXAt4RqtyTK9f361tzziGOWAL5NJi6ewE4Zdy46cGCLiecLt32pJu4v78s8KbF6Uv/M0hPkzO9FKA1CYKafk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774084520; c=relaxed/simple;
	bh=WmwVbMKfkcbeIrba3xAAx3ApJ4JHyUDZUdKMCLnKEqM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KfXSDe9qjeRcYjFf8ARKcAsbCJDOl6qT6YRcf/U/0ohf8x26GKmB8h3T0suEizPbRZGBy+BiJtJuFlPgWzedAAWzKpLaeaQ20E2NaCw+lwF533Ge/2qZfZqfiTiBK9CDeLN3Z2wQg/L9PNE9jdoZzlg33elx+7Lwlmi6L5WJJe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=TXfgG11E; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="TXfgG11E"
ARC-Seal: i=1; a=rsa-sha256; t=1774084515; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XUsmdMmzgegC4CdweLdlh+no3tDu8j9AxD3mKnwO1h42Mjks4o8dRBsXhlelSPmzae3odYu1msLriVweGMudqhHy//9R1LDE/YTaeol5KIPvvvf+72Yejjf3dsR4kCAdEbvykQtFfo0Ofs+BnVRB1NGdqra7DDLGQuhDSji3xGs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774084515; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WmwVbMKfkcbeIrba3xAAx3ApJ4JHyUDZUdKMCLnKEqM=; 
	b=EotlQH4lNcPkyOoQ7oZoVV69NRTEmOV1y3647YQybLtod8u4opxGphEKyFbZ8yOv2HI8LgbnPlF0DVpCWMIA2GQmKrKuqSVagyPA5aqeMXS/GkMlozONyROTqEXOxulEFHc8mdpGzILSdY9jfHdEKbR9P99ebsH1fOq2h7U7uZU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774084515;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=WmwVbMKfkcbeIrba3xAAx3ApJ4JHyUDZUdKMCLnKEqM=;
	b=TXfgG11ErVzQL70BQlys1uoB4fnUjnClpLw2jLvl7/1mfkQ0SGywSrJ0vnWj5NCP
	thr4UnvhkGnGX5YTtVLnmfBv1cU0h4eAtmoVwiwYQdjuSPIBxZitAzuHiZ1lg7HLsYg
	dj7+8FfXRAz6nYAxJdguugWDKhm9dNmwEX/eb8+ZBSN/rvN/8JXBuXNeZaY3cSoLKLh
	iQqZke6xX8GxA++XPVN7uVv8g5jz2+XLcb5C2ETqVK4xKjhL5UK6SXZ833zf3AObBdj
	0KznnHvrisk0JKJEJYZu7/qhiMUFOEwRQwGRMTwpMuE7vi/LGKHwL74qE0ZVt30g5cl
	1fREnPkQ1Q==
Received: by mx.zohomail.com with SMTPS id 1774084513012509.29549878929595;
	Sat, 21 Mar 2026 02:15:13 -0700 (PDT)
Message-ID: <04f8471accc8e2f71969df336a6c2fe40ae1178c.camel@icenowy.me>
Subject: Re: [PATCH v3 0/8] Add support for LS7A LPC IRQ for MIPS Loongson
 systems
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer	 <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Yao Zi	 <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Date: Sat, 21 Mar 2026 17:15:03 +0800
In-Reply-To: <874imalv2h.ffs@tglx>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
	 <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
	 <874imalv2h.ffs@tglx>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-03-20=E4=BA=94=E7=9A=84 10:16 +0100=EF=BC=8CThomas Gleixner=
=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Mar 18 2026 at 21:57, Huacai Chen wrote:
> > > =C2=A0 MIPS: Loongson64: dts: sort nodes
> > s/sort/Sort/g
> >=20
> > > =C2=A0 MIPS: Loongson64: dts: add node for LS7A PCH LPC
> > s/add/Add/g
> >=20
> > In addition, I think the last two patches should be in another
> > series
> > because they won't go to the irqchip tree.
>=20
> Correct.

To be honest, I don't know whether the first two patches should go to
the irqchip tree either; but the irqchip driver refactor depends on
these two patches.

Thanks,
Icenowy

