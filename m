Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05E44DB7B
	for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 16:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751073; cv=none; b=OIetOsIoFXeGnM6+SDMSzYH+D3zRHe/lRzKZS3fzWtS6Ud7vAl6Qyss2lchHkXDquRm+NqhuQztKuUe2jgYC1g09VldgDNMoYQ3tFs8j6lQfk5Vvg98AqvxEZGAhX3Y8lT+aB46SQBPCzqUOAvxiMciMw1eiYbFXQadicXQQm/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751073; c=relaxed/simple;
	bh=lkcIz3qvkxY+ER46lV44lW4dSHsjOn7etxjpOY7fKEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOBKl0bVTAR9PDhqpypYfsRPS2F3cXkN7YN3YrD+DLII26meYJqEhYEf0oSndwCUVeRcQRAXgpi/Y7Pj02TXFOgo8evwVn0eOrBpdAer8rJzn40aH+SDKS83nP2J+Oho1HxZh3CjyjivgtR3SuKBy/ga78k+e8usJisdKzyl8Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWR5nLNH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWR5nLNH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84794e800f4so393221b3a.0
        for <loongarch@lists.linux.dev>; Mon, 29 Jun 2026 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751071; x=1783355871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGoS9kJnOsBC1GLvPLCMMJFTI12ls42atzGQpoe5Bdw=;
        b=QWR5nLNHSPuaALb0ZUBGLzprRpdWfwNLdA6Kw4fTw4foAN246OXf6LjNDb8O6lT2Jl
         lC9k4JBOFAye/Dfnl8gkPnbUEPBH+bUScrvqCUWFTw9tae21D7cxb21CBvfSOnix/gUn
         SVDW15Nwr6g1HXLMtY26x10TIZ37YO16DNC37uxv/Tz81GjD9vnCEFPUklhBOQbrQ9Nb
         YomKtOUueq2CzUmLT67PEVAxMxYcm3N0zGp88tj/TqYdyo8TAACbbxZy0Wxysq13Xp06
         uZi70kjX4kFc12kMUMQATvIGyupr8TRd+fHesOjRvmnJo6O2OBmWbfFux+I3KsXft1aa
         LOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751071; x=1783355871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGoS9kJnOsBC1GLvPLCMMJFTI12ls42atzGQpoe5Bdw=;
        b=tSfwhvwouTQVDtj31yrB2hS43Y+PaBdLn5gLyd4XbuIPLoh40x7BsjTefE0lz4njKy
         /fkuMon8w9PTVqnqcK0qKisC9rxebbXnfdY3yYjGoDtcU95lo3kOlp6ZgpNnoV+35pqY
         oBW7gdeSGoTfVsuPXq72yjiXe17ziBAjyxogTCNluILk72/qtKHUCqSYAKPZHu245Cy6
         ktN5+9P6V9VXPZJelugycJeZCQSrHOx0kGObFwnkYeACPXp8Wuh5XUHsJMoKGQ+urDzx
         hL9cZJ8TwBJ2v2ZtKQsYkJl0D448JCQ/y/Y6hYgjknBeLmf039ABg+xYKdi+D+LZ3h7C
         s4Jg==
X-Forwarded-Encrypted: i=1; AFNElJ9NKfDYlqVAdlLb4/AYAvC/DMrdMc93JBHXEP9dogSKssYbY8zE+8ZPXiHz0UuS3+65An5XzoFSE9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUIW9rKFXzfegWUjGI/LKzFVd7l9gVUmdW8v6SovC0inV/ebxE
	dLWIhC6Ty1XFF9y+pDbjiZlkFLQZd5J0Cdt4Qxv8C5baujKFhDcGu8Ei
X-Gm-Gg: AfdE7cmoZ1vXl8UowBglQaLxp5XmSYg5lanifxdSS1CA1Ev2a1vKWRu0h1wGSOROOS2
	EI2t0tLzj0EEkzJ3H2HL0SB+V1CyVIaFzJjBhfr+NEoioMJOLS26jJSAgaGAMn5W2ON/mZ2BOTY
	/PtayghjV1Dtdk1t4c4XaBI62+gh+UC3K6YvF2NI/tsgFQE+LV28sFvdydIZs5rRUDWyiOPT8I2
	yQpwqEtcQPbzPyQfjiPzJYCgNZ5rrVYhfgUVjo4uXpLoJQbgaeY5B95I4iBKl+0EWVFAku2JI/N
	YyF6tt5pnMqVTj3DeSsvaCWvBxAXSYPcfk8ZtbDqo01GKHYnqX7tn9L8pNdUEIt1JZ0nlTyZglN
	h1GODNRXMDYm17vvb9ABpBJCiDUuupbZJTejWTHIKBG0hBNflvExSDvA0UWL+3vWC1axpOBhgvG
	mtgeEKltA=
X-Received: by 2002:a05:6a00:92a5:b0:847:8337:64e4 with SMTP id d2e1a72fcca58-8479f1f553amr205069b3a.30.1782751071179;
        Mon, 29 Jun 2026 09:37:51 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm18474b3a.33.2026.06.29.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:37:50 -0700 (PDT)
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
Subject: [PATCH v2 0/8] treewide: remove unnecessary invalid range checks in memblock iteration loops
Date: Tue, 30 Jun 2026 01:37:28 +0900
Message-ID: <20260629163736.1606688-1-ekffu200098@gmail.com>
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

[1] https://lore.kernel.org/all/20260621145919.1453-1-ekffu200098@gmail.com/
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
 mm/hugetlb.c                           | 3 +--
 mm/mm_init.c                           | 3 +--
 9 files changed, 2 insertions(+), 27 deletions(-)

-- 
2.43.0

