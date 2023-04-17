Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8638BFB
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 20:52:57 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso255298pjc.1
        for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764776; x=1684356776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0S9vHWOxLue2VyFd3w8q0WLRZoA25NyvyllT+RcawU=;
        b=XGW0pwJ3AeguS3BSEjZkQda83npB8B7RbJEymTCypauBOGiv3vWjnUTzzYfl8eoJ/G
         l8vpSac3iXyBMdZp/fMD6sum0gW4MOCVqLS502CXgyi0RUYYf3ntgvAGSXGBolZoNn2i
         V+ToiFcIdhtDlP2wctGltXpdu2C91rdsIF1S9oPOQ0O7Jf0vF/Q8QloTMvDXpKn4JpZo
         XwyusDwNIWazvsnj/elh4vmpM936WP8JEzePXhLQ+OdbmLb8t8oYaUiKKrqV8mjQTuNV
         U8/37jTeHtYYWs9KLzMjZZ9An2VnMVkd7CaDSgdHdeupgwKBIBRRGFzwxZa8/Q4lnujL
         ZhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764776; x=1684356776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0S9vHWOxLue2VyFd3w8q0WLRZoA25NyvyllT+RcawU=;
        b=KVbk4HSE9zhqChcOYCTEtHK+W4KNLnZCnAMKeKMaPQd5dMNSsADx63j+eIA7RwWSmD
         tqLBCF80K/gmwqzQdgT7XPcDJZLRSx9pPoasOjxsSZ8PRH57XEW/IvsaDk5h67TEmps4
         k9QE2ufYa1gUH69pZ2qGI2/UX2kWZWfMtBhItwsKewLpdjlgXpYit/p3suT9Th2Wc1Rd
         ZKnTIvEXUA5hL5XvEogckSqB6EpUQCOtMjT7wzsc5RdOQG9FYcl/73Mc2sle8yWEbBHa
         ZDp6iN5WzUh9WCUvkiuzJcqBAUG/e0Z85zjF8MrCFFawjBzq1uxOB4q2CgSkah79uoVN
         ldzQ==
X-Gm-Message-State: AAQBX9feEVxZwVlhFStpg6IxjSZu9RfWyNAghZcDkLqqnsglZl1g8eQ8
	3PRkINcmKBuF+n02ME7mUqI=
X-Google-Smtp-Source: AKy350ZxT8mmBCzqXXqE8vhbMJvpIdAkvQhshhpl/b9NVru4kEOX264b08aZJzrt7Emcu03WoO14SQ==
X-Received: by 2002:a17:90a:3fc8:b0:23d:15d8:1bc3 with SMTP id u8-20020a17090a3fc800b0023d15d81bc3mr16271900pjm.39.1681764776607;
        Mon, 17 Apr 2023 13:52:56 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:52:56 -0700 (PDT)
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
Subject: [PATCH 08/33] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:23 -0700
Message-Id: <20230417205048.15870-9-vishal.moola@gmail.com>
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

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ed8dd0464841..7eb562909b2c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2903,12 +2903,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2928,7 +2928,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2944,7 +2944,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.39.2

