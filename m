Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F1175A70
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 02:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776047916; cv=none; b=h32gFhL5nHPMkbA4NQURkflTvrRKWd2YbCxEZR3v6UgKYBnRDM0iw6cv0RaBgqsVm+6vkgIVpLlHYgOhGC9jHX2c3pBdfKU8OVNhQ1A1lPlDyEk2J8MOI18Zw4wb3WJ3+Qfgl8/QDgUDTXNKtofJWvARrScv0/YhhBIahF8MP4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776047916; c=relaxed/simple;
	bh=ItSYeWnWCiPb0Aeom0Qhy8GcVn6DQdrjAJ0cfpcOJhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaDDXp26ipeOMAWsN0V8riVlfUGiSpUDn1h6AllsjxeGlEc9fEciVvEVo7qiYGatSIp/79ItJdpRj66jljUGtaQSL/uooTCl50C1lvfJLCGCuvg71pxMJ3ywN1gMytQeycFEM7rRh3LHOvTW7zO4GF0QYAzMZr47a/h2lJopAp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpLZ1pgi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpLZ1pgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1379EC19424
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 02:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776047916;
	bh=ItSYeWnWCiPb0Aeom0Qhy8GcVn6DQdrjAJ0cfpcOJhI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SpLZ1pgiYmOUOg7wO1VetTSrL21O4JB9zShO8xGC/V+83M8xTmghdfHTtRoJUjnLX
	 kUAe73chzufuQEeOcpv9ZZXMATgueB8jP+WXWCC1SuoDcVnXNmrcGcNc6OH8T7WAcZ
	 /8tpS17mX8cSE/UkRKoDbp8XwP8lAQ6yw47cFEpqZrqsfL3JK+4wMh8r1DBfJVvL0O
	 wMrMXHCqCD8X1JplVLJHDXqO1/2jH+5BIp+sX5ZcA8efUe1ZmX+6BvBFvL07c4u4f4
	 OiWuExWkpKnTw85DRzlqcVrEPBsFrM3lYnTwjilFkvny+Tjkx6j3yHYO/OaTQTdaKG
	 RXhuuaDliJkjw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c6f1d1282so513944266b.3
        for <loongarch@lists.linux.dev>; Sun, 12 Apr 2026 19:38:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fawdJpvHhG/aD5blkYBa0R9Qg8VrS/o1yJvsRuXvowEAMbbYqX70DXNkI7E4LbFWHlPZJZfq+NUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLTkIO8DQ+ywMVkbIZrGHn8ZqOazBhM3WeyRBcExS+U0uFvSo8
	baSuv4MNTnmVLyMz9UJwnSxhEl/Nhj0ELj74yI0JUcvu6/yV88PfXOLlUPtDf+lvUtqGwjYnidG
	sjOn5UdNseXOgF77kIzGpabtr/K+gSw8=
X-Received: by 2002:a17:907:1c07:b0:b9d:4652:2f75 with SMTP id
 a640c23a62f3a-b9d722f6b43mr603600466b.0.1776047914555; Sun, 12 Apr 2026
 19:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b04efb5af4f5019adbb0adb8543bd84b8157e8e1.camel@xry111.site> <177604593472.1254.15849043200496555555@mail.envs.net>
In-Reply-To: <177604593472.1254.15849043200496555555@mail.envs.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 13 Apr 2026 10:38:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6x=YjutHSobvKi2Fq+-sD_8aOZoj-Ba-PFuQQ6hp=HMQ@mail.gmail.com>
X-Gm-Features: AQROBzB4UuZFs6ivBz-O2jDQtocIHzhTUpfkgwUBMIMjTInUtq5-kustKGT--O8
Message-ID: <CAAhV-H6x=YjutHSobvKi2Fq+-sD_8aOZoj-Ba-PFuQQ6hp=HMQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Increase default mmap randomization bits
To: xtex <xtex@envs.net>
Cc: xry111@xry111.site, kernel@xen0n.name, guoren@kernel.org, 
	jiaxun.yang@flygoat.com, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, xtex@astrafall.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 10:05=E2=80=AFAM xtex <xtex@envs.net> wrote:
