Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859185;
	b=O8H0VzqqaiJYqdCG3pTVM9I/MVXwt1H6GIP1u4svtYefSzm9R/NT4OblWdmRFoSeNbXR
	 qL5u1G+CBgcaRMvSJcLhDREP8W9liKW1xTY99FlKGasjKscCZ6HLtHFH0fr8sr1fPjqVi
	 o9a9LkRhKSanxK06O92a+5rUd1P3YuZ13rFkNRdWL7l1McNrDQFgGI8lioaqmOOcGjGB0
	 kjQe0xdsGpQtHqn8Q/tJ/+rerWsrubs1JdxrNVug98iabzW494pyTwQ2EecboWQsfxbki
	 CEOMg3Cz853UDd+7eQeQe7k3Mig6lO4A66GwV+hNW3l4fGBtvTgnN4wa6F4Hxu3LQVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NCLGTKCHoNQl6zGrnHHJ6bDiMkCD24v1Hv0NuRQZaOo=;
	b=P91gTJBGbshLJRMUJJaYx7x8M2o611v4zs7daPWx//xDXfjqih0SpFFBa+RrANrhFpIW
	 oVyeQ5Bpi5rCpvZpabWU5EXVUxI6syOW7BEBN0NLInfH9OjRIuOkbpo2Dc9M126EqWw1E
	 CX1HuhM0L8zQgEMLRlQtIyM0e8qzAomRjLBkyX7a9ib21M95GGUhHvVt6cXM8sp/2dyEG
	 kIA4Qbs70GxLSiA/R12aJdPXx+pHGpHmEvKEIKor3o7ED+O4gBJH1WXfVTeIjz6uSdqMn
	 EDEs9W921oSAd97q1tm8VdxklhgMPnbdGOMWUXOXULu1tt6aRvBSBTq2JqH3qrTgcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BGYzCqFA;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EAE606A329
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 06:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EAE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BGYzCqFA
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1089465a91.1
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 22:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859184; x=1794463984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCLGTKCHoNQl6zGrnHHJ6bDiMkCD24v1Hv0NuRQZaOo=;
        b=BGYzCqFAjzp0LwN99OPnHzAo2KC4AbFD/IuI1Z/rh2NJ6Ek2zcomKyfE1sJdi629DP
         mKdPjGYflVdY4KrmpLMAqLk0wOQUlCQHjNCIBSn8zDmd5Foa5Ea+UYkqrhEM7sJ2Tp1g
         lpKwgVoxwdLDjYx2sBA0uCSiU6Moz+xIW3i6B3CZ+JbhhrLjZrtOXiyEhJznvDEZISvU
         1BLFmkzOaRDq/eqPwYMb8dD9FQn0VwwkCViZANsu1rIKaNqV3ebSJ+5NhiAOp6BZNyPg
         xQT6hDUDXE2RlWeZ5PMbNEBhpLI6zNsOcCcLqMx/XrnwqP5u2m7AwVyfv1OlHeWItUBC
         5F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859184; x=1794463984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCLGTKCHoNQl6zGrnHHJ6bDiMkCD24v1Hv0NuRQZaOo=;
        b=PP07qufbMOd6qK7Y7Fdwa1fQh1gBhn6+SosSPxCFzEa3lVxZvK84jeN43VWvWMzKWE
         VhMdBLfqPCOcZF8lIyrd9BfrCCbkiuNKbhCZe4UELNANrpMw2V5ZiIIKlpXSikOI73lT
         wAJi0tUGK4U9ITcmmhmxBT4ZkGauHQb/VPeRMMyoo/wME2b/3A1baks0o6XbKprI/zJQ
         O7cSIgM6Un0TtyavH7B5QxskEDHOoE6T1Sfqd92qzf5EDjWmcvT+EeSZ503p5MPB4Nt+
         nT9uA2OpCg0ixg960j9MlvKrzkFWZL7C1Xw+SSK3SSg7Thm9hp8VEHJLKJDJWpGQqvGR
         uijw==
