Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FABA94D
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 20:53:24 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id g6so10327718pjx.4
        for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764804; x=1684356804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzUB7crKqn7Of69Iz0IiuKaVcaC8bpzNVtqjj02cJJs=;
        b=CQxyKkc21JMWEGZgaxo+DzkT7hmUe/EPeRLNy9307TK3NRBVO8qYFVHUBh0a+wrrFK
         REDRofZ4pQ77HB/xKTTnWP/BT1cyKC/pHZN9NhEm5iKL1tflp83IUSNn/z3JIjWng98Y
         6RfpzxV5XfPWxGKOX4DdYV/wLmmlXNt332CwEYLgb9fOwCusASfTkzDGq48OmDuUGGpq
         tIsA4gMM5D4jkK0NC3tYS5RarJ0ZWQtkI1tM39+DRuLci+gK44bt1F+fDRaPwS3T5T9g
         S4uLRylS37AnplaeXGFnk7T6Qzad8RMawrqwBO6UKOhHtptnemCZZZWNN4xJh7uqqhEQ
         vrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764804; x=1684356804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzUB7crKqn7Of69Iz0IiuKaVcaC8bpzNVtqjj02cJJs=;
        b=FohZJEJgBuyV5Z9P8eGfZskgMwiHTQis9A1XrsadHTGplYCf7EiJbcPDHKdlwevtca
         7Nx7ZflkO2Fd6tlpKFbOLoDGbz9UME6eTtR2cEC1FjHd9UANZbnbMu5lYeusC+wRI5u6
         BCF+r68nW8jyYqOj6+14KeW0xbdIaa/y/bbkM52VPlMIEqM1Q0Ptb9CW7rHWkl1XY66h
         3I0NK4v8Z/osx8rpzBBU1Kvr2Vj2yv8X+4km0IrZqh9150v4wEBriTs767UVqvWOO2sq
         ZzecaeeRC5YaFFVcDnVo97IAx+dJ8KqwEwnR0mDfRL3vPDEUjJZB4aCFjB330MDPazdl
         YRuA==
X-Gm-Message-State: AAQBX9cUxfrHOHLcPHs5YK2ZC7/3mroPNprCD0H5DInr2S9ftUMbQRc5
	yUcWnIxfS1tWPigAd0g3u/A=
X-Google-Smtp-Source: AKy350avL9PdXaEjhmJuV1ybk5n54BLKq2822oDesoZKEo2GpNTKDMiGoy71eNPEPZjYfA/nM1qr3w==
X-Received: by 2002:a17:90a:1286:b0:246:bb61:4a5b with SMTP id g6-20020a17090a128600b00246bb614a5bmr16053424pja.8.1681764804243;
        Mon, 17 Apr 2023 13:53:24 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:23 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 28/33] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:43 -0700
Message-Id: <20230417205048.15870-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
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
these to use ptdesc_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/riscv/include/asm/pgalloc.h |  8 ++++----
 arch/riscv/mm/init.c             | 16 ++++++----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 59dc12b5b7e8..cb5536403bd8 100644
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
+	ptdesc_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
 } while (0)
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0f14f4a8d179..2737cbc4ad12 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -346,12 +346,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pte_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)));
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !ptdesc_pte_ctor(ptdesc));
+	return __pa((pte_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pte_mapping(pte_t *ptep,
@@ -429,12 +427,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !ptdesc_pmd_ctor(ptdesc));
+	return __pa((pmd_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pmd_mapping(pmd_t *pmdp,
-- 
2.39.2

