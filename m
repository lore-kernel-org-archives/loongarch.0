Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB6B411A1C
	for <loongarch@lists.linux.dev>; Wed, 14 Oct 2026 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950375; cv=none; b=nV8zmnBV0MO5gmLNP+EA68JlRys0TI6GMo+/CPZnDjtcKq9Z7CMylAVeLZy54sOifkYmYPWtMvkNR1J7o96QW55U7lNWJiAntJfgATU232IeIV+fresvoCPpVTHOUJWGraFUjAsodNM5ZBNSEtHkYM7GTsK/VYIvZGFVFDOQXk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950375; c=relaxed/simple;
	bh=VmhSKYg91t8FaQOY7PLXlCuiEpMdg/PrBe3jC/5xDCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzwMmzb9nZ5OkJiUgoGPZxTzA6kDcaH1SmUf8JD9ferXM6WlrXncPp87Qn7oCD6AYpvwC7gxDHqkwfSDHpnDRxZQHBDrZQAj8alN5jr522cvKpiQ62Bgj+fw9xmdSU1wZo3xZ53U7iMaTACI5rVN0dCjFmZSwQ2J4z1KlgNWUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eCzJ1ASS; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eCzJ1ASS"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso1544018a12.0
        for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950373; x=1792555173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaAy9NFbsaWAIqgLcyoOERlKyqqeQpYUYBxUTmvTMEc=;
        b=eCzJ1ASS021vFOcRCjRrLxXDugRmQfTc57IEJxAjXrhYTUNW3EGYFCSS1kPi44Qf9H
         5lnE3iWAmQg8reRqPekGH89QKI8YrDP+QiU1aSZU3TLJD07ctFrvW/4ebfkjnIa5UDq4
         RE5BuwkkEcYXIHX7lCe+0zy2xtAAmYq444ssorjojXNge3ZiLMjEMMLka1lkHu/VEmQb
         /jgdg78NO2FptWgGF3TZo4erRFfm1fk5zhsd1BkhK58iJnbIdM/qfBKGnWfMffKWDjFp
         MAV2WkNmL7P+nUBA5xvJ9u8ICUNDt9iQFuOJ9PUbLoxAppB8KHpXPe9b81v2nMGqTm4M
         7vBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950373; x=1792555173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaAy9NFbsaWAIqgLcyoOERlKyqqeQpYUYBxUTmvTMEc=;
        b=F0tRr5QLM7mLfjrNfcWjQmt0CaZXJNFNVcld+71Iv8J6JSzAsR5Nf4vI610ditdn+e
         q0eV6HNm6DEHfUD8rBCLHvM78smn2ZUQfTj2E3FEFknkXdK1GcppcPhCasxD58Pvx2d1
         6f92jXWIbLOem/9/bv+G69gvIAZxoEPby7KNV8SKPuehCGcOH4auCGokZNGZcy8YD7Lv
         yeVArnBXzZqN+QGU8oBqH2C0hOwDxxozwRzVik+mwkhnn+REz9SA6W/3FA/gtwyMu4Rg
         UtBOF+vaC7q6OwUFLwYNdg5YsAp9GJKqrdbEAdfWeT6QCS7uYerPTGoScHOPTbh+4cF2
         rs3w==
X-Forwarded-Encrypted: i=1; AKwUvBwyXVIQVYQ2aM7Ck0Lg7MIbYf8FR9CQJHggLFBW+6e3xMxq9gg5aBBdPmtyg3PShNw0d46baSk271U=@lists.linux.dev
X-Gm-Message-State: AFq9FYJpOezJUfzT1AJYm/H0kGn9VXOj4s4S0vXXtEGcQHSycf871Mqc
	Xre8w4crTAIyQP6qdu+zPnkUq09bBFJOs8pmnc3UhpfYaV9KW4bMZKN3PigRhhM257o=
