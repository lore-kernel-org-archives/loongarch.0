Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5042D8F71
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 07:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3ECCC433CB
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690270750;
	bh=yCZDIdxMjNkX9lOuzDqn+3Yh/GccWI0M6b3O0aS8Dnk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zx0mGrx5lLFOHOubu3kmvBw5iso+CgZlqhi0zdgLXgkchl8wzm7yeU+fOZ5DHrFUr
	 ZeeVb9VUOL2pmKVFgjL4+yHps/WO4c8620PSoURm0mA0z36SzppYyYvGPN0u/Nps+W
	 uRTAcgU+h+wjbsGZq4Sb/moiKn8HVhhPz6m92gJ3dYErPpqbKSz2wkUGjiF5cN+xUS
	 qW/r2GqomC9D6/hkecwIbWA3I1sV8CwVJUVL8Yl4yzXFRDk48X4mVI4OpoBCoFQzdv
	 Lf7jZ/Ks96cAE+uxDN+4AlaUbNfc3JTdlji3fOyX1hZnSEZagAxVnv5f1qE1sGBBjg
	 L+DIQv+O8dGVA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52229d3b8c8so2994533a12.2
        for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 00:39:10 -0700 (PDT)
X-Gm-Message-State: ABy/qLYAJwyBFb3zS95pk3CKfWGuH0tEg97VGCWEV7AFfjZwyZz3xTza
	8Th2k4Rz0FvPF+vTmoLPglKCX2gD4H/d1U9SxkM=
X-Google-Smtp-Source: APBJJlGfOeA/cNCsfW7zqUu1/yyOkDp8wAPMr94iW/szwgNAVeCIhoD332p4Ry20VaewkC8s6jDmdOz9dAg6W3S6XAw=
X-Received: by 2002:aa7:c394:0:b0:521:a740:29b7 with SMTP id
 k20-20020aa7c394000000b00521a74029b7mr10427977edq.36.1690270748946; Tue, 25
 Jul 2023 00:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230725061451.1231480-1-lienze@kylinos.cn> <20230725061451.1231480-2-lienze@kylinos.cn>
In-Reply-To: <20230725061451.1231480-2-lienze@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Jul 2023 15:38:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7ymPQkHUzqs-D03cT=JgkJd_=ZXjCVB1v_hhfop4pqYA@mail.gmail.com>
Message-ID: <CAAhV-H7ymPQkHUzqs-D03cT=JgkJd_=ZXjCVB1v_hhfop4pqYA@mail.gmail.com>
Subject: Re: [PATCH 1/4 v2] LoongArch: mm: Add page table mapped mode support
To: Enze Li <lienze@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, glider@google.com, 
	elver@google.com, akpm@linux-foundation.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, zhangqing@loongson.cn, yangtiezhu@loongson.cn, 
	dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Enze,

On Tue, Jul 25, 2023 at 2:15=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>
> According to LoongArch documentation online, there are two types of addre=
ss
> translation modes: direct mapped address translation mode (direct mapped =
mode)
> and page table mapped address translation mode (page table mapped mode).
>
> Currently, the upstream kernel only supports direct mapped mode.
> This patch adds a function that determines whether page table mapped
> mode should be used, and also adds the corresponding handler functions
> for both modes.
>
> For more details on the two modes, see [1].
>
> [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.=
html#virtual-address-space-and-address-translation-mode
>
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  arch/loongarch/include/asm/page.h    | 19 ++++++++++++++++++-
>  arch/loongarch/include/asm/pgtable.h |  2 ++
>  arch/loongarch/mm/pgtable.c          |  6 ++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/a=
sm/page.h
> index 26e8dccb6619..e43a2385b2cd 100644
> --- a/arch/loongarch/include/asm/page.h
> +++ b/arch/loongarch/include/asm/page.h
> @@ -32,6 +32,7 @@
>
>  #include <linux/kernel.h>
>  #include <linux/pfn.h>
> +#include <asm/cpu-features.h>
>
>  /*
>   * It's normally defined only for FLATMEM config but it's
> @@ -84,7 +85,23 @@ typedef struct { unsigned long pgprot; } pgprot_t;
>  #define sym_to_pfn(x)          __phys_to_pfn(__pa_symbol(x))
>
>  #define virt_to_pfn(kaddr)     PFN_DOWN(PHYSADDR(kaddr))
> -#define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
> +
> +static inline bool is_tlb_addr(unsigned long kaddr)
> +{
> +       if (unlikely((kaddr & GENMASK(BITS_PER_LONG - 1, cpu_vabits)) =3D=
=3D
> +                    GENMASK(BITS_PER_LONG - 1, cpu_vabits)))
> +               return true;
> +       return false;
I think this helper can simply "return (kaddr >=3D vm_map_base)"? If so,
we can even remove this helper and use the simple condition in
virt_to_page().

> +}
> +
> +#define dwm_virt_to_page(kaddr)        pfn_to_page(virt_to_pfn(kaddr))
This should be "dmw", not "dwm", and since tlb_virt_to_page is in .c
file, this one should also be there.

Huacai
> +
> +#define virt_to_page(kaddr)                                            \
> +({                                                                     \
> +       is_tlb_addr((unsigned long)kaddr) ?                             \
> +       tlb_virt_to_page((unsigned long)kaddr) :                        \
> +       dwm_virt_to_page((unsigned long)kaddr);                         \
> +})
>
>  extern int __virt_addr_valid(volatile void *kaddr);
>  #define virt_addr_valid(kaddr) __virt_addr_valid((volatile void *)(kaddr=
))
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index 38afeb7dd58b..98a0c98de9d1 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -353,6 +353,8 @@ static inline void pte_clear(struct mm_struct *mm, un=
signed long addr, pte_t *pt
>  #define PMD_T_LOG2     (__builtin_ffs(sizeof(pmd_t)) - 1)
>  #define PTE_T_LOG2     (__builtin_ffs(sizeof(pte_t)) - 1)
>
> +inline struct page *tlb_virt_to_page(unsigned long kaddr);
> +
>  extern pgd_t swapper_pg_dir[];
>  extern pgd_t invalid_pg_dir[];
>
> diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
> index 36a6dc0148ae..20e7425d235d 100644
> --- a/arch/loongarch/mm/pgtable.c
> +++ b/arch/loongarch/mm/pgtable.c
> @@ -9,6 +9,12 @@
>  #include <asm/pgtable.h>
>  #include <asm/tlbflush.h>
>
> +inline struct page *tlb_virt_to_page(unsigned long kaddr)
> +{
> +       return pte_page(*virt_to_kpte(kaddr));
> +}
> +EXPORT_SYMBOL_GPL(tlb_virt_to_page);
> +
>  pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *ret, *init;
> --
> 2.34.1
>
>
