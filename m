Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333D4DD6FD;
	Tue, 21 Jul 2026 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651077; cv=none; b=QU2lV1B7Ht5OZXXo+cavTVt4cYEB8XLDlEi8i1Ca9j4jqyms+YjZ9aqWYsSONIBXdTCqX5mY2YvSIZAI2C31LG0FCG0P7H07SYMNPDaEfXtxfmIsLXgErW8gx95WE4eWTz9f+mqcC9+7CFJFF5muWBXMjn9qoxMdu8qBp4YSbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651077; c=relaxed/simple;
	bh=ZyULvIQHjX0BEINxRsy6s9H95na0E7R/g5l9tojUy5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIcQcaebguyKYuvbcLqReLm8axCKarKUHb1+2C6nHsQ/NH5bwtcQw3sVo5myeOihb4oUHlSfheYEUgbf8xNiN9M11/2X8MBQdl15bo2VeTZcYnasRWsOV91IRr2Ds6WTiILX3qlQauCk+bofX84S1oplEExKKrfChhMNPzrxPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y40sTc2v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y40sTc2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370D11F000E9;
	Tue, 21 Jul 2026 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651076;
	bh=s+fAGwkj37+ME7Pb0rsrK6LPOBZGydYbqjFxeMM43qs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y40sTc2vrbeiNxDRxijWQmoLZupCjYYBLIzRIrURtoo3cDYHr5ZhKX2eqWO5Ns/9M
	 VWE7/yT06n+QRfyjogcDC45ebqMMD7SdkLyRKsNKmMuL5obaqIIuDsCjanWsgfwzrw
	 cNesCrWBJcDQ75nQP1mhcRx593LcEO94fvoZMWlfhl1r0xwzsbMZ9+NX+FEMYVsT+F
	 mKy8et9CuedtDDog/EjWVPYtVcr1/Kaiz0PWF3WoioZkDaWdkK8y+MHKL1arlrbJeB
	 Ph2fAs7rl++yRte5vI2YNioSX3LdjWLts0yl4+kaXBmoTOVKSN+a2vBm/IfjtVTZq6
	 sZT1yAdoXsXcA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:31 +0300
Subject: [PATCH RFC 08/18] x86/mm/pat: use cpa_split_data structure to pass
 split parameters
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-8-2c1fc62306b3@kernel.org>
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

Keeping all split parameters in a struct between
should_split_large_page() and split_large_page() allows maintaining the
split state that is initially established in cpa_handle_large_page(),
then this state is updated in should_split_large_page() and finally
consumed by split_large_page().

Start passing parameters between should_split_large_page() and
split_large_page() in cpa_split_data structure.

As the first step only pass the existing parameters in the new
structure.

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 49 ++++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index a9d270e986ff..c2a72cd8b832 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -53,6 +53,15 @@ struct cpa_data {
 	struct page	**pages;
 };
 
+/*
+ * context for checking for a split a large page and splitting it if required.
+ */
+struct cpa_split_data {
+	unsigned long	address;
+	pte_t		*kpte;
+	struct ptdesc	*ptdesc;
+};
+
 enum cpa_warn {
 	CPA_CONFLICT,
 	CPA_PROTECT,
@@ -869,12 +878,14 @@ static pgprot_t pgprot_clear_protnone_bits(pgprot_t prot)
 	return prot;
 }
 
-static int __should_split_large_page(pte_t *kpte, unsigned long address,
-				     struct cpa_data *cpa)
+static int __should_split_large_page(struct cpa_data *cpa,
+				     struct cpa_split_data *sd)
 {
 	unsigned long numpages, pmask, psize, lpaddr, pfn, old_pfn;
 	pgprot_t old_prot, new_prot, req_prot, chk_prot;
+	unsigned long address = sd->address;
 	enum pgtable_level level;
+	pte_t *kpte = sd->kpte;
 	pte_t new_pte, *tmp;
 	bool nx, rw;
 
@@ -1016,8 +1027,8 @@ static int __should_split_large_page(pte_t *kpte, unsigned long address,
 	return 0;
 }
 
-static int should_split_large_page(pte_t *kpte, unsigned long address,
-				   struct cpa_data *cpa)
+static int should_split_large_page(struct cpa_data *cpa,
+				   struct cpa_split_data *sd)
 {
 	int do_split;
 
@@ -1025,7 +1036,7 @@ static int should_split_large_page(pte_t *kpte, unsigned long address,
 		return 1;
 
 	spin_lock(&pgd_lock);
-	do_split = __should_split_large_page(kpte, address, cpa);
+	do_split = __should_split_large_page(cpa, sd);
 	spin_unlock(&pgd_lock);
 
 	return do_split;
@@ -1067,13 +1078,14 @@ static void split_set_pte(struct cpa_data *cpa, pte_t *pte, unsigned long pfn,
 	set_pte(pte, pfn_pte(pfn, ref_prot));
 }
 
-static int
-__split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
-		   struct ptdesc *ptdesc)
+static int __split_large_page(struct cpa_data *cpa, struct cpa_split_data *sd)
 {
 	unsigned long lpaddr, lpinc, ref_pfn, pfn, pfninc = 1;
+	struct ptdesc *ptdesc = sd->ptdesc;
 	struct page *base = ptdesc_page(ptdesc);
 	pte_t *pbase = (pte_t *)page_address(base);
+	unsigned long address = sd->address;
+	pte_t *kpte = sd->kpte;
 	unsigned int i, level;
 	pgprot_t ref_prot;
 	bool nx, rw;
@@ -1174,19 +1186,16 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 	return 0;
 }
 
-static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
-			    unsigned long address)
+static int split_large_page(struct cpa_data *cpa, struct cpa_split_data *sd)
 {
-	struct ptdesc *ptdesc;
-
 	spin_unlock(&cpa_lock);
-	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
+	sd->ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 	spin_lock(&cpa_lock);
-	if (!ptdesc)
+	if (!sd->ptdesc)
 		return -ENOMEM;
 
-	if (__split_large_page(cpa, kpte, address, ptdesc))
-		pagetable_free(ptdesc);
+	if (__split_large_page(cpa, sd))
+		pagetable_free(sd->ptdesc);
 
 	return 0;
 }
@@ -1194,13 +1203,17 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
 static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
 				  unsigned long address)
 {
+	struct cpa_split_data sd = {
+		.address = address,
+		.kpte = kpte,
+	};
 	int do_split, err;
 
 	/*
 	 * Check, whether we can keep the large page intact
 	 * and just change the pte:
 	 */
-	do_split = should_split_large_page(kpte, address, cpa);
+	do_split = should_split_large_page(cpa, &sd);
 	/*
 	 * When the range fits into the existing large page, no split is
 	 * required.
@@ -1213,7 +1226,7 @@ static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
 	/*
 	 * We have to split the large page:
 	 */
-	err = split_large_page(cpa, kpte, address);
+	err = split_large_page(cpa, &sd);
 	if (err)
 		return err;
 

-- 
2.53.0