X-Gm-Gg: AYBFou2zTtek9scBDK1g30Yfqj3TLEh4wRYVcEKimqo7FSic8c6wPLexTRviyRk/lf4
	4+RX1JaKQvw44xWBLdnHWmBaDQZeOZfUxolePdohHdcDAz0o/kIQOngzeAB7IqyHWaYSgRjAzgV
	hz8POYUcXKhyyayEfGTPGfMYNynVR7+D6foC9UucAXaP3bxrwiZ137HPCx5kcCObM91gVNL/gHT
	KgvrUrmNsdiqS9e/Z42fu0M8jp6Z9xirOhJyUndFmhGk4xpzqcljLsynew0eZzdJfl4hyHNmD2+
	UCSRtNj/jvUSj6m3LSPrg5wOKfUooaU1W72DoL/Iygdm1hD72QLtlK5ait7Bp5Wjc8ILbXT1+8R
	ze59YhgXUxCodQR/cIj2MgqlKgJbxv0PZGzLlBR4vlHlyGToKnySbi5Bx7x+8I2eS69OwvH1dfW
	wjYOOOlumMkNSLw6JEO56BzEgAV34sOGIDWPny3zxYamz7xZA+TxX5+nEtzZdjbiEPTj9f4yfK5
	0r2TdtucjjEpj3rtCHV
X-Received: by 2002:a17:90b:384c:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3ab3ac86fbamr12973731a91.34.1791950373230;
        Tue, 13 Oct 2026 20:59:33 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:32 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mm: generalize PUD page table allocation
Date: Wed, 14 Oct 2026 11:59:10 +0800
Message-ID: <20261014035910.687847-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014035910.687847-1-songmuchun@bytedance.com>
References: <20261014035910.687847-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic PUD allocator assumes order-0 page tables and zero-valued empty
entries. MIPS and LoongArch need pud_init() to install their invalid
entries. MIPS also uses PUD_TABLE_ORDER to describe the allocation size.

Default PUD_TABLE_ORDER to zero, honor architecture overrides, and invoke
pud_init() from the generic allocator. MIPS and LoongArch can then drop
their duplicate helpers and use the generic constructor handling and kernel
ptdesc marking.

This also switches their user PUD allocations from GFP_KERNEL to
GFP_PGTABLE_USER, so they are accounted to the active memory cgroup
context. Allocations for init_mm continue to use GFP_PGTABLE_KERNEL.

Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/include/asm/pgalloc.h | 16 ----------------
 arch/mips/include/asm/pgalloc.h      | 15 ---------------
 include/asm-generic/pgalloc.h        | 11 +++++++++--
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 1fc9a0751f19..06a36da302d3 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -8,7 +8,6 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -51,21 +50,6 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 #endif
 
 #ifndef __PAGETABLE_PUD_FOLDED
-
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
-{
-	pud_t *pud;
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
-
-	if (!ptdesc)
-		return NULL;
-	pagetable_pud_ctor(ptdesc);
-	pud = ptdesc_address(ptdesc);
-
-	pud_init(pud);
-	return pud;
-}
-
 #define __pud_free_tlb(tlb, x, addr)	tlb_remove_ptdesc((tlb), virt_to_ptdesc(x))
 
 #endif /* __PAGETABLE_PUD_FOLDED */
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 2f123455e363..4346802e283f 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -13,7 +13,6 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
@@ -52,20 +51,6 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #ifndef __PAGETABLE_PUD_FOLDED
 
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
-{
-	pud_t *pud;
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
-
-	if (!ptdesc)
-		return NULL;
-	pagetable_pud_ctor(ptdesc);
-	pud = ptdesc_address(ptdesc);
-
-	pud_init(pud);
-	return pud;
-}
-
 static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
 	set_p4d(p4d, __p4d((unsigned long)pud));
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 68e473908758..cc8445e6078d 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -182,24 +182,31 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
+#ifndef PUD_TABLE_ORDER
+#define PUD_TABLE_ORDER	0
+#endif
+
 static inline pud_t *__pud_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
 {
 	gfp_t gfp = GFP_PGTABLE_USER;
 	struct ptdesc *ptdesc;
+	pud_t *pud;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
 
-	ptdesc = pagetable_alloc_noprof(gfp, 0);
+	ptdesc = pagetable_alloc_noprof(gfp, PUD_TABLE_ORDER);
 	if (!ptdesc)
 		return NULL;
 
 	pagetable_pud_ctor(ptdesc);
+	pud = ptdesc_address(ptdesc);
+	pud_init(pud);
 
 	if (mm == &init_mm)
 		ptdesc_set_kernel(ptdesc);
 
-	return ptdesc_address(ptdesc);
+	return pud;
 }
 #define __pud_alloc_one(...)	alloc_hooks(__pud_alloc_one_noprof(__VA_ARGS__))
 
-- 
2.54.0

