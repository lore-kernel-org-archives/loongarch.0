Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C60239086
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047862; cv=none; b=M3ymj7ykJTPSWFqcMgXapH0EDul8ci0TharQ9Caz1JLUzUXv3ZYFU/xdNofnh0qE33B5uzsr9eoleiIg7BWDd7UFbfXQgiu07dRYpRbyh7Cion0esDTqtNKs3QWH7MhemVQBc9kTcumi10KA4kQ3j6Oy3zr3drWe6Sy25i/E/Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047862; c=relaxed/simple;
	bh=tEvq02HqTGhVbwvuqPMQOCqNdmF5urkjY+a3mR1Nbe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seUQJJKjehsyn7FoWFof4U3vp1eUbta5+jzTeWE2wU7ZJ9gak/PXz60pQHjQn93/itDVq9qh93mGU/WG5s/Wdbx8IhxaH1wNsS0zfEmYHAJIJxZuBeGDfhbN1JpNhOLfv7ounmfPSyqiu7Qy51EjsDU2HONMrDPu19rDL5nSHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6gLykT2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6gLykT2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CBAC4AF0B;
	Mon,  2 Feb 2026 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047862;
	bh=tEvq02HqTGhVbwvuqPMQOCqNdmF5urkjY+a3mR1Nbe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a6gLykT2F4H6T7Bv3mIOaEq5FB7tNvbWqegWNr2WRFzzFAhWamaFIPjxKFzg9VnA5
	 qisxXu2h7JsU67XPGclirmh/cX/S7m1vHwNHw/GJ9AqhmdzcYRsOkP/+1kIiXO7Hm3
	 jaW6GPp4GYELsPhpF8McpweQvrD/HtYN61y8e+/6Izha7bKhV0a5hMzvkYTYHPR6hy
	 o1QUfpNUHKKR2cG4+QkLzlI4O4Hw43g4Vs9/49e+tUTkdRqvdCTS7A2Ny1DspXpfD2
	 WankSfhSM6JB1VMEmSgseGgmoea7T965hFdXGnp1XSb6ugDffX/oM6oEkAP5CZIAtH
	 ldpCYO/nCWovw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3AEF1F40069;
	Mon,  2 Feb 2026 10:57:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Feb 2026 10:57:41 -0500
X-ME-Sender: <xms:dcmAaZzLAvkbg2fGXS2FTVkqRi0xqLORqKAD9gKdpfGTO5hAo9JsQQ>
    <xme:dcmAaSfjn9QZ9-08bQDK-bdIIFHvI129KKP59FXqaBwyl01JXCWYhmCMfizfKFUou
    75UbaXKSC1WgGL7brYAFZj_hqbVWHgIHrnfMnSsg66zDgfOPgeJkqQ>
X-ME-Received: <xmr:dcmAadeiymVA8H9IkmAsR6lDLKvFle_LImzgSXRdB71M2gpfcFpjPr6pchcC7w>
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
X-ME-Proxy: <xmx:dcmAacbS6zJTBojJo2Gg9bXzK811Bw8Cjfbad6b0sOvv0hKMwIiU4g>
    <xmx:dcmAaW-MCXXhAq5pFSk6_sl5mSsXrHWZQHVXUMQXfknqjeWnYiBMxQ>
    <xmx:dcmAaQUJ3J3HhiiwGxxNIP3nVNA5gqp6zka5KpXv_IVk1s5WZP7SVg>
    <xmx:dcmAafe8y7nlE0TaPGr9DipiRlt8udwSvj5sjR5AZA3W3Z4728_Jzw>
    <xmx:dcmAaVU_Qfu7eAMuUWk1gAk_XXfk4Jper1fb-kOet_88JVLgdMbkFug8>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:39 -0500 (EST)
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
Subject: [PATCHv6 07/17] mm: Rework compound_head() for power-of-2 sizeof(struct page)
Date: Mon,  2 Feb 2026 15:56:23 +0000
Message-ID: <20260202155634.650837-8-kas@kernel.org>
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

For tail pages, the kernel uses the 'compound_info' field to get to the
head page. The bit 0 of the field indicates whether the page is a
tail page, and if set, the remaining bits represent a pointer to the
head page.

For cases when size of struct page is power-of-2, change the encoding of
compound_info to store a mask that can be applied to the virtual address
of the tail page in order to access the head page. It is possible
because struct page of the head page is naturally aligned with regards
to order of the page.

The significant impact of this modification is that all tail pages of
the same order will now have identical 'compound_info', regardless of
the compound page they are associated with. This paves the way for
eliminating fake heads.

The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is only
applied when the sizeof(struct page) is power-of-2. Having identical
tail pages allows the same page to be mapped into the vmemmap of all
pages, maintaining memory savings without fake heads.

If sizeof(struct page) is not power-of-2, there is no functional
changes.

