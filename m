Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88022548
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:57 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-763d86856fdso194356085a.3
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467536; x=1690059536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=bI7F5jd8U0pmZoDCjrDdgbVISfzJlV2CUqYAibSVdHZ1OfrWu+Og6tKjTlcLZOSWFx
         f+VE9wjvDVgQCRSbWCOuVgmL30v4mkM+TeOOIsHTqjG+MpjulK0jZg8Kight1gJqL3EJ
         uelPGFi4K83pZcziIo91nBQ/Xb1a7VXoH5rDwteSo81u0B0E0AB9v0ZYlD/3EFJOnXaR
         LHJhz4j3eKvixa2uY3tcUc56YA7rm/NnSwLp194pufjXDiSsyScPz/VvaVef5k0S3cDu
         KA06LddfVd5MnGrcrI8kMVYj85Gsgf9HVHh6xfDQTCqtTE6ZYhHSEi5n5/a6D65T/xzp
         1jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467536; x=1690059536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=VLP8zaPER0Eo8cTZ6KvxSnTMLfFxVzYIrXhDV8+72EsTpbPKXvUNfD9gKFOtzgw8mg
         PF06xWVb/xnYwVBd+62Xknh9zh1T0VXJe7C5Fdfpw0ardeEV1V3njYyhD/337wCpVb3z
         nZNl/o1Ro+hscT328OnwtRexhJAZHZFDQL80hD4TXE9lV+byWlUE4+NVabFYt5wSNXz4
         LjYaq0aAf8AjXKuSEX9Aua9eXGSd433TID/tcoKvojMHKWUMUegM+BWbqI8QyoXlTep4
         Fv2smHirIqiEh/03ZQSXm9zFd2iHrCfv8BFyyTeAvBAZHybNqqUa73ILXtnXVYx7Wsu1
         i4mQ==
X-Gm-Message-State: AC+VfDyREedPGDYnBqkBdPqD41d2RAPcVq6jeW+twQVR21o7joDtRFbb
	BqQazzQsImTLWig+V1QBwXs=
X-Google-Smtp-Source: ACHHUZ6PptFNgBqCV4/Z0wvxz/N4kUJPrg8w5rC/9pu7Gesur9H1ncl000IRfhTCjlej4fSGBBngjg==
X-Received: by 2002:a05:620a:c55:b0:75e:d11d:51ab with SMTP id u21-20020a05620a0c5500b0075ed11d51abmr23662404qki.9.1687467536577;
        Thu, 22 Jun 2023 13:58:56 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:56 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 29/33] sh: Convert pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:41 -0700
Message-Id: <20230622205745.79707-30-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..5d8577ab1591 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PGALLOC_H
 #define __ASM_SH_PGALLOC_H
 
+#include <linux/mm.h>
 #include <asm/page.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
@@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.40.1

