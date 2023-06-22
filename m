Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F4A206B2
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:17 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bb15165ba06so6115514276.2
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467496; x=1690059496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=I/bVEj+DUjJI8l/gEF/kUAGaYNT5Bo0ZW57h+bRIiIunD3HbfI+MBQBKO4xoy6kMld
         by9iDd+YOlloG6orphek9MUhK7idN+HCTnjbwImmtOZyc6e9u9PHx9KvfH/RMgtU+eEw
         KkmIT3OJU3QYrQoQpzTDW/lNw6UL91T+VL7WZPaAaf3blTIwnU3tSpIBE8mZnuXVnYm+
         rvZ17E5R9YwQ5EOQRDXtuuSLgHPTNFwHVzddHdU5MZn7f0HGX0TpCThXTZUeoTrDSQuu
         9j0W4VdWm0ZtykEhgIk1WPxDhiiNhplU95urAkZpVmBWbtxqWeEVwFyvBy3V06yBmQux
         q4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467496; x=1690059496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=TiI5dReReaiygASugqVWSQGf1KRKEM522ps6noAASPRYxNVCyMTyFzXA+EVWSk3V2C
         VcOkesl87M3w07HyiyqF0zujr2KrFMGMAsT/x4f4ume7DXBpvWe84X02ygNt/DoUcwuu
         OqqVBJG9H6F8NcJEkM5u20hm1Io5iyj8m+M9G7XK1HucfJd28qsU+q/J9670lK3+MKBA
         sgCF3gyo8uIIDdQG5mzDO6yyovG2uy5yg4fHEBggUcxpdXrJGDesuanVSxzd52Z/uQGo
         oYEDk5xJLKpXBddrbs20cGg269YOEfMcKwIHYYrXjj4dLjsT47WJVx9Rl8WHjpvi71bO
         153A==
X-Gm-Message-State: AC+VfDxdsgaXTPXgGWvuB7mTh648+DRq9qyceN2M1da0X4FxU9QU66mD
	Z1zDLizC5f9yllFvmd6dAMw=
X-Google-Smtp-Source: ACHHUZ4fKnSuVlprYtWMiqysn5f2VA+PJ55bhXLl+JTYwbJxQpJ17qCGbx2gEAsv8+8GLejR/TMFxQ==
X-Received: by 2002:a25:6982:0:b0:ba8:1c9e:c77f with SMTP id e124-20020a256982000000b00ba81c9ec77fmr9956027ybc.22.1687467496585;
        Thu, 22 Jun 2023 13:58:16 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:16 -0700 (PDT)
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
Subject: [PATCH v5 10/33] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:22 -0700
Message-Id: <20230622205745.79707-11-vishal.moola@gmail.com>
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
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 4af424e4015a..0221675e4dc5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2934,12 +2934,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct page *page)
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(page);
+	ptlock_free(ptdesc_page(ptdesc));
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
@@ -2952,7 +2952,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2976,7 +2976,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

