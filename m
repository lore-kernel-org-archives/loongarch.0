Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A537C
	for <loongarch@lists.linux.dev>; Wed,  6 Jul 2022 09:15:03 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R381e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=33;SR=0;TI=SMTPD_---0VIXd7j9_1657097961;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VIXd7j9_1657097961)
          by smtp.aliyun-inc.com;
          Wed, 06 Jul 2022 16:59:22 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: rppt@linux.ibm.com,
	willy@infradead.org,
	will@kernel.org,
	aneesh.kumar@linux.ibm.com,
	npiggin@gmail.com,
	peterz@infradead.org,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tsbogend@alpha.franken.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	arnd@arndb.de,
	guoren@kernel.org,
	monstr@monstr.eu,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	baolin.wang@linux.alibaba.com,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-csky@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add PUD and kernel PTE level pagetable account
Date: Wed,  6 Jul 2022 16:59:14 +0800
Message-Id: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Hi,

Now we will miss to account the PUD level pagetable and kernel PTE level
pagetable, as well as missing to set the PG_table flags for these pagetable
pages, which will get an inaccurate pagetable accounting, and miss
PageTable() validation in some cases. So this patch set introduces new
helpers to help to account PUD and kernel PTE pagetable pages.

Note there are still some architectures specific pagetable allocation
that need to account the pagetable pages, which need more investigation
and cleanup in future.

Changes from RFC v3:
 - Rebased on 20220706 linux-next.
 - Introduce new pgtable_pud_page_ctor/dtor() and rename the helpers.
 - Change back to use inc_lruvec_page_state()/dec_lruvec_page_state().
 - Update some commit message.
link: https://lore.kernel.org/all/cover.1656586863.git.baolin.wang@linux.alibaba.com/

Changes from RFC v2:
 - Convert to use mod_lruvec_page_state() for non-order-0 case.
 - Rename the helpers.
 - Update some commit messages.
 - Remove unnecessary __GFP_HIGHMEM clear.
link: https://lore.kernel.org/all/cover.1655887440.git.baolin.wang@linux.alibaba.com/

Changes from RFC v1:
 - Update some commit message.
 - Add missing pgtable_clear_and_dec() on X86 arch.
 - Use __free_page() to free pagetable which can avoid duplicated virt_to_page().
link: https://lore.kernel.org/all/cover.1654271618.git.baolin.wang@linux.alibaba.com/

Baolin Wang (3):
  mm: Factor out the pagetable pages account into new helper function
  mm: Add PUD level pagetable account
  mm: Add kernel PTE level pagetable pages account

 arch/arm64/include/asm/tlb.h         |  5 ++++-
 arch/csky/include/asm/pgalloc.h      |  2 +-
 arch/loongarch/include/asm/pgalloc.h | 12 +++++++++---
 arch/microblaze/mm/pgtable.c         |  2 +-
 arch/mips/include/asm/pgalloc.h      | 12 +++++++++---
 arch/openrisc/mm/ioremap.c           |  2 +-
 arch/x86/mm/pgtable.c                |  7 +++++--
 include/asm-generic/pgalloc.h        | 26 ++++++++++++++++++++++----
 include/linux/mm.h                   | 34 ++++++++++++++++++++++++++--------
 9 files changed, 78 insertions(+), 24 deletions(-)

-- 
1.8.3.1

