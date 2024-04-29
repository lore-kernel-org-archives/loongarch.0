Received: from out0-209.mail.aliyun.com (out0-209.mail.aliyun.com [140.205.0.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364145C06
	for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386963; cv=none; b=Bvn/IWrqHOKFyv/xWpoCZ8uDj9YwtCxdMBTZ4LPsumuvfIxaAxTnZqtM1W+ZB8zIkgRjm2AC5mZBeQcO9O/CXV/r/YIGhmKBTP6MZZ328X6L6i1nz7a5IW1OIPS1w1dgifDhHAW7+B0cM8zGXxOlqpUSYzKiw4wPmsDY4+myF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386963; c=relaxed/simple;
	bh=PPzTdu8GHUSCZuJDiTQr/ewx5LKlmshWf3qQHg5D1RQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k7vjXwu094BZ6HiBhNiOsj+o83iKsnDQafBsT7nPPmY/kTd3EOZeXn6+R8MixBwsvOtxkAD9GjoQgyWy9PTkbgzJUVWsXntTKhifkDPzB6GPXD4YbJU6asmP8PiYZjGxFqJSqDjiEEEBY/9O9VBXC9FTVgYJSWda3519LPWnhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=hQRNZFKo; arc=none smtp.client-ip=140.205.0.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="hQRNZFKo"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386958; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=L9Nnq3jHrztC2V1l+aPsgS97TA5W6U5sPTcwdSCKib4=;
	b=hQRNZFKoJR/Z6J/Mdjz/Rrc9wQNL40mP544JZi0WALMiuztrxwSk1dFqXvJAwaSMEccrE6bUsigtJFDjuiAHW8rxrtMjGCE1VUj2EAI6oWMIAf65hhwy9BocdI5bYn1D/FqrZvfd2wDHdULwl2LtfZXW8wQF/ZM2aXgSHix13kg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047207;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOEanMa_1714386956;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOEanMa_1714386956)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:57 +0800
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
Subject: [PATCH v1 4/5] xtensa: Add update_mmu_tlb_range()
Date: Mon, 29 Apr 2024 18:33:45 +0800
Message-Id: <20240429103346.59115-5-libang.li@antgroup.com>
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

Added update_mmu_tlb_range function, we can batch update tlb of an
address range.

Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 arch/xtensa/include/asm/pgtable.h | 2 ++
 arch/xtensa/mm/tlb.c              | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 9a7e5e57ee9a..50ccfc988256 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -412,6 +412,8 @@ typedef pte_t *pte_addr_t;
 
 void update_mmu_tlb(struct vm_area_struct *vma,
 		    unsigned long address, pte_t *ptep);
+void update_mmu_tlb_range(struct vm_area_struct *vma,
+			unsigned long address, pte_t *ptep, unsigned int nr);
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 
 #endif /* !defined (__ASSEMBLY__) */
diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index d8b60d6e50a8..05efba86b870 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -169,6 +169,12 @@ void update_mmu_tlb(struct vm_area_struct *vma,
 	local_flush_tlb_page(vma, address);
 }
 
+void update_mmu_tlb_range(struct vm_area_struct *vma,
+			unsigned long address, pte_t *ptep, unsigned int nr)
+{
+	local_flush_tlb_range(vma, address, address + PAGE_SIZE * nr);
+}
+
 #ifdef CONFIG_DEBUG_TLB_SANITY
 
 static unsigned get_pte_for_vaddr(unsigned vaddr)
-- 
2.19.1.6.gb485710b

