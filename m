Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859155;
	b=lSo/Tj7i5x+SmjDbiAKH+av/s5r1cyTHTdFRBTXngZoXxYBGCFg/K6pmMgvPTB6JeJfE
	 XjIcJO3UNf/xZGRveIoTXh09WRWaETQwQw2f0E7UZwusAei4VaQ0zVeiveMX+jIR2I9s6
	 z+7XvMAPkmzy3uXylvG8yBH2Crv2+UyG8J+6nqC6OJXSBhM08voIqI7KjPo6+UxTHo8ax
	 xV3+ZN8bZNvJLDadwqlRwbVYN4tOo9N8AJYRZ6zD9EQcab5bo3fqKuEANtHLhEkyXRhEA
	 dNRz1tq0HpG9sypdqFETg3EjO+fI7sEkm4aExBvSLttnNH1nNr2KAkuiR8K6L6qfF2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
	b=eE1qfiAmRim8VVZWVCsZWgF1L7seI9ALrslLcdqqdzpIbCDK7cKY5LTH/szumJ+b98Hu
	 aHyn8xRD7J+ayV07VfEQa1fUSzdZENu22PsZYyh6KA3wIuht4SFcJpc9prTVAwiZaEdqU
	 bieMf5MPoJFrMLTCBljRqY82O9rnFygCC0Xm4LVyuAMJ0EfujRiTWFRH0KLHFF7xESsGI
	 48I9CSY6glF+8HPW5I9yP5kSq8WaIc28QCVk0DtW9pKFjXV+p+tvPm+/CMqh3gwNvTauI
	 /rC0dDRFy9CPvGBKDs6/OQxsmE/Bc7VxBVYdyOwRhb/K1rq6JTtFKFXthSCt8aLJazg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DJZcKdW5;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1C3606A31B
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 06:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DJZcKdW5
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1320456a91.2
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 22:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859154; x=1794463954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
        b=DJZcKdW59U7wjvIfRYSxvS6cw/SwwJdbnzIsiv9D9VFTMaxm/sGfxXCaS4h8lv37He
         FTWfSVSssGD4rjJKhOvhy7IilJWaN0ER7hdV4d5uOG15DV9uk6KG29bzYW5UzVZFyFsC
         S6S2vS9iXZ8gn/FnHFg29vROwFWLvFZlsC75K8Da/dcuWHMvdV5B32xK82/pW0t3j9fD
         58eO9k67BWFKuOlwgGxQ/vFtAnggcOi/XZcVju18hz9rDFSI5srxWdaDDWs856yARbk8
         +G8W5Jp8Xf5J2zM3/1Eeu3p+nnZIXzZcyt7m/yffBzm8bGArXYXPar5c2W9xhg1HjRET
         u2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859154; x=1794463954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
        b=B9F8+RkhCVHmT8v2z4FgCw0cnKhATujdK3R1q9UuUIINxUKKnfPvtLg8eDYcWUOfpp
         aj4IlxgWbn/G7sUk+flLLH21iRNBGzzOeLq6emi+nGVLDNu1fmIsIh3vXzVtRa8pKM+E
         iiWwop/KTU77EgGQJtxYVYDok2NHKavJpzZedLiApT1zAGxJoc98rDSFSHpklh/QBPm7
         ub9S+N1t0G+LQYSwQ7rnLA10sukmlhxVdxeXLD2HRJsDVeu9o2H4Io85DZ99NFAweHT+
         9JERNlUNU9fmmnD1eQ5nJA1yp3wiZBY1Qp+vMX8quA7CzTz8UcoLVEWdfeuLxZoy8DxT
         kKnw==
X-Forwarded-Encrypted: i=1; AKwUvByeJ7dZ/fefQ12Jl3vS4z6lBnbkrIEvBVh5goKBmwO0zqHyJ6uLOlLatauVGXEQeODnL8uOoBCYEwY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9tiizkDaFwsWB2n1xISaGrZ0NE7TbmWwCYF9HLgmHsp3I5m5Bn
	bVx1LIqAOJ2uF7YlxkacVPbcA8MZIe931o+45M6RkDFxhtPdQz77A0+AimT5NcvnKtU=
