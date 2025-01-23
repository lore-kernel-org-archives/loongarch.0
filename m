Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F2211463
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638931; cv=none; b=Cgrj7qOHhcOHVe/tqtPjrbPR/rXYCXwltof0XzLVtYhcJxn1IarREks2yeX4jdmIsGji59awpuPMHgKERAwh2Gwsxs5GGlpf2Jqx31VkqMY9XMXh9wBbTKS/mn9Oq4nV6mE6MfqoLXs9oL0yuo7Yh/p/Rf4ks1F4SfPjwHmpS68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638931; c=relaxed/simple;
	bh=9R+hVIAoZGq7muh+MjTEAY3Ux6O+nL5GCUlW0n8y7ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WtxyTIyuUJibTQmR/ho95wZarPWEe4QpwEgHcGl5nlF70fn+TIxEzeXo0SVZoCEDuJ8pSJZxDocjYxwelqRe8bpOhQAeCryQeorkVuOcCXvXjIff6I7dcFL0diJYcRNfm2h8ejKVhCN023y/BhLsiV+cMMDL+5R1yER5LHih6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FQgsSNtJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FQgsSNtJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2167141dfa1so16998925ad.1
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 05:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638929; x=1738243729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIKiL/cvy76O78IwclMxfA3FUb4EAj4nzgq2isZtk2Q=;
        b=FQgsSNtJdnxddqUmigfDthRg7lXpj6za6W+i8O4BHK1xf2U41wOMsf8+pyut75JIbY
         +MlXexB7dnYkaAxFzAEDoLI5BYoy/Narg0tvFktXNQsR89RoguP9yeeQ131yP9KLyoqk
         4rNGeJhboqMr/3wtPD2mTLUUGiEpozSciGjX8SrAuTik/vVix5Fa1j4fsx8h/IveOods
         VlTAfpgEqoUDIPbZQj7EvYKqTHD5adF9fH2jyIWEIP2U9g2Jia60sC0WjHZ/69cNT4MP
         QWD3JNxu/kt692rps8UF6IOTVk8ETwVIHo4zjF8lr0pRpWGjqh3gPKH8jJS8XNhDrRim
         u9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638929; x=1738243729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIKiL/cvy76O78IwclMxfA3FUb4EAj4nzgq2isZtk2Q=;
        b=N5teDx5UAP0EfyphPEXytlavUz18wrFdemjJ8ASmuoMJrxeQ4RrBIEMIyCBvbIYkuz
         OKgDrMzb5zWNlDUHplIqWki6GxseNPO2zFsylLTQ1z1V8qFeabhtSt/SnJdcYJbdiwsu
         HK25Z8/j7f+Sk9P0WRvHEZnVqEVVUapT9zqPVwC/5CFr8msMh7LwsAdcTICJwlfZGW0a
         1XgP+8g9dxozFFvPsdDJdA5SIAoruhXO7J2TQGM7vSO8eyzjnlLgJi0YQfUJyeWWQ+0+
         QgWByDZmRxYFkfieutMRJ4TMuwH0ZQYOeVBghI/gKVrfYAWy+I2Qsux+Kul/ks8iFRwH
         w8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp5Rq0BOqu3Akzksf2YJULPDOHu0MpN5OOxrYmIIseawAW3BR8xClBOvdXYEiXNQ6/tS4D99CLllw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0FqzyYmo5LGHoVW7PaN//MfgU4bwCfvRp9pYpWhyiYdlK+EXy
	Z8oLNzs+Fep4LQZZBMDUiPf5B5CG+Z/+PST+uMPduMb8eCKJw0Xjin0+IqaoyEs=
X-Gm-Gg: ASbGnctPdHPod+zvX/HZu3UHOYbJ2koqA3MbipIKZbGcMRZW6hEFgvdcBJ1SmX9oMsG
	mp8GkPVlkYy8ZpTDuWwS4CCYBZTU9W7RWPGyQBcAnRVX4Agomqn9ntjDCwmB3IZnBODN3269umv
	Mp5/QD2ke1QYVLhFPltjdN8huPLu9fxaOyU8Axy/vwe+VBvp7lKtDQ29oFAQHdKf8rogogdm3/N
	uM6+9AvEH1DrF+T+f1jQ5TGTkgvrMJWn8GONto4E/Bue2dWsiSFSDCAxdOgVPF1vZVTX+YwQMhu
	MXOSXZ0I7EO4F7NeZRX3L8Zz8gwTaCOhND4yU6BTpEuE
