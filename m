Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35371ABEA8
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 07:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319760; cv=none; b=Sp9SxqNXIHN9ugq1tL2sGYHRYAZ0783DptLhwoDaRjGLj/0ebOA6dVjX5/KD4YAk+CKMxbRWgCP8Nid+Z7K1AlBXFtHs5CWThDfFsylGx5LOAKBcPnIyUxluyhH564sSRbMeUyc5nMDpdySTH9fumaxu/BkryILsSfDvfFsU+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319760; c=relaxed/simple;
	bh=Kx0FsgNq46QBGZYoDJIY0xToNCyy11ntqe8BvR51hdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WznZm2I6EZqqDDnXDxRx+S6bC4E66VTak74E4IlXczyjuOv8PyEhnWL94g8zFuWjIp9Tb7fv3I0JfkIQIIk/bs0RgIN0ohqOnPB1nQLktErq+PMN/TYiqRV/vtqCccnPEL9ieHY3Wj4YaZhLUMqq/xbPkLfF9GdqyeVTYsqjgd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YDAuGycp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YDAuGycp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21636268e43so68037775ad.2
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 23:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319757; x=1736924557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFL9SGbXxYqRlw6G0JwTVWRijc5/6EOrJfB/UywRwlQ=;
        b=YDAuGycpEVQGm2KhsOtPmT+6uv74FIdDH4diDgj9B0PX3X3BG0ezFGNsg8+Ripda+y
         cpcUln+tUKbFh+buJxpaDa3BOl8jAI+pVzcLpMOiCTiTbD+LzJHFUzeWnOBTmqycZy5Q
         wFy2RMboPScHQbJD0FxiLqp/fyK3nfUtipjuEBfSU70HzOVkZqlcJiLf1ed8n8qhJxRl
         tJbXvwMeb207ZVHUhmza9f4t89OZr3l6YFqRnbw9iA61aLIJlp7+A9mWqD1u4eo4PdNh
         F2I/uVg+FNkZJRQFhgywsdRmk6hECTlDCxKwSEpxpnLiJy6psKkS7lUOgIOMoPMUpj7r
         zw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319757; x=1736924557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFL9SGbXxYqRlw6G0JwTVWRijc5/6EOrJfB/UywRwlQ=;
        b=G/0foA5lWhuLlcv2xnKWod5N1OLwUtPCYLmqrwebwmrO1pknAU6NDVnZk3himujOv3
         qoydZZseC29NJyUGu/JQwyH4b3MexLUwsolS/L9isj6rpWjUyuLuaoLv4KVAwvzfP1Dn
         0nUvDwlGHyXrWn2xQOcXTk91caNisjI5UFzSeAwuhP4ZQuRcI3aUTB11Q2PEjX8IYLJd
         J/YV4NfU0ic1S+XaBBCURUjVEYu9EOvNogqT6UKp3YAu7UvZkhI2BUOVwn3kEL9otRLA
         3GNUXITRBJU9gYDpslPaipJmTt+0e9gMJwypONfa5T1go5ySQBFSPTTUH8wyIO+fxpoc
         T2zA==
X-Forwarded-Encrypted: i=1; AJvYcCXkX71HtfbqDFAgtn4Ws/pEfmSEg4hhkgd8zVQkI8G4aNRrevA9qDwL0V6Y+oobSnUcFMs0sH5tK+g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEZUSrqZxhzy6ASLElpX07UG39xfeXn+14JRPiJWXJEhDBCGJ2
	MDI6OiVdZlMNXUfMlYPB8vScGfUMQO5i+lHUwOgQVsDgoeUDn2wIiisIp572Tz4=
X-Gm-Gg: ASbGncvsU3edepu+b1PFM8CqslQ1T9vjOvRjeSpAXSJwzqgrVWNLRhEoy2pEa/EOsP3
	gsPRddNKoUypb50ZRawd9PkeYqQ4z5D+Yqn9mUYYzVXDTwQ757+f1ffQ9A5nikTHEYlDsV7Lnuk
	zfQz8yPx56CN/rgd2WDdDUH0Xkui466Y63qhG0oRLYFupJvwPcovERbKWUh914bweSnQ1d2i+oq
	ycnITB4SSfsFvSqwt0Poc1kISekOdFUGz9az5ZBi+7LRA7HeZEwKY+0Kqxi9exhAdrz0uwZnnf+
	SuG/8c+BmKbgYrHQx4UIElSAQ0o=
X-Google-Smtp-Source: AGHT+IFBkkoQabtOk36FtfqYc8ZUQnhLYoik+Qreb3ophWoDY5tLIXttH+D63mfzQSCD0xoXOJPU5A==
X-Received: by 2002:a17:902:dac8:b0:215:773a:c168 with SMTP id d9443c01a7336-21a83f48cf9mr30903435ad.1.1736319757144;
        Tue, 07 Jan 2025 23:02:37 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:02:36 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
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
Subject: [PATCH v5 13/17] s390: pgtable: consolidate PxD and PTE TLB free paths
Date: Wed,  8 Jan 2025 14:57:29 +0800
Message-Id: <ac69360a5f3350ebb2f63cd14b7b45316a130ee4.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
freed - same as it is done for PTE tables. That allows consolidating
TLB free paths for all table types.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/tlb.h |  3 ---
 arch/s390/mm/pgalloc.c      | 14 ++++----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index dde847a5be545..d5b27a2445c96 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -102,7 +102,6 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 {
 	if (mm_pmd_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pmd));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -122,7 +121,6 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -141,7 +139,6 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 569de24d33761..c73b89811a264 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
+static void pagetable_dtor_free(struct ptdesc *ptdesc)
 {
 	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
@@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
-	struct page *page = ptdesc_page(ptdesc);
 
-	if (compound_order(page) == CRST_ALLOC_ORDER) {
-		/* pmd, pud, or p4d */
-		pagetable_free(ptdesc);
-		return;
-	}
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -211,7 +205,7 @@ static void pte_free_now(struct rcu_head *head)
 {
 	struct ptdesc *ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
 
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
-- 
2.20.1

