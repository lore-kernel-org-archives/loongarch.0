Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1281D1A9B2A
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319558; cv=none; b=LN3D9exCAOf/ZiDcLwSNnFcV6PrgQN7iTOMngYdxAF0sbCyoc7kLIuAI7/2+JzWh7EQD7Jw1fBeKSarfY8cBRK30tVRhaW2hbM8Nb8YKz1QDUvAkwgpGCM+bdZtZag5bWZTE2oFTbT+5xIy2jQilMQf7TW1B+SdMNC2bjftMul8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319558; c=relaxed/simple;
	bh=EdTs1gy5zYgx6BoMVvtYVm1nCTmCaYsA6ZdI4rTRksQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aU9ZncFZxzN7xiMBNbmDST28PAY5TafpgcFGQYrBihRR7Ybl3n2dmFh0ouVx9pnnBbmKXfs8l5WfgXpPyvSpt+plTRDO57WGtsKYO0FIut/jRtrDqkTNc8GtXwBZydJ/VZEMsa4PuiPaViADnn2Ug8C2N1Pdzzyy5MWsQ+KLMec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Kz1/q7xC; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Kz1/q7xC"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso19474855a91.1
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 22:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319555; x=1736924355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUJziA+3SIeve9hH8p/SUshEWFM4XR7pFGccDfjKoA=;
        b=Kz1/q7xCH3DApDSqCP2/HTRnWDzf0GD7G5eP1W5pGQcvk3CDFlXPDXyj7NmRPGydrv
         AmBmY6gzmDbNTKV+XXg/Kx8Xfvv6SyJcPmJV1yrlxKq6tLFgFriM2u2OoCes7BMXgbEv
         1SXdPZafhr0deUl3EgrMwbiVD1SyG0K+0GPjkbS49aYVqVD2rVLxBp6ommgBtmahfC41
         YVJXr0EzOfVOxEOYgmRghghkyXhEFcEy1SF4PySpR8c+po6UBFASlcx1HkLg4bKi/p6i
         lMmN0waVQH2wfPcHjamuceg9A0EOAAIa+rEi1o4ZZ8CAU1n3bGtdVTxq2WbydcE3fcu1
         OADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319555; x=1736924355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oUJziA+3SIeve9hH8p/SUshEWFM4XR7pFGccDfjKoA=;
        b=CD/h9iphJtn+VTk2CSumHpJJdonzgh+SkyAs7PhCwqPQeVhMwNfmn0lfpYtD5Vqp2J
         C5Au5g25jRchI2vB3wcqI+C13NAXWueOfV930YWA36TDB2OEgUxSksXE8VZCYdqFhjmg
         KJZmeZEPkRcj1AlsMH1KXUtT0U0jDls5X3/tLmi3PqC96R/3MmLLI4TT/yXNu/1rHQHw
         6SXo3925oX0+MEBWCNwdc+3g4VkI9zblLEM8lixh0U6bW5wqdVUTYwcTzgNCksI9+E6J
         AszEpM4io4GMPleOkswQhTp58zRwPBFRA9gGpUwPox9p6L92V1oJzTNX33Whp9JlM1ps
         4jlA==
X-Forwarded-Encrypted: i=1; AJvYcCUZElU7aJekZNbGrr8zDGupjpYSFoggWHW13Z3+KHQqkgZ8mSOJP5umQJ1+fw3cR+roAek2Jqhpvjg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9wpTpZiTVVOtn1Lc3gqPFRyVaGg3wQE4P7miDw1K7ZONMdFQf
	agbycI7QYAE70yjqMmBBja2w3vRjpOrTEyU0mczIR1TL96laJtYDyqvx9fBRD24=
