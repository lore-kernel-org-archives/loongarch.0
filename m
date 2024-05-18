Received: from out0-197.mail.aliyun.com (out0-197.mail.aliyun.com [140.205.0.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC0D502
	for <loongarch@lists.linux.dev>; Sat, 18 May 2024 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716018712; cv=none; b=V/JA6qdRjkmeiX2UAggOfJkyEa4z2H2KRL+xtJHpYz+yWGJGyGpvy5JC14O9kYBH79OMAKX4RL4pcDs2eUNgbtCmwsWxlWxqP0RCO8Dms9QCvMHo46abnP1hpiCd10vWZCtRfaO0lgfBHdWE4p1gDyrI8zFAAU9NUjpJBg3ED2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716018712; c=relaxed/simple;
	bh=ezZZUjXre2eUUn/DDsHxMohnuZJYrK0JL7K6dgq80Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EP/14I0BtyK82P0MQCSCs/qK8pqZ/WVIrP68cNjMiL71su4dhK2C8Ul1PswK0Y8+qslmMg/47zGkd056n6rU2AY4QKOIzYfb84EP4/QTgXIKSj7nef31w27AzvqYjNh8gy8V8+x2/6FayKXkHBhAPRURGglfLSCFs0YBrS9sE+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=SCWQwVrz; arc=none smtp.client-ip=140.205.0.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="SCWQwVrz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716018700; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=MvaQlNmLKjB1JJG125kcLMl74RVFk5etnjUBr5sySWs=;
	b=SCWQwVrziQ5LRMKGrdEzNaq+gf0+gS97B+I2LK3LOqGfYsCqQd3Nslm7cgoJs9EGMQr7fzbyiYlQArg7MGtWmzqenL2KgPkiFExgVGWJofMaonRbCbmyRz/TUY70uZeke/rboi60zDjmXWzPB0akkMtUC5EsGtbyOEAVdC4L8RY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R771e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047203;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XgA9uMj_1716018698;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XgA9uMj_1716018698)
          by smtp.aliyun-inc.com;
          Sat, 18 May 2024 15:51:39 +0800
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
Subject: [PATCH v3 3/3] mm: Use update_mmu_tlb_range() to simplify code
Date: Sat, 18 May 2024 15:49:14 +0800
Message-Id: <20240518074914.52170-4-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240518074914.52170-1-libang.li@antgroup.com>
References: <20240518074914.52170-1-libang.li@antgroup.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let us simplify the code by update_mmu_tlb_range().

Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 mm/memory.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index eea6e4984eae..2d53e29cf76e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4421,7 +4421,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	int nr_pages = 1;
 	pte_t entry;
-	int i;
 
 	/* File mapping without ->vm_ops ? */
 	if (vma->vm_flags & VM_SHARED)
@@ -4491,8 +4490,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
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

