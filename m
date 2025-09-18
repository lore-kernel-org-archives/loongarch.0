Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42B2DA742
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758179879; cv=none; b=hp0D1YqFMutne91yxbGQhvaanFy/MuuxJq4LPQMMQrPoBsPOhKAftkdY9bbhfYTSlzAnzg2DLa0ScYrxi1jQW6NFkXV/8VTmeiTUTrGW1focR3q6onq5/B4m7TaQbZBLzOMvqXFSoKpR4rfBqAT9DnEFkNV9SE04eMGehOsg3ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758179879; c=relaxed/simple;
	bh=mbDs07hHOo6j0NdCQ1vdIQxPsPuH/bNpz03F1RL+Yfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBVfHYSORMs//WlWAHPbDM4JAivcRHxVtMKiUYKDZG2YJUQSFTP0V1/Cdf/cCaPKfXUeCdS2F8kHMmVI/5Do+EJdubrKqF+EQoYdoVt5GVtFtav3L98K8PschhjhfS7m++XCINvvF5bHkLSExCFNpkZ/Rsw82/ja2E9Sa4oe5Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcDtIysa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcDtIysa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB634C4CEE7
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 07:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758179878;
	bh=mbDs07hHOo6j0NdCQ1vdIQxPsPuH/bNpz03F1RL+Yfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hcDtIysaS5x+pBuGbXRopPYdfLJhr4l0vaUOXQHWvZo8ZOTpgAiqy5s7icCf5CDFR
	 SLY11/LuUWUpzyqKs7GW5WtkO4v+1C29MWt3fjZKSiLIUZhik5WC/1G1Mc2Gd49fex
	 ytP7Zs9B06vnNsreCF0mszcZn1WvzNLui+PvtDB07MRF3OuKyTJGOc/4pVlp2Doidu
	 TtSfYu/uz7qhhyc1SqyvauT9ie0PqrLwtR/d9PgDmtKimomYEkLxGKV+sYQaqxaW+N
	 gaCpiMsfWYc8McLe4PRCefMwzznc92NEVKtPx/6grEVeYcAGgj2w/RS7uk2pVAGEr6
	 ifem4DLmfl1bw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b07dac96d1eso260241566b.1
        for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 00:17:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbLsFawKhVEvxWSY18IEuw9a20vPtZXMKp6d19iXl5H/nHI3i9FiwqOSbBr0mzeM9NzXsoA891QYw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzE8zWYzMuK786rgYWUO+GYZSzZ6aWxIM+AjjLyfA9C5vmiDPUP
	nt3h+mzKkeDXiUru2b5x6FuSf5ANoW7c17hKGHzhM41u/612rYaJeyWBXSNGx9vYbjiLLYDKbl+
	vIgkSnoUrpPEPTCA1PJ2MOSXj9YP61Mw=
X-Google-Smtp-Source: AGHT+IGMPcecvdVvEbGg3YHWwnPk37+wRvpxoQsbEeh6xUTtS+A3824bQJhY+yENyDSRGAAN9/3iWPNqLtLRpoaG9y0=
X-Received: by 2002:a17:906:4a94:b0:b20:a567:8724 with SMTP id
 a640c23a62f3a-b20a567874dmr144549466b.1.1758179877232; Thu, 18 Sep 2025
 00:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918064448.91647-1-liu.yun@linux.dev>
In-Reply-To: <20250918064448.91647-1-liu.yun@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 18 Sep 2025 15:17:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H62aEKNtwEjSnrxPSVuTzXS=eNmJ2+8fYRk3Q--V0mLig@mail.gmail.com>
X-Gm-Features: AS18NWBeY60A9X6uA6l2wJctzRp9PqD5IinX69VUHHlQES0PYuwVWum47x1fqiQ
Message-ID: <CAAhV-H62aEKNtwEjSnrxPSVuTzXS=eNmJ2+8fYRk3Q--V0mLig@mail.gmail.com>
Subject: Re: [PATCH 1/2] loongarch/vdso: add missing NULL check after kcalloc()
To: Jackie Liu <liu.yun@linux.dev>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jackie,

Someone has already sent a patch and be applied, don't you know?

https://lore.kernel.org/loongarch/CAAhV-H6hTFrUO5gTx6FYo89TAouEykTvKpLNkqFf=
htsg0PVLiw@mail.gmail.com/T/#t

Huacai

On Thu, Sep 18, 2025 at 2:45=E2=80=AFPM Jackie Liu <liu.yun@linux.dev> wrot=
e:
>
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> The kcalloc() call in init_vdso() allocates memory for code_mapping.pages=
,
> but its return value was not validated before use. This could cause
> NULL pointer dereference if allocation fails.
>
> Add a check for the kcalloc() result and return -ENOMEM on failure.
>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>  arch/loongarch/kernel/vdso.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index 7b888d9085a0..088f8095210b 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -53,6 +53,8 @@ static int __init init_vdso(void)
>         vdso_info.size =3D PAGE_ALIGN(vdso_end - vdso_start);
>         vdso_info.code_mapping.pages =3D
>                 kcalloc(vdso_info.size / PAGE_SIZE, sizeof(struct page *)=
, GFP_KERNEL);
> +       if (!vdso_info.code_mapping.pages)
> +               return -ENOMEM;
>
>         pfn =3D __phys_to_pfn(__pa_symbol(vdso_info.vdso));
>         for (i =3D 0; i < vdso_info.size / PAGE_SIZE; i++)
> --
> 2.51.0
>
