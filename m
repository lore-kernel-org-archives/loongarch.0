Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B435B6AB7
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:28:44 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-63b60366047so2011691b3a.1
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969324; x=1685561324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5AaOHEPf+h0pPpRdylr/G5bcmt7vW9RVYKqYfsRH1I=;
        b=roKi10VJs9dRiilqVeW0uT+zBJLQBRTUlVbgvCysCoLkLcBaFtSDJFWEbNs2bywIGo
         H3vsreWJ1ZpYCtBmz7ULTfsdWW+yedXBXQs/IwteaEsgFryEWzy4p352hRLq6aefxJE1
         6kRZZ9T8eU7cXFjWBj8Pc1GfIk6+0XR5y+mT0ED8uGwr4lyimQw2Z0aiiwvL0/TUCnLz
         1YAzhf+9hpLKk/t8M1Z7w1Ox1h7cTnYF1yo9NW5nVgHqgkVIivMOhZpN29c9g57SmIug
         sEztd2i0kQBJZgz4HOMkQSUf4qdi6lxWXkVGt+hsJgx7i60d4BQr0JdQ/AyxEv6LKtIb
         /zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969324; x=1685561324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5AaOHEPf+h0pPpRdylr/G5bcmt7vW9RVYKqYfsRH1I=;
        b=l8eVZMcq+NLZMhVLQis6kTcHWkvz6+De5hOGlphGzBRNYOCrjGUeQ5NlTOBZacMdw9
         XFm1E58cdJwZaIQiVVINrvbYiREkXAC7dxAEQF+LYl89UzWtlcq37toxaXzcBbfA+Y7B
         xNYC9ah3Gul6pIgCLAZS15Amd6RgZwKOzYt8/spvF8MnQRDwuCH2lmBPZeilBMPU8Whs
         DL7Y8oAJM3m5T2lcdwfxOChDfQtUTmeYsBmj1sBK126ksAJj9BjMG63+FKJhQ1ejdz3K
         qp2aCmtNa93OfOZ+J8CbjVUFDzH6ll3Gq3r+O99ZEw9UahlEAqZUlpimTSdwnqV1c8Oy
         ytiQ==
X-Gm-Message-State: AC+VfDzLjUEtYf0Js31UzJ2vCJls2i/6VT2XZ+Q+Ajmnm0we6nhTeBrb
	wHvzR16pdwjDYQrUrYCju8I=
X-Google-Smtp-Source: ACHHUZ4PPvDcr1ZSfGKsFuoX96n8X09PGID8nEMj55TFVd8R4rz9suoKbv6A+ENi8FZ5wQLN727S7w==
X-Received: by 2002:a17:902:ca0d:b0:1a6:5274:c1b0 with SMTP id w13-20020a170902ca0d00b001a65274c1b0mr12751445pld.60.1682969324101;
        Mon, 01 May 2023 12:28:44 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:43 -0700 (PDT)
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
Subject: [PATCH v2 07/34] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon,  1 May 2023 12:28:02 -0700
Message-Id: <20230501192829.17086-8-vishal.moola@gmail.com>
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
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 62c1635a9d44..565da5f39376 100644
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
index 5e2c6b1fc00e..ba0dd1b2d616 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5939,14 +5939,14 @@ void __init ptlock_cache_init(void)
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