X-Gm-Gg: ASbGncsAKugE3wwbU5ml2PbTkzvZ3JncOxtvZEWeXMFK/+iNGoYDYM2Q/GX7iopVIM1
	HpvQn8LJusLahdPNkieQ/On4swMiA8Sko1JYrhu1MYbplqi14CDuRMSB1FQ+f/QgUB+13Djc13x
	eR6eAbwQjhR6eyiHosmG9egT+rgi1rc6RaQXgwcFybLDZb0U4m4Jh6jVtDU9PD/pDQ7lhCNdasK
	/gSn24HJLINlKTef5d22h4aMLNRs47Krt7/ZaqjngeP//kW29KnAYf7h34nJR3NrZrLsGQICFM9
	4ZJkOF3abKzty4LeR5hn96urFAk=
X-Google-Smtp-Source: AGHT+IF0KICf2IpNdbhCgJ/4FLwWodDPqZ+kJ6jQ+m3hTC2SCt6RG6Dd8PQChw/e3cG7DLZH3PR19A==
X-Received: by 2002:a17:90b:4d05:b0:2ee:f80c:6884 with SMTP id 98e67ed59e1d1-2f548f426ccmr2612187a91.33.1736319554907;
        Tue, 07 Jan 2025 22:59:14 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.22.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 22:59:14 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 00/17] move pagetable_*_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:16 +0800
Message-Id: <cover.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v5:
 - cancel the move of p4d_free_tlb()'s location in [PATCH v4 06/15]
   (Alexander Gordeev)
 - fix the missing pagetable_dtor() in [PATCH v4 08/15] (Kevin Brodsky)
 - change the subject and description in [PATCH v4 12/15]
   (Alexander Gordeev)
 - remove the redundant __HAVE_ARCH_TLB_REMOVE_TABLE definition in [PATCH v4 13/15]
   (Andreas Larsson)
 - add "mm: pgtable: completely move pagetable_dtor() to generic tlb_remove_table()"
   (Kevin Brodsky)
 - add "x86: pgtable: convert __tlb_remove_table() to use struct ptdesc"
 - collect Acked-bys and Reviewed-bys

Changes in v4:
 - remove [PATCH v3 15/17] and [PATCH v3 16/17] (Mike Rapoport)
   (the tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are intermediate
    products of the project: https://kernelnewbies.org/MatthewWilcox/Memdescs,
    so keep them)
 - collect Acked-by

Changes in v3:
 - take patch #5 and #6 from Kevin Brodsky's patch series below.
   Link: https://lore.kernel.org/lkml/20241219164425.2277022-1-kevin.brodsky@arm.com/
 - separate the statistics part from [PATCH v2 02/15] as [PATCH v3 04/17], and
   replace the rest part with Kevin Brodsky's patch #6
   (Alexander Gordeev and Kevin Brodsky)
 - change the commit message of [PATCH v2 10/15] and [PATCH v2 11/15]
   (Alexander Gordeev)
 - fix the bug introduced by [PATCH v2 11/15]
   (Peter Zijlstra)
 - rebase onto the next-20241220

Changes in v2:
 - add [PATCH v2 13|14|15/15] (suggested by Peter Zijlstra)
 - add Originally-bys and Suggested-bys
 - rebase onto the next-20241218

Hi all,

As proposed [1] by Peter Zijlstra below, this patch series aims to move
pagetable_*_dtor() into __tlb_remove_table(). This will cleanup pagetable_*_dtor()
a bit and more gracefully fix the UAF issue [2] reported by syzbot.

```
Notably:

 - s390 pud isn't calling the existing pagetable_pud_[cd]tor()
 - none of the p4d things have pagetable_p4d_[cd]tor() (x86,arm64,s390,riscv)
   and they have inconsistent accounting
 - while much of the _ctor calls are in generic code, many of the _dtor
   calls are in arch code for hysterial raisins, this could easily be
   fixed
 - if we fix ptlock_free() to handle NULL, then all the _dtor()
   functions can use it, and we can observe they're all identical
   and can be folded

after all that cleanup, you can move the _dtor from *_free_tlb() into
tlb_remove_table() -- which for the above case, would then have it
called from __tlb_remove_table_free().
```

