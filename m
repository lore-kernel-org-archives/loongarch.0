Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F9C8D5
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:04:59 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-56ce96063bcso37489277b3.1
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603898; x=1689195898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIxlKckYoNWIlWWgwnqqyBbBSaaTtt3uqS2t74G/Cdc=;
        b=dEzJOtzxLU2ZgnRZWUoqUgX1LkEqjEDlA4j+okrU2e6EDfoTOSvMm21aq2NnoI678R
         /LX1XChQ5Sb6AvjVNxtMPEQadtzbeWOF+8rQnJrR7+vmusoCvLySLO14WPjcNIRUT0dF
         2rQMLU3uAHVNRz0iVUR14QRbNE3w1MtZleas6+gopDWiSHJ7z9AcD/gIo2kO1Qn8dYbq
         016n5ev0Z4+orrxhRkS9jR7LRRnc2lkVCuuqKiR89ABW/c7EVFAaF7NtNMlO51k6MesR
         a4Umst3ZsGaDroxenZAsFOjCXCF1Egq8LClHBVmEapvlxmVVyTvGXFdEnpS3DAZrTLmY
         PBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603898; x=1689195898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIxlKckYoNWIlWWgwnqqyBbBSaaTtt3uqS2t74G/Cdc=;
        b=c440njm8+LQdsvp0i7jUAwp0ajQrGVRghuSkJtB7o8KZM42CYKErXDp2bVnh4dp6++
         SoVtV80pMrvUXc7zUwe3kkyUe2LJ9sRkEAc1v9m/hJJ3CGg1N/4LnzCRLaJZJgxptuD8
         8GB84Gi/GCVqlcInX5f9Xg0oxKvvfN7rN+GbF4G+u+JibkCkW4hUZxkKF4kd1mxRQZXk
         u5LZnETz0B/6FPI8PsKzuxDCua/lbE7jCHHaighQvqCEVEg7XYblGiG+EiwgLsvPUdFJ
         RLwLhZbK6eg56u9i2wopV8Co1EDzoTv3vd1Su5VvOpPuvHnlMeegEkMm1bFGAkEiPsuk
         pj1g==
X-Gm-Message-State: AC+VfDwU5LehgSGSQd/oStY+ewzKv6nIxZJtjnkbF/iHGcD3Iapi5YR5
	1wdl0p0gqacsqwPXxzloGZY=
X-Google-Smtp-Source: ACHHUZ6/Iw+ntCpwv4qU9urdFcPsYepvqoySZLtVMefOmpx6b7rcyARehfEWJ2myv62OL0MPJVk5RA==
X-Received: by 2002:a81:7287:0:b0:561:b246:77df with SMTP id n129-20020a817287000000b00561b24677dfmr12849071ywc.16.1686603898264;
        Mon, 12 Jun 2023 14:04:58 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:04:58 -0700 (PDT)
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
Subject: [PATCH v4 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Mon, 12 Jun 2023 14:03:55 -0700
Message-Id: <20230612210423.18611-7-vishal.moola@gmail.com>
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

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f184f1eba85d..088b7664f897 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2931,15 +2931,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
 #if USE_SPLIT_PMD_PTLOCKS
 
-static inline struct page *pmd_pgtable_page(pmd_t *pmd)
+static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 {
 	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
-	return virt_to_page((void *)((unsigned long) pmd & mask));
+	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
 }
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2958,7 +2958,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

