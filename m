Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8951C26E6F8
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775997373; cv=none; b=YcvbZf5G+CDRFM6QiRn2rkcB4S/j4RvtrTQhxMbV/YRM76g4jFViP9+AnWktBrI/CrprZbSI0t36ujjQHTnRe4sqybxCBxgUXMQh6uQ7TAvxD/cbJek23xL5hjVU/sJ4Avm5uPuBF4z9BGA0X/ZXlfdZ8BB12gnSBnc96QwvxXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775997373; c=relaxed/simple;
	bh=MRJQjCzfoXbDfSkXzVgRW5mAdU5npzSsPIV48U1s4MM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9K+Jraks20E1PUq+JP417LYYpO+XwYaXNfuSJ77Vw2XncFqBf9dzjjeGFat1wcPY707a8dEREjD0xFbxgVvQKyVXkaZd/eoZaLq/uoE5DxNPyOHZ+7QXU9jLgcZ/jeO+qdW1seH4vBHSJzVM7jwDcttcjQRexVPuXVP+NLfFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNBQMjGQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNBQMjGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404E7C2BCB0
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 12:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775997373;
	bh=MRJQjCzfoXbDfSkXzVgRW5mAdU5npzSsPIV48U1s4MM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rNBQMjGQhxEbjTEn0/0hXSj7YA+Glb6OU6sxHAI5tAa/bUGFSd5kePsYwghgSJ737
	 NSHhqRTFLvJaOMnruJnDfAeMg47a3oHvRRdLmnbNDWtvK+3U2YjDWK2QmeHT27LPyQ
	 Sgk6pjgCiXlgiD0UaZiEvDTwfOfXeQ9zfdFIS8xAaOcyL2uSZnfQYAwA1yXTvHyXpB
	 iG24Cp4qPrePiQ20T3OvV5U6tO+DBvsKoa1cJ63bHxyyUNdHe7IvttWX2WH0k/rmEa
	 8p2jSJFkXvKdvzDffcwQEwyK5St1Ev7A1HFN3bkrXmzNjaAJCrF5iPxB44JtEGNryr
	 arplUKjGwFpwQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9d9971d059so211758566b.2
        for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 05:36:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7Z3yOljm3BnX8SOeYQ0yg3a+YrwvNdfGkf2SmCr1mvfhHBJ0K8D2o99U10byGKpRhX2IehWNq6tw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNGSQqbA25bcOjjHkpsvzlljfmwSiXwDUnZ3LGRUFu8KEV6EM4
	VvyxzDmVRfy05EeHmdcxaOojNACpvURPsRqPMMvChtJQ8UXk20eWSx48+Pvxr88RTsGwak6Voni
	ZfOxCRmlcXqTL6nFr95FQl8tGrpSTi5E=
X-Received: by 2002:a17:907:8d8f:b0:b9d:326c:463 with SMTP id
 a640c23a62f3a-b9d727b6731mr432899366b.23.1775997371724; Sun, 12 Apr 2026
 05:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328225916.51802-2-xtex@envs.net> <CAAhV-H5Y=iPfS5FLN92eL+KauSfuLsPtiSajfFnjaQqXOtuYdA@mail.gmail.com>
 <4731624.LvFx2qVVIh@xtex1> <CAAhV-H5ShNQBo1+CZQjPH_pFvnH4x6Xn8xdP6ayBGVNqAQmieA@mail.gmail.com>
 <3c60383dc05bfebc3fe3b641622d66d68d867757.camel@xry111.site>
