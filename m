Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64E1AC8A5
	for <loongarch@lists.linux.dev>; Thu, 15 Aug 2024 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723719141; cv=none; b=bs/0RC4wK9FNGjNRXP4d6q+YFhnOEvMmxhP8d6gdxozUtdt65qaOqSO5P5ZjDhEIgrNhTD0gj9WFtdcLyFpeTzKwz5MR09tRGQCkz6/JOBe4Voi6LQfsEOg7yLS+7yiJ1HtxEat5k2DPIsDOcI6uE2tyG4jG9bISdfEwCxM0EY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723719141; c=relaxed/simple;
	bh=CIx15BpVVjAnQ+BMzs3Mz2q3qlZzo3sap9HWXBV8Fpw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UEeZzatmCMi86EwTaA2yn3ZPp3R5/QSMz9ZkL19+8p6yENfQs5/1m0GKcaqSvjbFgMYN2ywxmdBLjWCfkeKzXyrP7Fvm35t8vuuDdaAaVB56wOFjzVcXoXw2YsL8n73qPveWequjpG4GLWdadEBJp9wHodT5ItDLSCJC0szh83M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=NZ3w0Axf; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="NZ3w0Axf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1723719132;
	bh=CIx15BpVVjAnQ+BMzs3Mz2q3qlZzo3sap9HWXBV8Fpw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NZ3w0AxfE6MOg339xwRlrOUTnEzKTUejTyTKHN7u3MsrNli35S97OmeAdeXfTiGyn
	 2THZuRds9vLCjkkEjOqGIwnCD5Ube58YxokPdJ2XuHPi+dLxNMIdEeeNfNfK0x/SLt
	 NwNfiH5hskD8ikeGsyI4BOpwSP3UWpU2/xjsuRMI=
Received: from [IPv6:240e:456:1030:181:abd4:6e7f:e826:ac0f] (unknown [IPv6:240e:456:1030:181:abd4:6e7f:e826:ac0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 57BC366F26;
	Thu, 15 Aug 2024 06:51:54 -0400 (EDT)
Message-ID: <25d8b51db163c01d62518bd02449d5f5e8748fde.camel@xry111.site>
Subject: Re: [PATCH Loongarch-avec support V9 1/2] irqchip/loongson-pch-msi:
 Switch to MSI parent domains
From: Xi Ruoyao <xry111@xry111.site>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, Thomas Gleixner
 <tglx@linutronix.de>, corbet@lwn.net, alexs@kernel.org,
 chenhuacai@kernel.org,  kernel@xen0n.name, jiaxun.yang@flygoat.com,
 gaoliang@loongson.cn,  wangliupu@loongson.cn, lvjianmin@loongson.cn,
 yijun@loongson.cn, mhocko@suse.com,  akpm@linux-foundation.org,
 dianders@chromium.org, maobibo@loongson.cn,  zhaotianrui@loongson.cn,
 nathan@kernel.org, yangtiezhu@loongson.cn,  zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Date: Thu, 15 Aug 2024 18:51:47 +0800
In-Reply-To: <d5c5fdc8-abd5-685f-b952-f36b9e0bd908@loongson.cn>
References: <20240813085415.20035-1-zhangtianyang@loongson.cn>
	 <875xs3petd.ffs@tglx> <6495631f-ec9c-c86a-39d2-1ada793b8098@loongson.cn>
	 <8734n6np4a.ffs@tglx> <d5c5fdc8-abd5-685f-b952-f36b9e0bd908@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2024-08-15 at 18:43 +0800, Tianyang Zhang wrote:
> Hi, Thomas
>=20
> =E5=9C=A8 2024/8/15 =E4=B8=8B=E5=8D=884:53, Thomas Gleixner =E5=86=99=E9=
=81=93:
> > On Thu, Aug 15 2024 at 09:13, Tianyang Zhang wrote:
> > > https://lore.kernel.org/all/20240813085427.20194-1-zhangtianyang@loon=
gson.cn/
> > >=20
> > > =E5=9C=A8 2024/8/14 =E4=B8=8B=E5=8D=886:41, Thomas Gleixner =E5=86=99=
=E9=81=93:
> > > > On Tue, Aug 13 2024 at 16:54, Tianyang Zhang wrote:
> > > >=20
> > > > Where is patch 2/2 ?
> > Can you please thread your submissions properly and not send them
> > separately?
> >=20
> > Thanks,
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20
> I relearned the series of patches in the kernel submission guide. Now I=
=20
> know how to generate the series-cover.
>=20
> Can I resend all patches directly with a correct cover now?

Just version it v10.  Using "resend" in the subject can sometimes cause
confusion, and there's no harm to bump the version number anyway even
without real code change.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
