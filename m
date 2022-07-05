Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02F7C
	for <loongarch@lists.linux.dev>; Tue,  5 Jul 2022 15:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C877C341CF;
	Tue,  5 Jul 2022 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657036105;
	bh=vmTfGAnp2FA4UINeVAHTyZ6gYc9GVzKEgKs8+VE/qfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UA1PmHVqS7Doq3kkORGYOX9UWI9bk6hGxGCLQYpri8OgNWP05TQ1oO+xTKMSoyp11
	 rzFs3HWzzuispS+NfpdEtTBvDnPC3Mjh6i1U95VUltb+YPafh/fN/qhVtYZN/ez7Ip
	 dKtni/M8QvWXYcNkWAX98Y2nRFRWoc8vcpRMG+yMMNErodQFZ/eCleT1Eo2GTwIgMJ
	 1LrN3HZfSyCmSOTkTvPNZyaNqkGNU3x2VG0ibVFUUY9+fL5NY2bSZvzwHhBk6G7PLb
	 SFVEtuPP4xHzgLIwy4ZXJM/TF9nufuolZ7b2xKjbqOQtwEzcCobFAub96SQ7jwjhxM
	 gk6PQAnpBoLNQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Matthew Wilcox <willy@infradead.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Mike Rapoport <rppt@linux.ibm.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-parisc@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2 10/15] loongarch: drop definition of PMD_ORDER
Date: Tue,  5 Jul 2022 18:47:03 +0300
Message-Id: <20220705154708.181258-11-rppt@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705154708.181258-1-rppt@kernel.org>
References: <20220705154708.181258-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Rapoport <rppt@linux.ibm.com>

This is the order of the page table allocation, not the order of a PMD.
Since its always hardwired to 0, simply drop it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Huacai Chen <chenhuacai@kernel.org>
---
 arch/loongarch/include/asm/pgalloc.h | 4 ++--
 arch/loongarch/include/asm/pgtable.h | 7 +++----
 arch/loongarch/kernel/asm-offsets.c  | 3 ---
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index b0a57b25c131..93e785f46639 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -66,12 +66,12 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 	pmd_t *pmd;
 	struct page *pg;
 
-	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
+	pg = alloc_page(GFP_KERNEL_ACCOUNT);
 	if (!pg)
 		return NULL;
 
 	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_pages(pg, PMD_ORDER);
+		__free_page(pg);
 		return NULL;
 	}
 
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index e0bbfc31fe72..f926537d2233 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -23,7 +23,6 @@
 
 #define PGD_ORDER		0
 #define PUD_ORDER		0
-#define PMD_ORDER		0
 
 #if CONFIG_PGTABLE_LEVELS == 2
 #define PGDIR_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT - 3))
@@ -31,12 +30,12 @@
 #define PMD_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT - 3))
 #define PMD_SIZE	(1UL << PMD_SHIFT)
 #define PMD_MASK	(~(PMD_SIZE-1))
-#define PGDIR_SHIFT	(PMD_SHIFT + (PAGE_SHIFT + PMD_ORDER - 3))
+#define PGDIR_SHIFT	(PMD_SHIFT + (PAGE_SHIFT - 3))
 #elif CONFIG_PGTABLE_LEVELS == 4
 #define PMD_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT - 3))
 #define PMD_SIZE	(1UL << PMD_SHIFT)
 #define PMD_MASK	(~(PMD_SIZE-1))
-#define PUD_SHIFT	(PMD_SHIFT + (PAGE_SHIFT + PMD_ORDER - 3))
+#define PUD_SHIFT	(PMD_SHIFT + (PAGE_SHIFT - 3))
 #define PUD_SIZE	(1UL << PUD_SHIFT)
 #define PUD_MASK	(~(PUD_SIZE-1))
 #define PGDIR_SHIFT	(PUD_SHIFT + (PAGE_SHIFT + PUD_ORDER - 3))
@@ -52,7 +51,7 @@
 #define PTRS_PER_PUD	((PAGE_SIZE << PUD_ORDER) >> 3)
 #endif
 #if CONFIG_PGTABLE_LEVELS > 2
-#define PTRS_PER_PMD	((PAGE_SIZE << PMD_ORDER) >> 3)
+#define PTRS_PER_PMD	(PAGE_SIZE >> 3)
 #endif
 #define PTRS_PER_PTE	(PAGE_SIZE >> 3)
 
diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kernel/asm-offsets.c
index 1a1166a7e61c..aa4ef42d759f 100644
--- a/arch/loongarch/kernel/asm-offsets.c
+++ b/arch/loongarch/kernel/asm-offsets.c
@@ -191,9 +191,6 @@ void output_mm_defines(void)
 	DEFINE(_PTE_T_LOG2, PTE_T_LOG2);
 	BLANK();
 	DEFINE(_PGD_ORDER, PGD_ORDER);
-#ifndef __PAGETABLE_PMD_FOLDED
-	DEFINE(_PMD_ORDER, PMD_ORDER);
-#endif
 	BLANK();
 	DEFINE(_PMD_SHIFT, PMD_SHIFT);
 	DEFINE(_PGDIR_SHIFT, PGDIR_SHIFT);
-- 
2.34.1