And hi Andrew, I developed the code based on the latest linux-next, so I reverted
the "mm: pgtable: make ptlock be freed by RCU" first. Once the review of this
patch series is completed, the "mm: pgtable: make ptlock be freed by RCU" can be
dropped directly from mm tree, and this revert patch will not be needed.

This series is based on next-20241220. And I tested this patch series on x86 and
only cross-compiled it on arm, arm64, powerpc, riscv, s390 and sparc.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/all/20241211133433.GC12500@noisy.programming.kicks-ass.net/
[2]. https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Kevin Brodsky (2):
  riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
  asm-generic: pgalloc: Provide generic p4d_{alloc_one,free}

Qi Zheng (15):
  Revert "mm: pgtable: make ptlock be freed by RCU"
  mm: pgtable: add statistics for P4D level page table
  arm64: pgtable: use mmu gather to free p4d level page table
  s390: pgtable: add statistics for PUD and P4D level page table
  mm: pgtable: introduce pagetable_dtor()
  arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
  arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
  riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
  x86: pgtable: convert __tlb_remove_table() to use struct ptdesc
  x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
  s390: pgtable: consolidate PxD and PTE TLB free paths
  mm: pgtable: introduce generic __tlb_remove_table()
  mm: pgtable: completely move pagetable_dtor() to generic
    tlb_remove_table()
  mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
  mm: pgtable: introduce generic pagetable_dtor_free()

 Documentation/mm/split_page_table_lock.rst |  4 +-
 arch/arm/include/asm/tlb.h                 | 10 ----
 arch/arm64/include/asm/pgalloc.h           | 18 ------
 arch/arm64/include/asm/tlb.h               | 21 ++++---
 arch/csky/include/asm/pgalloc.h            |  2 +-
 arch/hexagon/include/asm/pgalloc.h         |  2 +-
 arch/loongarch/include/asm/pgalloc.h       |  2 +-
 arch/m68k/include/asm/mcf_pgalloc.h        |  4 +-
 arch/m68k/include/asm/sun3_pgalloc.h       |  2 +-
 arch/m68k/mm/motorola.c                    |  2 +-
 arch/mips/include/asm/pgalloc.h            |  2 +-
 arch/nios2/include/asm/pgalloc.h           |  2 +-
 arch/openrisc/include/asm/pgalloc.h        |  2 +-
 arch/powerpc/include/asm/tlb.h             |  1 +
 arch/powerpc/mm/book3s64/mmu_context.c     |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c         |  2 +-
 arch/powerpc/mm/pgtable-frag.c             |  4 +-
 arch/riscv/include/asm/pgalloc.h           | 69 +++++-----------------
 arch/riscv/include/asm/tlb.h               | 18 ------
 arch/riscv/mm/init.c                       |  4 +-
 arch/s390/include/asm/pgalloc.h            | 31 +++++++---
 arch/s390/include/asm/tlb.h                | 10 ++--
 arch/s390/mm/pgalloc.c                     | 23 +-------
 arch/sh/include/asm/pgalloc.h              |  2 +-
 arch/sparc/include/asm/tlb_64.h            |  1 +
 arch/sparc/mm/init_64.c                    |  2 +-
 arch/sparc/mm/srmmu.c                      |  2 +-
 arch/um/include/asm/pgalloc.h              |  6 +-
 arch/x86/include/asm/pgalloc.h             | 18 ------
 arch/x86/include/asm/tlb.h                 | 33 -----------
 arch/x86/kernel/paravirt.c                 |  5 +-
 arch/x86/mm/pgtable.c                      | 23 ++++----
 include/asm-generic/pgalloc.h              | 55 +++++++++++++++--
 include/asm-generic/tlb.h                  | 24 ++++++--
 include/linux/mm.h                         | 50 ++++++----------
 include/linux/mm_types.h                   |  9 +--
 mm/memory.c                                | 23 +++-----
 mm/mmu_gather.c                            | 20 ++++++-
 38 files changed, 211 insertions(+), 299 deletions(-)

-- 
2.20.1

