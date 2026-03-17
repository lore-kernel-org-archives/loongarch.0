Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3D372B2E;
	Tue, 17 Mar 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748063; cv=none; b=RUHZ8V66V14IikRN9taSHLjwaGQzcDTqD3VkAQ2Zc1f/Wjdw2aciNlyalkV4yLkAoXOfLlnoVTtk+RhdKs7lFPQpopg6cEgEVelI4g5AxX+VKUFTdpeU9OE3MD5yPQcH2LdDxHqMM9ZHdlm/nonJNhs8wUNraqLaP3DMcDxAexk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748063; c=relaxed/simple;
	bh=7uI3sZsbI/asoDP3ipVmP/m6CZdFxisukQ5cHQaHucM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6qPUGhLfuXlanJbSoC24oe6tLjdqr1IdwW3aHUV04kMxt9JzDc0YEfxybldo3+PNeEd9iPR3tGpmnD6hn4DtKOdTIGgeZV4+kkeDjcIwGML9XB4SV7mUs6gALWUb/jw5K913XKpju8RXV6d1AnRHMhNVUVYhAbCjL1u/1isXn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vub8Du4C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vub8Du4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0787C4AF0B;
	Tue, 17 Mar 2026 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748063;
	bh=7uI3sZsbI/asoDP3ipVmP/m6CZdFxisukQ5cHQaHucM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vub8Du4Co+dFYCN7AhL2Ol9PSuLvU/GCbFOPpPhoPm/f2cuZYZJqUgXkwut7gUKJD
	 VzQUDYssgeQNlQnoiBgMc8SIFNn3g5AWph5XxzgHl5MenIwS/WImHBJ4SHEsz09C92
	 LQFfJnTtCgkZ3vjvSqlGDcfX2rY8NvyTEF3DhWljTi+I27mxktuguSVwhURinSB+0x
	 43gikqjXfljYvuLf9w/zCze1YtiSnj0NBcGQrv9WrGKb6cPO+OAgefyXWfPcMgagLf
	 bCW9+C/DcRcdPW0lJTwEErDwbcghD4wkKgQmICfISCp0tRNVjUbxS8f6/bIf7aQUKX
	 c39IDMpXTZq9g==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 18A95F4008E;
	Tue, 17 Mar 2026 07:47:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 17 Mar 2026 07:47:41 -0400
X-ME-Sender: <xms:XT-5aU0Mm6LGtgR9kv86-Mtk6XyaBZHfx5XZMtqUilaTdDFLU_oepw>
    <xme:XT-5afNKFRTeuTbq-k1Odd2m-qSj7Vo5O15kwWhA4BLeVACC_T8U-sH2iJlBEc1eM
    kUyJDbtirqGmm6gMz9x5KmCb2PeorT3wRqUGKJ9EzGizB7_vS8xyg>
X-ME-Received: <xmr:XT-5aauZQXsEu7dSi42lJZFfvjN8wBxId5c0Gqc0O63kXd2kQXUXl8SAPQeZJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegote
    eftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepfdfmihhrhihlucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokh
    grsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefhudejfedvgeekffef
    vdekheekkeeuveeftdelheegteelgfefveevueekhfdtteenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghu
    thhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedqvdekgeeggeejvdekqdhkrg
    hspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphht
    thhopedvledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhgrsheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdr
    ohhrghdprhgtphhtthhopegrlhgvgiesghhhihhtihdrfhhrpdhrtghpthhtoheprghouh
    esvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegshhgvsehrvgguhhgr
    thdrtghomhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhvughlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:XT-5aSFPl_Kenod8IgaXD0xcOHWy_GmUczp69xeZekceBnBWNvDv5A>
    <xmx:XT-5aVQFCiZ7kkiq6kMMgzn9xuPrYvfqYLK8Y_Gw0V1O_ZHxyiG-7g>
    <xmx:XT-5aWiwA6TUb7QFBP77q1nrbCZduMPbThS1TgwuGux7Q9OKiRxDbQ>
    <xmx:XT-5aZayYdlnuMtvet7YeOqrxEaeMydvnVSjiKn1uQkunaUo5OM86w>
    <xmx:XT-5aXXP5gQ8GLy2Xjxf0O7VlI1E4j-TUlMlYI_j4tBcK0O2KDhruQaL>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Mar 2026 07:47:38 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bhe@redhat.com,
	chenhuacai@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	fvdl@google.com,
	hannes@cmpxchg.org,
	kernel-team@meta.com,
	kernel@xen0n.name,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rppt@kernel.org,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	willy@infradead.org,
	ziy@nvidia.com,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [PATCHv7.1 12/18] mm/hugetlb: Remove fake head pages
