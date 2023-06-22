Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C8206B2
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:09 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-562e413cf61so630064eaf.0
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467488; x=1690059488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr5TgrSX24KD5rPSp2rkPhxpII4heal/IIgk1FACoIs=;
        b=UtF2QiZk6b9G+hZ8o+uaaa8jIMv9kwu5Z4W+DnKhqSxtuxZLeuCmgWiQ2UyCbKdGf3
         JlKYQP1/9HAEwi4YcMuZIpkc1UasphklUD1y4PAfxdaiUenlc82pk0MDNgE4UyvTP/Ti
         WAZ4mtTP+0UbBT6PIwdrRUvrUpbxA+faq7jSe2iTSffGzc1HNKXsxuak3eG36Kz3Hx1p
         3Bw014l7N9peXiYCyjbUvF7k31KviCnInVoJPhH8kz/FXkdJ8oxWXWbjuOh6BjmUEfNL
         NLvkARmq7C0ZzVI4l8HT21OfZWS/swkiU6k+jkbLgeAOyE/KVS/34HjWz0qthh2YGY4M
         vuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467488; x=1690059488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr5TgrSX24KD5rPSp2rkPhxpII4heal/IIgk1FACoIs=;
        b=K+il8UDYE6be6ZgERV3cYw+SthNN7aoOpJBeTOo/ygKtq5z/n+SYKd/P4hD55ImhES
         wu7razxzUrAuV4c56ial8b4DOSNuNSrz829VFt2DJqY5uLvKMVtJHKksey9NutrmfwgS
         dgTI+5Q0OP/QFeHOI4z7Sjj2cBk3LSUPkrPHYSfNX5CY8EZhp4gc5EN2vXY9g/m6PId5
         BkZg8kez1YFvyubcXoB0mKY+kBwqaoMkcY8nNx5m2fznXNOZmLOeLjHozYNMhcX5Z8hq
         owDoKnAzrSkfzuFOGO+wFytsj5yBFc+/PJbwyN/1ekd04XrOCc8OaNnn14LWJ7QAhnhr
         W1jw==
X-Gm-Message-State: AC+VfDwwjs9HoarexIi+SxM7X+V05N4bgSXYdrJRG6cngE9G29oab6V3
	AIbMqLydbSMD93aSWb4hP0s=
X-Google-Smtp-Source: ACHHUZ6Wv4q+lCV8nxexJGI3S2vfJP94k7k+pAexpWAqQNNuxMHJpmGx+Tn2Ll2+HAYtwXHgGRnsHw==
X-Received: by 2002:a05:6358:9f9f:b0:132:d8bc:b15b with SMTP id fy31-20020a0563589f9f00b00132d8bcb15bmr1343396rwb.2.1687467488545;
        Thu, 22 Jun 2023 13:58:08 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:08 -0700 (PDT)
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
Subject: [PATCH v5 06/33] mm: Convert ptlock_alloc() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:18 -0700
Message-Id: <20230622205745.79707-7-vishal.moola@gmail.com>
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

