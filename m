Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627347;
	b=QryhY6cn9K40cnt6HIWex54EJj/+t4i4U2jonvfY6NlDlTfbk8BpmqCkTY6fbAGdK1WL
	 moRcNsdSnkwOGAYs9jSXZHos1QKZWB6WWsB5VohbVRIXHx/uUOcK645yC68iGRIUfORQg
	 mcWGxXsOQPBVoXpenGo9UsNV0HudUxFiVFKFOG/84mQr5GU8ecKyxyTy/oL2+SH8F6NKr
	 Zo4AZJ9eHt8vyxTyHgoYDKfYefgsgCPUi8ev2diA/LkiE+gtCdQsorjAieWW0F8XRxqzF
	 OW/aDPczniG8lwUhbFIraLr66pmShDAzx5Mi8eYY7y0m2geJ+S7IALzw5dH+9b4DEuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627347;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t19/VpHeuZfEnwqIz1VMgr6RSjKRD0I7ktZ5p1JSZr4=;
	b=eewVt2qjXRzh2wfShaTyHM+6V2gOnsTf/dUDKozyPBtKGHjDuvTEnSVqCY/kZ3ZpfWp6
	 72xd9q2MJehkTi8i33s/EZalJSJKEfzqJeK8Z6lcJhkigychKfQ78KnROwhNZXTWMzYg6
	 iE9uiW/Sc9/ddismoV7JYSpxvSJnLAwQgynVSfnkxjA+q9MgdkrZx0RJmRyWzOrzv5ohc
	 bQdBQagZreeHuu8+VmPbwRB4uYRZKezwC+nr5Owc6c7+C9jswPO4GuwgJV7UAsxyIAiM/
	 dLqgR6mvzip8/xZBtU4bMIjO3awjYwvG4FvUmEjA7zt0pvZX9muEsqDu9fx1ZLB98RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PibnYngj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D48C606A329
	for <loongarch@lists.linux.dev>; Mon,  2 Nov 2026 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PibnYngj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055C71F00A22
	for <loongarch@lists.linux.dev>; Mon,  2 Nov 2026 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627346;
	bh=t19/VpHeuZfEnwqIz1VMgr6RSjKRD0I7ktZ5p1JSZr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PibnYngj93INKIgmuLDamvnpd3h/LzF75x3BckewzuN/LKYexS6A6s4p+GyGmOagu
	 d2LaaEgeKuoifKJYNsyW/I54v+Qynd9htjRVY/Dyj/kXu5LM6YB1xs2qKakqGjyYar
	 SupCqkCFn3Hk+Fi8bq5aAHToi9GeQkxhGX5Uze39A3NeC/6gX+qhn0Qvbd3vje8dMR
	 A3jJeRiAVPoGChfjnu/JnuameduBaHBYR+/7Gvw+oEt/jwWHLzWrK73ptuNQo3RPib
	 /kgVsTvXcgeDSW56fzUkZNB1dzTIxj1UD4886iHPB4eC5krElcfZhccqhRjUOsvIO2
	 0Ku965Q2WCkGw==
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc013095d4so892732137.2
        for <loongarch@lists.linux.dev>; Mon, 02 Nov 2026 05:49:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy/pfcl8dHWe/vSIo9T6QZhfSXVw4e8/l3wePubo7+GtBhTu22runfwc07yVLmxH1Y7txwxwpX8Lto=@lists.linux.dev
X-Gm-Message-State: APuU4Z+j0Hj8ozqCURUasq0D69xiwzJyoPhCNBZ1AcBSp/jvlOeFKJyk
	uRwTsM31UnEJs15nTbvX6acKTSt3wrMEJ55IU8d7Rig0hB4PMoSmuoxTFL5hwItOkHCuKpfbZfF
	0tjtfwad33jJrQPkWYHURPy5E6JxvuPM=
X-Received: by 2002:a05:6102:6047:b0:7c3:ac59:158b with SMTP id
 ada2fe7eead31-7d072c91ddemr2933364137.23.1793627344929; Mon, 02 Nov 2026
 05:49:04 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-8-songmuchun@bytedance.com> <sashiko-outbox-192874@kernel.org>
 <2D6DE4F4-8DB1-45D4-B076-36FE6714C575@linux.dev>
