Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D232221F24
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775997170; cv=none; b=S9pLY/NA0z4eR0jdFwwevCImWHYYZXvUV5biDhN1cE5TJrWDegdTzeFIQV8KX8SiceiCuCGJWo8AB0U0RHBEF/9i7IvwNCqlba1b1y40fUZd3fdjRf/sGqVB4XySOylehGwSVKM0muKPWmqgRczknIajlj1NdergGvjKo39gyjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775997170; c=relaxed/simple;
	bh=lpbdsVEsjZAbmIWnC1drKb+3LgnY638JvpvClfR9j/U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JaWKBfLFHR8OjIpM3X7QR1hiATRRpPr1Xc3EkcJO3FxR+kCXuv81v7qXhySUjuuqHr36BdUCLnCQegYYLFFlWPkS8zchn0pxz9QqZaC2zpiX60Z2c1fbVjI+CGIEGmk2x1Qvb3/KXNHPh82HJSwm+ej4sJeDy+nXJyw5amIiVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=Ku0Sg4Rt; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="Ku0Sg4Rt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1775997163;
	bh=W3EdVy4qgCYWEsxTLrfEHJqr1xIiKQc+QS/vOdRwfmQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ku0Sg4RtgzHKrG4Qj6fpsrL5/Q+oplUr3F7mv78WkTRfnVrBniPh/m9umnuVNk0RU
	 p6n3pJtBL9W1WFVE9ad9wPKL2WQwRR4C2H1QnenXARkyMcbINHDDlFuunua3QcBxQX
	 1he5z0HfG748Ha5ZGq1a4IGVKpm6cp+e1pg08fdo=
Received: from [IPv6:2409:8a4c:e10:5280:f007:4005:95fb:69ef] (unknown [IPv6:2409:8a4c:e10:5280:f007:4005:95fb:69ef])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5FE4965992;
	Sun, 12 Apr 2026 08:32:39 -0400 (EDT)
Message-ID: <3c60383dc05bfebc3fe3b641622d66d68d867757.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Increase default mmap randomization bits
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Bingwu Zhang <xtex@envs.net>
Cc: WANG Xuerui <kernel@xen0n.name>, Guo Ren <guoren@kernel.org>, Jiaxun
 Yang	 <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bingwu Zhang <xtex@astrafall.org>
Date: Sun, 12 Apr 2026 20:32:23 +0800
In-Reply-To: <CAAhV-H5ShNQBo1+CZQjPH_pFvnH4x6Xn8xdP6ayBGVNqAQmieA@mail.gmail.com>
References: <20260328225916.51802-2-xtex@envs.net>
	 <CAAhV-H5Y=iPfS5FLN92eL+KauSfuLsPtiSajfFnjaQqXOtuYdA@mail.gmail.com>
	 <4731624.LvFx2qVVIh@xtex1>
	 <CAAhV-H5ShNQBo1+CZQjPH_pFvnH4x6Xn8xdP6ayBGVNqAQmieA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2026-04-12 at 20:24 +0800, Huacai Chen wrote:
> On Sun, Apr 12, 2026 at 11:49=E2=80=AFAM Bingwu Zhang <xtex@envs.net> wro=
te:
> >=20
> > On Sunday, March 29, 2026 11:48:02=E2=80=AFAM China Standard Time Huaca=
i Chen wrote:
> > > Hi, Bingwu,
> > >=20
> > > On Sun, Mar 29, 2026 at 6:59=E2=80=AFAM Bingwu Zhang <xtex@envs.net> =
wrote:
> > > > From: Bingwu Zhang <xtex@astrafall.org>
> > > >=20
> > > > Increase default mmap randomization bits from 12 to 18 on 64-bit
> > > > platforms for better strength.
> > > >=20
> > > > The original default, 12, means that ASLR offset has only (1 << 12)=
 =3D
> > > > 4096 possibilities. On average, it can be brute-forced in 2048 atte=
mpts.
> > > > If a service is configured to restart automatically or can be start=
ed
> > > > easily (e.g. execve a suid program), then trying for 4k times can b=
e
> > > > done in one day even when each attempt takes 20s.
> > > > Increasing it to 18 makes brute-force much more difficult and leave=
s
> > > > more time for operators to find out attacks.
> > > >=20
> > > > On 64-bit platforms, virtual address space is cheap, so the
> > > > randomization bits can be increased safely without disturbing userl=
and
> > > > much and security comes first instead of availability.
> > >=20
> > > Don't change ARCH_MMAP_RND_BITS_MIN because it may compact
> > > performance, and you cannot blindly increase ARCH_MMAP_RND_BITS_MAX
> > > because it should no more than "VA_BITS - PAGE_SHIFT - 3" (see
> > > arch/riscv/Kconfig and arch/csky/Kconfig). For LoongArch, VA_BITS can
> > > be 39 (half of VA40), PAGE_SHIFT can be 16 (64KB page), so
> > > ARCH_MMAP_RND_BITS_MAX can only increase up to 20 (39 - 16 - 3 =3D20)=
.
> >=20
> > Sorry for the late reply.
> >=20
> > It was my mistake that I didn't notice the upper bound of MAX. Thank yo=
u for
> > pointing out!
> >=20
> > However, I didn't get where increasing MIN could compact performance.
> > Theoretically, the only difference is that the gap between heaps and st=
acks
> > are larger, from [128, 128+64]M to [128, 128+4096]M. This shouldn't aff=
ect
> > performance much. MIPS once used MIN=3D16, RISC-V 64 and PowerPC and AR=
M 64 are
> > using 18, and x86-64 is using 28, but I hadn't heard anyone complaining=
 about
> > the performance.
> >=20
> > I ran some benchmarks last weekend using the LLVM build benchmark of AO=
SC OS
> > https://github.com/AOSC-Dev/buildbot-benchmark/blob/master/buildbot-ben=
chmark.bash
> > and here are the results
> >=20
> > Processor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Rand bits=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Time/secs
> > Average Variance=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Range
> > 3C6000/S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 612.927 614.394 614.513 613.343 614.76
> > 613.9874=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.515637840000006=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.83299999999997
> > 3C6000/S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 614.322 613.93=C2=A0 614.825 613.859
> > 615.875 614.5622=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.5488741600=
00007=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.01599999999996
> > 3A5000=C2=A0 18=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3547.165=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 3548.764=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 3552.192=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3545.697
> > 3547.567=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3548.277=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.79228759999993=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 6.49499999999989
> > 3A5000=C2=A0 12=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3549.029=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 3551.894=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 3549.191=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3567.869
> > 3587.409=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3561.0784=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 222.052853440003=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 38.3800000000001
> >=20
> > I didn't see any statistically meaningful performance defect.
> OK, then we can increase ARCH_MMAP_RND_BITS_MIN, but the range 18~20
> seems too small and then useless, can we consider using 15~20?

IMO ARCH_MMAP_RND_BITS_MIN should be just the minimal that the
architecture can support, not related to security.  If you want to
recommend a value for increasing security you'd set
ARCH_MMAP_RND_BITS_DEFAULT a larger value instead.

--=20
Xi Ruoyao <xry111@xry111.site>
