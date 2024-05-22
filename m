Received: from out0-198.mail.aliyun.com (out0-198.mail.aliyun.com [140.205.0.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CE78286
	for <loongarch@lists.linux.dev>; Wed, 22 May 2024 06:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716358415; cv=none; b=U+GvXF7IEnVHwF/5uPhAhwukwfAArRtmLnbpW50PArBipuXKkBwQ0TgDFVH5c0+WiZIl/xsqn/PDfKSPM5n4dFJhv2eYwcJKuP0EMo+30n7/BWWyw7ckm5K+Kjwu5OSZnTgvt/VRBQJbMy9R9NAehKkKKEKI8ejKs9vhr/oKGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716358415; c=relaxed/simple;
	bh=XAZ1dhi8yd4t8p+lEu8vHI92ztkq6k1sOBmrDIIR6tM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aNxfeSrHpnkofEcFI3sz7twHdBBU4/uvmjo+b/4tFunld9XKFmv0xzav2m7hjrhD0HB02LkDtogF6qSXq3tU6axYj5p2O4Tt9x56JEIJswRNHHhO2UuIPGacuB0Ub96j4j/zEAxacbBEcbPHXO20zcJ+VK52/d4Te3+lsDTiQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=LwysctnJ; arc=none smtp.client-ip=140.205.0.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="LwysctnJ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716358405; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=TlFp/9e3+paphJkYj5hBfGpalgoFCMsN0GnLIT6/eZ4=;
	b=LwysctnJ1/b2rmEt9CJtG2f20irwsnxK53iCF3wFsBa4+94AqrP4dfAo1AlYvEqJGf2F6RKHTmYkE1tkDxrFWSr586tgBfVgpkM0+DycmrIh8fm2wUqrEnyqLEH04hWEL1E25Sj5yf2QbjLFY6zWBgixwGEObsBnQUR0hIIM+i0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033070043001;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XjzNVv6_1716358403;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XjzNVv6_1716358403)
          by smtp.aliyun-inc.com;
          Wed, 22 May 2024 14:13:24 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc:  <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-riscv@lists.infradead.org>,
   <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <ioworker0@gmail.com>,
   <libang.linux@gmail.com>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v4 2/3] mm: implement update_mmu_tlb() using update_mmu_tlb_range()
Date: Wed, 22 May 2024 14:12:03 +0800
Message-Id: <20240522061204.117421-3-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240522061204.117421-1-libang.li@antgroup.com>
References: <20240522061204.117421-1-libang.li@antgroup.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's make update_mmu_tlb() simply a generic wrapper around
update_mmu_tlb_range(). Only the latter can now be overridden by the
architecture. We can now remove __HAVE_ARCH_UPDATE_MMU_TLB as well.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 arch/loongarch/include/asm/pgtable.h | 2 --
 arch/mips/include/asm/pgtable.h      | 2 --
 arch/riscv/include/asm/pgtable.h     | 2 --
 arch/xtensa/include/asm/pgtable.h    | 3 ---
 arch/xtensa/mm/tlb.c                 | 6 ------
 include/linux/pgtable.h              | 4 +---
 6 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 5ccc2a3a6f7a..161dd6e10479 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -467,8 +467,6 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
-#define __HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb	update_mmu_cache
 #define update_mmu_tlb_range(vma, addr, ptep, nr) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
 
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 0891ad7d43b6..c29a551eb0ca 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -594,8 +594,6 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache(vma, address, ptep) \
 	update_mmu_cache_range(NULL, vma, address, ptep, 1)
 
-#define	__HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb	update_mmu_cache
 #define update_mmu_tlb_range(vma, address, ptep, nr) \
 	update_mmu_cache_range(NULL, vma, address, ptep, nr)
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4630815b0253..ddfd6f8cdcb3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -489,8 +489,6 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
-#define __HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb update_mmu_cache
 #define update_mmu_tlb_range(vma, addr, ptep, nr) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
 
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 436158bd9030..1647a7cc3fbf 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -410,9 +410,6 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
 
 typedef pte_t *pte_addr_t;
 
-void update_mmu_tlb(struct vm_area_struct *vma,
-		    unsigned long address, pte_t *ptep);
-#define __HAVE_ARCH_UPDATE_MMU_TLB
 void update_mmu_tlb_range(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep, unsigned int nr);
 #define update_mmu_tlb_range update_mmu_tlb_range
diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index 05efba86b870..0a1a815dc796 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -163,12 +163,6 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	}
 }
 
-void update_mmu_tlb(struct vm_area_struct *vma,
-		    unsigned long address, pte_t *ptep)
-{
-	local_flush_tlb_page(vma, address);
-}
-
 void update_mmu_tlb_range(struct vm_area_struct *vma,
 			unsigned long address, pte_t *ptep, unsigned int nr)
 {
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 17d1caee39ab..117b807e3f89 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -736,13 +736,11 @@ static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
 }
 #endif
 
-#ifndef __HAVE_ARCH_UPDATE_MMU_TLB
 static inline void update_mmu_tlb(struct vm_area_struct *vma,
 				unsigned long address, pte_t *ptep)
 {
+	update_mmu_tlb_range(vma, address, ptep, 1);
 }
-#define __HAVE_ARCH_UPDATE_MMU_TLB
-#endif
 
 /*
  * Some architectures may be able to avoid expensive synchronization
-- 
2.19.1.6.gb485710b

