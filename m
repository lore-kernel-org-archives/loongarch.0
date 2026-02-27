Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4F04657C7;
	Fri, 27 Feb 2026 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221395; cv=none; b=aZKnXcSJ9qN2W4QgXl5YY3eRT43k/LS7BWOEs2a0xUexRpHsec2C4RERJ78egTPDFpZ2Dg7dsg6uoRnoyGqmerq87XpCLFqAQbruny/01icPx2PiNkf+a+nylsOEky3iFPYT5j/+vym97QJ94+48sJeU8OPWE5mR+v9v/ikbe48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221395; c=relaxed/simple;
	bh=Xoy0vcEmhS4Ump5td/QMKdt1xxA3nwm83XumwZ2X0uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRfqvNQgKCENWPYr7wrFzyxdMLV+J8rk33NzVbHfURTqVrbX/lYCU8LCEz8nDAtRK1iNzM6pAiuSAJA4HLxMh6bAnJ8n11RukML72LbbRmxtddpHOYA2adTJ4ktZiqwy1NBNkWOpj6BuGkCFttp1ZzX0ahKrRHDtyBiESAIeed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTsD8nv9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTsD8nv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D023FC4AF09;
	Fri, 27 Feb 2026 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221394;
	bh=Xoy0vcEmhS4Ump5td/QMKdt1xxA3nwm83XumwZ2X0uY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZTsD8nv9e7Kt8UrhBPCzB17QBeTMnPBvrz9MUiUetJ2WcyLIV05G8wkc+avr04MbW
	 yTVHMUBVDhBAYrxmRNWjAsIm1rsEqwwBmEVrhCmaPKcfNStj5mOn4p8/3vCU7kC1H5
	 B8I3TuEpmOJsMUh6FLFJIjEyJd5JuFNvRcyytnu86q+YzK3oZrfqtbfYMpKCf9oy1/
	 6SRi2UtNaKnCgZtcblcHnMgm003bduLe1rr1WdBzgbBHV1yJpTKUXAAR3JKnxcPhIz
	 +nWujUS75hMG1xu6NKy5qPtHMvKRdqxZRmZ8Ebfd/2Isk5rtJG7jFuGaao02sDywbg
	 Lc4Z1+t/ar2xA==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 06B99F40068;
	Fri, 27 Feb 2026 14:43:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 27 Feb 2026 14:43:13 -0500
X-ME-Sender: <xms:0POhaYqF889zif5CE4hxOIdTK8Ql5-N8GkkSJQxQJEbjFthzKWjs3g>
    <xme:0POhaX3hkmsMnvEgjGMAKksg-mJOEhvanU79k4Zd2422RnWR3mrlhwYwfF6DjyYHQ
    PsuSjmlrnQLHiXEK9-Qy1fUBB9UWzLI7uilH5V8UTAPWdrvqZ2QCoU>
X-ME-Received: <xmr:0POhaXUxCgf3jL03NSOh6-rHjSENhpsRPXqUnE9VOMQtNiLgiP0VFLKO_98ikQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgse
    hshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghp
    thhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:0POhaQyAxXKFOpjLRWxvBuYK6xzEVs5A6S-TpBcLmLZlbJ0bOTkNIQ>
    <xmx:0POhaT037aYaeNW8j3RUtbdYCnqeq7-9qycjy5nrL5wnF_vRtWVjww>
    <xmx:0POhabvWKIFeC-aSkMZhTolcZokbzvHroDqK7I51ECamtt-onMH3fA>
    <xmx:0POhaXXXGPrPvmmNTEakX0bj_m4t0wAmCRs0ZwyV1RnDLo6S6DJsbA>
    <xmx:0fOhafu6ClIdpDgZrssoBF0OxWWBPPhTMQuiQPV3D8gQ7Ob9JuUezyn3>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:12 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
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
Subject: [PATCHv7 02/18] mm: Change the interface of prep_compound_tail()
Date: Fri, 27 Feb 2026 19:42:40 +0000
Message-ID: <20260227194302.274384-3-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kiryl Shutsemau <kas@kernel.org>

