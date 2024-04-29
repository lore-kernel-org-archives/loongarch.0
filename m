Received: from out187-3.us.a.mail.aliyun.com (out187-3.us.a.mail.aliyun.com [47.90.187.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE54CDE5
	for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386970; cv=none; b=GJR3xgHrmZC8Dp0bUizfPoRY3IzBg05M9ydU7lUJRWJuBiwEUrTYWE8CQFP3ZcK7rsFovhV7nxIPlvRkOSsMJzl8xx6Rk0JC89xsdTiKCOQ/wq+tXR2IDXsKCDbYxlncFaGkasmoJGC27sLEryvFReUZeVYfb96kThF0KwLLq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386970; c=relaxed/simple;
	bh=kik5XO6svGpEoUGKapTye8QDGY88f/SLWUpm40ED15Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jqjw7ZlhB4Avv5ZhimeCWPXDA3wgTusdslfZ3vsp7Z8j+PjH+MQM8WaoUYE6Z7tD+X/zeQT2khWOcHDGzaYe53m9hE5wW9+0xji4F/Dm4FVHvnwGnNCYVUD2ZanpqazFiiq6BCBG8TGoJQ0+BMjLMcNfAOe/A6t1LBHvWbCqsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=07daAIyN; arc=none smtp.client-ip=47.90.187.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="07daAIyN"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386953; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=6Lf/KTNGeV9HQ9Bw8oLzpkcGoRQJ7Qoem8o9ZsWDa00=;
	b=07daAIyNTiGl2LgGQjsZzWFVIL6HwcKx06ZnfCXjSzvXkDuaqhTrVhFtA0pA9Q9sva5dPZFxIBT6x8DFpa3DfwN0pOUAH8yArtbF4mZR2REhKMHDM2jXou2oab0qRjiPJZmO0y6wDYYPtDcXV7qfu1jdgq55eIyemljgbjyQzO4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047203;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOEanKl_1714386951;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOEanKl_1714386951)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:52 +0800
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
Subject: [PATCH v1 1/5] LoongArch: Add update_mmu_tlb_range()
Date: Mon, 29 Apr 2024 18:33:42 +0800
Message-Id: <20240429103346.59115-2-libang.li@antgroup.com>
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
 arch/loongarch/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index af3acdf3481a..5ccc2a3a6f7a 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -469,6 +469,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb	update_mmu_cache
+#define update_mmu_tlb_range(vma, addr, ptep, nr) \
+	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
 
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 			unsigned long address, pmd_t *pmdp)
-- 
2.19.1.6.gb485710b

