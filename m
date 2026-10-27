Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123509;
	b=hVOm8OaVFTXl02TkTF+zWwgcSjhktnkPja8tTC4SmLdtKhfVL5SZOXvQGSzbH1e5p6Zd
	 Iz2XK12x3leFy6v5xh7ZnxtVy/spK+lOko2Fgr/xhqYjNWWVJOZbdjvZqQ2SlkdUofZ+F
	 +35eRZqey4opU/dRl8a2XxJJwZVxDZFWAgn+GM7bsIPv45LhVPNZsQsBvEAx1/rlXuwmo
	 NMSEQBXLnl8jKTPvSzxnrPd9ZVDC4Vy57owxXMdAOCcQShfwT9r3jo9D+8+2CraY0p+13
	 j405s1LBlDvXS2TfBV+H7XFnhq/ZlZcJyGnjqMSVuMCJtm2gM1t9aM86xD1TNBtoOFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123509;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7cvs2Xtx0PtgOTTn5QWjiXGseQMOAfWpyXw4zUPemHU=;
	b=LrBIlFwLVppmJ0K2P4qMq6I2JL9yaQ9Y48yMD7jaH6z4bXbbOrr/bMtixOV41rqg/7EC
	 dJno5dll5ztCpG6Jfuxhs1uTQUjrKCx7PlYUHiVA5MMd9vksVZYm5Q49IqR2WcnIoT29r
	 WvZ44V2h9YP11e732GB5dz4kyobKVPaWnsoYWPO9VWa8XoB7wwocoNIyQGBPw61YWLStl
	 ls8tlGF+y+f0SUHVyR1HA7187PqS5wsZ9btVzZaqqUP9MZukh4myOIdvGOZUGV58IXqPw
	 uETIu24Q0SuhdcTjF81Ku5U403E73fDKEnjdqdW+17dG5IbngET8K1S9vuC7IrWaxoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i2mAkLNk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F162606A327;
	Tue, 27 Oct 2026 17:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i2mAkLNk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87591F031E4;
	Tue, 27 Oct 2026 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793123509;
	bh=7cvs2Xtx0PtgOTTn5QWjiXGseQMOAfWpyXw4zUPemHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i2mAkLNkAOGcVlO+4ptBnFYcSi4dqZ1TSD2xVn8AcP7rKLCwmC3J2sSSuDuBSvgBH
	 D/g7md7W5GzJSCvCeWzcBwZK3anh6pj6KH0iFIeLtOwMsSbiPPBngOtyFBOR+C3BBb
	 a+5cqqJtZu6nTLIj7CDBmInXhexR5Os+z6rZk/ACiQXplM/+oE4MFU4ojxZGQnuNgH
	 ig/RPJ9XrTZya4f04qBIKx/9oZNy/gjsTjOvurUGedCYUbh/eSjH9uup00p2VY0aEQ
	 Jc1+g18wCJglWsgZ3vcN1b28ecpIC5IOF/yGgzdY8QoKAHcHtAEO4IJs6pzSmJI4yV
	 9QsSnwqZb9/GQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 878B8198003A;
	Tue, 27 Oct 2026 13:51:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 27 Oct 2026 13:51:45 -0400
X-ME-Sender: <xms:q-Tgane4160Z5m_5kx5S5y1a0nB1H4Bt5lyUT50c_Ely-yKhaBX4Vg>
    <xme:rOTgatrsWjP1MraltGmFvrCJY6l3q8z-EwL-BVHTlDqGo9wDvrNinM8KXaYtmnGS1
    qbmCeZ4hSE5SR4sPpcUFD-kwBcngjEDeAoa0zVCu18Ak1XjxFp3IMfO>
X-ME-Received: <xmr:rOTgah9L3Z_ubKwVisuiLOTIG3BZ5759QE61hHBza21JfPgHX5Q0e7iEDb4>
X-ME-Proxy-Cause: dmFkZTEJ54V2o5886gXoRzsAs4tIMx+vUoNXgQPnAayI3VlBJBmvGOiJUBSG0i7ubLHch7
    0JSiGiwy5lgoftBWGJG0zy4C9NkZdA2vOF9mUL3B7EeOORJ4ronuYngSgrFlXXDC06cx92
    eyEuj6JdAFG/fpBg7FnzXxtPnTMwsB81ldWm5qd5aOYSuDIxHWT2yQ27eM3IYLGVXRK66/
    KCn01kjg9WmPw2c6ZxaF6Hw0yqQDSf3HmXpVZIX2yK/z7Z9NchnGg4ACPo3bhA9cQvFPi6
    JUtXh/FKR5/BoV7TysiI9pnpYh2ldG7/qRJuLit9m1Vao2ILByUDezNgEXKBj6oOQucyr4
    7shXctyr5vOxZrHGDfPPI5M7l1CmLcdabzUyw/CnzHo3ezuHnUxHwIjm1UA1oJostydYVM
    soSXIKaOrdP0FiPJ/nZBWnwFHv5LsLRNN8YhJswcQFses4jUpndRZKSh+HWHVpD6HiX9/j
    uPrwMmrjwbkiPrnFNhT3J7QTVtkJQQckkB07ncoHO1iJSXfx+Snc9CHXv0YBCxpDD518SG
    B03H37qKJmQs0Q7s62Sf0cLjXPa281Zzcto2Be3eHBxkwKBNVfFEqI6PVpKWN3/vwYpbWQ
    R+0GOwGehvrhAkzvFwzCDWQO0UVuE9jBr/CC+ySqi5Zuy8vF3QPkfG20LqLg
