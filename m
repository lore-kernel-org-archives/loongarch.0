Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99549A94D
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 20:53:02 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id s23-20020a17090aba1700b00247a8f0dd50so3409805pjr.1
        for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 13:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764782; x=1684356782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrZX7kBoYSlYOsS+wVtDQN8RsK5AFCnoOOzdjwi5Mms=;
        b=Fq/GP8pcdLi4I5bPiFEsvLaXpxmzLee60TMK8PZJIeuQRzzOkEw4LNRxem1TjMHkl4
         hpoJjh3mkwkBNIc+7ZgY54HKylkrI6wgo3KFZgMqWIFkgvOs6SvSJyDnyNXKU57Vfgni
         F3o9PaXHz7p6eZRgp/mKtHM6HxVxSp+JnGgjpmMtA2nsWbkEb7dNgfcs3WzKBla+e/KK
         mEc/vn9ckYnWIktc03O3OhGV7y0sYxPsn1QEH3DBGZVQjs25sE8N0p2VjcijmIU6liuv
         XPjI1oYrX0OJGyw0BE4l6r4tCUbdIF44UY/L4uGFZKlEP+7PRKuryCCDJJcwRQi8c96H
         TYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764782; x=1684356782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrZX7kBoYSlYOsS+wVtDQN8RsK5AFCnoOOzdjwi5Mms=;
        b=bnOvugXGOS7eElYRAu4Lb7sD3WVsolszI7ZK+Q+nGTAgTmWItnF6enqzXS2b7ZfPMg
         549PIRyBAqunZnuptyhLhpX+Sd2+Vsl7bwdXxl5bGVB8D18ARVHla44QUFd59lU0vE+D
         Gh3vOtE58lhSlnn2hi9Qt9eF8Xu2X14maWKm7G+mZRQnDxynO4AP63yex3ll/uMFsMau
         PxykbET/ZNtoDc4ygjEQFlTIZd9/Q9VU7q0NuPLsTFvM28OMxDFEAwZwV4GAm8fT4NAM
         w9RphDg/Lww3t4CFdxux+QP3DjhOtEI2fFuywfG/XAdrV9DU3rYzuptkkYya89jyuu4o
         32Kg==
X-Gm-Message-State: AAQBX9fx5J74DKYuzIH8qchn1IlPO5rutqJDPvJo2a4EWD05G48hePRO
	NmAKWANrQZd/OQUpTmYYG10=
X-Google-Smtp-Source: AKy350ZKSmY2j825YUr7PKp4UY4ecmOCun/8MK3oszIbqT0tc1tYYx3cO7v8JESnTYGwYaXHIhiESg==
X-Received: by 2002:a17:902:ecd2:b0:1a6:9671:253e with SMTP id a18-20020a170902ecd200b001a69671253emr219179plh.47.1681764781984;
        Mon, 17 Apr 2023 13:53:01 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:01 -0700 (PDT)
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
Subject: [PATCH 12/33] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Mon, 17 Apr 2023 13:50:27 -0700
Message-Id: <20230417205048.15870-13-vishal.moola@gmail.com>
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

Creates ptdesc_pte_ctor(), ptdesc_pmd_ctor(), ptdesc_pte_dtor(), and
ptdesc_pmd_dtor() and make the original pgtable constructor/destructors
wrappers.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 17a64cfd1430..cb136d2fdf74 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2847,20 +2847,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
-static inline bool pgtable_pte_page_ctor(struct page *page)
+static inline bool ptdesc_pte_ctor(struct ptdesc *ptdesc)
 {
-	if (!ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__SetPageTable(&folio->page);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pte_page_ctor(struct page *page)
+{
+	return ptdesc_pte_ctor(page_ptdesc(page));
+}
+
+static inline void ptdesc_pte_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	ptlock_free(ptdesc);
+	__ClearPageTable(&folio->page);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	ptdesc_pte_dtor(page_ptdesc(page));
 }
 
 #define pte_offset_map_lock(mm, pmd, address, ptlp)	\
@@ -2942,20 +2956,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 	return ptl;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool ptdesc_pmd_ctor(struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!pmd_ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__SetPageTable(&folio->page);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+	return ptdesc_pmd_ctor(page_ptdesc(page));
+}
+
+static inline void ptdesc_pmd_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	pmd_ptlock_free(ptdesc);
+	__ClearPageTable(&folio->page);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	ptdesc_pmd_dtor(page_ptdesc(page));
 }
 
 /*
-- 
2.39.2

