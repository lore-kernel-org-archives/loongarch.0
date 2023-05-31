Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDDD3D391
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:31:31 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-568900c331aso736347b3.3
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568691; x=1688160691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1jEnioq7k9B+WnYjAw3S6OIwBriiVkAgPsVN7nSKAQ=;
        b=sRB3lx4kAmnM8+wptcE+ajVYWk3XjheLnACKkDukTCUf9xFbPcDCYhPah6bex/BYdh
         giGFY1Br6w10nUQCd9DWblMM8GH+uaGuqnqROXiLO3UcERmYA2lDrQkgyUuZp7Z8kkqA
         nuRpQ/9G4vNwfZmkO1bs5HdxOej2dcQ5VFdd4ryduclGMMN3123XdTOk5+I53fDJyOM9
         XY0ZeZ9oP8N1MEbhuB5it+QgLHnwrzlk6MNwsUUfvNiqVb/KKB+BbxPk/D/IjrOXLBJg
         QnLP5YOwWWUD0KCage2oW1q2o8nxOiUGc6Utker8eoaHUzZhr+sfeHDiQePcAYy+fUoc
         EHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568691; x=1688160691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1jEnioq7k9B+WnYjAw3S6OIwBriiVkAgPsVN7nSKAQ=;
        b=Fm8Y/JQ/C5KKwsGzhxpQ3YXM/jPuhNudyn7B3w5E2aYM63MneXUcIeJQ+TAMJXFpBN
         p5Hmx5w5yhj7P8Wlfdhp6V6ntn6anXkPEGKDqM0l7n88bje5KD+J7bTw4uOGiKuaNSOu
         p5hKZzglnsmlS1wPnCblotdAKXFIuezynRylaBvRi8lp2qEY4r1d1uXbHY1mgzXvYo70
         N8Iy1HH9y6AGXJv2jeT+QXsJHSgDr4OvyF+h/80U5nKfWO5HVGTeldc09865japuFvh6
         UsHYGNs0hX4wqlh3Suua8PboAwXzpvgAmfiJRWlve5Vs6bpBvQn/hCJQxXgIr022burI
         fibg==
X-Gm-Message-State: AC+VfDwy7Zff0TyurKNLAZ/DcmiMrMdjX1SgEbpT10mZWTc/yYLyiLdP
	8KmywhtA9y3D7qn2E0p4mlI=
X-Google-Smtp-Source: ACHHUZ5VBnMU9jyAiESUYWnGmIowgKT6gU4T3B/pZNfl2GNdmiRLLxEPQJ4tr+ESELmCnMZcerU5cA==
X-Received: by 2002:a81:49cf:0:b0:561:c5d4:ee31 with SMTP id w198-20020a8149cf000000b00561c5d4ee31mr7393100ywa.38.1685568690985;
        Wed, 31 May 2023 14:31:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:30 -0700 (PDT)
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
Subject: [PATCH v3 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Wed, 31 May 2023 14:30:09 -0700
Message-Id: <20230531213032.25338-12-vishal.moola@gmail.com>
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
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bc2f139de4e7..ffc82355fea6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2931,12 +2931,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct page *page)
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(page);
+	ptlock_free(ptdesc_page(ptdesc));
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
@@ -2949,7 +2949,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2973,7 +2973,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

