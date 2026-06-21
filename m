Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA77C40D565
	for <loongarch@lists.linux.dev>; Sun, 21 Jun 2026 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782053970; cv=none; b=pG0n9ik9lS2UBGtWTBUAZOjXFoXQdQs/u+0zRj0zRYCuNtAPDPZpG6UqrzGY0yotkX5k1ZQ/9NPeWN1g+Lx3TMAMlVYfZ+10ucLMaVkGN8j3rxp0BFqeREHkxhzVDyAwZLJjgAX6XzZcmWhWj11Aqx/oNRXgdj1rhLk/3mL/E04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782053970; c=relaxed/simple;
	bh=RuNKA40OL/+LTTo4zbbxm45iDGgzdlqgcQEJsnWg4XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=enwncoMxwNO23Yus9F0WyV7q2uL2Rwjj2G9Wy4LsQz63VqJg/1odPL4h2joytuk13xwOKZO2eo+nTpM+EX3jE9rYr1A50V50FWpwnFFazm3gC+0jDG8/fznDREtjFIVTVQTnDejCQvVezFOZZZR16vPU1Mka4/501uSgo/CtAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWCmxjwn; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWCmxjwn"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so587334a91.2
        for <loongarch@lists.linux.dev>; Sun, 21 Jun 2026 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053969; x=1782658769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9Iy1NRZrQdiv+3iSOUUb7XMLeE6HcnU1eSibV26qpo=;
        b=jWCmxjwnZqfG4CDa03ULG+hm08PnlwJdNxRRhq4N2/IK7b4o1PZGyjeNCRicZ78JHz
         jhBdch2NlwtMAnv5ABG9HAr/sk7/3w2PENRuj9NqHWKz8uEQcPvGK7MOX+y2jLv6kfqg
         i4YpsprJ95wOkI5G4OaEKYnb4AdUP31YIgFGSxSiebRP0wNFhF6IYKIdSSQ8GrUYyjW6
         SRX0Fd9VsrH7HnztO6RUI1jx5LokYP1Vn8b3Q/yXKJ01beESwoMMkiYfI8yFEaTHDNAk
         9hEfIJnpfgCz8OpPHG9TpJhuJUNrauJk6/Z9yBY47KqJpGsnJOHe8ogdVyQs2cQ5jBvz
         oW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053969; x=1782658769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9Iy1NRZrQdiv+3iSOUUb7XMLeE6HcnU1eSibV26qpo=;
        b=MMAJW2l7+rt/OdKaRj2vcN3ms2abwSSZfNfN0tLSA5ZxB0a9HKH213vs7l5hLfcR9U
         mGxDoVdezcQHmrjGvF2kMx6VqVPMnW1+Po1Zjtu0PA84zeFRbyp+EN2/Bu5/l36rwUmA
         9+uMzd2KNf/dM6uOSKrJV6qq2PKNTtAryCrfsZ1o9rtiGwxgttna3POHjsViTlIRXG6M
         HPd39rT0oCVY006b7J1IhGDe3wIc4VLUl12sT9QMq+tkfHYQckLXKUyJamGA5G8BhabW
         LzbshG4ahOnDuB4yrD1JsizrcWA/4dcwxFDO//j66ZnaCdGZk1sxJGc48nzJH7ytrfCp
         IGjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9IWzpfhYyTYNjlPmRhxbPNdds6QXFEIxmUkSsqWWTfqMK99JAMh6vieqFWJ6m6mmcRHf6TjEwrz0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM3QLfduUI7zfvsMHB7kKSad9De5IHCOncxXBJrX3ip0vn6RrJ
	xyPXg+3r+SmAJjW+rsw71h1oyAtCsj11mCr9yDyNx4Q/nzbthcrIonzs
X-Gm-Gg: AfdE7cnFlJbQooK/uREqDQCXo7SRMxetN2lGZSECsqZKPOm5c+qTJgdvMH7T/NYjWcd
	dLjFqs6w0TfXbhmbTwIM4p4l5VDJl5hyVn0CLEYp99R6qg4R+VnmmGfvOsLlKzTIdjaiiIDll87
	VqGL5HWm9jAL+fs4ThzfodIbq19VeMoGdKwADHfPuOj6ddZ6AHc8XnS2iCKcOD6gMqqqUK+rYW+
	sj9Id33MHOLgyC75vMuixI0sl/F/YtK0Ad510O5Ky28ddlc5Qcq1SoHMEG+MKUxbCEPtxYg0+8j
	d8w5FIwHHXCYeOk3zES60awBMFQ1F5DeIKnEbj/qq/neQ56509OBJ5hPj5Ky56MIGLxVcXles3j
	POfYvvGvG4C+fZ0E+n5FYPsde0cB/jm5imR0tLhHfhjQuG5neqbl6HtRionnKy0cFnBmeOllBpY
	QbhVAfhVYPCWINN6DybQ==
X-Received: by 2002:a17:90b:1807:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-37d1ea12264mr9696809a91.24.1782053968739;
        Sun, 21 Jun 2026 07:59:28 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f225870sm4544896a91.8.2026.06.21.07.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:59:28 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 0/6] treewide: remove unnecessary invalid range checks in memblock iteration loops
Date: Sun, 21 Jun 2026 23:59:10 +0900
Message-ID: <20260621145919.1453-1-ekffu200098@gmail.com>
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

Patches 1-4 cover for_each_mem_range() callers. memblock never stores a
zero-size region, so the range it returns always has start < end. Some
callers apply __va() or __phys_to_virt() before comparing, but these keep
start < end too, so the check is unreachable.

Patches 5-6 cover for_each_mem_pfn_range() callers. __next_mem_pfn_range()
skips any region that contains no whole page, so it only ever returns
start_pfn < end_pfn and the check is unnecessary.

For reference, commit 36ca7f4be809 ("arm64: mm: Remove bogus stop
condition from map_mem() loop") did a similar cleanup in arm64 map_mem().

All these checks are in different trees, so I split the change into one
patch per arch/subsystem. The patches are independent and can be applied
separately.

Sang-Heon Jeon (6):
  arm64: mm: remove unreachable invalid range check in
    kasan_init_shadow()
  LoongArch: remove unreachable invalid range check in kasan_init()
  riscv: remove unreachable invalid range check in
    create_linear_mapping_page_table()
  riscv: remove unreachable invalid range check in kasan_init()
  mm: remove unnecessary empty range check in
    early_calculate_totalpages()
  mm/hugetlb: remove unnecessary empty range check in
    hugetlb_bootmem_set_nodes()

 arch/arm64/mm/kasan_init.c     | 3 ---
 arch/loongarch/mm/kasan_init.c | 3 ---
 arch/riscv/mm/init.c           | 2 --
 arch/riscv/mm/kasan_init.c     | 3 ---
 mm/hugetlb.c                   | 3 +--
 mm/mm_init.c                   | 3 +--
 6 files changed, 2 insertions(+), 15 deletions(-)

-- 
2.43.0

