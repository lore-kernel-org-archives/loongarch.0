Received: from out187-14.us.a.mail.aliyun.com (out187-14.us.a.mail.aliyun.com [47.90.187.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE8142E8A
	for <loongarch@lists.linux.dev>; Mon,  6 May 2024 15:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715010741; cv=none; b=pPAQDNMbW0I8k9oSUeR7uVPaxHjOMkv4pf0hhhVF7MN7sXpnfeL0qMTKo+Lir69K1ZTP/3uLMTEIIjARsXalTO0eGuiWxSkxgodddPJKTGMGZwQXZdBpIQAiLPYsLB88YTNwx8L9DHTGXvNHU9Q8IqgIKZcoPgH4OBvG59Hk2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715010741; c=relaxed/simple;
	bh=QxU4xP/UtRSyvVOvavTzU56iJmtUuco9rYcv/ovt128=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CNlQ0p4YCoSRq8k//2adgDp6ao4fIdRKmV6ApeQgfv7sGI6HolEWcc1GF5pE8OqByZzKA8akhQBWudcFqxWjwyaLgmYTeGfquiQ6TkUG72HsfWgJzF4241qF5WbeWnDIhLIUqK1by0WRRVndzEyPQZ4MqDVHYV0ZmfRusAdlv4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=aBeNaWF3; arc=none smtp.client-ip=47.90.187.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="aBeNaWF3"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715010721; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=j6/KtEs6TFeoK8UWIq9uFemS/8A9ve6yI0uusmjA3lY=;
	b=aBeNaWF3w1hDrUqkBHaJoamYZGSLXktyvEshekUJq1v8KNNIVUE2RzfeI3OngPo61gdypuHfG7ftbYryWaZgg1RuQ+VP0J7CYnZX8Aj8Qa0CTpSuLapyTMrf2wVMm46tUS2c0TyyDm8cN/D1I81WjkRkjgTt/p9SWdafXxKxo+g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047204;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XThas7i_1715010719;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XThas7i_1715010719)
          by smtp.aliyun-inc.com;
          Mon, 06 May 2024 23:52:00 +0800
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
Subject: [PATCH v2 0/5] Add update_mmu_tlb_range() to simplify code
Date: Mon, 06 May 2024 23:51:15 +0800
Message-Id: <20240506155120.83105-1-libang.li@antgroup.com>
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

Thanks,
Bang

Changes since v1 [1]:
 - Add __HAVE_ARCH_UPDATE_MMU_TLB_RANGE macro (per Lance Yang)

[1] https://lore.kernel.org/linux-mm/20240429103346.59115-1-libang.li@antgroup.com/

Bang Li (5):
  LoongArch: Add update_mmu_tlb_range()
  mips: Add update_mmu_tlb_range()
  riscv: Add update_mmu_tlb_range()
  xtensa: Add update_mmu_tlb_range()
  mm: Add update_mmu_tlb_range()

 arch/loongarch/include/asm/pgtable.h | 4 ++++
 arch/mips/include/asm/pgtable.h      | 4 ++++
 arch/riscv/include/asm/pgtable.h     | 4 ++++
 arch/xtensa/include/asm/pgtable.h    | 4 ++++
 arch/xtensa/mm/tlb.c                 | 6 ++++++
 include/linux/pgtable.h              | 8 ++++++++
 mm/memory.c                          | 4 +---
 7 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.19.1.6.gb485710b