X-ME-Proxy: <xmx:rOTgao_99TFsm6eS16DH9tGIA2l2C7k1tF5bQbF5ZA2jXRJMVO9VbQ>
    <xmx:rOTgajHc7hLeYG3BK_3zSCISklNqVcfZFYSN9J7F2UDcGP48n1c6dQ>
    <xmx:rOTgavcBP-3mKNLSEP2QkYZeDmlDHuLcSJeskXJJfDGLNbFWARp1JA>
    <xmx:rOTgaqLSyZso6BWVd8VhtJ2KcCxvjdN4Bie9tPyNzE3PYswIqlYObQ>
    <xmx:rOTgagpOiOtRZAL6-_IvuamoMD6Ob_TDxRTbBGoWRq7CQb0RN3BVeqxk>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 13:51:39 -0400 (EDT)
Date: Tue, 27 Oct 2026 17:51:38 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <auDkbDlgSZxqlk2G@thinkstation>
References: <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
 <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>

On Tue, Oct 27, 2026 at 10:03:54PM +0800, Muchun Song wrote:
> Therefore, I am kind of leaning towards removing the RO protection
> and restoring RW permissions to solve the race.

Okay, what about this:

From e23ab850837b53cc79d57d58f1cfb4266e745c3d Mon Sep 17 00:00:00 2001
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Date: Tue, 27 Oct 2026 17:23:47 +0000
Subject: [PATCH] mm/hugetlb_vmemmap: map the shared tail page writable

page_ref_add_unless_zero() reads the refcount and then updates it with
a cmpxchg.  A lockless get, such as a page cache lookup or a PFN
scanner, can read a non-zero refcount from a page that is then freed
and reused as a hugetlb tail page.  If HVO remaps its struct page to
the shared tail page in between, the cmpxchg writes to read-only
vmemmap:

    CPU0 (lockless get)               CPU1
    c = atomic_read(&page->_refcount)
                                      page freed
                                      page allocated as a hugetlb tail
                                      HVO remaps the struct page RO
    try_cmpxchg(&page->_refcount, &c, c + 1)
      -> write fault on read-only vmemmap

The refcount is zero by then and the compare fails, but LOCK CMPXCHG on
x86 writes anyway.  The kernel oopses when hugetlb pages are allocated
at runtime with HVO enabled while a lockless get races with it.

