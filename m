Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64EEA1
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:15:25 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-576a9507a9bso36780317b3.1
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835724; x=1690427724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwvXTPG+SvX1bm+f7lh9ddV99LBkA8HMSnaL5DvtP/w=;
        b=bw9pNUcuMxpubm9pq3maPyXbc62B+bsuNNloL1m8ijygS8iq7WYtlX4XdEVQIeg/Zh
         Ngyg1Az+rnDUxxJdpkw2Xv9RrFezRnlEtGz+ikp5CpgXDK/wyBh05TsohR9gIqLikIrz
         XQJZpHLygL22WsyZKTUtr35hO5G+O3BbEJWU1trW1sFmIRDgY2iyZUpnQW0acaV8lKSP
         bClQykA4VjSGm4LzvwTtemLaGQIugu/qzT0WXVHTnnvGtI1PeGca+HTzzD6jettWBhDo
         8pn250bIB0NJGxFmMTfFNawkBicAYzNWGl1omwNwRWLI+9cdDNXLQFqbUAr8KIK7W1AA
         kzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835724; x=1690427724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwvXTPG+SvX1bm+f7lh9ddV99LBkA8HMSnaL5DvtP/w=;
        b=jYRQrCIDmFBQX1lBd6kg1PvWI/g8il/lEGLJ8xVhoZCrzmU2W1ZXJ+qVGVRveAloTQ
         Q4+ipHuwuTMshqFoHFQ0Xpd9c4dNOvKpX2W11bF/qVzLJ0yVnTUODCJGaSBFP7wBc1iE
         NcaLSy3oSnZQk9YpjF9hMH5vlN7CMCYHtVl/+AaO/dgqy7w2bLn5R/YEwzbuZkOD922s
         qB6hx2nKWgnNYR43k3Cegp65Jag1gJvHjYhV4c9k5TwyR1CXrpuMdL0AV+4k0jmyEgnz
         dkZU04+ydFB60WrR5dQlAFA8lNQOuZVyDwWJKyC1o+Z4rY/lMTrM464ubsZhZ2QpwuVq
         9nJQ==
X-Gm-Message-State: AC+VfDwOzdJdHSjplDY5dRkbgyli4/avIvhQnwSIKE3HhLUgWABBx/0m
	SwTM02M1Tr8UIKQqLwcWaAQ=
X-Google-Smtp-Source: ACHHUZ4U3kYwykXpP1FzDZUmgCkvLtNAT31XIQI7+ns8f+sP4iaCy71EJqjX8aE3VjJuNDesXn/JrA==
X-Received: by 2002:a81:48d0:0:b0:56d:6dd:c1e0 with SMTP id v199-20020a8148d0000000b0056d06ddc1e0mr35914739ywa.21.1687835724632;
        Mon, 26 Jun 2023 20:15:24 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:24 -0700 (PDT)
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
Subject: [PATCH v6 08/33] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:06 -0700
Message-Id: <20230627031431.29653-9-vishal.moola@gmail.com>
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
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0b230d5d229a..1c4c6a7b69b3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2926,12 +2926,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
-static inline bool pmd_ptlock_init(struct page *page)
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
+	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(page);
+	return ptlock_init(ptdesc_page(ptdesc));
 }
 
 static inline void pmd_ptlock_free(struct page *page)
@@ -2951,7 +2951,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2967,7 +2967,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1

