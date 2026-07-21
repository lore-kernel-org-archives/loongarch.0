Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A32746D08D;
	Tue, 21 Jul 2026 16:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651050; cv=none; b=CorhvtOfWdnc49E8IDYNk4ssmiXpXNxcpZxe1oe65jan17B/o/Nk7KeDhHC1Iv+3Z1II4BzJAk/gZKLfjKyeZ6S7S1Bq4O2KmVYE0ZrFiOzwsyHQO20gNqxTXOyQRiai3OBLYnLCurGtK3Olf6eS+JWh7+5hrDrmf3gWaEaUauQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651050; c=relaxed/simple;
	bh=Pr4OatziqEtwlzxZ1HU4xgXWtdeNSa6otAD8Mir3Ouc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGyGOmlrL4GJj9e7HL5/BkJcQ1N6kXYoAVs4u2ssV3xqjG+HamWG+Akx7X7Evpsb2SBHmlQykufjyTJzqPY8HGG29pZHL4oJEXDatzhHP/iRnZUE2IBEY4wxgBGe9o8PPnL1Ra41+IyE2p8uZc0KKkiY7dREMaGhy3JCMlP10iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6oC1Y2Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6oC1Y2Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9301F000E9;
	Tue, 21 Jul 2026 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651049;
	bh=0Wguk/FKFbBfgrue612K7C908fnjMdpbMIygxr4WCGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n6oC1Y2YhkB33kl+lY/6bGcVcuCS/W837kNYiwgxRqaeUrDEn9g39wd1GM4MW8px3
	 oNj01sZ9u1lNDGqVzzXPfNa0Ea/Of96eh0QA4sqNpYWUbnY+yJky9ikCkzQmMhSxr9
	 6IvRG18RVe7qXyX3xCvW9Zz65lUPSfZFPe2svum1imsJKQRJfRIjxXtjMjE7tfR/Jy
	 YWYTcZ6iEPaaL37jM9qxoRu089n2DJI97hm3OHoC2zBYISI0/0uZFBSFN6Fh4t4EJs
	 J4dwYxv2Gk/8dIJughDCqh3Los59MNzkVdM9/sO0CdNg41rIY3YGtWzd8PgrLXK3a9
	 J9gqKimG7Gp5A==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:27 +0300
Subject: [PATCH RFC 04/18] x86/mm/pat: use page table accessors for
 effective RW/NX bits
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-4-2c1fc62306b3@kernel.org>
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

In preparation to moving core parts of change_page_attr() to common
code, replace open coded checks for _PAGE_RW and _PAGE_NX bits in
lookup_address_in_pgd_attr() with pXd_write() and pXd_exec() accessors.

Add x86 implementation of pXd_write() and pXd_exec() accessors and
provide generic stubs in include/linux/pgtable.h.

The stubs follow the existing pattern and BUG() if they are called.

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/pgtable.h | 36 ++++++++++++++++++++++++++++++++++++
 arch/x86/mm/pat/set_memory.c   | 16 ++++++++--------
 include/linux/pgtable.h        | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ac295ca6c92f..497aaf08ad36 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -227,6 +227,42 @@ static inline int pud_write(pud_t pud)
 	return pud_flags(pud) & _PAGE_RW;
 }
 
+#define p4d_write p4d_write
+static inline int p4d_write(p4d_t p4d)
+{
+	return p4d_flags(p4d) & _PAGE_RW;
+}
+
+#define pgd_write pgd_write
+static inline int pgd_write(pgd_t pgd)
+{
+	return pgd_flags(pgd) & _PAGE_RW;
+}
+
+#define pmd_exec pmd_exec
+static inline int pmd_exec(pmd_t pmd)
+{
+	return !(pmd_flags(pmd) & _PAGE_NX);
+}
+
+#define pud_exec pud_exec
+static inline int pud_exec(pud_t pud)
+{
+	return !(pud_flags(pud) & _PAGE_NX);
+}
+
+#define p4d_exec p4d_exec
+static inline int p4d_exec(p4d_t p4d)
+{
+	return !(p4d_flags(p4d) & _PAGE_NX);
+}
+
+#define pgd_exec pgd_exec
+static inline int pgd_exec(pgd_t pgd)
+{
+	return !(pgd_flags(pgd) & _PAGE_NX);
+}
+
 static inline int pte_huge(pte_t pte)
 {
 	return pte_flags(pte) & _PAGE_PSE;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 328805933d4d..8a1782f5de3e 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -729,8 +729,8 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 		return NULL;
 
 	*level = PGTABLE_LEVEL_P4D;
-	*nx |= pgd_flags(*pgd) & _PAGE_NX;
-	*rw &= !!(pgd_flags(*pgd) & _PAGE_RW);
+	*nx |= !pgd_exec(*pgd);
+	*rw &= !!(pgd_write(*pgd));
 
 	p4d = p4d_offset(pgd, address);
 	if (p4d_none(*p4d))
@@ -740,8 +740,8 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 		return (pte_t *)p4d;
 
 	*level = PGTABLE_LEVEL_PUD;
-	*nx |= p4d_flags(*p4d) & _PAGE_NX;
-	*rw &= !!(p4d_flags(*p4d) & _PAGE_RW);
+	*nx |= !p4d_exec(*p4d);
+	*rw &= !!(p4d_write(*p4d));
 
 	pud = pud_offset(p4d, address);
 	if (pud_none(*pud))
@@ -751,8 +751,8 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 		return (pte_t *)pud;
 
 	*level = PGTABLE_LEVEL_PMD;
-	*nx |= pud_flags(*pud) & _PAGE_NX;
-	*rw &= !!(pud_flags(*pud) & _PAGE_RW);
+	*nx |= !pud_exec(*pud);
+	*rw &= !!(pud_write(*pud));
 
 	pmd = pmd_offset(pud, address);
 	if (pmd_none(*pmd))
@@ -762,8 +762,8 @@ pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
 		return (pte_t *)pmd;
 
 	*level = PGTABLE_LEVEL_PTE;
-	*nx |= pmd_flags(*pmd) & _PAGE_NX;
-	*rw &= !!(pmd_flags(*pmd) & _PAGE_RW);
+	*nx |= !pmd_exec(*pmd);
+	*rw &= !!(pmd_write(*pmd));
 
 	return pte_offset_kernel(pmd, address);
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 3889bc2a1f76..4b42ac5c27d9 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2105,6 +2105,46 @@ static inline int pud_write(pud_t pud)
 }
 #endif /* pud_write */
 
+#ifndef p4d_write
+static inline int p4d_write(p4d_t p4d)
+{
+	BUG();
+	return 0;
+}
+#endif /* p4d_write */
+
+#ifndef pmd_exec
+static inline int pmd_exec(pmd_t pmd)
+{
+	BUG();
+	return 0;
+}
+#endif /* pmd_exec */
+
+#ifndef pud_exec
+static inline int pud_exec(pud_t pud)
+{
+	BUG();
+	return 0;
+}
+#endif /* pud_exec */
+
+#ifndef p4d_exec
+static inline int p4d_exec(p4d_t p4d)
+{
+	BUG();
+	return 0;
+}
+#endif /* p4d_exec */
+
+#ifndef pgd_exec
+static inline int pgd_exec(pgd_t pgd)
+{
+	BUG();
+	return 0;
+}
+#endif /* pgd_exec */
+
 #if !defined(CONFIG_TRANSPARENT_HUGEPAGE) || \
 	!defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
 static inline int pud_trans_huge(pud_t pud)

-- 
2.53.0

