Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3A220F08C
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775996669; cv=none; b=uc2m9TgsnEm1l9MjSxFD8V0Ljd3AB6mI+8I08eIjTiNycFVzHy0NpLkI4jNSx8h54wZ/a+O3aYPfnYsd1U9pfIpq2Zc4DxDinmAcOPcF+/zSgGS98jZsqUw9XLBXi0NbRS5xjVLCOrb/LIn2NsxnvuytH1qRkLjjQjkBl54MJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775996669; c=relaxed/simple;
	bh=lQj6a4EGb7jnkwAxvlFj+7xLMD04VSwAl625pJpbJ6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQ66qA2M8QnEwzIu2KIRvoV4txc6JVzvOXbtJx8Sqg96lpYQI7zNclMpy/6PEBYjAFjAnrDYyTjyUnbi5o9haR9vNcGDz0LYY+NZ3C/201J7tI5fjj//Ad0Ct0L6Aaa9zBz7lRaf7BqWH5hPtw4hcdb9oom0pYfhDMDm9G7NFfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKSc3eo9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKSc3eo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE51CC19424
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 12:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775996668;
	bh=lQj6a4EGb7jnkwAxvlFj+7xLMD04VSwAl625pJpbJ6o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NKSc3eo91KbLLr24xbw773VXAc2hlnyAA1XLOnR6EbMSW7bCEdBMgn6g4x/MZRNFo
	 ifbGJqsVo3hBd5BhVxtq8mZ61zlOs8jl0YHhVD6ne++DVIPahQemByD03gwajvUi5V
	 9gj4sab08BP8V9STp770ygyLLZYWGJOX+3cZcbATDPejAgHFqXOrDIyVrnKtltEF1x
	 mGFmX1wb+L61h4jJBuqdzKJvn3Qz1IKC51EANgqqqCaJvrmkfhkzjXuzecGXTpIuZO
	 8z7FPfPn2ZFLHMdyI9lKxvGkcmgoDree2Ap8BZ5vaNTo1e3yDJ8He88ihaIW5bA3An
	 CZaFbQflb+VvQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b982b0889d8so472702666b.2
        for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 05:24:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ZQrvfCDGpBzgX9xKb7rC56QlS8aqRCUg+YD0uzT01DDsNIPbahk2mhQLK4XtA5XGBBVP9DmwWtrg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZblpbFsUDtqsyQ1DltyfgbmFuh/Wlr9PZ2tsFSvSoZqjBB23y
	0gmgUvYjVPnF1OuVszVUhK8B6g5D/L5Y0aNDV3ddbJNEjSKQmhgB/S5+lcZc0ShN2UsIL1QiLri
	UFsby6Xd45tqMa7b0yxtkcba3o/Mh7KM=
X-Received: by 2002:a17:907:3e8d:b0:b9d:8eaf:6526 with SMTP id
 a640c23a62f3a-b9d8eaf68bemr398006466b.1.1775996667206; Sun, 12 Apr 2026
 05:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328225916.51802-2-xtex@envs.net> <CAAhV-H5Y=iPfS5FLN92eL+KauSfuLsPtiSajfFnjaQqXOtuYdA@mail.gmail.com>
 <4731624.LvFx2qVVIh@xtex1>
