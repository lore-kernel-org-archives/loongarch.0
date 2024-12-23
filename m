Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8021AA1E1
	for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947115; cv=none; b=CMT1r8pih7Vl1GCgf0FK0wKHXws/aCv8C2DL75gJrZxfGIEforg4NAUbeUWZAvR7StejmH47R5QulW5cJaJUSfGJ6Rt4g/USclMD0OIJ6Rkm2Bnr3wrBPmkJpigaj344iULFnujshlqiDNDoPNOcKu93jaa+Np/pIjYeGQiG6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947115; c=relaxed/simple;
	bh=d8h9y7EmWepeeSdJqmfwFJOw7y0NPJCnETYa2k/Hjdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uO35mXy/Fol5pcsRNkX/tnRNiK46QqbR2b2Yo1bxpb+N/ynBlWIGtk84fuy/O7247WkMNWzczZsSiighXlOOl1iJFIJn83mst5ejMEt3CcmZi3bcwd0Mln6gby2tTWjG9lwZISx7AsUFuK/oJT57/4qT7dI2B0Hm2eOl77Gn2kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=girxX8jR; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="girxX8jR"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-801c8164ef9so2836050a12.1
        for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947111; x=1735551911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76YtbImY0jPwdXnQQVs9oYKl35yZZ81uc4A2YpilpOk=;
        b=girxX8jRzxfJkEAQGs16v9LJZVoK3ImYdZ3/AiYbarees1LX1I/SrP6fAwifeu3W2Z
         bQQQllyFQfrledAzE5b3NlWQ/suvDaeiW9IDFIknskMIDQXRf+6/cUncQrqWSM6QQZO+
         pmklHIJGc91UjRkZkke2z0quwXeB0frOyupDO09GTBn+007apBgP+RN765+V5uVBiWFZ
         xW/B8HzRfyyYUJh64F23xue/LU8BgMD5kZ5xGS5ghmdHlMBgNKhZD/A2N3KtvevO12ix
         P6PYb8xWPP16F/wv9y4vIp9ncn/769yOu9oO4Yn7ARCrsyYyNLoGcptl9gcSI5AP2077
         1EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947111; x=1735551911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76YtbImY0jPwdXnQQVs9oYKl35yZZ81uc4A2YpilpOk=;
        b=awEmadu1fa8ryxeIDttEblhbU23CWIYNplHrHTtVFyXG6khri978oN9DRJpJuE/Fy9
         /Fm37ZxMqWHvNTPOJgqvWymsBVcxfBAOdB6wpsAZF4XZG6CjFc0GMNiA6v17ZvNG2hYY
         9hnNr6/G9JGNimkv1rdIl7yqn92NrDV6hjqgHO5qj7ymHYviefi+XQVd1u0LlAfMLSS2
         25CO4bhOVOZnwRP+caeQlRkvDkUMLQCz13e0ch2mgM06J2I9JP/0iOc1pyQO/dTqRGtL
         u/kexFGBlcWSvezYN4ZtO1BTm1RE4I8RfHlu3ZN0Qp9J+MwFxgoG6VHoQ22cJfiJRrxr
         Y2vw==
X-Forwarded-Encrypted: i=1; AJvYcCVWW5Y2Nl26/YYd6/+ePXXWpu/eSEarxJXaNVe4/prUgvbDzPttb1i2+x8MpLdwmmpl+8AtFLTNVDA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKdnvLtMWoeFra/5BW7Jf9UXnxlu40N7HT0hVvhzAVfcVD7WW7
	7frx8LK6jPuleJXWoea1uVcJcQ4y+RY18xw+afM42rnoLguGfyszlS4GXPIqf3k=
X-Gm-Gg: ASbGncskhybpL62j7+IPSHGfpML+OOdSQNP3nAjelqA54APaNfE1L4KSK8bzCOoUipA
	e8br5XNrRCipExe1L1Vt3mj/q9RwzjlPfYUamdARsMmd+UxdrPdkOdRcuj3NPthkiURnncazZ+/
	mpQiGO7KNK84A4SHjcvGI3Ls+KGmY3MkfCqK15kI+a5i7vKf3IEniF4PGihSqw5ZvT2ZeweHPTN
	2fxaAzPqCp6SH2ncitMNCFkoFpnxPEcwlUAI6ni48YtGmV0tsDF6I0Hu45LmQ4NY1Y7RpzBjxJi
	UVOhuLuJLngsDejw8BpWPA==
X-Google-Smtp-Source: AGHT+IFO8x3oURIM+5JbbGjULQ8gSrXSXvX9ZJiJMgilE8gLJBNqFvKuKmavbyH4ASOcC8EYHQP7xQ==
X-Received: by 2002:a05:6a20:1593:b0:1e1:ffec:b1a9 with SMTP id adf61e73a8af0-1e5c6ec6f11mr24851906637.3.1734947111156;
        Mon, 23 Dec 2024 01:45:11 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:45:10 -0800 (PST)
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
Subject: [PATCH v3 10/17] riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:56 +0800
Message-Id: <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1734945104.git.zhengqi.arch@bytedance.com>
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

By the way, move the comment above __tlb_remove_table() to
riscv_tlb_remove_ptdesc(), it will be more appropriate.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/include/asm/pgalloc.h | 38 ++++++++++++++------------------
 arch/riscv/include/asm/tlb.h     | 14 ++++--------
 2 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index b6793c5c99296..c8907b8317115 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -15,12 +15,22 @@
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
+/*
+ * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
+ * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
+ * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
+ * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
+ * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
+ * for more details.
+ */
 static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
 {
-	if (riscv_use_sbi_for_rfence())
+	if (riscv_use_sbi_for_rfence()) {
 		tlb_remove_ptdesc(tlb, pt);
-	else
+	} else {
+		pagetable_dtor(pt);
 		tlb_remove_page_ptdesc(tlb, pt);
+	}
 }
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -97,23 +107,15 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
-	if (pgtable_l4_enabled) {
-		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-		pagetable_dtor(ptdesc);
-		riscv_tlb_remove_ptdesc(tlb, ptdesc);
-	}
+	if (pgtable_l4_enabled)
+		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-		pagetable_dtor(ptdesc);
+	if (pgtable_l5_enabled)
 		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
-	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -142,10 +144,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
-
-	pagetable_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -153,10 +152,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
-	pagetable_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 1f6c38420d8e0..ded8724b3c4f7 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -11,19 +11,13 @@ struct mmu_gather;
 static void tlb_flush(struct mmu_gather *tlb);
 
 #ifdef CONFIG_MMU
-#include <linux/swap.h>
 
-/*
- * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
- * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
- * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
- * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
- * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
 static inline void __tlb_remove_table(void *table)
 {
-	free_page_and_swap_cache(table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #endif /* CONFIG_MMU */
-- 
2.20.1

