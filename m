Received: from out0-204.mail.aliyun.com (out0-204.mail.aliyun.com [140.205.0.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BC9C8D1
	for <loongarch@lists.linux.dev>; Sat, 18 May 2024 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716019021; cv=none; b=LT5G6+tD6rm+bzmRjm5haDm6w3RovYlvxotkwu161CQ0NimeCbo0i1oNp0MtWFswvT4PdSrsJ25wrSgaCefYoRvbOrxzsWv88fdhkrFNpouatnbV6MduSgSFakOw/IhyKcCeETqDm5PvlesNz0j9BNfl9SBVhf0oL7x8nIYnNLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716019021; c=relaxed/simple;
	bh=nifAML72DAg47mSHoyFc+yQB6k76eOuWitHSpVdE7/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H0c4Fp01OG8Ee5Cl/N5n7tkLg4yViopj5IOOxeOI40XaDpvv0rl7jlvA0r6D67yJ7Ai+Xxi8FYqjhzb8padofaJERdaPd/y2NcKq3RBaddp6XOpo+MVNDmi8RTWWa8SiDu1pooGcNfDISxFMxnwrgqDXYS0qmNvGOxN0g2oM/5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=1b96XBuM; arc=none smtp.client-ip=140.205.0.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="1b96XBuM"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716019010; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=GQ8XlBmX7iG6Cx7KU2H5vSERCOEK8rIAF03pf3vdLkg=;
	b=1b96XBuMFDlKo+FQZ6LaxJUIBC3oURjeN1cG+bQ2oQg5TfJ4ykuoUML6DfzlKZoRvR1k95IRM5jYarjxo8aw7yejCzlePMFwy89pkZZyL1eW0Ip1S7uqUZyZkDRf2YrFRRNCn9fZq1I4lqN5V6u/ofUyLRT8833D61rFL6DmFxU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067116;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.Xg9HuaJ_1716018692;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.Xg9HuaJ_1716018692)
          by smtp.aliyun-inc.com;
          Sat, 18 May 2024 15:51:33 +0800
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
Subject: [PATCH v3 0/3] Add update_mmu_tlb_range() to simplify code
Date: Sat, 18 May 2024 15:49:11 +0800
Message-Id: <20240518074914.52170-1-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series of commits mainly adds the update_mmu_tlb_range() to
batch update tlb in an address range and refactor the update_mmu_tlb().

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), We may need to batch update tlb of a certain address
range by calling update_mmu_tlb() in a loop. Using the
update_mmu_tlb_range(), we can simplify the code and possibly reduce the
execution of some unnecessary code in some architectures.

Thanks,
Bang

Changes since v2 [2]:
 - Use generic architecture to implement update_mmu_tlb() (per Ryan)

Changes since v1 [1]:
 - Add __HAVE_ARCH_UPDATE_MMU_TLB_RANGE macro (per Lance Yang)

[1] https://lore.kernel.org/linux-mm/20240429103346.59115-1-libang.li@antgroup.com/
[2] https://lore.kernel.org/linux-mm/20240506155120.83105-1-libang.li@antgroup.com/

Bang Li (3):
  mm: Add update_mmu_tlb_range()
  mm: Refactor update_mmu_tlb()
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

