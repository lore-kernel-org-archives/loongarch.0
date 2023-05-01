Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162BA6FB7
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:28:50 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1aad55244b7so19087625ad.2
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969329; x=1685561329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTcYn70jypAxoGiZWNhXW/f3wJ7PRfT+UBBqvcdtR7Y=;
        b=lB3Z6fcbmN3PCDkgSSAUdLyGGv/N+aWg88Xq/3YBAOLHjjeKvsEOyPJ7qOvQJsTwm/
         r41UWIzlQ/5Ax+ha7xRNy8kdIkTNxjA3q1QX8n9bXAh3z/8wB6GEn84UnvlT4jKe1qmu
         sQyc9OGXZjTePH+r4Y6e6ozh0UMlJ+VYjsnu2YRncxwQaVJ+Cf7Nqth6cXAsabwTRyMX
         v6eeeBBdHDjqYX6OiT4X4zQkg5l42dCb/DNQDsMWC1atimcSE8JSmejQfjKp+N8Ip6uu
         zd2ZsR9jcfUX1/JB5xCLWPO6fdSMIACYocvg6A/MPAxkpU5nLiRN3WCB2A8Uz52//cN+
         kz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969329; x=1685561329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTcYn70jypAxoGiZWNhXW/f3wJ7PRfT+UBBqvcdtR7Y=;
        b=Q3NaGQEHjroOF+1UW7wtiz5Os9EUK7jKnnSF2bdQQ9BD2o+X1rrz3Gf571dJkVE/yh
         hc+UM5kQifbNDtcYibLCw43G9yXRxKIPp86Wt89W3dimhmIxugEAAMnXzeLSLEBIsOJw
         dKgcfTX4vpFZdDMG3e9KN10Yv64aeRHpyGx9U8fiy/6Joh9I/xxqfHTkkv9SKBC2+xdg
         9vr91gIewmZ7qaplGpLmpQsHlwIhhLY8orfyjIdtV3XgFlqaneb8itvjEx9Qvf+lfnaW
         p0awsMeolOK94NHcIsWnJ5c7ACcGUyy1oGgUuHuxuts1qqfInsXLkl0bXdt2b8RurQG4
         H/Aw==
X-Gm-Message-State: AC+VfDwfZV7KP4cBZPthzrM4sqYgdn4AfmmwRiHGrRs8sFpK4b7I4y37
	2P9It2VUKQa/oTc69fkcN1Y=
X-Google-Smtp-Source: ACHHUZ6RkKtjORSVVTbvqSb/nEXqQaQ9JTIasvSEW6m9mcivHjmudekwdvS8zsaYUeAaqoCEzf8v6w==
X-Received: by 2002:a17:903:24c:b0:1a6:4a64:4d27 with SMTP id j12-20020a170903024c00b001a64a644d27mr17386318plh.40.1682969329458;
        Mon, 01 May 2023 12:28:49 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:49 -0700 (PDT)
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
Subject: [PATCH v2 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon,  1 May 2023 12:28:06 -0700
Message-Id: <20230501192829.17086-12-vishal.moola@gmail.com>
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
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bbd44f43e375..a2a1bca84ada 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2911,12 +2911,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2929,7 +2929,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2953,7 +2953,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.39.2

