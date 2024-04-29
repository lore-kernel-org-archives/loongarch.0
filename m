Received: from out187-14.us.a.mail.aliyun.com (out187-14.us.a.mail.aliyun.com [47.90.187.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9FD3A8F7
	for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386973; cv=none; b=K6g+dd3Wmw/gAEBLMPfoYVcFNwm5TJwT8mojxHUHoo68rTBSgHIx3Jm/PeZowkNKNcLJ5fN9GwimXPHoonn8sVAUXWGUIH68mklXZqX2g2HvnjtxL8pbZ8VWady5JH7PCIq/Q7iV6kclZaDdnmmd875Wz7wYj4yJYWFlFstIleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386973; c=relaxed/simple;
	bh=jxXWxShuCRotVk/KOZsP3/ma7cHvuzHRC6adnl/VgTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c0gTdqhMtuSgLxkTbcJM4jFB5EjSPYXRMRsRVpmxYzDkYftPZl/vKw/gJtAz6hPY2o3uxKdkCj7kWea902PdKOmjRqEJvVJYcAatwBDOeKQ9/jvp0dfYdulFvGEf5fq7lOkWXdDhsgJZV3zDuZaEr60yVSTWsxtPVeQy8OxbzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=o5mE9Ja5; arc=none smtp.client-ip=47.90.187.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="o5mE9Ja5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386955; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Zpq+IlpQptIiF+1qadAYLdyILX4yq5vgiQqk5YenteU=;
	b=o5mE9Ja5J3pN0Bi+4o5rFp/KlRDFTPRc2br4GicCbAnaBGcavythIG3HPOGXZvB43DFDesx1sU6A22DQzpfGHj7MCunO1DWh7hlqO425wBInVf1kCaumJVPQvByUqLXQjUobhWlSojlM4rcr3luE1NuYa7uO+t0Rx/9zAa5adgE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047205;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOFQRPj_1714386953;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOFQRPj_1714386953)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:54 +0800
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
Subject: [PATCH v1 2/5] mips: Add update_mmu_tlb_range()
Date: Mon, 29 Apr 2024 18:33:43 +0800
Message-Id: <20240429103346.59115-3-libang.li@antgroup.com>
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
 arch/mips/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index e27a4c83c548..0891ad7d43b6 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -596,6 +596,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 
 #define	__HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb	update_mmu_cache
+#define update_mmu_tlb_range(vma, address, ptep, nr) \
+	update_mmu_cache_range(NULL, vma, address, ptep, nr)
 
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 	unsigned long address, pmd_t *pmdp)
-- 
2.19.1.6.gb485710b