In-Reply-To: <4731624.LvFx2qVVIh@xtex1>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 12 Apr 2026 20:24:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ShNQBo1+CZQjPH_pFvnH4x6Xn8xdP6ayBGVNqAQmieA@mail.gmail.com>
X-Gm-Features: AQROBzCpE3LT6mpuKpVmkN7meBye7kTsg4fnRkwayB57iKXG_ZvBnJ0yyHdFCRA
Message-ID: <CAAhV-H5ShNQBo1+CZQjPH_pFvnH4x6Xn8xdP6ayBGVNqAQmieA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Increase default mmap randomization bits
To: Bingwu Zhang <xtex@envs.net>
Cc: WANG Xuerui <kernel@xen0n.name>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bingwu Zhang <xtex@astrafall.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 11:49=E2=80=AFAM Bingwu Zhang <xtex@envs.net> wrote=
:
>
> On Sunday, March 29, 2026 11:48:02=E2=80=AFAM China Standard Time Huacai =
Chen wrote:
> > Hi, Bingwu,
> >
> > On Sun, Mar 29, 2026 at 6:59=E2=80=AFAM Bingwu Zhang <xtex@envs.net> wr=
ote:
> > > From: Bingwu Zhang <xtex@astrafall.org>
> > >
> > > Increase default mmap randomization bits from 12 to 18 on 64-bit
> > > platforms for better strength.
> > >
> > > The original default, 12, means that ASLR offset has only (1 << 12) =
=3D
> > > 4096 possibilities. On average, it can be brute-forced in 2048 attemp=
ts.
> > > If a service is configured to restart automatically or can be started
> > > easily (e.g. execve a suid program), then trying for 4k times can be
> > > done in one day even when each attempt takes 20s.
> > > Increasing it to 18 makes brute-force much more difficult and leaves
> > > more time for operators to find out attacks.
> > >
> > > On 64-bit platforms, virtual address space is cheap, so the
> > > randomization bits can be increased safely without disturbing userlan=
d
> > > much and security comes first instead of availability.
> >
> > Don't change ARCH_MMAP_RND_BITS_MIN because it may compact
> > performance, and you cannot blindly increase ARCH_MMAP_RND_BITS_MAX
> > because it should no more than "VA_BITS - PAGE_SHIFT - 3" (see
> > arch/riscv/Kconfig and arch/csky/Kconfig). For LoongArch, VA_BITS can
> > be 39 (half of VA40), PAGE_SHIFT can be 16 (64KB page), so
> > ARCH_MMAP_RND_BITS_MAX can only increase up to 20 (39 - 16 - 3 =3D20).
>
> Sorry for the late reply.
>
> It was my mistake that I didn't notice the upper bound of MAX. Thank you =
for
> pointing out!
>
> However, I didn't get where increasing MIN could compact performance.
> Theoretically, the only difference is that the gap between heaps and stac=
ks
> are larger, from [128, 128+64]M to [128, 128+4096]M. This shouldn't affec=
t
> performance much. MIPS once used MIN=3D16, RISC-V 64 and PowerPC and ARM =
64 are
> using 18, and x86-64 is using 28, but I hadn't heard anyone complaining a=
bout
> the performance.
>
> I ran some benchmarks last weekend using the LLVM build benchmark of AOSC=
 OS
> https://github.com/AOSC-Dev/buildbot-benchmark/blob/master/buildbot-bench=
mark.bash
> and here are the results
>
> Processor       Rand bits       Time/secs
> Average Variance        Range
> 3C6000/S        18      612.927 614.394 614.513 613.343 614.76
> 613.9874        0.515637840000006       1.83299999999997
> 3C6000/S        12      614.322 613.93  614.825 613.859
> 615.875 614.5622        0.548874160000007       2.01599999999996
> 3A5000  18      3547.165        3548.764        3552.192        3545.697
> 3547.567        3548.277        4.79228759999993        6.49499999999989
> 3A5000  12      3549.029        3551.894        3549.191        3567.869
> 3587.409        3561.0784       222.052853440003        38.3800000000001
>
> I didn't see any statistically meaningful performance defect.
OK, then we can increase ARCH_MMAP_RND_BITS_MIN, but the range 18~20
seems too small and then useless, can we consider using 15~20?


Huacai

>
> >
> > These are done in:
> > https://github.com/chenhuacai/linux/commit/ff35475dcfbd4c6e9c275aaef3c9=
2da71
> > 0894058
> >
> > Huacai
> >
> > > Fixes: fa96b57c1490 ("LoongArch: Add build infrastructure")
> > > Signed-off-by: Bingwu Zhang <xtex@astrafall.org>
> > > ---
> > >
> > >  arch/loongarch/Kconfig | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > index 92068ff38685..b47c4e4ecbb7 100644
> > > --- a/arch/loongarch/Kconfig
> > > +++ b/arch/loongarch/Kconfig
> > > @@ -740,9 +740,11 @@ config MMU
> > >
> > >         default y
> > >
> > >  config ARCH_MMAP_RND_BITS_MIN
> > >
> > > +       default 18 if 64BIT
> > >
> > >         default 12
> > >
> > >  config ARCH_MMAP_RND_BITS_MAX
> > >
> > > +       default 32 if 64BIT
> > >
> > >         default 18
> > >
> > >  config ARCH_SUPPORTS_UPROBES
> > >
> > > base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> > > --
> > > 2.52.0
>
> Best regards,
>
> --
> Bingwu Zhang @ Sun, 12 Apr 2026 03:28:14 +0000
