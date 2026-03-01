Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581231AAAF
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772347728; cv=none; b=t90RaC5NsJAlQF7hTa1SA/oMZFDf1LZKUj/SSOzS74AldeLuVkxbdsVsldPqsTMEtxos9qcybmkS6cCWHA5sqDi1jzTuk/sjs5p5WcRYmlscgYYzHUyVwfGUfYkFKYYIBaTcFUkOC/mgSUu7cK/xT4jqoBSjoYf/H2lL5No8JJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772347728; c=relaxed/simple;
	bh=sLoir5FQ4xo5qadFEK0l05ZgymXRbRIaAzqWyHGNmrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEZyU3aXGXKxQD/hJgWh6Tj67LZDT2/koUDLD2r2RS1Yba8g6s1hp2Uvq91kg+dI6HnwPuf/yBAl4Bo7zZczOfW21D2YXJXBvg6KdnqzEGKS3hQv6gsPXmZFzWnE8xIOE/jXYt8zt4HsepJ4D5SkXGIWkSSeaQ+laEajyn4z32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU14k0LA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU14k0LA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA04C4AF09
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772347728;
	bh=sLoir5FQ4xo5qadFEK0l05ZgymXRbRIaAzqWyHGNmrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IU14k0LAdS4OfHJv6BjEWwC6IFNnfHl0/jnTs5XIiRTL+B4lwUgdVbbe1UhOdPGlO
	 JEOFaUDoH8jjpUPsLLxkjtCrlNDuv3mPki+w2oVA1+roSQHnTOZeL4MYVqqyvA4gy5
	 nGuAHGvXGLJR6w36+dodFXAOXwxR1oOUnEcoz9qI2r5h7UNr5STVfOi7e9QNddKKbH
	 Ari98rVkviortCODTB21IgwpVilc6dILJd+L91O8k5SPhEtJ01Zz/GUUyf2zTkswV1
	 +nVJNCgdV9KT86j4VUojEiX5xVRp5C7zISnMUVrzEsYwmNRfGtYMoHB19xVP4pfgic
	 9ZshBXDxFuuJA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65f73d68faeso5105009a12.3
        for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 22:48:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzgHvou2qwSkOCkxTbfvM/LT9UdTWVuObE0ar1hsEuO+P0HD5/0kw93IOuPw/hZlhtWLQkZZmgBsE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOggsl1kLFk+5PnUvzFlOqUAkUusVLtgrotep/W9Axk/IlS5ly
	vr1VBTmT/zh9wjsheqomAIpB2JL854Nj0rAMMprkFMwsDInMvqrkw4bDBRn3uDqJjTJAR2tXhWe
	KVLEZeWON9EU09DBcMRdJ9FeXwX4ljOg=
X-Received: by 2002:a05:6402:1d50:b0:65c:37a2:e4a4 with SMTP id
 4fb4d7f45d1cf-65fde4bbb42mr4727125a12.25.1772347726740; Sat, 28 Feb 2026
 22:48:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301014642.1709744-1-sashal@kernel.org>
In-Reply-To: <20260301014642.1709744-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:48:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4J_tsGzXyRc6r6=wfb0ZsL0u22JvAZm8RQXvw5hzEK9g@mail.gmail.com>
X-Gm-Features: AaiRm53L76yOvTmtRZSw2w36mp-5zfrAegZc7ubq5pqdaftV3K7xx73Wq5-sfAw
Message-ID: <CAAhV-H4J_tsGzXyRc6r6=wfb0ZsL0u22JvAZm8RQXvw5hzEK9g@mail.gmail.com>
Subject: Re: FAILED: Patch "LoongArch: Prefer top-down allocation after
 arch_mem_init()" failed to apply to 6.1-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:46=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.1-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I'm very confused because it can be applied and already here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.1

Huacai
>
> Thanks,
> Sasha
>
> ------------------ original commit in Linus's tree ------------------
>
> From 2172d6ebac9372eb01fe4505a53e18cb061e103b Mon Sep 17 00:00:00 2001
> From: Huacai Chen <chenhuacai@loongson.cn>
> Date: Tue, 10 Feb 2026 19:31:13 +0800
> Subject: [PATCH] LoongArch: Prefer top-down allocation after arch_mem_ini=
t()
>
> Currently we use bottom-up allocation after sparse_init(), the reason is
> sparse_init() need a lot of memory, and bottom-up allocation may exhaust
> precious low memory (below 4GB). On the other hand, SWIOTLB and CMA need
> low memories for DMA32, so swiotlb_init() and dma_contiguous_reserve()
> need bottom-up allocation.
>
> Since swiotlb_init() and dma_contiguous_reserve() are both called in
> arch_mem_init(), we no longer need bottom-up allocation after that. So
> we set the allocation policy to top-down at the end of arch_mem_init(),
> in order to avoid later memory allocations (such as KASAN) exhaust low
> memory.
>
> This solve at least two problems:
> 1. Some buggy BIOSes use 0xfd000000~0xfe000000 for secondary CPUs, but
>    didn't reserve this range, which causes smpboot failures.
> 2. Some DMA32 devices, such as Loongson-DRM and OHCI, cannot work with
>    KASAN enabled.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/kernel/setup.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 20cb6f3064568..2b260d15b2e25 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -421,6 +421,7 @@ static void __init arch_mem_init(char **cmdline_p)
>                                    PFN_UP(__pa_symbol(&__nosave_end)));
>
>         memblock_dump_all();
> +       memblock_set_bottom_up(false);
>
>         early_memtest(PFN_PHYS(ARCH_PFN_OFFSET), PFN_PHYS(max_low_pfn));
>  }
> --
> 2.51.0
>
>
>
>
