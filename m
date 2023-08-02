Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77AD1869
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 07:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40326C433CD
	for <loongarch@lists.linux.dev>; Wed,  2 Aug 2023 07:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690961137;
	bh=7ac5mLx+Z8tz6A020GlMURpe0CVYg0kIVLd/wHPImpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mDWPY+Pqb6q9P4ARFAneODV2JU7D9hQv1/2DvXBU+UFv79eWqtvXfkOo3d0SkZCUg
	 ELFA6Wnmrz1rAzvI4fPbBs9mBAP+Ebpu2T1SHkDoKYJL1KRGXZPy64paoOee2jW6aB
	 86BaEpxEueX+EuoLKwVUN1RCE6Yf78tizBQs0mKwCGjv/L0KhMrehm8DutfgRu5zoZ
	 JfAoSc4LUfwmyOoO1fvh+D8nq/XVfv/HMD6uF/y2aD1D98vhTqpe2n4e5rzfIhWoVk
	 hNkNUsswn8kMWggIK5MZNeTX90glK949XOKmJctY+0hQlHK+JOXOpgwh5KDpPBnRvD
	 YuQQYjsMO3PDg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so1318635a12.0
        for <loongarch@lists.linux.dev>; Wed, 02 Aug 2023 00:25:37 -0700 (PDT)
X-Gm-Message-State: ABy/qLZhrjHDeYwmvy/zfvjrlsI538o7bApanSh4ohWcP5uDBl4GNh0O
	fdWOUdv+WjShDf5vSw93dmj4c5eMPY0GwTBQZvE=
X-Google-Smtp-Source: APBJJlEU0DcU0gsawBi6xcupkNk8Ve82mxjoSpWJn48IJwgcAHnxEVK2HPzY5o3KorKXS331qg802GDhtNSlbQ6nKKo=
X-Received: by 2002:a05:6402:270f:b0:522:582f:91af with SMTP id
 y15-20020a056402270f00b00522582f91afmr5844319edd.9.1690961135362; Wed, 02 Aug
 2023 00:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230712031622.1888321-1-maobibo@loongson.cn> <20230712031622.1888321-4-maobibo@loongson.cn>
 <CAAhV-H5pHoFo7i8EpacLU=AWKKPckssJN1aThi+Bb8PPHn0gkA@mail.gmail.com> <e6139ffa-92e5-8247-ba0b-71def4795104@loongson.cn>
In-Reply-To: <e6139ffa-92e5-8247-ba0b-71def4795104@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 2 Aug 2023 15:25:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Y9SGaLA3+x8-kMg0eWW3UeGLTGMnmcTp7xftJPiJSoA@mail.gmail.com>
Message-ID: <CAAhV-H7Y9SGaLA3+x8-kMg0eWW3UeGLTGMnmcTp7xftJPiJSoA@mail.gmail.com>
Subject: Re: [PATCH 3/3] LoongArch: mm: Add unified function populate_kernel_pte
To: bibo mao <maobibo@loongson.cn>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Andrew Morton <akpm@linux-foundation.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 9:22=E2=80=AFAM bibo mao <maobibo@loongson.cn> wrote=
:
>
>
>
> =E5=9C=A8 2023/7/31 22:15, Huacai Chen =E5=86=99=E9=81=93:
> > On Wed, Jul 12, 2023 at 11:16=E2=80=AFAM Bibo Mao <maobibo@loongson.cn>=
 wrote:
