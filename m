Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0511E502
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:05:13 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-56d2ac0d990so21803067b3.0
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603912; x=1689195912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpDrDA23aZZSOuD9ECPgZVlXX9wPcibxiFG6a9Pg6kw=;
        b=YrxPmjxN/Qkfa39Za5HTgq4QQ3f9/zju1xoEkMHY76VWuya44wSbPKtXjzKY3v7sqU
         GBxsM+H0usX0mr3+rL1pflvYDpTa44gJOcWxVcOnDkRvcMNiHbLrpt96vvJ6FNwKJltW
         cMJPyFVQ/eSt9EDvrymbmWnro3jKR5HGdt4l2wI6AjCbDnCnt1cg4A0jjRLl9BCzyZ7N
         VzgyM4qBAMmkmToFHzJWSn2lcW28mUGQcMgbZJj1Lk3UeDxgd0pcGGp9/tqybVBUSS6z
         sfRYAsqcMK0gYJ/10nym3sY5+OJ+ZE83bX/QwPKBvH0660Lco3siIL8/QCwpR8viXQgt
         6rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603912; x=1689195912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpDrDA23aZZSOuD9ECPgZVlXX9wPcibxiFG6a9Pg6kw=;
        b=WxywNJ3SSXohy/lWkU4WOQ4Jsv3JG1Qkfl+cJ7Bp/s205FHiE//Fh7NCOQhSfVc+Gt
         IacMBWkuDng+1j/kwug+nGofyCzQQpyvlEf/T2H1xCOj0dY0W3jxCIo75O3uaMtO+giC
         8yjR23a+RdMDJ37nEa1+sfk9FMb/04t8C+YbaCraPQCHmntYfi6UrTEYOPQuW4+wCMvt
         hP3b7/bbXre/bS8s9vbpeLQ0pIifM5Mky9eghIzxahEY7GRKxb557rTAWjqQkXhSVwCt
         22c8Ygnrt5JDKw9zBt2rfAd/XfgueBwQpgBVGD2TT77Tb/nA2GMhrZiI7iKNWqHyYMUX
         exJw==
X-Gm-Message-State: AC+VfDwzJbcKrJJBnZ3h/BGxsEc1ImtpPpaT+jzpKTgUbnHnwW/8qQcg
	lsda0A+s+uRS1y3M1AQNGI0=
X-Google-Smtp-Source: ACHHUZ4rEtwsIJS0u8/qiBl+7RQztIv/50rVsQeASCwgplg4IOIGaQtPyW+cRDHUBMrIJvgIE2xULQ==
X-Received: by 2002:a81:4e4b:0:b0:569:e92f:72a with SMTP id c72-20020a814e4b000000b00569e92f072amr14103246ywb.16.1686603912361;
        Mon, 12 Jun 2023 14:05:12 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:11 -0700 (PDT)
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
Subject: [PATCH v4 13/34] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Mon, 12 Jun 2023 14:04:02 -0700
Message-Id: <20230612210423.18611-14-vishal.moola@gmail.com>
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

Creates pagetable_pte_ctor(), pagetable_pmd_ctor(), pagetable_pte_dtor(),
and pagetable_pmd_dtor() and make the original pgtable
constructor/destructors wrappers.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a1af7983e1bd..dc211c43610b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2886,20 +2886,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
-static inline bool pgtable_pte_page_ctor(struct page *page)
+static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
-	if (!ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_table(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pte_page_ctor(struct page *page)
+{
+	return pagetable_pte_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	ptlock_free(ptdesc);
+	__folio_clear_table(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pte_dtor(page_ptdesc(page));
 }
 
 #define pte_offset_map_lock(mm, pmd, address, ptlp)	\
@@ -2981,20 +2995,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 	return ptl;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!pmd_ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_table(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+	return pagetable_pmd_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	pmd_ptlock_free(ptdesc);
+	__folio_clear_table(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pmd_dtor(page_ptdesc(page));
 }
 
 /*
-- 
2.40.1