Date: Tue, 17 Mar 2026 11:47:29 +0000
Message-ID: <20260317114729.138321-1-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-13-kas@kernel.org>
References: <20260227194302.274384-13-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kiryl Shutsemau <kas@kernel.org>

HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
vmemmap pages for huge pages and remapping the freed range to a single
page containing the struct page metadata.

With the new mask-based compound_info encoding (for power-of-2 struct
page sizes), all tail pages of the same order are now identical
regardless of which compound page they belong to. This means the tail
pages can be truly shared without fake heads.

Allocate a single page of initialized tail struct pages per zone
per order in the vmemmap_tails[] array in struct zone. All huge pages of
that order in the zone share this tail page, mapped read-only into their
vmemmap. The head page remains unique per huge page.

Redefine MAX_FOLIO_ORDER using ilog2(). The define has to produce a
compile-constant as it is used to specify vmemmap_tail array size.
For some reason, compiler is not able to solve get_order() at
compile-time, but ilog2() works.

Avoid PUD_ORDER to define MAX_FOLIO_ORDER as it adds dependency to
<linux/pgtable.h> which generates hard-to-break include loop.

This eliminates fake heads while maintaining the same memory savings,
and simplifies compound_head() by removing fake head detection.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/mm.h     |  3 +-
 include/linux/mmzone.h | 19 +++++++++--
 mm/hugetlb_vmemmap.c   | 73 ++++++++++++++++++++++++++++++++++++++++--
 mm/internal.h          | 10 ++++++
 mm/sparse-vmemmap.c    | 57 +++++++++++++++++++++++++++------
 5 files changed, 147 insertions(+), 15 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e2d45008ff4..883af2cb4e3c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4482,7 +4482,8 @@ int vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap);
 int vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap);
