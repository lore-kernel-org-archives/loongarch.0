Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859179;
	b=BIEHMfcBOL1E7CyCliRZu4mBtm76vrZbUiG270J7vyVsWcQtSoU/kMrR3oRVSzXMbGDL
	 ZV7BxF2p/5s5BBgvWr99stAPxvRwHxy/9nsflhcNOCLr9AjD3nqOmZ/1Uj2ZnSW6FoO1n
	 mPkOzvdLqmGxxwQLJJecC+isUfkmXvnOSFh58YOoH9r3z1YBHioyn5oRqQKiO4ucxF46l
	 GTxgZa+Gzar++tCI8b3marqBjtcathPhd2Ohp4WYZ7sjrgBQPiYDdbbFf8/FdNIc2bI6o
	 KwrxLu4xl6H31Twvhi99fXnbkBdVNXoA8aGNpJ1UXbYGZ0pVaHf4CAvVk7Oy/HGtsRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kKRQNq+YvdEons4PssMSMvDyZ1aDaAIj0dg+GEUgY+U=;
	b=bkwh4BXde0AOUeescakOky4sflgofjw96HlDz/YROqQDcokTUq+oxoKzBWKYHrlsp7XV
	 onVE/Z0FAfDdSCaysM4OlRmSYklC36/WVDy8mx5lL1pX1Gqn8IhjF3P6xlVeWSJ+Xqd+Z
	 uf2HHstH652V/UJJDNy64fNj+z0aSoSWRBCKAbFBXM+VAtdYzjvLlrqPLyYcmX2PtTTGf
	 3KwVVPcASby4BvQf8GpuBGfuRbAFfVU6TBPpATMwRAFNcuHT2D5ircp22Mka6KG1/GTzw
	 oye454MpI/YX/VHbZqS2TDK514aXq9WN4spgB1DkJn2z+M8fcO4qivS7KeTzc3hA6Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TZDXM04d;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE0606A330
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 06:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DE0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TZDXM04d
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5fb79ce82so8982055ad.0
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859178; x=1794463978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKRQNq+YvdEons4PssMSMvDyZ1aDaAIj0dg+GEUgY+U=;
        b=TZDXM04dXjw4lekKgP2yVd4e2aEh5Bu0UTvvVcTHs0MaAO/+smgqY1j77CGR2ZCp8d
         6q38YJvQj5sCzDi1vWBopY+pLe3HZSt8awsbZTRqTqUNuy3/okWWSwryTvI16qsPzxZg
         wkJcYbXGy0+LpNoOxyq7TLDryEdji0KG2JcZ8PS5WpFIPd8JhgpSXlhjgR1MwFvbIqBV
         tWsyfksciWv0NmVPqMZz3bUeR0NVsvgu+2VB7MZo1pvUqNfualVX/kno6nQBKytPoBPW
         GXILZt5zYOzvViMwQy67J7s9QVQ3V6w7LNS4x6trKA0C/KmmGtMjykzylTKFzHz2RAJx
         SCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859178; x=1794463978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKRQNq+YvdEons4PssMSMvDyZ1aDaAIj0dg+GEUgY+U=;
        b=MpCi4sN30W1/gsl0M+bLlFWM8HuwLFcN6e1tBZAt5o1v/o2V9JjZ0OZG8u+rPp1wmo
         M8sK0y1KMCIeb2e/S0tQu4sNok+Z7pZDkr2McAL63gonLPBJk7sxRETtpPGnF0crxpfe
         ahThE/vkS1OpM3jLUdm97X+8l2oXw60MWmcBFyK6g0cxxBfblQnJxNpjocoLONw5omQY
         3UIHaGOVYmZNYOFOdkKD7HsEZbYGR+USBHWIszD8lf0zz4+47A/+FGmf3F6SRpRBwHoz
         CeqslS1oJxL6agczX/rO994VT082emDXO2MVrp+Vvg/pGF0vMNhwWUp8UIb81Z/cyEX7
         C1Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxozh7dDtJkJPhgMp7tk8E6sGlyb3nxVZXdWeeWTKG3BbYGicbC24HvYeHJoTOCsBljOPIXD8SaXNY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8bmS0L9xD/Y11xQ/aV1IdI+O1dESvNQluOSwg2RY4zdYnCyPdi
	w+QXVATzFpdHTiSgBD+lgkJO9hlHCU7AFGoe4Qzep0T0mSPuwAi00zJ9SsQXcMcTtYY=
