Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE731A7255
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549872; cv=none; b=kIsM4jZkrguF/Vrxf5SkILZzTXdw3r9zTW1OsvwZA4BOF7a5iVfY/FgwF+VZn3yxMKoLvJML0T/oOwKhYV+9Ew/wbg+pxVE+YMIndyJV1CmgwfcuwhyXAKRVP11ZUEKSrsRDU3tA3BTXACX5nR4ZMQ6InCUIaIGnYXFivpqJ5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549872; c=relaxed/simple;
	bh=ySnIl2i3Fo/t1YN/rcwyhGqxWwlx1TNUJRz33ZWxlkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rTDeZoZiOrUxHmq4oeAOfUBhYvDrPN8BJTIIZtVZ6RI7EaGWeSmYKOyg4Rc2rGERm0Pp2Tktv9JaTz9kHvnJl9an4IBAA8TR7mHAyjHMvL6fa5mO2z9gcxfqWWx/FrRmotx+cinSXtCfvhLAC4Nlh4lYZeGDcMGkyERwW3h79JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZAcV9p/R; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZAcV9p/R"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2165448243fso138922305ad.1
        for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 01:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549870; x=1736154670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyEzElX2/Cl2Hb0vACePBo9dDp7jwROhL3d0Mq9f7ig=;
        b=ZAcV9p/RmbutIieFYY+wPbZNHsA6rBIFoznpt5nn2o57s32Cl5XcPs0B7qEnGzU35Z
         K/JkVfXhkrEh3uaLU3zuZvrA9McOcDDuT8h1yaoQxkTyadJAu/+P1rAezw2Yqz84Ifvr
         4tQOdMJhHA/kqzGu5nOzeaRP3roKOv+ghISqeuZW7/8Y9qSkwfyqv2CE92epnvRWgcPI
         K18Vx9c9qOSloGeIjOoDrH5aXi9tkxgjywanxkIacNBg1iGDvECSMqGYYmdA2hqK+ajl
         4mforcDQFcpAwF4HPiZ+BkxPM8wkjvOEbTmerO1Anp+KHEtns1ZlgjhqqWLJ/yBhB5ck
         PFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549870; x=1736154670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyEzElX2/Cl2Hb0vACePBo9dDp7jwROhL3d0Mq9f7ig=;
        b=jp9GdIvgWc7vnTQLNCzyKMVqWtNjg6BCuOZ++mItrWTsBep3RF3Z9AEmAklf25AtRU
         jhiY5sWNfoMUjvMMs91O7KUMELjek1IDrpX43Hx+0IWNE0IBlq9RIOhfTbh6Z6ZXjlfV
         aFfU7jtX3CnYGSG0jKHTEk0kEm2duuurjeGl8Q7NsfDKB6hiWiop4kPLobj14gIqynXS
         avVdEzDFi8hRhLK8rRAmYRi6f+gaHHubEyzBV5CiMBSdWp/oqDNEHwyWo9dB+tRrxHXc
         SjH0yOWYqlguCCi1uPjKc4ac9LBRDTLLX/rrNb5MLhL2UYudgeL5yak237os6GEcdy3f
         +yWA==
X-Forwarded-Encrypted: i=1; AJvYcCUV7KJ4z4B4DXaYcAn+oDXo0NfOgaEe36k/ONsVCKNazyIzdzdoBBYDCZqbL7cKH1nqQ9SkLBcnT9E=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu7wokVgpNOGPETO9yD4EY6uGeNnlDijQhv+Oz2KKR+bvIYhsK
	snzBSx44NrtnWb/3UTGLWnNVf+6tYxtEMKqa1Gded8vh6VMBLw5VUFYB5kGzEBM=
X-Gm-Gg: ASbGncvEjGRn8arbfsKu9usgvGteJzKckNEh8cvaxf+uF2ixgjLWvBvdBSXsHWIgCI/
	cpF9Gdq2GKiuUSp19u9+pHFckPrdoFCqGpUzkIH7AU1xRZDxqhoa8U9eOMgYdopSJHSzyZ42x3x
	f/kHGdp5T9gCnB405Mz14aB16u2rZRUqOp9XCG1CVjtmxpFxeH3WLK/UjSUdt8BIzJVv2fnLLfi
	hLnu18tomF5bMdtCArv5Qy/kGJ+LlgMY4QwvwbvSGizScGJz+v7/pdzRwfFjK54M58uET/9xpeo
	KEQSpYtuYe1UWt+2sb9vJQ==
X-Google-Smtp-Source: AGHT+IHPMMlkiFtH678yJhisFXpRpeLbEmYMWQPlXwvGfvt1NUv1TR7XGzXk5FcrgJpzIcDaQ0LX6w==
X-Received: by 2002:a05:6a20:7351:b0:1e0:cadd:f670 with SMTP id adf61e73a8af0-1e5e044c8ebmr53183808637.5.1735549869780;
        Mon, 30 Dec 2024 01:11:09 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:09 -0800 (PST)
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
Subject: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:47 +0800
Message-Id: <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
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

To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
PMD|PUD|P4D to __tlb_remove_table().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/tlb.h |  3 ---
 arch/s390/mm/pgalloc.c      | 14 ++++----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index 74b6fba4c2ee3..79df7c0932c56 100644
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
@@ -122,7 +121,6 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
@@ -141,7 +139,6 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
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

