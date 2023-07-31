Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A81BB4A
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:03:48 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d0a8ae5f8a6so4921077276.0
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823028; x=1691427828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLtCJBysrabsGyMeKlbK2lKTjEzHhmjaMpElw0hOQuQ=;
        b=XxfUVCtc+QbMuKLsIQZYFotQjD1uPn39bJPNzHnLSpRxaT3fJeSLcUYSJwnJQ3Db/g
         leWI/21K6KvWZhIzEH7DHukGj5D7XdCtwzeO763ZUH4LeT7PuPE1GzPcQcYVnv/vf13j
         n79Pu8SKl7LjDKW1vidx9U3g5HX3hsbCLIInKKKoydsrph/bfVYnRh1jLyq8obFjpp4I
         8/fNfhvrK0O+QQmUluanQgTc5DFDNrxKYjhdFJW8WfDVLkfAQZABhu93QV+IfN33Z8yL
         iOGQEq8tdk7NtoCkxwkrl9w2lNi5iRHnhmaZ+oTac0bEezCH6FvgLddmkBsJ59So10Oj
         RPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823028; x=1691427828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLtCJBysrabsGyMeKlbK2lKTjEzHhmjaMpElw0hOQuQ=;
        b=CWveUBIJeV5m7uV/ZmAAl7J8tm8hF//H8WqBP5XslV/kSKDIiFBjmHALkCUHMECxyO
         31dJjjZOmmo9Ulu2sfhy3G4YSuNX1F14SMm36weePGeoHT/vANbeldxmiatPLM7tK+NX
         3BydOv0yvEqW0yOrkF2+TjFNOhv0aDuimPYRfd785BZzmsdMjsehjkVN9gispcjorMe2
         8H3EOnzqcMYbh62Z5CaTeSBjMe4TqOWtUBuDn/WadgFumhCtXd1imOt/0YuFEBYRPrKt
         Sn6wMxPxvhk2Mu+wTZ70tPp5UV5DRJg0cd4T+1/xPP8bTv0yxUzh0SVn/jczG5V2jHUV
         Ru2w==
X-Gm-Message-State: ABy/qLanGqDT7QB4fOIXe6wCcjRKBjvYDJGZYyK3UUGAo21BQL3M9FgM
	B7vkPVxAgCSYAjdegKXydR8=
X-Google-Smtp-Source: APBJJlGaLQRI5Q0HqdaC/SmgbvgNuoyQchTQtq0hJYQ2S7wch31RC4bpLlQZjYY1DDyT4+2cD/rUkg==
X-Received: by 2002:a25:9bc8:0:b0:c91:cc0e:1aef with SMTP id w8-20020a259bc8000000b00c91cc0e1aefmr8613166ybo.58.1690823027825;
        Mon, 31 Jul 2023 10:03:47 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:03:47 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 05/31] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:06 -0700
Message-Id: <20230731170332.69404-6-vishal.moola@gmail.com>
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

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf552a106e4a..b3fce0bfe201 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2841,7 +2841,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2853,7 +2853,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2883,7 +2883,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 2130bad76eb1..4fee273595e2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6231,14 +6231,14 @@ void __init ptlock_cache_init(void)
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

