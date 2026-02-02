Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FD4239086;
	Mon,  2 Feb 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047823; cv=none; b=NZ2AH4VXfZP5zMaWXKM1xqZsLv7XAtyJiIyfLUnXMNEIMh4GZSzDvm/JE+0JBsLsRKy25gbkDG0DEeZtb92O2yc5MaNR2tcryQ/KWqIpFHqirbLQmEUmpgHaSpJicfY8/wn9iejIdwpC3xa6hVMckWJKNgLaqNvJ7zPO+7E5AD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047823; c=relaxed/simple;
	bh=6ogOaGvnMTPbWSZ/3tAo/tMV4QN8NO6XYhjt/aFJtlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q197IMtx5q65ppMRxUyhM+lbIQKU8aISVgzC+DYc83ozoHRFcyWuS7kTFO08lY4qw769Vkt0nmbpguEO9DoB2CNlbAls6RPxc8m5i2Rk03JNfyTi0vi3be4upyZE2FsfOps7Xh1/K2scsc0O3ZXHU2SDPcwt/dT497Pv6U1qIgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF69RSX9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF69RSX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91720C19425;
	Mon,  2 Feb 2026 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047823;
	bh=6ogOaGvnMTPbWSZ/3tAo/tMV4QN8NO6XYhjt/aFJtlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WF69RSX9f+mKWCabnqaYZF5sNHFC3uvixKlWuQFydyTQfTYpnLJRGuLALJe4g6SCy
	 Z7Bev3jJyKP5dkM3ePpm1j+cWEcQBQk7XNrosYUsOdBUZFMGDf8Gx5VdCmBl577KZA
	 H8+wByJDmnFL0dHkGkUofLeF5vv/qSzmwGhwAF4FKYncIaqSbTNyzh0yN8yd6OEcr0
	 aOJcDqCtAnfDSquMy6kiIisKQ4pYRhR646y+3V4VHKCOVx3pYmvm4L6C3etZAraJRw
	 mtpuy8MFqZMCl3NyXM8s9prA7E+yFcWlI4uy0mLwVyuuFKW/ZLmxoQ0l1oyHnT/UG1
	 918w+RG4bnXBw==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9F3C5F4006A;
	Mon,  2 Feb 2026 10:57:01 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 02 Feb 2026 10:57:01 -0500
X-ME-Sender: <xms:TcmAaYjOJrq73uxB93s_1BKc0eXQYx_nn7nFRgDmIi_RLU-icKTkBQ>
    <xme:TcmAaaMpJcV04hdcBqMV5JCrO0-4FS84Iyyan2CQIXCWAuNUojgJowCJ6F8CIs8Cc
    Ohz9aZVPmxiJjEPzrfmX9Uv0JDFynwCwIeMH_T4zyisAAHoNEkaEg>
X-ME-Received: <xmr:TcmAaaMNLQ6cUoLUPbsnxRut7Yuf8XTPl6gSVFX3WYZtom9LfBf2cdVkJ0mwFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:TcmAaaKT1qy77U44vFiWXE8gk1b0ceZszD7whfv03MucIMbGIJNyEQ>
    <xmx:TcmAaRtSE9qGIf1q5QseHThLiCvJ0RZb3JnQOGGWNUFLdVU1FlHYmQ>
    <xmx:TcmAaUG7Lc0mgm530I0Bo9Pyjy719LFOhnRcY1esid_-c2vfijYIdw>
    <xmx:TcmAaYOIBp0AIdUaK3Rtnn0Zs3kXq3uF9LacjMNexwXsakmoAAn5Gw>
    <xmx:TcmAafGxOZuXYbhcWnujikyIb9CCuSz6CHe6QSpg7yOBxcruif0N5p8L>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:56:59 -0500 (EST)
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
Subject: [PATCHv6 02/17] mm: Change the interface of prep_compound_tail()
Date: Mon,  2 Feb 2026 15:56:18 +0000
Message-ID: <20260202155634.650837-3-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of passing down the head page and tail page index, pass the tail
and head pages directly, as well as the order of the compound page.

This is a preparation for changing how the head position is encoded in
the tail page.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-flags.h |  4 +++-
 mm/hugetlb.c               |  8 +++++---
 mm/internal.h              | 12 ++++++------
 mm/mm_init.c               |  2 +-
 mm/page_alloc.c            |  2 +-
 5 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f7a0e4af0c73..8a3694369e15 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -865,7 +865,9 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *page, struct page *head)
+static __always_inline void set_compound_head(struct page *page,
+					      const struct page *head,
+					      unsigned int order)
 {
 	WRITE_ONCE(page->compound_head, (unsigned long)head + 1);
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6e855a32de3d..54ba7cd05a86 100644
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
index d67e8bb75734..037ddcda25ff 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -879,13 +879,13 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
 		INIT_LIST_HEAD(&folio->_deferred_list);
 }
 
-static inline void prep_compound_tail(struct page *head, int tail_idx)
+static inline void prep_compound_tail(struct page *tail,
+				      const struct page *head,
+				      unsigned int order)
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
index 1a29a719af58..ba50f4c4337b 100644
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
index e4104973e22f..00c7ea958767 100644
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

