Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76350524C
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 04:21:39 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d0fc1d97716so2005911276.1
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 21:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258898; x=1690863698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoPDwBR7UkDBRqaPTC6ObTEe9OrRslO4Jma44jkeaBI=;
        b=Dgs8EsJAHasnII4rJ0h10Nj9H3O9uzEKXy7LW6sf6S5UPbm7zagckuwMpdCbvZk8cU
         3/jnkSDkvXi64EHRwyjz+CM8p/KmVE/9fnMiDEX0PvmK/w2bAUSZDPt5BzsyT9VmXNoR
         USMHwv5na3aMh8DeZjSQRwfSfPFKG4ZOnIYC2X37iqKJqBwj0eKoY0bqe0NY7N310KPu
         aidhbQQvpt95cN5aH+LGh5XqwJcQ2uC+n4TR20GhHOCZWT8rqRInnhuzQKk9A3ffSHvU
         8/8KhU8ISd3BEz/7bIAWQZEwejG7oku5b5qOTInFSfUdh8Iny4J/y8tSxkhE65C29I99
         J5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258898; x=1690863698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoPDwBR7UkDBRqaPTC6ObTEe9OrRslO4Jma44jkeaBI=;
        b=OoE1SBifDcZSuYF8BkdbV3VrSR7Kkl/I0++it9k7KcsIMBFvcpODDJNxZ+uNaYjHhX
         j0IqctsgkYvDOJLVTLw01gUIF7OX1BSNoYpb5nNIfIdeQ+PK0LToK10EPsZPiHQbHii2
         zfj40UCX166SGLZirefM+7NJKP8EYmGxREzjeXeCd5RrzUwtB6m+Y+UawzFeP9RjLUx1
         lQa3It//A2nxQhwDqp8XrtVMmZixT3RvHAkppeeUqhmZNIq7YZOUzobBOtq3w4rqSrJm
         rvnlNcXkY6qKK/F9yEI8DimEIdDwxDzd2Qi5Fs1HsGEFvUbzWbpu3E8xOxwreTb3ePCe
         vcIg==
X-Gm-Message-State: ABy/qLY7OL/0Zx+KRAa+NXlLyyF7IZjoFEUgoEEbTRhDF+o45Iifu0A/
	a3u5WKkf8o67uHZpLZuUxFc=
X-Google-Smtp-Source: APBJJlF5Dk/uQrTXMbCnDdD5/bLVaLQ5W3zqcEOsqm95ohTlFSSUZBYyBU16PWFlX2Ey7GE6JXmN/Q==
X-Received: by 2002:a25:254c:0:b0:d0b:9058:f660 with SMTP id l73-20020a25254c000000b00d0b9058f660mr5944061ybl.44.1690258898065;
        Mon, 24 Jul 2023 21:21:38 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:37 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 15/31] mm: Remove page table members from struct page
Date: Mon, 24 Jul 2023 21:20:35 -0700
Message-Id: <20230725042051.36691-16-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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