X-Forwarded-Encrypted: i=1; AKwUvBzrMvp8vCpW1RqoPxlIZYtKi7kEX4Xuzuoe3XsEuiJfBj93nVLPchX2+2/rQxvoK1lrMTDTC66MIyE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8eT1nz6o0aUQGBfGJm4iQMja1n3lp6gtkOSbkQwq2Py7tjZqc3
	ho4ebwsoFJmmD54V0nHAfCXR1dhoZfdk/5BGgDe+8AgLYDZZyIDCDzdmFF5GlEzhH4k=
X-Gm-Gg: AYBFou0rOA98SwCbDqfz9VPrYbDb0IWOwtoWUFu5dMJ/FeXZ7MdZTtpRDKYE3tnXRWN
	F6EGdNVOA/boMB9qK531vLntouj3Bc8jhnvZf1G2FUkO6uj6+Ek4e/oucy99uKa4JZsNvv0JCCE
	af0eiih+3kPBRFqrg6bqi5pEhaC99ajxTt2QuGpaMuUL40RA12IPaoK3B+Wggb5pecq1x5z0jhj
	HgVhJ4xREx4/mF3XLwiuNj9djbarYH+RBg6I8KuFuueZKr0FYNBfoDbpHx0KnxbCTHIrwmWAS1D
	P8IAEbo0hDb60njYtAcEQbH9AbxOQ7G7WbceDrV+YdpNKFcwt03YPC/7qkqmCEwjI3CSA8VnTi9
	KdqEywJYBnX37N9zfK7WpdGuIyiLW4MRYTlzsF3V4tg/cLT2xoya5PbIpZwzdZLXWiChCrR96ei
	Iq7YLu9PzuOnu3JOHaWXG7zb+d0OiZZ7oiKDNP1Lx0+2a8Lxyl6XASq1rUuRBLglTfmq+UiWWYs
	Ju7BC2ww7/y1df3ttzI63KiupqERqC1oaBnTgxNl2cYrfIwD+9S85EGC81Umc9QFTBuXGnNbE2s
	49+Q5ALcOG0j/49rUFQCkKsqAIy7i3NJ6UR6Fp9tXsR09dXpDThkaxI5S+Wsc9Q1ZQ==
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr15529450a91.65.1793859183930;
        Wed, 04 Nov 2026 22:13:03 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:13:03 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 5/5] mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs
Date: Thu,  5 Nov 2026 14:12:17 +0800
Message-ID: <20261105061217.13302-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vmemmap population and memory hotplug paths no longer need @pgmap
to decide whether a mapping can be optimized. That state is now carried
in mem_section, and the architecture-specific population code can make
the remaining decisions internally.

Drop the @pgmap parameter from the vmemmap population helpers and the
related memory hotplug interfaces, and remove the remaining
dev_pagemap-specific coupling from those call chains.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/arm64/mm/mmu.c                        |  5 ++---
 arch/loongarch/mm/init.c                   |  5 ++---
 arch/powerpc/include/asm/book3s/64/radix.h |  1 -
 arch/powerpc/mm/mem.c                      |  5 ++---
 arch/riscv/mm/init.c                       |  5 ++---
 arch/s390/mm/init.c                        |  5 ++---
 arch/x86/mm/init_64.c                      |  5 ++---
 include/linux/memory_hotplug.h             |  8 +++-----
 include/linux/mm.h                         |  3 +--
 mm/memory_hotplug.c                        | 16 +++++++--------
 mm/memremap.c                              |  4 ++--
 mm/sparse-vmemmap.c                        | 23 ++++++++++------------
 mm/sparse.c                                |  6 ++----
 13 files changed, 37 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 19459a4a870a..a6b5774005b6 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2038,13 +2038,12 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	return ret;
 }
 
