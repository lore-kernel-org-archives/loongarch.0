Received: from out0-209.mail.aliyun.com (out0-209.mail.aliyun.com [140.205.0.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B1F4501B
	for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386963; cv=none; b=BwQd1Mc4Lht+0SOMZCNroy3Mh5UOSIqplPIpaXZb8f33iZ57QkPX9Xk2K9hPutpmxvI+4ODekclT5vx+wA8JvuJtBu98T2MIUdny5hvTR5AUIH0Ok2zhDviQNjeGNuebkKtUuQmJ2Cl+Q6wx4k9RnZ8EMBczkS83ZZo4DPVfSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386963; c=relaxed/simple;
	bh=h2xeHWWYBwglEX+x9qdisO8pVjvAPSpXhXhaDjkMQHU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jUFX93h5h3uOHaLNtHrONEdqXNmz8FoHtTC+g4yF/kklZprWkXxT8oy9Yj3bysmUCEXYDNJ58W2mE+5h9iaDHj9NqDC7vg+42nKEFlqQr6KcT1BQ0xcXua5wTEHTa1c0kaQ8ez0rWiEPEMWPieBmFTed02sxvcZJmEvjpo54NYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=PVcMy6rp; arc=none smtp.client-ip=140.205.0.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="PVcMy6rp"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386951; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=dLJfLm6QSven/Kk0xr1PvysR3nscl1fg/cBxpNWoFzo=;
	b=PVcMy6rpN3G6hrWH1xrz2dInatlyhnLhXbsR0OM0kKbvcFakzDI1B9NGePNHWYkb89csSGnwyFKbbdfMxKVU4uy4eSmLaiZ3AETS5MXxab1FtLfxVHslKMkeSHZIYfshLkcyQ18HmAJ4F67+HJlb2nU3q/pq+wR/hoSFQAGCKBY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047192;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOFewr4_1714386949;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOFewr4_1714386949)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:50 +0800
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
Subject: [PATCH v1 0/5] Add update_mmu_tlb_range() to simplify code
Date: Mon, 29 Apr 2024 18:33:41 +0800
Message-Id: <20240429103346.59115-1-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series of commits mainly adds the update_mmu_tlb_range() to
batch update tlb in an address range.

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), We may need to batch update tlb of a certain address
range by calling update_mmu_tlb() in a loop. Using the 
update_mmu_tlb_range(), we can simplify the code and possibly reduce the
execution of some unnecessary code in some architectures.

Bang Li (5):
  LoongArch: Add update_mmu_tlb_range()
  mips: Add update_mmu_tlb_range()
  riscv: Add update_mmu_tlb_range()
  xtensa: Add update_mmu_tlb_range()
  mm: Add update_mmu_tlb_range()

 arch/loongarch/include/asm/pgtable.h | 2 ++
 arch/mips/include/asm/pgtable.h      | 2 ++
 arch/riscv/include/asm/pgtable.h     | 2 ++
 arch/xtensa/include/asm/pgtable.h    | 2 ++
 arch/xtensa/mm/tlb.c                 | 6 ++++++
 include/linux/pgtable.h              | 5 +++++
 mm/memory.c                          | 4 +---
 7 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.19.1.6.gb485710b

