Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363CD466B75
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 19:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221414; cv=none; b=ZSXqLsOwo556OC3JW+Mdi8cYxTgb0pbP5fkYnxX1Hc4JVsMtjDnnLHpVMOI5iXNtanlAPIN+gVWu2EBPji5SwtLXDMVGC4gNpgUOjwpbwIuL2tl5Ht+ZS3es4+QnSzpL5uuOZ+3cqwt14rFT0tDuDDi8zGAoLyAZmdF5vxunTAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221414; c=relaxed/simple;
	bh=FHdzeRKulPcy6fiq+UUCtu6gFm6WIXAqf8YglnUe5co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZZp1VuhA/RaxWVJbditNPNWO5PomC6ChmmgkXvwGs3bj/+1VSw40QjdvnD0xMNre0ZNcMkVA3insrit0dvr71x8gfO5i2JBUIMmELohfoJvkibK5v7bArp6PsLy96ntaWZKaEE9ccB4/Yzyd404U6lW6QlbQbyFtWlYDFD07X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyRscqYH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyRscqYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440E8C19423;
	Fri, 27 Feb 2026 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221413;
	bh=FHdzeRKulPcy6fiq+UUCtu6gFm6WIXAqf8YglnUe5co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pyRscqYHSErGyEk4Kg6BcibkJYXx2FYIvix7+la49cGtu9yNcCmif7L2fOuALEY61
	 Z26QmqDHwg2z+dkTSm/8jC2zZJkyyg7zG8IzRX2mh+8xZD1plX/5vRLJ2dTno8fgkW
	 CbGUu7Brszn3JjcHyCCzzBeG73fh6K/IQ34zX7PFUtBCtIUCeKJdjHZLCGWTe6Ry2r
	 pFs4O37qmjlWCh0LaDqKypLBHTeXSqKOM5z1GHMFLE7XmNlqkj6MhzWVW9PAYSPdt7
	 ttqwaoxZR83AaKOa+aUTzQqjCAZuXxIag3lLli8pEGUV/EDjufFCPn4y5q0XywdJFG
	 /JV6PzrYNSkpw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6C577F40068;
	Fri, 27 Feb 2026 14:43:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 14:43:32 -0500
X-ME-Sender: <xms:5POhaWft2Z4hNMgdKH-WvEt06V_ySuhI88_10pmYGOt1VXp3vem3mQ>
    <xme:5POhaZaouepT4twhJM4oFKGeiz4qcb8rMiDepWwNjwnpiEZpwjh_7cOZPbXnCsbAz
    uNSU4w5R2Rn5FfF-vl2DGJf--bPMPesmv9AfkbmFU2uWBnJMZ-YMpI>
X-ME-Received: <xmr:5POhaRpteTqqn0tRHifEiRlxojYOQ-AFQaWyHCe_6-8FogWx4w69m5LOAiZKwA>
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
X-ME-Proxy: <xmx:5POhaU0j1FoiFXjb4FDCf3_iHuq1E1IiTM4SAnrJirJhjsszj6qbcg>
    <xmx:5POhaeofwXlbs3T5hVHwocrRjaSJkZbhIfhEjK7LjFANz8FdtwFB5Q>
    <xmx:5POhaWRW6i03tA2446PryzOTtzbG7IJ_oAmFyYsnJVJB9cVwVvZZ-Q>
    <xmx:5POhaWoI-p5ajUv4Cb5_Z-JMPmieNc5amNRBDKdy4YEHiEugCUapKw>
    <xmx:5POhaUyxxG_bSb5m-F8feWcYLH7uI8dYZolnRb819cVXuRYJQ6nq54pR>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:31 -0500 (EST)
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
Subject: [PATCHv7 14/18] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
Date: Fri, 27 Feb 2026 19:42:52 +0000
Message-ID: <20260227194302.274384-15-kas@kernel.org>
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

The VMEMMAP_SYNCHRONIZE_RCU flag triggered synchronize_rcu() calls to
prevent a race between HVO remapping and page_ref_add_unless(). The
race could occur when a speculative PFN walker tried to modify the
refcount on a struct page that was in the process of being remapped
to a fake head.

With fake heads eliminated, page_ref_add_unless() no longer needs RCU
protection.

Remove the flag and synchronize_rcu() calls.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/hugetlb_vmemmap.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 92330f172eb7..fd1d5d5d12b4 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -47,8 +47,6 @@ struct vmemmap_remap_walk {
 #define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
 /* Skip the TLB flush when we remap the PTE */
 #define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
-/* synchronize_rcu() to avoid writes from page_ref_add_unless() */
-#define VMEMMAP_SYNCHRONIZE_RCU		BIT(2)
 	unsigned long		flags;
 };
 
@@ -409,9 +407,6 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	if (!folio_test_hugetlb_vmemmap_optimized(folio))
 		return 0;
 
-	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
-		synchronize_rcu();
-
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
@@ -444,7 +439,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
  */
 int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *folio)
 {
-	return __hugetlb_vmemmap_restore_folio(h, folio, VMEMMAP_SYNCHRONIZE_RCU);
+	return __hugetlb_vmemmap_restore_folio(h, folio, 0);
 }
 
 /**
@@ -467,14 +462,11 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 	struct folio *folio, *t_folio;
 	long restored = 0;
 	long ret = 0;
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
+	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
 
 	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
 		if (folio_test_hugetlb_vmemmap_optimized(folio)) {
 			ret = __hugetlb_vmemmap_restore_folio(h, folio, flags);
-			/* only need to synchronize_rcu() once for each batch */
-			flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
-
 			if (ret)
 				break;
 			restored++;
@@ -554,8 +546,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 
 	static_branch_inc(&hugetlb_optimize_vmemmap_key);
 
-	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
-		synchronize_rcu();
 	/*
 	 * Very Subtle
 	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
@@ -613,7 +603,7 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 {
 	LIST_HEAD(vmemmap_pages);
 
-	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, VMEMMAP_SYNCHRONIZE_RCU);
+	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, 0);
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
@@ -641,7 +631,7 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 	struct folio *folio;
 	int nr_to_optimize;
 	LIST_HEAD(vmemmap_pages);
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
+	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
 
 	nr_to_optimize = 0;
 	list_for_each_entry(folio, folio_list, lru) {
@@ -694,8 +684,6 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 		int ret;
 
 		ret = __hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
-		/* only need to synchronize_rcu() once for each batch */
-		flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
 
 		/*
 		 * Pages to be freed may have been accumulated.  If we
-- 
2.51.2

