Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A893E49EE;
	Tue, 21 Jul 2026 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651071; cv=none; b=UTabFuEjultos+2n6uP3KnGYS0JZiF8mEAKySSY5s27X5WK56REPUpIO3tO/d4DIhT1bcdu70kpvbj9gNrZbhnSI+mBeyV+lu0z6E2JJiV7LR0lqppFp1uMFrvpPMz9wQ0ukkGQhpYpvbBB9zVvEfrAqqJGmmB8g7FGL6RSPAzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651071; c=relaxed/simple;
	bh=KGFir+qDOZoKQXUhWE1jblcsLbP/mf0lkIC7/pMjfT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFLJ0jmgdnjE90Z7C3S7k+0C9PTD9ASAdGtIlYbyaeg/mQ5NONKU4kt+ejlEEqYCZBskNU9IyNUYe3AXh7SrwdGUy2F7LBu3WmZb+OV0DA+Y1Ho1WfDFGH8oKSrGxqk1tRWiBiNBSr+e7ZrC5B9DN8ohYr5yA+ahQvCasXmYLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhVsU+dw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhVsU+dw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF361F00A3A;
	Tue, 21 Jul 2026 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651069;
	bh=N3plug0lpgCKrfv29ZibOjCkE+S+2rGS3Cp9/6Aa2Hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JhVsU+dw1uwxmH+EE0axkr86r9H4Da8cc7CfnWCI4wWPzlF5gUGtel5DmYZ9NErCS
	 XCKTR6iq7tkNHolyed9vXfwK3qbIarzEac15Db3nrnBnAG4uRipAWCZkqSJzfxRXF9
	 RcLT4nTwwlotjyOqY+NRUMsWXiwXX8py7JLCE9CYhay2srofX1xLhpmO7N8VDLJDIB
	 Vg2DnuMbWSwC+kAoJpfiIiq1LniqN/W9Wdr5VH0LjFr3rE24wGTjUnarOu7LxSybaX
	 m2pvdkDDd1Qr1gwirFPPNEW6TO3uzcNKIXQjoIqkG2nqlKt19gnHV3wZcVJCxLkt0M
	 GaSPW60FCIAEg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:30 +0300
Subject: [PATCH RFC 07/18] x86/mm/pat: introduce cpa_handle_large_page()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-7-2c1fc62306b3@kernel.org>
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

Currently should_split_large_page() and split_large_page() duplicate
some of the operations, like PTE lookup inside the lock including
detection of NX and RW bits and large page size calculation.

This duplication can be avoided if the split parameters are passed
between these two functions in a structure and the page table allocation
and locking order is slightly reorganized.

As the first step in this refactoring, introduce cpa_handle_large_page()
helper that wraps should_split_large_page() and split_large_page().

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 54 ++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 2a087dcedf84..a9d270e986ff 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1191,6 +1191,35 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
 	return 0;
 }
 
+static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
+				  unsigned long address)
+{
+	int do_split, err;
+
+	/*
+	 * Check, whether we can keep the large page intact
+	 * and just change the pte:
+	 */
+	do_split = should_split_large_page(kpte, address, cpa);
+	/*
+	 * When the range fits into the existing large page, no split is
+	 * required.
+	 * should_split_large_page() updated the large page attributes and
+	 * cpa->numpages and cpa->pfn.
+	 */
+	if (do_split <= 0)
+		return do_split;
+
+	/*
+	 * We have to split the large page:
+	 */
+	err = split_large_page(cpa, kpte, address);
+	if (err)
+		return err;
+
+	return do_split;
+}
+
 static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
 			     struct list_head *pgtables)
 {
@@ -1790,7 +1819,7 @@ static int __cpa_process_fault(struct cpa_data *cpa, unsigned long vaddr,
 static int __change_page_attr(struct cpa_data *cpa, int primary)
 {
 	unsigned long address;
-	int do_split, err;
+	int split_res;
 	unsigned int level;
 	pte_t *kpte, old_pte;
 	bool nx, rw;
@@ -1842,27 +1871,12 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
 		return 0;
 	}
 
-	/*
-	 * Check, whether we can keep the large page intact
-	 * and just change the pte:
-	 */
-	do_split = should_split_large_page(kpte, address, cpa);
-	/*
-	 * When the range fits into the existing large page,
-	 * return. cp->numpages and cpa->tlbflush have been updated in
-	 * try_large_page:
-	 */
-	if (do_split <= 0)
-		return do_split;
-
-	/*
-	 * We have to split the large page:
-	 */
-	err = split_large_page(cpa, kpte, address);
-	if (!err)
+	/* Update large page or split it */
+	split_res = cpa_handle_large_page(cpa, kpte, address);
+	if (split_res > 0)
 		goto repeat;
 
-	return err;
+	return split_res;
 }
 
 static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary);

-- 
2.53.0

