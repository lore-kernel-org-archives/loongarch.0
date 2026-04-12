Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ECF272E61
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775997737; cv=none; b=abUifx/yla2zqxIpRDQvk4q2JE+fPoOG5UPJlKTpveArYM589SzyUoUh+wsw8+eb9PtaMc22bBwlBrG1sqdDsfEaJ855eDYXp4wVMpq2c++JmSOUttB5Hi7+gA47P6AI27lKTPliV1qgdT9MLL6zQ/R46SmWZrmrIYiM9MoF0Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775997737; c=relaxed/simple;
	bh=suedbXptsOlQGrDgCAx5H7QIpu5l3FKacvSKi2ZU4zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWQuY83NgPkJEs13j78S2qpmKH+59INxAXNLZdFDi0U6gcZ7rHJe4iC8t8AACf6g8XkkmfaFeDItYKK/sV3k536vYEzHbzsACSnEtusb7WyzVjxrxy5qTL6sbpWAzlweFfz5NEctDeBDqNI8SevLXNW6+QFIIJtU/VvLXgJzdMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biKsXHWN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biKsXHWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEC0C2BCB0
	for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775997737;
	bh=suedbXptsOlQGrDgCAx5H7QIpu5l3FKacvSKi2ZU4zU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=biKsXHWNe9lXrVsuOqMAP32+oa00WbQpRcAEtmdikgQN+RiCgIq7ybsvYlKBv3sAQ
	 IQ683zm/xl193fCJiNTSJ2S7yvuAn1hrvX3L1zwE/Q9ZVXJsi7bf4Z3/au0q1dRTKh
	 JHMedszb7y8EdWxSH06bZpFYekoyJo0tVNcxlJc0Oy/XhEj6dVssb3wXbL2RhY3gx3
	 iWVsMuQ+brhvPPQz0OlYNAjT9Ls0IplJcnNsNY7fWBh8WWxIoFKALS2//izmVvVDjA
	 Xz7RQOUYsacOOdundTLzLjk/6gOUwzSYFhLxE6m+lUITDAk80z4X2xnHjvNgq9YjFL
	 aGQiY3ajiW5Jg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b982b0889d8so473785166b.2
        for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 05:42:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXf0gLKAfjxlCJkVuF6Z+WXPXXamMa6kKoYYhNl05eHu3onGJIpjLhaOKclYN4++z7JwQiCbp69MyY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSERwLov91U2Juf27VqIbcx6XSi8hbEhChci3tSVRsl3Z7TEMd
	AbyYblhijFveJaK3ffyTFkOW9+oQQYPJ4OR1pcBVX9MjzdvoQhcPanEo88FKkAWaeP7Vp+WAKDm
	iFmKKlWV7dmGYYTA8NoUgWy/o0IbhYfo=
X-Received: by 2002:a17:907:7284:b0:b9d:9741:4ef5 with SMTP id
 a640c23a62f3a-b9d97415fb0mr317500566b.6.1775997735394; Sun, 12 Apr 2026
 05:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328225916.51802-2-xtex@envs.net> <CAAhV-H5Y=iPfS5FLN92eL+KauSfuLsPtiSajfFnjaQqXOtuYdA@mail.gmail.com>
 <4731624.LvFx2qVVIh@xtex1> <CAAhV-H5ShNQBo1+CZQjPH_pFvnH4x6Xn8xdP6ayBGVNqAQmieA@mail.gmail.com>
 <3c60383dc05bfebc3fe3b641622d66d68d867757.camel@xry111.site> <b04efb5af4f5019adbb0adb8543bd84b8157e8e1.camel@xry111.site>
In-Reply-To: <b04efb5af4f5019adbb0adb8543bd84b8157e8e1.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 12 Apr 2026 20:42:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H61JWBx90NWEK=Jf=iNA-MatfuJ8sO=k07Z0Eqt0E34CA@mail.gmail.com>
X-Gm-Features: AQROBzBvcZ_sn4LxFgq4yPFu7y6oBws5MzcuRmAPaSmEYOxjlTbIzH4gQ7ar6qc
Message-ID: <CAAhV-H61JWBx90NWEK=Jf=iNA-MatfuJ8sO=k07Z0Eqt0E34CA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Increase default mmap randomization bits
To: Xi Ruoyao <xry111@xry111.site>
Cc: Bingwu Zhang <xtex@envs.net>, WANG Xuerui <kernel@xen0n.name>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bingwu Zhang <xtex@astrafall.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 8:37=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Sun, 2026-04-12 at 20:32 +0800, Xi Ruoyao wrote:
> > On Sun, 2026-04-12 at 20:24 +0800, Huacai Chen wrote:
> > > On Sun, Apr 12, 2026 at 11:49=E2=80=AFAM Bingwu Zhang <xtex@envs.net>=
 wrote:
