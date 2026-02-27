Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E2045105A
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220647; cv=none; b=AUoDL+4Td2VzKJETntc1aFGcQmvbWOYnfqMZGn9ut1Tmvyrx/IQKoobY9yvZgtXBAUzblMfi76zQWoInmRF1n19QWoIRP27RIsIXGXm+JlgzTwcLHczjLBA0BPONRzQtDX9Tt+OzlZxPbDpOqT3LcK2gLsEqsuFk+O5m4wnvwT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220647; c=relaxed/simple;
	bh=TjFPR2A/aXv+e4Iy4206wqwlc1GWuPYPZlFrvQnaoZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euCoNY8RWsKs8FhllsTUy+VPNPx9y17O9OPZl6X/LOnCmhSQ6z2bb7on31GwSdlfkIMdYe9Is8IozTdizmFASVnvupBOg2yscqFr5roRHNRe/nWeT44872sIRVgOMmMfQFfHdrTht6As6kzj6820r+HS4jWeqdU8VPdqe1Io9iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQCTe03k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQCTe03k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF8AC116C6;
	Fri, 27 Feb 2026 19:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220647;
	bh=TjFPR2A/aXv+e4Iy4206wqwlc1GWuPYPZlFrvQnaoZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQCTe03k2GJInTEbTCNK2/2GeCIu4w/hyXbTxPvPBL6KRmnVLdXeyI3FS0Ysi8vsf
	 aOhZD37HnurZ6z1FomEsxf3IRPcWQzNNwQr19agcM8UzMLreNcfFX0MP6WsxS2z0Wv
	 fWnRouZWsBp7pnBgxNEQaKB4BojCQN2102OHPS2Pd6hTn+IP2hVJ/PRxkL/EYPFsqs
	 lJSNGNDlM6bU3IVdcbHPGDjpwkbVaQXihMkJKmh9rB1sdlgVQyUaO8pHu7VzFz1T93
	 OmiXowiWdkv6pV35jGMS8a9+ND9TTfjHEYpYCbkdA4SB2isIBQGJ6zZ+e6AIS5+UWv
	 qoQwdVTGtRVmA==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 450D4F40068;
	Fri, 27 Feb 2026 14:30:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Fri, 27 Feb 2026 14:30:46 -0500
X-ME-Sender: <xms:5vChaas37lCeo03y0kuZeDbEXCt7uyi4__EgqCKxU28opIbJzWJDfQ>
    <xme:5vChaYpfxmbE375Sj5lL2I1JoS1XLx2O_pvVSpzk1roJ3MaRW3tq__isSZlpmZ1Ku
    btAvQQQNH2aU093h04UAGU6cJunaR9Frb-VRWGLFaBnKrvwxnr7cww>
X-ME-Received: <xmr:5vChaf6KMrnTNXpxwmlxkCSPUfiVr_qMBJBT1qx6bYg8H3ywAUdbGaAQFLGnvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeegucetufdoteggodetrf
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
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:5vChaWG1sOaaUqkDujw0NKs4nOi4WEcTnwM-40iPQ-OVa1dQ10nPgA>
    <xmx:5vChaW5KWTTZltoDT9WZjxUkDSuVPLZFcrVtQ4hoxLz_vFQFYPko8Q>
    <xmx:5vChaZgIlwBQK449TIjzftWIYpJP4HSSxD7qFI2AkbBryLVBwLf5VA>
    <xmx:5vChaY6gjNoiJTkMSy6Qt0wkudl9kmCg2AQrTDQu4_XHgyzS-rqsiw>
    <xmx:5vChaaDQD_tOJHyCXX3lL9pyaucAIGXqgQr-zZW51fwD-kymJk5mdMLr>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:45 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
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
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCHv7 09/18] mm/hugetlb: Defer vmemmap population for bootmem hugepages
Date: Fri, 27 Feb 2026 19:30:10 +0000
Message-ID: <20260227193030.272078-9-kas@kernel.org>
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

Currently, the vmemmap for bootmem-allocated gigantic pages is populated
early in hugetlb_vmemmap_init_early(). However, the zone information is
only available after zones are initialized. If it is later discovered
that a page spans multiple zones, the HVO mapping must be undone and
replaced with a normal mapping using vmemmap_undo_hvo().

Defer the actual vmemmap population to hugetlb_vmemmap_init_late(). At
this stage, zones are already initialized, so it can be checked if the
page is valid for HVO before deciding how to populate the vmemmap.

This allows us to remove vmemmap_undo_hvo() and the complex logic
required to rollback HVO mappings.

In hugetlb_vmemmap_init_late(), if HVO population fails or if the zones
are invalid, fall back to a normal vmemmap population.

Postponing population until hugetlb_vmemmap_init_late() also makes zone
information available from within vmemmap_populate_hvo().

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 include/linux/mm.h   |  2 --
 mm/hugetlb_vmemmap.c | 37 +++++++++++++++----------------
 mm/sparse-vmemmap.c  | 53 --------------------------------------------
 3 files changed, 18 insertions(+), 74 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7f4dbbb9d783..0e2d45008ff4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4484,8 +4484,6 @@ int vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap);
 int vmemmap_populate_hvo(unsigned long start, unsigned long end, int node,
 			 unsigned long headsize);
