Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82838E5E8
	for <loongarch@lists.linux.dev>; Wed,  8 Apr 2026 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636864; cv=none; b=fk0YPHp2mzcomS8H/S2FCGzuzH6rqDxNE407v6BgKzOztuYkHe4vYZ0mF37qO2Kv/qFhF6yiMQw5S7iYyz/8nJw4+8VXSlw10zxTqvbQ4nuuClfQU4kHwbQtXjpWYcn5ZVc2L8HQT/ROCRqN1fA9zZLwNnFjbsT+7mguzf11a/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636864; c=relaxed/simple;
	bh=Lu9jjGOuTjnDll4WHziAjPU6oUQv4qUBGYSSJsl1xyY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aD4S38r3LGxQWXDmSJlYxjQnpK3YUwjP4325+CNduExOu0ze5Oo7WYr9jU4d1Qdm2dRJNyXB42f2l1GoApXlrpkbYihP3I7EKm0Z7ud5kkLOLKJMgc76uMq558xZPVxhqqjjajK2VpRTpCuYj2ghtTW2jdE8XD4C47Z2JiWyKpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=EmCrTMcu; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="EmCrTMcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1775636862;
	bh=Lu9jjGOuTjnDll4WHziAjPU6oUQv4qUBGYSSJsl1xyY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EmCrTMcuZcxHti0BTlQJ2qNJC6thewCX7eFSwpNikU3tcXK4uwuJ84OdT9szXPzr8
	 V1/tXEw0oBck7YXpFLWnw/JgrAmWQRV9V6lT7C4qSjC1r46VKEnhxSjL2XY9wHcHPO
	 GdzJWmt5RDA/Zy6rM144tmkFk6DDXI/pvgOxq6Lo=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 58A9565992;
	Wed,  8 Apr 2026 04:27:39 -0400 (EDT)
Message-ID: <4df596e36d48496327b10695e4fe5102cc5ac695.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: add spectre boundry for syscall dispatch
 table
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev,
 arnd@arndb.de, 	jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org, WANG
 Xuerui	 <kernel@xen0n.name>, stable <stable@kernel.org>
Date: Wed, 08 Apr 2026 16:27:35 +0800
In-Reply-To: <CAAhV-H4Q1kaTMhJt8CsN2FS1vfkWLpOxuj8hqYaTr1UgLC5LLg@mail.gmail.com>
References: <2026032456-crinkle-washable-96ea@gregkh>
	 <f59de81b411d1a48f9f0fa4f8c9c553a92076817.camel@xry111.site>
	 <2026032541-rental-sizably-48bd@gregkh>
	 <2026040259-landowner-chamomile-f581@gregkh>
	 <60f0307f-0c44-4f14-0185-4f0a16cf3a9c@loongson.cn>
	 <2026040814-console-curvy-fd6f@gregkh>
	 <CAAhV-H4Q1kaTMhJt8CsN2FS1vfkWLpOxuj8hqYaTr1UgLC5LLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-04-08 at 16:20 +0800, Huacai Chen wrote:
> Hi, all,
>=20
> On Wed, Apr 8, 2026 at 1:26=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >=20
> > On Wed, Apr 08, 2026 at 09:17:07AM +0800, Bibo Mao wrote:
> > >=20
> > >=20
> > > On 2026/4/2 =E4=B8=8B=E5=8D=8810:36, Greg Kroah-Hartman wrote:
> > > > On Wed, Mar 25, 2026 at 09:53:09AM +0100, Greg Kroah-Hartman wrote:
> > > > > On Wed, Mar 25, 2026 at 11:26:29AM +0800, Xi Ruoyao wrote:
> > > > > > On Tue, 2026-03-24 at 17:30 +0100, Greg Kroah-Hartman wrote:
> > > > > > > The LoongArch syscall number is directly controlled by usersp=
ace, but
> > > > > > > does not have a array_index_nospec() boundry to prevent acces=
s past
> > > > > > > the
> > > > > > > syscall function pointer tables.
> > > > > > >=20
> > > > > > > Cc: Huacai Chen <chenhuacai@kernel.org>
> > > > > > > Cc: WANG Xuerui <kernel@xen0n.name>
> > > > > > > Assisted-by: gkh_clanker_2000
> > > > > > > Cc: stable <stable@kernel.org>
> > > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org=
>
> > > > > > > ---
> > > > > > > My scripts caught this as I think LoongArch is vulnerable to =
the
> > > > > >=20
> > > > > > There's no evidence.=C2=A0 The kernel currently report all Loon=
gArch
> > > > > > processors invulnerable to spectre V1 via cpuinfo.
> > > > >=20
> > > > > Where is that?=C2=A0 In the sysfs files, or in the actual silicon=
 testing?
> > > > >=20
> > > > > > So NAK unless there's a reproducer of spectre V1 on LoongArch.=
=C2=A0 If so
> > > > > > we'd also need to adjust the cpuinfo output.
> > > > >=20
> > > > > I really thought this cpu was vulnerable to this, but if the comp=
anies
> > > > > say it isn't, then great, but reports like this:
> > > > > =C2=A0 https://cc-sw.com/chinese-loongarch-architecture-evaluatio=
n-part-3-of-3/
> > > > > say that the silicon is vulnerable.=C2=A0 So, which is it?
> > > >=20
> > > > Any thoughts about this?
> > > co-ask though it is hard to decide :(
> >=20
> > Can't you all run the reproducers on your platform to determine this?
> > There should be some basic ones around somewhere, this is a very old bu=
g
> > :)
> I have consulted with the chip designers. They confirmed that existing
> LoongArch processors are vulnerable to Spectre-V1. But this conclusion
> is just for the PoC (as [1] said,=C2=A0 Spectre-V1 is not easily mitigate=
d
> in hardware), it is very difficult to create a real attack program.
> This is not even a LoongArch-specific problem.
>=20
> As an additional point, LoongArch's boundary-checking memory access
> instructions, which provide immunity against Spectre-V1, are not
> convenient enough to automatically apply to all critical code
> sections.
>=20
> Anyway, user pointer sanitization is the proper mitigation of
> Spectre-V1, and that is exactly what this patch does. So, I will take
> this patch and update other corresponding parts of the kernel.
>=20
> [1] https://cc-sw.com/chinese-loongarch-architecture-evaluation-part-3-of=
-3/

Then IMO we should update cpuinfo report as well (well, maybe also for
other architectures, if there are literally no hardware immune to the
issue).

--=20
Xi Ruoyao <xry111@xry111.site>