>
> Xi Ruoyao <xry111@xry111.site> wrote:
> >On Sun, 2026-04-12 at 20:32 +0800, Xi Ruoyao wrote:
> >&gt; On Sun, 2026-04-12 at 20:24 +0800, Huacai Chen wrote:
> >&gt; &gt; On Sun, Apr 12, 2026 at 11:49=E2=80=AFAM Bingwu Zhang &lt;xtex=
@envs.net&gt; wrote:
> >&gt; &gt; &gt;
> >&gt; &gt; &gt; On Sunday, March 29, 2026 11:48:02=E2=80=AFAM China Stand=
ard Time Huacai
> >&gt; &gt; &gt; Chen wrote:
> >&gt; &gt; &gt; &gt; Hi, Bingwu,
> >&gt; &gt; &gt; &gt;
> >&gt; &gt; &gt; &gt; On Sun, Mar 29, 2026 at 6:59=E2=80=AFAM Bingwu Zhang=
 &lt;xtex@envs.net&gt;
> >&gt; &gt; &gt; &gt; wrote:
> >&gt; &gt; &gt; &gt; &gt; From: Bingwu Zhang &lt;xtex@astrafall.org&gt;
> >&gt; &gt; &gt; &gt; &gt;
> >&gt; &gt; &gt; &gt; &gt; Increase default mmap randomization bits from 1=
2 to 18 on 64-
> >&gt; &gt; &gt; &gt; &gt; bit
> >&gt; &gt; &gt; &gt; &gt; platforms for better strength.
> >&gt; &gt; &gt; &gt; &gt;
> >&gt; &gt; &gt; &gt; &gt; The original default, 12, means that ASLR offse=
t has only (1
> >&gt; &gt; &gt; &gt; &gt; &lt;&lt; 12) =3D
> >&gt; &gt; &gt; &gt; &gt; 4096 possibilities. On average, it can be brute=
-forced in 2048
> >&gt; &gt; &gt; &gt; &gt; attempts.
> >&gt; &gt; &gt; &gt; &gt; If a service is configured to restart automatic=
ally or can be
> >&gt; &gt; &gt; &gt; &gt; started
> >&gt; &gt; &gt; &gt; &gt; easily (e.g. execve a suid program), then tryin=
g for 4k times
> >&gt; &gt; &gt; &gt; &gt; can be
> >&gt; &gt; &gt; &gt; &gt; done in one day even when each attempt takes 20=
s.
> >&gt; &gt; &gt; &gt; &gt; Increasing it to 18 makes brute-force much more=
 difficult and
> >&gt; &gt; &gt; &gt; &gt; leaves
> >&gt; &gt; &gt; &gt; &gt; more time for operators to find out attacks.
> >&gt; &gt; &gt; &gt; &gt;
> >&gt; &gt; &gt; &gt; &gt; On 64-bit platforms, virtual address space is c=
heap, so the
> >&gt; &gt; &gt; &gt; &gt; randomization bits can be increased safely with=
out disturbing
> >&gt; &gt; &gt; &gt; &gt; userland
> >&gt; &gt; &gt; &gt; &gt; much and security comes first instead of availa=
bility.
> >&gt; &gt; &gt; &gt;
> >&gt; &gt; &gt; &gt; Don&#x27;t change ARCH_MMAP_RND_BITS_MIN because it =
may compact
> >&gt; &gt; &gt; &gt; performance, and you cannot blindly increase
> >&gt; &gt; &gt; &gt; ARCH_MMAP_RND_BITS_MAX
> >&gt; &gt; &gt; &gt; because it should no more than &quot;VA_BITS - PAGE_=
SHIFT - 3&quot; (see
> >&gt; &gt; &gt; &gt; arch/riscv/Kconfig and arch/csky/Kconfig). For Loong=
Arch,
> >&gt; &gt; &gt; &gt; VA_BITS can
> >&gt; &gt; &gt; &gt; be 39 (half of VA40), PAGE_SHIFT can be 16 (64KB pag=
e), so
> >&gt; &gt; &gt; &gt; ARCH_MMAP_RND_BITS_MAX can only increase up to 20 (3=
9 - 16 - 3
> >&gt; &gt; &gt; &gt; =3D20).
> >&gt; &gt; &gt;
> >&gt; &gt; &gt; Sorry for the late reply.
> >&gt; &gt; &gt;
> >&gt; &gt; &gt; It was my mistake that I didn&#x27;t notice the upper bou=
nd of MAX.
> >&gt; &gt; &gt; Thank you for
> >&gt; &gt; &gt; pointing out!
> >&gt; &gt; &gt;
> >&gt; &gt; &gt; However, I didn&#x27;t get where increasing MIN could com=
pact
> >&gt; &gt; &gt; performance.
> >&gt; &gt; &gt; Theoretically, the only difference is that the gap betwee=
n heaps
> >&gt; &gt; &gt; and stacks
> >&gt; &gt; &gt; are larger, from [128, 128+64]M to [128, 128+4096]M. This
> >&gt; &gt; &gt; shouldn&#x27;t affect
> >&gt; &gt; &gt; performance much. MIPS once used MIN=3D16, RISC-V 64 and =
PowerPC and
> >&gt; &gt; &gt; ARM 64 are
> >&gt; &gt; &gt; using 18, and x86-64 is using 28, but I hadn&#x27;t heard=
 anyone