Limit mask usage to HugeTLB vmemmap optimization (HVO) where it makes
a difference. The approach with mask would work in the wider set of
conditions, but it requires validating that struct pages are naturally
aligned for all orders up to the MAX_FOLIO_ORDER, which can be tricky.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-flags.h | 81 ++++++++++++++++++++++++++++++++++----
 mm/slab.h                  | 16 ++++++--
 mm/util.c                  | 16 ++++++--
 3 files changed, 97 insertions(+), 16 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index d14a17ffb55b..8f2c7fbc739b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -198,6 +198,29 @@ enum pageflags {
 
 #ifndef __GENERATING_BOUNDS_H
 
+/*
+ * For tail pages, if the size of struct page is power-of-2 ->compound_info
+ * encodes the mask that converts the address of the tail page address to
+ * the head page address.
+ *
+ * Otherwise, ->compound_info has direct pointer to head pages.
+ */
+static __always_inline bool compound_info_has_mask(void)
+{
+	/*
+	 * Limit mask usage to HugeTLB vmemmap optimization (HVO) where it
+	 * makes a difference.
+	 *
+	 * The approach with mask would work in the wider set of conditions,
+	 * but it requires validating that struct pages are naturally aligned
+	 * for all orders up to the MAX_FOLIO_ORDER, which can be tricky.
+	 */
+	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
+		return false;
+
+	return is_power_of_2(sizeof(struct page));
+}
+
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
 
@@ -210,6 +233,10 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
 	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
 		return page;
 
+	/* Fake heads only exists if compound_info_has_mask() is true */
+	if (!compound_info_has_mask())
+		return page;
+
 	/*
 	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
 	 * struct page. The alignment check aims to avoid access the fields (
@@ -223,10 +250,14 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
 		 * because the @page is a compound page composed with at least
 		 * two contiguous pages.
 		 */
-		unsigned long head = READ_ONCE(page[1].compound_info);
+		unsigned long info = READ_ONCE(page[1].compound_info);
 
-		if (likely(head & 1))
-			return (const struct page *)(head - 1);
+		/* See set_compound_head() */
+		if (likely(info & 1)) {
+			unsigned long p = (unsigned long)page;
+
+			return (const struct page *)(p & info);
+		}
 	}
 	return page;
 }
@@ -281,11 +312,26 @@ static __always_inline int page_is_fake_head(const struct page *page)
 
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
-	unsigned long head = READ_ONCE(page->compound_info);
+	unsigned long info = READ_ONCE(page->compound_info);
 
-	if (unlikely(head & 1))
-		return head - 1;
-	return (unsigned long)page_fixed_fake_head(page);
+	/* Bit 0 encodes PageTail() */
+	if (!(info & 1))
+		return (unsigned long)page_fixed_fake_head(page);
+
+	/*
+	 * If compound_info_has_mask() is false, the rest of compound_info is
+	 * the pointer to the head page.
+	 */
+	if (!compound_info_has_mask())
+		return info - 1;
+
+	/*
+	 * If compoun_info_has_mask() is true the rest of the info encodes
+	 * the mask that converts the address of the tail page to the head page.
+	 *
+	 * No need to clear bit 0 in the mask as 'page' always has it clear.
+	 */
+	return (unsigned long)page & info;
 }
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
@@ -294,7 +340,26 @@ static __always_inline void set_compound_head(struct page *page,
 					      const struct page *head,
 					      unsigned int order)
 {
-	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
+	unsigned int shift;
+	unsigned long mask;
+
+	if (!compound_info_has_mask()) {
+		WRITE_ONCE(page->compound_info, (unsigned long)head | 1);
+		return;
+	}
+
+	/*
+	 * If the size of struct page is power-of-2, bits [shift:0] of the
+	 * virtual address of compound head are zero.
+	 *
+	 * Calculate mask that can be applied to the virtual address of
+	 * the tail page to get address of the head page.
+	 */
+	shift = order + order_base_2(sizeof(struct page));
+	mask = GENMASK(BITS_PER_LONG - 1, shift);
+
+	/* Bit 0 encodes PageTail() */
+	WRITE_ONCE(page->compound_info, mask | 1);
 }
 
 static __always_inline void clear_compound_head(struct page *page)
diff --git a/mm/slab.h b/mm/slab.h
index 8a2a9c6c697b..f68c3ac8126f 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -137,11 +137,19 @@ static_assert(IS_ALIGNED(offsetof(struct slab, freelist), sizeof(struct freelist
  */
 static inline struct slab *page_slab(const struct page *page)
 {
-	unsigned long head;
+	unsigned long info;
+
+	info = READ_ONCE(page->compound_info);
+	if (info & 1) {
+		/* See compound_head() */
+		if (compound_info_has_mask()) {
+			unsigned long p = (unsigned long)page;
+			page = (struct page *)(p & info);
+		} else {
+			page = (struct page *)(info - 1);
+		}
+	}
 
-	head = READ_ONCE(page->compound_head);
-	if (head & 1)
-		page = (struct page *)(head - 1);
 	if (data_race(page->page_type >> 24) != PGTY_slab)
 		page = NULL;
 
diff --git a/mm/util.c b/mm/util.c
index 3ebcb9e6035c..20dccf2881d7 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1237,7 +1237,7 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
  */
 void snapshot_page(struct page_snapshot *ps, const struct page *page)
 {
-	unsigned long head, nr_pages = 1;
+	unsigned long info, nr_pages = 1;
 	struct folio *foliop;
 	int loops = 5;
 
@@ -1247,8 +1247,8 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 again:
 	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
 	memcpy(&ps->page_snapshot, page, sizeof(*page));
-	head = ps->page_snapshot.compound_info;
-	if ((head & 1) == 0) {
+	info = ps->page_snapshot.compound_info;
+	if (!(info & 1)) {
 		ps->idx = 0;
 		foliop = (struct folio *)&ps->page_snapshot;
 		if (!folio_test_large(foliop)) {
@@ -1259,7 +1259,15 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 		}
 		foliop = (struct folio *)page;
 	} else {
-		foliop = (struct folio *)(head - 1);
+		/* See compound_head() */
+		if (compound_info_has_mask()) {
+			unsigned long p = (unsigned long)page;
+
+			foliop = (struct folio *)(p & info);
+		} else {
+			foliop = (struct folio *)(info - 1);
+		}
+
 		ps->idx = folio_page_idx(foliop, page);
 	}
 
-- 
2.51.2

