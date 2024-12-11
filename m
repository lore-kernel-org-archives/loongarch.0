Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD031F2C40
	for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 23:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959680; cv=none; b=ROH6p0uWftzBaUOj/CLAxjQUm0XIO1SkrN/PIrdN6SLxHRt2U8JvhS3Jt7ZLqnF50jNao+tB2TsH2bRzjtM/sn51LqXpY3V12ZkZzyYCnEeccK0TSuyIbXOMLv4x4HwaJnUW+WJB4Nf81jsh+VnAJZCSkzI/93N0NgDyTqqsqxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959680; c=relaxed/simple;
	bh=tkYUgsJNBXav1rnN7mRsWNxCkvx1+/sVfFghfRuojcE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=X+HWoQhGgoeXiApCVU25FkSv4BWtZiZ9JGMNCguW81aA3BH8Idgbqr2qCPQRW70jD+Vexjbqhx81L7YNJ/aobm+duK5QEA+JJHOBcnNNCI2sgBWEmPG80eM4LTSAzSFGdDQqmNA26FQfezi9v/N3GeETt3Ng0nqylxkR33fuGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i9qtTdEc; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i9qtTdEc"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7f80959f894so1058143a12.1
        for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 15:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959678; x=1734564478; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
        b=i9qtTdEcjHYZctzjxARyeOVlyxQSSQFY6WLhmwgSeLqwKwGcHxOfhZRT5VPFaciZ+L
         Q/jOBtz8iDjXSTJqkAT1b3Lf+noBT055cCX+7o2AsoGXvS2C9Kk2FfM+c31mFHB9OZrf
         wIxmqIGS0lWBRd3kgWNPAtbkb+aydIQgkPTd6RL9razi+dMwZjFk5YkN4Qk0U7ohSKP8
         6Tn4mw3y5htY9jDO8phbaG7oDN+r+j1ZiQNv6SNKrBqOdh+Ccxh6LkWKJ2e9IS1QtlAx
         ALdHhzJlNh0R2V9uXDZfeCQFgh9cDaBXT5+wfdmBZmN2HrwPny5kZfnbgApKH4BSEXb2
         Og5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959678; x=1734564478;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
        b=vQsSBiFiW4UB62s6IkMEtfBAj0DyNJZjwR1ci0VRRh/EzY+uzHwwhc5o44t5gEbXSC
         3VmXq8FyacG6g08qPU8sRyLt0g6Z/1rM9WHYJOUoIDMph9MwsdsFnbDVZztCbpxVxO8k
         DS0F98vWsTvxvjXL+J82hGHgUZVuKUL6Abxy7gFYzXHAnGDysjZUAqfuYFcB/VQMWoFp
         wKqjxHcT9tbAyZLLweh35go80VGK1O3rmx5RM+9WalKWrci8vdYIh3curkiCbO5F1Jg5
         zn1u2U9txEgtbs3ZVngxm5sofgeoKfqwyGV28kE2i72KLqUDLwAjsv5cInxMh62GMF0T
         pCjw==
X-Forwarded-Encrypted: i=1; AJvYcCW6QRInmPoWO0VVn48g3VcOilFmd4bKvhiD8bXrKvNf9B+8M3Et8tJlv/Vo+xjCO/cZuDhJdeulMj0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+5KREzb+XOKUTfjghhT/Zmt0cCJeTtQVhrMG0Tq2WeO3mhEI0
	b3GkEeRN0TSz1qCxgRLmDRjaW3Lgg9br9NUK90bEpAnr2pO4gC2+Ki2Auw5OwsZ9z3hS1k8MQKw
	ycXoZzZLnhovuXwA1plD/5A==
X-Google-Smtp-Source: AGHT+IH+hxwnbTejsd5rMe6ZdiiLsQVYXh76CpSNZ1O0EO7ZME4Z+uiov/c6u6U8sBeYTnWqfHb7LFZNMZjeMUedcw==
X-Received: from pjj11.prod.google.com ([2002:a17:90b:554b:b0:2ef:9866:6155])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1f81:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-2f13abc6e43mr1624666a91.5.1733959677870;
 Wed, 11 Dec 2024 15:27:57 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:38 -0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-1-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

This is v2 othe the arch_mmap_hint() series.

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate most of the error handling in arch_mmap_hint().
  - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
    Patch 2 ("mm: x86: Introduce arch_mmap_hint()")

v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/

=======

This series introduces arch_mmap_hint() to handle allocating VA space
for the hint address.

Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
issue of mmap hint being ignored in some cases due to THP alignment [1]

[1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/

Thanks,
Kalesh


Kalesh Singh (16):
  mm: Introduce generic_mmap_hint()
  mm: x86: Introduce arch_mmap_hint()
  mm: arm: Introduce arch_mmap_hint()
  mm: alpha: Introduce arch_mmap_hint()
  mm: arc: Use generic_mmap_hint()
  mm: csky: Introduce arch_mmap_hint()
  mm: loongarch: Introduce arch_mmap_hint()
  mm: mips: Introduce arch_align_mmap_hint()
  mm: parisc: Introduce arch_align_mmap_hint()
  mm: s390: Use generic_mmap_hint()
  mm: sh: Introduce arch_mmap_hint()
  mm: sparc32: Introduce arch_mmap_hint()
  mm: sparc64: Introduce arch_mmap_hint()
  mm: xtensa: Introduce arch_mmap_hint()
  mm: powerpc: Introduce arch_mmap_hint()
  mm: Respect mmap hint before THP alignment if allocation is possible

 arch/alpha/include/asm/pgtable.h           |   1 +
 arch/alpha/kernel/osf_sys.c                |  31 +++---
 arch/arc/include/asm/pgtable.h             |   1 +
 arch/arc/mm/mmap.c                         |  43 +++++----
 arch/arm/include/asm/pgtable.h             |   1 +
 arch/arm/mm/mmap.c                         | 107 +++++++++------------
 arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
 arch/csky/abiv1/mmap.c                     |  68 +++++++------
 arch/loongarch/include/asm/pgtable.h       |   1 +
 arch/loongarch/mm/mmap.c                   |  49 +++++-----
 arch/mips/include/asm/pgtable.h            |   1 +
 arch/mips/mm/mmap.c                        |  50 +++++-----
 arch/parisc/include/asm/pgtable.h          |   1 +
 arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
 arch/powerpc/include/asm/book3s/64/slice.h |   1 +
 arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
 arch/s390/include/asm/pgtable.h            |   1 +
 arch/s390/mm/mmap.c                        |  51 +++++-----
 arch/sh/include/asm/pgtable.h              |   1 +
 arch/sh/mm/mmap.c                          |  83 ++++++----------
 arch/sparc/include/asm/pgtable_32.h        |   1 +
 arch/sparc/include/asm/pgtable_64.h        |   1 +
 arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
 arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
 arch/x86/include/asm/pgtable_64.h          |   1 +
 arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
 arch/xtensa/kernel/syscall.c               |  31 ++++--
 include/linux/sched/mm.h                   |   9 ++
 mm/huge_memory.c                           |  17 ++--
 mm/mmap.c                                  |  86 +++++++++++------
 30 files changed, 491 insertions(+), 424 deletions(-)

-- 
2.47.0.338.g60cca15819-goog

