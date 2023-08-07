Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9683013AE6
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 23:05:39 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so5106380276.2
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 16:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449538; x=1692054338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rO3hRWVBo6Y9vRkkphMYimV7kP+YdlMpTAZzrYQT330=;
        b=Xru6G6uiZe/OuMY5nm6nRGhKKZT+cMjFr3ywYmjJVtK6bJQBvGQe4lb67TeNeIpRR1
         vU6ROYd5sljoul9DQ182dcYNUtIjSE0g9ryH9BBQnyweF2i9F3a0tNr39lnubSpEzEzx
         D9dlEQ3L7Z6V9tMyRKOuG3jp1VK2LuxNqNXMsa/r8JF3v1c5M1/VvDBiBALX9JEbGcjF
         BYD5zunEjYtVpsA/+5S4bzMaVg5Xls19tVXYJS5Y3GWWrR9cQxHo66Iare/M20jic/7P
         QScGaLnDnqCa6oKmv6Q3fNTRqyTkrnI7S8dkrsktkT3ibHnZIlamT/1RRAzAV+HV4mnX
         P1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449538; x=1692054338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rO3hRWVBo6Y9vRkkphMYimV7kP+YdlMpTAZzrYQT330=;
        b=lL+HVCoI1OqJJAz/qNUzGRcGdOZO0iwhACl0leoFKNdILxG0sNzK4zC2ePFZOGdIQI
         fDfEOyNyZ+O43IceM/E7KvXMJgUzoPXaxYmAcp2eJ6oUCnXFAerLFXHyWRGX+0XzvhHX
         bBsXn5svyMsThDwsJWHH7V1lI5rfpYRKc/ygTY50JEoUgpGwDJpes+GRQtuTyOLUuQFu
         SLHZZz2G87G+eH+a8lrZT1/mDtPA6oQSGfI7WcVfwonLfpn0d/MQZC99PsdnaGjSqvr4
         NaGlTM5KlJyI4aMaEVZkBkQ/I6pzSGqwGveCgw0ourRXPqAaqch/Y+NEgJA9mwlkx6pW
         3pfA==
X-Gm-Message-State: AOJu0YxiKTjOA9gkFfe8XFzX/EfYVQrubV/rT7YIJb/6aJA+XCWxTD8T
	EaxqqXjSvlnQ8QN6wgtC5ag=
X-Google-Smtp-Source: AGHT+IFQ1sRvJZAfCY+VUYCk9fa9DxUgaBX+22XersqRcqzji4wcHGi6IN2gPixXkKaq4oGn1g4mnw==
X-Received: by 2002:a25:8001:0:b0:d0f:ea4b:1dff with SMTP id m1-20020a258001000000b00d0fea4b1dffmr9335056ybk.8.1691449538435;
        Mon, 07 Aug 2023 16:05:38 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:38 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 10/31] mm: Convert ptlock_free() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:52 -0700
Message-Id: <20230807230513.102486-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index aa6f77c71453..94984d49ab01 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2861,7 +2861,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2877,7 +2877,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2918,7 +2918,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2932,7 +2932,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -3006,7 +3006,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 3606ef72ba70..d003076b218d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6145,8 +6145,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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
2.40.1

