Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F972F2604
	for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608511; cv=none; b=SaHbz04s4u4pvlXTfh6Tw5xNIj1GOhWBzduizEHihEMWy0nWEyoPU0WJzdKKUUhuYzBPSIXL43DLAQrYOmUfgHwJzz51hcWa3J8hgmN4k8vh8Sw4zNJCtN3frkNZxDdLUJ8Na+djAWvAX+ua7uNA8TIh4hvUZs+HoVXzaER2mOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608511; c=relaxed/simple;
	bh=AAnIadXhZxE/xw6Xd6felYchHz0PQHYO69+c3YSZCe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Coe3BNJKIWDLI0IqjYoUNGrBRtby9+5k1nbANpsMf5AfrAmnZekper7T675NwsJqTO3QwgKeFQdEwRQkRAvaNhbg516DWsHXAfTGW8ca+6WDad77OjJ/Tgg+ctEGUX1wV5b0jFKgL4w6z4d/yZzBOfjLJvL1JD8+ttH+VZ6Z3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSKal1md; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSKal1md"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FDBC4CEF7;
	Wed, 28 Jan 2026 13:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608511;
	bh=AAnIadXhZxE/xw6Xd6felYchHz0PQHYO69+c3YSZCe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GSKal1mdGyYmQdTcYaYWCrpQxqhSa0abl4M88scQ0oD0CPPMAn/W/ziTb5o6fOIqc
	 4GviC1yzRokvwgBPo4Mn5i1z42TFw9Hv68PgJkXY/+KkOZpWAwQaIU12j6Uf7dKtFz
	 sHAzx+zvICzU/5o5F6m8Ryb4pX9Hbm/GdWN6XQG/34VCS/0U7VkyhuCgEHbfl/Uzko
	 /NYsD50WtFXcMPBlu1X9gfC7Tclo9vEz1mttJ/MAqP32i3lGlfcKDRiiHIw3kPj3ng
	 bZ9wOztB2fskRP8QTnEYtDbUiYRl4+quj2VGGyJodJ/hEy9+8gwkIrtokcI8mBw0nu
	 PcDvqL6OGjZoA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9C036F4006A;
	Wed, 28 Jan 2026 08:55:09 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 28 Jan 2026 08:55:09 -0500
X-ME-Sender: <xms:PRV6aXctoo9CvAcsI446BvMWXAjccvR2nSboGgyGbdhtTMUvA4Vb3A>
    <xme:PRV6adUlombAl4wSx96uHdftCOkeDK6SC_bmPGpqN_kEHTckWMCqGpQxzrf2FvInZ
    8mdZth2kFyYXxeRpZbfvz8-8dQls-c1TiwooI8aOyQ_R3NSg3ZUt-8>
X-ME-Received: <xmr:PRV6aeXXOfJhXd26JAR1fWCiG3wHqvMDjS3O2y2aQ12Nw4_7Hj9vou1sBmpYZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdelpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:PRV6adPpqUuA53jX-Gx5rGE3Y2LI7uv89Odvj7UIdDFmCOMzVBKSQA>
    <xmx:PRV6aR7PCcJrhG-wm3HqCMnc35XfrvBoeRE_2IXOauSejyCeMoMTNA>
    <xmx:PRV6aWoXcBHQ_v2j3ZcrDozr4huvlUdeHhlsZZGpoOxjreE6hDqF3w>
    <xmx:PRV6aXBa7YZQ0lcR5V9u9YptXp9OdeoQDS02F41otLs02d1-x5Rz5Q>
    <xmx:PRV6aUcjIyt9oZyw7hFCtgE-pDDbiRss8bEHzKmAGSOvysTO_bD_PYD2>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:55:07 -0500 (EST)
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
	Kiryl Shutsemau <kas@kernel.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Subject: [PATCHv5 01/17] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
Date: Wed, 28 Jan 2026 13:54:42 +0000
Message-ID: <20260128135500.22121-2-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260128135500.22121-1-kas@kernel.org>
References: <20260128135500.22121-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.

This is preparation for adding the vmemmap_tails array to struct
pglist_data, which requires MAX_FOLIO_ORDER to be available in mmzone.h.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Muchun Song <muchun.song@linux.dev>
---
 include/linux/mm.h     | 31 -------------------------------
 include/linux/mmzone.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f8a8fd47399c..8d5fa655fea4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -27,7 +27,6 @@
 #include <linux/page-flags.h>
 #include <linux/page_ref.h>
 #include <linux/overflow.h>
-#include <linux/sizes.h>
 #include <linux/sched.h>
 #include <linux/pgtable.h>
 #include <linux/kasan.h>
@@ -2477,36 +2476,6 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
 	return folio_large_nr_pages(folio);
 }
 
-#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
-/*
- * We don't expect any folios that exceed buddy sizes (and consequently
- * memory sections).
- */
-#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
-#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
-/*
- * Only pages within a single memory section are guaranteed to be
- * contiguous. By limiting folios to a single memory section, all folio
- * pages are guaranteed to be contiguous.
- */
-#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
-#elif defined(CONFIG_HUGETLB_PAGE)
-/*
- * There is no real limit on the folio size. We limit them to the maximum we
- * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
- * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
- */
-#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
-#else
-/*
- * Without hugetlb, gigantic folios that are bigger than a single PUD are
- * currently impossible.
- */
-#define MAX_FOLIO_ORDER		PUD_ORDER
-#endif
-
-#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
-
 /*
  * compound_nr() returns the number of pages in this potentially compound
  * page.  compound_nr() can be called on a tail page, and is defined to
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 3e51190a55e4..be8ce40b5638 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -23,6 +23,7 @@
 #include <linux/page-flags.h>
 #include <linux/local_lock.h>
 #include <linux/zswap.h>
+#include <linux/sizes.h>
 #include <asm/page.h>
 
 /* Free memory management - zoned buddy allocator.  */
@@ -61,6 +62,36 @@
  */
 #define PAGE_ALLOC_COSTLY_ORDER 3
 
+#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
+/*
+ * We don't expect any folios that exceed buddy sizes (and consequently
+ * memory sections).
+ */
+#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
+#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+/*
+ * Only pages within a single memory section are guaranteed to be
+ * contiguous. By limiting folios to a single memory section, all folio
+ * pages are guaranteed to be contiguous.
+ */
+#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
+#elif defined(CONFIG_HUGETLB_PAGE)
+/*
+ * There is no real limit on the folio size. We limit them to the maximum we
+ * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
+ * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
+ */
+#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
+#else
+/*
+ * Without hugetlb, gigantic folios that are bigger than a single PUD are
+ * currently impossible.
+ */
+#define MAX_FOLIO_ORDER		PUD_ORDER
+#endif
+
+#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
+
 enum migratetype {
 	MIGRATE_UNMOVABLE,
 	MIGRATE_MOVABLE,
-- 
2.51.2

