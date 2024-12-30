Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06131A262D
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549822; cv=none; b=LtNhjUNyXJSufIbJjPr8RT5d5XxsYBMzRNb96J4AFIpZ87TSSh3pcwxnA5d0epBKTJOGgeYgNzTViIaYH3aF5DzfQ6Dp1Ueena4T920CefvrWihtGssVpUAuIArdrHKHN34rI0u6jbT6eNpxaFQcjQyV9ZGvV+2wEMayn2a1xuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549822; c=relaxed/simple;
	bh=H/x1u07M3HXF9oVd+o3reuerQgd2pca8MMjlY49GFUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QGvfbecgp11E/12Geja+moga3o/E8YC/erHpqLiGi6HbhljM408vTYs9M7BdnYZz6Eburi6zjaL7Sc6biHgGxyJ0EsOeaXD4VI8mbbhwSkP2bhMmKHAgdxYpmEhvfDl/wZ+PtWeh2OVvTh6mf30A3+8jhshnQABOx18I3GRxOPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GVQqddtM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GVQqddtM"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21619108a6bso107029105ad.3
        for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 01:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549820; x=1736154620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=GVQqddtMVFNdSjDcWda/k4uZ7lV4wcq4XGvroOWZtdhyF6yXQxWJYquNJBHFALKlzp
         eCsqVZ1OdH9SKB0uSqh+hzy2jp14oz4kjdJfSNTVaSJPZUFhcYq7w/+6sSGzaM2m56GP
         fDcJ6Laalphmw1XkZil4/wVLoTcq7bZwFpZsOjNOPqyb3UTqUzPak+2W61Xa+LaEpTsH
         F2J6MhkjmBB4iR0OZeKNToNkIn6G7+26BjQffvhI9AZ9p6jv79BLnDu7g91g7XJhbFRY
         WA7aoqKdur6BvVoesh/ZwFDeh8IqmRBSFblmjClmUs31MIsiXK3Gl4DQAhifJCja/gT4
         fXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549820; x=1736154620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=EZVjOPFJkGZhB+SZORlVxVgXggOB1NGwt3txUhIzlval4mGPH5GBQ1A5oqtDArgmn9
         4QCXTs+lA5toJW2S9e4JzRMnRoOzdAspIGtBk+q7qc0am9dbovhUBW9UmyLlHULLV4Zk
         Zc7UBAREYH3Tm3HqNYn1QBtKVM0q0USZhc7xBOotSBsr7SnVSlf+W2Sctupkpc9VhlPI
         ocB6uOQsLuv83CehBmoYbI1dByLPvmHZkuXHQscZ81ehjwcG2Ug47yqiJMUC/jG1ZEXs
         XHhlO0V5f1/zsrOw0yzTpaIlZsOSbHsk0H4oRYO7S61pHCZESsPAuNfINzk36V75nKgC
         PQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCXDdlYsYbKpVvXBe8RElKACF6yD3E4R4FK66tUXZaEXL3e0f9n+hIRCGKNyr/t11l6DQNWtAl90qLE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/kUE5hu2mzerOOg8jaGKSGqm1HgBDx/pYNAe8L4B497Mkppve
	ed1Lh3K7Gw9nKF5l/Tx3PB2vCDpLM/Kx10tvkPkiM8OO9/eoiJ2HyWTzfajeupQ=
X-Gm-Gg: ASbGnctungnRUazpbCp+h7M47L8LSiuBtjksHgsmoz8/hMlOovJX4kCrcdRDiEkFpWN
	5kEBmG26BqstWvqZP5ZYBTPldk8a4JaeaU7sq9uI3FPSbgEZPqWRPkF+aEYrGEN+NPgvS5IwX4s
	dQI3y6ttHrd6wJKCbJ7mPNzWpCxyG+ISf5bpV01BR1uutlJRVMHNm3G9rWgOj3znd6/DxMeAETs
	q5FyMrbTnC23SFBdWT08BiCEi+Mbd1OfGgkRr4vNtTLfLb5oCi6+1v4AljBN7waJbyJxgbtEN/E
	pGnUf6GWvo2/Aj5rEMbpdw==
X-Google-Smtp-Source: AGHT+IFX/3Df8AQRXbgF3uoP6h0ZSX98E/foDuPWt5IdgjLk00IpLZqU8w+lhMMb/JJOCncpjT7B0g==
X-Received: by 2002:a05:6a21:670b:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1e5e081c8d0mr60502051637.40.1735549820172;
        Mon, 30 Dec 2024 01:10:20 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:19 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 08/15] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:43 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1

