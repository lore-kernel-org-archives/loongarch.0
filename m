Received: from out0-203.mail.aliyun.com (out0-203.mail.aliyun.com [140.205.0.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D10C5C8FC
	for <loongarch@lists.linux.dev>; Wed, 22 May 2024 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716359347; cv=none; b=ipXpDKVZJjfopFWow/eSHqbS2uuVyjJXvM9lq9fSSGb7eLxU3Obgxrov0yz1g4TmsWVQItgdUuRDp0Y7Yw040YJdKQfrEQBiWfu6Aojp0UhWGAyXydDh4fl0ajCQN8loBq2Twt8TqnFJhAIQlbq8I6b9gnjFOR7xXNqbll2w+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716359347; c=relaxed/simple;
	bh=1gwBS5Cq9Mt+mBuCChuoPiJyX6uoYGfOwAsbB/VA+Ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MhICAVREwyHrG1izFJaF0fbkmG6SwqdPIjzdYAOeu2wzBI6fBJ5Lo1JVyemHKp+7HG70tP5NoylSUtem2jUSvriBtUgFwyMIks0z/UpVvbKXTd0BSr0CYX1Ticz+Jqz/achT6rYF7SwW6Ctysm6a5M6W/bj4SQkgyAo7xpsj+wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=AqOKuHO1; arc=none smtp.client-ip=140.205.0.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="AqOKuHO1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716359340; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=+clcXfgLVBiQX5MySmBhLxW05UlCMsdDj9QlU2/Rreg=;
	b=AqOKuHO1Xd0CCjg9FMgx6ik2ODNU3FKO1c0hsaq156PN/5vWJQ16XomVdAOt2gWOQF2z1Qi1bFb1IsYxlWuq6aw2Yqj9tTG4mDzFNzD9mj7Gh/WsKww/9PjHxyFVYjlaLuMcvG2/HKyMmSR6JQu3uvqBXVzq/p/HWXHDKL5Asts=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045129160;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.Xk0LCMY_1716358405;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.Xk0LCMY_1716358405)
          by smtp.aliyun-inc.com;
          Wed, 22 May 2024 14:13:26 +0800
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
Subject: [PATCH v4 3/3] mm: Use update_mmu_tlb_range() to simplify code
Date: Wed, 22 May 2024 14:12:04 +0800
Message-Id: <20240522061204.117421-4-libang.li@antgroup.com>
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

Let us simplify the code by update_mmu_tlb_range().

Reviewed-by: Lance Yang <ioworker0@gmail.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 mm/memory.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index b5453b86ec4b..1297474546d6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4416,7 +4416,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	int nr_pages = 1;
 	pte_t entry;
-	int i;
 
 	/* File mapping without ->vm_ops ? */
 	if (vma->vm_flags & VM_SHARED)
@@ -4486,8 +4485,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
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

