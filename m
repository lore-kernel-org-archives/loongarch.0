Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BFEA2
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:16:12 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-570877f7838so42437087b3.0
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835771; x=1690427771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2x+E7/HO6cxS1FKNHsH+YAjV99GeoJ7wX0XOkEEtc8g=;
        b=PChVo0lfe7Am1Juwq3iG7RGGrP0XqVtToprVlSbVPrmyTboyAd49pm1+evSB9B2tFw
         kXjlu6Q/E8ApcKDqDyfQ8SExeWZmFlXQXipKcu1XJWfNM69YhOWXhf3ISbUTXIBhFgb0
         96QCzhEZra+XSmonTSpvrhyWNfhcBtgM1hIeMstisaUf5aqytakahkQIURxFAuMmzadV
         6ZXbtsztDtfR61NxP+OmIDHBWYbrG0Ze8ny7+vi6zis0kg+kLkgyVN6ua8e4P9XYJM+O
         StKP4NZwkZwEtlTvPnxWtxrHSt+7T/pJDNCTHMVfEfjXHYKpAk/tbkRioOk7ft8zrct2
         Kzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835771; x=1690427771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2x+E7/HO6cxS1FKNHsH+YAjV99GeoJ7wX0XOkEEtc8g=;
        b=fhRJQ5eEF+IfMdcHJh94onc6KvUxM6ulqcBCxwqEpd0ZQuyttI2i5mmHeo5r6gK6c/
         N+vxOMnyCtbpyceWWmjLPtoYH1zDJwnEcjGwPWcQrluQOnagBAhbVUwaKppfV9lYw3Us
         hCCvp9p2XcXndT12JHTKYGMIau0NXenZhJEiopJSQwDhoc5SGvD9WEgL2KNUge+ciMlJ
         +5YFIcjb97wcirnaUKH7uamzf3ZJ+IRKTScvYzdtZ6rnuLOYrlaALRCGO734BFkBBlGR
         ef6rHEwYqN5vg+tNUzVNk8tYho1JjrwS7afl3BFVsmp/ds/fLoOZ1IeZDMJ4+JCD34hW
         7c0g==
X-Gm-Message-State: AC+VfDx5QN6OlxNNBlhHbY+bXcxId8HPoOHv+IgZQk81AT366L7jwY58
	gm53i0DthUvfeVS7ihChITfmbrBuLmLWeQ==
X-Google-Smtp-Source: ACHHUZ6W45+nYYtPli9FO9SD+YRunw+Uuhdk8hdZzeF/68wsjhLAFg0GoFHHxkB57Ykeq0XvBZGu+Q==
X-Received: by 2002:a0d:e293:0:b0:561:d25b:672a with SMTP id l141-20020a0de293000000b00561d25b672amr31395214ywe.21.1687835771352;
        Mon, 26 Jun 2023 20:16:11 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:16:10 -0700 (PDT)
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
Subject: [PATCH v6 30/33] sparc64: Convert various functions to use ptdescs
Date: Mon, 26 Jun 2023 20:14:28 -0700
Message-Id: <20230627031431.29653-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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