-void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap,
-			struct dev_pagemap *pgmap)
+void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 
-	__remove_pages(start_pfn, nr_pages, altmap, pgmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
 }
 
diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index ea769e479241..c91afce46136 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -120,13 +120,12 @@ int arch_add_memory(int nid, u64 start, u64 size, struct mhp_params *params)
 	return ret;
 }
 
-void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap,
-			struct dev_pagemap *pgmap)
+void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 
-	__remove_pages(start_pfn, nr_pages, altmap, pgmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 }
 #endif
 
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index df67209b0c5b..0c9195dd50c9 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -316,7 +316,6 @@ static inline int radix__has_transparent_pud_hugepage(void)
 #endif
 
 struct vmem_altmap;
-struct dev_pagemap;
 extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
 					     unsigned long page_size,
 					     unsigned long phys);
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index b617b69452cd..2432ff888c03 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -158,13 +158,12 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
 	return rc;
 }
 
-void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap,
-			      struct dev_pagemap *pgmap)
+void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 
-	__remove_pages(start_pfn, nr_pages, altmap, pgmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 	arch_remove_linear_mapping(start, size);
 }
 #endif
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e822fce0af4b..6f064875ce8d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1749,10 +1749,9 @@ int __ref arch_add_memory(int nid, u64 start, u64 size, struct mhp_params *param
 	return ret;
 }
 
-void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap,
-			      struct dev_pagemap *pgmap)
+void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
-	__remove_pages(start >> PAGE_SHIFT, size >> PAGE_SHIFT, altmap, pgmap);
+	__remove_pages(start >> PAGE_SHIFT, size >> PAGE_SHIFT, altmap);
 	remove_linear_mapping(start, size);
 	flush_tlb_all();
 }
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index be7e009e7b59..91c0edccbb12 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -293,13 +293,12 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	return rc;
 }
 
-void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap,
-			struct dev_pagemap *pgmap)
+void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 
-	__remove_pages(start_pfn, nr_pages, altmap, pgmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 	vmem_remove_mapping(start, size);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 8b6d86fb5a42..2a635b7f78ea 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1273,13 +1273,12 @@ kernel_physical_mapping_remove(unsigned long start, unsigned long end)
 	remove_pagetable(start, end, true, NULL);
 }
 
-void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap,
-			      struct dev_pagemap *pgmap)
+void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 
-	__remove_pages(start_pfn, nr_pages, altmap, pgmap);
+	__remove_pages(start_pfn, nr_pages, altmap);
 	kernel_physical_mapping_remove(start, start + size);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index b39605d30896..ec71debc0673 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -136,10 +136,9 @@ static inline bool movable_node_is_enabled(void)
 	return movable_node_enabled;
 }
 
-extern void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap,
-			       struct dev_pagemap *pgmap);
+extern void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap);
 extern void __remove_pages(unsigned long start_pfn, unsigned long nr_pages,
-			   struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
+			   struct vmem_altmap *altmap);
 
 /* reasonably generic interface to expand the physical pages */
 extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
