Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369309;
	b=MAm5GEdehY4xrbw/IgNg3FKt2dHX4EVi4IvQceLKhFwgV/5/5xARhUZAGuPf3QhQ7IKC
	 Jg9ujO0jiCgQpwxeL7BvaxQIUaKlTtBCiZbHjeMPG6mn5J4z1d8Vl2bGmY7zMAHd7zWTj
	 b6e9Q1cx4f47OsW+3K0kzlZ5DGFWLKkgCTkMm6mqnmOqyGRNmXlD6gHV4j3L/SF2Xz6Bu
	 1r91nt2gMf9xk9IARjJ8AzrsjCz5FSbIAUHFX7syJyO2PaG8s9olk3tvDNkGx+OCuOaM/
	 CmF1Uay3ptusETuzCO2KrDGCSoXU3B7wFaXTNdoSmA6kLrmekxGdqulj+511WVUx+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
	b=vE9sB7rpVPwdDX8dxGpYedFNIS6blaXkpBpLPAxwUc9iIJ5TrgrST6qaqxPQjeJfJEiz
	 kZo5m2Ep1kqt0dSYvnpKDlvaGgD6RGJg9NgR7MzU4zKHccwbc7q39rm9R/EQRZ8FQgMe0
	 e5RjOL53/dWCCYDJB4dC4MM80zuwBUezgSLHrp3yec2/0H34KciAXZo/1N6yeZWN+ckRH
	 8LcHeHAluSzAf+k5LVTRpN0erneqlv32YCZNdNSuzewiGC4RaqDR/6o7i80DbHKiATrEK
	 ZsnkdpowjHgiSyuc55jXqhSzXsNxHOBsEzA5ZCFj7iuIuSv+6FRodrZ/+VMYFe4+82A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=imZqSM+8;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C8606A31E
	for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 14:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=imZqSM+8
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e60f9af6e6so7116525ad.3
        for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369307; x=1793974107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
        b=imZqSM+8yuqrwkdqWu3mdBRVWz2vBVT1LspKNPekFTV/8vPUqN2+VGCwNRyirrCnnb
         61sDFXZn1t4sdWPUMpOHlFEAjRO0w0H50Pgrtc7p5sHkDWzG+H1I0Wd0FS9g4aYyiwiU
         ipskYOo5l+rc0ZSfh3k8h379iNQ4Ps7u69HxXT6pMkavQzlvzvp7NhAqVVLMKB0sXL1/
         U6h/EjgA1+RRQhBKQ73/4tnU00caNBfazX6ceiVQMqignAQhhGV7fkWz1FJgi9q/Emgr
         8pSxiND5YGHKtU3eTqpQ7iREymROmzAHg7Ctp8joEB1nxzERxZ2RTfribEtWBQuwf/bI
         rLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369307; x=1793974107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
        b=d1RjJmk/TEBGADoh1Cp5MOXkgchwVXas2i40cgMIh5K680a1OjEbjsEXUbfx9Gt9i+
         QmMSPHsxGDsFdyLoAj082fSfOdWMFBv0fhMksycFHFAYGA1dSk3DhJFdcvr16HrA57yq
         suqllsork/gshDYO/SaeClMCHxM2Yt5nWmcSnN5wXD8IoMz5awD1z3xSS/LYUY/VKNN/
         EggsNwxNF68oaKbhwtv6gF6WXSySGJYQBUGFTlluxwhCm7f7G+NKikb0L+OED2oWoQ7w
         SVdIycZEVy+pFFIFN9rDuucfgkwygy3nPDgP4r6q9KLp7yIOgJP/RKkHfKi/QyM8pg5N
         bgPw==
X-Forwarded-Encrypted: i=1; AKwUvBxngYhUeHVUVTaJAC9jTQ/w9HqYuTrHUV1oXJydSF97JZhPsZmp7cu4lbC+9iASMjNx6GqJerfu0CA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLlE3WnrWrr02LWFskB5S/r1bo/T1I2vC0+CJ2IuFHv3K0pw3ke
	3hgr/HFmVmk9hmsrDpx2McTBD7NPkrz/ZAAndGkOTasTXtBrfaQ7e0Rs97hM53dtg/w=
X-Gm-Gg: AYBFou2tnVSLvnBE2IwokIIxByK+qbvOjchqg3KXSTZR0okmNvxjKgKLTfmWWs9j/3G
	wwjGOBTK9TZVA63iapeuXWmmgD72fRs0FBdpw3QRPTExBoGuXdJTpAm4BQKH0M2vyklHeN4m6D8
	fSwm7l3c6aIGLubz8vOVhI1P8RoWNk5VRGxY526utiQ3V1VwHfLirfZKx91y41MMHufihQesO+i
	PwyxosRdsLh0ap672pYKgw1bzqImMRtukMIptBPJcEezcwQA5EITFOpivXLPbPVNg9m1FGgp1Le
	vMm/Zq5ujaSytlt/V6K/SKsaAUIi45D6GdgbMiB5rwXDFTb5Qb+h6mf2/9FY5bU4VdeOfREwxD2
	YOMqzY3wZLNpuiusRNlJLqN9bLBlEtEYR81j5Q+JQoqYnwqgm8LTNd2lWslF0WzBg08/7KUC9xr
	0mYZC+8VJQbWJea9/iv56JQjpj+kevaGvpBe1T+acmh27XksWd3hzq++6HYRexjunuRMhWF25yz
	BG2UEXKAM5Dy3YSh0HI/nttlWi0mSzKqZgjviRXgQ8NDrdUViERhKmhhjrhyJEwrYPjM9UEhkHN
	mruSGy2fOo810RNFk+ImpScABv/jf09obmnHBkTGAqL/EjcvXrY=
X-Received: by 2002:a17:903:24b:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2eb364f6800mr27744295ad.50.1793369307550;
        Fri, 30 Oct 2026 07:08:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:26 -0700 (PDT)
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
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 0/4] mm: Simplify device DAX vmemmap optimization plumbing
Date: Fri, 30 Oct 2026 22:07:16 +0800
Message-ID: <20261030140720.1256062-1-songmuchun@bytedance.com>
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

Muchun Song (4):
  powerpc/mm: make vmemmap_populate_compound_pages() static
  powerpc/mm: drop powerpc vmemmap_can_optimize()
  mm/sparse-vmemmap: drop vmemmap_can_optimize()
  mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs

 arch/arm64/mm/mmu.c                        |  5 ++-
 arch/loongarch/mm/init.c                   |  5 ++-
 arch/powerpc/include/asm/book3s/64/radix.h | 12 -------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 ++++---------
 arch/powerpc/mm/init_64.c                  |  1 +
 arch/powerpc/mm/mem.c                      |  5 ++-
 arch/riscv/mm/init.c                       |  5 ++-
 arch/s390/mm/init.c                        |  5 ++-
 arch/x86/mm/init_64.c                      |  5 ++-
 include/linux/memory_hotplug.h             |  8 ++---
 include/linux/mm.h                         | 40 +---------------------
 mm/memory_hotplug.c                        | 16 ++++-----
 mm/memremap.c                              |  4 +--
 mm/sparse-vmemmap.c                        | 34 ++++++++++--------
 mm/sparse.c                                |  6 ++--
 15 files changed, 54 insertions(+), 120 deletions(-)


base-commit: 5e6c45aaaf93343c7f8a1cde9797080238af5c1b
-- 
2.54.0

