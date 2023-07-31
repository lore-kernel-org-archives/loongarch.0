Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6121BB2E
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:04:09 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d07c535377fso4913389276.1
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823048; x=1691427848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoPDwBR7UkDBRqaPTC6ObTEe9OrRslO4Jma44jkeaBI=;
        b=OAbNNQBEQXMPsZxDdWqbwpvcbcC9brAkDdGEYZZSxmgS9fU/KaG8Vdw1eojjPxifHR
         dAgpTgfKnNikXik7mZu8QxravKkUxiIYGVER2PrkOqRriotSLF3T4LElpBmapph98PeJ
         CgANJas/sYwEcas//U7Qxkrb0B57mEkHjJFVkSuOLhuhDwIKccn09v9YrEs6kDdqLy4T
         Ieqhh+PAHMUzo7yeR/3qM+URoXymEQxqZDFSNR+LNsEWiMnR0aGkUyMFjyNfNubh1n44
         qou+GBpn9D5SWlHqMqT15mOyIOurWshKH34ovdJcmzrKIbB8XOImOByAI5BjQB0TmzE9
         Sl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823048; x=1691427848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoPDwBR7UkDBRqaPTC6ObTEe9OrRslO4Jma44jkeaBI=;
        b=O95cLPqAgogBEglZ/4qYPYbtyeo9n3pZs3iGKa4QBx9JJBgKAz/MXEiqHpaqEGjy7I
         idWQaDYQmXsfCQC/MXwKJZbeIfB0Cfb0RUwprLjog0NYE56pn3s44LCvTIf5SeERcoBF
         ePxNsl/GkgGONnO9gdT662I969a3h/ABfuuw7ef8dQf4mgCua7dWQsMyCd/4E2fM8MGI
         XMXSj2KWXQLHU/mH72FzQqYhh5PybOGiHfsYmyx0FhzCcLxDS8KrEvSYdAJOecK6g5Lp
         PyvidC2JQAUV2aGuYAqvSGD3jnTz+miedy6rr333P+OgJbSQB8x2mxaQmKbXb3m6njTK
         gXeA==
X-Gm-Message-State: ABy/qLahViaw8hRTDhVcstuQ+VTXDd0R9G8vbMKhsidt07oPeWYhE+cX
	J5W4Y82ot5dB8b/KQ3lQCq8=
X-Google-Smtp-Source: APBJJlFKcIKM/utvbiiE7uhCLg+4EyOcJ7OdfVdmr1i+MWfEQcViSbVO+c8ELmOI+htD8mvz1eRjLA==
X-Received: by 2002:a25:f626:0:b0:d10:d237:b03d with SMTP id t38-20020a25f626000000b00d10d237b03dmr9909607ybd.53.1690823048043;
        Mon, 31 Jul 2023 10:04:08 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:07 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 15/31] mm: Remove page table members from struct page
Date: Mon, 31 Jul 2023 10:03:16 -0700
Message-Id: <20230731170332.69404-16-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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
 include/linux/mm_types.h | 18 ------------------
 include/linux/pgtable.h  |  3 ---
 2 files changed, 21 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index da538ff68953..aae6af098031 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -141,24 +141,6 @@ struct page {
 		struct {	/* Tail pages of compound page */
 			unsigned long compound_head;	/* Bit zero is set */
 		};
-		struct {	/* Page table pages */
-			unsigned long _pt_pad_1;	/* compound_head */
-			pgtable_t pmd_huge_pte; /* protected by page->ptl */
-			/*
-			 * A PTE page table page might be freed by use of
-			 * rcu_head: which overlays those two fields above.
-			 */
-			unsigned long _pt_pad_2;	/* mapping */
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
index 250fdeba68f3..1a984c300d45 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1051,10 +1051,7 @@ struct ptdesc {
 TABLE_MATCH(flags, __page_flags);
 TABLE_MATCH(compound_head, pt_list);
 TABLE_MATCH(compound_head, _pt_pad_1);
-TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
 TABLE_MATCH(mapping, __page_mapping);
-TABLE_MATCH(pt_mm, pt_mm);
-TABLE_MATCH(ptl, ptl);
 TABLE_MATCH(rcu_head, pt_rcu_head);
 TABLE_MATCH(page_type, __page_type);
 TABLE_MATCH(_refcount, _refcount);
-- 
2.40.1