@@ -320,8 +319,7 @@ extern int sparse_add_section(int nid, unsigned long pfn,
 		unsigned long nr_pages, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap);
 extern void sparse_remove_section(unsigned long pfn, unsigned long nr_pages,
-				  struct vmem_altmap *altmap,
-				  struct dev_pagemap *pgmap);
+				  struct vmem_altmap *altmap);
 extern struct zone *zone_for_pfn_range(enum mmop online_type,
 		int nid, struct memory_group *group, unsigned long start_pfn,
 		unsigned long nr_pages);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2fa5ce73b382..eb11212be0d4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5316,8 +5316,7 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
 #endif
 
 struct page * __populate_section_memmap(unsigned long pfn,
-		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
-		struct dev_pagemap *pgmap);
+		unsigned long nr_pages, int nid, struct vmem_altmap *altmap);
 void *vmemmap_alloc_block(unsigned long size, int node);
 struct vmem_altmap;
 void *vmemmap_alloc_block_buf(unsigned long size, int node,
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 1bfd1f4daeb2..f04a248d8ada 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -416,8 +416,7 @@ int __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
 		err = sparse_add_section(nid, pfn, cur_nr_pages, altmap,
 					 params->pgmap);
 		if (err) {
-			__remove_pages(start_pfn, pfn - start_pfn, altmap,
-				       params->pgmap);
+			__remove_pages(start_pfn, pfn - start_pfn, altmap);
 			break;
 		}
 		cond_resched();
@@ -565,7 +564,6 @@ void remove_pfn_range_from_zone(struct zone *zone,
  * @pfn: starting pageframe (must be aligned to start of a section)
  * @nr_pages: number of pages to remove (must be multiple of section size)
  * @altmap: alternative device page map or %NULL if default memmap is used
- * @pgmap: device page map or %NULL if not ZONE_DEVICE
  *
  * Generic helper function to remove section mappings and sysfs entries
  * for the section of the memory we are removing. Caller needs to make
@@ -573,7 +571,7 @@ void remove_pfn_range_from_zone(struct zone *zone,
  * calling offline_pages().
  */
 void __remove_pages(unsigned long pfn, unsigned long nr_pages,
-		    struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+		    struct vmem_altmap *altmap)
 {
 	const unsigned long end_pfn = pfn + nr_pages;
 	unsigned long cur_nr_pages;
@@ -588,7 +586,7 @@ void __remove_pages(unsigned long pfn, unsigned long nr_pages,
 		/* Select all remaining pages up to the next section boundary */
 		cur_nr_pages = min(end_pfn - pfn,
 				   SECTION_ALIGN_UP(pfn + 1) - pfn);
-		sparse_remove_section(pfn, cur_nr_pages, altmap, pgmap);
+		sparse_remove_section(pfn, cur_nr_pages, altmap);
 	}
 }
 
@@ -1421,7 +1419,7 @@ static void remove_memory_blocks_and_altmaps(u64 start, u64 size)
 		memory_block_put(mem);
 
 		remove_memory_block_devices(cur_start, memblock_size);
-		arch_remove_memory(cur_start, memblock_size, altmap, NULL);
+		arch_remove_memory(cur_start, memblock_size, altmap);
 		altmap_free(altmap);
 	}
 }
@@ -1461,7 +1459,7 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
 		ret = create_memory_block_devices(cur_start, memblock_size, nid,
 						  params.altmap, group);
 		if (ret) {
-			arch_remove_memory(cur_start, memblock_size, params.altmap, NULL);
+			arch_remove_memory(cur_start, memblock_size, params.altmap);
 			altmap_free(params.altmap);
 			goto out;
 		}
@@ -1548,7 +1546,7 @@ static int __add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags,
 		/* create memory block devices after memory was added */
 		ret = create_memory_block_devices(start, size, nid, NULL, group);
 		if (ret) {
-			arch_remove_memory(start, size, params.altmap, NULL);
+			arch_remove_memory(start, size, params.altmap);
 			goto error;
 		}
 	}
@@ -2309,7 +2307,7 @@ static int try_remove_memory(u64 start, u64 size)
 		 * No altmaps present, do the removal directly
 		 */
 		remove_memory_block_devices(start, size);
