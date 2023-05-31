Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4983D394
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:31:33 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-565eb83efe4so949587b3.0
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 14:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568693; x=1688160693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JALdXD/M7jBu0Q8jfR4m4Tx9IinYQtlxZ5YXkrMJ3RM=;
        b=SDECzrupkY8P71D5Bx9Ena6q3wieNwuGBpSv8ettDWf4PjEIxkW1kzC+/sNtzTCciF
         08YPq8+A8ip8H8kzMs94GMf7GyNCyBFe+MQWmq4tDFaYpFFNOE6UTqgnOULDbhNW0X9R
         mptdXbgDm5NvfVfzaMpwLm1cS6nmZ7EARb4uqJGF+rFwJSp8Gd0Dc+nu6W5F2EiHrPlp
         wvBO17QGrS6gAkojPK4/lKp5/gxat5ehsK5W06KJyleVWDfyXvKL/KtB/UxjcTPMijxH
         kcvx1/i/I9fdgW5R6GrMiCaj6gwLScpZ5XR6LtwZa6L23gJoAxE1JEulvsNvUD9DStHW
         I/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568693; x=1688160693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JALdXD/M7jBu0Q8jfR4m4Tx9IinYQtlxZ5YXkrMJ3RM=;
        b=BH2Fz9aDMW1GSJoW36fSnKjsS/gQU8zN1vWKA7mec4L0DHUHdWVT+nBGrWJCR+6vy4
         tTr/0NLhJCECHxW3rzIUonxH+NTLOIhIVC2fRchlF1et0Fp67oXA6MknnNOXA/j2/s4y
         J618AiT4EIPgMZWcO9rAzsyW+3bS18O+sIDN/CLBa8bW7vOKIEv0ZHKrwLBczOaaw8Xm
         tzUZx4ZnXjlN/DA/dGT1mh20Uw7XNvgu18UGnWLVJ2nWVj+3zCHfToGmjBptdwQsxUii
         9UGeKo1Wc7uzvSRJzAqFfDTgLuxf8HMCVuBStlpWDLD80QAKrCrjZL62q6PH/OT1m2KP
         zSBQ==
X-Gm-Message-State: AC+VfDyPqBu4AGhjDBqjqWJ2dzvpluAZJQlO/uw+WgIL5Lrmtv220Td+
	O8KPc7puKibAxx7PYixJV1o=
X-Google-Smtp-Source: ACHHUZ7Dif7B1ZpmhmssBZICB8FP9/M3ln6TJpLdw+EDe49hetyZ/pJac8jXPpLostqsKq4KAza0XA==
X-Received: by 2002:a81:4ed2:0:b0:568:4ef1:ba63 with SMTP id c201-20020a814ed2000000b005684ef1ba63mr7706752ywb.14.1685568692854;
        Wed, 31 May 2023 14:31:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:32 -0700 (PDT)
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
Subject: [PATCH v3 12/34] mm: Convert ptlock_free() to use ptdescs
Date: Wed, 31 May 2023 14:30:10 -0700
Message-Id: <20230531213032.25338-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
 mm/memory.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ffc82355fea6..72725aa6c30d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2807,7 +2807,7 @@ static inline void pagetable_clear(void *x)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
-extern void ptlock_free(struct page *page);
+void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
@@ -2823,7 +2823,7 @@ static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline void ptlock_free(struct page *page)
+static inline void ptlock_free(struct ptdesc *ptdesc)
 {
 }
 
@@ -2864,7 +2864,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 static inline void ptlock_cache_init(void) {}
 static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void ptlock_free(struct page *page) {}
+static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
 static inline bool pgtable_pte_page_ctor(struct page *page)
@@ -2878,7 +2878,7 @@ static inline bool pgtable_pte_page_ctor(struct page *page)
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page);
+	ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
@@ -2936,7 +2936,7 @@ static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(ptdesc_page(ptdesc));
+	ptlock_free(ptdesc);
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
diff --git a/mm/memory.c b/mm/memory.c
index 8d37dd302f2f..df0251243dfa 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5949,8 +5949,8 @@ bool ptlock_alloc(struct ptdesc *ptdesc)
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

