Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF614A86
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA49C433C9
	for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689780589;
	bh=x6U9CSmNrPjA7rIrDR5bXjiuMMRbQ+HjhasvEpxyg7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aE57eKlqXXbKctGl0N7MNpi72dHU2BFMZc+qOX423QK0AzkJrVx5e3XoynkofeOJ4
	 69C+5QqC/ocokt871i1fXSH3Khz9wz0+yHHVdOHUd4rIiAy8hgkFqj4E9LC0QfioBp
	 OrJwBRHnsfC/N6qv7LBKHOAmPxTuuyA6O4W0yooRtv9Wo9WXdTHFD2Ue1xY4tg37yG
	 zmHoDO7KJrovGPDPBuAtG13EMNQbkLtCbHHXeBegK1Mb+OKKufw412W/bR9pmPD0Hd
	 3eRIJ7N6Va8y/cQ+9IJ66pa9al6hph+9ijh3S4p2r3PxlSTYjAwQk/IS7vVooMc1vD
	 hMWcTrJz6SVXg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51ff0e3d8c1so9567375a12.0
        for <loongarch@lists.linux.dev>; Wed, 19 Jul 2023 08:29:49 -0700 (PDT)
X-Gm-Message-State: ABy/qLZneHFvkxx45UFBTbGDmfu/Pz0Nk4hF+5HsG85fGDZfGoqEhEk+
	Ukk+CnC8chl9EJsL4ehVqZ/tXhcysBwIBBYBkPA=
X-Google-Smtp-Source: APBJJlE8T2g2MbXd3kHXTq5+8RLXye8bzYsszr03WXB8tQzWPPD/Yc6GiA/Q1wvEonoqPwmQuIkQexYoJ0l2sWHnbl0=
X-Received: by 2002:a05:6402:608:b0:51e:1a51:d414 with SMTP id
 n8-20020a056402060800b0051e1a51d414mr2367053edv.32.1689780587597; Wed, 19 Jul
 2023 08:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719082732.2189747-1-lienze@kylinos.cn> <20230719082732.2189747-2-lienze@kylinos.cn>
In-Reply-To: <20230719082732.2189747-2-lienze@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 19 Jul 2023 23:29:37 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5pWmd2owMgH9hiqxoWpeAOKGv_=j2V-urA+D87_uCMyg@mail.gmail.com>
Message-ID: <CAAhV-H5pWmd2owMgH9hiqxoWpeAOKGv_=j2V-urA+D87_uCMyg@mail.gmail.com>
Subject: Re: [PATCH 1/4] LoongArch: mm: Add page table mapped mode support
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>
> According to LoongArch documentation online, there are two types of addre=
ss
> translation modes: direct mapped address translation mode (direct mapped =
mode)
> and page table mapped address translation mode (page table mapped mode).
>
> Currently, the upstream code only supports DMM (Direct Mapped Mode).
> This patch adds a function that determines whether PTMM (Page Table
> Mapped Mode) should be used, and also adds the corresponding handler
> funcitons for both modes.
>
> For more details on the two modes, see [1].
>
> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.=
html#virtual-address-space-and-address-translation-mode
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  arch/loongarch/include/asm/page.h    | 10 ++++++++++
>  arch/loongarch/include/asm/pgtable.h |  6 ++++++
>  arch/loongarch/mm/pgtable.c          | 25 +++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/a=
sm/page.h
> index 26e8dccb6619..05919be15801 100644
> --- a/arch/loongarch/include/asm/page.h
> +++ b/arch/loongarch/include/asm/page.h
> @@ -84,7 +84,17 @@ typedef struct { unsigned long pgprot; } pgprot_t;
>  #define sym_to_pfn(x)          __phys_to_pfn(__pa_symbol(x))
>
>  #define virt_to_pfn(kaddr)     PFN_DOWN(PHYSADDR(kaddr))
> +
> +#ifdef CONFIG_64BIT
> +#define virt_to_page(kaddr)                                            \
> +({                                                                     \
> +       is_PTMM_addr((unsigned long)kaddr) ?                            \
> +       PTMM_virt_to_page((unsigned long)kaddr) :                       \
> +       DMM_virt_to_page((unsigned long)kaddr);                         \
> +})
1, Rename these helpers to
is_dmw_addr()/dmw_virt_to_page()/tlb_virt_to_page() will be better.
2, These helpers are so simple so can be defined as inline function or
macros in page.h.
3, CONFIG_64BIT can be removed here.

Huacai

> +#else
>  #define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
> +#endif
>
>  extern int __virt_addr_valid(volatile void *kaddr);
>  #define virt_addr_valid(kaddr) __virt_addr_valid((volatile void *)(kaddr=
))
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index ed6a37bb55b5..0fc074b8bd48 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -360,6 +360,12 @@ static inline void pte_clear(struct mm_struct *mm, u=
nsigned long addr, pte_t *pt
>  #define PMD_T_LOG2     (__builtin_ffs(sizeof(pmd_t)) - 1)
>  #define PTE_T_LOG2     (__builtin_ffs(sizeof(pte_t)) - 1)
>
> +#ifdef CONFIG_64BIT
> +struct page *DMM_virt_to_page(unsigned long kaddr);
> +struct page *PTMM_virt_to_page(unsigned long kaddr);
> +bool is_PTMM_addr(unsigned long kaddr);
> +#endif
> +
>  extern pgd_t swapper_pg_dir[];
>  extern pgd_t invalid_pg_dir[];
>
> diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
> index 36a6dc0148ae..4c6448f996b6 100644
> --- a/arch/loongarch/mm/pgtable.c
> +++ b/arch/loongarch/mm/pgtable.c
> @@ -9,6 +9,31 @@
>  #include <asm/pgtable.h>
>  #include <asm/tlbflush.h>
>
> +#ifdef CONFIG_64BIT
> +/* DMM stands for Direct Mapped Mode. */
> +struct page *DMM_virt_to_page(unsigned long kaddr)
> +{
> +       return pfn_to_page(virt_to_pfn(kaddr));
> +}
> +EXPORT_SYMBOL_GPL(DMM_virt_to_page);
> +
> +/* PTMM stands for Page Table Mapped Mode. */
> +struct page *PTMM_virt_to_page(unsigned long kaddr)
> +{
> +       return pte_page(*virt_to_kpte(kaddr));
> +}
> +EXPORT_SYMBOL_GPL(PTMM_virt_to_page);
> +
> +bool is_PTMM_addr(unsigned long kaddr)
> +{
> +       if (unlikely((kaddr & GENMASK(BITS_PER_LONG - 1, cpu_vabits)) =3D=
=3D
> +                    GENMASK(BITS_PER_LONG - 1, cpu_vabits)))
> +               return true;
> +       return false;
> +}
> +EXPORT_SYMBOL_GPL(is_PTMM_addr);
> +#endif
> +
>  pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *ret, *init;
> --
> 2.34.1
>
>
