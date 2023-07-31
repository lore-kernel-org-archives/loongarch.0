Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB9A1BB51
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:04:13 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d0728058651so4980563276.1
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823052; x=1691427852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHkn+4hWn6cNWfQmftBQOtWQYQb9iJJIYcRZZNmu6iY=;
        b=S9WpMAU4z7s2Ag9JtWlTuDFooWQlFyPv89tIlGGSbz0E38KMeV4JUqyRKP7B2mlsst
         3/F+7yoyQbv3i3KcMwuVSsZv9i7LAi+BdMh8bqQ1OIkDFwNfq0t6pWYwMasYC2CpjBTn
         bovNcdPK8kmT56us8VfFMktVF9KG2tmTn5UTLjX+ZXj2DR3oFDYqVFA7hvTFAXfeR6X5
         Q0VEEuNVDIcDX6dTwPvkDuk+ca9lyAO0oa7PZRgQNSWYVbj0QEi1SCUj2cu+UiTNTCrz
         l0MpQh+abPw7+Fj+nKTUpgwidBjEPvlqq0Mg8+dCJJ46uHZsBMSboAizdy+gmVRglE/z
         7Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823052; x=1691427852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHkn+4hWn6cNWfQmftBQOtWQYQb9iJJIYcRZZNmu6iY=;
        b=aiyNCnUkBunDWe3JyQdoE+ivhAR63GAjyRig+ty1N/J9iv3mNVZVXJ0OD4vwUGnP6e
         mST2S8znZG/av/Ka3a+J2Vs6NZZYYvyXNx39ZZonRErQXbn+EdwwVORi2iGOWmPWoP9q
         v5XMZ6+Z2G8q5VFEvIort4QhS7p7qSPL/EB1hR8L/URayIo0AIW8IoOfqKLXWNZ/6VcN
         R19oe9cVTvnXWcLlCX97y0caAdV7hSOekMbL7g/DJ3G7Kn4zry1+XcuZHig+cPbgfu5Z
         IYj8N8ygQsooMibfwNE+akTQpTI023Xl1tU4LADuuceHG0BS3Czd3vGvuVmKkeHi9Fc9
         QGPQ==
X-Gm-Message-State: ABy/qLZkZ4eTNhJ20kw0KqRTwuMnPQYWudwQjhQl4KuJoc183AuLQKU5
	9AdO6nzFbGEwR1euMaY82kwni1tCpgRoaw==
X-Google-Smtp-Source: APBJJlF45VM+96NADPgQk/bfcoyXe13svaytrCoN6xBKbPq7ENGGS7BXy6U+VNxQQfsm+MAmj6JoEQ==
X-Received: by 2002:a25:b296:0:b0:d35:cfa3:cbde with SMTP id k22-20020a25b296000000b00d35cfa3cbdemr1080223ybj.38.1690823052039;
        Mon, 31 Jul 2023 10:04:12 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:11 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 17/31] arm: Convert various functions to use ptdescs
Date: Mon, 31 Jul 2023 10:03:18 -0700
Message-Id: <20230731170332.69404-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

late_alloc() also uses the __get_free_pages() helper function. Convert
this to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/arm/include/asm/tlb.h | 12 +++++++-----
 arch/arm/mm/mmu.c          |  7 ++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8cbe03ad260..f40d06ad5d2a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -39,7 +39,9 @@ static inline void __tlb_remove_table(void *_table)
 static inline void
 __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
-	pgtable_pte_page_dtor(pte);
+	struct ptdesc *ptdesc = page_ptdesc(pte);
+
+	pagetable_pte_dtor(ptdesc);
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -50,17 +52,17 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 	__tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
 #endif
 
-	tlb_remove_table(tlb, pte);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 static inline void
 __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 {
 #ifdef CONFIG_ARM_LPAE
-	struct page *page = virt_to_page(pmdp);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pgtable_pmd_page_dtor(page);
-	tlb_remove_table(tlb, page);
+	pagetable_pmd_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
 
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 13fc4bb5f792..fdeaee30d167 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -737,11 +737,12 @@ static void __init *early_alloc(unsigned long sz)
 
 static void *__init late_alloc(unsigned long sz)
 {
-	void *ptr = (void *)__get_free_pages(GFP_PGTABLE_KERNEL, get_order(sz));
+	void *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_HIGHMEM,
+			get_order(sz));
 
-	if (!ptr || !pgtable_pte_page_ctor(virt_to_page(ptr)))
+	if (!ptdesc || !pagetable_pte_ctor(ptdesc))
 		BUG();
-	return ptr;
+	return ptdesc_to_virt(ptdesc);
 }
 
 static pte_t * __init arm_pte_alloc(pmd_t *pmd, unsigned long addr,
-- 
2.40.1

