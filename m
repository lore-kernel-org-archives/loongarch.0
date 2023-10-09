Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2168A5B
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 01:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhS9JWtc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38705C433CA
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 01:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696814300;
	bh=5VgzET7sJk5vcsYLGL8Xr+lPdhFjwFeZymvPVsirkWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jhS9JWtcoxA4Qw8+U5wmBbePk/uTst2DEAcdYTVWwgfr8dX0F3rmZrEZvYqy7w4pv
	 0PgSR9L8fYoZNOW6Xwgws5sxaEYn7HbvGTfM3DyT3X5npdsAl0xk+yyvWSejJcHd5+
	 hzFOTcfDzmDDMYRdJAL8IzQFk8N7GSHC/fdcVij2u6LKSPkcZVoEMFml/lClC5RCNS
	 J/eAMM/vB5VAmZKY4IBLLU8HK4E48GCsNUm5W3NlB7QRQ21VOQfCYxFfeiC+ndUuXe
	 3B0uNKlfgQ1wjTtehozsl3FwWtYa/ENub89ZzoENt9kajtVuSq/YXSSOgBX/+5zm68
	 J1g9BtDjrQ/6A==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-536071e79deso8784505a12.1
        for <loongarch@lists.linux.dev>; Sun, 08 Oct 2023 18:18:20 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzh5mze+gITayvgYYq7q/sbjtVw9eaKEBq1NkX1PtuJwUJi7+Zo
	z7udWrTqg34xS/l+WWp8XDZJ+7304WvqaVB7+x8=
X-Google-Smtp-Source: AGHT+IEDE+4c3WWbE+3Z86yBK3ncvcQPW2esCqMTs3GGr0N/mFlnxLSfADY9PQdHT/R4v7Y2XcyyEnm0MGCz4LoBJFg=
X-Received: by 2002:a05:6402:40c1:b0:527:1855:be59 with SMTP id
 z1-20020a05640240c100b005271855be59mr8542915edb.3.1696814298622; Sun, 08 Oct
 2023 18:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231008130204.489081-1-uwu@icenowy.me>
In-Reply-To: <20231008130204.489081-1-uwu@icenowy.me>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 9 Oct 2023 09:18:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4G+vsJYTyP9Txpke=YiuGcTr-6L7ZrOdt8=b8dWdHD9A@mail.gmail.com>
Message-ID: <CAAhV-H4G+vsJYTyP9Txpke=YiuGcTr-6L7ZrOdt8=b8dWdHD9A@mail.gmail.com>
Subject: Re: [PATCH] loongarch/mm: disable WUC for pgprot_writecombine() too
To: Icenowy Zheng <uwu@icenowy.me>
Cc: WANG Xuerui <kernel@xen0n.name>, Jun Yi <yijun@loongson.cn>, Baoquan He <bhe@redhat.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	David Hildenbrand <david@redhat.com>, Hongchen Zhang <zhanghongchen@loongson.cn>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Youling Tang <tangyouling@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Zhihong Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Zheng,

The title can be "LoongArch: Disable WUC for pgprot_writecombine() as
same as ioremap()"

On Sun, Oct 8, 2023 at 9:03=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrote=
:
>
> Currently the code disables WUC only disables it for ioremap_wc(), which
> is only used when mapping writecombine pages like ioremap() (mapped to
> the kernel space). For VRAM mapped in TTM/GEM, it's mapped with a
> crafted pgprot with pgprot_writecombine() function, which isn't
> corrently disabled now.
>
> Disable WUC for pgprot_writecombine() (fallback to SUC) too.
>
> This improves AMDGPU driver stability on Loongson 3A5000 machines.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  arch/loongarch/include/asm/io.h           |  4 +---
>  arch/loongarch/include/asm/pgtable-bits.h |  9 ++++++++-
>  arch/loongarch/kernel/setup.c             | 10 +++++-----
>  3 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm=
/io.h
> index 0dcb36b32cb25..5477d9e3ab072 100644
> --- a/arch/loongarch/include/asm/io.h
> +++ b/arch/loongarch/include/asm/io.h
> @@ -52,10 +52,8 @@ static inline void __iomem *ioremap_prot(phys_addr_t o=
ffset, unsigned long size,
>   * @offset:    bus address of the memory
>   * @size:      size of the resource to map
>   */
> -extern pgprot_t pgprot_wc;
> -
>  #define ioremap_wc(offset, size)       \
> -       ioremap_prot((offset), (size), pgprot_val(pgprot_wc))
> +       ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL_WC))
>
>  #define ioremap_cache(offset, size)    \
>         ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL))
> diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/i=
nclude/asm/pgtable-bits.h
> index 35348d4c4209a..c9e3ed330fb97 100644
> --- a/arch/loongarch/include/asm/pgtable-bits.h
> +++ b/arch/loongarch/include/asm/pgtable-bits.h
> @@ -92,6 +92,13 @@
>
>  #ifndef __ASSEMBLY__
>
> +extern bool wc_enabled;
> +
> +#define _CACHE_WC      (wc_enabled ? _CACHE_WUC : _CACHE_SUC)
> +
> +#define PAGE_KERNEL_WC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE=
 | \
> +                                _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WC)
If these macros cannot be put close to their friends, I prefer to open code=
.

Huacai
> +
>  #define _PAGE_IOREMAP          pgprot_val(PAGE_KERNEL_SUC)
>
>  #define pgprot_noncached pgprot_noncached
> @@ -111,7 +118,7 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _=
prot)
>  {
>         unsigned long prot =3D pgprot_val(_prot);
>
> -       prot =3D (prot & ~_CACHE_MASK) | _CACHE_WUC;
> +       prot =3D (prot & ~_CACHE_MASK) | _CACHE_WC;
>
>         return __pgprot(prot);
>  }
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.=
c
> index 4de32b07c0dcd..b35186f7b2547 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -161,19 +161,19 @@ static void __init smbios_parse(void)
>  }
>
>  #ifdef CONFIG_ARCH_WRITECOMBINE
> -pgprot_t pgprot_wc =3D PAGE_KERNEL_WUC;
> +bool wc_enabled =3D true;
>  #else
> -pgprot_t pgprot_wc =3D PAGE_KERNEL_SUC;
> +bool wc_enabled;
>  #endif
>
> -EXPORT_SYMBOL(pgprot_wc);
> +EXPORT_SYMBOL(wc_enabled);
>
>  static int __init setup_writecombine(char *p)
>  {
>         if (!strcmp(p, "on"))
> -               pgprot_wc =3D PAGE_KERNEL_WUC;
> +               wc_enabled =3D true;
>         else if (!strcmp(p, "off"))
> -               pgprot_wc =3D PAGE_KERNEL_SUC;
> +               wc_enabled =3D false;
>         else
>                 pr_warn("Unknown writecombine setting \"%s\".\n", p);
>
> --
> 2.39.1
>
>
