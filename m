Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676393;
	b=DcjysBnikEuwU7LYbJDg3G9T1+MWV8Je5FfjFtK1XitwkfmaE1AmJYCr1/a4xv3dtsLL
	 g9FDWj034RbeKlywquMh+hM8B2nQ1XcekLZ8hVIyJTDvoqrr1c6DFG0iqjBJdHzqMW6BV
	 b9h736n/gMcTbEoJWfMVnE9aIit4vX1ObNshpRAK5wNOQCf3RVRyNoita5073o43EejED
	 0Hh47JHD5P5VlLl8ANTDDab0+Dd9nTXE/BBZX9+icB6OFKzycCcPiVP44bmw2CR+q6NsN
	 lvrLBCZ/ZSlZCL++ufjhL8GMxO8bPsrG+KyJR6O/14U+//lqNjTGVId+ox10F5kjeKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676393;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=fn92uon1wobwc2FQPD3Ti8BjAZDqJjzUXbj+kVhG8+s=;
	b=xKSPeFRWZBYIKch0evtZ0wd2p1eqTCBS56PdYfGs+8ZjZ5VBuTfWl5HTtDpFvDlg5iTY
	 68YfTuEuS4I9n5u5GKpiMHQTlwrmPJymTYjWetjX+Yns23ympokva59591c89Ee/m/RvI
	 33DRmnIsY62633mtfr+JrGURTrhrX3HZxj1hAaQ2uSAL5DQZePZnfhWg3vCZ0Gh2mdcls
	 eHdfybmERw3j+iVxNCxq6Lzw7aboi8akQc7SMgfWNXUP4uTgwz8nf/QA0eNkZhydUTWeJ
	 JQ7+PtvBT+fWxZ/KoDTyhSI6nldN4CNPC9D8uBJxj9W0h9ua01I+hhiOUcXuqQvljQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OsvNKyqi;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5546606A32C
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 03:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5546606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OsvNKyqi
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=z59+3CRpmX83n5F86Ytmuyz6cTFL+E3wP4weqszAFo8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793676390; v=1; x=1794281190;
 b=OsvNKyqi8+Vp+kILtBQDqzuC6b1EsOMpuTiamPNBNq3xano7EoQVc+02cWH7umQeVbCElmBC
 /geVl0G0SBwh+wYbcamYtQqUiYSLjSEzpzS6tMwJfEdX+vgIFATyEeFpnjZBhhnr6B7t84Oyyer
 BraNgvTG3UJeBR/5EUF/nhrc=
X-Envelope-To: loongarch@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id a41c32898ac2813d;
	Tue, 03 Nov 2026 03:26:30 +0000
X-Mizu-Trace-ID: a41c32898ac2813d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 07/12] mm: hugetlb_vmemmap: simplify shared tail page
 handling
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CAAhV-H4BPOJJy367p0MZcEWk3WziV3rPiCtoKPSGOqrQt5W1Pw@mail.gmail.com>
Date: Tue, 3 Nov 2026 11:26:11 +0800
Cc: sashiko-reviews@lists.linux.dev,
 Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <06A12352-99CF-4611-96FB-9943A2E6BD50@linux.dev>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-8-songmuchun@bytedance.com>
 <sashiko-outbox-192874@kernel.org>
 <2D6DE4F4-8DB1-45D4-B076-36FE6714C575@linux.dev>
 <CAAhV-H4BPOJJy367p0MZcEWk3WziV3rPiCtoKPSGOqrQt5W1Pw@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 2, 2026, at 21:48, Huacai Chen <chenhuacai@kernel.org> wrote:
