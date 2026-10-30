Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369333;
	b=tWqxSRoyQYyfjKnEo6w5jpxu0sjL1d2y1y/Ak+MUZ+k2sNnUVKj7Q5aoVPl/paPM198s
	 tCappB/+n1NOA/ht9MGS4jceViZoEcmKb5p+jeYPSv6Lvx0U5O8PWYjdvEy/TAz6zi9mk
	 vErd3VQ2AR5rKrFe6WMg9g0zUxY8f7noOnSQACxlL5UbAMTGQ3ACLgrsfUZPa+moiLhZr
	 /nCuerfTTxlyUhe1EU+ZBImWpMyz3zq0WOQ5UreO+DP2kA8yd4ZD+mw++TiZcvAj8LsXO
	 hv5qnV/LCc3pIg4LSHGlw8YUim7jN1fjcvoPEnkDaZh92+hDdJsRbcdIKU8DDkay8lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QjoN4+6LqE6BOGR2vrR9uNSgacxzY3BRDUxvEZuPaiQ=;
	b=nJ6j1bA+KKCmAb6oPqHgKaNoBA2lCPFc5NFuY2xTSwUmPV4Z5xcVm2rRtn91LyReraMu
	 +Mk6PhpPyFj609KwjXQB+xISNRlP5vE/3sPs7cVH3wZzVyQDBbdKEVFrq8UdGL1vMsYvS
	 NMDlyJsj0eowFkLNHveOORDPcxH4+TIN9U7GWOGn2uJu2Nz21JMY3fsmjgZ/q7YOuVj0H
	 JYciT/MY+G97XHJ2hm6RlySwuw6LdXb/QTSnrW/9/QdKfmJ9Ix2/pJn24yTUWm3GkSg0L
	 QwG3z9jN/21IdZjRC6CYZlR1RS1yjfjhbkO56So8MkhKt/wWubzbFeFQ0mLm9Dn3dng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=W4LxI7Kg;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917C606A31F
	for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 14:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B917C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=W4LxI7Kg
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e946155442so6579425ad.3
        for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369332; x=1793974132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjoN4+6LqE6BOGR2vrR9uNSgacxzY3BRDUxvEZuPaiQ=;
        b=W4LxI7KgYs0LmX/ivbd0gAHOKjFMKkgH6ILV5kqU4bSYzodjIpQnTJgg5HBSdhJoMA
         gsgyTHIhxQ0g9UVwYH6R6t3M+o3rlUMpR2uOEx1FZyRTJ5YOGykCYiEvMQL3ObBIQSS5
         M6Z7eJjqYKv5GDjINlt3nOaFF2dNA7Io/njP3C5r7UX6upsmLi4H9NAn7wK9+2H39U+m
         1kQ7PVYyVEkzWpp+3I0hJuOWT3Yl3FG9e5tKflrle3uAWiTlJZeje+k/5a57i7sp5sCt
         pxjf5UfgELdxM06tGGhQo0Rbhqm5XMx2x+6sK09xJgnUmWflaQhwyJJLBvH58/CPOu2k
         bC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369332; x=1793974132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjoN4+6LqE6BOGR2vrR9uNSgacxzY3BRDUxvEZuPaiQ=;
        b=EMIlzgnMd9BnYA0ZKj8wYJubv773U3mdG6OXej8Sii8EF8xAEqFiYi6Xvolkb57Gel
         yr9ILPOhq9sZIF2/oKQLMRcgNTGdGrFLdKzEl9yTA1p9IQVgaidzT90pK4ybEwPYCdhQ
         +FFLLt6rKizj+n7KSHX7w2kLdNgABi1tLTDQH3tt56Ju3CHkXgVnBmHGCN+HvSHmaAB/
         4Jjw2m8NOluTiBlrEZR0SWXxQdhL1m6330Tv0AasXDC3VMZf6bOFqyrUayFZpBnBr7U+
         qoKFSG197YZiip3lceNvHLAInRDYuOIP32MhMfW8fsmeWndYxhcc60PAbP/+38Jp95D2
         dNGA==
X-Forwarded-Encrypted: i=1; AKwUvBx779zWBfmnGL0PdM6kPEmixTVTL3aYnlbA6FJZMUMCaCqMNCBHXGh7+iEEDAMLsOnd/Cfsd6/s3Lk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLI3COA6BNvzGvUFkjKsiCMMsFXcu8tQHeRV7f/cWdAIbgjTUVa
	7Gl2+9YVRc4BuS5adQTf+uH82APIJSNvSoW4pJLOAjHhNR79o2psgrk92ltVj9agGUw=
X-Gm-Gg: AYBFou11fwZ2LkwX1zRNQfotTDrqgr+mvBIpri5tSW379MZXBSBUzgB/S7MUdIplkms
	88FcTs4NR1d87lHMAaW0B6fmrlY4pNLVuw0z++/kCOvv1mdXc+7UCjv6iBAAOoQpdkRBkDOhny1
	ml1kEnjhW9rntjh2EdhAIT2TF/LPpB9lfpNVTwN/f0gkzPc/sAELe5eA3mr/6B04lAKUvBD/zH0
	cYDg8gCvOhtla0/Os9a/sfBtuteGKn0T7HQDazC5LNRTQ2i/s6jod23coi8BSprwY7OWk23nls2
	auoebrnnqD7tx1Ue5J/Zjf6Whmq5q4dyQMPzxc9ru6rJjUkfUdnbOUOJpi1MioNDaTHgrOo4Wu6
	HA6IZU594us1H9XFdNOx9oHBFaNM4sBIEuGBXVQQLh5ktCZX/CxiAcMLXX2HHx/w2gBbKt225X4
	/YsFkVsMCKUj9IoghSACS8yBgUayB0h9AefSxCOBt3jwy7TjNqG+YCfdv9PBbdBqeOe1QIBMIgo
	w04y8jsv8f+koJ5zUKHhDuOnVmjMmrPK+bu0DgrGjngy+lPfwpRQRdlKM3iwCY9Apd3or7oW5MG
	4dmwx2mXos1wDL7KD/m1XpMuTiZ3lB5wW3xBEWjP3DwnecqIBRDnSKOal1BbrsVfsUQLMGmE
X-Received: by 2002:a17:903:2f03:b0:2e9:4f7b:affd with SMTP id d9443c01a7336-2eb36415069mr25082595ad.6.1793369332072;
        Fri, 30 Oct 2026 07:08:52 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:51 -0700 (PDT)
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
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 3/4] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Fri, 30 Oct 2026 22:07:19 +0800
Message-ID: <20261030140720.1256062-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
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
 include/linux/mm.h  | 37 -------------------------------------
 mm/sparse-vmemmap.c | 11 +++++++++--
 2 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e875f73b0c6f..4fb48fbe712d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5395,42 +5394,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
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
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 3e9d6617c4bb..43559593107c 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -466,12 +466,20 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 {
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
+	struct mem_section *ms = __pfn_to_section(pfn);
 	int r;
 
 	if (WARN_ON_ONCE(!IS_ALIGNED(pfn, PAGES_PER_SUBSECTION) ||
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/*
+	 * Vmemmap optimization is not supported when vmemmap pages are backed
+	 * by an altmap.
+	 */
+	if (altmap && section_vmemmap_optimizable(ms))
+		section_set_compound_order(ms, 0);
+
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -699,10 +707,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
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

