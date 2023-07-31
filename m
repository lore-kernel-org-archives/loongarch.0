Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A691BB51
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:04:15 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-cfd4ea89978so4976656276.2
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823054; x=1691427854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1W6z1I6yvWrQZbHmgHYBEGZZDstSbvELOPET/EcKlKw=;
        b=DoLYDaRBa41Zdh1yGELvr4mktDPzCr5wZMtfaOFQzQ5hTcfRkcfNo2gxzOD+0/ykOM
         euBOcnH4+UQlm104MdM8Mcd6Wd+0oXQ7r2d8C7k16OxK93xpXJQ9cxidNEnw+09+Tsgn
         4MiJbaZ4azooZbJym/w2spQi4ZLNoUGyQvzF+yt3P/maH4DT1bEGYtqh5RJ+6A+RSiNZ
         F4VZO0F3scHf9jVdMvyffz9Y4Un+dZzmqLUFBUExZqr5BTOKTZ3vKrNuYiRkZjRgx8qM
         A0v2BAwmzAgXUoHV1OBdUh/BQxSYjg1Y5Vc+ifw6djIqa1GbEqCTgLRTuyk3SSeDHWhN
         ZcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823054; x=1691427854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1W6z1I6yvWrQZbHmgHYBEGZZDstSbvELOPET/EcKlKw=;
        b=Ko0F/UMPoAiAbL2WMpaLpvE1Qn8VWKiOvKXpS4KgMlVg8/+kN+gjYSanaaCgAaIu2B
         qXjg1DveCrTLWm4IEZmqucq4YiaUlppx5v2my2bDI94sLpU6gBWBYXCzEKKcZL+f5W4H
         SPb3hB5z8p9cs1k3o1SX1N4sQrxVtpjc6McPokFULiu6SeuI/h3sYEbWXEYHabfZV8X9
         YcemCHfe0KLPjXn+GAAB33bwJp5TGUIjA7AvYITH25h5sH7R2BLZIcdDaoUnxeUzjhk3
         W/01w8i99KEYGg/Nw2ksfdTf8YtGc4vG1nouKcGL1xR4L+bFHrJZ732RGe0tKKMFPjK6
         UNcw==
X-Gm-Message-State: ABy/qLalSnl999d1tXp+bTg8duFKUJxFrjUJZTF2UXbCh09PorKDxbi3
	BNH8u/UK71KM8cMYS8VbZvs=
X-Google-Smtp-Source: APBJJlEdpRjJyqAaQhaJuPKqzpefz2AFbwFC7sVhDBH7lQjGs0g9KoyKRkFSzeflgvIaUwqu4lunqA==
X-Received: by 2002:a25:b08d:0:b0:d11:2a52:3f35 with SMTP id f13-20020a25b08d000000b00d112a523f35mr11488364ybj.20.1690823054136;
        Mon, 31 Jul 2023 10:04:14 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:13 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH mm-unstable v8 18/31] arm64: Convert various functions to use ptdescs
Date: Mon, 31 Jul 2023 10:03:19 -0700
Message-Id: <20230731170332.69404-19-vishal.moola@gmail.com>
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

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/tlb.h | 14 ++++++++------
 arch/arm64/mm/mmu.c          |  7 ++++---
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index c995d1f4594f..2c29239d05c3 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -75,18 +75,20 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	pgtable_pte_page_dtor(pte);
-	tlb_remove_table(tlb, pte);
+	struct ptdesc *ptdesc = page_ptdesc(pte);
+
+	pagetable_pte_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 				  unsigned long addr)
 {
-	struct page *page = virt_to_page(pmdp);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pgtable_pmd_page_dtor(page);
-	tlb_remove_table(tlb, page);
+	pagetable_pmd_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
 
@@ -94,7 +96,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 				  unsigned long addr)
 {
-	tlb_remove_table(tlb, virt_to_page(pudp));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pudp));
 }
 #endif
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 95d360805f8a..47781bec6171 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -426,6 +426,7 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
 static phys_addr_t pgd_pgtable_alloc(int shift)
 {
 	phys_addr_t pa = __pgd_pgtable_alloc(shift);
+	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
 
 	/*
 	 * Call proper page table ctor in case later we need to
@@ -433,12 +434,12 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
 	 * this pre-allocated page table.
 	 *
 	 * We don't select ARCH_ENABLE_SPLIT_PMD_PTLOCK if pmd is
-	 * folded, and if so pgtable_pmd_page_ctor() becomes nop.
+	 * folded, and if so pagetable_pte_ctor() becomes nop.
 	 */
 	if (shift == PAGE_SHIFT)
-		BUG_ON(!pgtable_pte_page_ctor(phys_to_page(pa)));
+		BUG_ON(!pagetable_pte_ctor(ptdesc));
 	else if (shift == PMD_SHIFT)
-		BUG_ON(!pgtable_pmd_page_ctor(phys_to_page(pa)));
+		BUG_ON(!pagetable_pmd_ctor(ptdesc));
 
 	return pa;
 }
-- 
2.40.1