> >>
> >> Function pcpu_populate_pte and fixmap_pte are similar, they populate
> >> one page from kernel address space. And there is confusion between
> >> pgd and p4d in function fixmap_pte, such as pgd_none always returns
> >> zero. This patch adds unified function populate_kernel_pte and replace=
s
> >> pcpu_populate_pte and fixmap_pte.
> >>
> >> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> >> ---
> >>  arch/loongarch/include/asm/pgalloc.h |  1 +
> >>  arch/loongarch/kernel/numa.c         | 40 +--------------------
> >>  arch/loongarch/mm/init.c             | 52 ++++++++++++++++-----------=
-
> >>  3 files changed, 32 insertions(+), 61 deletions(-)
> >>
> >> diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/inc=
lude/asm/pgalloc.h
> >> index af1d1e4a6965..ca17b573dba6 100644
> >> --- a/arch/loongarch/include/asm/pgalloc.h
> >> +++ b/arch/loongarch/include/asm/pgalloc.h
> >> @@ -91,4 +91,5 @@ static inline pud_t *pud_alloc_one(struct mm_struct =
*mm, unsigned long address)
> >>
> >>  #endif /* __PAGETABLE_PUD_FOLDED */
> >>
> >> +extern pte_t * __init populate_kernel_pte(unsigned long addr);
> >>  #endif /* _ASM_PGALLOC_H */
> >> diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa=
.c
> >> index 778e1c20bfb0..24a693b76873 100644
> >> --- a/arch/loongarch/kernel/numa.c
> >> +++ b/arch/loongarch/kernel/numa.c
> >> @@ -67,46 +67,8 @@ static int __init pcpu_cpu_distance(unsigned int fr=
om, unsigned int to)
> >>
> >>  void __init pcpu_populate_pte(unsigned long addr)
> >>  {
> >> -       pgd_t *pgd =3D pgd_offset_k(addr);
> >> -       p4d_t *p4d =3D p4d_offset(pgd, addr);
> >> -       pud_t *pud;
> >> -       pmd_t *pmd;
> >> -
> >> -       if (p4d_none(*p4d)) {
> >> -               pud =3D memblock_alloc_raw(PAGE_SIZE, PAGE_SIZE);
> >> -               if (!pud)
> >> -                       goto err_alloc;
> >> -               p4d_populate(&init_mm, p4d, pud);
> >> -#ifndef __PAGETABLE_PUD_FOLDED
> >> -               pud_init(pud);
> >> -#endif
> >> -       }
> >> -
> >> -       pud =3D pud_offset(p4d, addr);
> >> -       if (pud_none(*pud)) {
> >> -               pmd =3D memblock_alloc_raw(PAGE_SIZE, PAGE_SIZE);
> >> -               if (!pmd)
> >> -                       goto err_alloc;
> >> -               pud_populate(&init_mm, pud, pmd);
> >> -#ifndef __PAGETABLE_PMD_FOLDED
> >> -               pmd_init(pmd);
> >> -#endif
> >> -       }
> >> -
> >> -       pmd =3D pmd_offset(pud, addr);
> >> -       if (!pmd_present(*pmd)) {
> >> -               pte_t *pte;
> >> -
> >> -               pte =3D memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> >> -               if (!pte)
> >> -                       goto err_alloc;
> >> -               pmd_populate_kernel(&init_mm, pmd, pte);
> >> -       }
> >> -
> >> +       populate_kernel_pte(addr);
> >>         return;
> >> -
> >> -err_alloc:
> >> -       panic("%s: Failed to allocate memory\n", __func__);
> >>  }
> >>
> >>  void __init setup_per_cpu_areas(void)
> >> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> >> index 3b7d8129570b..6cd2948373ae 100644
> >> --- a/arch/loongarch/mm/init.c
> >> +++ b/arch/loongarch/mm/init.c
> >> @@ -191,46 +191,49 @@ void vmemmap_free(unsigned long start, unsigned =
long end, struct vmem_altmap *al
> >>  #endif
> >>  #endif
> >>
> >> -static pte_t *fixmap_pte(unsigned long addr)
> >> +pte_t * __init populate_kernel_pte(unsigned long addr)
> >>  {
> >> -       pgd_t *pgd;
> >> -       p4d_t *p4d;
> >> +       pgd_t *pgd =3D pgd_offset_k(addr);
> >> +       p4d_t *p4d =3D p4d_offset(pgd, addr);
> >>         pud_t *pud;
> >>         pmd_t *pmd;
> >>
> >> -       pgd =3D pgd_offset_k(addr);
> >> -       p4d =3D p4d_offset(pgd, addr);
> >> -
> >> -       if (pgd_none(*pgd)) {
> >> -               pud_t *new __maybe_unused;
> >> -
> >> -               new =3D memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
> >> -               pgd_populate(&init_mm, pgd, new);
> >> +       if (p4d_none(*p4d)) {
> >> +               pud =3D memblock_alloc_raw(PAGE_SIZE, PAGE_SIZE);
> >> +               if (!pud)
> >> +                       goto err_alloc;
> >> +               p4d_populate(&init_mm, p4d, pud);
> >>  #ifndef __PAGETABLE_PUD_FOLDED
> >> -               pud_init(new);
> >> +               pud_init(pud);
> >>  #endif
> >>         }
> >>
> >>         pud =3D pud_offset(p4d, addr);
> >>         if (pud_none(*pud)) {
> >> -               pmd_t *new __maybe_unused;
> >> -
> >> -               new =3D memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
> >> -               pud_populate(&init_mm, pud, new);
> >> +               pmd =3D memblock_alloc_raw(PAGE_SIZE, PAGE_SIZE);
> >> +               if (!pmd)
> >> +                       goto err_alloc;
> >> +               pud_populate(&init_mm, pud, pmd);
> >>  #ifndef __PAGETABLE_PMD_FOLDED
> >> -               pmd_init(new);
> >> +               pmd_init(pmd);
> >>  #endif
> >>         }
> >>
> >>         pmd =3D pmd_offset(pud, addr);
> >> -       if (pmd_none(*pmd)) {
> >> -               pte_t *new __maybe_unused;
> >> +       if (!pmd_present(*pmd)) {
> >> +               pte_t *pte;
> >>
> >> -               new =3D memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
> >> -               pmd_populate_kernel(&init_mm, pmd, new);
> >> +               pte =3D memblock_alloc(PAGE_SIZE, PAGE_SIZE);
> > I don't think memblock_alloc_low() here can be replaced by memblock_all=
oc().
> Can you share me the points that pte table must be allocated with membloc=
k_alloc_low
> in this place?
I forget the reason now, so if you confirm memblock_alloc() works well
here, you can use it. But please don't use memblock_alloc_raw().

Huacai
>
> Regards
> Bibo Mao
> >
> >
> > Huacai
> >> +               if (!pte)
> >> +                       goto err_alloc;
> >> +               pmd_populate_kernel(&init_mm, pmd, pte);
> >>         }
> >>
> >>         return pte_offset_kernel(pmd, addr);
> >> +
> >> +err_alloc:
> >> +       panic("%s: Failed to allocate memory\n", __func__);
> >> +       return NULL;
> >>  }
> >>
> >>  void __init __set_fixmap(enum fixed_addresses idx,
> >> @@ -241,7 +244,12 @@ void __init __set_fixmap(enum fixed_addresses idx=
,
> >>
> >>         BUG_ON(idx <=3D FIX_HOLE || idx >=3D __end_of_fixed_addresses)=
;
> >>
> >> -       ptep =3D fixmap_pte(addr);
> >> +       /*
> >> +        * Now only FIX_EARLYCON_MEM_BASE fixed map is used
> >> +        * __set_fixmap must be called before mem_init since function
> >> +        * populate_kernel_pte allocates memory with memblock_alloc me=
thod.
> >> +        */
> >> +       ptep =3D populate_kernel_pte(addr);
> >>         if (!pte_none(*ptep)) {
> >>                 pte_ERROR(*ptep);
> >>                 return;
> >> --
> >> 2.27.0
> >>
>
>
