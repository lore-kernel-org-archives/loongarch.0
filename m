Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B434E206B2
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:07 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6b5d1498670so1679022a34.1
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467487; x=1690059487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MMx6i8bJUxARp5QNqsq1CJUY3hOxlwkAEMcUNtK7dI=;
        b=UdIEW49a6VlVFdeDO40XUMIhkzu0TZbzMPBM/WacFFYU0Mf2IMmAOz+NL1cV98Ton4
         4zQ7N3mgDzFH/zAeyyuA7dsXAtz6L9a3ryBLZR0keuhq84g9s5CyaVK84D28lhUtpY1k
         n1Pbrc0aBtOd2I2lssPU62Gn+t4FuAK2YSMld5ItzYd2Gb7upO15jx4dCKR0ZoMoveD4
         fYCQ1IFYfK8OlRQ+gZ/yAiK4LxmWYPlg8lrZ4XnMaYZEtLSmgFLWfXItXcddGU79r9OH
         9d/82j8McTJZKyaaoZkqZMldnjmKIChpQ0nH7tpNr90msjJzxK9KTHEvxYDWGujERLdc
         e96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467487; x=1690059487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MMx6i8bJUxARp5QNqsq1CJUY3hOxlwkAEMcUNtK7dI=;
        b=X5hR1l5+HFcBeePmkxAmf3OQFXb8gtF43vuiSJAFaHZpKb4ucxvqX4Ujjs3zDb1N/F
         v0/pqxEgyTxFu+LyJhOhe9umUiyYFLi2j45gieLNwk38OCCHEwnatP07HpQdMqocPovM
         EmrD3OFMQ7KL3fb0mKNg9XOUQJJgUhvBo4Iucw4rbc4cwmp/dw7D9qzFExZ6XRP8znZn
         XwzbcK7fIrmOD74f9yportLeieps3RJpp3BI7hkOIR80qBft5lreKlmYsZY8/IkMYjnJ
         q72t5B7K7wePjqSlRF64IFbQeSXqcYKtsi0PV3JVvh+/s7MD0Kt5cL9rPZUnT+cAEpSO
         x38w==
X-Gm-Message-State: AC+VfDzJLLznPl9iOSYeoO/jOrpTyVV+QZFFqUqniIoyayM4L55bd765
	TIIHv6cWwU6AS/Phq8IomaE=
X-Google-Smtp-Source: ACHHUZ5msoxCs4WtHFESbyMK1EuaDf4wukFNhVJUOVId63qr2aSW3HXx+zFK0CBZB4PkAluxQSVOjw==
X-Received: by 2002:a05:6359:2ea4:b0:12b:e5b1:1c9c with SMTP id rp36-20020a0563592ea400b0012be5b11c9cmr10630381rwb.14.1687467486510;
        Thu, 22 Jun 2023 13:58:06 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:06 -0700 (PDT)
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
Subject: [PATCH v5 05/33] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Thu, 22 Jun 2023 13:57:17 -0700
Message-Id: <20230622205745.79707-6-vishal.moola@gmail.com>
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

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 14d95d494958..1511faf0263c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2915,15 +2915,15 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 
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
@@ -2942,7 +2942,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

