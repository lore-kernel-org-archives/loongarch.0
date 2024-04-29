Received: from out0-205.mail.aliyun.com (out0-205.mail.aliyun.com [140.205.0.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2484D59F
	for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386969; cv=none; b=mCpWAiByxzZQ5XzB+b2SJEyKJ2QFK3gEJBnjnJQMbbjVeEj5EV7bZxa13ECpKXj548bxsacctKuEhA6UufPN7gqCVVLrjO59uBc8BPVNvp1yt4eLY49FSL8PUiEMJSYc1eQyFicAuoP916vpkS7MbrziRmGKgyCGfn/sjZIGpH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386969; c=relaxed/simple;
	bh=VY9sZlLbdOohRHek7Or+cOx51HaBJ+7tOVXra2qD9VE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sYzDnrAKOtgclj3rEJOB3Jlb7cWrRvj/hAVMzRMYzjBI87/aCBjOxPbQtpdoj0L3OvY1AwC+sLNBf8Wa1P5sAnAYXtU7pH/FDsuGiP5vgiNimrlld40T2t3+9RfSyPRpAZezRpf76HChSSm8hYM5jjqxn2vWWyLgzwL3t1cZ2Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=YOwVAoZk; arc=none smtp.client-ip=140.205.0.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="YOwVAoZk"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386960; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=MCByWayo1rTtWGbtdA4qwJOFgDYVs7q3tTYHIInGmHY=;
	b=YOwVAoZk8FqMSrg8/9ps1rdKpTCIBOfsvyANgI3kLYOVTsvcYX7glFlsHS8M9hqn6NOyXE6+H9eCI4aEqGZH76h3zDuxSTkI/Rl2/yA56vfx+h+sfA1zCcbCvvXLJgQ6N99votAuMlSHmBy9gL3zl6kd4v4+YbPtoGeWyHWKg1o=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047192;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOEanMm_1714386958;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOEanMm_1714386958)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:59 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc:  <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <libang.linux@gmail.com>,
   <ioworker0@gmail.com>,
   <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-mips@vger.kernel.org>,
   <linux-riscv@lists.infradead.org>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v1 5/5] mm: Add update_mmu_tlb_range()
Date: Mon, 29 Apr 2024 18:33:46 +0800
Message-Id: <20240429103346.59115-6-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240429103346.59115-1-libang.li@antgroup.com>
References: <20240429103346.59115-1-libang.li@antgroup.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), it may need to batch update tlb of an address range
through the update_mmu_tlb function. We can simplify this operation by
adding the update_mmu_tlb_range function, which may also reduce the
execution of some unnecessary code in some architectures.

Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 include/linux/pgtable.h | 5 +++++
 mm/memory.c             | 4 +---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 18019f037bae..73411dfebf7a 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -734,6 +734,11 @@ static inline void update_mmu_tlb(struct vm_area_struct *vma,
 				unsigned long address, pte_t *ptep)
 {
 }
+
+static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
+				unsigned long address, pte_t *ptep, unsigned int nr)
+{
+}
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 #endif
 
diff --git a/mm/memory.c b/mm/memory.c
index 6647685fd3c4..1f0ca362b82a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4396,7 +4396,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	int nr_pages = 1;
 	pte_t entry;
-	int i;
 
 	/* File mapping without ->vm_ops ? */
 	if (vma->vm_flags & VM_SHARED)
@@ -4465,8 +4464,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 		update_mmu_tlb(vma, addr, vmf->pte);
 		goto release;
 	} else if (nr_pages > 1 && !pte_range_none(vmf->pte, nr_pages)) {
-		for (i = 0; i < nr_pages; i++)
-			update_mmu_tlb(vma, addr + PAGE_SIZE * i, vmf->pte + i);
+		update_mmu_tlb_range(vma, addr, vmf->pte, nr_pages);
 		goto release;
 	}
 
-- 
2.19.1.6.gb485710b

