Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CAC282F39
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831868; cv=none; b=nrjGah67dl2LbiSnihUD3sW26l1MR61aiJkOHTS6OWj5ZZmrYb16RGJQk6+4x3KXa2UAasLJKWnUbkuiHzrvJUOWCVMKI4OXQllrZqpSo8uHUsfnDZ3KCH6koI7Q99oKrJYgBj9czlBNnLLxMJqGKzCtOMlCnEPMEOCUT8kvAAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831868; c=relaxed/simple;
	bh=gaAQyPseazQlRE79YeFw65+HAz9m9NvImoW94Wfk5XI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCwK0UtHers2JIhsFpOTNT4pXBbNqcGVPpzi8mycRxjdvF3D0KMB0FP6knzDoXQ5hYAxDCmGH7AI4aSvY+PEujrQyRwdqixxLsRQEsHM4mNVdNq4LilrbixEoPKkIXbimeBaqX993QYkw41n4WQBZ7COxLyZXnI3TN4EpgZiahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tI28KK3K; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI28KK3K"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c9c1779fc8so11332065ad.3
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831866; x=1783436666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkhDPMkIn7o4S+p4EJjWg1/vRnrXI2zfxcLsfb3CwqA=;
        b=tI28KK3Kyp92UT+MCSCh7eB/fc9zc5hebpAY4x2HnUPhNzhjUnJOzKtdZIOpT53lts
         C9m8TCxXfRlZtdlRLcGb3DIiK/Ex828RkTuYN4NGAWIxA794QFhSn0/LDFAvl8jl90p8
         IKQDEVDy0soJi7ybeGcAikNwWLRn4hZ7FfW4MDEW395tavId9XjhFkdc/MUd2+Sw0n8w
         zbL47vekLVtlFH3Zn/kHgifvfcZlxNL6/bVXy55wgeEGbXjEpPalHADPMSHyrfMTN7oE
         i/dtryyb0NqccG9jpyczkniIGjP7K96YzuTMesJKH4WKUpRPirl9YDDKk0uG/C5GtzXY
         1BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831866; x=1783436666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkhDPMkIn7o4S+p4EJjWg1/vRnrXI2zfxcLsfb3CwqA=;
        b=HqJiIiCvXo/jdq8VVfqEpHKyI1OnoWKrIUGY/z0KRnmnckySvexjL59aI2GfBQiKUk
         WKzr+neFBgwtat3X49+nVYr7ka1htzSa4a8XIt3q1ziybMXabnwt0Wimn4WO8qVfuehi
         obDF47f/fgZ1l9thf+N04cdbTAdIkxJLxS5FZgqibbCxNwcTp6R3CuLDGWDhSzBjmXKj
         8Z+Gq0yT1vR3OyPq2ma7z+vxMBe84MIlvOOiZjuCLuvP4e8YfdZ1Ss1Y2QRBSTwKcnUq
         00xJ6sEsQCx7SCclPHB1TbhwmoO4DfTyKrEsqgPjNyX4E3Ma/k08L1fqpwmAW1sRn87u
         1m/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrnelVDZoEEz+5dnmbf0rZit6Ec1uINEK4wo9x3ea+BCwDVDTKccIDzrLZEELCKEaC75a31EIp/kTc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOiCFJYR5EiMuS8/ngNItILawqBH4Qets7WKkwiXxxO4I0GYp5
	1PxkT07fSDUcIy3lR08ngUq3yxv6OnbrheiA8KixW0xiiC4GElP5XK8C
