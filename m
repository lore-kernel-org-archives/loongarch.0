Received: from out187-6.us.a.mail.aliyun.com (out187-6.us.a.mail.aliyun.com [47.90.187.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB5B29CA
	for <loongarch@lists.linux.dev>; Wed, 22 May 2024 06:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716358737; cv=none; b=c2RM1B6qm3WyuMO2dYZ1+JDWHNlOsrPyzaAU+9Sp5yM95Ry7vgJIw44wz6p197+L9DCL9rn2aW8DJ1yP/z9GaBaNIWLr/1Z4FnyWfbBfDlTbQxSd9z+iSWmo2hpXGosGGOQgAvWeOvmvmMZmoaOYFr9BWp9gIaZ9zWO7gLUZEoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716358737; c=relaxed/simple;
	bh=TRiPUs3sOqcR2Uebg5ICahKspfvDNX9Au3ncj/hVLOg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bgI6cdGCXV0TCs+8xmh9D0F/fq2TznSECwd5fZxZOlPTFrn//D1taGf4T+Hgg5ClzLR93E/HOiyMG1CvyGB9crRJ8A9M/6H3PLqsAkwCod+QR9+fS6BNEax1JiXzIuMxgVQB6v5KAm5u5QkMEotFuJYAIlEVb82ebDtqmi77IdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=UXzkEceQ; arc=none smtp.client-ip=47.90.187.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="UXzkEceQ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716358718; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=50gKTtI5/VbfrYUWsIwxZn0QXyXPTk7AsRcof412llE=;
	b=UXzkEceQlO5kFYU96hSxbqXFF/EgrhsGphphPfYGBYeB2E92lNXuNJKfxXjCYY781OtIBbhokokD44ZySPgLRYq/GWLJ4EurqULUm3aihPIwpAFfdn4mkv9EaC6mDn1LHKz5RxzplYRzIS8qSgA5uN2Z89xKnWCR8zDZRgmguLY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R261e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033068161075;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.Xjzgxvc_1716358399;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.Xjzgxvc_1716358399)
          by smtp.aliyun-inc.com;
          Wed, 22 May 2024 14:13:20 +0800
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
Subject: [PATCH v4 0/3] Add update_mmu_tlb_range() to simplify code
Date: Wed, 22 May 2024 14:12:01 +0800
Message-Id: <20240522061204.117421-1-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series of commits mainly adds the update_mmu_tlb_range() to
batch update tlb in an address range and implement update_mmu_tlb()
using update_mmu_tlb_range().

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), We may need to batch update tlb of a certain address
range by calling update_mmu_tlb() in a loop. Using the
update_mmu_tlb_range(), we can simplify the code and possibly reduce the
execution of some unnecessary code in some architectures.

Thanks,
Bang

Changes since v3 [3]:
 - Add acked-by from David Hildenbrand (patch #2 and patch #3) - thanks!
 - Add reviewed-by from Lance Yang (patch #3) - thanks!
 - Move the general architecture update_mmu_tlb_range() from patch #2 to
   patch #1 (per David)
 - Update patch #2 commit log (per David)

Changes since v2 [2]:
 - Use generic architecture to implement update_mmu_tlb() (per Ryan)

Changes since v1 [1]:
 - Add __HAVE_ARCH_UPDATE_MMU_TLB_RANGE macro (per Lance Yang)

[1] https://lore.kernel.org/linux-mm/20240429103346.59115-1-libang.li@antgroup.com/
[2] https://lore.kernel.org/linux-mm/20240506155120.83105-1-libang.li@antgroup.com/
[3] https://lore.kernel.org/linux-mm/20240518074914.52170-1-libang.li@antgroup.com/

Bang Li (3):
  mm: Add update_mmu_tlb_range()
  mm: implement update_mmu_tlb() using update_mmu_tlb_range()
  mm: Use update_mmu_tlb_range() to simplify code

 arch/loongarch/include/asm/pgtable.h |  4 ++--
 arch/mips/include/asm/pgtable.h      |  4 ++--
 arch/riscv/include/asm/pgtable.h     |  4 ++--
 arch/xtensa/include/asm/pgtable.h    |  6 +++---
 arch/xtensa/mm/tlb.c                 |  6 +++---
 include/linux/pgtable.h              | 11 ++++++++---
 mm/memory.c                          |  4 +---
 7 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.19.1.6.gb485710b

