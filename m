Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBBC1F95C
	for <loongarch@lists.linux.dev>; Thu, 25 May 2023 18:04:40 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ba827a34ba8so1247134276.0
        for <loongarch@lists.linux.dev>; Thu, 25 May 2023 11:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685037879; x=1687629879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHz1MnM6TYYio2C+7LZLfrVXy67ugaabkk4Lxt+VEKA=;
        b=NoHSm+P+R3f9P1hTtI0Aa2538QwCPLtSoQPrBLURQdxmp107FQ1F0pBnbEQWwggzlT
         fiTACnc6uzA/OAWqwR1JVWYYICkwBDdnIXj4ERwntlgZc/Oij0dm8rv+0LrV+CltMo3B
         fKyXLHfkdRh4xQKVcMe8OCp5giU3Tnn12LZCznOtQl1pIuAziPLT4fePeWe5Cvh7ZNzP
         bRQ3kdfBju0tbpe4F8kOJL6Oz3PfBgKD+/0uu8kOUyKFxwwoV5gkGDAbnMcHEgSeCLSi
         HSGZ+QgYvXiydUgpNmaTWLnoPbGEK3dVe0T9hw+SN0OStPQTocdixTet+7JhvERZXcH+
         xYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685037879; x=1687629879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHz1MnM6TYYio2C+7LZLfrVXy67ugaabkk4Lxt+VEKA=;
        b=hvWgWlVnPdyUo6/6b77nNTLtm+S/5Tns9+msMK+wxK0sMl1nBktX7qrnT/omQ77Rll
         KLdZbr8RX8dziNsBT17Cw+V5ouEPV7KNiArMx45qWA/067WVpWRysUS3+MDl2UqanB9S
         2V4CyuzZN6t6AKXtssZFjxIChj4Geh4hol5WoVhYj4M6b1VgyTtPC6tOmJLjE5XHvhOJ
         AfWNFhsnRbvqAe/cgAU88GuHrZsxQZ9jsGMkmu6SDkY1lny0dJ54BppTolpC6caJSYp8
         mb6y7+BuxNnbXVDDjVwkXqkNBjqAVNB5yc0omJlYX4v+oJ1QetTPseiVT9I1onmGFstv
         ZF6w==
X-Gm-Message-State: AC+VfDz4eqKx86imIGq5YhT+wSsSyWZtt2pbvWPzTz4dC9eTGNcQIppj
	uH5XKFUA1bLg2OwYroLxtWmZd0tz31wM8JxhJo0=
X-Google-Smtp-Source: ACHHUZ7leu3e42UYud7EgWJZoN6PW1XGYdS9PCBG/tq5rzS7YnuUSWzFoklHW8B2kAANtPb/IRvLBp1ufSDbPWAmKj4=
X-Received: by 2002:a25:7493:0:b0:ba8:15a3:f2e4 with SMTP id
 p141-20020a257493000000b00ba815a3f2e4mr4848492ybc.0.1685037879336; Thu, 25
 May 2023 11:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com> <20230525090956.GX4967@kernel.org>
In-Reply-To: <20230525090956.GX4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 11:04:28 -0700
Message-ID: <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
To: Mike Rapoport <rppt@kernel.org>
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

