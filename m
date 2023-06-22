Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3A6206B2
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:11 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bc43a73ab22so22984276.0
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467490; x=1690059490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9Q71kHk0zB6vt5ahL9ZHs7069+SCA/PofhBzVdlAuY=;
        b=SXnr3kTV6njYUvauamdMyIGRqi3Z41OxkG9JlPzJUx0NriTeoHWuqaMEo3l+9h8t2a
         VYkat48qctNxV1/ppcRnfQARZuWAzrRCUbykSbsoBMp8966TwG20r91mIMZZWqpjcTmW
         hdpH7DDiGoYlRwkaTlsQfcolxJPdgdCgC9/4W8c/dT4apJrOeLX3lj0oWu+YQP0DxUAd
         osWDaPCIsD5h/hDouYKm/GWbJh0+G1rOXddszwPTKiRotQWqfvXUbSh9a+2twyPuDXpa
         FZNLCmQA2AiifhKNd54UF2voysI7AeqYSwKdAxxqSAv3Uf/qcrBy28RD1vznPZVN3aBc
         SnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467490; x=1690059490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9Q71kHk0zB6vt5ahL9ZHs7069+SCA/PofhBzVdlAuY=;
        b=dWPC7H7U79+JVQHc89KS+rcVVPqonmBl9+m9T1GwTIFlVUQuun8+irPRXDXDZazIzO
         cqE1atTPtTDb67HuxZ2o9xo6FbhWKmcwPJBIygOIqZv6Tob7+v57qAEeKLn2ATZTFdMp
         kdqGWIC496X9SMkPbjC19JbTTZ1Zk328Ail3NPBYoKownglVztVGE5belQtpRJLJCuiz
         +D2iMKZ9P1mZJ1f9e3ZfBOyt23KvICAWnUo3He0z/glsmBWyyLV29WC2/NI13QBFzkN0
         +NCW1d0j/aaAlyqQaFqkR/aTlljswEiG4L6xqfRh0IXpgbw6K1cAS5viJfHPaVgM/z4a
         e/3w==
X-Gm-Message-State: AC+VfDx0cNkXkVCRHj/yJCs6Pan4STd5O4GMEywgTAEZQSTekGKADhTn
	MMga656X6dlZ4TmPrsICsd0=
X-Google-Smtp-Source: ACHHUZ6BwDtDcu2DafE0mELxOK/IzeJcBBP6EuYjmA8bqRWBwzcd6lelREQA4aNwT3EjfCEygFsIlw==
X-Received: by 2002:a25:2144:0:b0:bce:5e08:c330 with SMTP id h65-20020a252144000000b00bce5e08c330mr18770867ybh.29.1687467490539;
        Thu, 22 Jun 2023 13:58:10 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:10 -0700 (PDT)
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
Subject: [PATCH v5 07/33] mm: Convert ptlock_ptr() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:19 -0700
Message-Id: <20230622205745.79707-8-vishal.moola@gmail.com>
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

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/x86/xen/mmu_pv.c |  2 +-
 include/linux/mm.h    | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index e0a975165de7..8796ec310483 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -667,7 +667,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
 	spinlock_t *ptl = NULL;
 
 #if USE_SPLIT_PTE_PTLOCKS
-	ptl = ptlock_ptr(page);
+	ptl = ptlock_ptr(page_ptdesc(page));
 	spin_lock_nest_lock(ptl, &mm->page_table_lock);
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 39b0a4661e44..0b230d5d229a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2801,9 +2801,9 @@ void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return page->ptl;
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
@@ -2819,15 +2819,15 @@ static inline void ptlock_free(struct page *page)
 {
 }
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &page->ptl;
+	return &ptdesc->ptl;
 }
 #endif /* ALLOC_SPLIT_PTLOCKS */
 
 static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_page(*pmd));
+	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
 static inline bool ptlock_init(struct page *page)
@@ -2842,7 +2842,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2923,7 +2923,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.40.1

