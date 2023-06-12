Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6121C775
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:05:05 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-56ce6bbe274so29647857b3.1
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603904; x=1689195904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVa9cggtOHSUJO/ogR1wMW2sjtZWNjmDdrC369SVqz0=;
        b=LGp0peHnuaxYbTi1TrslUjQMitjh+h/buXXjte+rmzMq8EerSk6fzj/9MIVxfmxSpM
         Omqu6nYebae8kl4QHV1G7ATHJ83nT9wNtbqIHtA4KnlPAvi/4+5X0WEOsthQhJoYwmhG
         x7qZZcT6GxEhvCZo0gV9yDh1XejrVy2crvGhXSgjUWCF1D9y073Dss7gKb2gKwKJeIqg
         gITOZuL6QQ3v0Ru0LyolXLQ7MXgbRP8zVbSmn+AuXiGssqL0cYBREi8V1ugxeRNuLvvw
         6oKvVZRZlVRzitWHyvf0O6G2XA5TATPVxsClJqIqIlKCoZg9JlGxlBuUR1XF5sExgOF1
         +mLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603904; x=1689195904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVa9cggtOHSUJO/ogR1wMW2sjtZWNjmDdrC369SVqz0=;
        b=g+sJgtNI0baRJ5g2+etVyyiRA1od5X9r+jGNEwLAX4FP0FIcNQ0PbfhU4I0NX06E5B
         2F5oCFzmRGrApI0CEU5oEeGV/k5df4L7b9MFOp52KND/Q3irQVZ//fC5WvvnzLkrVt38
         hKVKxjq3TzUmnBHNkxLHuo/2nOeZPZJ64fzfj6nxK9Q1I6WnqhasN3l9WO67kaJOCTQy
         UzaPNXuyoj1mqNaR7xTitt1o+S2aYgBLqp5JZ9lcs8oWf3mUR9Hu+9INIkkh2poHvi9j
         TVs2X586tGSwSh7PSyHCCYTQgbBKcGwNcma+vhKQ2i2vpyQdIEIW7KYBuBKTMGp9rm6f
         yyoA==
X-Gm-Message-State: AC+VfDwqOzbEfd+jkeMOFFRRFqTS1hwkcLCsblwlf+oSjNfUG9eQKpgM
	br50vcFP2UInDIYRNKNUdJU=
X-Google-Smtp-Source: ACHHUZ4LesFNmga2zNafYd025bzkWSSIKRSwmwCXoFtNtSsfVvER7X6NaAl79hSVn0sQ3cUacFJw5w==
X-Received: by 2002:a0d:eb83:0:b0:56d:7c4:8be8 with SMTP id u125-20020a0deb83000000b0056d07c48be8mr6827241ywe.16.1686603904409;
        Mon, 12 Jun 2023 14:05:04 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:04 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 09/34] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 12 Jun 2023 14:03:58 -0700
Message-Id: <20230612210423.18611-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
index bb934d51390f..daecf1db6cf1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2942,12 +2942,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2967,7 +2967,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2983,7 +2983,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1

