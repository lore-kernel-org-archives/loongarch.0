Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408503D399
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:32:03 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5689335d2b6so718927b3.3
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 14:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568723; x=1688160723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=P+sFLMkiyDDyXlnEG12Vca4wXTlsNP1tjr5mpQ3xYowZkV29Gi4DHzR6qoKyncOySw
         jnRT0Uzpd7rJ5SnFzozOgbTxqzpBvgdV5deGMByJA1EX8U9bDlcdVF5nVlhFFf1pyZ0O
         KrWMXXKGFgo38kAOB8ncfn/SPFyRIIMw4Td8wl18EIsvccYdq2AsnvZ0dkbvnVIaV8oQ
         lw4pGC9Zhdztp77vkJB22l9Fos3IjWhzJKFNlsAyyHAnjGjJYghL1MXToen9jCOsOslF
         dBNcDAuc1Cy34XA+B9s+UNYDNSEGNOwzJVHJrEoMCND5EfDLqD8QbuDF0jEbofHqgPPQ
         P6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568723; x=1688160723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=NjBcdMWWhpuuN0/xJD25ksw5x52hYCLcxm1O3F37Dc5QFOuliKXPmLvmopoi7dyovO
         9G3nzCAQlBA05dizubkavX5DkmdmAvvb939iDa2xcZU/KWKOTvXPr4lVo1TcdKaR9EtU
         IKDLOhbt0uY8GRHSvi3lSgS9XO0MMC0VXj3kn6mMysncnvijUvDC4yOAyE4OSV5UT1Ur
         1t73jU8suKG6PJwtKSLoxWFPE9T1WhE67XFyiyZL2YHCyWIWxc9YwTk0YWXdZcLqqF9H
         4CN2GfJMVcAkcxGf4CJrTjecXIdFHf9WSNWabBKcJrKZlrzl89ROH4ARRYMMVAUrmqB0
         Ocfw==
X-Gm-Message-State: AC+VfDwaB0Hh9Gd6+xTz8IhjNvi2YKkTsoPmW+ZBf+MSuLmZESNEQaH5
	kEPze2IC/jRf8w6dzkMQgeQ=
X-Google-Smtp-Source: ACHHUZ6lpvw1UsG9eqv+xSZaIjITC9PhoF1JcriZ34z9zriWEJuaLEkcr/e1lknRm4p3R1WVQNwsxA==
X-Received: by 2002:a81:4ed2:0:b0:561:7ec:cf90 with SMTP id c201-20020a814ed2000000b0056107eccf90mr7025257ywb.42.1685568722698;
        Wed, 31 May 2023 14:32:02 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:32:02 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH v3 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:25 -0700
Message-Id: <20230531213032.25338-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ce6bb8e74271 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		pagetable_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.40.1

