Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44340539B
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 07:40:24 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so942368276.1
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 00:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605223; x=1688197223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Vy5gwXbACIYw+FA/+yi3OHDGD1kIURAtfeea/c7peI=;
        b=h36Q8eNTxIwQI2cmaeuLbD7I1/obYfdOMvvlA5InQ6qJg+S/Op4GR9IvhitW+vF/rQ
         L4A25EqpSguQk6i65xULtVhJ0BfhPPEjMAKEs158IAZlUHgUtgmmHh3DnvAetjX5OZeA
         LiFCCtjYlrP1IfWEoonXPLoCqYxjSDIx+SQaE+XvsF34QmjsZT+5Uij2EIHEnSDG+m+I
         lP9JURqCX0DXWDYqx3Ia8G/F9LBIHiY9KEWh2O2FUJ8n1uU9ojGq/7hjiUApB767V8R7
         CTJXjIT/cvzip8HP0+kLZEsyEwHwtpWztnV8sc5DwmrY/aByde0y1CBnw8O6WWtC2w3v
         PxjA==
X-Gm-Message-State: AC+VfDyJzab4bzgi+WNmp+CWCMLa6kUNdh0WB/sxdcj27cmeZjsQkXKh
	fDNzZJr7uKVnKIHN1A4WKN7zCbAC7++u6g==
X-Google-Smtp-Source: ACHHUZ79dHgCSgqGQ4Na0kndWgK28jx5OSMLezi+MKhHowPsBj3/83awE/Gxua0NU69s0OrSY93rtA==
X-Received: by 2002:a25:160a:0:b0:ba1:24a5:55ae with SMTP id 10-20020a25160a000000b00ba124a555aemr1086189ybw.24.1685605222719;
        Thu, 01 Jun 2023 00:40:22 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id k13-20020a25e80d000000b00bad59725e11sm3419827ybd.57.2023.06.01.00.40.21
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:40:21 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55db055b412so28189737b3.0
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 00:40:21 -0700 (PDT)
X-Received: by 2002:a81:a041:0:b0:565:9f61:c771 with SMTP id
 x62-20020a81a041000000b005659f61c771mr1176431ywg.9.1685605221248; Thu, 01 Jun
 2023 00:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-26-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-26-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jun 2023 09:40:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
Message-ID: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
Subject: Re: [PATCH v3 25/34] m68k: Convert various functions to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vishal,

On Wed, May 31, 2023 at 11:32=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors wit=
h
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> @@ -7,20 +7,19 @@
>
>  extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  {
> -       free_page((unsigned long) pte);
> +       pagetable_free(virt_to_ptdesc(pte));
>  }
>
>  extern const char bad_pmd_string[];
>
>  extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  {
> -       unsigned long page =3D __get_free_page(GFP_DMA);
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | __GFP_ZERO, 0=
);
>
> -       if (!page)
> +       if (!ptdesc)
>                 return NULL;
>
> -       memset((void *)page, 0, PAGE_SIZE);
> -       return (pte_t *) (page);
> +       return (pte_t *) (ptdesc_address(ptdesc));

No need to cast "void *" when returning a different pointer type.

>  }
>
>  extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
> @@ -35,36 +34,36 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, uns=
igned long address)
>  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgta=
ble,
>                                   unsigned long address)
>  {
> -       struct page *page =3D virt_to_page(pgtable);
> +       struct ptdesc *ptdesc =3D virt_to_ptdesc(pgtable);
>
> -       pgtable_pte_page_dtor(page);
> -       __free_page(page);
> +       pagetable_pte_dtor(ptdesc);
> +       pagetable_free(ptdesc);
>  }
>
>  static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
>  {
> -       struct page *page =3D alloc_pages(GFP_DMA, 0);
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA, 0);
>         pte_t *pte;
>
> -       if (!page)
> +       if (!ptdesc)
>                 return NULL;
> -       if (!pgtable_pte_page_ctor(page)) {
> -               __free_page(page);
> +       if (!pagetable_pte_ctor(ptdesc)) {
> +               pagetable_free(ptdesc);
>                 return NULL;
>         }
>
> -       pte =3D page_address(page);
> -       clear_page(pte);
> +       pte =3D ptdesc_address(ptdesc);
> +       pagetable_clear(pte);
>
>         return pte;
>  }
>
>  static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
>  {
> -       struct page *page =3D virt_to_page(pgtable);
> +       struct ptdesc *ptdesc =3D virt_to_ptdesc(ptdesc);

virt_to_ptdesc(pgtable)

(You can build this using m5475evb_defconfig)

>
> -       pgtable_pte_page_dtor(page);
> -       __free_page(page);
> +       pagetable_pte_dtor(ptdesc);
> +       pagetable_free(ptdesc);
>  }
>
>  /*
> @@ -75,16 +74,18 @@ static inline void pte_free(struct mm_struct *mm, pgt=
able_t pgtable)
>
>  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  {
> -       free_page((unsigned long) pgd);
> +       pagetable_free(virt_to_ptdesc(pgd));
>  }
>
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *new_pgd;
> +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | GFP_NOWARN, 0=
);
>
> -       new_pgd =3D (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -       if (!new_pgd)
> +       if (!ptdesc)
>                 return NULL;
> +       new_pgd =3D (pgd_t *) ptdesc_address(ptdesc);

No need to cast "void *" when assigning to a different pointer type.

> +
>         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>         return new_pgd;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