> > > >
> > > > On Sunday, March 29, 2026 11:48:02=E2=80=AFAM China Standard Time H=
uacai
> > > > Chen wrote:
> > > > > Hi, Bingwu,
> > > > >
> > > > > On Sun, Mar 29, 2026 at 6:59=E2=80=AFAM Bingwu Zhang <xtex@envs.n=
et>
> > > > > wrote:
> > > > > > From: Bingwu Zhang <xtex@astrafall.org>
> > > > > >
> > > > > > Increase default mmap randomization bits from 12 to 18 on 64-
> > > > > > bit
> > > > > > platforms for better strength.
> > > > > >
> > > > > > The original default, 12, means that ASLR offset has only (1
> > > > > > << 12) =3D
> > > > > > 4096 possibilities. On average, it can be brute-forced in 2048
> > > > > > attempts.
> > > > > > If a service is configured to restart automatically or can be
> > > > > > started
> > > > > > easily (e.g. execve a suid program), then trying for 4k times
> > > > > > can be
> > > > > > done in one day even when each attempt takes 20s.
> > > > > > Increasing it to 18 makes brute-force much more difficult and
> > > > > > leaves
> > > > > > more time for operators to find out attacks.
> > > > > >
> > > > > > On 64-bit platforms, virtual address space is cheap, so the
> > > > > > randomization bits can be increased safely without disturbing
> > > > > > userland
> > > > > > much and security comes first instead of availability.
> > > > >
> > > > > Don't change ARCH_MMAP_RND_BITS_MIN because it may compact
> > > > > performance, and you cannot blindly increase
> > > > > ARCH_MMAP_RND_BITS_MAX
> > > > > because it should no more than "VA_BITS - PAGE_SHIFT - 3" (see
> > > > > arch/riscv/Kconfig and arch/csky/Kconfig). For LoongArch,
> > > > > VA_BITS can
> > > > > be 39 (half of VA40), PAGE_SHIFT can be 16 (64KB page), so
> > > > > ARCH_MMAP_RND_BITS_MAX can only increase up to 20 (39 - 16 - 3
> > > > > =3D20).
> > > >
> > > > Sorry for the late reply.
> > > >
> > > > It was my mistake that I didn't notice the upper bound of MAX.
> > > > Thank you for
> > > > pointing out!
> > > >
> > > > However, I didn't get where increasing MIN could compact
> > > > performance.
> > > > Theoretically, the only difference is that the gap between heaps
> > > > and stacks
> > > > are larger, from [128, 128+64]M to [128, 128+4096]M. This
> > > > shouldn't affect
> > > > performance much. MIPS once used MIN=3D16, RISC-V 64 and PowerPC an=
d
> > > > ARM 64 are
> > > > using 18, and x86-64 is using 28, but I hadn't heard anyone
> > > > complaining about
> > > > the performance.
> > > >
> > > > I ran some benchmarks last weekend using the LLVM build benchmark
> > > > of AOSC OS
> > > > https://github.com/AOSC-Dev/buildbot-benchmark/blob/master/buildbot=
-benchmark.bash
> > > > and here are the results
> > > >
> > > > Processor       Rand bits       Time/secs
> > > > Average Variance        Range
> > > > 3C6000/S        18      612.927 614.394 614.513 613.343 614.76
> > > > 613.9874        0.515637840000006       1.83299999999997
> > > > 3C6000/S        12      614.322 613.93  614.825 613.859
> > > > 615.875 614.5622        0.548874160000007       2.01599999999996
> > > > 3A5000  18      3547.165        3548.764        3552.192
> > > > 3545.697
> > > > 3547.567        3548.277        4.79228759999993
> > > > 6.49499999999989
> > > > 3A5000  12      3549.029        3551.894        3549.191
> > > > 3567.869
> > > > 3587.409        3561.0784       222.052853440003
> > > > 38.3800000000001
> > > >
> > > > I didn't see any statistically meaningful performance defect.
> > > OK, then we can increase ARCH_MMAP_RND_BITS_MIN, but the range 18~20
> > > seems too small and then useless, can we consider using 15~20?
> >
> > IMO ARCH_MMAP_RND_BITS_MIN should be just the minimal that the
> > architecture can support, not related to security.  If you want to
> > recommend a value for increasing security you'd set
> > ARCH_MMAP_RND_BITS_DEFAULT a larger value instead.
>
> I.e. for example if someone is building a distro running on an embedded
> system where avoiding addr space fragmentation is more important than
> security we shouldn't be stopping him to decrease ARCH_MMAP_RND_BITS
> unless he reaches the architecture minimum.  Instead we should increase
> ARCH_MMAP_RND_BITS_DEFAULT so the "typical" systems get a larger
> ARCH_MMAP_RND_BITS.
Hmm, ARCH_MMAP_RND_BITS is visible and configurable, so just keep
ARCH_MMAP_RND_BITS_MIN as 12.

Huacai

>
> --
> Xi Ruoyao <xry111@xry111.site>
