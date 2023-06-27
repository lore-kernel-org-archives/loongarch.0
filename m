Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188FEA1
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:15:21 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-57083a06b71so40012827b3.1
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835720; x=1690427720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr5TgrSX24KD5rPSp2rkPhxpII4heal/IIgk1FACoIs=;
        b=GRJmT9zZCc6VZLx9VY+7Q8GbOsBn33lZq/FXBv0aXORmxRac0rj/lSqIwgsFHnmh66
         6cAHAx0KI5Lagl5OZRxl+lTWKC9rW3K7h91Q6uOR2njTfEcjIvHn1/QWkX3jlNssdRYv
         kPZ6iyIVFwiYJpTBLvXR9/yIre3tRTqt009ghcdse7E6cPjs19QO0aXvNJJOMDpClaY7
         t8HHPKKx/NAZrk3fhoJWolRioMxC3Zc40A+aLrsXlHiTMIf/9zaAkHOq7TYNlbv+VzGn
         jItTpyFNqlbWxSgJZgFIeDKcVXb95B0vXbDJ5HgCdgCt4hiGi9xgNTBoUpG/3ZX1ru9x
         fM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835720; x=1690427720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr5TgrSX24KD5rPSp2rkPhxpII4heal/IIgk1FACoIs=;
        b=M9AgvFhy8l/vCoxm8YEwAmftMIVX3jmwYNHEgyMDPbwkRReBv6BKjFH+xRGmFIBMbG
         Y4Fxm8pvn4p4AjeegHkN3WHChvxHAw7gRR3F0CtNAzKDbtAYrCtFioQv1BFUuGqYdBOi
         lynlOj+wjnhN9Ih4Ng1C64sDQEjZb/0/MMs5uiVRF2/YtLU2+nPLKiuBGcVW0W7bHVFp
         HGabnDMCq2d8GiVKLJQ2qt+9GjxKx3EbPbS7dAROANbTbadbeNz9FEM3XeChazBkqIgz
         eUn/0QhKYtdBc+RSjCg+vMpDc1cWqi2P7FMFRWYCBGdXGchmDeM7Q07VZsZq247DKmjT
         v+AA==
X-Gm-Message-State: AC+VfDw3xOomHXWlGt1DKQLnSl2wYNbfTeqMD4t9kv5fC8or3MWuLEjE
	g/Jc3Q+jDD2Qp4TRpKFJQQ4=
X-Google-Smtp-Source: ACHHUZ63yguTuEDNtqBAUu0oFztqBMiblJl9iKmWyGby1Nlfce/DGMkGkkGcggiUUjYXFR4C+z9ptA==
X-Received: by 2002:a0d:d78c:0:b0:56f:ff75:abcc with SMTP id z134-20020a0dd78c000000b0056fff75abccmr30306915ywd.29.1687835720566;
        Mon, 26 Jun 2023 20:15:20 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:20 -0700 (PDT)
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
Subject: [PATCH v6 06/33] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:04 -0700
Message-Id: <20230627031431.29653-7-vishal.moola@gmail.com>
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
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1511faf0263c..39b0a4661e44 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2798,7 +2798,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2810,7 +2810,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2840,7 +2840,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 80faf3e76232..2ff14f50c7b3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5920,14 +5920,14 @@ void __init ptlock_cache_init(void)
 			SLAB_PANIC, NULL);
 }
 
-bool ptlock_alloc(struct page *page)
+bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	spinlock_t *ptl;
 
 	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
 	if (!ptl)
 		return false;
-	page->ptl = ptl;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-- 
2.40.1

