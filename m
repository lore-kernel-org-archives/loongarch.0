Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489CF22A1EF
	for <loongarch@lists.linux.dev>; Sat, 26 Apr 2025 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662312; cv=none; b=J0J7M0A9wsZMECr2ipfi08DQqNU6VwfIBBCn3mxLj2/rqtTzZhbJWMoDBHSh5DeVM2uiJIsBsMKen3VEm/U94A9EhZ8UJ69ORSR8KgCxcGtM03lrY2SBq3AL1kzBLEcOQRhqIkP/j4PVT0iz3cyXwS6hmVRw5U9oFHa12jVre9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662312; c=relaxed/simple;
	bh=R/z+cT1aLxJvVZUTaDnZ/yW/7pzsBc856twY10Tzvbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzzSC8LuOHQ0t6T4ivPbWqo8eSZg7/O1rJYkQbuPkb1Jppt4Bg0Aa/RXID85FW5QjkC1t637hAc6wVYRv/+KIPAM7P3g0mv7hvfQYnoXUb/0ztREuxqpi+yi52VHYUFj99QtKJ0dF2p9JYA58IWr8psDY1ren6fDSlCWQDLYshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3ZjoVtG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3ZjoVtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84793C4CEE8
	for <loongarch@lists.linux.dev>; Sat, 26 Apr 2025 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745662311;
	bh=R/z+cT1aLxJvVZUTaDnZ/yW/7pzsBc856twY10Tzvbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p3ZjoVtGv6t/AbJne0Fz1a21IxRud/np3jG9jUoGTYeAUgYXcWlfBOp5kJLhWM2km
	 dFapUI0CCdp0txBnyvVALDyXNgmqWhSpgwiLuBrjdw9Rlvo377BstaAiGazCQozte9
	 42WjAC++9T1dAIHUKiMxjDlgXn6sluF+QnKhUWVxCfLr1LN6H/3xsthaBgNQqAVraj
	 qVxjYr/t+GADtbmR3mNPyWffkdCoUw3uP2bob0tO4RHSYzAxIRz4Y6Dg9NRCrQzSCs
	 gl9LfhFQeATQ5q2YhRb9pnhSq6tewLMj6NOqMwy6xFspeoafrWRKCA3jUTTpFo7qmR
	 UCOswBlk+fkPA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso4632231a12.0
        for <loongarch@lists.linux.dev>; Sat, 26 Apr 2025 03:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwHK0pvqDSRIaKbFsx7vWIr1cUSv4eyE91UDBNqcX1AfjR0KZ9gBVb0PL+lykaMzlErn8yQqtF3p8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuzXTuhAh4dMwNt4dldrzrjCa8oRmAlTnRq2Et1AvHdjCGvV+S
	Kvb9Y0ZC/bkfSJQ6NWIvcf1aXX2nEHLoJxrCBuePHH8hROoSv3yhmPeuqL0HsV3OF35TDuDuv6S
	YTAbOEpMcOeB3yfRPKsCr+sP4++c=
X-Google-Smtp-Source: AGHT+IFnDEj0swtiLrH81M0hKi0swEOGyiTwK87JYI2K1I634GI/T8PYJBtEwdDvVZR1dU8//WYu3DUc1hnm0LfrL5M=
X-Received: by 2002:a17:907:97ce:b0:ace:3732:8a86 with SMTP id
 a640c23a62f3a-ace7136ce85mr509180566b.41.1745662310207; Sat, 26 Apr 2025
 03:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403141125.271047-1-ptesarik@suse.com>
In-Reply-To: <20250403141125.271047-1-ptesarik@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Apr 2025 18:11:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5gkv1aVJRBE5b06ne0biKEZxASr2_h6HVCypfNpaBxrA@mail.gmail.com>
X-Gm-Features: ATxdqUGHeRtcP3yyuXP3Cx3XAHMr-BIFRwCDcLk4Nb8rvTyawtZ9fVzZuvdOXTY
Message-ID: <CAAhV-H5gkv1aVJRBE5b06ne0biKEZxASr2_h6HVCypfNpaBxrA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Remove a bogus reference to ZONE_DMA
To: Petr Tesarik <ptesarik@suse.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Guo Weikang <guoweikang.kernel@gmail.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Apr 3, 2025 at 10:11=E2=80=AFPM Petr Tesarik <ptesarik@suse.com> wr=
ote:
>
> Remove dead code. LoongArch does not have a DMA memory zone. The
> architecture does not even define MAX_DMA_PFN.
>
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  arch/loongarch/mm/init.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index ca5aa5f46a9f..7fab370efa74 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -65,9 +65,6 @@ void __init paging_init(void)
>  {
>         unsigned long max_zone_pfns[MAX_NR_ZONES];
>
> -#ifdef CONFIG_ZONE_DMA
> -       max_zone_pfns[ZONE_DMA] =3D MAX_DMA_PFN;
> -#endif
>  #ifdef CONFIG_ZONE_DMA32
>         max_zone_pfns[ZONE_DMA32] =3D MAX_DMA32_PFN;
>  #endif
> --
> 2.48.1
>