In-Reply-To: <2D6DE4F4-8DB1-45D4-B076-36FE6714C575@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 2 Nov 2026 21:48:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4BPOJJy367p0MZcEWk3WziV3rPiCtoKPSGOqrQt5W1Pw@mail.gmail.com>
X-Gm-Features: AclHuK8vnwbfTipAOd6WMVXtrU5YJ6-7EJCkQE6p8MgAvtOeminm8SJMrGrSJ0M
Message-ID: <CAAhV-H4BPOJJy367p0MZcEWk3WziV3rPiCtoKPSGOqrQt5W1Pw@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] mm: hugetlb_vmemmap: simplify shared tail page handling
To: Muchun Song <muchun.song@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Muchun Song <songmuchun@bytedance.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	James Houghton <jthoughton@google.com>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:12=E2=80=AFPM Muchun Song <muchun.song@linux.dev> =
wrote:
>
>
>
> > On Nov 2, 2026, at 11:52, sashiko-bot@kernel.org wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] mm: hugetlb_vmemmap: uninitialized tail page read in vmemmap_o=
ptimize_pte()
> > --
> >
> > commit 32511c4a4d8ec3d45e0f629f89666a78dc9372ee
> > Author: Muchun Song <muchun.song@linux.dev>
> >
> > mm: hugetlb_vmemmap: simplify shared tail page handling
> >
> > This commit removes the vmemmap_tail field from struct vmemmap_remap_wa=
lk and
> > updates vmemmap_optimize_pte() and vmemmap_restore_pte() to derive the =
shared
> > tail page directly from the folio being processed.
> >
> >> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> >> index 5e84004db4b87..d0af251aa533c 100644
> >> --- a/mm/hugetlb_vmemmap.c
> >> +++ b/mm/hugetlb_vmemmap.c
> >
> > [ ... ]
> >
> >> @@ -213,53 +211,53 @@ static struct page *vmemmap_dup_page_from_list(c=
onst struct page *src,
> >>      return dst;
> >> }
> >>
> >> -static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
> >> -                             struct vmemmap_remap_walk *walk)
> >> +static inline struct page *folio_vmemmap_shared_tail_page(const struc=
t folio *folio)
> >> {
> >> -    struct page *page =3D pte_page(ptep_get(pte));
> >> -    pte_t entry;
> >> -
> >> -    /* Remapping the head page requires r/w */
> >> -    if (unlikely(walk->nr_walked =3D=3D 0)) {
> >> -            struct page *head;
> >> +    return vmemmap_shared_tail_page(folio_order(folio), folio_zone(fo=
lio));
> >> +}
> >>
> >> -            VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
> >> +static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
> >> +                            struct vmemmap_remap_walk *walk)
> >> +{
> >> +    const struct page *page =3D (const struct page *)addr;
> >> +    const struct folio *folio =3D page_folio(page);
> >> +    struct page *src =3D pte_page(ptep_get(pte)), *dst;
> >>
> >> -            head =3D vmemmap_dup_page_from_list(page, walk->vmemmap_p=
ages);
> >> -            entry =3D mk_pte(head, PAGE_KERNEL);
> >> +    if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order=
(folio)))) {
> >> +            dst =3D folio_vmemmap_shared_tail_page(folio);
> >> +            if (!dst)
> >> +                    return -ENOMEM;
> >>      } else {
> >> -            VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
> >> -
> >> -            /*
> >> -             * Map the shared tail page writable. A lockless get that=
 read
> >> -             * a non-zero refcount before the remap can still do its
> >> -             * cmpxchg after it. The refcount is zero, so the cmpxchg
> >> -             * fails and leaves the page unchanged.
> >> -             */
> >> -            entry =3D mk_pte(walk->vmemmap_tail, PAGE_KERNEL);
> >> +            dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pag=
es);
> >>      }
> >
> > [Severity: High]
> > Can calling page_folio(page), folio_order(folio), and
> > folio_vmemmap_shared_tail_page(folio) on every PTE in vmemmap_optimize_=
pte()
> > read uninitialized tail struct pages for bootmem gigantic hugepages?
> >
> > During early boot in alloc_bootmem_huge_page(), gigantic hugepages mark=
 all
> > tail pages [pfn + 1, pfn + nr_pages) with memblock_reserved_mark_noinit=
(), so
> > memmap_init_reserved_pages() skips initializing their struct pages:
> >
> > mm/hugetlb.c:alloc_bootmem_huge_page() {
> >    ...
> >       if (hugetlb_vmemmap_optimizable(h))
> >               hugetlb_vmemmap_optimize_bootmem_page(pfn, huge_page_orde=
r(h));
> >    ...
> >       memblock_reserved_mark_noinit(PFN_PHYS(pfn + 1),
> >                                     (nr_pages - 1) * PAGE_SIZE);
> > }
> >
> > When a bootmem gigantic hugepage is not aligned to PAGES_PER_SECTION (f=
or
> > example, when nr_pages < PAGES_PER_SECTION, such as on 64-bit LoongArch=
 with
> > 16KB base pages where SECTION_SIZE_BITS is 29 and PMD_SHIFT is 25 with
> > CONFIG_ARCH_FORCE_MAX_ORDER=3D10), section_set_compound_order_range() r=
eturns
>
> This issue does not occur with the default LoongArch configuration. For
> 16KB base pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11, which
> matches HUGETLB_PAGE_ORDER.
>
> The reported case requires manually overriding CONFIG_ARCH_FORCE_MAX_ORDE=
R
> to 10 while keeping HugeTLB enabled. This creates an **invalid configurat=
ion**
> that Kconfig currently permits:
>
> HUGETLB_PAGE_ORDER      =3D 11
> MAX_FOLIO_ORDER         =3D 10
>
> LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so the generic MM code
> assumes that folios cannot exceed MAX_PAGE_ORDER. The forced configuratio=
n
> violates that assumption and is already diagnosed by:
>
>         WARN_ON(order > MAX_FOLIO_ORDER);
>
> in hugetlb_add_hstate().
>
> Therefore, this is not a regression in a supported LoongArch configuratio=
n,
> and I don't think this series needs to handle it. The proper fix is a sep=
arate
> LoongArch Kconfig change preventing ARCH_FORCE_MAX_ORDER from being set b=
elow
> the HugeTLB order when HugeTLB is enabled.
Yes, this isn't a regression, the problem existed before this series.