> >&gt; &gt; &gt; complaining about
> >&gt; &gt; &gt; the performance.
> >&gt; &gt; &gt;
> >&gt; &gt; &gt; I ran some benchmarks last weekend using the LLVM build b=
enchmark
> >&gt; &gt; &gt; of AOSC OS
> >&gt; &gt; &gt; https://github.com/AOSC-Dev/buildbot-benchmark/blob/maste=
r/buildbot-benchmark.bash
> >&gt; &gt; &gt; and here are the results
> >&gt; &gt; &gt;
> >&gt; &gt; &gt; Processor       Rand bits       Time/secs
> >&gt; &gt; &gt; Average Variance        Range
> >&gt; &gt; &gt; 3C6000/S        18      612.927 614.394 614.513 613.343 6=
14.76
> >&gt; &gt; &gt; 613.9874        0.515637840000006       1.83299999999997
> >&gt; &gt; &gt; 3C6000/S        12      614.322 613.93  614.825 613.859
> >&gt; &gt; &gt; 615.875 614.5622        0.548874160000007       2.0159999=
9999996
> >&gt; &gt; &gt; 3A5000  18      3547.165        3548.764        3552.192
> >&gt; &gt; &gt; 3545.697
> >&gt; &gt; &gt; 3547.567        3548.277        4.79228759999993
> >&gt; &gt; &gt; 6.49499999999989
> >&gt; &gt; &gt; 3A5000  12      3549.029        3551.894        3549.191
> >&gt; &gt; &gt; 3567.869
> >&gt; &gt; &gt; 3587.409        3561.0784       222.052853440003
> >&gt; &gt; &gt; 38.3800000000001
> >&gt; &gt; &gt;
> >&gt; &gt; &gt; I didn&#x27;t see any statistically meaningful performanc=
e defect.
> >&gt; &gt; OK, then we can increase ARCH_MMAP_RND_BITS_MIN, but the range=
 18~20
> >&gt; &gt; seems too small and then useless, can we consider using 15~20?
> >&gt;
> >&gt; IMO ARCH_MMAP_RND_BITS_MIN should be just the minimal that the
> >&gt; architecture can support, not related to security.  If you want to
> >&gt; recommend a value for increasing security you&#x27;d set
> >&gt; ARCH_MMAP_RND_BITS_DEFAULT a larger value instead.
>
> okay, I agree to abandon this patch. But,
> Isn't the minimum supported value 0 (i.e. mmap ASLR disabled)? There is a=
lways a fixed 128M gap between heaps and stack tops so 0 should work.
Maybe it should be 0, but keeping the old value is better because I
think there are some historic reasons.


Huacai

>
> >
> >I.e. for example if someone is building a distro running on an embedded
> >system where avoiding addr space fragmentation is more important than
> >security we shouldn&#x27;t be stopping him to decrease ARCH_MMAP_RND_BIT=
S
> >unless he reaches the architecture minimum.  Instead we should increase
> >ARCH_MMAP_RND_BITS_DEFAULT so the &quot;typical&quot; systems get a larg=
er
> >ARCH_MMAP_RND_BITS.
>
> Is address space fragmentation that important on embedded systems? Isn't =
it obvious that you will never have 300G RAM on embedded systems?
>
> >
> >--
> >Xi Ruoyao &lt;xry111@xry111.site&gt;
>
> Bingwu Zhang
>
