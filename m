Received: from out0-201.mail.aliyun.com (out0-201.mail.aliyun.com [140.205.0.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382B0155A27
	for <loongarch@lists.linux.dev>; Mon,  6 May 2024 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011665; cv=none; b=u/FnPU6LXqFVPIkTA19jput2y0YJdGEcl/altipZznzS/Ow7tTGXzpUlv4uY8TOzP/tObATJv7TsBAm2WxFLbEgeib7YnLC6UIftnSi2WeSgd5SCSBTFyykjmPwvS+zr1PcSotQ3PSx5usy7My1hXIJ+aLTJDSMMr8/+R2aUzcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011665; c=relaxed/simple;
	bh=icpePUeswEr53u3rw5CGtDkngqPYtbaGrZOhDxsPtc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OnBbHoa5iltyU16K4RPIJyoon90C2M5sGC/lRouzwZ1gJiUlRS5/3v7f1PD9NVsdINURyapZ9/XSvFk+P7rKMcAzNul8A0am+i3Y6Z0Re9BXdJ0BbkGTj3c25N1sCb9gx+lXpjnkZ47gW8vZ+pqYo/r/DE3qGJtAuljL3nUpwvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=LTAF8EJh; arc=none smtp.client-ip=140.205.0.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="LTAF8EJh"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715011660; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=pTrt2D6LnlSlcqnfLWOg4gAqNc+Zz7gJTsSV/QHl4Kk=;
	b=LTAF8EJhAmAJRHPpX9VSsUKlbjlQO1LsU/GPuIOfA14HfohQMVpqqrHlU8aP13czB85o4t4rF262uSeQwHZ5AuAxl6a0TldeHzIzD5BV7VKIsWDQYhi/Sq550/c3+x8FVLhnAEmQzlblSFgbImBKrw7q9sQlFAVnzczvZcoEJuU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047199;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XTcewE9_1715010723;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XTcewE9_1715010723)
          by smtp.aliyun-inc.com;
          Mon, 06 May 2024 23:52:04 +0800
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
Subject: [PATCH v2 2/5] mips: Add update_mmu_tlb_range()
Date: Mon, 06 May 2024 23:51:17 +0800
Message-Id: <20240506155120.83105-3-libang.li@antgroup.com>
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
 arch/mips/include/asm/pgtable.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index e27a4c83c548..9416c9b971e5 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -597,6 +597,10 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define	__HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb	update_mmu_cache
 
+#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
+#define update_mmu_tlb_range(vma, address, ptep, nr) \
+	update_mmu_cache_range(NULL, vma, address, ptep, nr)
+
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 	unsigned long address, pmd_t *pmdp)
 {
-- 
2.19.1.6.gb485710b