On Thu, May 25, 2023 at 2:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, May 01, 2023 at 12:28:00PM -0700, Vishal Moola (Oracle) wrote:
> > Introduce utility functions setting the foundation for ptdescs. These
> > will also assist in the splitting out of ptdesc from struct page.
> >
> > ptdesc_alloc() is defined to allocate new ptdesc pages as compound
> > pages. This is to standardize ptdescs by allowing for one allocation
> > and one free function, in contrast to 2 allocation and 2 free functions=
.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  include/asm-generic/tlb.h | 11 ++++++++++
> >  include/linux/mm.h        | 44 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/pgtable.h   | 12 +++++++++++
> >  3 files changed, 67 insertions(+)
> >
> > diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> > index b46617207c93..6bade9e0e799 100644
> > --- a/include/asm-generic/tlb.h
> > +++ b/include/asm-generic/tlb.h
> > @@ -481,6 +481,17 @@ static inline void tlb_remove_page(struct mmu_gath=
er *tlb, struct page *page)
> >       return tlb_remove_page_size(tlb, page, PAGE_SIZE);
> >  }
> >
> > +static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
> > +{
> > +     tlb_remove_table(tlb, pt);
> > +}
> > +
> > +/* Like tlb_remove_ptdesc, but for page-like page directories. */
> > +static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, stru=
ct ptdesc *pt)
> > +{
> > +     tlb_remove_page(tlb, ptdesc_page(pt));
> > +}
> > +
> >  static inline void tlb_change_page_size(struct mmu_gather *tlb,
> >                                                    unsigned int page_si=
ze)
> >  {
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index b18848ae7e22..258f3b730359 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2744,6 +2744,45 @@ static inline pmd_t *pmd_alloc(struct mm_struct =
*mm, pud_t *pud, unsigned long a
> >  }
> >  #endif /* CONFIG_MMU */
> >
> > +static inline struct ptdesc *virt_to_ptdesc(const void *x)
> > +{
> > +     return page_ptdesc(virt_to_head_page(x));
>
> Do we ever use compound pages for page tables?

Mips and s390 crst tables use multi-order (but not compound) pages.
The ptdesc api *should* change that, but until all the allocation/free path=
s
are changed it may cause problems.
Thanks for catching that, I'll change it in v3.

> > +}
> > +
> > +static inline void *ptdesc_to_virt(const struct ptdesc *pt)
> > +{
> > +     return page_to_virt(ptdesc_page(pt));
> > +}
> > +
> > +static inline void *ptdesc_address(const struct ptdesc *pt)
> > +{
> > +     return folio_address(ptdesc_folio(pt));
> > +}
> > +
> > +static inline bool ptdesc_is_reserved(struct ptdesc *pt)
> > +{
> > +     return folio_test_reserved(ptdesc_folio(pt));
> > +}
> > +
> > +static inline struct ptdesc *ptdesc_alloc(gfp_t gfp, unsigned int orde=
r)
> > +{
> > +     struct page *page =3D alloc_pages(gfp | __GFP_COMP, order);
> > +
> > +     return page_ptdesc(page);
> > +}
> > +
> > +static inline void ptdesc_free(struct ptdesc *pt)
> > +{
> > +     struct page *page =3D ptdesc_page(pt);
> > +
> > +     __free_pages(page, compound_order(page));
> > +}
>
> The ptdesc_{alloc,free} API does not sound right to me. The name
> ptdesc_alloc() implies the allocation of the ptdesc itself, rather than
> allocation of page table page. The same goes for free.

I'm not sure I see the difference. Could you elaborate?

> > +
> > +static inline void ptdesc_clear(void *x)
> > +{
> > +     clear_page(x);
> > +}
> > +
> >  #if USE_SPLIT_PTE_PTLOCKS
> >  #if ALLOC_SPLIT_PTLOCKS
> >  void __init ptlock_cache_init(void);
> > @@ -2970,6 +3009,11 @@ static inline void mark_page_reserved(struct pag=
e *page)
> >       adjust_managed_page_count(page, -1);
> >  }
> >
> > +static inline void free_reserved_ptdesc(struct ptdesc *pt)
> > +{
> > +     free_reserved_page(ptdesc_page(pt));
> > +}
> > +
> >  /*
> >   * Default method to free all the __init memory into the buddy system.
> >   * The freed pages will be poisoned with pattern "poison" if it's with=
in
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 5e0f51308724..b067ac10f3dd 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1041,6 +1041,18 @@ TABLE_MATCH(ptl, ptl);
> >  #undef TABLE_MATCH
> >  static_assert(sizeof(struct ptdesc) <=3D sizeof(struct page));
> >
> > +#define ptdesc_page(pt)                      (_Generic((pt),          =
       \
> > +     const struct ptdesc *:          (const struct page *)(pt),      \
> > +     struct ptdesc *:                (struct page *)(pt)))
> > +
> > +#define ptdesc_folio(pt)             (_Generic((pt),                 \
> > +     const struct ptdesc *:          (const struct folio *)(pt),     \
> > +     struct ptdesc *:                (struct folio *)(pt)))
> > +
> > +#define page_ptdesc(p)                       (_Generic((p),           =
       \
> > +     const struct page *:            (const struct ptdesc *)(p),     \
> > +     struct page *:                  (struct ptdesc *)(p)))
> > +
> >  /*
> >   * No-op macros that just return the current protection value. Defined=
 here
> >   * because these macros can be used even if CONFIG_MMU is not defined.
> > --
> > 2.39.2
> >
> >
>
> --
> Sincerely yours,
> Mike.
