Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5B82109E
	for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 20:58:32 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-763dc87aac4so187123385a.2
        for <loongarch@lists.linux.dev>; Thu, 22 Jun 2023 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467511; x=1690059511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nccUzLka7Xkr4OuMpYk05u/KaIGQrzDFYQttz/vcmHQ=;
        b=bxkxtD+QQAC8zd161RKeCcg6MaoPAPE7L+CauClsYEL0Xy9+Td62VuxUGsgYxnFiq0
         O6uvJ71cZ3HzaD3sn95/EOTS8BXKpmL+IQrAYm0nHFHW9S+p9vWLuqdK4qFg64CCRbun
         joR+Hl/5hsxihcXKPDNMSOwFhI08HqC+OD8d0u+5w8Qz5HarhFJT9jfwORvF779fEL9V
         zRFvHmiRuYANo66EVjgtR36nI9raB2GVIEDQNVqxyl97sNwtEBiuGHRD00zHWqOmK+wx
         CCZ2jYpmNaAVgCE8uPmkzzzOyp8bu94YHjJqAydk7W1+LKznmMU3DWFCBUl+KliiUs4D
         rLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467511; x=1690059511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nccUzLka7Xkr4OuMpYk05u/KaIGQrzDFYQttz/vcmHQ=;
        b=NeVbUqo9fG4bSRCsS2gfswSY7hvd5CU2R4ja/zyQZUGP2dJ51b3n5MExb/hL1QehKH
         j5kP+xr8J8/stCn/4nXfe85ws8VyqxlMTAIF2UisUapJ0y1pvvIDOnwYg0Fyc+mRw/Yr
         obx0NGY3FzS0Lt723jlv0NJXPaLCo057TovBeLpWd1+SBfW8ZJB9W6zErALKIHUObd8D
         IAhreOr0Z8Ys+vrQRA29FU/UmtRnZOn2Yt8TDd/I+eWD+taHpUeNKPSz7m19vmSHsXtY
         VBdrihoJFtbtKEPh0R8QHweOyhSqw9tz14YVkHYy6/qAeBEGYuooUsZr7u4urRj83ycS
         +7TQ==
X-Gm-Message-State: AC+VfDzpD9EB/a1gD4N13NcJQa1+Xq43woRzYhUOwOALOFovgCxeQpLN
	geHFpl9+r9k6v0iIPOt5qaE=
X-Google-Smtp-Source: ACHHUZ4ad8Rj1cEO907Psdq+ajLgAiK0FYJ6eHB9wwgKt19FWwArd1FWX8Y4TNXwZH2eE/VH/YBYiA==
X-Received: by 2002:a05:620a:4790:b0:765:41c1:31eb with SMTP id dt16-20020a05620a479000b0076541c131ebmr1410020qkb.48.1687467511080;
        Thu, 22 Jun 2023 13:58:31 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:30 -0700 (PDT)
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
Subject: [PATCH v5 17/33] mm: Remove page table members from struct page
Date: Thu, 22 Jun 2023 13:57:29 -0700
Message-Id: <20230622205745.79707-18-vishal.moola@gmail.com>
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

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm_types.h | 14 --------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index fbbe4e93a9ba..434e54440686 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -141,20 +141,6 @@ struct page {
 		struct {	/* Tail pages of compound page */
 			unsigned long compound_head;	/* Bit zero is set */
 		};
-		struct {	/* Page table pages */
-			unsigned long _pt_pad_1;	/* compound_head */
-			pgtable_t pmd_huge_pte; /* protected by page->ptl */
-			unsigned long _pt_s390_gaddr;	/* mapping */
-			union {
-				struct mm_struct *pt_mm; /* x86 pgds only */
-				atomic_t pt_frag_refcount; /* powerpc */
-			};
-#if ALLOC_SPLIT_PTLOCKS
-			spinlock_t *ptl;
-#else
-			spinlock_t ptl;
-#endif
-		};
 		struct {	/* ZONE_DEVICE pages */
 			/** @pgmap: Points to the hosting device page map. */
 			struct dev_pagemap *pgmap;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e9bb5f18cade..daeacfe3930d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1044,10 +1044,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 TABLE_MATCH(rcu_head, pt_rcu_head);
 #ifdef CONFIG_MEMCG
 TABLE_MATCH(memcg_data, pt_memcg_data);
-- 
2.40.1

