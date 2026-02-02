Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748A261393
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 15:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047806; cv=none; b=E222CUYI0U6IsvpjfjCd+2hKwzsgWCxnDkE7Skgyr6y0kxRDpoDczEtuve03nbu2CnMUpVki2goiJ2a5WjnCLpEKS55+V2OKGf04p+yrWcMq3N8Ubu8kS6EDxIY9ymFm+032vK5I3VXhRKQgW7yv+Bm4stE63JQsI+gfnsH+vWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047806; c=relaxed/simple;
	bh=hxWsl4+3mMC4/tIWxX8dWfX3hknzw7d0BOqMFNwQDuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqu04u5lVwdWNJ+TtGo7HRrObEeD2gDnbsFA6+aA5NSnA/WTfWWRkRI6qQ4dLJEcfc/Cmz5tcqPBgchl5mxRsHFMQGL8BA+i/yyeaUssIMkguLmN87++PYrKrq80bmfspCv73WFfu0JcI1SxvsgUeEzIb43XODtiAvNBBrSG51E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dde1yblt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dde1yblt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3155C19425;
	Mon,  2 Feb 2026 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047806;
	bh=hxWsl4+3mMC4/tIWxX8dWfX3hknzw7d0BOqMFNwQDuc=;
	h=From:To:Cc:Subject:Date:From;
	b=dde1ybltuZtGeOWfKOTOpwUbBHPbB/NJisTmhpZ3tbR7Ego/JWRniq0XHZSh0YA1I
	 hoSbL3B12PuvboFiYpJ2wUw0IRXfU1eg71qQ69P8PacCeX0LhcRK1idz0MAUJHcMte
	 P0KkUZHzCmUcKthjpZ9G0Q/CPnDFjeG1FXqL/rH2cj2Xam7E6NSBOT1bg2o9/rhFR7
	 BwN21o/fseLvwmpd/7qqSAvZHLx/oUJqPstFiSZzlovH9EQZgJFaK+LIrnWHiYt+G9
	 BYi9Re3HDEkfkdcjQ4WednaAojV02ssEoOxZeLxgeXoCsbxAj/CbXAKus2vxhnp8mI
	 vszG0gR419EVQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id EF760F40069;
	Mon,  2 Feb 2026 10:56:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 10:56:44 -0500
X-ME-Sender: <xms:PMmAafQ8JrbBEO7Cc0H_aeo_fOsgud_Umz0OKWIgt3X1DL6xhsEDsg>
    <xme:PMmAaZ81rAHmv5KElVlth5uG-5L5UIaV-J5U2iO-yTnSxqcc2oCuxiJ1oQseZh6oJ
    -YJan9VTAEt3DueXfgQgRSD_VaPyh-Dm-hMsUfRSexbuukWyMs5F8XX>
X-ME-Received: <xmr:PMmAae-PwbyzuSt_psW7isFQZ-Bog9NPxQVAwKJ5UEDlgyO7Xuyrm7bvSDYKtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcuufhh
    uhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epffdvhfdtgfekuddttdffgeeljeehueffvdfgjeejvdetiedtfeefgfetgfffhfffnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilh
    hlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheehqddv
    keeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrg
    hmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmh
    hutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgusehr
    vgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrgguoh
    hrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:PMmAaf5VMnXFPjQyeRWcpETXXzEWQbdWO-7I00RVrC6_5liJ7ZaTqQ>
    <xmx:PMmAaUe7k45ykoZ5xjoAwyJlB0rOP0ySa_2fzHUb2hXLjl9V-08Wog>
    <xmx:PMmAaf0K6CKli1crSpcEKlyNUZDLIZi-7m7TzHSlRrhBcu4EKaZtbg>
    <xmx:PMmAaY9jTQqTc_ikiwqr2yRrwC2QBJbWbWqnA_aKXFP2-VLnfE5DXw>
    <xmx:PMmAaQ2-QSIWheSnVpEE_Btbqo0VVn2EnJboa2FMYNWimv8vBL0NIUQ8>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:56:43 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv6 00/17] mm: Eliminate fake head pages from vmemmap optimization
Date: Mon,  2 Feb 2026 15:56:16 +0000
Message-ID: <20260202155634.650837-1-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes "fake head pages" from the HugeTLB vmemmap
optimization (HVO) by changing how tail pages encode their relationship
to the head page.

It simplifies compound_head() and page_ref_add_unless(). Both are in the
hot path.

Background
==========

HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
and remapping the freed virtual addresses to a single physical page.
Previously, all tail page vmemmap entries were remapped to the first
vmemmap page (containing the head struct page), creating "fake heads" -
tail pages that appear to have PG_head set when accessed through the
deduplicated vmemmap.

This required special handling in compound_head() to detect and work
around fake heads, adding complexity and overhead to a very hot path.

New Approach
============

For architectures/configs where sizeof(struct page) is a power of 2 (the
common case), this series changes how position of the head page is encoded
in the tail pages.

Instead of storing a pointer to the head page, the ->compound_info
(renamed from ->compound_head) now stores a mask.

The mask can be applied to any tail page's virtual address to compute
the head page address. Critically, all tail pages of the same order now
have identical compound_info values, regardless of which compound page
they belong to.

The key insight is that all tail pages of the same order now have
identical compound_info values, regardless of which compound page they
belong to. This allows a single page of tail struct pages to be shared
across all huge pages of the same order on a NUMA node.

Benefits
========

1. Simplified compound_head(): No fake head detection needed, can be
   implemented in a branchless manner.

2. Simplified page_ref_add_unless(): RCU protection removed since there's
   no race with fake head remapping.

3. Cleaner architecture: The shared tail pages are truly read-only and
   contain valid tail page metadata.

