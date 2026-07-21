Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA28B3E49CF;
	Tue, 21 Jul 2026 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651146; cv=none; b=WPiFa8ZxnhFU9TOu+6sq3vP++0Ithr5Uc7iOTeBaGV8JqUxuWfQuOFcxLatn8qUAmAJ+R2io399tSP8oNVASaAlW66mWJmRaf8qmXz/ESEz0S/T30wtc+V9WamQno5ZuV6dlHRQHE0aRNKnE5sm5g/lS16Nrt2ZuvpviKvINYsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651146; c=relaxed/simple;
	bh=7UL29J8+n8bCag3fO9GB5Ca1tQqaIUbzUmuXJ4cX9pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAfUgSCIs791lJdeC1Tj2FytKV2D0Huy1rmtJZzFDSCob9VAImH6UCV909xW2yioeXSjv97Ra2TCOgQw7SS/LW2w+dx+5DFn+9/gJpYVrfNp4pTAnRtK7hknfFL+Qw6qZ+r8hjNjU1joh0Jd8YSIh+Qi91vcRPtF2UiWsnuunM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJK8pSoA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJK8pSoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36A81F000E9;
	Tue, 21 Jul 2026 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651145;
	bh=ZxhCd9eCEjBgJJhCeRA2CyrrLQ39c+yshW1zqJ57eLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AJK8pSoA+U81hrrPiZf3Q9Tb3HIzm92yIR8W1DG0ikMnk6uAV7OdgkMR7YjEGxSm9
	 RD4suD1pNjUF0c2rrXBqrQy4bp/rbU1Is/oX1bl87Wn38B+UlIvf/m2n+iOiyDgXq/
	 0kadO6UYVhOIu9t86F7A/hVRK+DaRDnRffiVsD8OnjdxiLD3hsjoSYanLb+qMvNdy9
	 A3QQwhvFXtLf6j57ifhFoy+i9N5yaEhAIQVePJ+RqGIx2Mo7zzGHl7Bwq7COcQbxeF
	 BHH6f6ASOrbJFvNpI8pJPhjR6qHVXi16w3VR4Ai0C0xh1jbY++Ugxpc3LtI141KJ9b
	 GIpvlDGA1Melw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:41 +0300
Subject: [PATCH RFC 18/18] loongarch: make set_direct_map_*_noflush
 actually noflush
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-18-2c1fc62306b3@kernel.org>
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

loongarch versions of set_direct_memory_{default,invalid,valid}_noflush
call core CPA API (change_page_attr_set_clr()) that actually flush TLB
after the page table update.

This was also the case before the conversion of loongarch to use generic
CPA core, loongarch::__set_memory() always flushed TLBs, even when it
was called from _noflush API variants.

Switch the _noflush APIs to use __change_page_attr_set_clr() that does
not flush TLB unless there was an error or there was a split of higher
level page tables.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/loongarch/mm/pageattr.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index 4500769ccf6a..dbbd408bd3d5 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -134,40 +134,53 @@ bool kernel_page_present(struct page *page)
 int set_direct_map_default_noflush(struct page *page)
 {
 	unsigned long addr = (unsigned long)page_address(page);
+	struct cpa_data cpa = { .vaddr = &addr,
+				.pgd = NULL,
+				.numpages = 1,
+				.mask_set = PAGE_KERNEL,
+				.mask_clr = __pgprot(0),
+				.flags = CPA_NO_CHECK_ALIAS };
 
 	if (addr < vm_map_base)
 		return 0;
 
-	return change_page_attr_set_clr(&addr, 1, PAGE_KERNEL,
-					__pgprot(0), 0, 0, NULL);
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 int set_direct_map_invalid_noflush(struct page *page)
 {
 	unsigned long addr = (unsigned long)page_address(page);
+	struct cpa_data cpa = { .vaddr = &addr,
+				.pgd = NULL,
+				.numpages = 1,
+				.mask_set = __pgprot(0),
+				.mask_clr = __pgprot(_PAGE_PRESENT | _PAGE_VALID),
+				.flags = CPA_NO_CHECK_ALIAS };
 
 	if (addr < vm_map_base)
 		return 0;
 
-	return change_page_attr_clear(&addr, 1,
-				      __pgprot(_PAGE_PRESENT | _PAGE_VALID), 0);
+	return __change_page_attr_set_clr(&cpa, 1);
 }
 
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 {
 	unsigned long addr = (unsigned long)page_address(page);
-	pgprot_t set, clear;
+	struct cpa_data cpa = { .vaddr = &addr,
+				.pgd = NULL,
+				.numpages = nr,
+				.flags = CPA_NO_CHECK_ALIAS };
 
 	if (addr < vm_map_base)
 		return 0;
 
 	if (valid) {
-		set = PAGE_KERNEL;
-		clear = __pgprot(0);
+		cpa.mask_set = PAGE_KERNEL;
+		cpa.mask_clr = __pgprot(0);
 	} else {
-		set = __pgprot(0);
-		clear = __pgprot(_PAGE_PRESENT | _PAGE_VALID);
+		cpa.mask_set = __pgprot(0);
+		cpa.mask_clr = __pgprot(_PAGE_PRESENT | _PAGE_VALID);
 	}
 
-	return change_page_attr_set_clr(&addr, nr, set, clear, 0, 0, NULL);
+	return __change_page_attr_set_clr(&cpa, 1);
 }

-- 
2.53.0

