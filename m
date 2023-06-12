Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9E1F172
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:05:23 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-56ce96063bcso37496507b3.1
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603923; x=1689195923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BBSMNk3/NV9IPbcmTeXVmuDxVjvV9nk5pHOLLkR9Zc=;
        b=B5eteOvH/q+5UxTkqPiKmSRGXAjb4bZMizLs/WNtLaesb1E0HpRn4up+92FQaO/msD
         wl+HgJ9chyyZgdROsDvWF8ST2c98XDyJ6K5mIkqjJX4+EdwGnn3FI4jGMxc7JXWmf967
         aU1KzzzuV6U5c/qEMroqPTw1zV9aDblRqBawPVlpf/Mlyp6BjBb5H05VxOKBrkeVjlqN
         FunX9lODEGlrIj4hvPqV1OUn4lS2vKzFGXO/PdJAy/LDMA65UwEZCw3NLCYo8+J5kL9P
         iG2KwFG+0fA0Z25/Erx4n5fssjHvgoAeU/1R/dnILNKDOgbuGKGvMNK5K7M37Fiw/tnm
         j5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603923; x=1689195923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BBSMNk3/NV9IPbcmTeXVmuDxVjvV9nk5pHOLLkR9Zc=;
        b=b2l701vvQHYrap+6sQRrt7QNi2Dt5I/TNJ9orh3t5LIuqMC3iDUTqs9fq09QYso97b
         f0RQerHiqEc6lsNRMTI4BPzZ6HzRV7tEv1DL2ZatH15PkN+x+kr8va5rL+/Hd7H3bFcu
         ZX+lnNBBRq8M4pRrDA/gAeJHP5hYj5q+a4Fn9X+iC6pFyX0nZRcTkC9NvkkQjEob77Oa
         MM+BBMh+EetbfgCGFfivOEorY0rRV2Hlm5bSVRHk6FZImDCy70SCbJ9jHb6tJ5FRZ8xe
         y9RfC7gN3XoCLdi12qv96g7meT59btIak7Z7lMjOpX3SDrYsN6/Op2wNx4R7msSK4ZFG
         B+gg==
X-Gm-Message-State: AC+VfDzoeV/k6d3TO2hassoYIyJcjJZn+fIuOxdbJa5UA0DZ80eNxD6Q
	phSjgFqCHJ2iR7X2yK+Yyd0=
X-Google-Smtp-Source: ACHHUZ6Y5hnmbR0E296qiytbEPqdIHR5totNZCgnfGVo00JLi96ohBBFsqGnqpvBKL1saABj0PHBjA==
X-Received: by 2002:a81:8495:0:b0:56d:c8d:be26 with SMTP id u143-20020a818495000000b0056d0c8dbe26mr5358308ywf.26.1686603922720;
        Mon, 12 Jun 2023 14:05:22 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:22 -0700 (PDT)
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
Subject: [PATCH v4 18/34] mm: Remove page table members from struct page
Date: Mon, 12 Jun 2023 14:04:07 -0700
Message-Id: <20230612210423.18611-19-vishal.moola@gmail.com>
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
index c405f74d3875..33cc19d752b3 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1019,10 +1019,7 @@ struct ptdesc {
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
2.40.1

