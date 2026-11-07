Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025952;
	b=HLCeIyB/cr72Yx7bp43gkCiUm/ZPgZBe9Jxfzu8AMF6h6/yHiewPzeyHasTp+iDMpINI
	 2wA114BlZHV8dVJlgdYim9KMHj4X09JHniXHqlqV7hwix7yqzKjLZKzSbiP4vM6RIS90m
	 cXU5Se8Eg9HpN1FZhqaIUKzl3DHdMkdJ61H19CsE7KgqEoxMBKYFLVRk8gtwdi/pZREBi
	 syJGt9NfAgfTRElAKu4x+AVNBEwDmJ9WDSuUP7P+EH7mEUAjUjGFEdpHF+nqbrBoiEgUY
	 MqbwPwZkJ0ZafJvgM5VLZb3DMS4DzV21pm7uUe6FZYkzM40rIy0OccereFnQuUj2vww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=;
	b=2HzJPvELC4bzw4dLxrRz8I7hEbehAS3wQbVHRbi8vbaHmjsBLBd5vBhWGwlbeXl8PMW2
	 HTQFdvLYyIVefPUs4w0SA/ctKETgytvtPxHEu+FRHygBDkyxrhwGcmGEg6BRJ6JV1m1I0
	 Ak1DnNcDyvjWIyEb1XCRybfgGnPEkC3ofk8UXEXCgsfpRXLXlmAq8yW5JnFCRUvlZxle2
	 OYUA5WqvV4SwxE3FWGSL6Pnz79xjxazVYvHvvY6HljCx4cbVfGLRuzGRS1P+fMh11XJOt
	 9GE8RJI8xQprQDTtFBdZOzmIrWv1I87QJ65sA4EqKFhPUNRPpQ3fReIH2pgkGjeS5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jNqFLFE+;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCABD606A32D
	for <loongarch@lists.linux.dev>; Sat,  7 Nov 2026 04:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCABD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jNqFLFE+
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso617544a91.3
        for <loongarch@lists.linux.dev>; Fri, 06 Nov 2026 20:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025951; x=1794630751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=;
        b=jNqFLFE+aIah5+hY+A8gCMY9GfaScg795XHx1sAH58PI/eAlS+aPxxXA38HBTk4xVe
         RRiPBd5lL6Nn+v87dhBSArm7Bj5FdzsXPpRMe1UavfyYYKoc/SzLdEYXgoDpp3nNkC+H
         cIAVVv7OL20Ves5T0DTegySBI1vjZqk9txi4wRw0x+557hRrzkjg83TBBXbQq/A2ktWK
         bGbStJlP4Dk1M1Mkx9qGRHm+Fm4Q+ufRhrqgHPvnjd43qybs7P1oM0FxNBeLeE0ckepO
         PC5ZVz8/ZYEZ23X+YL2wwKq82qygGxiFItSn0Rg4Y5DS4LGdEn3K8CR8/Xtnq6R7W7Jl
         atiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025951; x=1794630751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=;
        b=Y7vHGatcDoYhBkM59ySC3854Y9meIdtZFBTP9CW/U950aQsHnGjahfBocmQQn46wkt
         uv9Kw5jGWTymFGG+hw/QTtiMGBUcQjYcpUxGLEUx1MVStYpxoMC23jVnWoWMkkgTVFG1
         k/QLnIdkhOuQbb9fQtMwK7in4Yupi9QEv+wUYosshnYTVzgE915lfkYT+9zcM55ePfAs
         ok9tPOUXqLpUJQCrj4A4jkAfzNna6cXKLR8MqpjXLDRHlBCw6qI0T7Mp0znsDGQ5pWNU
         5rXau/F/s/Y/2coasdOd0bIlJ6onW6WZ296nAHQ6s1BgEzWIeRLrO+vdo88CuS1ZY24n
         3ewQ==
X-Forwarded-Encrypted: i=1; AL+hErERZH/V9ZCkz1B+fbUkDMT13+ZuhVrtR0dQDPMjamyOUYBt85ARyL688zYxKPjxBuALDMs6E3v4scM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8bQxk7R73ukXumPU6Yr7QvovRbGZes83WKyJ5rhUZfLlSP8YqH
	gqCisxKz+Ewf22eDD2IQSP1NkLrbMgPRicSaiFoOepY83XSFjEyhwJx5y+RC0K8Ik3k=
X-Gm-Gg: AYBFou33eZWa49e+xiff7sygl2dUle+CEDEN9EJ7XFpxq1PgFtDV/xu74JqjO8Oqbn5
	PD6mSGcmfko80q21LQcRz5LHKOFpkl5w831PxbJPC6kz73ZsmVeQUj21qcilrYtXN7o+i4Jc2SZ
	Dl1i122grFopMaPym+BL0dnSxO92sQ2FWi2iF+jbZsLpyNU2+qLhQPPmtz5vUZVcOH983/HwOkq
	M+7dYQsJcWKor/xk/zNRs9di47ISfqZhdc6jtVX3Kj+hne+9FcCrewjYiivfsc2uif9pwNnBdT6
	V8uWPJj1X6EBej3bMJTMyOK/0Wx5uTvBSKISxjNYNpbgXPGqSFAQYFjj7P57s2B0rFyHo/vYBta
	6ARWc1MLbtVmAdEfXL99d9/Lf+v8ddi4zAkx2A88vYUnD6yQ9+SEi0yOa8fbZt86l5pQZ7HHjW/
	mTiV8zC0n6JKz0NsK63zdkaZDDDWXTpYAGizQ+Kllz3PjYbEiQ3SoWIrfa89Pf8FEHCiWovtQ19
	npwoIV8UlAtXPHuAe3XbJSbRKeSWKyBiiKlllehL1LYigPxStDxnwU9JCYN9XxU0j+tPPYYY4ds
	xsmzytZ7KEsBCSM8+cwMDZRgQXLTHfCM1nQYMNwDHE05NgQx9KOuRaRr1fXKWL7pCs/lCdYpd93
	MIDHaoA==
X-Received: by 2002:a17:90b:530c:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3b0db71d480mr4559125a91.57.1794025951057;
        Fri, 06 Nov 2026 20:32:31 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.32.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:30 -0800 (PST)
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
Subject: [PATCH v3 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Sat,  7 Nov 2026 12:31:21 +0800
Message-ID: <20261107043122.25650-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
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
index 2d0b8a4c9974..43eb19474d26 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5385,42 +5384,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
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
index 22e5a322be0b..985a37dfcab7 100644
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
@@ -109,15 +123,4 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order
 
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
index 57aa5c2d8034..f6a8b8e51b6c 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -490,6 +490,9 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/* Altmap-backed vmemmap pages cannot be optimized. */
+	if (altmap)
+		section_vmemmap_optimization_disable(start, end);
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -717,10 +720,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
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