In-Reply-To: <3c60383dc05bfebc3fe3b641622d66d68d867757.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 12 Apr 2026 20:36:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H57mgJw3YeVA6QTyFKu7fEK9BT5jdMTqbFzfPPbyP9pPg@mail.gmail.com>
X-Gm-Features: AQROBzCE7YUTie8C2rhCUG-q0yJ7pvSswb9gL5Hdq0eiIF2LE6PWCyiBS3IrOxA
Message-ID: <CAAhV-H57mgJw3YeVA6QTyFKu7fEK9BT5jdMTqbFzfPPbyP9pPg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Increase default mmap randomization bits
To: Xi Ruoyao <xry111@xry111.site>
Cc: Bingwu Zhang <xtex@envs.net>, WANG Xuerui <kernel@xen0n.name>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bingwu Zhang <xtex@astrafall.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 8:32=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Sun, 2026-04-12 at 20:24 +0800, Huacai Chen wrote:
> > On Sun, Apr 12, 2026 at 11:49=E2=80=AFAM Bingwu Zhang <xtex@envs.net> w=
rote:
> > >
> > > On Sunday, March 29, 2026 11:48:02=E2=80=AFAM China Standard Time Hua=
cai Chen wrote:
> > > > Hi, Bingwu,
> > > >
> > > > On Sun, Mar 29, 2026 at 6:59=E2=80=AFAM Bingwu Zhang <xtex@envs.net=
> wrote:
> > > > > From: Bingwu Zhang <xtex@astrafall.org>
> > > > >
> > > > > Increase default mmap randomization bits from 12 to 18 on 64-bit
> > > > > platforms for better strength.
> > > > >
> > > > > The original default, 12, means that ASLR offset has only (1 << 1=
2) =3D
> > > > > 4096 possibilities. On average, it can be brute-forced in 2048 at=
tempts.
> > > > > If a service is configured to restart automatically or can be sta=
rted
> > > > > easily (e.g. execve a suid program), then trying for 4k times can=
 be
> > > > > done in one day even when each attempt takes 20s.
> > > > > Increasing it to 18 makes brute-force much more difficult and lea=
ves
> > > > > more time for operators to find out attacks.
> > > > >
> > > > > On 64-bit platforms, virtual address space is cheap, so the
> > > > > randomization bits can be increased safely without disturbing use=
rland
> > > > > much and security comes first instead of availability.
> > > >
> > > > Don't change ARCH_MMAP_RND_BITS_MIN because it may compact
> > > > performance, and you cannot blindly increase ARCH_MMAP_RND_BITS_MAX
> > > > because it should no more than "VA_BITS - PAGE_SHIFT - 3" (see
> > > > arch/riscv/Kconfig and arch/csky/Kconfig). For LoongArch, VA_BITS c=
an
> > > > be 39 (half of VA40), PAGE_SHIFT can be 16 (64KB page), so
> > > > ARCH_MMAP_RND_BITS_MAX can only increase up to 20 (39 - 16 - 3 =3D2=
0).
> > >
> > > Sorry for the late reply.
> > >
> > > It was my mistake that I didn't notice the upper bound of MAX. Thank =
you for
> > > pointing out!
> > >
> > > However, I didn't get where increasing MIN could compact performance.
> > > Theoretically, the only difference is that the gap between heaps and =
stacks
> > > are larger, from [128, 128+64]M to [128, 128+4096]M. This shouldn't a=
ffect
> > > performance much. MIPS once used MIN=3D16, RISC-V 64 and PowerPC and =
ARM 64 are
> > > using 18, and x86-64 is using 28, but I hadn't heard anyone complaini=
ng about
> > > the performance.
> > >
> > > I ran some benchmarks last weekend using the LLVM build benchmark of =
AOSC OS
> > > https://github.com/AOSC-Dev/buildbot-benchmark/blob/master/buildbot-b=
enchmark.bash
> > > and here are the results
> > >
> > > Processor       Rand bits       Time/secs
> > > Average Variance        Range
> > > 3C6000/S        18      612.927 614.394 614.513 613.343 614.76
> > > 613.9874        0.515637840000006       1.83299999999997
> > > 3C6000/S        12      614.322 613.93  614.825 613.859
> > > 615.875 614.5622        0.548874160000007       2.01599999999996
> > > 3A5000  18      3547.165        3548.764        3552.192        3545.=
697
> > > 3547.567        3548.277        4.79228759999993        6.49499999999=
989
> > > 3A5000  12      3549.029        3551.894        3549.191        3567.=
869
> > > 3587.409        3561.0784       222.052853440003        38.3800000000=
001
> > >
> > > I didn't see any statistically meaningful performance defect.
> > OK, then we can increase ARCH_MMAP_RND_BITS_MIN, but the range 18~20
> > seems too small and then useless, can we consider using 15~20?
>
> IMO ARCH_MMAP_RND_BITS_MIN should be just the minimal that the
> architecture can support, not related to security.  If you want to
> recommend a value for increasing security you'd set
> ARCH_MMAP_RND_BITS_DEFAULT a larger value instead.
If so, just keep 12.

Huacai

>
> --
> Xi Ruoyao <xry111@xry111.site>
