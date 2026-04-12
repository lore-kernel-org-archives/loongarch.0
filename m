Received: from mail.envs.net (mail.envs.net [157.180.15.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9281A6828
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 03:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.15.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775965766; cv=none; b=cJS6xfmiRz9zJFZqtMGInKjBsRuVAyoyWgNmQywmV+XjbOHrGyFE/ADzJtyFUy0wLEtFOMw43xBt/o5JbCWKoWy576riyc26a3JYpTgx6rCNoLjfaTBIoIRKqtVb7fCGz+zwfDYk0mjqPa+3ZvrSpluix9bhxOy33zzJJB8VMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775965766; c=relaxed/simple;
	bh=pScwoqlXgCQss6XMQt3w58Nsdvmiy9tZaBH7i48Av2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tikWwCfsEjrm3G58cxd76y7tr2hAFVZoLVcbq0APK+QdQxI18E8h0gvCzSsgJNwsT2Hb+JffE9wuJjOLegBgtLXSh8Z9NjfKdinh5WlJfBEVhBWX1erXDPQcYfoNPr9VP6/z19JllRyp08+BPKDqlJK+vUSXi5rOB9cAw1bAq2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=DokFcd09; arc=none smtp.client-ip=157.180.15.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="DokFcd09"
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 1A7C21C00D1;
	Sun, 12 Apr 2026 03:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1775965761; bh=meIUje4QxaQjxsMpDOIAZ0usJBkZpkQstyKWkHPuz1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DokFcd09dwXr7BxU24NUhEVT7Lmzt7NnPK1TTrcb65zBeKL1EvK/K1JtfJhfByhQR
	 tY495PjAvYmjszRD5veV5CS1TBr5Ue2nbXuseOfDv7b83Jk5CEJXwwGKizlx7oCDBc
	 fWeSzJEbTXDUVbafXXYyJpYizURJbavU8/q7pM+/490nJzqIxbsYDQpZ8d21bnHt0c
	 8p10FO/498cFCH8Cww61gnyfIExds4tkBPe++WyDPNR4BeR+z9l5LyCpnwUQQSNkTZ
	 Ig0iVy8hJSb5VgPzqiTqU8psYfkzfOBiujWwB7WPsRbMweCv11QLpVAIU9Pmyknrrd
	 TuA9gLcyQIakN0D4gmmPx82G1j/V1BZFLMWhZEC11a9dTKU0QXiZkXPtVr/h5E+nMk
	 lookWHauHj4mi+TKG/Lg1qCSRYjjObHHVSC//MFB09IXe7ERcdTML5p4XzA97SMKVf
	 DnJ75+u1QCkB55kIt8ePlWrESLBZdtDlXAjwQPdLaItEBbdlSMaBUbmLhyS4kTQvzD
	 FTVSr1K6VA+z75u/XXr8coeG/lMxbWzBxAaQJjrWjZ/WCvOvhDo8G05idExS1ypm4X
	 K/pi2HIZcdJa8tIFDIDfl2wrmaoChaVQIQUsCwzw/LA+nrznreyI+07dC/FK1kt4PS
	 oGSIK8lerr8ZP93ZIm40qOBM=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lKRUNH-m5mXt; Sun, 12 Apr 2026 03:49:17 +0000 (UTC)
Received: from xtex1.localnet (unknown [89.251.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 12 Apr 2026 03:49:16 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Guo Ren <guoren@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Bingwu Zhang <xtex@astrafall.org>
Subject: Re: [PATCH] LoongArch: Increase default mmap randomization bits
Date: Sun, 12 Apr 2026 11:49:10 +0800
Message-ID: <4731624.LvFx2qVVIh@xtex1>
In-Reply-To:
 <CAAhV-H5Y=iPfS5FLN92eL+KauSfuLsPtiSajfFnjaQqXOtuYdA@mail.gmail.com>
References:
 <20260328225916.51802-2-xtex@envs.net>
 <CAAhV-H5Y=iPfS5FLN92eL+KauSfuLsPtiSajfFnjaQqXOtuYdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2411512.ElGaqSPkdT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2411512.ElGaqSPkdT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Bingwu Zhang <xtex@envs.net>
To: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 12 Apr 2026 11:49:10 +0800
Message-ID: <4731624.LvFx2qVVIh@xtex1>
MIME-Version: 1.0

On Sunday, March 29, 2026 11:48:02=E2=80=AFAM China Standard Time Huacai Ch=
en wrote:
> Hi, Bingwu,
>=20
> On Sun, Mar 29, 2026 at 6:59=E2=80=AFAM Bingwu Zhang <xtex@envs.net> wrot=
e:
> > From: Bingwu Zhang <xtex@astrafall.org>
> >=20
> > Increase default mmap randomization bits from 12 to 18 on 64-bit
> > platforms for better strength.
> >=20
> > The original default, 12, means that ASLR offset has only (1 << 12) =3D
> > 4096 possibilities. On average, it can be brute-forced in 2048 attempts.
> > If a service is configured to restart automatically or can be started
> > easily (e.g. execve a suid program), then trying for 4k times can be
> > done in one day even when each attempt takes 20s.
> > Increasing it to 18 makes brute-force much more difficult and leaves
> > more time for operators to find out attacks.
> >=20
> > On 64-bit platforms, virtual address space is cheap, so the
> > randomization bits can be increased safely without disturbing userland
> > much and security comes first instead of availability.
>=20
> Don't change ARCH_MMAP_RND_BITS_MIN because it may compact
> performance, and you cannot blindly increase ARCH_MMAP_RND_BITS_MAX
> because it should no more than "VA_BITS - PAGE_SHIFT - 3" (see
> arch/riscv/Kconfig and arch/csky/Kconfig). For LoongArch, VA_BITS can
> be 39 (half of VA40), PAGE_SHIFT can be 16 (64KB page), so
> ARCH_MMAP_RND_BITS_MAX can only increase up to 20 (39 - 16 - 3 =3D20).

Sorry for the late reply.

It was my mistake that I didn't notice the upper bound of MAX. Thank you fo=
r=20
pointing out!

However, I didn't get where increasing MIN could compact performance.
Theoretically, the only difference is that the gap between heaps and stacks=
=20
are larger, from [128, 128+64]M to [128, 128+4096]M. This shouldn't affect=
=20
performance much. MIPS once used MIN=3D16, RISC-V 64 and PowerPC and ARM 64=
 are=20
using 18, and x86-64 is using 28, but I hadn't heard anyone complaining abo=
ut=20
the performance.

I ran some benchmarks last weekend using the LLVM build benchmark of AOSC OS
https://github.com/AOSC-Dev/buildbot-benchmark/blob/master/buildbot-benchma=
rk.bash
and here are the results

Processor	Rand bits	Time/secs				=09
Average	Variance	Range
3C6000/S	18	612.927	614.394	614.513	613.343	614.76=09
613.9874	0.515637840000006	1.83299999999997
3C6000/S	12	614.322	613.93	614.825	613.859=09
615.875	614.5622	0.548874160000007	2.01599999999996
3A5000	18	3547.165	3548.764	3552.192	3545.697=09
3547.567	3548.277	4.79228759999993	6.49499999999989
3A5000	12	3549.029	3551.894	3549.191	3567.869=09
3587.409	3561.0784	222.052853440003	38.3800000000001

I didn't see any statistically meaningful performance defect.

>=20
> These are done in:
> https://github.com/chenhuacai/linux/commit/ff35475dcfbd4c6e9c275aaef3c92d=
a71
> 0894058
>=20
> Huacai
>=20
> > Fixes: fa96b57c1490 ("LoongArch: Add build infrastructure")
> > Signed-off-by: Bingwu Zhang <xtex@astrafall.org>
> > ---
> >=20
> >  arch/loongarch/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 92068ff38685..b47c4e4ecbb7 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -740,9 +740,11 @@ config MMU
> >=20
> >         default y
> > =20
> >  config ARCH_MMAP_RND_BITS_MIN
> >=20
> > +       default 18 if 64BIT
> >=20
> >         default 12
> > =20
> >  config ARCH_MMAP_RND_BITS_MAX
> >=20
> > +       default 32 if 64BIT
> >=20
> >         default 18
> > =20
> >  config ARCH_SUPPORTS_UPROBES
> >=20
> > base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> > --
> > 2.52.0

Best regards,

=2D-=20
Bingwu Zhang @ Sun, 12 Apr 2026 03:28:14 +0000

--nextPart2411512.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRyMYBLBSxnDxWmdx25GAhu2ARbkQUCadsWNhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQuRgIbtgEW5GtfAEAgDBxrzN67peUzuGnwM3y
ZkYyX8UJR3tmAaaaEtq+GwwBALrDPxwCdN/iH9Yb0uotKKWXsV4tfFqBkEu4M2V1
pbQM
=mLO5
-----END PGP SIGNATURE-----

--nextPart2411512.ElGaqSPkdT--