-int vmemmap_populate_hvo(unsigned long start, unsigned long end, int node,
+int vmemmap_populate_hvo(unsigned long start, unsigned long end,
+			 unsigned int order, struct zone *zone,
 			 unsigned long headsize);
 void vmemmap_wrprotect_hvo(unsigned long start, unsigned long end, int node,
 			  unsigned long headsize);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 492a5be1090f..610c9691fb47 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -81,13 +81,17 @@
  * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
  * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
  */
-#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
+#ifdef CONFIG_64BIT
+#define MAX_FOLIO_ORDER		(ilog2(SZ_16G) - PAGE_SHIFT)
+#else
+#define MAX_FOLIO_ORDER		(ilog2(SZ_1G) - PAGE_SHIFT)
+#endif
 #else
 /*
  * Without hugetlb, gigantic folios that are bigger than a single PUD are
  * currently impossible.
  */
-#define MAX_FOLIO_ORDER		PUD_ORDER
+#define MAX_FOLIO_ORDER		(PUD_SHIFT - PAGE_SHIFT)
 #endif
 
 #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
@@ -103,6 +107,14 @@
 	 is_power_of_2(sizeof(struct page)) ? \
 	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
 
+/*
+ * vmemmap optimization (like HVO) is only possible for page orders that fill
+ * two or more pages with struct pages.
+ */
+#define VMEMMAP_TAIL_MIN_ORDER (ilog2(2 * PAGE_SIZE / sizeof(struct page)))
+#define __NR_VMEMMAP_TAILS (MAX_FOLIO_ORDER - VMEMMAP_TAIL_MIN_ORDER + 1)
+#define NR_VMEMMAP_TAILS (__NR_VMEMMAP_TAILS > 0 ? __NR_VMEMMAP_TAILS : 0)
+
 enum migratetype {
 	MIGRATE_UNMOVABLE,
 	MIGRATE_MOVABLE,
@@ -1099,6 +1111,9 @@ struct zone {
 	/* Zone statistics */
 	atomic_long_t		vm_stat[NR_VM_ZONE_STAT_ITEMS];
 	atomic_long_t		vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+	struct page *vmemmap_tails[NR_VMEMMAP_TAILS];
+#endif
 } ____cacheline_internodealigned_in_smp;
 
 enum pgdat_flags {
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 3628fb5b2a28..a2664e230333 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -19,6 +19,7 @@
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
+#include "internal.h"
 
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
@@ -505,6 +506,32 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
 	return true;
 }
 
+static struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
+{
+	const unsigned int idx = order - VMEMMAP_TAIL_MIN_ORDER;
+	struct page *tail, *p;
+	int node = zone_to_nid(zone);
+
+	tail = READ_ONCE(zone->vmemmap_tails[idx]);
+	if (likely(tail))
+		return tail;
+
+	tail = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
+	if (!tail)
+		return NULL;
+
+	p = page_to_virt(tail);
+	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
+		init_compound_tail(p + i, NULL, order, zone);
+
+	if (cmpxchg(&zone->vmemmap_tails[idx], NULL, tail)) {
+		__free_page(tail);
+		tail = READ_ONCE(zone->vmemmap_tails[idx]);
+	}
+
+	return tail;
+}
+
 static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    struct folio *folio,
 					    struct list_head *vmemmap_pages,
@@ -520,6 +547,11 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	if (!vmemmap_should_optimize_folio(h, folio))
 		return ret;
 
+	nid = folio_nid(folio);
+	vmemmap_tail = vmemmap_get_tail(h->order, folio_zone(folio));
+	if (!vmemmap_tail)
+		return -ENOMEM;
+
 	static_branch_inc(&hugetlb_optimize_vmemmap_key);
 
 	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
@@ -537,7 +569,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 
-	nid = folio_nid(folio);
 	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);
 	if (!vmemmap_head) {
 		ret = -ENOMEM;
@@ -548,7 +579,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	list_add(&vmemmap_head->lru, vmemmap_pages);
 	memmap_pages_add(1);
 
-	vmemmap_tail	= vmemmap_head;
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
@@ -776,11 +806,26 @@ void __init hugetlb_vmemmap_init_early(int nid)
 	}
 }
 
+static struct zone *hugetlb_early_pfn_to_zone(unsigned nid, unsigned long pfn)
+{
+	struct zone *zone;
+	enum zone_type zone_type;
+
+	for (zone_type = 0; zone_type < MAX_NR_ZONES; zone_type++) {
+		zone = &NODE_DATA(nid)->node_zones[zone_type];
+		if (zone_spans_pfn(zone, pfn))
+			return zone;
+	}
+
+	return NULL;
+}
+
 void __init hugetlb_vmemmap_init_late(int nid)
 {
 	struct huge_bootmem_page *m, *tm;
 	unsigned long phys, nr_pages, start, end;
 	unsigned long pfn, nr_mmap;
+	struct zone *zone = NULL;
 	struct hstate *h;
 	void *map;
 
@@ -814,7 +859,12 @@ void __init hugetlb_vmemmap_init_late(int nid)
 			continue;
 		}
 