X-Gm-Gg: AYBFou0FBIAGwixoh742ZPQjdpEy5dkI5rgEI43KgjxTPoMjhcvIl7P43q2tRC+MBMx
	Ktxuks45bHjCn28bwphYwANCAyZR+B/UCjgHR4999q4tCleLNAehe2la9bPk7Jc9bk3fALME9Pv
	4GsAQK84WXj9nZ/qZjaFUqG1Nt0GwO5+yAYSzxEoIKXbX4ZUFgYkCA1KusoHKUak9u/Jo2mIW6c
	7yHZy/8/zFnC1syzvQwU7slGMbzNKi5jNnU3VdPcp3PK6lefDCoVK1REnSlBKLe9Pcxqs9flYKo
	8pFnY48x9SIDANT3WXYBjG0iaUnpS++7Ft6R+pMWbLPpH96Pr5XO0DZvI9DKsf/F3x7rhpRK4e8
	T6venc2XYepc5/ZwbdMl0/zyVAbcSGSmchY2ziHNOrmfhLowmBkAVZ5U8DewsMvPHaQYFOidNgU
	1kLlnBn0ytLmIz/oZIrZQjw3hGaPYqu6Mi/NskVc2n/SgxPNVjzw6TYLpvpXyONYhcoZfjGC85i
	i+TgMb76kemEbA9SwNusTg7+1c8mnY/49Cf8veul2b1Hay8ZZcPHz2DSRkdWdgKox+K8eFOGOWq
	qFXuUjwNedNB/MBKXrdWGnufxS5omf7/6hWI+8PANmUpY2pc9A9AEQpvLx6PMYgtqA==
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae896f8315mr16195357a91.11.1793859177566;
        Wed, 04 Nov 2026 22:12:57 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:57 -0800 (PST)
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
Subject: [PATCH v2 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Thu,  5 Nov 2026 14:12:16 +0800
Message-ID: <20261105061217.13302-5-songmuchun@bytedance.com>
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

section_vmemmap_optimizable() can already decide whether a section uses
vmemmap optimization based on the section compound order. The DAX-specific
vmemmap_can_optimize() helper duplicates that policy, so remove it to
simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Ignore non-optimizable nonzero section orders while retaining zero
  as the reset value (reported by Sashiko)
- Use section_vmemmap_optimization_disable() for the altmap fallback
- Move vmemmap_optimizable_order() before its first caller
---
 include/linux/mm.h                   | 37 ----------------------------
 include/linux/vmemmap-optimization.h | 25 ++++++++++---------
 mm/sparse-vmemmap.c                  |  6 +++--
 3 files changed, 18 insertions(+), 50 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a060a7150401..2fa5ce73b382 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5366,42 +5365,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
 }
 #endif
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
-					  struct dev_pagemap *pgmap)
-{
-	unsigned long nr_pages;
-	unsigned long nr_vmemmap_pages;
-
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!pgmap || !is_power_of_2(sizeof(struct page)))
-		return false;
-
-	nr_pages = pgmap_vmemmap_nr(pgmap);
-	nr_vmemmap_pages = ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
-	/*
-	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
-	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
-	 */
-	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
-}
-/*
- * If we don't have an architecture override, use the generic rule
- */
-#ifndef vmemmap_can_optimize
-#define vmemmap_can_optimize __vmemmap_can_optimize
-#endif
-
-#else
-static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
-					   struct dev_pagemap *pgmap)
-{
-	return false;
-}
-#endif
-
 enum mf_flags {
 	MF_COUNT_INCREASED = 1 << 0,
 	MF_ACTION_REQUIRED = 1 << 1,
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 5c09da4df4d8..9d9f7a67d195 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -31,6 +31,17 @@
 #define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	(VMEMMAP_OPTIMIZATION_SIZE / sizeof(struct page))
 #define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
 
+static inline bool vmemmap_optimizable_order(unsigned int order)
+{
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
+		return false;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
+}
+
 #ifdef CONFIG_VMEMMAP_OPTIMIZATION
 static inline unsigned int section_compound_order(const struct mem_section *section)
 {
@@ -40,6 +51,9 @@ static inline unsigned int section_compound_order(const struct mem_section *sect
 static inline void section_set_compound_order(struct mem_section *section,
 					      unsigned int order)
 {
+	if (order && !vmemmap_optimizable_order(order))
+		return;
+
 	VM_WARN_ON(section_compound_order(section) && order &&
 		   section_compound_order(section) != order);
 	section->compound_page_order = order;
@@ -134,15 +148,4 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order
 
 	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
 }
-
-static inline bool vmemmap_optimizable_order(unsigned int order)
-{
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!is_power_of_2(sizeof(struct page)))
-		return false;
-
-	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
-}
 #endif /* _LINUX_VMEMMAP_OPTIMIZATION_H */
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index b8b55e12f5ba..71a927d67a9f 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -473,6 +473,9 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/* Altmap-backed vmemmap pages cannot be optimized. */
+	if (altmap)
+		section_vmemmap_optimization_disable(start, end);
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -700,10 +703,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	struct mem_section *ms = __pfn_to_section(pfn);
 	struct mem_section_usage *usage = NULL;
 	struct page *memmap;
-	unsigned int order;
+	unsigned int order = pgmap ? pgmap->vmemmap_shift : 0;
 	int rc;
 
-	order = vmemmap_can_optimize(altmap, pgmap) ? pgmap->vmemmap_shift : 0;
 	if (nr_pages < PAGES_PER_SECTION && section_compound_order(ms))
 		return ERR_PTR(-EOPNOTSUPP);
 
-- 
2.54.0

