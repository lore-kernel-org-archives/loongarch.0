Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD9A24B28
	for <loongarch@lists.linux.dev>; Sun, 29 Mar 2026 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774756095; cv=none; b=HYs7J5IRAVPy1XNpyNZCgbsHaUkHmpIiql1q8lZOtQpfQ5QC6Jone5OE3XHGLAPAuHg+sFaNXM7d38v4gglwaGHsdQ7nKg2MuukxHS7T17sLunzNK4E2emwH1lKoZqjcGklexIyFyIFeffy1lnUx4FLTpyFYMSPbqJolSXdHayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774756095; c=relaxed/simple;
	bh=iRpKMRdBqIX6pfNjSzLYrHPcy2BZCi7L0CcauDJ7v6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqxdsqw4+gwLdAiLA/sT94gq9c/FZ17YH9SCg9vf/jHLpkSnLybLTLAjMoYM3FfEg01vA8MNyfjvVvgWODili/g7LsO9RpAmFUUl2AkvrEGGPjhl19qj8sEnbGQ+4PhCaB1MaE5gjvcOrgSpUtJ5j8maz7MJ4ixhnRICIptn0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETscoL/f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETscoL/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12BEC116C6
	for <loongarch@lists.linux.dev>; Sun, 29 Mar 2026 03:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774756094;
	bh=iRpKMRdBqIX6pfNjSzLYrHPcy2BZCi7L0CcauDJ7v6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ETscoL/fIZ+jks9CsI7sXnLLcbnjrBrLUZDoWftP5iI2Y/Q0vb8gPneK+ReNaR5aM
	 W5h3W2XBH6yoCvrxS2S/kAktN00lNnrNwMO4fFwPWrL2PffrIP/Z0TOMQTNMD3WooT
	 2jT6Byij52MLe6jkywOTo6XpcLROqIeITeEHpDc1eb562bpQSsbOxCDGEF9hKIOO6K
	 ZzRo8Z52D+SCWBZWjxurw6VfH2wNN+w+4FsF4HzNpkc0Z6A4oceGySV88ajf/3py0k
	 ApQDFXbkCF5zif9PurK7LKqkDBTuKGPSGH7ylLHSAhNoZUFjnjPHviV9zBXK94KVMO
	 dzkx21x+3Lv8Q==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9961e4f71bso529170166b.3
        for <loongarch@lists.linux.dev>; Sat, 28 Mar 2026 20:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV58NEB8vvbIi2xKJ2P6y6oV05SElKM9zG3wZJAqBWns0aK3jdtz3d+ln29Xi3+eiXH6Sb4cWRPnuE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2OgZEPwkGoFjltnmKpoWATAPO7286tvrHVmFfF4b21xpFDXMC
	re8u2VgWt4f8OOuGEah0pb1AcZxN6uVVvbUicFpWI7IJYe/iy3hTf2hcGFY9ULxxHMpwc5dpbNZ
	SZzvcIUvX9emPS7wN5mcCErrGcZEq6iE=
X-Received: by 2002:a17:907:d0b:b0:b98:4a4d:437 with SMTP id
 a640c23a62f3a-b9b509b2db5mr503985966b.52.1774756093303; Sat, 28 Mar 2026
 20:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328225916.51802-2-xtex@envs.net>
In-Reply-To: <20260328225916.51802-2-xtex@envs.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 29 Mar 2026 11:48:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Y=iPfS5FLN92eL+KauSfuLsPtiSajfFnjaQqXOtuYdA@mail.gmail.com>
X-Gm-Features: AQROBzC9nor2IhsZpC6_OkefPKbwqs29ppJmVKPm1VXMvSUgiz3YGZ0hZuXkbg8
Message-ID: <CAAhV-H5Y=iPfS5FLN92eL+KauSfuLsPtiSajfFnjaQqXOtuYdA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Increase default mmap randomization bits
To: Bingwu Zhang <xtex@envs.net>
Cc: WANG Xuerui <kernel@xen0n.name>, Guo Ren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bingwu Zhang <xtex@astrafall.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bingwu,

On Sun, Mar 29, 2026 at 6:59=E2=80=AFAM Bingwu Zhang <xtex@envs.net> wrote:
>
> From: Bingwu Zhang <xtex@astrafall.org>
>
> Increase default mmap randomization bits from 12 to 18 on 64-bit
> platforms for better strength.
>
> The original default, 12, means that ASLR offset has only (1 << 12) =3D
> 4096 possibilities. On average, it can be brute-forced in 2048 attempts.
> If a service is configured to restart automatically or can be started
> easily (e.g. execve a suid program), then trying for 4k times can be
> done in one day even when each attempt takes 20s.
> Increasing it to 18 makes brute-force much more difficult and leaves
> more time for operators to find out attacks.
>
> On 64-bit platforms, virtual address space is cheap, so the
> randomization bits can be increased safely without disturbing userland
> much and security comes first instead of availability.
Don't change ARCH_MMAP_RND_BITS_MIN because it may compact
performance, and you cannot blindly increase ARCH_MMAP_RND_BITS_MAX
because it should no more than "VA_BITS - PAGE_SHIFT - 3" (see
arch/riscv/Kconfig and arch/csky/Kconfig). For LoongArch, VA_BITS can
be 39 (half of VA40), PAGE_SHIFT can be 16 (64KB page), so
ARCH_MMAP_RND_BITS_MAX can only increase up to 20 (39 - 16 - 3 =3D20).

These are done in:
https://github.com/chenhuacai/linux/commit/ff35475dcfbd4c6e9c275aaef3c92da7=
10894058

Huacai

> Fixes: fa96b57c1490 ("LoongArch: Add build infrastructure")
> Signed-off-by: Bingwu Zhang <xtex@astrafall.org>
> ---
>  arch/loongarch/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 92068ff38685..b47c4e4ecbb7 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -740,9 +740,11 @@ config MMU
>         default y
>
>  config ARCH_MMAP_RND_BITS_MIN
> +       default 18 if 64BIT
>         default 12
>
>  config ARCH_MMAP_RND_BITS_MAX
> +       default 32 if 64BIT
>         default 18
>
>  config ARCH_SUPPORTS_UPROBES
>
> base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> --
> 2.52.0
>
>