>=20
> On Mon, Nov 2, 2026 at 2:12=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Nov 2, 2026, at 11:52, sashiko-bot@kernel.org wrote:
>>>=20
>>> Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
>>> - [High] mm: hugetlb_vmemmap: uninitialized tail page read in =
vmemmap_optimize_pte()
>>> --
>>>=20
>>> commit 32511c4a4d8ec3d45e0f629f89666a78dc9372ee
>>> Author: Muchun Song <muchun.song@linux.dev>
>>>=20
>>> mm: hugetlb_vmemmap: simplify shared tail page handling
>>>=20
>>> This commit removes the vmemmap_tail field from struct =
vmemmap_remap_walk and
>>> updates vmemmap_optimize_pte() and vmemmap_restore_pte() to derive =
the shared
>>> tail page directly from the folio being processed.
>>>=20
>>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>>> index 5e84004db4b87..d0af251aa533c 100644
>>>> --- a/mm/hugetlb_vmemmap.c
>>>> +++ b/mm/hugetlb_vmemmap.c
>>>=20
>>> [ ... ]
>>>=20
>>>> @@ -213,53 +211,53 @@ static struct page =
*vmemmap_dup_page_from_list(const struct page *src,
>>>>     return dst;
>>>> }
>>>>=20
>>>> -static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
>>>> -                             struct vmemmap_remap_walk *walk)
>>>> +static inline struct page *folio_vmemmap_shared_tail_page(const =
struct folio *folio)
>>>> {
>>>> -    struct page *page =3D pte_page(ptep_get(pte));
>>>> -    pte_t entry;
>>>> -
>>>> -    /* Remapping the head page requires r/w */
>>>> -    if (unlikely(walk->nr_walked =3D=3D 0)) {
>>>> -            struct page *head;
>>>> +    return vmemmap_shared_tail_page(folio_order(folio), =
folio_zone(folio));
>>>> +}
>>>>=20
>>>> -            VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
>>>> +static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
>>>> +                            struct vmemmap_remap_walk *walk)
>>>> +{
>>>> +    const struct page *page =3D (const struct page *)addr;
>>>> +    const struct folio *folio =3D page_folio(page);
>>>> +    struct page *src =3D pte_page(ptep_get(pte)), *dst;
>>>>=20
>>>> -            head =3D vmemmap_dup_page_from_list(page, =
walk->vmemmap_pages);
>>>> -            entry =3D mk_pte(head, PAGE_KERNEL);
>>>> +    if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), =
folio_order(folio)))) {
>>>> +            dst =3D folio_vmemmap_shared_tail_page(folio);
>>>> +            if (!dst)
>>>> +                    return -ENOMEM;
>>>>     } else {
>>>> -            VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
>>>> -
>>>> -            /*
>>>> -             * Map the shared tail page writable. A lockless get =
that read
>>>> -             * a non-zero refcount before the remap can still do =
its
>>>> -             * cmpxchg after it. The refcount is zero, so the =
cmpxchg
>>>> -             * fails and leaves the page unchanged.
>>>> -             */
>>>> -            entry =3D mk_pte(walk->vmemmap_tail, PAGE_KERNEL);
>>>> +            dst =3D vmemmap_dup_page_from_list(src, =
walk->vmemmap_pages);
>>>>     }
>>>=20
>>> [Severity: High]
>>> Can calling page_folio(page), folio_order(folio), and
>>> folio_vmemmap_shared_tail_page(folio) on every PTE in =
vmemmap_optimize_pte()
>>> read uninitialized tail struct pages for bootmem gigantic hugepages?
>>>=20
>>> During early boot in alloc_bootmem_huge_page(), gigantic hugepages =
mark all
>>> tail pages [pfn + 1, pfn + nr_pages) with =
memblock_reserved_mark_noinit(), so
>>> memmap_init_reserved_pages() skips initializing their struct pages:
>>>=20
>>> mm/hugetlb.c:alloc_bootmem_huge_page() {
>>>   ...
>>>      if (hugetlb_vmemmap_optimizable(h))
>>>              hugetlb_vmemmap_optimize_bootmem_page(pfn, =
huge_page_order(h));
>>>   ...
>>>      memblock_reserved_mark_noinit(PFN_PHYS(pfn + 1),
>>>                                    (nr_pages - 1) * PAGE_SIZE);
>>> }
>>>=20
>>> When a bootmem gigantic hugepage is not aligned to PAGES_PER_SECTION =
(for
>>> example, when nr_pages < PAGES_PER_SECTION, such as on 64-bit =
LoongArch with
>>> 16KB base pages where SECTION_SIZE_BITS is 29 and PMD_SHIFT is 25 =
with
>>> CONFIG_ARCH_FORCE_MAX_ORDER=3D10), =
section_set_compound_order_range() returns
>>=20
>> This issue does not occur with the default LoongArch configuration. =
For
>> 16KB base pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11, which
>> matches HUGETLB_PAGE_ORDER.
>>=20
>> The reported case requires manually overriding =
CONFIG_ARCH_FORCE_MAX_ORDER
>> to 10 while keeping HugeTLB enabled. This creates an **invalid =
configuration**
>> that Kconfig currently permits:
>>=20
>> HUGETLB_PAGE_ORDER      =3D 11
>> MAX_FOLIO_ORDER         =3D 10
>>=20
>> LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so the generic MM =
code
>> assumes that folios cannot exceed MAX_PAGE_ORDER. The forced =
configuration
>> violates that assumption and is already diagnosed by:
>>=20
>>        WARN_ON(order > MAX_FOLIO_ORDER);
>>=20
>> in hugetlb_add_hstate().
>>=20
>> Therefore, this is not a regression in a supported LoongArch =
configuration,
>> and I don't think this series needs to handle it. The proper fix is a =
separate
>> LoongArch Kconfig change preventing ARCH_FORCE_MAX_ORDER from being =
set below
>> the HugeTLB order when HugeTLB is enabled.
> Yes, this isn't a regression, the problem existed before this series.
>=20
> I suggest change BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER >
> MAX_FOLIO_ORDER) to MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER >
> MAX_FOLIO_ORDER) in mm/hugetlb.c, which cause a build error
> immediately for invalid ARCH_FORCE_MAX_ORDER configurations.