X-Google-Smtp-Source: AGHT+IEu4HBG3SpWH9djQXZ235PefY3+YNVKU7kJShvdW8r3VF7F38seuaHQ6/TN21qUw52tcuL1Ag==
X-Received: by 2002:a17:902:f541:b0:216:5db1:5dc1 with SMTP id d9443c01a7336-21d993172e2mr55309915ad.1.1737638928616;
        Thu, 23 Jan 2025 05:28:48 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:47 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 3/5] riscv: pgtable: unconditionally use tlb_remove_ptdesc()
Date: Thu, 23 Jan 2025 21:26:16 +0800
Message-Id: <86e9fbf586912f3689e98c4dee2180b69b399638.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support fast gup, the commit 69be3fb111e7 ("riscv: enable
MMU_GATHER_RCU_TABLE_FREE for SMP && MMU") did the following:

1) use tlb_remove_page_ptdesc() for those platforms which use IPI to
   perform TLB shootdown

2) use tlb_remove_ptdesc() for those platforms which use SBI to perform
   TLB shootdown

The tlb_remove_page_ptdesc() is the wrapper of the tlb_remove_page(). By
design, the tlb_remove_page() should be used to remove a normal page from
a page table entry, and should not be used for page table pages.

The tlb_remove_ptdesc() is the wrapper of the tlb_remove_table(), which is
designed specifically for freeing page table pages. If the
CONFIG_MMU_GATHER_TABLE_FREE is enabled, the tlb_remove_table() will use
semi RCU to free page table pages, that is:

 - batch table freeing: asynchronous free by RCU
 - single table freeing: IPI + synchronous free

If the CONFIG_MMU_GATHER_TABLE_FREE is disabled, the tlb_remove_table()
will fall back to pagetable_dtor() + tlb_remove_page().

For case 1), since we need to perform TLB shootdown before freeing the
page table page, the local_irq_save() in fast gup can block the freeing
and protect the fast gup page walker. Therefore we can ensure safety by
just using tlb_remove_page_ptdesc(). In addition, we can also the
tlb_remove_ptdesc()/tlb_remove_table() to achieve it, and it doesn't
matter whether CONFIG_MMU_GATHER_RCU_TABLE_FREE is selected. And in
theory, the performance of freeing pages asynchronously via RCU will not
be lower than synchronous free.

For case 2), since local_irq_save() only disable S-privilege IPI irq but
not M-privilege's, which is used by the SBI implementation to perform TLB
shootdown, so we must select CONFIG_MMU_GATHER_RCU_TABLE_FREE and use
tlb_remove_ptdesc() to ensure safety. The riscv selects this config for
SMP && MMU, the CONFIG_RISCV_SBI is dependent on MMU. Therefore, only the
UP system may have the situation where CONFIG_MMU_GATHER_RCU_TABLE_FREE is
disabled but CONFIG_RISCV_SBI is enabled. But there is no freeing vs fast
gup race in the UP system.

So, in summary, we can use tlb_remove_ptdesc() to support fast gup in all
cases, and this interface is specifically designed for page table pages.
So let's use it unconditionally.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/riscv/include/asm/pgalloc.h | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 3e2aebea6312d..770ce18a7328b 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -15,24 +15,6 @@
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
-/*
- * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
- * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
- * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
- * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
- * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
-static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
-{
-	if (riscv_use_sbi_for_rfence()) {
-		tlb_remove_ptdesc(tlb, pt);
-	} else {
-		pagetable_dtor(pt);
-		tlb_remove_page_ptdesc(tlb, pt);
-	}
-}
-
 static inline void pmd_populate_kernel(struct mm_struct *mm,
 	pmd_t *pmd, pte_t *pte)
 {
@@ -108,14 +90,14 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
 	if (pgtable_l4_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
+		tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
 	if (pgtable_l5_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+		tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -143,7 +125,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long addr)
 {
-	riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -151,7 +133,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
+	tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 #endif /* CONFIG_MMU */
 
-- 
2.20.1