X-Gm-Gg: AfdE7cmIv5uBUSTltTW6M2MuPtTlT1a1zRh0raBXkZH3/2sjAiKZHMA+v6Y6fTi01hD
	y0/ELWdJ8SybUFP/b5Q3px209VR6q3nQ1junjS4W1XNg0rAeqV92Y5jZ/kEs25iQMvfCA7a8+Cs
	sIy6Y/KMUQKavvbWRXGXKKzkz9PQALMjJ+T0PEG8zUknNIP0Ij9js8ZIRORP5ZlAzWiJw+nGFj8
	fO1rYoqJxqyP+Y0S1xmWBxEk0/8Q3wqItH69yCHO9hzBi4hSYPIIZRSOYgjWld8eE5lWgCrUYFh
	6VMeaQFI9tEwBmCtdauBd1muDEToJAkzgQtnQp874ng4YXcS+1cgLZA7HNXfgrrlCE16nUPL54n
	/MGx2yMoTZdvisswA5YFXhapvgRdLB/D5NcLFl97Jenrkp5QkQius9Akn3HhOkcT0fjIefV3KRl
	2IA+llEi0=
X-Received: by 2002:a17:902:e541:b0:2c9:97a7:71ac with SMTP id d9443c01a7336-2ca2ea23674mr32988355ad.39.1782831866110;
        Tue, 30 Jun 2026 08:04:26 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70bc0sm16250465ad.10.2026.06.30.08.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:25 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	Nicholas Piggin <npiggin@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH v3 0/8] treewide: remove unnecessary invalid range checks in memblock iteration loops
Date: Wed,  1 Jul 2026 00:04:05 +0900
Message-ID: <20260630150413.1718632-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memblock API guarantees that for_each_mem_range() and
for_each_mem_pfn_range() never return an invalid range, meaning start is
always less than end.

Several memblock callers still have unnecessary invalid range checks in
their loop bodies, so remove them.

Patches 1-6 cover for_each_mem_range() callers. memblock never stores a
zero-size region, so the range it returns always has start < end. Some
callers apply __va() or __phys_to_virt() before comparing, but these keep
start < end too, so the check is unreachable.

Patches 7-8 cover for_each_mem_pfn_range() callers. __next_mem_pfn_range()
skips any region that contains no whole page, so it only ever returns
start_pfn < end_pfn and the check is unnecessary.

For reference, commit 36ca7f4be809 ("arm64: mm: Remove bogus stop
condition from map_mem() loop") did a similar cleanup in arm64 map_mem().

All these checks are in different trees, so I split the change into one
patch per arch/subsystem. The patches are independent and can be applied
separately.

---
Changes from v1 [1]
- Add review-by, tested-by tags from v1
- Add missing simliar patches(5,6) to patch series
- Change base to rppt/for-next

Changes from v2 [2]
- Remove unused local variable and braces

[1] https://lore.kernel.org/all/20260621145919.1453-1-ekffu200098@gmail.com/
[2] https://lore.kernel.org/all/20260629163736.1606688-1-ekffu200098@gmail.com/
---

Sang-Heon Jeon (8):
  arm64: mm: remove unreachable invalid range check in
    kasan_init_shadow()
  LoongArch: remove unreachable invalid range check in kasan_init()
  riscv: remove unreachable invalid range check in
    create_linear_mapping_page_table()
  riscv: remove unreachable invalid range check in kasan_init()
  ARM: remove unreachable invalid range check in kasan_init()
  powerpc64/kasan: Remove unreachable invalid range check in
    kasan_init_phys_region()
  mm: remove unnecessary empty range check in
    early_calculate_totalpages()
  mm/hugetlb: remove unnecessary empty range check in
    hugetlb_bootmem_set_nodes()

 arch/arm/mm/kasan_init.c               | 6 ------
 arch/arm64/mm/kasan_init.c             | 3 ---
 arch/loongarch/mm/kasan_init.c         | 3 ---
 arch/powerpc/mm/kasan/init_book3e_64.c | 3 ---
 arch/powerpc/mm/kasan/init_book3s_64.c | 3 ---
 arch/riscv/mm/init.c                   | 2 --
 arch/riscv/mm/kasan_init.c             | 3 ---
 mm/hugetlb.c                           | 7 ++-----
 mm/mm_init.c                           | 3 +--
 9 files changed, 3 insertions(+), 30 deletions(-)

-- 
2.43.0

