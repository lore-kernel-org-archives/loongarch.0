Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0822548
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:59 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-57015b368c3so68959577b3.3
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467539; x=1690059539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2x+E7/HO6cxS1FKNHsH+YAjV99GeoJ7wX0XOkEEtc8g=;
        b=YrTQVBS1aaA3+7mVapNSFssjb2+AQ4IJNUOZvGKIi0FFDtk+PI4lWjji8UMW0kBniw
         NnyjjbhzJwR9iWxQ73lOHY6xUHgKO2FQSJubgoxvZQoc6uqJluiv8iO+GgjzyRPTTUNL
         H+9Lt9/vRpqFrdhngSNsPgL94g8nz/f64RVJUcVyBqSkPnGnipXpH3S7tTsIQsIL/Sfj
         /1Ey+dh+UNfiOBDZVuuR0MUQqWyu0BLKscPyo1/sCfwSnYduy/XWfVP10dsKPKfMX/jd
         CyoAvKAcNWnuFLqmsDX4R/ZAToeYgRboOEEoeu7mlCBRRzYoIoPibXR4stY18tIHtLmi
         9aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467539; x=1690059539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2x+E7/HO6cxS1FKNHsH+YAjV99GeoJ7wX0XOkEEtc8g=;
        b=NV2LzeyFQc40d/gMS+f7BY/i7Mtt4EOFmVqdMFAcC1/cS7DWzfvwBJ15tisOs7/CGu
         U1UpVX96lJAd4565HvoVAHCVaeoE6v6lxfM9MpiygCmDozKmhnvBiNhs+5LJg7gOLXRt
         a1mVZZ3J4aQLuED6KKlcxAsW5Ors33m3Vdv9DCRu7Qh4NbHWb9xlkgGJWkTJ+SFyjrSK
         3QZYBSBmHz30dJUjNEv5Z2+0vkcWzviCYJEHIIUKYw30EQIZ16DI5njy5HNOrNvFqCVu
         iBa48cTls6PRUXbsveStak+Sd09SbWkpWdkJfWQGyn95/nxJKjnzWNzUXocat5g3sNS5
         MGmQ==
X-Gm-Message-State: AC+VfDwIn3HuAiO4LZBgos1v/RJYl9zL2+uipXzMbeISYaZeGqGTX5Y8
	jCmfHJW6N79/ovL92a3cLnI=
X-Google-Smtp-Source: ACHHUZ7RSJK82blK0n8uMP8fjUDg81SPK6py6Hg2BA1/I5Xa80rVzDG2S/aTt1mnsQBJvwPYu3STMQ==
X-Received: by 2002:a25:2102:0:b0:bc8:914b:c83a with SMTP id h2-20020a252102000000b00bc8914bc83amr11442005ybh.22.1687467538676;
        Thu, 22 Jun 2023 13:58:58 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:58 -0700 (PDT)
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
	"David S. Miller" <davem@davemloft.net>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 30/33] sparc64: Convert various functions to use ptdescs
Date: Thu, 22 Jun 2023 13:57:42 -0700
Message-Id: <20230622205745.79707-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 04f9db0c3111..105915cd2eee 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
-	return (pte_t *) page_address(page);
+	return ptdesc_address(ptdesc);
 }
 
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
@@ -2910,10 +2911,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 
 static void __pte_free(pgtable_t pte)
 {
-	struct page *page = virt_to_page(pte);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t pte)
-- 
2.40.1

