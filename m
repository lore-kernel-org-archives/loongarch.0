Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6455EA1
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:15:27 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-576918f4cf7so32409667b3.3
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835727; x=1690427727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRcW1jW+95PozpJhE7MOWGztyyXp9a8KAqI8T3AvQGQ=;
        b=pvA/vO4MDeq4kIIhsE3yrV9+ALefWilKkLuNIgHhecd9VDeKpQ3CrB44RRLXN/wH9a
         v+3v6EJOL2IcXShzxOvXaOjl2qaDyEgyn03s8SsAgafbqCa5mGXGEFvhH716JQIAT0SC
         QEIWs35jWLlJpDE0C433qu5q7ESJ8UkDS3w921ZCRctPmdDsHkPUrtmlpYzw5VwqW3do
         SQRdIAIjkZikdiXvEEkKtp7sFgpQSLF0GRJH1HdPtksJU7st37GWKQiDw1MyawGMKHo0
         s5ztl+d6CGvn0kzD8aZyh2iX1osumXcuHPhisUrTXBEX0Rdvq7Iup64Z2b22TeYu/gRr
         mzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835727; x=1690427727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRcW1jW+95PozpJhE7MOWGztyyXp9a8KAqI8T3AvQGQ=;
        b=PFoGUJulIRXaKNNZf3ENAro4cpvKK05jTQmMBjlV31ZisR6bE7olSKOF8qpwn1csTQ
         8LWtz4nX/WVQf7Pwc/MaUuWB6Zbj7g0XxdKX3iYxx+kXrTTOltjVD5nM01SKfc87SP9/
         puqB8h+bKvOQYccHd8tRPmldrgbS1fkmMrRbYfPH4vqVMD84kD2TLYtYj/EzSW/hCkoA
         r9DlroH/bA/LMFuN07MwTCHlRLRP8heWg+eAzwuCZFaAYmWeWyagikUV03mvXJesKbqi
         mtLOxlZgShigNxXWz/nqEPb7D7jwsbJmswe6fB5Z/9fehKYaPTwxM9mIyxprTONgncaS
         SfjQ==
X-Gm-Message-State: AC+VfDxwR3OXgF4qGPtIPgk1kFu3Ltgy4hfGCtwX8j32FLJBgtl7fblC
	UdRyMXYvsXp/xfZ6++fnn/c=
X-Google-Smtp-Source: ACHHUZ44nBppmQGdd8zdkRU4D5yhqKKKAoy0EjGlUrIReqb1/1yiuyQcU5hRXay6VI94GfMmMF8RKg==
X-Received: by 2002:a81:c203:0:b0:561:da0d:6488 with SMTP id z3-20020a81c203000000b00561da0d6488mr27417977ywc.50.1687835726781;
        Mon, 26 Jun 2023 20:15:26 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:26 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v6 09/33] mm: Convert ptlock_init() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:07 -0700
Message-Id: <20230627031431.29653-10-vishal.moola@gmail.com>
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

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1c4c6a7b69b3..4af424e4015a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2830,7 +2830,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
-static inline bool ptlock_init(struct page *page)
+static inline bool ptlock_init(struct ptdesc *ptdesc)
 {
 	/*
 	 * prep_new_page() initialize page->private (and therefore page->ptl)
@@ -2839,10 +2839,10 @@ static inline bool ptlock_init(struct page *page)
 	 * It can happen if arch try to use slab for page table allocation:
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
-	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page_ptdesc(page)))
+	VM_BUG_ON_PAGE(*(unsigned long *)&ptdesc->ptl, ptdesc_page(ptdesc));
+	if (!ptlock_alloc(ptdesc))
 		return false;
-	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
+	spin_lock_init(ptlock_ptr(ptdesc));
 	return true;
 }
 
@@ -2855,13 +2855,13 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 static inline void ptlock_cache_init(void) {}
-static inline bool ptlock_init(struct page *page) { return true; }
+static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct page *page) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
 {
-	if (!ptlock_init(page))
+	if (!ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
@@ -2931,7 +2931,7 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(ptdesc_page(ptdesc));
+	return ptlock_init(ptdesc);
 }
 
 static inline void pmd_ptlock_free(struct page *page)
-- 
2.40.1

