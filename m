Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D551A83E3
	for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947204; cv=none; b=fiy8bGF7/r9qmIdoSzN6Dg8Su1yya6wMhe+uYWfP34kG8gHYdJsx+f0pskhbHF1GsyqV4PKFqv+DYHsP3UckUnFQnBd3AS+KN4um8HixpA9pmJ7PE8g5tbb+mRbBdfYKl7704XpJhbiJMrvfzlVtwvItqsu51+g3XnPDekfaiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947204; c=relaxed/simple;
	bh=z7CWl7O3eullh1F2ul6vkw9nxR1R7juWYomvqNSqC4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fEjhGsTK3XhfeYELqEU7rOVjxoYcjRIK7hrHQaDwsOoi8e9zWxI896epswbMoF6CfPO8rUh0oGLLw3NfxRq847pK0WmSxj72tFhpU9b1vokyMF+SQxZ6sOAlOuXtqaBOcDthVZyTh8hoAOUNnefeVNUUx8XAfCzYrrbovypm2ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=U7+j90RP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="U7+j90RP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725f2f79ed9so3110670b3a.2
        for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 01:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947200; x=1735552000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vy7m3PQdTp9s3cHn2TFUEZi29ZbV6wwwxQw/bfJltk=;
        b=U7+j90RPUFyuMV8ULMbNPdAN26o3i/SvPLMOsIqW/iF0PiJoHD+/6g4fFSYNYo6lna
         OGyocbrTE5JFryHGiiL/6TesIBM91rLBe3cuYq9s3JMpL+geBJw4jwk39IK6XP1YImLd
         h/wqlMBNYqfP8/Tnmp/7t+tVouh5pcXDHYR8Gj4TDPIYuz7rC7yNLdMwog0JYSwFaPkz
         hb3E/OAM+F2tpc2oFRSpYjRDyG0DTICSgdZ768P0RDcLFFbg1Sul3BnXfkQAcGtvw0fz
         Ba3XxZf9AOZ86fTTOId/514av+XTaL6S9nY/FKMo0EQg9dicgmpQkX8mqNALp+WEUKN+
         m/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947200; x=1735552000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Vy7m3PQdTp9s3cHn2TFUEZi29ZbV6wwwxQw/bfJltk=;
        b=IGdVMlzKLT84AeLi6GI9/ZrwJ60XVX9rk99BHwnHSNlA9v8iv7GlCgnKlLUU3K7+tL
         afdpOT/p6kG1WgIFURtfiR5FskhQc2YedSrAZX91df7CAYZ7fuoC7Cl61FQ61hRp0XH0
         98yY30XrMC74ftel/GMh+++nqAt9WHJQIBzQIhJM+9azl7L5oZNEQbzrPSQEhEWo1zS6
         OzNZiMCt9i76Ai64Gt0t9qQqe9ubnzTaCAFXxF+zjm+PCG4TVMxr9pJDA7Eps6u2v+QD
         gACluupfV2BizwaFLXwCvLZ/ZTD6FQf4vK2rok8lzFJ79qk88j1YF9qwxAJTQy8SoZm8
         T85A==
X-Forwarded-Encrypted: i=1; AJvYcCVo2SOBe4TNAPT4Jc+tSEKNvwh1LsvdRnwLDenvn4SS+PDxtkVN51IAaeIILoqhATiJ+1S5I1oPSuQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxZjd9ERZ668rNmVjZKs2D6l9ApgblfL3/lhJmPXLISVwm1MHL
	7o+C/jIIfWg4Q5d9ncbPb2fjv57zPJbmcZieY+DCV2JY0fXyhAEM2doGz5DCd1I=
