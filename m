Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025919;
	b=sHzLQGo/6AMoSaBydOJpC36gxIaj/3PriQl74sGPp692Swd9F4LVOsQSEDe6zU5s22QB
	 EaxFbiuUV0xgnu4yf7VvcRsGIlBaf8+Ia+pPvJOjUiY6kb1nCqGbz0/vHoMtxSJIHabqJ
	 nK22K4YbD+RLMblbnRJrvls8LYhPmbbeStOIqerKpq7EQ1P2YKtk5Yfe+wlrWZwZVYsEZ
	 v/97SlW9vH1U1458qnvpxBQYvvnqNlGDVBXxChIBSshvoZUMGgil3KgqWKE3nQBzEtwAS
	 rQfR9XXFEYXwya/OSeZgAG4KAzfiwCtodGbbMYxiVKeivm0lB5UGOnuj3p86CFKrz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tMJYIXC5HK/L92Fsjcvgr4iGfrMwtNzZGIshDMxf8u0=;
	b=Iy+zrYg44MNprrTxIKD6OeSG8mHH8pbFvDz4RAiev4t15MTqHZ4iV8U4gzjL/+QvLT+K
	 ARgLLKM13byuF2UV0/fHyC0VItcW74pZdz2lmQPMiG15hQvLIvaI7o8cwYxeS7+B7kgmo
	 9UjTPesPpA5ytNkwcqdUQmkREuq8ARuuOzHbL86ILtD1lEp6klUJANQjtYaxl+BHVnHNS
	 vgGfvz97pykFqEVz/NZKDVGWSpopUkak4/aQVLa46J+2/JwVdsfidAqtc25ZWhyuxlzNA
	 AKsxXupqLrGyw++Lev+grH4K3zR1UR5SPCXsHG9OwI9jEyH9csnvdphixGOPvAWtIyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GWouNigy;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0C606A32D
	for <loongarch@lists.linux.dev>; Sat,  7 Nov 2026 04:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA0C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=GWouNigy
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc147d86bebso163429a12.0
        for <loongarch@lists.linux.dev>; Fri, 06 Nov 2026 20:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025917; x=1794630717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMJYIXC5HK/L92Fsjcvgr4iGfrMwtNzZGIshDMxf8u0=;
        b=GWouNigyQVpx7Y3yLMvXxf96LmTfJ9jrvOaK2NzUzjFqm1YKS/e6lu831H85UfzUvQ
         7cyuKIWsaEgmNnSjeAOIcgruHEZ667rKB4ovkRyGTmrNMScXfm1gp94KNJKpSxUOf4SC
         hvEZWmGu612xKdXZyNMrEb7JfcH7TV10mNlBMVhtM7JZhckhOb/MhP58r/1ELweJ8fOC
         fpniMoB0oKMw5zMI0s2fTqZFJeVEko/hyzl7vG4yYg3tgsd8v/Igy+xiOgt2EwumQYtc
         W0hlFD0h1hpnvXV/A/Op+fwFNQLv/VEa2vwzVLr88OjwAfryRtredpNPr5MwtlAMY2LW
         HKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025917; x=1794630717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMJYIXC5HK/L92Fsjcvgr4iGfrMwtNzZGIshDMxf8u0=;
        b=O9A94koKNh3l9Mm1buZ9jjCQFvrm1AkU+2/d7YIIdrcGoSbT+5ONvpzZO7cmpbEQGP
         gdKcTqHOBIpYFSfVfy6XHrTBPNM7o3FZI46G5eCMbfDP8pBrzAGhzqlHHSDuaRuwnZJD
         hTZGVKMzOGXlK4/cUsdJ08lSe+VnKJbBea3YnsZDWUaHIVUuYMC2RmeOHb2Pekz1KIIq
         134VyHrYCil5kznoS4Rf0E8iuPyY+M0Lw1gSxQx7CuMYcg1Zkg488HhIZiRyqTJUYENu
         k8ZYO5w35DGM0GYYChHOcUWUxoY03Fc6HqhnEyyndyKl64KmvaTaY0iacoREM0yDK8h9
         8X5g==
