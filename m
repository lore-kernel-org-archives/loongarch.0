Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D59D2EA
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 20:29:27 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54c12009c30so16214097b3.9
        for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681936166; x=1684528166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri4M7wwnqfUyWg7ITQYtSCFlkjwgDD80RYs577YrqxA=;
        b=WIB0Mw6mTuaRsirvoZFjheEp9yY5Y/q9onOHwXnfWFMdFmYyli6xaVNh9nuRkFM8Bu
         OnXLT3OfefylOw1YM4VwkunQfq+Wm/ji1lKG5q5iuDSnqXz+pveEOmagYUHY70pV+qoa
         KvVDM5rfvXh7k0t2ztxy0CpMZU4jrTcGpdw3ugWQ7PYvTc5DIMuci51oMb3/89hTRu18
         ASTMyUIpSKSpdVyzVJqnIsAfKfcTX+AN3kdlEImle/BVRj8WezpdfvQGOxxtdhWDpR5M
         v2CCX9NS0Q1nwilMdzeBzucKwgU44O+OvH3u0Wiv6qbWAvaUduq3fyhR1v2QD/zzuIcP
         d4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681936166; x=1684528166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ri4M7wwnqfUyWg7ITQYtSCFlkjwgDD80RYs577YrqxA=;
        b=Lb6OorDSPYW8Szii4GrYVVyaMzg3ylxPSpneNJCGytCf2FKlCFvuOvHGzGn0OlVVqe
         /WV2u9FUkp5HhNAPyRPV+goGxvYWoOlbPoZ6VqfPRrNeHkKhVFN+VSXqBV8L6E7zdIZ2
         eDOw4FPQNM99ucSsv8NIba99j603E2QSlu4vDhl+cSwr5wOqY8Frq5DqRswGsqFo6SoZ
         kXr3j3+9h9gjuiNBWfMkQ1q2hkXWbtBfvY4q7LRbb7SzhwBS/uqnzpQU8TIv8Tkhzk7y
         Y1Q44QsGtgohXIcYil9Mhp0FfKAO48Xiib5Hi1IEAddBtiKXhmUo2st9zhiA9mXg8GfP
         JaPw==
X-Gm-Message-State: AAQBX9dXFqSta6UxjJgHWaTl/A/9CFLJ5ZrTT27uJyWjQZz/oI+AekHI
	72lFGjdfIV1klVTg3aJkSmv2r3oZIf4Jo5zdCRU=
X-Google-Smtp-Source: AKy350aNDMALBM0VAdPN5cwgCAJgGmI7MyMPzfpEMhO/TACZWqeGBJUZoGoWlGr6ZHAaYh0Tzxhzwi/dxg7Fov1Ofog=
X-Received: by 2002:a81:53c2:0:b0:54e:84f6:6669 with SMTP id
 h185-20020a8153c2000000b0054e84f66669mr4502802ywb.49.1681936166163; Wed, 19
 Apr 2023 13:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230417205048.15870-1-vishal.moola@gmail.com>
 <20230417205048.15870-5-vishal.moola@gmail.com> <ZD/syK8RYO9FZ6ks@vernon-pc>
In-Reply-To: <ZD/syK8RYO9FZ6ks@vernon-pc>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Wed, 19 Apr 2023 13:29:14 -0700
Message-ID: <CAOzc2pyt8MBv7N0qizdxr0__RKXK7hMLX-Jqvsd6RPh3nyTFVw@mail.gmail.com>
Subject: Re: [PATCH 4/33] mm: add utility functions for ptdesc
To: Vernon Yang <vernon2gm@gmail.com>
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

On Wed, Apr 19, 2023 at 6:34=E2=80=AFAM Vernon Yang <vernon2gm@gmail.com> w=
rote:
>
> On Mon, Apr 17, 2023 at 01:50:19PM -0700, Vishal Moola wrote:
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
> >  include/linux/pgtable.h   | 13 ++++++++++++
> >  3 files changed, 68 insertions(+)
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
> > index b18848ae7e22..ec3cbe2fa665 100644
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
> > +}
> > +
> > +static inline void *ptdesc_to_virt(struct ptdesc *pt)
> > +{
> > +     return page_to_virt(ptdesc_page(pt));
> > +}
> > +
> > +static inline void *ptdesc_address(struct ptdesc *pt)
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
> > index 7cc6ea057ee9..7cd803aa38eb 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -97,6 +97,19 @@ TABLE_MATCH(ptl, ptl);
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
> > +static inline struct ptdesc *page_ptdesc(struct page *page)
> > +{
> > +     return (struct ptdesc *)page;
> > +}
>
> Hi Vishal,
>
> I'm a little curious, why is the page_ptdesc() using inline functions ins=
tead of macro?
> If this is any magic, please tell me, thank you very much.

No magic here, I was mainly basing it off Matthew's netmem
series. I'm not too clear on when to use macros vs inlines
myself :/.

If there's a benefit to having it be a macro let me
know and I can make that change in v2.
