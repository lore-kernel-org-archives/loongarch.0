Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D203B192B6D
	for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734946985; cv=none; b=p7XlT9qEYCmC63J2MP6iRWkxVcZGQK1GKkNPtyZVrydedRK0YwTTRHA09t4am7B8sxdJrc13M8py6GlSnkxVacAbMViHir4VpDhXAVXyRg+kUwl/M2BtTgrlT7lf+35VYCRG9BqODQkTAsFsIlYgVCwwaRVtq2XJPX0kq1HC1qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734946985; c=relaxed/simple;
	bh=5DVWBpP0g56PPJYmylzu2Hks40MXN3PGLVlL7LXCmXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f6OF7piBMxIlkA1E6OfHop1M3nDaj15wWlU2yKnp1FNjoI9JcLgjriXrnH3OY7DsiRgUPRLZ698aYz5vZnMvrh/X2zVSvRgXCc5i//tmhfF71Rg9+O/Gr4aPpGhEgbLY5mvuOiq8W3oI8QnsJFKTQ/8Ei+YqTCOICdJ0SRbux3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HmFKrIMT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HmFKrIMT"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725d9f57d90so2878584b3a.1
        for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 01:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734946983; x=1735551783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hW6jy85GFxw1rlbhA2IQSgcMmC6SEwxIAu1eEJQsQ+g=;
        b=HmFKrIMTa0UdTzAoCBlgC989V9aC2KSyv3OGykNewPM+bQs0lXlOpcMsZNKHA4LBba
         1iW2XPnSry9w4OXB890biTDb4Ajrd3bq61J+cngA5PMtJiTx8BoufYwomThcDilUbNfW
         xYpgHV8RI6GTRh6XUr1M8dG3OndLm4+9WjbUMpK/4SFTniQh6xbrjpk60x5xTjK4pWhb
         1wf1a4dyVy7jKHHLns6wTar8FUUYBRKwJ1v0Qldvb8oFJnWk5dEyi6tksHliucEOYatJ
         emvlvacEuEvMBsvEGQQfJTpiU9UaJTaI/XrHyEffRqZK3+PgKW7TFZYz6ZGGE/ii/5x4
         qI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734946983; x=1735551783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hW6jy85GFxw1rlbhA2IQSgcMmC6SEwxIAu1eEJQsQ+g=;
        b=W/5QQcnr9JcIyL7C5tCM5cxj7fOCwya/EOoWqk/b+dP+z0sJyBjNuEc/qbuGpkSbH4
         VNvOQNwllzjWbm66+wGXSUPdec8auugLMKJkSprDtdRFF3kkRIXicqhFCai1rk1tkZov
         3SWCuWYuPKf1gWIP5eYoQPzKkdAwOzJlH6e0y30zWN2acP6//pE6I6oimYfrNFmSDUn+
         Ny0PYON30iCuEd4yxHd6K2oioRgHWQi6JiUEPMUKAn4F5GZB/omV4JBE86YS9n1MRBi0
         8+8WvSsHY8fjC1yXj2OxdwJX3AQN3UIs7kE4TV/JZ2e8HI0Y+U5UCv2MnluXGwfGc4fE
         5Jng==
X-Forwarded-Encrypted: i=1; AJvYcCVPIEDcyi6vga2yp4hxCFDKfmp/ybNnIfFWwOmAEGfgQYePJ3TA6Wd9TlLm7hilTKbOTyFygnRaiFA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMYn+1xIIQBwKaj8csszaMSx2i38quM4UVSdco08VdoUQX5q4m
	eS3rOuhfpPdidKcjmKLEqEYx/O/+OmcXKeIQQSlFoetTT4oCgOLVbO+gxVT4+0E=
