Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1D1206B2
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:13 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bc43a73ab22so23040276.0
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467492; x=1690059492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwvXTPG+SvX1bm+f7lh9ddV99LBkA8HMSnaL5DvtP/w=;
        b=V7iIPiXuenZc5LxLPVAYTxoBribtdhvsXYi0NcHOJsAsyDJa0lFaEv3HMhCS8nZW6D
         tBGbKDLUXgq6SXB+UHfoUVwA1VP1oc9uyCsQtJaaWpV0A9i7GdGsTkpa9yZ5PdH4EtVM
         Ni1Gr88vaVkgSSmwVNY0eyneVDMvJ4SahI/dxEEDmyh7acczYA1fdB5Q85cg9BE7TeJ5
         v+qGG39VtOAMjNZakRVRxe4b5fNSSUnmW+YdbvmJDes0xjF1gJ/GuHYdLYvgYUIG6iI6
         eUC4zgsXmS8SGsNdBxCv7WeYY6IHbiVQmbpLNYO57IVPmerTWPsJRHKkJEBcDrOn9Fu9
         t5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467492; x=1690059492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwvXTPG+SvX1bm+f7lh9ddV99LBkA8HMSnaL5DvtP/w=;
        b=K3NEcfhsPpJRmKIJpovwLMDPDNoqxDSuto1raNF3SgqMe53TlpkSw1zN60M7q1HON/
         KoLbMvklyKum9CgxglvXOJXXmaypjbHkn01LHFvv19Jghthjgxo6RZ4JAJJBYYYet/2X
         l+vBw8k7GYHOp1a1DVfdktd30VlPgG14dWmIjIWB+2Zr9iQKLbqeMEkvyTRPzBP204Pg
         98v2NQM6QGLNoL0OiP28HtqlY0nM+Rda1PtcWmEMcQ6fg5axmT8DXx8YQ0iOhMHCDWSR
         dff3r+ilFvKkxjVqvcETr08KvXO+i0GF66CSzVwKbjKeVbscdKMU7846HgYvB4InHQxE
         Jkww==
X-Gm-Message-State: AC+VfDzZtd9+sn3L6OHPZZiidGPle9We5j2GXSAAoEE2zqLD+sUn5SG4
	Liij06IYiAAa8PLJBtxrGjs=
X-Google-Smtp-Source: ACHHUZ6ppOE9aJqUa6Cvm3ZqXuUeTC6rF3mEFKF1yW3aWJUSdADhBmOmFOGnjJA0vfHR/02sJ+sTQw==
X-Received: by 2002:a25:1406:0:b0:b9d:766d:f72b with SMTP id 6-20020a251406000000b00b9d766df72bmr17309619ybu.31.1687467492519;
        Thu, 22 Jun 2023 13:58:12 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:12 -0700 (PDT)
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
Subject: [PATCH v5 08/33] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:20 -0700
Message-Id: <20230622205745.79707-9-vishal.moola@gmail.com>
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

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0b230d5d229a..1c4c6a7b69b3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2926,12 +2926,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2951,7 +2951,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2967,7 +2967,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1

