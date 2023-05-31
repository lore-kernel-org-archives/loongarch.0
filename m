Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54723D3AC
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 21:32:15 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-561c1436c75so810637b3.1
        for <loongarch@lists.linux.dev>; Wed, 31 May 2023 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568734; x=1688160734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=Gco7uaZ8T0f7tmyth6uZeLtIanv6GpulpDiuQwIsnzqnPkjzJkIu0h1PZGQ4iQfI5A
         Wsvmi3eI4+D34lVcMDUsWRCETH5qcZJ6o4mHbMVq/3LTC/HNm7eQ6q2KfFVCA86f3d3I
         LxBFjI2qJ2MPH41lEvrCJnwlKDxe1mBh52b4jr4phbiXUV/rBKhdQfCzS+0QvKIx+CwJ
         I9nD3g0MgWbwsz1cldEhhb6oFNl81Iu/IWeIlG3kHhqR9NOaQpioUXIEm19YojgZVH7b
         YKNDEnmfXzRXtSrjS8AB8ePFyFPpDGIfkcu+Z1fbAVxcvdW9nHAWNVZ44Hj2Se7PAnUx
         U49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568734; x=1688160734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=MvmfzQbXqhYQMBZU0CM2HN1VhJ/tFAeXPX/DRXIs78o0ZXjY8QguDI/Or7W+oeGQDR
         kis23rvOqRl7okS6+GBm+/YoRG7sbV1dgkRC36E6DpPq+q2LAeNAlwAVl4GFmev/Jg0S
         JMwcS3PHsHdRFQqNKIqJ+5J+Gcl9PWciTjp6rF2hJYFjaTLTIH+L9yQk5N4e1iCN5sVQ
         8vpfoDZnJRaMcZYGHauJSJ6XEOfBCOcYior8Ubi02mex5qS/ciORaAKEjOSDk643Nvib
         XQGihG5/Or7Wny5Hx+jHqDD3/sLGfITMC743vvSM642u1ZNk4nHvVfKU4+WYC2CiEUYI
         FPBw==
X-Gm-Message-State: AC+VfDwGumwXkhHQe3DwA4nyK1VkQJF/4QAQCUh/HIBeIS5AlXlgeV1z
	/If8+vXm/NjQU5K00z76HyU=
X-Google-Smtp-Source: ACHHUZ5gIOI1fuO3+omWI3ZFi04M+ls0ECM5yJW/hGOTfIhuUEs0QHIWlyyE93+ta0AMRd/Bn9r+fw==
X-Received: by 2002:a0d:db15:0:b0:562:6c0:c4d3 with SMTP id d21-20020a0ddb15000000b0056206c0c4d3mr7636270ywe.13.1685568734582;
        Wed, 31 May 2023 14:32:14 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:32:14 -0700 (PDT)
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
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v3 33/34] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:31 -0700
Message-Id: <20230531213032.25338-34-vishal.moola@gmail.com>
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
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1