-		arch_remove_memory(start, size, NULL, NULL);
+		arch_remove_memory(start, size, NULL);
 	} else {
 		/* all memblocks in the range have altmaps */
 		remove_memory_blocks_and_altmaps(start, size);
diff --git a/mm/memremap.c b/mm/memremap.c
index accba23aef28..683a77dd679d 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -97,10 +97,10 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 				   PHYS_PFN(range_len(range)));
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
 		__remove_pages(PHYS_PFN(range->start),
-			       PHYS_PFN(range_len(range)), NULL, pgmap);
+			       PHYS_PFN(range_len(range)), NULL);
 	} else {
 		arch_remove_memory(range->start, range_len(range),
-				pgmap_altmap(pgmap), pgmap);
+				pgmap_altmap(pgmap));
 		kasan_remove_zero_shadow(__va(range->start), range_len(range));
 	}
 	mem_hotplug_done();
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 71a927d67a9f..5777f2e29684 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -462,8 +462,7 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 }
 
 struct page * __meminit __populate_section_memmap(unsigned long pfn,
-		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
-		struct dev_pagemap *pgmap)
+		unsigned long nr_pages, int nid, struct vmem_altmap *altmap)
 {
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
@@ -555,11 +554,9 @@ void offline_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
 }
 
 static struct page * __meminit populate_section_memmap(unsigned long pfn,
-		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
-		struct dev_pagemap *pgmap)
+		unsigned long nr_pages, int nid, struct vmem_altmap *altmap)
 {
-	struct page *page = __populate_section_memmap(pfn, nr_pages, nid, altmap,
-						      pgmap);
+	struct page *page = __populate_section_memmap(pfn, nr_pages, nid, altmap);
 
 	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages));
 
@@ -567,7 +564,7 @@ static struct page * __meminit populate_section_memmap(unsigned long pfn,
 }
 
 static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+		struct vmem_altmap *altmap)
 {
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
@@ -648,7 +645,7 @@ static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
  * usage map, but still need to free the vmemmap range.
  */
 static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+		struct vmem_altmap *altmap)
 {
 	struct mem_section *ms = __pfn_to_section(pfn);
 	bool section_is_early = early_section(ms);
@@ -686,7 +683,7 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
 	 * section_activate() and pfn_valid() .
 	 */
 	if (!section_is_early)
-		depopulate_section_memmap(pfn, nr_pages, altmap, pgmap);
+		depopulate_section_memmap(pfn, nr_pages, altmap);
 	else if (memmap)
 		free_map_bootmem(memmap);
 
@@ -735,9 +732,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 		return pfn_to_page(pfn);
 
 	section_set_compound_order_range(pfn, nr_pages, order);
-	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
+	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap);
 	if (!memmap) {
-		section_deactivate(pfn, nr_pages, altmap, pgmap);
+		section_deactivate(pfn, nr_pages, altmap);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -801,13 +798,13 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
 }
 
 void sparse_remove_section(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+		struct vmem_altmap *altmap)
 {
 	struct mem_section *ms = __pfn_to_section(pfn);
 
 	if (WARN_ON_ONCE(!valid_section(ms)))
 		return;
 
-	section_deactivate(pfn, nr_pages, altmap, pgmap);
+	section_deactivate(pfn, nr_pages, altmap);
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/mm/sparse.c b/mm/sparse.c
index 6acb628c8a73..0b9a6c23a227 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -204,8 +204,7 @@ void __init sparse_sections_init(void)
 }
 #ifndef CONFIG_SPARSEMEM_VMEMMAP
 struct page __init *__populate_section_memmap(unsigned long pfn,
-		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
-		struct dev_pagemap *pgmap)
+		unsigned long nr_pages, int nid, struct vmem_altmap *altmap)
 {
 	const unsigned long size = PAGE_ALIGN(sizeof(struct page) * PAGES_PER_SECTION);
 
@@ -236,8 +235,7 @@ static void __init sparse_metadata_init_nid(int nid,
 		if (section_nr >= end_section_nr)
 			break;
 
-		mem_map = __populate_section_memmap(pfn, PAGES_PER_SECTION, nid,
-						    NULL, NULL);
+		mem_map = __populate_section_memmap(pfn, PAGES_PER_SECTION, nid, NULL);
 		if (!mem_map)
 			panic("Failed to allocate memmap for section %lu\n",
 			      section_nr);
-- 
2.54.0

