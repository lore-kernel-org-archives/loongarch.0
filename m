Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1081F172
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:05:35 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-56d05daf0d5so24883777b3.0
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603935; x=1689195935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVp6CEv5MRUGdp+2H8Cti9WenGhaFTTbvrfHRtAH9kc=;
        b=SoTIqHuLCAWfEiaWrP9H5RMeBUfw/4blxWiNTbN+EgENMXgximV8iyAXgGOp4XDuw0
         D58PnjKgFper5JHCNJspm8td1YpFLE0wlV4KRGzp+/fPbBvQvEKYiEzI6FQgDegSQMJA
         W98fOojhxmIMYwSI3q765OUKGKExSDNbpRlItg5xCIvhjN0428xf4HNUJQQ5P+6zPMLU
         Ma3chacqOtGRi3R200/qVHAxMt5ARo9Z4Ra2qg/4Z+GPUMiMBJG7HmJrnWozDqrgtVLb
         PcdJ9jNUuMMACxveQJzaFtzM2eOsEwEww1xM2Q56gVCjb83OZCynZYnfeNSiDloj+NNW
         ogTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603935; x=1689195935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVp6CEv5MRUGdp+2H8Cti9WenGhaFTTbvrfHRtAH9kc=;
        b=K1VOKzgQsa8AVxocsDV4DJLhb330RMsl1rTY3J22D99wmu7zmljYBZn4JnE9GykWer
         ddEZmhnkgybeFxjV5llRxmG+SSe3DuOLHAccfE4iYpbFvVJFNg0NJ/lAqmPBnnpDI8gg
         oUJl+RwYPj+V6ybJPPLhhP+p2QGL00w3gc6syry4z82enC7WrXNBWpQf5a7xoeMYRqtH
         kvr/TX7XuMVjNQaeba+tCqOIZx/T/PYtb+A8W0m0FgROXs2x154zRW0vNY1PUE0bs0OI
         yMI21R3aOSdRGiPUiSfK1fsuWXLIpGFuob1SUlBYdGR/50lXfebYJLgLoqBbkkXbJXgY
         tPCw==
X-Gm-Message-State: AC+VfDzDKlJmJfWfZ1eMD8klCuVT+qldEHyDz00GpXWCVeSFHd7WZ3GB
	iNHKDmRzIV+XdG66ECUMiQUShAO3+vzihA==
X-Google-Smtp-Source: ACHHUZ67Z3iEzfMJBv1FKsvF9wmF9wb7PLhtVh2H16srVVINddDnAoJ1jY9AaH4fP20t9BaRYfthGg==
X-Received: by 2002:a0d:c7c7:0:b0:568:b10a:e430 with SMTP id j190-20020a0dc7c7000000b00568b10ae430mr10170669ywd.25.1686603934783;
        Mon, 12 Jun 2023 14:05:34 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:34 -0700 (PDT)
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
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v4 24/34] loongarch: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:13 -0700
Message-Id: <20230612210423.18611-25-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/loongarch/include/asm/pgalloc.h | 27 +++++++++++++++------------
 arch/loongarch/mm/pgtable.c          |  7 ++++---
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index af1d1e4a6965..70bb3bdd201e 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -45,9 +45,9 @@ extern void pagetable_init(void);
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #define __pte_free_tlb(tlb, pte, address)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), pte);			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -55,18 +55,18 @@ do {							\
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pmd_t *pmd;
-	struct page *pg;
+	struct ptdesc *ptdesc;
 
-	pg = alloc_page(GFP_KERNEL_ACCOUNT);
-	if (!pg)
+	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, 0);
+	if (!ptdesc)
 		return NULL;
 
-	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_page(pg);
+	if (!pagetable_pmd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
 
-	pmd = (pmd_t *)page_address(pg);
+	pmd = ptdesc_address(ptdesc);
 	pmd_init(pmd);
 	return pmd;
 }
@@ -80,10 +80,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	pud = (pud_t *) __get_free_page(GFP_KERNEL);
-	if (pud)
-		pud_init(pud);
+	if (!ptdesc)
+		return NULL;
+	pud = ptdesc_address(ptdesc);
+
+	pud_init(pud);
 	return pud;
 }
 
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 36a6dc0148ae..cdba10ffc0df 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -11,10 +11,11 @@
 
 pgd_t *pgd_alloc(struct mm_struct *mm)
 {
-	pgd_t *ret, *init;
+	pgd_t *init, *ret = NULL;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	ret = (pgd_t *) __get_free_page(GFP_KERNEL);
-	if (ret) {
+	if (ptdesc) {
+		ret = (pgd_t *)ptdesc_address(ptdesc);
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init(ret);
 		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-- 
2.40.1