X-Gm-Gg: AYBFou2Wpn7JvE3jUGHnwt6gHzV6qJWeaBhaCM1R5YwAD3vHkos1z2mELpRGtVvJDJz
	Vfxv+2D7FtVRTjVQ+VWCpKx+e7gC8mHqUMtRn2SrMmkYNvvAJnCH/pWD//r48NTmheBc6qbE9jT
	vIcTeOP41bZZF5TterdP+fmjzXy4JciipPkNnhaOXkD0nSuxOWLUpXWKquX/77/Xd6t/he74o5L
	VakCBJtRvi2orPNJwOYOCNjIiY+PSjrwPrF3SdKCQOIxMtJA9um5uztPD+n+UeK2PGIr901fylE
	0KoHVEPmJYQDF3dNRO7KtkoYZqE/uVSubf+e3J2SKjdBtTx6CvcQroMpoVp8OlwrAZ3AcsH1BCd
	Co4x7kXSLnc9Q2VBkTxeBy48uZvAB3+uUA0vN+RQ1wPcjc0rEhvWNY3iBfISB7SyYSMsHp5+GGi
	Y0BuNI4qpPDJpGdsfSo1QHeissnIORnj6/yVm7aovYOQRRwc6ynGHcznsLHdcmZKTIDKhemlZsF
	FpwFbhPcRfKMq2H0v+k5pa5TzPgTv6ZnquqldZvPcBz2nQ88ioNxignf5Uta6+K9xCA33okIG85
	4cimWNt7hVSZmeAty/Pftkew/QzAKP6MWrl5tZcvcAmHkivqMe2aZBcSeDukelCiPA==
X-Received: by 2002:a17:90b:3844:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3ae89814e4fmr15532805a91.30.1793859153687;
        Wed, 04 Nov 2026 22:12:33 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:32 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 0/5] mm: Simplify device DAX vmemmap optimization plumbing
Date: Thu,  5 Nov 2026 14:12:12 +0800
Message-ID: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: simplifying the device DAX vmemmap
optimization plumbing.

After device DAX was converted to section-based vmemmap optimization,
whether a mapping can be optimized is carried in mem_section, and the
architecture-specific population path can handle any remaining fallback.
The code still retains the DAX-specific vmemmap_can_optimize() helper, a
PowerPC override, and @pgmap arguments threaded through lower-level
vmemmap population and memory-removal interfaces. These duplicate the
section-order policy and keep otherwise generic paths coupled to
dev_pagemap.

This series removes that obsolete plumbing by consolidating the
optimization policy around memory-section metadata and simplifying the
generic and architecture-specific population paths. This also eliminates
dependencies that are no longer needed once the optimization state is
carried by the memory section.

This leaves the section compound order as the single source of truth for
vmemmap optimization and decouples the generic sparse-vmemmap and
memory-hotplug paths from device DAX.

This is another smaller step toward the broader HVO generalization.

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

v2:
- Rebase onto mm-new at dba8aba0a9a0
- Add section_vmemmap_optimization_disable() and use it for PowerPC,
  LoongArch, and altmap fallbacks.
- Add a LoongArch patch that keeps device DAX vmemmap optimization
  disabled while leaving HugeTLB HVO unchanged.
- Ignore section compound orders that cannot be optimized.
- Add direct vmemmap-optimization.h includes for architecture users.

v1: https://lore.kernel.org/20261030140720.1256062-1-songmuchun@bytedance.com/

Muchun Song (5):
  powerpc/mm: make vmemmap_populate_compound_pages() static
  powerpc/mm: drop powerpc vmemmap_can_optimize()
  loongarch/mm: disable device DAX vmemmap optimization
  mm/sparse-vmemmap: drop vmemmap_can_optimize()
  mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs

 arch/arm64/mm/mmu.c                        |  5 +-
 arch/loongarch/mm/init.c                   |  7 +--
 arch/powerpc/include/asm/book3s/64/radix.h | 12 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 +++------
 arch/powerpc/mm/init_64.c                  |  2 +
 arch/powerpc/mm/mem.c                      |  5 +-
 arch/riscv/mm/init.c                       |  5 +-
 arch/s390/mm/init.c                        |  5 +-
 arch/x86/mm/init_64.c                      |  5 +-
 include/linux/memory_hotplug.h             |  8 ++--
 include/linux/mm.h                         | 40 +---------------
 include/linux/vmemmap-optimization.h       | 56 +++++++++++++++++-----
 mm/memory_hotplug.c                        | 16 +++----
 mm/memremap.c                              |  4 +-
 mm/sparse-vmemmap.c                        | 29 ++++++-----
 mm/sparse.c                                |  6 +--
 mm/sparse.h                                |  5 --
 17 files changed, 97 insertions(+), 136 deletions(-)


base-commit: dba8aba0a9a00ff781c03d82ae534fc6f8c2e263
-- 
2.54.0

