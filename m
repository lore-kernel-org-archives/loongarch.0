Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607CE22548
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:55 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7624679c9c4so545979485a.1
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467534; x=1690059534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VT4pshsioiI3cvxCaccwxS3QnyiZywL9n+n1KwplTM=;
        b=TppJif0BHo6hnPlcQL9KC8WSGCLNYWnZ5TWCUGNi9Yse0euGomuzrLUl2hHWg+xOcN
         AtrgkmMfCUjy9KLBFfUuEG2s0Ihpe5FTyr5metIKFf6zbktuYMraC91YUKi/KWfbgyVG
         lvJTabP9ygpBud7nE/7yiG7FvQtoPgmdiRSK2sy5kuq4cEPaMRzkmi7ezbneoKdvpKLs
         RzOr7Yyw6OYIFnxYXzw+JpXxuwUJk+Gv++J63O8G6cjfEEYoESBKv3QgdI5Gny8Js2Dl
         u397T8c8ML9be3fyfcRz9z/KIcbHqeskiUObgkxyvqYvJ9bImtnagHyVKviaetoXJ3oC
         RmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467534; x=1690059534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VT4pshsioiI3cvxCaccwxS3QnyiZywL9n+n1KwplTM=;
        b=W7ODemxyj5M4nzsyOdeGN6+4tANkXflpyLe2mCpHR5OXI66glSWJMPfOFfuwlRUJ+s
         2cGO6wSdw3xFvuXWEiP3hPzBHtWC4tznwqBY+B6cuJD8yRI/wIKHHUVcnfvwLriApbXh
         0WAT+kyczmRUSdW81ui0+8WatOw5C9B5lCxZ65XTzjqjR/+PCXczCBiRSjUkXzhghQ3f
         wef6fFy45YF49p1FJSiNavPKl31qHAq9yIzm2szvVEUwtTjaSnfVXYQ9E6PcZx6UVLwP
         QmRWI69qU1Gt4LBd/9W5XbV5A8TqEn/8C9hBl0QjfDAEroZHHDOatCD4IjeS8Y3gv/8B
         ZQKA==
X-Gm-Message-State: AC+VfDy0SqDDG+3hwd5XbbIBR498AQ6z3XQ+Y1KO5etyqmOfVdcWvyN8
	uKF/6TKaRSf+kahygspzqrDNEmYTEUOBlQ==
X-Google-Smtp-Source: ACHHUZ4bdUBNX+PQFkV86pN6qHx4P8fCpAOyeLEg1MMh49m7gk0ETU/OT0t4ehwniJxuP5YNErTIxg==
X-Received: by 2002:a05:620a:2455:b0:763:de2c:1a8a with SMTP id h21-20020a05620a245500b00763de2c1a8amr6902545qkn.57.1687467534343;
        Thu, 22 Jun 2023 13:58:54 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:54 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 28/33] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:40 -0700
Message-Id: <20230622205745.79707-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/riscv/include/asm/pgalloc.h |  8 ++++----
 arch/riscv/mm/init.c             | 16 ++++++----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 59dc12b5b7e8..d169a4f41a2e 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -153,10 +153,10 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-#define __pte_free_tlb(tlb, pte, buf)   \
-do {                                    \
-	pgtable_pte_page_dtor(pte);     \
-	tlb_remove_page((tlb), pte);    \
+#define __pte_free_tlb(tlb, pte, buf)			\
+do {							\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
 } while (0)
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4b95d8999120..efff9c752fcf 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -354,12 +354,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pte_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pte_ctor(ptdesc));
+	return __pa((pte_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pte_mapping(pte_t *ptep,
@@ -437,12 +435,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pmd_ctor(ptdesc));
+	return __pa((pmd_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pmd_mapping(pmd_t *pmdp,
-- 
2.40.1

