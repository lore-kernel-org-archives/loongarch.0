Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD82B1D2E2
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:04:31 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a425ef874dso3603597b6e.0
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823070; x=1691427870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wtNkjiFE1rjq7ZRDFNmpMqdu/3EA/QyC8BNR6xlaRk=;
        b=jDHhLXZJRXD/xeYPjUKANAGx7mWI4rG2vR3tiNn5nmibHzSYtMioLibanq9BMakzzx
         Dc40uVduQvHfbEsvbNTufmD3fXRl+TcWbOzDp0kgO7QuCTykCE1j+HK6n3jb1sqe57XF
         7xsPytJhE4yGGkRfFmDQz1HzLuGW2ZTo/1EAyxe33p/FghCyp57Hsm7Uzya8S5xLQJaT
         ueIYolohxESLEyhmxK2PHze+l/eyVpSLM0kum/QRULVrKh/GfSQvLlze6Gzlo9GlB5fo
         iazuqOSyOZnJfKQ3WX+zpbxyRMiNA23MCvyV70vvY+gHhKrbl8nHkjOrciNugWyCFGqp
         7t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823070; x=1691427870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wtNkjiFE1rjq7ZRDFNmpMqdu/3EA/QyC8BNR6xlaRk=;
        b=dkeLFHqB1qqmQfyEdlC8Bfy+UqgPBoXdJsLaGcFn3iLv8or3YDFyKAVv3qrYE9iGCy
         o7gWbrnZUTGhWLvzDUd/9Tb60F8RauGqF91RwinYZcV6wLxJl4L2aupxbX2rE0ACmzmJ
         vn7W2JjB4NdcETnFLHBKyYCu6F931vvIqz+bIukxYhlnnPxg/uRnIq7/yW0yrx6zl0lQ
         zfLDygA5FobvzeZo+OHQiEN40xk79TX9MWMXpJLhCHe/5A1CYg0FvZIzkNAAR85f2PzA
         L2Wy6EZG/ksML6CJkDhnj4l5NpbvjL+kes+FigPpavOnO6ujwUbUSHxXU5rwo9vbQaQ8
         tWnA==
X-Gm-Message-State: ABy/qLa+rOeoEdJs+g+IE6uwZnzq01q5Iqy4mrF148dHuNRMAZirEW1Y
	TI3yzabGejUMP7ew8jKdbeI=
X-Google-Smtp-Source: APBJJlGObInRwlJ0AwNAJnouNbrDrDtHWtXxAKPp84WJFWn9NE838Pa2gI3Dgeu+TYrNO6dbsPWj8A==
X-Received: by 2002:aca:2b03:0:b0:3a7:1443:f4e4 with SMTP id i3-20020aca2b03000000b003a71443f4e4mr5616696oik.44.1690823070647;
        Mon, 31 Jul 2023 10:04:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:30 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 26/31] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:27 -0700
Message-Id: <20230731170332.69404-27-vishal.moola@gmail.com>
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
index 9ce504737d18..430a3d05a841 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -353,12 +353,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
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
@@ -436,12 +434,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
 
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