X-Gm-Gg: ASbGncvHKk6FD6/Fe3o7T9fOgaLea0VWcFNDuL0Sp4vpIQWMUVu/na5UAaNxIaq6QSm
	k+sl/BHOdDGwGwEe5HVyPTaAYes67lFdTWgeyrDDaEXD30T3ujlXOxRuhPZ92cmRGOWMLUBDUBi
	WzlLmgHeIhmzpOnIf46khQnvsTa9b4jrfwQfrlHa/ASdWKcnfHybfOb5EGkMDBHIHBp+gv84h4R
	QoreTiTl7GxbcmjjSWQCBq3BCtoGhoLy19eLNgy21uhjn3pvHJQ1I3AE7iWtMU8Iu2JRbUGXxJg
	+3zp4NnwzlDo1wV2KD4Wxw==
X-Google-Smtp-Source: AGHT+IHTlP+hesMysY/dnyw4k1T/aSGpJ0FSxzWG+ektln9VxnC2FaHlf9zeRwOgabkwOIXU2HSkPg==
X-Received: by 2002:a05:6a00:2407:b0:729:597:4faa with SMTP id d2e1a72fcca58-72abde9c004mr15027146b3a.16.1734947200520;
        Mon, 23 Dec 2024 01:46:40 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:40 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 17/17] mm: pgtable: introduce generic pagetable_dtor_free()
Date: Mon, 23 Dec 2024 17:41:03 +0800
Message-Id: <3ade33c5049f465dc2f0b95edc2d68c80f2048c9.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pte_free(), pmd_free(), __pud_free() and __p4d_free() in
asm-generic/pgalloc.h and the generic __tlb_remove_table() are basically
the same, so let's introduce pagetable_dtor_free() to deduplicate them.

In addition, the pagetable_dtor_free() in s390 actually does the same
thing, so let's s390 also calls generic pagetable_dtor_free().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/s390/mm/pgalloc.c        | 18 ++++++------------
 include/asm-generic/pgalloc.h | 23 ++++-------------------
 include/asm-generic/tlb.h     |  5 +----
 include/linux/mm.h            |  8 ++++++++
 4 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 3e002dea6278f..1e0727be48eaf 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,32 +180,26 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_dtor_free(struct ptdesc *ptdesc)
-{
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(table);
+	struct page *page = virt_to_page(table);
 
-	pagetable_dtor_free(ptdesc);
+	pagetable_dtor_free(page);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void pte_free_now(struct rcu_head *head)
 {
-	struct ptdesc *ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	struct page *page = container_of(head, struct page, rcu_head);
 
-	pagetable_dtor_free(ptdesc);
+	pagetable_dtor_free(page);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
+	struct page *page = virt_to_page(pgtable);
 
-	call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
+	call_rcu(&page->rcu_head, pte_free_now);
 	/*
 	 * THPs are not allowed for KVM guests. Warn if pgste ever reaches here.
 	 * Turn to the generic pte_free_defer() version once gmap is removed.
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 4afb346eae255..7d327889df306 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -107,10 +107,7 @@ static inline pgtable_t pte_alloc_one_noprof(struct mm_struct *mm)
  */
 static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte_page);
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(pte_page);
 }
 
 
@@ -150,11 +147,7 @@ static inline pmd_t *pmd_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 #ifndef __HAVE_ARCH_PMD_FREE
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
-
-	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(pmd));
 }
 #endif
 
@@ -199,11 +192,7 @@ static inline pud_t *pud_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 
 static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(pud));
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -245,11 +234,7 @@ static inline p4d_t *p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(p4d));
 }
 
 #ifndef __HAVE_ARCH_P4D_FREE
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 583e95568f52b..ef25169523602 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -211,10 +211,7 @@ struct mmu_table_batch {
 #ifndef __HAVE_ARCH_TLB_REMOVE_TABLE
 static inline void __tlb_remove_table(void *table)
 {
-	struct ptdesc *ptdesc = page_ptdesc((struct page *)table);
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(table);
 }
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cad11fa10c192..cd078d51f47c7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,6 +3001,14 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_dtor_free(void *table)
+{
+	struct ptdesc *ptdesc = page_ptdesc((struct page *)table);
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
-- 
2.20.1

