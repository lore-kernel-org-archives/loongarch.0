Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F8101DA
	for <loongarch@lists.linux.dev>; Thu, 25 May 2023 18:17:26 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ba818eb96dcso772341276.0
        for <loongarch@lists.linux.dev>; Thu, 25 May 2023 11:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685038645; x=1687630645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEt/V8+3jpKdaWf/91twz9m1AxbB8mw1sieW7q1FOX4=;
        b=qpx33W23LxzGgtt7x0f+jHNiqnq/vW7f+lo4R60odkrqHHbvAvDFwCToA7ZeGOtlZu
         1pix82nq+XRaSlrOoV5XSSn7dUtYbrVRPJSVcc+Y0QUEIud/VeliblGAWTefKuC3uiLW
         Y767SW9acPu7TamxQ3rDZ7ad1waallUvH2KGWMSoPdMgQ6uqByETyo++E8JgCnYWaIR7
         T+3+xQi6fbJlgvqxHEFBxTPhg1oh030qaBtpvB360U8uoO6SqTXFxFoolc38s3Jd+HWF
         qSuZfJvCEliq2Q2QxhelaN+CYntsdlTkVUzhuGY+pHQjjIlm9D34YIwBuMF1/x8S1rOB
         qR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685038645; x=1687630645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEt/V8+3jpKdaWf/91twz9m1AxbB8mw1sieW7q1FOX4=;
        b=Aqm6ETQ0SEDaR2sWJnhNALC9p/aVT2UYiuqt7pnXTs444Hfc5WWbuuF0X7a8bzcxVW
         iBIdvRXgxjMFJqdURKqSWLfWTjU4t0F9ifjzle/VkNBwvcYFKdNnbP7bIT94qPZ5TAwL
         X6/E/oI5M26ODUlucfZgtGKv1SzKX0HI6epfsgblroaHUYfN/LcumzQ3tiHneQPV8yom
         nrVn5xrmAVgC1XznRJcPQVH/nHl8o9BWC3ELdy+13PVL4HXF7MRGSC0Rw2IwFb49W78a
         SbxtUNvRiyeTcU2BiIX+SiHcoyzoipYsbD400HZxK8H1n71X/MeZq/EyliN+cIBxdpK8
         OA3w==
X-Gm-Message-State: AC+VfDxn2StkdJYdT+KrIYNNR0YUwF4k59ZQ4n5WSuAX0DtkWtrMf1dx
	9+k4Lk70oVMowEd52c/WVnuQXLX2iGTggZQ0t7s=
X-Google-Smtp-Source: ACHHUZ4CxdCafEVA2N8+YE3r54vbJuyNv4iSvWQn7ibpFdu7Q8YcRob13nPjv7XKdbKB6AoaGk0hrDu/6J2TDu7u8Qo=
X-Received: by 2002:a25:ac6:0:b0:ba7:bb4c:7960 with SMTP id
 189-20020a250ac6000000b00ba7bb4c7960mr4320550ybk.26.1685038645132; Thu, 25
 May 2023 11:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-14-vishal.moola@gmail.com> <20230525091900.GY4967@kernel.org>
In-Reply-To: <20230525091900.GY4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 11:17:14 -0700
Message-ID: <CAOzc2pxNRbohxxNnaKtBNOBgOschHMj278-6hWZK9A1oJOgujA@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
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

On Thu, May 25, 2023 at 2:19=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, May 01, 2023 at 12:28:08PM -0700, Vishal Moola (Oracle) wrote:
> > Creates ptdesc_pte_ctor(), ptdesc_pmd_ctor(), ptdesc_pte_dtor(), and
> > ptdesc_pmd_dtor() and make the original pgtable constructor/destructors
> > wrappers.
>
> I think pgtable_pXY_ctor/dtor names would be better.

I have it as ptdesc to keep it consistent with the rest of the functions. I
also think it makes more sense as it's initializing stuff tracked by a ptde=
sc.

> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 42 insertions(+), 14 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 58c911341a33..dc61aeca9077 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2847,20 +2847,34 @@ static inline bool ptlock_init(struct ptdesc *p=
tdesc) { return true; }
> >  static inline void ptlock_free(struct ptdesc *ptdesc) {}
> >  #endif /* USE_SPLIT_PTE_PTLOCKS */
> >
> > -static inline bool pgtable_pte_page_ctor(struct page *page)
> > +static inline bool ptdesc_pte_ctor(struct ptdesc *ptdesc)
> >  {
> > -     if (!ptlock_init(page_ptdesc(page)))
> > +     struct folio *folio =3D ptdesc_folio(ptdesc);
> > +
> > +     if (!ptlock_init(ptdesc))
> >               return false;
> > -     __SetPageTable(page);
> > -     inc_lruvec_page_state(page, NR_PAGETABLE);
> > +     __folio_set_table(folio);
> > +     lruvec_stat_add_folio(folio, NR_PAGETABLE);
> >       return true;
> >  }
> >
> > +static inline bool pgtable_pte_page_ctor(struct page *page)
> > +{
> > +     return ptdesc_pte_ctor(page_ptdesc(page));
> > +}
> > +
> > +static inline void ptdesc_pte_dtor(struct ptdesc *ptdesc)
> > +{
> > +     struct folio *folio =3D ptdesc_folio(ptdesc);
> > +
> > +     ptlock_free(ptdesc);
> > +     __folio_clear_table(folio);
> > +     lruvec_stat_sub_folio(folio, NR_PAGETABLE);
> > +}
> > +
> >  static inline void pgtable_pte_page_dtor(struct page *page)
> >  {
> > -     ptlock_free(page_ptdesc(page));
> > -     __ClearPageTable(page);
> > -     dec_lruvec_page_state(page, NR_PAGETABLE);
> > +     ptdesc_pte_dtor(page_ptdesc(page));
> >  }
> >
> >  #define pte_offset_map_lock(mm, pmd, address, ptlp)  \
> > @@ -2942,20 +2956,34 @@ static inline spinlock_t *pmd_lock(struct mm_st=
ruct *mm, pmd_t *pmd)
> >       return ptl;
> >  }
> >
> > -static inline bool pgtable_pmd_page_ctor(struct page *page)
> > +static inline bool ptdesc_pmd_ctor(struct ptdesc *ptdesc)
> >  {
> > -     if (!pmd_ptlock_init(page_ptdesc(page)))
> > +     struct folio *folio =3D ptdesc_folio(ptdesc);
> > +
> > +     if (!pmd_ptlock_init(ptdesc))
> >               return false;
> > -     __SetPageTable(page);
> > -     inc_lruvec_page_state(page, NR_PAGETABLE);
> > +     __folio_set_table(folio);
> > +     lruvec_stat_add_folio(folio, NR_PAGETABLE);
> >       return true;
> >  }
> >
> > +static inline bool pgtable_pmd_page_ctor(struct page *page)
> > +{
> > +     return ptdesc_pmd_ctor(page_ptdesc(page));
> > +}
> > +
> > +static inline void ptdesc_pmd_dtor(struct ptdesc *ptdesc)
> > +{
> > +     struct folio *folio =3D ptdesc_folio(ptdesc);
> > +
> > +     pmd_ptlock_free(ptdesc);
> > +     __folio_clear_table(folio);
> > +     lruvec_stat_sub_folio(folio, NR_PAGETABLE);
> > +}
> > +
> >  static inline void pgtable_pmd_page_dtor(struct page *page)
> >  {
> > -     pmd_ptlock_free(page_ptdesc(page));
> > -     __ClearPageTable(page);
> > -     dec_lruvec_page_state(page, NR_PAGETABLE);
> > +     ptdesc_pmd_dtor(page_ptdesc(page));
> >  }
> >
> >  /*
> > --
> > 2.39.2
> >
> >
>
> --
> Sincerely yours,
> Mike.
