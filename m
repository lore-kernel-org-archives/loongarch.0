Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53879470438;
	Tue, 21 Jul 2026 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651119; cv=none; b=R6wn5JBYgvICm4oLMQcKw5QHfyyKtS4ZHDpL0W5mWAIJN+j8QUYTQ6ihkPxwGUK/i2daaq/ntXgsMSfwF9oXIAkoXVKGvuSnyebQicfV+xNzCfSiFx0fQuEkgq2hu2Qv4ZgN1GsUU5xZ5MuHyXk5JMG1flNIfQJGIhBt+GQcpt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651119; c=relaxed/simple;
	bh=jP8qb2ICdHYNxAWNsZXKk48vbjjid/9LdL3DajjTjJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YEHdWoMY6fvcfnHHTeGJrEqFCHcpxg7P2IALk3nnzDR50+2xnMqT3slzJUUYKb3Qxv1RpuDZzIB+wN1Zl2jlw5PVhETfgWzt0Ie/MZ3YAc9c25UbpjLF3HWWoO1iHZTT4EDOpS1c/E9ps0GS8+c8DVy0yUY4fuoqm68NtRBT6Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8A6prhO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8A6prhO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942921F000E9;
	Tue, 21 Jul 2026 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651117;
	bh=h2YvaZEG2wv7tmOzWwCPwwMH83wkmZrmcbT8ch8YIVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i8A6prhO4oEjQKcPaFupxFo3i7djT5ZZMgSEMF7CITDyQJdhm8mQH4c0+IuRlONg2
	 6pnfP3oAud+fzP5vdYRZngpU3V1js2hyhTHy8Eh3TzhXexeKGq2yDXioLNwkhbgLXI
	 hcZk8PH9/sPZ04wf5zFFfq/BNkjRk+wpmmVvxfvvN0EuiDKG8Gb1bbuSj/ltEvdKi8
	 2nGAwc3as2d0wnScwhNmS7MDMBLlK6bMFbtDn0YQ9WRZr1Y99KgXifDS4ve9aqhrvM
	 tunohQh1bWzpK0kQqnad9jb5dTUZbL6s5p+OMwZZ2R9LXLg3hvmuYck4JvEVxJGW3R
	 H9qTfOhYaxhqQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:37 +0300
Subject: [PATCH RFC 14/18] x86/mm/pat, mm: move cpa-test to mm
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-14-2c1fc62306b3@kernel.org>
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

x86 has a nice test suite for set_memory APIs and CPA machinery.

Now that core CPA machinery is a part of the generic code let's make the
test also available as the part of the common code:

* move arch/x86/mm/pat/cpa-test.c to mm/
* keep it included in set_memory.c rather than a separate compilation unit.
* adjust the code to use pXd accessors instead of hardcoded x86 specific
  bits
* replace max_pfn_mapped used as an upper bound with test local
  max_test_pfn derived from high_memory.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/Kconfig.debug             |  6 ----
 arch/x86/mm/pat/set_memory.c       |  8 -----
 mm/Kconfig.debug                   |  7 ++++
 {arch/x86/mm/pat => mm}/cpa-test.c | 66 +++++++++++++++++++-------------------
 mm/set_memory.c                    |  8 +++++
 5 files changed, 48 insertions(+), 47 deletions(-)

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index c95c3aaadf97..314b72aad6ff 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -157,12 +157,6 @@ config DEBUG_BOOT_PARAMS
 	help
 	  This option will cause struct boot_params to be exported via debugfs.
 
-config CPA_DEBUG
-	bool "CPA self-test code"
-	depends on DEBUG_KERNEL
-	help
-	  Do change_page_attr() self-tests every 30 seconds.
-
 config DEBUG_ENTRY
 	bool "Debug low-level entry code"
 	depends on DEBUG_KERNEL
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 5109139a2d31..c460121c96b9 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2324,11 +2324,3 @@ int __init kernel_unmap_pages_in_pgd(pgd_t *pgd, unsigned long address,
 
 	return retval;
 }
-
-/*
- * The testcases use internal knowledge of the implementation that shouldn't
- * be exposed to the rest of the kernel. Include these directly here.
- */
-#ifdef CONFIG_CPA_DEBUG
-#include "cpa-test.c"
-#endif
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 91b3e027b753..83cfef6b2d8c 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -320,3 +320,10 @@ config PER_VMA_LOCK_STATS
 	  overhead in the page fault path.
 
 	  If in doubt, say N.
