Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F58318EC7
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598712; cv=none; b=DzjwmLZM+SFr60l7bLC+39KYyHFrGyw07/6Y+LlC++9WsLeSScmmqkcokktug9HBhiLb9e7GKRix/vTrjEBiXAwyVjxIS/FlfMbnEzOiO21OLxEjWMSIESR4viotdduQnIsKkTC5oogB/taQXCb1O2JK0fyPlOt4SzjMT4WMbSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598712; c=relaxed/simple;
	bh=oYUk4Q3ZcK79T8/5Pzp+PrGbR17VtBHeFBEbK06E5EI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LmHKBpv9le8tcFEeR5Is1rJWuLQmKFr8irQCnm4hqnWpM7mGu/0J5uNjDiYB7p0xArMzS8/jAl1jy/eDyaWwGxsTGAqaTqrv1O6cymuCBpYkqHzGT2osbZuLk5cKiuAIE5yx6FDRZQY/A6Z3pj6yf1LvjCxhtY9VqZw+CGkyQbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=bGxIt/tw; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="bGxIt/tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1788598698;
	bh=cfx208P/VHuKubRO3Y8NKHN1tS7x9fILwifEveehfqQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bGxIt/twpiqt0oCzND24gJTAlLUe2r+6lE/yVP0Za3YKmJ/rw25VPilZLMcVXY1m+
	 6L0Tg9ovj0O1P3ctXzj1FOdVA9pUUg0m8rHTXW3me9526J2NjGz4+6SsZYPMJnRJ95
	 6mUXEhhFGmqPhjMqKi3VUN8lRlQ4sLrNtZswnJE8=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9043D65983;
	Sat,  5 Sep 2026 04:58:15 -0400 (EDT)
Message-ID: <8037e44f5f6405463a3a1f8ce3661a39c3333b51.camel@xry111.site>
Subject: Re: [PATCH] loongarch: expose LAMCAS existence via cpuinfo and hwcap
From: Xi Ruoyao <xry111@xry111.site>
To: Rong Bao <rong.bao@csmantle.top>, Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Arnd Bergmann <arnd@arndb.de>,  George Guo
 <dongtai.guo@linux.dev>, Yangyang Lian <lianyangyang@kylinos.cn>, Kexy
 Biscuit	 <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>, Rong Bao	
 <baorong2005@126.com>, Yawei Li <liyawei@loongson.cn>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 05 Sep 2026 16:58:13 +0800
In-Reply-To: <7d309743-8e87-47a7-b2df-515e424db724@csmantle.top>
References: <20260905032010.4962-1-rong.bao@csmantle.top>
	 <CAAhV-H7nyh5bU1uHRY9HdMyz44VEPov3oa4rFCGu=Y-HSoVPZQ@mail.gmail.com>
	 <7d309743-8e87-47a7-b2df-515e424db724@csmantle.top>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-09-05 at 12:58 +0800, Rong Bao wrote:
> Hi Huacai,
>=20
>=20
> On 2026-09-05 12:46, Huacai Chen wrote:
> > [...]
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Features=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : cpucfg lam lam_bh scq ual fpu lsx lasx
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crc32 complex crypto=
 lspw lvz lbt_x86 lbt_arm lbt_mips
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hardware Watchpoint=
=C2=A0=C2=A0=C2=A0=C2=A0 : yes, iwatch count: 8, dwatch count: 4
> > >=20
> > > ... while the CPUCFG 2 instruction reads "0x7e7ccfcf", whose bit 28 i=
s 1,
> > > indicating the actual presence of LAMCAS.
> > Can we use LAM_CAS in the code, which is similar to LAM_BH?
>=20
>=20
> I originally chose "LAMCAS" and not "LAM_CAS" deliberately to match the=
=20
> manual spelling. For example, in "LoongArch Reference Manual, Volume 1
> (version 1.10)"[^0], Table 3 reads as follows:
>=20
> =C2=A0> 27	LAM_BH	1 indicates support AM{SWAP/ADD}[_DB].{B/H}.
> =C2=A0> 28	LAMCAS	1 indicates support AMCAS[_DB].{B/H/W/D}.
>=20
> Also, in "Toolchain Conventions of the LoongArch(tm) Architecture,=20
> Version 1.2"[^1], these two extensions are also stylized with different=
=20
> hyphenation:
>=20
> =C2=A0> -mlam-bh	-m[no-]lam-bh	Enable atomic operations=20
> am{swap/add}[_db].{b/h}.	LoongArch V1.1
> =C2=A0> -mlamcas	-m[no-]lamcas	Enable atomic compare-and-swap instruction=
s=20
> amcas[_db].{b/h/w/d}.	LoongArch V1.1

I wrote them for GCC and I just verbatim copied the identifiers from the
reference manual.

But IIRC we've once discussed this and concluded that the user space
should just use cpucfg unless the feature requires kernel support (i.e.
LSX, LASX, and LBT must be checked via HWCAP instead of cpucfg as they
require the kernel to enable the hardware unit and manage the context
switch)?

Maybe using HWCAP instead of cpucfg can be useful as well when the
kernel can detect a hardware/firmware bug and remove the corresponding
bit from HWCAP, but the previous discussion about buggy LA364E firmware
implementation (causing sc.q semantic error) concluded that the kernel
will be very unlikely to ship such a work around.  And AFAIK there's no
such a bug reported for LAMCAS ever...

--=20
Xi Ruoyao <xry111@xry111.site>
