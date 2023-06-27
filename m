Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F189DEA1
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:15:31 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-57688a146ecso35954587b3.2
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835731; x=1690427731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhgUYiKwQSwYMGFv9d1r56wjiuPfdLCT9N5JwdJpvSY=;
        b=NN6JuQbcJSEhuQl119fqyrzmvfTJLSgZNGPIizHO44moV6zy7vRkkkGbpzNnm+T/zk
         LfpssTQxYHLCLcRT6ur03GhfUH0PR3hr1gEAZWn4KlOVQ/bRaXKu0XwyzIXh7FK2T78w
         GV5aBHngJRtwmpryMrqg1wnpyNcK63Z6rXozTP8pqdze8wtkdCn+4d6Nxd1VmHHTwiSp
         Hj2gVskjJaa7d3mxLgebdTWNoaiyWHEkTnVETMwzQNfFNqae/PKVEKJL0sEqbBCs/7Gc
         Lg3rR1WUfvzFXQfsjuyOG1PSX82wJS5wL2NRG2ks6qk/cPnX1GTuY36dOOOiPPB0JsGq
         3KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835731; x=1690427731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhgUYiKwQSwYMGFv9d1r56wjiuPfdLCT9N5JwdJpvSY=;
        b=Q0jGze2xAgn1RWmbahVHPf4uOqYVOyncAx1b3nZ5Ub7dTF69+TnTC2jD7VeNYKWcnJ
         +yokNV5lAqU4e2MjlyQAB8eWLfjoSYCvNYIUOjA/zq3MNI6IhQmR+irwtG/9Lh6qaO6E
         YJ7hgLsqAdrGM/G5nx82g4YZbbIVEwVZnJG05ZmWX0xo8uIAZ8JKFlVPlwzHdRj/Qnar
         8s1kVZgN5MvRzHFlS0822EARQ45i8Owa2htXHZ8RYkWxDKX35jLAoToBc6gkKCHnV8as
         rYmmb7ozytAJSqkhMfTJPZm6NWu627vBwoME0szUlf/0zl27DlWYlvTL3TwE0omtDP7i
         AtuA==
X-Gm-Message-State: AC+VfDyL5HcGc3X8Y6BM4EgN75cVAsM1+bLxfajPK7LmKC8aDClx5TjW
	jca/IGEldSXWgtVyHhkgBiM=
X-Google-Smtp-Source: ACHHUZ77IlfDYtyaiNtbQBvQ+hst+uMDswEhJokbRedTnkaskK+XBmCINjFgoTdvnk/TaS9G8YnT8Q==
X-Received: by 2002:a81:6cc3:0:b0:56f:fcb0:26f6 with SMTP id h186-20020a816cc3000000b0056ffcb026f6mr25623334ywc.52.1687835730840;
        Mon, 26 Jun 2023 20:15:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:30 -0700 (PDT)
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
Subject: [PATCH v6 11/33] mm: Convert ptlock_free() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:09 -0700
Message-Id: <20230627031431.29653-12-vishal.moola@gmail.com>
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
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0221675e4dc5..69e6d6696c44 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2799,7 +2799,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2815,7 +2815,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2856,7 +2856,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2870,7 +2870,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2939,7 +2939,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 2ff14f50c7b3..8743aef6095b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5931,8 +5931,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-void ptlock_free(struct page *page)
+void ptlock_free(struct ptdesc *ptdesc)
 {
-	kmem_cache_free(page_ptl_cachep, page->ptl);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
-- 
2.40.1