+
+config CPA_DEBUG
+	bool "CPA self-test code"
+	depends on GENERIC_SET_MEMORY
+	depends on DEBUG_KERNEL
+	help
+	  Do change_page_attr() self-tests every 30 seconds.
diff --git a/arch/x86/mm/pat/cpa-test.c b/mm/cpa-test.c
similarity index 80%
rename from arch/x86/mm/pat/cpa-test.c
rename to mm/cpa-test.c
index ad3c1feec990..63c3463a5a7d 100644
--- a/arch/x86/mm/pat/cpa-test.c
+++ b/mm/cpa-test.c
@@ -13,32 +13,24 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 
-#include <asm/cacheflush.h>
-#include <asm/kdebug.h>
-
 /*
  * Only print the results of the first pass:
  */
 static __read_mostly int print = 1;
+static unsigned long max_test_pfn;
 
 enum {
 	NTEST			= 3 * 100,
 	NPAGES			= 100,
-#ifdef CONFIG_X86_64
-	LPS			= (1 << PMD_SHIFT),
-#elif defined(CONFIG_X86_PAE)
-	LPS			= (1 << PMD_SHIFT),
-#else
-	LPS			= (1 << 22),
-#endif
-	GPS			= (1<<30)
+	LPS			= PMD_SIZE,
+	GPS			= PUD_SIZE
 };
 