I suggest change BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER >
MAX_FOLIO_ORDER) to MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER >
MAX_FOLIO_ORDER) in mm/hugetlb.c, which cause a build error
immediately for invalid ARCH_FORCE_MAX_ORDER configurations.

Huacai

>
> Cc LoongArch maintainers.
>
> Thanks,
> Muchun
>
> > early without setting section->compound_page_order:
> >
> > include/linux/vmemmap-optimization.h:section_set_compound_order_range()=
 {
> >       unsigned long section_nr =3D pfn_to_section_nr(pfn);
> >
> >       if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
> >               return;
> >    ...
> > }
> >
> > In that case, sparse_init() allocates regular vmemmap pages via
> > memmap_alloc(), leaving them uninitialized (or filled with 0xff under
> > CONFIG_DEBUG_VM).
> >
> > Later, gather_bootmem_prealloc_node() initializes only the first
> > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES struct pages (covering only the fi=
rst
> > vmemmap PTE), and prep_and_add_bootmem_folios() defers initializing the
> > remaining tail struct pages until after hugetlb_vmemmap_optimize_folios=
()
> > runs and fails:
> >
> > mm/hugetlb.c:gather_bootmem_prealloc_node() {
> >    ...
> >               hugetlb_folio_init_vmemmap(folio, h,
> >                                          VMEMMAP_OPTIMIZATION_NR_STRUCT=
_PAGES);
> >               init_new_hugetlb_folio(folio);
> >
> >               if (vmemmap_optimizable_order(pfn_to_section_compound_ord=
er(pfn)))
> >                       folio_set_hugetlb_vmemmap_optimized(folio);
> >    ...
> > }
> >
> > mm/hugetlb.c:prep_and_add_bootmem_folios() {
> >       /* Send list for bulk vmemmap optimization processing */
> >       hugetlb_vmemmap_optimize_folios(h, folio_list);
> >
> >       list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
> >               if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
> >                       hugetlb_folio_init_tail_vmemmap(folio, h,
> >                                       VMEMMAP_OPTIMIZATION_NR_STRUCT_PA=
GES,
> >                                       pages_per_huge_page(h));
> >               }
> >    ...
> > }
> >
> > Previously, __hugetlb_vmemmap_optimize_folio() derived vmemmap_tail upf=
ront
> > from the initialized head folio, and vmemmap_optimize_pte() checked
> > walk->nr_walked =3D=3D 0 without inspecting tail struct pages.
> >
> > With this change, on the second and subsequent PTEs (where addr >=3D
> > vmemmap_start + VMEMMAP_OPTIMIZATION_SIZE), page->compound_info in the =
tail
> > struct page at addr has not been initialized by prep_compound_tail() ye=
t:
> >
> > 1. If the raw vmemmap backing pages are zeroed, page_folio(page) return=
s page
> > itself rather than the head folio, folio_order(folio) returns 0, and
> > vmemmap_optimizable_pfn() returns false. vmemmap_optimize_pte() then fa=
lls
> > back to vmemmap_dup_page_from_list(src, walk->vmemmap_pages) for every =
tail
> > PTE, rotating the displaced vmemmap pages across the tail PTEs instead =
of
> > mapping the shared tail page, while leaving HPG_vmemmap_optimized set s=
o
> > prep_and_add_bootmem_folios() skips hugetlb_folio_init_tail_vmemmap().
> >
> > 2. If CONFIG_DEBUG_VM is enabled, page_init_poison() fills the uninitia=
lized
> > tail struct pages with 0xff. _compound_head(page) then evaluates to the
> > poisoned tail page itself, and folio_order(folio) reads 0xff, leading t=
o an
> > out-of-bounds shift in vmemmap_optimizable_pfn() and an out-of-bounds
> > node_zones access in folio_zone(folio).
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102032525.=
3597743-1-songmuchun@bytedance.com?part=3D7
>
