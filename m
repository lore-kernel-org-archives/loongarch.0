Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F53B6FAF
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:29:00 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1a6715ee82fso29080405ad.1
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969339; x=1685561339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrqntkjJd8BO8YfASMnosk0HIl+t/0EXXW8sSx0dJVg=;
        b=YynIc3MWOn+7eKGjmZARCn/IjCANfe8gTHKhI/1ubKTs4ZbiubHG1P9aimD9KzNrIR
         eunJCIzqiXfZGl0CCMrWEsO+nwpbu9UTA+2coBncf0PpX1ohouYsG2DEdDJZPuTXi/ir
         yR5oJPT4K2awb6eBfuzacZRfwPXKDUNKWynDv8oNvVCBXhLYj3JhwMiPBRO+Fg6hjdSs
         FM9xgZDHU6Sc+urW7voaFKEt/7m6LjDuxZZp6qL4zZI9dwEcGtT8oaSDqFIY7TNV4Oop
         NDnPsASY2UskW6usELO5k/OqVJv807YApzHQHt4bSD2BLXySmWIPAbRFeQIxlm3YwdkY
         qcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969339; x=1685561339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrqntkjJd8BO8YfASMnosk0HIl+t/0EXXW8sSx0dJVg=;
        b=fW7x+Ek+YOCI09kyEYUN7vu5+o43FVZVMB29B5JFbiRFbM6GY7ZK3iyWpM1cdGqOe3
         H6bxgh/UJCi7TnBkNIBhaddFfDC5ZFgecJldrcVoMmIlKLlr6Wm9iGbl0P3z014ZzeUi
         Qe9t/04hEttN3seECx1e4Mml+OCZBF9DF733VOuiZ/q7ElUCAcqI5Qg4ajal5alMDvhW
         iQ/U29STPzIlAvH4y+MxqZ9qSBgYYUiPLHX9IDnMyHnk7JUE5exLcXJPJelr2xHJKnLt
         /NTcuD/bHFz1LqLF5FlysM8go5VgyrBrREpHWIKCEnXZ5cPKpzYQ3mY1/9hXOlNj1AIQ
         92rQ==
X-Gm-Message-State: AC+VfDxpD6mCfv6Ett5EGpAsbUa2QUR8TVt+MaWOlC2gTfR+L/3pMkVt
	YN0EH/eykR1Tsxf2zYVbYsw=
X-Google-Smtp-Source: ACHHUZ77ujqEA4Fn1OLOb7e5ecCGVNnJtAoTp2B3mAkadiAfSXyelwvqP5mlNEo41vojA+MW1rmqbg==
X-Received: by 2002:a17:902:ce8e:b0:1aa:efad:f2d4 with SMTP id f14-20020a170902ce8e00b001aaefadf2d4mr5633464plg.63.1682969339499;
        Mon, 01 May 2023 12:28:59 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:59 -0700 (PDT)
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
Subject: [PATCH v2 18/34] mm: Remove page table members from struct page
Date: Mon,  1 May 2023 12:28:13 -0700
Message-Id: <20230501192829.17086-19-vishal.moola@gmail.com>
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

The page table members are now split out into their own ptdesc struct.
Remove them from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm_types.h | 14 --------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6161fe1ae5b8..31ffa1be21d0 100644
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
index b067ac10f3dd..90fa73a896db 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1034,10 +1034,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, _pt_s390_gaddr);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 #undef TABLE_MATCH
 static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
 
-- 
2.39.2

