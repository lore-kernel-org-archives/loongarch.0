Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB801640F
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:31:28 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-565ca65e7ffso991947b3.0
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568687; x=1688160687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8eY/8E6JF8s/V5NNW8TZkaDOnTKuaiqrBMcG8UrW5A=;
        b=F74YoiyArmyQwVgOOUW2kfK/7YQSeytT5Qdq4W7jztqrHFW+OxsR62y2z0sZiEV/Pj
         CHUjkMgQ+tHkrFh4S6EPBTtuP0+8wu5BQZyij+e15SnoNrkShPqGZvWdjF5BKJMv2Qv9
         d//2kHJUZF8y/wk4PqE5bOyyg7AT91rLlQi2SzidEtRHvmTf0yi6wamtogBgC9EY9N9P
         uw5EAPHRhzcCUSce1FYm7EE8CHhgk2SNgdWG+thFtb+Fd9K9ZtkE1HL6Lqu8zbrIjBxa
         OBo4gwjzqO/AwYTPpiaC4MdC5Mq0f0RkoLNLDnNUh3I4ll9vsxHX0eJNI6QQ67EeV90U
         TdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568687; x=1688160687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8eY/8E6JF8s/V5NNW8TZkaDOnTKuaiqrBMcG8UrW5A=;
        b=mGEHwJtOTC+1+6INEjBmvpaD1K7Ifr/jjdAWQDQ+nrL3pmdWDDwoP7DuqPDXW//xe7
         VxWdoX3atDA95aMhaDICgOOnl/oYDr9V3zUSycbhRNpythhjPeSDCBq+mZcS+dR1k15O
         T8n3V98M/PFTPBA7BRWxYoXv3owOWWAq0rDjWI8A6lVqluV4OiEDdUgAkIfYvn0M8dAq
         xDFe1RTkoNOf6EN2xVkdNNA4nW2K4Akp9zOUGze/WK0uSFUROGG0J4ev3HCBIUPislY4
         NZeNfm62N9EYmLqPbQjsO0ZFN9rG8J8dbZZ/JaO0r0utF9iAbWnHG7lZi8JZjqrXICST
         GOFg==
X-Gm-Message-State: AC+VfDzZEnRZNA1OzFIAm8zSd7WdlxE5XLkSOMLdNrtGuiXoYnbFOIZW
	LPLQv7cdvF3noNxg0oPC7pw=
X-Google-Smtp-Source: ACHHUZ7+UFYbIzpavTgJ7f/w4fvGAPRL0PNa3hATkUDplqTdJkdO52BS/n5X3DMJ5Uv/pNitevHZ/Q==
X-Received: by 2002:a0d:dd92:0:b0:568:be91:c2c0 with SMTP id g140-20020a0ddd92000000b00568be91c2c0mr6597562ywe.6.1685568687247;
        Wed, 31 May 2023 14:31:27 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:26 -0700 (PDT)
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
Subject: [PATCH v3 09/34] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Wed, 31 May 2023 14:30:07 -0700
Message-Id: <20230531213032.25338-10-vishal.moola@gmail.com>
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
index 6f7263fcd821..8e63e60c399c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2923,12 +2923,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2948,7 +2948,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2964,7 +2964,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1

