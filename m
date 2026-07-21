Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330C646D0A2;
	Tue, 21 Jul 2026 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651112; cv=none; b=PvJ6LD3p7aLs4r+rA+WroFMm0FZTOhQuOPY0uJIOSbOlAAY1FA3hI1PeW6Zvazd37mvF0vFG0/L8SdP/rcfOzmaUDWvDesINBafszVuXMrRL7R/2uKMOR3Bg7Q4rKIiUhQFPDyYP7G2mXJkuDreKEQvCSdBDxooE68UV8aRtJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651112; c=relaxed/simple;
	bh=NSSmyfn015iNGPSNM1UWg3M93cpS4BA0bLVTXBJd7U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IskvBSlPK/1cjW9ZW1kDKZMWWT88ZYckAN7yXUQkKH9nfbf0VMbdVCF02OHCxw0/1IG2ALachJgrquJen99D3eTzg5sSDZYnaZX+mxyLE/YslEO/z8isN8ePiKDwFK5niYdaKiEKCXyG69Sb/jMNlEm6lmLKb9JRtKsSf0v6tcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knGmISKm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knGmISKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87D31F00A3A;
	Tue, 21 Jul 2026 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651111;
	bh=Js+8Q33VygYQF2f+rI8d1hZYY9K88zAKgM98T6HPJCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=knGmISKmG/BpTGf3mdF+taH3r3WgwshVgHqiOn1OH7w8ZYPlLuFE1bw2SEYXNLgFT
	 ZyhqpGWWKo19TQ3MPPpXN+GZPwI0a6+0Nci6x9wHqb6uUW6JiWzba+ApDnZJf8ebDl
	 Jl6wIGrMr3jcCsZgsR04vjHPe49jvu/tZiS3IgvaIi/vR5zFqNBHxbiHhI+58vmGN/
	 J7a7AySwjBFN3RDHpaRdeuwiD6tZomFKQmhbp5v/q4xpv6bwFW1vKs98kH77A4iB2q
	 v+XGDbzsk5M2bG4ybuFIGo6+igguIhVbekdTaiDHY+xnY7pWGwk9KZ9DHSXNrCfNom
	 WPO73fe4BpyCg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:36 +0300
Subject: [PATCH RFC 13/18] mm/set_memory: read page table entries with
 pXdp_get()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-13-2c1fc62306b3@kernel.org>
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

As a preparation for enabling generic set_memory support in riscv,
replace direct dereferences of the page table pointers with pXdp_get()
accessors.

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/set_memory.c | 56 ++++++++++++++++++++++++++++++--------------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/mm/set_memory.c b/mm/set_memory.c
index d2846804e4e6..1a7e63512981 100644
--- a/mm/set_memory.c
+++ b/mm/set_memory.c
@@ -51,58 +51,62 @@ unsigned long cpa_addr(struct cpa_data *cpa, unsigned long idx)
  * the level of the entry, and the effective NX and RW bits of all
  * page table levels.
  */
-pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
+pte_t *lookup_address_in_pgd_attr(pgd_t *pgdp, unsigned long address,
 				  unsigned int *level, bool *nx, bool *rw)
 {
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
+	pgd_t pgd = pgdp_get(pgdp);
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
 
 	*level = PGTABLE_LEVEL_PGD;
 	*nx = false;
 	*rw = true;
 
-	if (pgd_none(*pgd))
+	if (pgd_none(pgd))
 		return NULL;
 
 	*level = PGTABLE_LEVEL_P4D;
-	*nx |= !pgd_exec(*pgd);
-	*rw &= !!(pgd_write(*pgd));
+	*nx |= !pgd_exec(pgd);
+	*rw &= !!(pgd_write(pgd));
 
-	p4d = p4d_offset(pgd, address);
-	if (p4d_none(*p4d))
+	p4dp = p4d_offset(pgdp, address);
+	p4d = p4dp_get(p4dp);
+	if (p4d_none(p4d))
 		return NULL;
 
-	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
-		return (pte_t *)p4d;
+	if (p4d_leaf(p4d) || !p4d_present(p4d))
+		return (pte_t *)p4dp;
 
 	*level = PGTABLE_LEVEL_PUD;
-	*nx |= !p4d_exec(*p4d);
-	*rw &= !!(p4d_write(*p4d));
+	*nx |= !p4d_exec(p4d);
+	*rw &= !!(p4d_write(p4d));
 
-	pud = pud_offset(p4d, address);
-	if (pud_none(*pud))
+	pudp = pud_offset(p4dp, address);
+	pud = pudp_get(pudp);
+	if (pud_none(pud))
 		return NULL;
 
-	if (pud_leaf(*pud) || !pud_present(*pud))
-		return (pte_t *)pud;
+	if (pud_leaf(pud) || !pud_present(pud))
+		return (pte_t *)pudp;
 
 	*level = PGTABLE_LEVEL_PMD;
-	*nx |= !pud_exec(*pud);
-	*rw &= !!(pud_write(*pud));
+	*nx |= !pud_exec(pud);
+	*rw &= !!(pud_write(pud));
 
-	pmd = pmd_offset(pud, address);
-	if (pmd_none(*pmd))
+	pmdp = pmd_offset(pudp, address);
+	pmd = pmdp_get(pmdp);
+	if (pmd_none(pmd))
 		return NULL;
 
-	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
-		return (pte_t *)pmd;
+	if (pmd_leaf(pmd) || !pmd_present(pmd))
+		return (pte_t *)pmdp;
 
 	*level = PGTABLE_LEVEL_PTE;
-	*nx |= !pmd_exec(*pmd);
-	*rw &= !!(pmd_write(*pmd));
+	*nx |= !pmd_exec(pmd);
+	*rw &= !!(pmd_write(pmd));
 
-	return pte_offset_kernel(pmd, address);
+	return pte_offset_kernel(pmdp, address);
 }
 
 /*

-- 
2.53.0

