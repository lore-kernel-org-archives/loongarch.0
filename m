Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1545963DD
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 20:52:54 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id b2-20020a17090a6e0200b002470b249e59so16984735pjk.4
        for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764774; x=1684356774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seoMdP0S43tB5tHiAJsyEn/McuL6oTkl/wxfiJ8zej0=;
        b=m9/ZIcz+Tqctc8DsupfPgmRFjJ+xGEJ5QFcDJn618MR0YPogH6sfzkHf8JHJze9cJp
         x5NQYQBUB4f261Rif3c3u/e/lVyrkb7fkfJolfOwhFk6XOwO7D63t/TQQqs9S95k9Ae8
         FKQXzDTaphWXYOHY2MRQP+XNQ8wh3L+YHkBgztA18oGJHjweyg/A/nWWIx5QMqDpAEPB
         X0wu3GkIqgBlm9RuBmiAr6UEFrV7LCwD9Gy8HkrUbR2REAIxrVGyinkjPCtpi11n6vo5
         ARCTsKi2jOZHutSbPq4tlksgdP3OAZq4N0EqMo6MlYwn+u6KLBtMzuBeO5yqTZEreTX6
         9o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764774; x=1684356774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seoMdP0S43tB5tHiAJsyEn/McuL6oTkl/wxfiJ8zej0=;
        b=KtD0jATxCDLPEP9n3+N6IwTy34p2sE3juMyPbjN+sQOgpxPvPfq1h6RDrUBhpVa0Yu
         8X4VilUWL45m1t4afBHzsSr/4L21Ec2AY98Dz9PU9+ps7MVY8hFg18ecjjAXAgNXpXKG
         auibdHjoZNDuUmmzF1EfWGfUUkUn7DZQmOIYw9N4HaABU0gyi4/5BQRDBfl1wJ9Dg/gp
         l5GBBhTkau4acNVdi5qi8yZKBLTLZGBR0T3MtTD3ApMmGpTmW7rrezVg+u9DKfLxk72a
         LIV4gjAJyacVLNYW33hp8eTGldgTBsBltNCtrAOgfn5mCPkFHtVoDHZIlI9+FS9OPtam
         vLcA==
X-Gm-Message-State: AAQBX9eNXpsbrLCAjG0rOrOy3GmjC7VkBs2cUSJ5XyStYJe4tjZ0jTpb
	j8M2fj+sGs4hqrXjRGmFcZk=
X-Google-Smtp-Source: AKy350aUejw0DeO6puoaXC3R5n6x3DzcxqacgAq+Qj51dxkW8glMsrCpGOXbLfdvjTORWF+TApg9qw==
X-Received: by 2002:a05:6a20:b21:b0:eb:8d47:332a with SMTP id x33-20020a056a200b2100b000eb8d47332amr14024065pzf.36.1681764773709;
        Mon, 17 Apr 2023 13:52:53 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:52:53 -0700 (PDT)
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
Subject: [PATCH 06/33] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:21 -0700
Message-Id: <20230417205048.15870-7-vishal.moola@gmail.com>
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
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 069187e84e35..17dc6e37ea03 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2786,7 +2786,7 @@ static inline void ptdesc_clear(void *x)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2798,7 +2798,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2828,7 +2828,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index d4d7df041b6f..37d408ac1b8d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5926,14 +5926,14 @@ void __init ptlock_cache_init(void)
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
2.39.2

