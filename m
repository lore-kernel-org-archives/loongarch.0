Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388117C9
	for <loongarch@lists.linux.dev>; Wed,  6 Jul 2022 00:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9C7C341CB
	for <loongarch@lists.linux.dev>; Wed,  6 Jul 2022 00:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657068408;
	bh=Jj3FwQ4HBpuobPyZ832SIAC1FCJMY+cubble0ym22lU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=paD2SriR9dq0LeSQzHUkus7DS1R1cDpKzYiazgLLHb0TapI2S28vHj7Ac+Eovwkdz
	 5SSRAtU3snJJnjkwRA2ENSY59EUnSz1dnEOSIVvjgNFrSxvjxRPRDZ6Ji+WUeKObPn
	 4YUEwgwZf/fUeyxDdmZJ1+N/D9msZ+MuyQwKPhws74WEiL8mfutVvLiF1luRDAbFxj
	 s977SrJ3v7Vusf3rx8g7KnN4VJ4dz724e7+JPS6vr9SXrsnG9EINJMOJTy/JzNgDQJ
	 gCOEJphamsF/ui6GNotMfbeFllru1eY0p2AKtKUYBnX2CY54wubtShaP2jhhdKuum4
	 QrwqJabKPYE9w==
Received: by mail-vk1-f169.google.com with SMTP id 18so1208667vkz.2
        for <loongarch@lists.linux.dev>; Tue, 05 Jul 2022 17:46:48 -0700 (PDT)
X-Gm-Message-State: AJIora8N3f6+jW7SYz5X9Y5nGlGmK/aMRAL15GgDG2giMecF+Wpa/p9p
	1RxZJp+teMXYn9mr20VANmymME2swLJJyU42vpI=
X-Google-Smtp-Source: AGRyM1vvuIe+qf8xo4fOT9nX4g9oGlyOV4noxQuTgIoficxPhRAT9xdDT8InaTVVk/i+GPr16viVr4OgIgFCQhrAX9o=
X-Received: by 2002:a1f:2a86:0:b0:370:8ff3:d5f with SMTP id
 q128-20020a1f2a86000000b003708ff30d5fmr18265507vkq.35.1657068407238; Tue, 05
 Jul 2022 17:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220705073405.29618-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220705073405.29618-1-lukas.bulwahn@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 6 Jul 2022 08:46:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5s4gZf+vU=Vs1uGAqXMC+fBSRbNJdUgqkgmGNCdwxhxw@mail.gmail.com>
Message-ID: <CAAhV-H5s4gZf+vU=Vs1uGAqXMC+fBSRbNJdUgqkgmGNCdwxhxw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: drop these obsolete selects in Kconfig
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Queued for loongarch-fixes, thanks.

Huacai

On Tue, Jul 5, 2022 at 3:35 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit fa96b57c1490 ("LoongArch: Add build infrastructure") adds the new
> file arch/loongarch/Kconfig.
>
> As the work on LoongArch was probably quite some time under development,
> various config symbols have changed and disappeared from the time of
> initial writing of the Kconfig file and its inclusion in the repository.
>
> The following four commits:
>
>   commit c126a53c2760 ("arch: remove GENERIC_FIND_FIRST_BIT entirely")
>   commit 140c8180eb7c ("arch: remove HAVE_COPY_THREAD_TLS")
>   commit aca52c398389 ("mm: remove CONFIG_HAVE_MEMBLOCK")
>   commit 3f08a302f533 ("mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option")
>
> remove the mentioned config symbol, and enable the intended setup by
> default without configuration.
>
> Drop these obsolete selects in loongarch's Kconfig.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Huacai Chen, please pick this minor clean-up patch.
>
>  arch/loongarch/Kconfig | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 2dee595bf4b6..9be4d0eef299 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -54,7 +54,6 @@ config LOONGARCH
>         select GENERIC_CMOS_UPDATE
>         select GENERIC_CPU_AUTOPROBE
>         select GENERIC_ENTRY
> -       select GENERIC_FIND_FIRST_BIT
>         select GENERIC_GETTIMEOFDAY
>         select GENERIC_IRQ_MULTI_HANDLER
>         select GENERIC_IRQ_PROBE
> @@ -77,7 +76,6 @@ config LOONGARCH
>         select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>         select HAVE_ASM_MODVERSIONS
>         select HAVE_CONTEXT_TRACKING_USER
> -       select HAVE_COPY_THREAD_TLS
>         select HAVE_DEBUG_STACKOVERFLOW
>         select HAVE_DMA_CONTIGUOUS
>         select HAVE_EXIT_THREAD
> @@ -86,8 +84,6 @@ config LOONGARCH
>         select HAVE_IOREMAP_PROT
>         select HAVE_IRQ_EXIT_ON_IRQ_STACK
>         select HAVE_IRQ_TIME_ACCOUNTING
> -       select HAVE_MEMBLOCK
> -       select HAVE_MEMBLOCK_NODE_MAP
>         select HAVE_MOD_ARCH_SPECIFIC
>         select HAVE_NMI
>         select HAVE_PERF_EVENTS
> --
> 2.17.1
>
>