Thanks for your suggestion. I've sent a fix here [1].

[1] =
https://lore.kernel.org/all/20261103023831.1805473-1-songmuchun@bytedance.=
com/

>=20
> Huacai
>=20
>>=20
>> Cc LoongArch maintainers.
>>=20
>> Thanks,
>> Muchun
>>=20
>>> early without setting section->compound_page_order:
>>>=20
>>> =
include/linux/vmemmap-optimization.h:section_set_compound_order_range() =
{
>>>      unsigned long section_nr =3D pfn_to_section_nr(pfn);
>>>=20
>>>      if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
>>>              return;
>>>   ...
>>> }
>>>=20
>>> In that case, sparse_init() allocates regular vmemmap pages via
>>> memmap_alloc(), leaving them uninitialized (or filled with 0xff =
under
>>> CONFIG_DEBUG_VM).
>>>=20
>>> Later, gather_bootmem_prealloc_node() initializes only the first
>>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES struct pages (covering only the =
first
>>> vmemmap PTE), and prep_and_add_bootmem_folios() defers initializing =
the
>>> remaining tail struct pages until after =
hugetlb_vmemmap_optimize_folios()
>>> runs and fails:
>>>=20
>>> mm/hugetlb.c:gather_bootmem_prealloc_node() {
>>>   ...
>>>              hugetlb_folio_init_vmemmap(folio, h,
>>>                                         =
VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES);
>>>              init_new_hugetlb_folio(folio);
>>>=20
>>>              if =
(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
>>>                      folio_set_hugetlb_vmemmap_optimized(folio);
>>>   ...
>>> }
>>>=20
>>> mm/hugetlb.c:prep_and_add_bootmem_folios() {
>>>      /* Send list for bulk vmemmap optimization processing */
>>>      hugetlb_vmemmap_optimize_folios(h, folio_list);
>>>=20
>>>      list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
>>>              if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
>>>                      hugetlb_folio_init_tail_vmemmap(folio, h,
>>>                                      =
VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES,
>>>                                      pages_per_huge_page(h));
>>>              }
>>>   ...
>>> }
>>>=20
>>> Previously, __hugetlb_vmemmap_optimize_folio() derived vmemmap_tail =
upfront
>>> from the initialized head folio, and vmemmap_optimize_pte() checked
>>> walk->nr_walked =3D=3D 0 without inspecting tail struct pages.
>>>=20
>>> With this change, on the second and subsequent PTEs (where addr >=3D
>>> vmemmap_start + VMEMMAP_OPTIMIZATION_SIZE), page->compound_info in =
the tail
>>> struct page at addr has not been initialized by prep_compound_tail() =
yet:
>>>=20
>>> 1. If the raw vmemmap backing pages are zeroed, page_folio(page) =
returns page
>>> itself rather than the head folio, folio_order(folio) returns 0, and
>>> vmemmap_optimizable_pfn() returns false. vmemmap_optimize_pte() then =
falls
>>> back to vmemmap_dup_page_from_list(src, walk->vmemmap_pages) for =
every tail
>>> PTE, rotating the displaced vmemmap pages across the tail PTEs =
instead of
>>> mapping the shared tail page, while leaving HPG_vmemmap_optimized =
set so
>>> prep_and_add_bootmem_folios() skips =
hugetlb_folio_init_tail_vmemmap().
>>>=20
>>> 2. If CONFIG_DEBUG_VM is enabled, page_init_poison() fills the =
uninitialized
>>> tail struct pages with 0xff. _compound_head(page) then evaluates to =
the
>>> poisoned tail page itself, and folio_order(folio) reads 0xff, =
leading to an
>>> out-of-bounds shift in vmemmap_optimizable_pfn() and an =
out-of-bounds
>>> node_zones access in folio_zone(folio).
>>>=20
>>> --
>>> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261102032525.3597743-1-songmuchun@bytedan=
ce.com?part=3D7