Commit bd225530a4c7 ("mm/hugetlb_vmemmap: fix race with speculative PFN
walkers") closed the window with RCU on both sides.  The RCU was removed
together with fake heads, on the wrong belief that it was only needed
for them.

Map the shared tail page writable instead of restoring the RCU.  Every
struct page on it is a tail with a zero refcount, so a late cmpxchg
fails and leaves the page unchanged.  RCU would put rcu_read_lock()
back around every get and synchronize_rcu() back into hugetlb
allocation and freeing.

The cost is the protection against stray writes to tail struct pages.
The shared page is shared by all hugetlb folios of the same order in
the zone, so such a write now corrupts all of them instead of oopsing.

Bootmem folios optimized in early boot get their tails mapped writable
and write protected later.  Drop the write protect step.

Fixes: 32c440d67e6c ("mm: drop fake head checks")
Fixes: 01b1d0ffb6f7 ("hugetlb: remove VMEMMAP_SYNCHRONIZE_RCU")
Reported-by: David Hildenbrand (Arm) <david@kernel.org>
Closes: https://lore.kernel.org/r/ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 Documentation/mm/vmemmap_dedup.rst | 13 +++++++++----
 include/linux/mm.h                 |  2 --
 mm/hugetlb.c                       |  4 ----
 mm/hugetlb_vmemmap.c               | 21 +++++++--------------
 mm/sparse-vmemmap.c                | 23 -----------------------
 5 files changed, 16 insertions(+), 47 deletions(-)

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 9fa8642ded48..6cd85aca4b96 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -131,8 +131,15 @@ pages of ``struct page`` (page 1 to page 7) are tail pages.
 The optimization is only applied when the size of the struct page is a power
 of 2. In this case, all tail pages of the same order are identical. See
 compound_head(). This allows us to remap the tail pages of the vmemmap to a
-shared, read-only page. The head page is also remapped to a new page. This
-allows the original vmemmap pages to be freed.
+shared page. The head page is also remapped to a new page. This allows the
+original vmemmap pages to be freed.
+
+The shared page is mapped writable. A lockless get of a page reference can
+read a non-zero refcount before the remap and attempt its atomic update
+after it. The refcount of a tail page is zero, so the update fails without
+changing the page. Nothing else may write to the shared page: it is shared
+by all HugeTLB pages of the same size in the zone, and a stray write would
+corrupt all of them.
 
 Here is how things look after remapping::
 
@@ -196,8 +203,6 @@ happens at a later stage when we populate the sections. HugeTLB reuses the
 the head vmemmap page representing, whereas device-dax reuses the tail
 vmemmap page. This results in only half of the savings compared to HugeTLB.
 
-Deduplicated tail pages are not mapped read-only.
-
 Here's how things look like on device-dax after the sections are populated::
 
  +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..bfaf4ce6d831 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5162,8 +5162,6 @@ int vmemmap_populate(unsigned long start, unsigned long end, int node,
 int vmemmap_populate_hvo(unsigned long start, unsigned long end,
 			 unsigned int order, struct zone *zone,
 			 unsigned long headsize);
-void vmemmap_wrprotect_hvo(unsigned long start, unsigned long end, int node,
-			  unsigned long headsize);
 void vmemmap_populate_print_last(void);
 #ifdef CONFIG_MEMORY_HOTPLUG
 void vmemmap_free(unsigned long start, unsigned long end,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cea25773a6c9..7596704d94b5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3220,10 +3220,6 @@ static bool __init hugetlb_bootmem_page_earlycma(struct huge_bootmem_page *m)
  * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
  * here, or MIGRATE_CMA if this was a page allocated through an early CMA
  * reservation.
- *
- * In case of vmemmap optimized folios, the tail vmemmap pages are mapped
- * read-only, but that's ok - for sparse vmemmap this does not write to
- * the page structure.
  */
 static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 							  struct hstate *h)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 917db0984143..77f9d035d04c 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -222,10 +222,12 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
 
 		/*
-		 * Remap the tail pages as read-only to catch illegal write
-		 * operation to the tail pages.
+		 * Map the shared tail page writable. A lockless get that read
+		 * a non-zero refcount before the remap can still do its
+		 * cmpxchg after it. The refcount is zero, so the cmpxchg
+		 * fails and leaves the page unchanged.
 		 */
-		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
+		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL);
 	}
 
 	list_add(&page->lru, walk->vmemmap_pages);
@@ -629,19 +631,10 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 	nr_to_optimize = 0;
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
-		unsigned long spfn, epfn;
 
-		if (boot && folio_test_hugetlb_vmemmap_optimized(folio)) {
-			/*
-			 * Already optimized by pre-HVO, just map the
-			 * mirrored tail page structs RO.
-			 */
-			spfn = (unsigned long)&folio->page;
-			epfn = spfn + hugetlb_vmemmap_size(h);
-			vmemmap_wrprotect_hvo(spfn, epfn, folio_nid(folio),
-					HUGETLB_VMEMMAP_RESERVE_SIZE);
+		/* Already optimized by pre-HVO */
+		if (boot && folio_test_hugetlb_vmemmap_optimized(folio))
 			continue;
-		}
 
 		nr_to_optimize++;
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 5a2469fb1838..3f25d4a0bf47 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -299,29 +299,6 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 	return vmemmap_populate_range(start, end, node, altmap, -1, 0);
 }
 
-/*
- * Write protect the mirrored tail page structs for HVO. This will be
- * called from the hugetlb code when gathering and initializing the
- * memblock allocated gigantic pages. The write protect can't be
- * done earlier, since it can't be guaranteed that the reserved
- * page structures will not be written to during initialization,
- * even if CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled.
- *
- * The PTEs are known to exist, and nothing else should be touching
- * these pages. The caller is responsible for any TLB flushing.
- */
-void vmemmap_wrprotect_hvo(unsigned long addr, unsigned long end,
-				    int node, unsigned long headsize)
-{
-	unsigned long maddr;
-	pte_t *pte;
-
-	for (maddr = addr + headsize; maddr < end; maddr += PAGE_SIZE) {
-		pte = virt_to_kpte(maddr);
-		ptep_set_wrprotect(&init_mm, maddr, pte);
-	}
-}
-
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
 {
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
