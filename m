Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C936FB7
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:28:51 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64115eef620so29037910b3a.1
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969331; x=1685561331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt3HE6L47sPJBYnAKPMz0/DxNRKvA6oRz72+XbjGX9E=;
        b=bRmqBPTZgCa5IrhecvrTPyLDuab4M/2pWmm67Ij9kB88cqyNYvHpKZf2c822tlLINs
         V7g4wokwjyA5yoaxqgkTwqtzjgfghwoIfl0NbPXtXdg2Gw3C4PIS2FYz/KLko7etiChc
         s5Y++dzV39ZBew8o5WYNHoWZR+E9Lx1p8UATOni2Z3kTd3MdcR3ji+KJhcCE5jLMM79j
         4rcgjvbB4U2t2rwTpoiUyWgvBTuTWbg65E+Konk9GYsk7NMgNhoUvQ9jMEmXFDz/6lzW
         5y5R3ETL6C6d8IdLyMxau5jgOeNqS9ewzuT1HexEBx4VHGUimuQrmfTb2llKzaIBnzUu
         BV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969331; x=1685561331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt3HE6L47sPJBYnAKPMz0/DxNRKvA6oRz72+XbjGX9E=;
        b=UKzGKW4yke1+EF3Z8Wnj/HtQh5kv9ClONy8yBA1ijZFfJa2YB+ZKiBWckZXtGrnN3x
         ADJi4sVFE+93jL8AOg5Jk1qhuvvY63TRsKbflDe9hR81NmuYu5YqnTZM3UjOvqpk1clZ
         bsG2Uc3OFTBPhWkBYBYChUYPEzTb0NGiiXM0ShefBtoeOcESTb+3ur1T0KzZRv/8VV5f
         g7j/0hYmyO+hYxi6DA3MRk3dzxMmJ2/lnMy/O9tGi3yNBzSkYRAgtUXx5kjtyN76GlP2
         w+xio3KAi29vpXqW8ZlcBkCH1ON5nMpOyuCAzDopVpOOyrsf82VT30AgwdOaNY+qp9fd
         q3uw==
X-Gm-Message-State: AC+VfDw+7MQA5+2Et9LW3IAo00dAxk75/SWpCgyJ3NSqEwt2TTRPnymw
	jUSJ9hha6CBEpJADSyj6Elc=
X-Google-Smtp-Source: ACHHUZ6xNyoMsdtkeuJYwr4JFA16W7bSDCfft0wt/spwymptVQy+yHqySIROmads3b5d2VYC5oAliA==
X-Received: by 2002:a17:902:ced1:b0:1a9:3c1d:66de with SMTP id d17-20020a170902ced100b001a93c1d66demr18699403plg.15.1682969330907;
        Mon, 01 May 2023 12:28:50 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:50 -0700 (PDT)
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
Subject: [PATCH v2 12/34] mm: Convert ptlock_free() to use ptdescs
Date: Mon,  1 May 2023 12:28:07 -0700
Message-Id: <20230501192829.17086-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
---
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a2a1bca84ada..58c911341a33 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2787,7 +2787,7 @@ static inline void ptdesc_clear(void *x)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2803,7 +2803,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2844,7 +2844,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2858,7 +2858,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2916,7 +2916,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index ba0dd1b2d616..7a0b36560e28 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5950,8 +5950,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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
2.39.2