If sizeof(struct page) is not power-of-2, there are no functional changes.
HVO is not supported in this configuration.

I had hoped to see performance improvement, but my testing thus far has
shown either no change or only a slight improvement within the noise.

Series Organization
===================

Patch 1: Preparation - move MAX_FOLIO_ORDER to mmzone.h
Patches 2-4: Refactoring - interface changes, field rename, code movement
Patches 5-6: Arch fixes - align vmemmap for riscv and LoongArch
Patch 7: Core change - new mask-based compound_head() encoding
Patch 8: Correctness fix - page_zonenum() must use head page
Patch 9: Add memmap alignment check for compound_info_has_mask()
Patch 10: Refactor vmemmap_walk for new design
Patch 11: Eliminate fake heads with shared tail pages
Patches 12-15: Cleanup - remove fake head infrastructure
Patch 16: Documentation update
Patch 17: Get rid of opencoded compound_head() in page_slab()

Changes in v6:
==============
  - Simplify memmap alignment check in mm/sparse.c: use VM_BUG_ON()
    (Muchun)

  - Store struct page pointers in vmemmap_tails[] instead of PFNs.
    (Muchun)

  - Fix build error on powerpc due to negative NR_VMEMMAP_TAILS.

Changes in v5:
==============
  - Rebased to mm-everything-2026-01-27-04-35

  - Add arch-specific patches to align vmemmap to maximal folio size
    for riscv and LoongArch architectures.

  - Strengthen the memmap alignment check in mm/sparse.c: use BUG()
    for CONFIG_DEBUG_VM, WARN() otherwise. (Muchun)

  - Use cmpxchg() instead of hugetlb_lock to update vmemmap_tails
    array. (Muchun)

  - Update page_slab().

Changes in v4:
==============
  - Fix build issues due to linux/mmzone.h <-> linux/pgtable.h
    dependency loop by avoiding including linux/pgtable.h into
    linux/mmzone.h

  - Rework vmemmap_remap_alloc() interface. (Muchun)

  - Use &folio->page instead of folio address for optimization
    target. (Muchun)

Changes in v3:
==============
  - Fixed error recovery path in vmemmap_remap_free() to pass correct start
    address for TLB flush. (Muchun)

  - Wrapped the mask-based compound_info encoding within CONFIG_SPARSEMEM_VMEMMAP
    check via compound_info_has_mask(). For other memory models, alignment
    guarantees are harder to verify. (Muchun)

  - Updated vmemmap_dedup.rst documentation wording: changed "vmemmap_tail
    shared for the struct hstate" to "A single, per-node page frame shared
    among all hugepages of the same size". (Muchun)

  - Fixed build error with MAX_FOLIO_ORDER expanding to undefined PUD_ORDER
    in certain configurations. (kernel test robot)

Changes in v2:
==============

- Handle boot-allocated huge pages correctly. (Frank)

- Changed from per-hstate vmemmap_tail to per-node vmemmap_tails[] array
  in pglist_data. (Muchun)

- Added spin_lock(&hugetlb_lock) protection in vmemmap_get_tail() to fix
  a race condition where two threads could both allocate tail pages.
  The losing thread now properly frees its allocated page. (Usama)

- Add warning if memmap is not aligned to MAX_FOLIO_SIZE, which is
  required for the mask approach. (Muchun)

- Make page_zonenum() use head page - correctness fix since shared
  tail pages cannot have valid zone information. (Muchun)

- Added 'const' qualifier to head parameter in set_compound_head() and
  prep_compound_tail(). (Usama)

- Updated commit messages.

Kiryl Shutsemau (17):
  mm: Move MAX_FOLIO_ORDER definition to mmzone.h
  mm: Change the interface of prep_compound_tail()
  mm: Rename the 'compound_head' field in the 'struct page' to
    'compound_info'
  mm: Move set/clear_compound_head() next to compound_head()
  riscv/mm: Align vmemmap to maximal folio size
  LoongArch/mm: Align vmemmap to maximal folio size
  mm: Rework compound_head() for power-of-2 sizeof(struct page)
  mm: Make page_zonenum() use head page
  mm/sparse: Check memmap alignment for compound_info_has_mask()
  mm/hugetlb: Refactor code around vmemmap_walk
  mm/hugetlb: Remove fake head pages
  mm: Drop fake head checks
  hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
  mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
  mm: Remove the branch from compound_head()
  hugetlb: Update vmemmap_dedup.rst
  mm/slab: Use compound_head() in page_slab()

 .../admin-guide/kdump/vmcoreinfo.rst          |   2 +-
 Documentation/mm/vmemmap_dedup.rst            |  62 ++--
 arch/loongarch/include/asm/pgtable.h          |   3 +-
 arch/riscv/mm/init.c                          |   3 +-
 include/linux/mm.h                            |  31 --
 include/linux/mm_types.h                      |  20 +-
 include/linux/mmzone.h                        |  47 +++
 include/linux/page-flags.h                    | 167 +++++-----
 include/linux/page_ref.h                      |   8 +-
 include/linux/types.h                         |   2 +-
 kernel/vmcore_info.c                          |   2 +-
 mm/hugetlb.c                                  |   8 +-
 mm/hugetlb_vmemmap.c                          | 288 ++++++++----------
 mm/internal.h                                 |  12 +-
 mm/mm_init.c                                  |   2 +-
 mm/page_alloc.c                               |   4 +-
 mm/slab.h                                     |   8 +-
 mm/sparse-vmemmap.c                           |  43 ++-
 mm/sparse.c                                   |   7 +
 mm/util.c                                     |  16 +-
 20 files changed, 363 insertions(+), 372 deletions(-)

-- 
2.51.2

