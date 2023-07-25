Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA4563BB
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 04:21:26 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-cb19b1b9a36so5683243276.0
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 21:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258885; x=1690863685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=gPlpDfbgQUaDh17nMUuxk8LJn1nYdgEAVfSMEcDpmwNJCwXKDaomTlh0BY+xZkFMKd
         tFRmLrBoE1Vp0IzzPSrF8bgPZVxB+9aP3VrUcSHjKLr+y7jNlD4PpyjtmGaGnI3Rciw5
         xPEUpzqKKaVrLEfBMw5DD9c3Ng9G9PKL+n4eQ6Zcvb2wmVEKnYUeBmB54WntK+cvg6UK
         QgMdLEB/drGqPOPjrgcd99xnUW0qMuGMWDmaVMRTFx92PXfEsSeKT6B4JdtVKY4BOuL7
         QKWH8kGjoeg6j0VlgnYB4AI/+z50XhZH+jdg01QIwrxx7GkpXjxyDTkcgrBZeXNJtHxg
         DmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258885; x=1690863685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=Qt2MpVPInGdXI5CX8DJrXWcrstkwqbhncPV6Yzp2/G5ifLJPX6CuEu9Rx8feMzZsx/
         SDPjfR+ybnXCABf/X7HmXhAt0PeHq1l8P++IEsDmr3GUY2f25+rTzniVlJsLFnHno/HB
         ElGj00Yqj4ojn2XruCYg81Jb8jHh2pjIhzHr/2E6fGhwqdtuyBg5GwjYeKB+7JIN3YL6
         5H0RWXSBho/Pxah5tiqRm4vVF0Z05ZaDNg3fDVuZEkL9+kBRFvVkorBk+UGcRwGaOwfP
         OAjDiVbfKzTZ3JGAAbKnZbSziJ21bTXBDGWs1daLK7xnDrAEkA+hk3YW6E/tATgPKePv
         Nb3A==
X-Gm-Message-State: ABy/qLYOuENNwbUEhG0nsR2X658v317/OJfvYDJx42GfQdmObIkmAM9i
	LXzZD1OARwW+V1ikL25kMfM=
X-Google-Smtp-Source: APBJJlEU2X68Ojav0w5cqMxtXa5ryZpYlhi5g+xNY8vonB7Weqi80FZO/gUhwzOoBC/kjqTB4Zo1Gw==
X-Received: by 2002:a25:f827:0:b0:d0e:794f:64ef with SMTP id u39-20020a25f827000000b00d0e794f64efmr4552557ybd.0.1690258885213;
        Mon, 24 Jul 2023 21:21:25 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:24 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 09/31] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:29 -0700
Message-Id: <20230725042051.36691-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 675972d3f7e4..774fe83c0c16 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2982,12 +2982,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -3000,7 +3000,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -3024,7 +3024,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

