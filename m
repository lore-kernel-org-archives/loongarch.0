Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90B21D3E4
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772346633; cv=none; b=ErPkhkRpH0ODwfVRS1doQcl1nZsXIPa0tj2ObHkPZl6X1yCqzSnB0FQkFLEK8Vn8QN4bkTXeQxWIeGpI9bi3wsWXLhyoywndAUBUEn5VddaSoDoNVb7120AynFZCsNfeO1W7xNqldO2TdXfDh4gbC96rRKl/Jl49L9STGfgQz2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772346633; c=relaxed/simple;
	bh=5Ci4iQ8LIkRjw9ITSzRmMXH38FKEB3kwlZ/GBUHDVSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQKM9eYzMoWNA1+84htU6bkm3KoXPdayVMXn6AND50miHbU8LRJQnBm0RVbTYCYY2EzssA/5TV63akyOxAwJQtNH9bOWjWB7eXd3ey0wi4QFf0mVEnSn1BjYVS1D0qXAvfZsf0Av3HQ8T81HMDWcOGqaGeU+NFZM5VO0bgEWF98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJC6kbbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJC6kbbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C9BC116C6
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772346632;
	bh=5Ci4iQ8LIkRjw9ITSzRmMXH38FKEB3kwlZ/GBUHDVSc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XJC6kbbPZynVyJ0VmR4N5DkJ7wXg3e/L7E1CTiSd2D1C6xKrxKkJAwPN3RJzavj7Y
	 lwljdEg8otI+Zu/sGO1EJijummqbPSlvGq2C2gVrWv6BCvnZpvbHPIUUorarlavuT6
	 XQL8FWZYr8u1SjX7vEu/3SmI6/alZtw1+jt2gfwi6ntxSawbTlc3CC2nsNtgqPc1Bw
	 qFdHvMCjyXMRopMPd4KuyJ5eXC81cTRzwmLpE+bnUdh/lNf6Nw1KHOdHaqCgAEAyOX
	 kghI+jSJaMjXPI6FgZabwLIQjCF0PmNhXljNmAkmdprS2sTSXnjqLTpyqVcIQP/+Mv
	 TQ53SAMoFPpDQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65f9763e8d1so6676679a12.1
        for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 22:30:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuGHOXJlxZSTA55LvxCkt9eJXXZ9xabHL4nVFA05XDNBboQ+gwz4q/JSQX9vyXKp+XwegbS73n82E=@lists.linux.dev
X-Gm-Message-State: AOJu0YySXSlmkd8c5Cb5dt+sOdcPpkOi97mSKs2dQaV2jdHOQKavu0vq
	iD9//dau5RiSGlw0jlzPUT1lum40JXtFLc1xRwNUqwKNhplfgpZDGNFl4moM1bDYDwsn3bEFSsD
	CMXHocSWDDkJp1I9RjzG1ZlMwGK4uUXo=
X-Received: by 2002:a05:6402:2706:b0:65f:a619:22f4 with SMTP id
 4fb4d7f45d1cf-65fddef77dfmr4795751a12.27.1772346631335; Sat, 28 Feb 2026
 22:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301012733.1685068-1-sashal@kernel.org>
In-Reply-To: <20260301012733.1685068-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:30:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5LbUecy1gV5njsd1Hk_q4=_LgBs5yN9OecukCxLE1GEw@mail.gmail.com>
X-Gm-Features: AaiRm531C7nHiTRnKkTxeO1JL9v97YjLgJN6HwOcR6CM4VWFglyII4FCDtsLaAg
Message-ID: <CAAhV-H5LbUecy1gV5njsd1Hk_q4=_LgBs5yN9OecukCxLE1GEw@mail.gmail.com>
Subject: Re: FAILED: Patch "LoongArch: Prefer top-down allocation after
 arch_mem_init()" failed to apply to 6.12-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:27=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.12-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I'm very confused because it can be applied and already here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.12

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
