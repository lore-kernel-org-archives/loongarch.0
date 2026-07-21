Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87EF4C8FE6;
	Tue, 21 Jul 2026 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651132; cv=none; b=ofhsEx1f4XbG0OjJcZMy46k19ubuBAyMUX9eXsakTsxYmMZiY1rPHNJC6uRv1eVe/lwn3Hc0E56+xtAOO5VIE0UC5fwwqPtQ7Zdr2e6SXCrjAR0vLkfq0Rpgca7xXHJIXKpp+yxGrbX6kw3LiAA73lRBBFpl8amfSQ9Uqh9KF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651132; c=relaxed/simple;
	bh=mj3KiURvtssYB52KJ30ghY6OMSJHfL4MhUzqGmcd8fA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFX6kh7T0hhWyGN485irUknOtrLnMBMP8QmFWF07hIVgUwrZLPUzmx4WMglo+mzawrWNzfVkDbdm3zgUxE/iXcQzRQPGhs85wBicANmeBNgLh+l+HIj1lfu340I3UH/TL0ulNqQnF5L9wG8FbIzZ9rWAqtQdBA21qwJa2+wSVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jx7peZSS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jx7peZSS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5F81F000E9;
	Tue, 21 Jul 2026 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651131;
	bh=J9b3WZj5jHk25VpgAWHevsEUQUuyXouMqSw6FbCmRVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jx7peZSSKvswuwTjFsyRK77utMba9/sCwesbc/K9+fo06K9IvmzAvdGGlzz4Bu3fc
	 kRKEjA55dkExDBgUR3eWzuAP3KFhmC65OnYn0JX6Rb63B85Mk2fdWPFYHZRUgZpMZL
	 zlLlj7XeXkjC9+s1pM1Hed8XCHEw7tNfTI+8Lj8iqVnt2FdBx9up4mA01kHjw6PzSt
	 KPGhKTDmAHLsnzBYf3G3vI2ctycqdIWtI0Cq6KpqDs0IOEVdaCU0ES2h6ZWx4uoHTU
	 g5XHwTUTgLxS/p9LTyr6WLkzgsMqv5j6Mn3bnGDGFFNsOfxexutYnMPmPPdK+Fjq0d
	 PacCIqlk4dtdA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:39 +0300
Subject: [PATCH RFC 16/18] riscv: make set_direct_map_*_noflush actually
 noflush
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-16-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev

riscv versions of set_direct_memory_{default,invalid,valid}_noflush call
core CPA API (change_page_attr_set_clr()) that actually flush TLB after
the page table update.

This was also the case before the conversion of riscv to use generic CPA
core, riscv::__set_memory() always flushed TLBs, even when it was called
from _noflush API variants.

Switch the _noflush APIs to use __change_page_attr_set_clr() that does
not flush TLB unless there was an error or there was a split of higher
level page tables.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/pageattr.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 677f42a6750d..66a20fc3d805 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -199,32 +199,46 @@ int set_memory_nx(unsigned long addr, int numpages)
 int set_direct_map_invalid_noflush(struct page *page)
 {
 	unsigned long start = (unsigned long)page_address(page);
-
-	return change_page_attr_clear(&start, 1, __pgprot(_PAGE_PRESENT), 0);
+	struct cpa_data cpa = { .vaddr = &start,
+				.pgd = NULL,
+				.numpages = 1,
+				.mask_set = __pgprot(0),
+				.mask_clr = __pgprot(_PAGE_PRESENT),
+				.flags = CPA_NO_CHECK_ALIAS };
+
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
 	unsigned long start = (unsigned long)page_address(page);
-
-	return change_page_attr_set_clr(&start, 1, PAGE_KERNEL,
-					__pgprot(_PAGE_EXEC), 0, 0, NULL);
+	struct cpa_data cpa = { .vaddr = &start,
+				.pgd = NULL,
+				.numpages = 1,
+				.mask_set = PAGE_KERNEL,
+				.mask_clr = __pgprot(_PAGE_EXEC),
+				.flags = CPA_NO_CHECK_ALIAS };
+
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 {
 	unsigned long start = (unsigned long)page_address(page);
-	pgprot_t set, clear;
+	struct cpa_data cpa = { .vaddr = &start,
+				.pgd = NULL,
+				.numpages = nr,
+				.flags = CPA_NO_CHECK_ALIAS };
 
 	if (valid) {
-		set = PAGE_KERNEL;
-		clear = __pgprot(_PAGE_EXEC);
+		cpa.mask_set = PAGE_KERNEL;
+		cpa.mask_clr = __pgprot(_PAGE_EXEC);
 	} else {
-		set = __pgprot(0);
-		clear = __pgprot(_PAGE_PRESENT);
+		cpa.mask_set = __pgprot(0);
+		cpa.mask_clr = __pgprot(_PAGE_PRESENT);
 	}
 
-	return change_page_attr_set_clr(&start, nr, set, clear, 0, 0, NULL);
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC

-- 
2.53.0