X-Gm-Gg: ASbGncuKqzuP7bC+yntRQR96YYvVrAFvB9KptwE/g3I3CFHgg9A4SzI7CDwrsZYIL2g
	zpQ/px6BYBeOOnfnK9+Q7uyT63hrG7nCCAqSqelDIysLo4aqQfGdCxabVqCZv9rQ6nQWD/r+WTl
	RRtxsXcr0SY8wUdvYp/tVy2B4VSEqxjZJIRWVV8MhOdBU6PahwZ4nCNbvHeIpbjJwc1tMoxPJx8
	RIU8NmdlQWZhMzMd6AB1xXEYzee5g4K0u1oir5tBhgG2FZ1GNgtQWys1Qv7NYX/RMn1eoLGx6PP
	AHLeTAGWQUtb+r4e1CiXjA==
X-Google-Smtp-Source: AGHT+IFRta8/SfQvcBY4OAtIB9mripqs4z6X28qqGG6H0nQGOiKq9bgrNZS2epuvDdaQMCTGZ3ooIw==
X-Received: by 2002:a05:6a21:4986:b0:1e1:b1bb:87a0 with SMTP id adf61e73a8af0-1e606dfe60fmr3973055637.34.1734946982984;
        Mon, 23 Dec 2024 01:43:02 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:02 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 00/17] move pagetable_*_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:46 +0800
Message-Id: <cover.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
  x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
  s390: pgtable: also move pagetable_dtor() of PxD to
    __tlb_remove_table()
  mm: pgtable: introduce generic __tlb_remove_table()
  mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
  mm: pgtable: remove tlb_remove_page_ptdesc()
  mm: pgtable: remove tlb_remove_ptdesc()
  mm: pgtable: introduce generic pagetable_dtor_free()

 Documentation/mm/split_page_table_lock.rst |  4 +-
 arch/arm/include/asm/tlb.h                 | 18 +-----
 arch/arm64/include/asm/pgalloc.h           | 18 ------
 arch/arm64/include/asm/tlb.h               | 31 ++++-----
 arch/csky/include/asm/pgalloc.h            |  4 +-
 arch/hexagon/include/asm/pgalloc.h         |  4 +-
 arch/loongarch/include/asm/pgalloc.h       |  4 +-
 arch/m68k/include/asm/mcf_pgalloc.h        |  4 +-
 arch/m68k/include/asm/sun3_pgalloc.h       |  4 +-
 arch/m68k/mm/motorola.c                    |  2 +-
 arch/mips/include/asm/pgalloc.h            |  4 +-
 arch/nios2/include/asm/pgalloc.h           |  4 +-
 arch/openrisc/include/asm/pgalloc.h        |  4 +-
 arch/powerpc/include/asm/tlb.h             |  1 +
 arch/powerpc/mm/book3s64/mmu_context.c     |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c         |  2 +-
 arch/powerpc/mm/pgtable-frag.c             |  4 +-
 arch/riscv/include/asm/pgalloc.h           | 75 ++++++----------------
 arch/riscv/include/asm/tlb.h               | 18 ------
 arch/riscv/mm/init.c                       |  4 +-
 arch/s390/include/asm/pgalloc.h            | 31 ++++++---
 arch/s390/include/asm/tlb.h                | 43 ++++++-------
 arch/s390/mm/pgalloc.c                     | 31 ++-------
 arch/sh/include/asm/pgalloc.h              |  4 +-
 arch/sparc/include/asm/tlb_32.h            |  1 +
 arch/sparc/include/asm/tlb_64.h            |  1 +
 arch/sparc/mm/init_64.c                    |  2 +-
 arch/sparc/mm/srmmu.c                      |  2 +-
 arch/um/include/asm/pgalloc.h              | 12 ++--
 arch/x86/include/asm/pgalloc.h             | 18 ------
 arch/x86/include/asm/tlb.h                 | 33 ----------
 arch/x86/kernel/paravirt.c                 |  1 +
 arch/x86/mm/pgtable.c                      | 13 ++--
 include/asm-generic/pgalloc.h              | 60 +++++++++++++----
 include/asm-generic/tlb.h                  | 23 +++----
 include/linux/mm.h                         | 52 ++++++---------
 include/linux/mm_types.h                   |  9 +--
 mm/memory.c                                | 23 ++-----
 mm/mmu_gather.c                            | 19 +++++-
 39 files changed, 228 insertions(+), 361 deletions(-)

-- 
2.20.1

