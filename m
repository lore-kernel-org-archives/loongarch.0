Received: from out0-202.mail.aliyun.com (out0-202.mail.aliyun.com [140.205.0.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAA747A64
	for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386967; cv=none; b=LsloW+IRKsJinap/56RxVgyYTUSu1LlRDuu4pM4bUEvoCVDhKaVStktD36d/hmUXF137cN55zI14iejy6PWyrTj2bDxWX6WFdrumpEv0Q1ywGYahWctLGHz7kGk6wW8O1sMhLSH0FzwufgUXgXz8K59OoTKtW3wSv6+kCvMME2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386967; c=relaxed/simple;
	bh=D94EpgcBOw7XpW8dFSl53wbliA2dVLQsK7sAMadrCb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jplpwvi4gNDVSFBtLjSmNAmU4Y0emuYJl5Y5PW1Z9XAvRmp9Mxy0JPRmR0uD6UKk0t4baOgwsNH+5vu932bIPZKqW0mnw93stYrhG9EG4MVjhvVzzUJ8/2n3qt2Xj/7+dbJrT1/yrhpDnCL9G9ycPnfBB4DY9krWSKsAUd5Nj2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=ibFPlMLI; arc=none smtp.client-ip=140.205.0.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="ibFPlMLI"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386956; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Wijyh1yP2Yf03/VPvTBn+/oZ8/jA626iTOgm2E3/T4s=;
	b=ibFPlMLIxO/WKit3I9vkg1+KEIajyOp6Xtr/aCqXjx1q/6k6jMkiQAc80fRe47229yKc1xdMm9t4dPvWFifVWMCEnEtTVKVb4WlA/iRUjsuYyJLHaTL3YrlaNMPQyzK+nlz1gbNR0bK63DPc+ORxfLpBn0fuDhuglt/2BZTWo80=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047193;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOFQRQ6_1714386955;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOFQRQ6_1714386955)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:55 +0800
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
Subject: [PATCH v1 3/5] riscv: Add update_mmu_tlb_range()
Date: Mon, 29 Apr 2024 18:33:44 +0800
Message-Id: <20240429103346.59115-4-libang.li@antgroup.com>
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
 arch/riscv/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f2d5973a011b..d515a11a52cd 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -488,6 +488,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb update_mmu_cache
+#define update_mmu_tlb_range(vma, addr, ptep, nr) \
+	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
 
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
-- 
2.19.1.6.gb485710b

