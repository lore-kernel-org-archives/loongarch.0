Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7B6EA1
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:15:49 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5707b429540so62184737b3.1
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835748; x=1690427748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHkn+4hWn6cNWfQmftBQOtWQYQb9iJJIYcRZZNmu6iY=;
        b=pEoqTDJnBy0mCqMkui4NdE0+Cwn3eLpTYrB/bC5trNXcVXfSLt5Z5R8YIAYFQDP+fU
         oHaVR+r3yqYLt41ruRoFntv6iwVJI6k1WqPqr0CaczRFTmURyku+1Wh096jhdpaix/Yw
         TPjMea9fKHZjosCsh+ySOFuhqRhCq2RDcuYke4iWdPlhdEuluthF5cnNEQKZ+c5Hc7fG
         +fx7g6BPukH/s549n7Tu5GqJ8+5PFdtaVRB8v1bDc72Rwv3o28GHJ8X1zhRwfXU/u/w5
         Ysny8z2GqEVJln+w7kgofDjg2/U0lPQrPRqE+xKNvOs2VewEz52G+iOBPJ4WaFg8E+aM
         IwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835748; x=1690427748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHkn+4hWn6cNWfQmftBQOtWQYQb9iJJIYcRZZNmu6iY=;
        b=VGNoLMi3aI8vwFJHMK2kEkGLAAw8fk4ADcu2E4yUcsirynBB8lrz3CyG7bQDjy3yaY
         DQMdcxXCtgCDR808Hb8FosGHAns9cwOjusaXMA0CYRFXgeN8Tn0vr1bMnKVGcKQ7ImYA
         MxbV1RH+xB5sPrkZxzv/DeUrQryZI9rv0wKvrixxJrm9NQE3p860ssIJ/AHw927JfqT9
         a+OSd4N9XcQT8USGvUz4UrGupqKZB3ZtiSUgHNyToh5/wHX8Ae4w6Nz8ptBvOGc/OdS0
         OTW9rDYSVmjtHpblcswwUTrj3yPIhQltbEWBEhjhyZmip0Lug654eoQaeInyUleQspID
         uexQ==
X-Gm-Message-State: AC+VfDxxezO8P/gB6QtOPQo0HBhsi6hYOF71eNQ20QZQq5uFgBZjmMGq
	SQ/FavcI6MHjGJpq8duEcL0=
X-Google-Smtp-Source: ACHHUZ6p2ufkJSMv8EFIrIVima6CHOhkXf0TNdBTXqyjA7XsBDI65pfDIOBZhup550aSGjYhkYTA/w==
X-Received: by 2002:a0d:d988:0:b0:56c:e260:e2d5 with SMTP id b130-20020a0dd988000000b0056ce260e2d5mr41557377ywe.7.1687835748072;
        Mon, 26 Jun 2023 20:15:48 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:47 -0700 (PDT)
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
Subject: [PATCH v6 19/33] arm: Convert various functions to use ptdescs
Date: Mon, 26 Jun 2023 20:14:17 -0700
Message-Id: <20230627031431.29653-20-vishal.moola@gmail.com>
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

