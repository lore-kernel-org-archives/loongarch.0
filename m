Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F66FBB
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:28:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-64115e652eeso29039020b3a.0
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969332; x=1685561332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/HbzXYZlFs8Glr3mCgcQ6yZjaq6zFAfxmTJm9brDXY=;
        b=YU74FvpHQCK1VqAuVX8r2BjduNpUerOh1yATlR8mKQ/tJLpS2WI1LKB7NUnPZev+ku
         rfgntGzBluAMKuHfK/jms2NgctRzUuZHcxtFDuNiPPeXkbQ7Z48v/aLnoLGhmcKi5okk
         NTHNilz0HthKY/XHg97rKwZvMnLAYPI7U1eBqYo3DUIS7zYhW0tg5v9W5kNg2nZAJHx+
         0W0xkqlDIUsVkMuesra65fGttpYRxCYfqsHDDsc8zlGh06W2A2UnpmXTtrAlRE/I54n/
         9b61gxsFscmWDNDgpJxss4pOhFtz/pn5R4Qs2mfASivX3bx3H5gbzbMc69UUOvWi91zv
         pr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969332; x=1685561332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/HbzXYZlFs8Glr3mCgcQ6yZjaq6zFAfxmTJm9brDXY=;
        b=NfIwOUiN0xQVIU3r8lxlfA99fOmP78nJ82Os6Uy+tlWUoH5tTwLcDvJhj8+aACcqD8
         FKD88TsXO9ewDhKxZxyVfppJSc37OFLB8a70xk80U5LchiU5N06PnCX2fVCI8lfTRH6i
         CDWpBZ0a0TGY2ObO6+5SQRQuCV5vJpSpAAvGbq1rxhPJ++uVcWSEqFnPLTST1k4JbaW5
         aWNAHyK93Y6y2FHVnSLq25zXye7SY+HRSPQc3aYcIdbyqONfsGLxQ3dyoruGopIn7tpQ
         WPbFp/VznNXNprRXA21AFfRLJpewWRmPv4srnXuNSC4b1kT3eBYjt8TEEOA75+KXJIP2
         ckBQ==
X-Gm-Message-State: AC+VfDzNXbcgGOKXeOdC3rR5v4d2BQr4ArqWtAle/AUpbnxQqNYBugss
	DbVhmPBBWhryARMPV1er83g=
X-Google-Smtp-Source: ACHHUZ5tlVMWyUaJdG9fqFVZnpLPEvgTINU205p9ECnUgFr/jtV6hdVvJcRfvr33OgCYwfP6dTnMLg==
X-Received: by 2002:a17:902:c94f:b0:19a:727e:d4f3 with SMTP id i15-20020a170902c94f00b0019a727ed4f3mr22987004pla.5.1682969332204;
        Mon, 01 May 2023 12:28:52 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:51 -0700 (PDT)
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
Subject: [PATCH v2 13/34] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Mon,  1 May 2023 12:28:08 -0700
Message-Id: <20230501192829.17086-14-vishal.moola@gmail.com>
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

Creates ptdesc_pte_ctor(), ptdesc_pmd_ctor(), ptdesc_pte_dtor(), and
ptdesc_pmd_dtor() and make the original pgtable constructor/destructors
wrappers.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 58c911341a33..dc61aeca9077 100644
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
+	__folio_set_table(folio);
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
+	__folio_clear_table(folio);
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
+	__folio_set_table(folio);
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
+	__folio_clear_table(folio);
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