X-Forwarded-Encrypted: i=1; AL+hErHaNxzWwN+ax/Iz+NZ46uCiRUxvkbiLecYq2zXUPEh0P5FEzSfXGBQkguhH2dK6tUQuJszNNCLbZqA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8sTfqY9yj/MsKF9fHrQhAIK1ROCsD3AfgXLfCU1wrreHnRPiXg
	BbaDc7Ge8n/RyvdkokLgWlXNpttBhom21ZbP3KM8Kvg0QjQaBnkRJGPOBxcnJs2q9mM=
X-Gm-Gg: AYBFou0TwPrv6e4dthaQNsQ+agoc3FO25SRPzmNkjCq5OXb/KbtCmhgoYjmKocwTDFE
	PAMFxGurNF51+huwDGaT2qozJw4tFVDqWY8RpTcbUHdeHcXFwa7j70aHHLFIaUBwa3nWDhgZ3o8
	RP7T7CNeb73KKMacS4uds2++A1utc/POF0YqCmOV+I/kQtNPyTw0UP7TYN3Kz5hpeTPFSA8Pu2W
	LKUu7VwsmAGWg8Ks91jH5xtUyymDfFz/gZ33GXWT8G4t1t0qnMrAS2qfsBOK/cA2shGW+s7K6iQ
	RcobrP82suXkx7I5IyUM6PjhWIMMOjM/1EXnFV88Z8V7G0pJH8eZD1xNnT+pYO7CFa881lT8zsK
	6ulQMW8Hks0tA04untS/cBeU2mqETFOso9Faz5KGjMuMrRUAG/Yo5DIqJ1KSCAkIpHg54pCrRyz
	tg/h91uyx3uTwP6kmq2QVkWZC1CpyLRuXYn0sqJQNUw2MJ4MgGsh4PqMXYxLttg174ILwNNzVTn
	Me91HJy04zsgjwZiv+8tF6rAILL4gcE78hgJrjL/cliWXfv5GSibJ4G0JztMxnI6hmqsUOnxITc
	6qWvlFwcc5NWE7dlYtDKug/Ea7HNNM9eza15aNPS4peiiHIOt8xgXvZ8taej
X-Received: by 2002:a17:90b:3c0a:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3b1060a6be4mr758538a91.13.1794025917280;
        Fri, 06 Nov 2026 20:31:57 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:31:56 -0800 (PST)
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
Subject: [PATCH v3 0/5] mm: Simplify device DAX vmemmap optimization plumbing
Date: Sat,  7 Nov 2026 12:31:17 +0800
Message-ID: <20261107043122.25650-1-songmuchun@bytedance.com>
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

v3:
- Rebase onto mm-new at 684242af7090.
- Move section_vmemmap_optimization_disable() out of line to fix the
  LoongArch header-order build failure (reported by Sashiko and the
  kernel test robot).
- Keep section_vmemmap_optimizable() in mm/sparse.h and leave the
  vmemmap_optimizable_order() relocation in patch 4.
- Tighten the disable helper checks to require one aligned memory
  section.
- Collect Reviewed-by from Lance Yang.

v2: https://lore.kernel.org/20261105061217.13302-1-songmuchun@bytedance.com/
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

 arch/arm64/mm/mmu.c                        |  5 +--
 arch/loongarch/mm/init.c                   |  7 ++--
 arch/powerpc/include/asm/book3s/64/radix.h | 12 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 ++++-------
 arch/powerpc/mm/init_64.c                  |  2 +
 arch/powerpc/mm/mem.c                      |  5 +--
 arch/riscv/mm/init.c                       |  5 +--
 arch/s390/mm/init.c                        |  5 +--
 arch/x86/mm/init_64.c                      |  5 +--
 include/linux/memory_hotplug.h             |  8 ++--
 include/linux/mm.h                         | 40 +------------------
 include/linux/vmemmap-optimization.h       | 31 +++++++++------
 mm/memory_hotplug.c                        | 16 ++++----
 mm/memremap.c                              |  4 +-
 mm/sparse-vmemmap.c                        | 46 +++++++++++++++-------
 mm/sparse.c                                |  6 +--
 16 files changed, 89 insertions(+), 131 deletions(-)


base-commit: 684242af7090928ada5e48fd40a0f3a539b3fd5b
-- 
2.54.0

