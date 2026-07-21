Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8ED46F4AE;
	Tue, 21 Jul 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651091; cv=none; b=d/8LJ2P1oFHztI/wILFuGfnkvXpusTAK3SKD6JHxTqi3EwZZLPMvMJcLd7Q27fLKxNyG34b6Imehq65FDYgZ5a2zBoCdiQ1bTJRLZCjg+Wyg21Us2WvOBfyVYfiRCFHE0HjrN7K5J36rEqCUytlHEBBw+l76eZ2+CF5pUJwwk8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651091; c=relaxed/simple;
	bh=9cgy8ZhoZfDaQy1leymhy7U0jrlZBcD3OPgc26i76AU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlZMpdOUSSNF6ll0MuOeBAentOFr6EVadFI77T74n4PzUxbDnJuz1xopoXvcPftpQxe0cTgGz/3ZVj/aKp0N9y06/KSS5+2Oaf9fvzd1Y5YPSHAJ2HIZs+fqe+fTRrHuk9tDK54jGGr5s+m9ywpLZ6kqMvF997yrjoCRZjYi4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJmSLh0p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJmSLh0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC241F00A3D;
	Tue, 21 Jul 2026 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651090;
	bh=ttX//dzrhR9sMSF/SSGtobxX0kA46zEbXIpY5XaZ9N4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gJmSLh0p2zdn+TUWP5ffCXLjps1IY4pdY2MSOyC8/W+aqm3nsNU1U4iTihlhrvBfa
	 Q+mS6sw0lO9mOetPMFTsC9dtXtC+igugk3tV3KUzXcEwQ3X4QI6fHv+juQ4w7aGN0T
	 6Px8rlP17Ve+8eSsv4CW4eS0U4mcadHN/jXWfIC0dyhff3ZJLuUNrRa6uIJZHrAFd0
	 nO6yCipEiqmY+g1A97wEKDQ84Iad1bsmvztr7/jT6rGQyglKtI15OsZ1wyr0KZv5tg
	 s6ZFygHv5zMyo254wbSw+EqReu5y/kry5UxoS4XSbiqQL4PE3YknAVR4TX4v4odaNL
	 L75H13AxOl1Jg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:33 +0300
Subject: [PATCH RFC 10/18] x86/mm/pat: move the large page size calculation
 to should_split_large_page
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-10-2c1fc62306b3@kernel.org>
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

The calculation of large page size and mask and the update to
cpa->numpages use generic helpers and can be reused by common code.

The upcoming changes that will make should_split_large_page() available
in common code and __should_split_large_page() will become the basis of x86
specific implementation.

In preparation to moving core parts of change_page_attr() to common
code, move the generic calculations from __should_split_large_page() to
should_split_large_page().

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index ef206ba6e254..56676d4cf510 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -58,6 +58,8 @@ struct cpa_data {
  */
 struct cpa_split_data {
 	unsigned long	address;
+	unsigned long	psize;
+	unsigned long	pmask;
 	pte_t		*kpte;
 	struct ptdesc	*ptdesc;
 	enum pgtable_level level;
@@ -884,10 +886,12 @@ static pgprot_t pgprot_clear_protnone_bits(pgprot_t prot)
 static int __should_split_large_page(struct cpa_data *cpa,
 				     struct cpa_split_data *sd)
 {
-	unsigned long numpages, pmask, psize, lpaddr, pfn, old_pfn;
 	pgprot_t old_prot, new_prot, req_prot, chk_prot;
+	unsigned long numpages, lpaddr, pfn, old_pfn;
 	enum pgtable_level level = sd->level;
 	unsigned long address = sd->address;
+	unsigned long psize = sd->psize;
+	unsigned long pmask = sd->pmask;
 	pte_t *kpte = sd->kpte;
 	bool nx = sd->nx;
 	bool rw = sd->rw;
@@ -908,18 +912,6 @@ static int __should_split_large_page(struct cpa_data *cpa,
 		return -EINVAL;
 	}
 
-	psize = pgtable_level_size(level);
-	pmask = pgtable_level_mask(level);
-
-	/*
-	 * Calculate the number of pages, which fit into this large
-	 * page starting at address:
-	 */
-	lpaddr = (address + psize) & pmask;
-	numpages = (lpaddr - address) >> PAGE_SHIFT;
-	if (numpages < cpa->numpages)
-		cpa->numpages = numpages;
-
 	/*
 	 * We are safe now. Check whether the new pgprot is the same:
 	 * Convert protection attributes to 4k-format, as cpa->mask* are set
@@ -1026,9 +1018,25 @@ static int __should_split_large_page(struct cpa_data *cpa,
 static int should_split_large_page(struct cpa_data *cpa,
 				   struct cpa_split_data *sd)
 {
+	enum pgtable_level level = sd->level;
+	unsigned long address = sd->address;
+	unsigned long numpages, lpaddr;
+
 	if (cpa->force_split)
 		return 1;
 
+	sd->psize = pgtable_level_size(level);
+	sd->pmask = pgtable_level_mask(level);
+
+	/*
+	 * Calculate the number of pages, which fit into this large
+	 * page starting at address:
+	 */
+	lpaddr = (address + sd->psize) & sd->pmask;
+	numpages = (lpaddr - address) >> PAGE_SHIFT;
+	if (numpages < cpa->numpages)
+		cpa->numpages = numpages;
+
 	return __should_split_large_page(cpa, sd);
 }
 

-- 
2.53.0

