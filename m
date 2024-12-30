Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236AD1A23A9
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549773; cv=none; b=YTxZch7fkzpfEzGvmj4aS+UwoQ5bGd1CBQ3lbaVTY4VEfEOoHG43y/cvx5q86daSwPGcLmsRlS/ER64CqYrpH2mayrx0/e2fHig4Xg2Y0SX6I6Czqppq0lxr9Ka7QlFx5hGu3Foh1p1A9qq2Y0nnnUBdXoWNUyg3I9Phr2hObmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549773; c=relaxed/simple;
	bh=iGGseqx9Ut5ViSPAG0PhwW+aGehMNfQFpL91q5ypQVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W8V1u/NRUNlmlnJEFtk1moCbE1PRld6zQ+wQc7FcMXlWFWTh7VIZNXyxvGYiUJQuJjQSoh/sgO3u/Evg8VHAzT/jqnyPZQSpe6j8BrDFOfC4KU0RSgf9MRpHUP3KwSRtWyT+ePP64MHJMGCxE3Jh1iKnAyuuionPOu1GLKvjmDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cIh4NebX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cIh4NebX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163bd70069so13704335ad.0
        for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 01:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549770; x=1736154570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6vBY23hDAeU19z0pXyQ9vuAeZavJyfGUN8npoqwlxU=;
        b=cIh4NebXWrlIoa9NWZqqf7KI0KuNd5NW+W9J8RNtc55iUOsyvjkzcRdlp3vCDoz6A2
         mj2PFUZDLDTLxzfcfuqYQ6ZXY7zJMx+Q3WvnYlvuSvk84UbWO5XzlpIz/1ndLKsTttjc
         ije20/7NUzFWpJhDFnZa64gMMgv2Mcp3Z+Y/3TcLrcf0tAQKVEhAK20nz+vSqTCNeW5W
         ZY3HCi3P8HCzkqqXdwBR9sM6hbABM2wm6c/BgygkzaOP7FU4s37E+99YfZQwB4UjcSi4
         Ozl3kj1vnp0SAOst9ztIlAeP12YTmXUU4M9nKVuH3ujE4x6L4x1MwJ/VI+5ruiuTNn2+
         jQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549770; x=1736154570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6vBY23hDAeU19z0pXyQ9vuAeZavJyfGUN8npoqwlxU=;
        b=KDbLzyLSQBrH/tx/nDWF0z5GaTzLu8KpB+JJ6qPWLVlQiHZonzFnamsuhyrrvlDn35
         HOKncvcih3J5uvtmilHH+mHhhusu8r3Btq++Kl4OUBhsUSViIw9nHIY2yyNWTb4Lwykz
         fMm2auisqOX3VVjiekl/lRpIUo/oCwzRkVv4rWGeeqwD/i4hxsvt5OHGwzy61QcIrAz3
         Jwh7OJ6ZsaQWGny9FWwzqb/K47P4AT24XREG2A1lJQ0ZjuDIvACkoHbViaTDSOtYcKYU
         /4hjrqLKSHbtN0f1fiwmdiOxzLpPm49yUzeaFEU9dvb/06YUILWbgdvjGZV0Lix7t5VG
         kn2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGbVi7fCv3KvR/Fe9m4Pq2YBDac9ZTLWfyNIakudbowEZmhNWoZ3RBmkiPgsrwFbpgwvGH5HrSfP4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVWUqwsRboFMgm0qfnx8HEbbTFGSDGo11lXk2ehtk/ILEzhZmO
	L1hjO92D7dxFbeFhq9t1Q9JHgnlBCef+vcGAP/CCSl4fyvGj85H7/mvPwsv/Wng=
X-Gm-Gg: ASbGnctJQu1gw6SwzgaNRoyrRYJpcD+HfFnB40z796liUrSvJNFCNgQdsXvU0yisw6W
	mU6ZTt6AlRlDdfX26qNfdjv3gP8TG7uIMw2F0mPgYoWATnWHEB/d7yBcOFqxXep4JPgk8L2IfJO
	JVMdk+dXimY5ZBfeD1TjjB55GfNkHiuoThK3W/zo/7GosC0ffU4vWaFpZAgIx/WrCUGlqrTFVZ5
	AJBU9KRgHy1gOASwXBFxoKmK/lNtTNpae8SrqW7PK0ztzqh5aYGAoBkgYpgUPcj2Bq1tUcz5G5s
	lW6Moi5W++7/uotYPPityA==
X-Google-Smtp-Source: AGHT+IFhgZxpyzdRj713xWVIn5lnq5dMIdipHJPkhLMIEEbSziCo236oEOGt7kn6Wpg3lXZNnJqwCQ==
X-Received: by 2002:a05:6a21:1517:b0:1e1:adb9:d1a6 with SMTP id adf61e73a8af0-1e5e08439e8mr55857078637.41.1735549770532;
        Mon, 30 Dec 2024 01:09:30 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:30 -0800 (PST)
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
Subject: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page table
Date: Mon, 30 Dec 2024 17:07:39 +0800
Message-Id: <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
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

Like other levels of page tables, add statistics for P4D level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/riscv/include/asm/pgalloc.h |  6 +++++-
 arch/x86/mm/pgtable.c            |  3 +++
 include/asm-generic/pgalloc.h    |  2 ++
 include/linux/mm.h               | 16 ++++++++++++++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 551d614d3369c..3466fbe2e508d 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled) {
+		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+		pagetable_p4d_dtor(ptdesc);
 		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 69a357b15974a..3d6e84da45b24 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -94,6 +94,9 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
+
+	pagetable_p4d_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
 	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
 }
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 59131629ac9cc..bb482eeca0c3e 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -230,6 +230,7 @@ static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long
 	if (!ptdesc)
 		return NULL;
 
+	pagetable_p4d_ctor(ptdesc);
 	return ptdesc_address(ptdesc);
 }
 #define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
@@ -247,6 +248,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
+	pagetable_p4d_dtor(ptdesc);
 	pagetable_free(ptdesc);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c49bc7b764535..5d82f42ddd5cc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3175,6 +3175,22 @@ static inline void pagetable_pud_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+}
+
+static inline void pagetable_p4d_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 extern void __init pagecache_init(void);
 extern void free_initmem(void);
 
-- 
2.20.1

