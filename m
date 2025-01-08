Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D970C1ACEBD
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319714; cv=none; b=VfwzuSrXMQvhoe7EpHVFf3TUAhyJDqRfPCkbqnBFQCYktNbZ77tbTLBeYfDYgMLgp3E9IRjacABkUEL/RwtHpXqTThS22UAiEG2kZlP4lj6YytpRDZfIFg4SQuj8nzbkGKy5p9V1mwC+/X1etXT+FCBuHPJmZDqUKw4R6AKoWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319714; c=relaxed/simple;
	bh=3/6yQnBUbRs579cSVPuwhDvWyeaNwYaSaUo7i5vWdIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nF67W2EQmjOVXTz3qTSLyvjNpmT6VjfGLZbiWhjByWOtnSqv/+u7dqzliR/vJBoK6e5e2j8ToOUugvkBCUJKDgnUDy+G7ifZhfbLXqYMZsre59hGoWeXvJF9NDNc0K8i5B+lYvKsJgG6K1nGJ0vkMyyp9fg31F0ZKtj3rnixzhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Iy7A4+Su; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Iy7A4+Su"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so17927954a91.1
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 23:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319711; x=1736924511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJFt+T0ZGRLwl7qj4QUye9dvBL3lzNJEqvkgjrbvemg=;
        b=Iy7A4+SuuiZWBIDEiFurhdJQe4f8sVjuiEJ8XoLoXN2fg2wIzW6sC748S1u3qK03cC
         Z45JQtW1LFp4z03WxGjQzzZmAjo5Y1fzEJZpGq+aupQRtG+wyebNWGy89m3nslxrIqC6
         vftam6s8fAauT/S2HW8o3eXle5c8DyoBSUUl2QC7Ylz/ViECdCdO3lsXpKSGVsolY09o
         z+2nI2oXPS3ypxqpLTbJOj/jIDk75SZ0OaXsO+1JYYagY482/kz9DN/jy7recmVBvIyN
         70W1sxzUs1f0XyIoYBNE2dF0sC7uOx9aSaB6+dCALzUGOn2HW0RBfQSrY6qogv2dWTBk
         oaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319711; x=1736924511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJFt+T0ZGRLwl7qj4QUye9dvBL3lzNJEqvkgjrbvemg=;
        b=jpli15PlJqJdMh35AZWHFhwfZlcQwzVprZuVfHn4XF1XCqGUlhumhangOz+0fa21X+
         CSTsDHaf66McBi0l5TMtoJ/wQAz2j59ckrUSSS/icsdKFwoNxhm9GzS5SAAXhtKYrKAJ
         ate1A5LdGXNZ9djYjVrriu16MkQhGm2nOEfNCmLWiDetErtvLWx8Ysj3Gx9vDXRThYDw
         T2pA1uCSWYKmSO6+DwcX5tQBo75Yy22BYt53cMLNbV0QxvZ2zy83D+mZ941mA82A3dHe
         K3uS9L+4x1GZKyADlMiWoSg+LSbviGXFJilibdHABwCUYtzRoBddcN5rdZ8LGFgM0iEy
         yRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRtUy02BIRQzbQ0wbtuHW1WD5yNFacaiGOLJ9HW3xiBAMQGS8IEzdRTwNVaEvItIHt6YbJcV/Hl0s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOyfF4geMgzwMPNzSmkT1o9rfu3xtt7VieTGcV3IZ4MFsk5cGm
	0Ausa3E7PaRQ2vx9N2PKAErJRphb3rRytPtB0Vg17mbEGDzl0OFs6epcy+FJksA=
X-Gm-Gg: ASbGncurdQgTX8Zuo+Tgme3Iv0rD/eBIsdVNNxdEzSNCYSYDXnTeGYgIciFb2LvECEq
	QkAEICqQkGPUZf3YN+vGO3+rorfv32YVXq52SVW55P5EJ0WhaPKSYvM06U2Hlbme4jRQR54hgc1
	o6e/rdpUkdzkIqPWl5tVlb5wLgtcWiy5Qs8+y4DQRA2ofpTX1lHcl+TFD5sXWWgZyIDVTPgTyHH
	Fr5ObuVMcI6WUzbOZRIJniSmBOC7f+PvOCQkKOA2zLMy16Ptarnlw3cznUHEZI9prR1AJ7RbN/F
	gAPN2w6vBmTvdAw04g8LkFwGl/4=
X-Google-Smtp-Source: AGHT+IHbJSdEFlMcYFI5dK7LOGyjdYP9+xvlrgbj38Eli2e60ze0npY5GY+Stk/tuNQHFcVXscZRAQ==
X-Received: by 2002:a17:90b:2dc2:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2f548ee5378mr2382141a91.21.1736319711135;
        Tue, 07 Jan 2025 23:01:51 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:50 -0800 (PST)
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
Subject: [PATCH v5 10/17] riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:26 +0800
Message-Id: <b89d77c965507b1b102cbabe988e69365cb288b6.1736317725.git.zhengqi.arch@bytedance.com>
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
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
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