Instead of passing down the head page and tail page index, pass the tail
and head pages directly, as well as the order of the compound page.

This is a preparation for changing how the head position is encoded in
the tail page.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (arm) <david@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/page-flags.h |  5 +++--
 mm/hugetlb.c               |  8 +++++---
 mm/internal.h              | 11 +++++------
 mm/mm_init.c               |  2 +-
 mm/page_alloc.c            |  2 +-
 5 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f7a0e4af0c73..5e7687ccccf8 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -865,9 +865,10 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *page, struct page *head)
+static __always_inline void set_compound_head(struct page *tail,
+		const struct page *head, unsigned int order)
 {
-	WRITE_ONCE(page->compound_head, (unsigned long)head + 1);
+	WRITE_ONCE(tail->compound_head, (unsigned long)head + 1);
 }
 
 static __always_inline void clear_compound_head(struct page *page)
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0beb6e22bc26..fc55f22c9e41 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3168,6 +3168,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 
 /* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
 static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
+					struct hstate *h,
 					unsigned long start_page_number,
 					unsigned long end_page_number)
 {
@@ -3176,6 +3177,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	struct page *page = folio_page(folio, start_page_number);
 	unsigned long head_pfn = folio_pfn(folio);
 	unsigned long pfn, end_pfn = head_pfn + end_page_number;
+	unsigned int order = huge_page_order(h);
 
 	/*
 	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
@@ -3183,7 +3185,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	 */
 	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
 		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail((struct page *)folio, pfn - head_pfn);
+		prep_compound_tail(page, &folio->page, order);
 		set_page_count(page, 0);
 	}
 }
@@ -3203,7 +3205,7 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 	__folio_set_head(folio);
 	ret = folio_ref_freeze(folio, 1);
 	VM_BUG_ON(!ret);
-	hugetlb_folio_init_tail_vmemmap(folio, 1, nr_pages);
+	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
 	prep_compound_head(&folio->page, huge_page_order(h));
 }
 
@@ -3260,7 +3262,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 			 * time as this is early in boot and there should
 			 * be no contention.
 			 */
-			hugetlb_folio_init_tail_vmemmap(folio,
+			hugetlb_folio_init_tail_vmemmap(folio, h,
 					HUGETLB_VMEMMAP_RESERVE_PAGES,
 					pages_per_huge_page(h));
 		}
diff --git a/mm/internal.h b/mm/internal.h
index cb0af847d7d9..c76122f22294 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -878,13 +878,12 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
 		INIT_LIST_HEAD(&folio->_deferred_list);
 }
 
-static inline void prep_compound_tail(struct page *head, int tail_idx)
+static inline void prep_compound_tail(struct page *tail,
+		const struct page *head, unsigned int order)
 {
-	struct page *p = head + tail_idx;
-
-	p->mapping = TAIL_MAPPING;
-	set_compound_head(p, head);
-	set_page_private(p, 0);
+	tail->mapping = TAIL_MAPPING;
+	set_compound_head(tail, head, order);
+	set_page_private(tail, 0);
 }
 
 void post_alloc_hook(struct page *page, unsigned int order, gfp_t gfp_flags);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 61d983d23f55..0a12a9be0bcc 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1099,7 +1099,7 @@ static void __ref memmap_init_compound(struct page *head,
 		struct page *page = pfn_to_page(pfn);
 
 		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
-		prep_compound_tail(head, pfn - head_pfn);
+		prep_compound_tail(page, head, order);
 		set_page_count(page, 0);
 	}
 	prep_compound_head(head, order);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index fcc32737f451..aa657e4a99e8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -744,7 +744,7 @@ void prep_compound_page(struct page *page, unsigned int order)
 
 	__SetPageHead(page);
 	for (i = 1; i < nr_pages; i++)
-		prep_compound_tail(page, i);
+		prep_compound_tail(page + i, page, order);
 
 	prep_compound_head(page, order);
 }
-- 
2.51.2

