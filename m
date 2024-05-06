Received: from out0-205.mail.aliyun.com (out0-205.mail.aliyun.com [140.205.0.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C64D58E
	for <loongarch@lists.linux.dev>; Mon,  6 May 2024 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011662; cv=none; b=C+2dy3ic25mUugmlnIloEQi5lqbaRTL+Q1oZ2m0fApQvut8E5YOgehZxtma335QSdk8uW5PQIMY8W39wYyMYhAnY80YzyreA66vXtK8gL+OG+j99TCu9F/TzdtrsSP0DtgSOvFG4aRTHTgEdkhBchSceXEIYt3IWfRIanaupAzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011662; c=relaxed/simple;
	bh=IDDpkgBKjbOqR7QDCBIzGc24eoXl3y9UB7IfT/1YoPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S1qLFZbz2QQLmpXW9qobi9TxUmiF0OPrIcyk3p7ANRbf9BEenyIEH/gIGkNbfzWQDRxggU0+GeNlLC5yDv1+JUH7sy2jeu3rmpwwVbqXvBZM+3fkk7vkgadJ1oQWjXojdmWhT50u3UGNd9tmAc7rXxXNYLzdWu8natEbROBK3lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=Qil+uiEf; arc=none smtp.client-ip=140.205.0.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="Qil+uiEf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715011656; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=TKTzSti+PtAcGWZfYR7jaBIBKKIAPqWETl5mtmtjZos=;
	b=Qil+uiEfuRcgnjREGzSjMDx2m8Y4TY9FL19BH13gYtbMkBvJb3OVn4pFTcjcAZEwH3KjFBs3ai8ERgksGqVYZeXOIHhd6Whm0ExJ0pd1DaUu1+KaJEpPvVxfHj1gwnEJY8slGIvECCZREJ4SK80CAk4PBxY20E3REVHVj4H3dpw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047201;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XTd3ClE_1715010722;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XTd3ClE_1715010722)
          by smtp.aliyun-inc.com;
          Mon, 06 May 2024 23:52:02 +0800
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
Subject: [PATCH v2 1/5] LoongArch: Add update_mmu_tlb_range()
Date: Mon, 06 May 2024 23:51:16 +0800
Message-Id: <20240506155120.83105-2-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240506155120.83105-1-libang.li@antgroup.com>
References: <20240506155120.83105-1-libang.li@antgroup.com>
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
 arch/loongarch/include/asm/pgtable.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index af3acdf3481a..924b6b031f06 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -470,6 +470,10 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb	update_mmu_cache
 
+#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
+#define update_mmu_tlb_range(vma, addr, ptep, nr) \
+	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
+
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 			unsigned long address, pmd_t *pmdp)
 {
-- 
2.19.1.6.gb485710b