-#define PAGE_CPA_TEST	__pgprot(_PAGE_CPA_TEST)
+#define PAGE_CPA_TEST	__pgprot(_PAGE_SPECIAL)
 
 static int pte_testbit(pte_t pte)
 {
-	return pte_flags(pte) & _PAGE_SOFTW1;
+	return pte_special(pte);
 }
 
 struct split_state {
@@ -54,10 +46,10 @@ static int print_split(struct split_state *s)
 	s->lpg = s->gpg = s->spg = s->exec = 0;
 	s->min_exec = ~0UL;
 	s->max_exec = 0;
-	for (i = 0; i < max_pfn_mapped; ) {
+	for (i = 0; i < max_test_pfn; ) {
 		unsigned long addr = (unsigned long)__va(i << PAGE_SHIFT);
 		unsigned int level;
-		pte_t *pte;
+		pte_t *pte, pteval;
 
 		pte = lookup_address(addr, &level);
 		if (!pte) {
@@ -65,15 +57,16 @@ static int print_split(struct split_state *s)
 			i++;
 			continue;
 		}
+		pteval = ptep_get(pte);
 
-		if (level == PG_LEVEL_1G && sizeof(long) == 8) {
+		if (level == PGTABLE_LEVEL_PUD && sizeof(long) == 8) {
 			s->gpg++;
 			i += GPS/PAGE_SIZE;
-		} else if (level == PG_LEVEL_2M) {
-			if ((pte_val(*pte) & _PAGE_PRESENT) && !(pte_val(*pte) & _PAGE_PSE)) {
+		} else if (level == PGTABLE_LEVEL_PMD) {
+			if (pte_present(pteval) && !pte_huge(pteval)) {
 				printk(KERN_ERR
-					"%lx level %d but not PSE %Lx\n",
-					addr, level, (u64)pte_val(*pte));
+					"%lx level %d but not leaf %Lx\n",
+					addr, level, (u64)pte_val(pteval));
 				err = 1;
 			}
 			s->lpg++;
@@ -82,7 +75,7 @@ static int print_split(struct split_state *s)
 			s->spg++;
 			i++;
 		}
-		if (!(pte_val(*pte) & _PAGE_NX)) {
+		if (pte_exec(pteval)) {
 			s->exec++;
 			if (addr < s->min_exec)
 				s->min_exec = addr;
@@ -100,8 +93,8 @@ static int print_split(struct split_state *s)
 
 	expected = (s->gpg*GPS + s->lpg*LPS)/PAGE_SIZE + s->spg + missed;
 	if (expected != i) {
-		printk(KERN_ERR "CPA max_pfn_mapped %lu but expected %lu\n",
-			max_pfn_mapped, expected);
+		printk(KERN_ERR "CPA max_test_pfn %lu but expected %lu\n",
+			max_test_pfn, expected);
 		return 1;
 	}
 	return err;
@@ -118,7 +111,7 @@ static int pageattr_test(void)
 {
 	struct split_state sa, sb, sc;
 	unsigned long *bm;
-	pte_t *pte, pte0;
+	pte_t *pte, pte0, pte_val;
 	int failed = 0;
 	unsigned int level;
 	int i, k;
@@ -127,7 +120,7 @@ static int pageattr_test(void)
 	if (print)
 		printk(KERN_INFO "CPA self-test:\n");
 
-	bm = vzalloc((max_pfn_mapped + 7) / 8);
+	bm = vzalloc((max_test_pfn + 7) / 8);
 	if (!bm) {
 		printk(KERN_ERR "CPA Cannot vmalloc bitmap\n");
 		return -ENOMEM;
@@ -136,11 +129,11 @@ static int pageattr_test(void)
 	failed += print_split(&sa);
 
 	for (i = 0; i < NTEST; i++) {
-		unsigned long pfn = get_random_u32_below(max_pfn_mapped);
+		unsigned long pfn = get_random_u32_below(max_test_pfn);
 
 		addr[i] = (unsigned long)__va(pfn << PAGE_SHIFT);
 		len[i] = get_random_u32_below(NPAGES);
-		len[i] = min_t(unsigned long, len[i], max_pfn_mapped - pfn - 1);
+		len[i] = min_t(unsigned long, len[i], max_test_pfn - pfn - 1);
 
 		if (len[i] == 0)
 			len[i] = 1;
@@ -150,15 +143,20 @@ static int pageattr_test(void)
 
 		for (k = 0; k < len[i]; k++) {
 			pte = lookup_address(addr[i] + k*PAGE_SIZE, &level);
-			if (!pte || pgprot_val(pte_pgprot(*pte)) == 0 ||
-			    !(pte_val(*pte) & _PAGE_PRESENT)) {
+			if (!pte) {
+				addr[i] = 0;
+				break;
+			}
+			pte_val = ptep_get(pte);
+			if (pgprot_val(pte_pgprot(pte_val)) == 0 ||
+			    !pte_present(pte_val)) {
 				addr[i] = 0;
 				break;
 			}
 			if (k == 0) {
-				pte0 = *pte;
+				pte0 = pte_val;
 			} else {
-				if (pgprot_val(pte_pgprot(*pte)) !=
+				if (pgprot_val(pte_pgprot(pte_val)) !=
 					pgprot_val(pte_pgprot(pte0))) {
 					len[i] = k;
 					break;
@@ -198,12 +196,12 @@ static int pageattr_test(void)
 		}
 
 		pte = lookup_address(addr[i], &level);
-		if (!pte || !pte_testbit(*pte) || pte_huge(*pte)) {
+		if (!pte || !pte_testbit(*pte) || level != PGTABLE_LEVEL_PTE) {
 			printk(KERN_ERR "CPA %lx: bad pte %Lx\n", addr[i],
 				pte ? (u64)pte_val(*pte) : 0ULL);
 			failed++;
 		}
-		if (level != PG_LEVEL_4K) {
+		if (level != PGTABLE_LEVEL_PTE) {
 			printk(KERN_ERR "CPA %lx: unexpected level %d\n",
 				addr[i], level);
 			failed++;
@@ -266,6 +264,8 @@ static int start_pageattr_test(void)
 {
 	struct task_struct *p;
 
+	max_test_pfn = PFN_DOWN(__pa(high_memory - 1));
+
 	p = kthread_create(do_pageattr_test, NULL, "pageattr-test");
 	if (!IS_ERR(p))
 		wake_up_process(p);
diff --git a/mm/set_memory.c b/mm/set_memory.c
index 1a7e63512981..744405efcc34 100644
--- a/mm/set_memory.c
+++ b/mm/set_memory.c
@@ -386,3 +386,11 @@ int change_page_attr_set_clr(unsigned long *addr, int numpages,
 out:
 	return err;
 }
+
+/*
+ * The testcases use internal knowledge of the implementation that shouldn't
+ * be exposed to the rest of the kernel. Include these directly here.
+ */
+#ifdef CONFIG_CPA_DEBUG
+#include "cpa-test.c"
+#endif

-- 
2.53.0