-		if (vmemmap_populate_hvo(start, end, nid,
+		if (!zone || !zone_spans_pfn(zone, pfn))
+			zone = hugetlb_early_pfn_to_zone(nid, pfn);
+		if (WARN_ON_ONCE(!zone))
+			continue;
+
+		if (vmemmap_populate_hvo(start, end, huge_page_order(h), zone,
 					 HUGETLB_VMEMMAP_RESERVE_SIZE) < 0) {
 			/* Fallback if HVO population fails */
 			vmemmap_populate(start, end, nid, NULL);
@@ -842,10 +892,27 @@ static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
 static int __init hugetlb_vmemmap_init(void)
 {
 	const struct hstate *h;
+	struct zone *zone;
 
 	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct pages */
 	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
 
+	for_each_zone(zone) {
+		for (int i = 0; i < NR_VMEMMAP_TAILS; i++) {
+			struct page *tail, *p;
+			unsigned int order;
+
+			tail = zone->vmemmap_tails[i];
+			if (!tail)
+				continue;
+
+			order = i + VMEMMAP_TAIL_MIN_ORDER;
+			p = page_to_virt(tail);
+			for (int j = 0; j < PAGE_SIZE / sizeof(struct page); j++)
+				init_compound_tail(p + j, NULL, order, zone);
+		}
+	}
+
 	for_each_hstate(h) {
 		if (hugetlb_vmemmap_optimizable(h)) {
 			register_sysctl_init("vm", hugetlb_vmemmap_sysctls);
diff --git a/mm/internal.h b/mm/internal.h
index c76122f22294..8c2ce3e16fd7 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -886,6 +886,16 @@ static inline void prep_compound_tail(struct page *tail,
 	set_page_private(tail, 0);
 }
 
+static inline void init_compound_tail(struct page *tail,
+		const struct page *head, unsigned int order, struct zone *zone)
+{
+	set_page_count(tail, 0);
+	atomic_set(&tail->_mapcount, -1);
+	set_page_node(tail, zone_to_nid(zone));
+	set_page_zone(tail, zone_idx(zone));
+	prep_compound_tail(tail, head, order);
+}
+
 void post_alloc_hook(struct page *page, unsigned int order, gfp_t gfp_flags);
 extern bool free_pages_prepare(struct page *page, unsigned int order);
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 032a81450838..842ed2f0bce6 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -325,16 +325,54 @@ void vmemmap_wrprotect_hvo(unsigned long addr, unsigned long end,
 	}
 }
 
-/*
- * Populate vmemmap pages HVO-style. The first page contains the head
- * page and needed tail pages, the other ones are mirrors of the first
- * page.
- */
-int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
-				       int node, unsigned long headsize)
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+static __meminit struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
+{
+	struct page *p, *tail;
+	unsigned int idx;
+	int node = zone_to_nid(zone);
+
+	if (WARN_ON_ONCE(order < VMEMMAP_TAIL_MIN_ORDER))
+		return NULL;
+	if (WARN_ON_ONCE(order > MAX_FOLIO_ORDER))
+		return NULL;
+
+	idx = order - VMEMMAP_TAIL_MIN_ORDER;
+	tail = zone->vmemmap_tails[idx];
+	if (tail)
+		return tail;
+
+	/*
+	 * Only allocate the page, but do not initialize it.
+	 *
+	 * Any initialization done here will be overwritten by memmap_init().
+	 *
+	 * hugetlb_vmemmap_init() will take care of initialization after
+	 * memmap_init().
+	 */
+
+	p = vmemmap_alloc_block_zero(PAGE_SIZE, node);
+	if (!p)
+		return NULL;
+
+	tail = virt_to_page(p);
+	zone->vmemmap_tails[idx] = tail;
+
+	return tail;
+}
+
+int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
+				       unsigned int order, struct zone *zone,
+				       unsigned long headsize)
 {
-	pte_t *pte;
 	unsigned long maddr;
+	struct page *tail;
+	pte_t *pte;
+	int node = zone_to_nid(zone);
+
+	tail = vmemmap_get_tail(order, zone);
+	if (!tail)
+		return -ENOMEM;
 
 	for (maddr = addr; maddr < addr + headsize; maddr += PAGE_SIZE) {
 		pte = vmemmap_populate_address(maddr, node, NULL, -1, 0);
@@ -346,8 +384,9 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
 	 * Reuse the last page struct page mapped above for the rest.
 	 */
 	return vmemmap_populate_range(maddr, end, node, NULL,
-					pte_pfn(ptep_get(pte)), 0);
+				      page_to_pfn(tail), 0);
 }
+#endif
 
 void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 				      unsigned long addr, unsigned long next)
-- 
2.51.2