-int vmemmap_undo_hvo(unsigned long start, unsigned long end, int node,
-		     unsigned long headsize);
 void vmemmap_wrprotect_hvo(unsigned long start, unsigned long end, int node,
 			  unsigned long headsize);
 void vmemmap_populate_print_last(void);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index a9280259e12a..935ec5829be9 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -790,7 +790,6 @@ void __init hugetlb_vmemmap_init_early(int nid)
 {
 	unsigned long psize, paddr, section_size;
 	unsigned long ns, i, pnum, pfn, nr_pages;
-	unsigned long start, end;
 	struct huge_bootmem_page *m = NULL;
 	void *map;
 
@@ -808,14 +807,6 @@ void __init hugetlb_vmemmap_init_early(int nid)
 		paddr = virt_to_phys(m);
 		pfn = PHYS_PFN(paddr);
 		map = pfn_to_page(pfn);
-		start = (unsigned long)map;
-		end = start + nr_pages * sizeof(struct page);
-
-		if (vmemmap_populate_hvo(start, end, nid,
-					HUGETLB_VMEMMAP_RESERVE_SIZE) < 0)
-			continue;
-
-		memmap_boot_pages_add(HUGETLB_VMEMMAP_RESERVE_SIZE / PAGE_SIZE);
 
 		pnum = pfn_to_section_nr(pfn);
 		ns = psize / section_size;
@@ -850,28 +841,36 @@ void __init hugetlb_vmemmap_init_late(int nid)
 		h = m->hstate;
 		pfn = PHYS_PFN(phys);
 		nr_pages = pages_per_huge_page(h);
+		map = pfn_to_page(pfn);
+		start = (unsigned long)map;
+		end = start + nr_pages * sizeof(struct page);
 
 		if (!hugetlb_bootmem_page_zones_valid(nid, m)) {
 			/*
 			 * Oops, the hugetlb page spans multiple zones.
-			 * Remove it from the list, and undo HVO.
+			 * Remove it from the list, and populate it normally.
 			 */
 			list_del(&m->list);
 
-			map = pfn_to_page(pfn);
-
-			start = (unsigned long)map;
-			end = start + nr_pages * sizeof(struct page);
-
-			vmemmap_undo_hvo(start, end, nid,
-					 HUGETLB_VMEMMAP_RESERVE_SIZE);
-			nr_mmap = end - start - HUGETLB_VMEMMAP_RESERVE_SIZE;
+			vmemmap_populate(start, end, nid, NULL);
+			nr_mmap = end - start;
 			memmap_boot_pages_add(DIV_ROUND_UP(nr_mmap, PAGE_SIZE));
 
 			memblock_phys_free(phys, huge_page_size(h));
 			continue;
-		} else
+		}
+
+		if (vmemmap_populate_hvo(start, end, nid,
+					 HUGETLB_VMEMMAP_RESERVE_SIZE) < 0) {
+			/* Fallback if HVO population fails */
+			vmemmap_populate(start, end, nid, NULL);
+			nr_mmap = end - start;
+		} else {
 			m->flags |= HUGE_BOOTMEM_ZONES_VALID;
+			nr_mmap = HUGETLB_VMEMMAP_RESERVE_SIZE;
+		}
+
+		memmap_boot_pages_add(DIV_ROUND_UP(nr_mmap, PAGE_SIZE));
 	}
 }
 #endif
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 37522d6cb398..032a81450838 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -302,59 +302,6 @@ int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
 	return vmemmap_populate_range(start, end, node, altmap, -1, 0);
 }
 
-/*
- * Undo populate_hvo, and replace it with a normal base page mapping.
- * Used in memory init in case a HVO mapping needs to be undone.
- *
- * This can happen when it is discovered that a memblock allocated
- * hugetlb page spans multiple zones, which can only be verified
- * after zones have been initialized.
- *
- * We know that:
- * 1) The first @headsize / PAGE_SIZE vmemmap pages were individually
- *    allocated through memblock, and mapped.
- *
- * 2) The rest of the vmemmap pages are mirrors of the last head page.
- */
-int __meminit vmemmap_undo_hvo(unsigned long addr, unsigned long end,
-				      int node, unsigned long headsize)
-{
-	unsigned long maddr, pfn;
-	pte_t *pte;
-	int headpages;
-
-	/*
-	 * Should only be called early in boot, so nothing will
-	 * be accessing these page structures.
-	 */
-	WARN_ON(!early_boot_irqs_disabled);
-
-	headpages = headsize >> PAGE_SHIFT;
-
-	/*
-	 * Clear mirrored mappings for tail page structs.
-	 */
-	for (maddr = addr + headsize; maddr < end; maddr += PAGE_SIZE) {
-		pte = virt_to_kpte(maddr);
-		pte_clear(&init_mm, maddr, pte);
-	}
-
-	/*
-	 * Clear and free mappings for head page and first tail page
-	 * structs.
-	 */
-	for (maddr = addr; headpages-- > 0; maddr += PAGE_SIZE) {
-		pte = virt_to_kpte(maddr);
-		pfn = pte_pfn(ptep_get(pte));
-		pte_clear(&init_mm, maddr, pte);
-		memblock_phys_free(PFN_PHYS(pfn), PAGE_SIZE);
-	}
-
-	flush_tlb_kernel_range(addr, end);
-
-	return vmemmap_populate(addr, end, node, NULL);
-}
-
 /*
  * Write protect the mirrored tail page structs for HVO. This will be
  * called from the hugetlb code when gathering and initializing the
-- 
2.51.2

