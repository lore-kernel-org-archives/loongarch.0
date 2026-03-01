Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6580D3148D0
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772347300; cv=none; b=MGKKkqRF1Gk7d3BYRDF8VCQ6Eo+p+4SF40YS6prZA2sJTp4P9eXAiIVqy3DUq4VkulryBAlMKHNg15CqEmjx2E2SvbFMS6Y0vGXmofOGEKsYh4FY2yBV7u5zDnD1nEQ/2QcmqYlg0i+D82DHu1w+eVYHcQnhG3eMvjm6ocHhVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772347300; c=relaxed/simple;
	bh=HAGHilMAtJC8jD0AonLHTVmmz2tJIBEG56rttinq930=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HH0oak+Rdje+VEhd+1WNAeGkVxcd+0HAdGs63Qwfix7bXkrEcGwgtJiB9Fy6nDzLs5DhkhCbNQeHoC3pqofTOk6V7sL6dD4iia9GmxUFKnRr6FKk17RVRhcesuTghsLctSCDkn2/wvaRSywWa4vcus9TZ0YP7je/D7e4Kfar9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFH8MHrx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFH8MHrx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31384C4AF09
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772347300;
	bh=HAGHilMAtJC8jD0AonLHTVmmz2tJIBEG56rttinq930=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PFH8MHrxSc/+8vVnubekrOqbrGvIT1oU3cl4Immnm/w1gf2gQuNoiEgTORFJglp+O
	 CfseOkIVznRM6awCa+2Ol3JMGkxtKSzqvN9YOtfvXxbAwkLnhixgKY4gUrv6zLqS3K
	 0e/RoO6ZEAzZp36ALPT8lvoMh1vxWkOIOhbkGs460sXPGwOOQoh4uK+L+qHGqbAfmD
	 c3YtUgyjNXyPCFiDC9dg8+4a/Z9W2+fpLS0ary3H62RC1cDA0beh7j2yxKPRQ1bHvP
	 tUSr4Zhvx4Wkz5nvE+Gg5AKPmKvI75wtBmLh2mHuXT1dWOShD/QnA11feQGUyJdpLA
	 4wNnDZm2/MdpQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65f812e0d93so5302022a12.2
        for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 22:41:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXOGveKxhkCMBZsojcJMR/kRUz7kafwz3zo6vhTDAnFSroESO5iGYYCGV5edvtmX1cgi1U+PORhA0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAh/tVa83w6ulF4Bdl/NaauqWWj/ASxhZpjZyVRse9ZP+1wfvd
	SDl/FC9OT69pfB/YwzGIQWF3fDgn1yjHGtWqkNqXSl66ucmB6SdHFdlhGFMXsl4DOh5WEDhHjkh
	npebJ7sDppQ57o/G9TRmoQqLWRmNA094=
X-Received: by 2002:a05:6402:234c:b0:658:cc59:161c with SMTP id
 4fb4d7f45d1cf-65fdd6c3526mr5339226a12.12.1772347298732; Sat, 28 Feb 2026
 22:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301013750.1698102-1-sashal@kernel.org>
In-Reply-To: <20260301013750.1698102-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:41:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5wG0BCXrcviHY0=B=CPcYiei9O_v2PL-bb-VLozrbm8w@mail.gmail.com>
X-Gm-Features: AaiRm52bGn9n_PTUi0PHrcMOutWa9f7EkljtZfBBZotsZPYqoHEGSea3mYIS_Bg
Message-ID: <CAAhV-H5wG0BCXrcviHY0=B=CPcYiei9O_v2PL-bb-VLozrbm8w@mail.gmail.com>
Subject: Re: FAILED: Patch "LoongArch: Prefer top-down allocation after
 arch_mem_init()" failed to apply to 6.6-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:37=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.6-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I'm very confused because it can be applied and already here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.6

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
