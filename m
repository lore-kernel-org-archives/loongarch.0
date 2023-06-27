Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1667AEA2
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:16:07 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-56ff9cc91b4so44758627b3.0
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835767; x=1690427767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VT4pshsioiI3cvxCaccwxS3QnyiZywL9n+n1KwplTM=;
        b=BTT3Mzd5pMJTg1qQFpEMV1yFnXFEE6dhiGZIFIlGfqbhlgUNcX3lP+0Xoq0dD8MFSr
         RK3vHi5QnyAo7T8lNR0m2sSqGWtPBPRWNiWjHN3rFdDhGGO7T9MFTERmHBgNR4sgVMS+
         JUT/NdTfBaBAKs5kycCS3l/TBhEAp+C90btW4rno0I/EAboZKF9q6wEak2gDddjsGCi1
         q2GUAru2ftFNSTo28kLQL6bJa4wXILET/IeOTUMnQplkR5BiuM2QbQkizw1eBdbmDbmG
         65E54NzNO8/RkUogmqdZk7khZ+p+IpCeUb+CDcGS40pgjK7sLmx4u40SPJ3RJUKs7fxl
         Kwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835767; x=1690427767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VT4pshsioiI3cvxCaccwxS3QnyiZywL9n+n1KwplTM=;
        b=Qg7sgd4wjTZxxLax28Tjg/sJuh0qZzqfBfnPd/QIxcTNQGzMffwurNJe9cc+cz7XLD
         zfQGew8LROx47e6J/J6zQEmTVBAZclO8EML4iX8fWl3xFNGrDRnUqQIr5DvumvMe6GfE
         adiJGdim5VUwpsVBdEpGa7JLszqyIVVoY/v33qnY2QykY6f7gfZC+5y+NEL9pCK3OGWb
         VRFAdncVmSempVjL4tET1cx8n2guB5k9eZB3TOAYCMXjU8IP3kOhRvJGO2Kq0+9qAvNe
         uAnu+/RLJDhTBaa0UY2HxnRrofXXwJEkhhM1jEyTBaMHslYrPBW1zIFglsLi91BKfjgU
         W1lw==
X-Gm-Message-State: AC+VfDzTpwiFmlRk/b/8pzkSVXiacR3ZJH1s5CDoqbp3oVIqHjT2W9LF
	Y8vNtnt6FJO/vDndEm25MzQ=
X-Google-Smtp-Source: ACHHUZ4rZA4ZO6uIUbBCVKZtf01FpSGP007O6nK+owIo75GKh2wlbCSJx7/xiS4iS/AR11yVX11PjQ==
X-Received: by 2002:a81:6d53:0:b0:570:6665:4646 with SMTP id i80-20020a816d53000000b0057066654646mr37647298ywc.1.1687835766960;
        Mon, 26 Jun 2023 20:16:06 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:16:06 -0700 (PDT)
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
Subject: [PATCH v6 28/33] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:26 -0700
Message-Id: <20230627031431.29653-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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

