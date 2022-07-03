Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C91A23CF
	for <loongarch@lists.linux.dev>; Sun,  3 Jul 2022 14:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC39C341D0;
	Sun,  3 Jul 2022 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656857611;
	bh=6IMY6G/9LpTJ3ScO+xpUOM9ynBAP6MkPT8qRCrRHJy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I40wJmQKY2KwY2m/hKCzAs5JbgysfgdixxQJI1NORaBkzcBg6qe8Em8LtCTBDaSyn
	 Tt7OnjP69KujVbVnFFEVwTTOr+bEFtJQ8/rrpu0dE5UyOVhywqOUv7+gXmfe3zC9+s
	 A/bAO7HkaBzboAiEdmRpiFBci65LbFsFPMAMNGgNvM8nRG5u0h+iYFx9V1moyrNHxw
	 TUWAHJl4VjtFKmjpHSkTczFVXsvKGXZnCzqwT+WhbZMaHlkNxojR2M6/AfJN/QKurR
	 LCQppfLNUmYmpPgf3a66WMXPU/VNx5sQGdK07h08y7AhpP6a58hO1zOBWdI2VH9Dcv
	 qvfvCrekRt8bA==
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
Subject: [PATCH 12/14] loongarch: drop definition of PGD_ORDER
Date: Sun,  3 Jul 2022 17:12:01 +0300
Message-Id: <20220703141203.147893-13-rppt@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703141203.147893-1-rppt@kernel.org>
References: <20220703141203.147893-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Rapoport <rppt@linux.ibm.com>

This is the order of the page table allocation, not the order of a PGD.
Since its always hardwired to 0, simply drop it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/loongarch/include/asm/pgtable.h | 6 ++----
 arch/loongarch/kernel/asm-offsets.c  | 1 -
 arch/loongarch/mm/pgtable.c          | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index a97996fefaed..e03443abaf7d 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -21,8 +21,6 @@
 #include <asm-generic/pgtable-nop4d.h>
 #endif
 
-#define PGD_ORDER		0
-
 #if CONFIG_PGTABLE_LEVELS == 2
 #define PGDIR_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT - 3))
 #elif CONFIG_PGTABLE_LEVELS == 3
@@ -43,9 +41,9 @@
 #define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
 #define PGDIR_MASK	(~(PGDIR_SIZE-1))
 
-#define VA_BITS		(PGDIR_SHIFT + (PAGE_SHIFT + PGD_ORDER - 3))
+#define VA_BITS		(PGDIR_SHIFT + (PAGE_SHIFT - 3))
 
-#define PTRS_PER_PGD	((PAGE_SIZE << PGD_ORDER) >> 3)
+#define PTRS_PER_PGD	(PAGE_SIZE >> 3)
 #if CONFIG_PGTABLE_LEVELS > 3
 #define PTRS_PER_PUD	(PAGE_SIZE >> 3)
 #endif
diff --git a/arch/loongarch/kernel/asm-offsets.c b/arch/loongarch/kernel/asm-offsets.c
index aa4ef42d759f..72f431a7289d 100644
--- a/arch/loongarch/kernel/asm-offsets.c
+++ b/arch/loongarch/kernel/asm-offsets.c
@@ -190,7 +190,6 @@ void output_mm_defines(void)
 #endif
 	DEFINE(_PTE_T_LOG2, PTE_T_LOG2);
 	BLANK();
-	DEFINE(_PGD_ORDER, PGD_ORDER);
 	BLANK();
 	DEFINE(_PMD_SHIFT, PMD_SHIFT);
 	DEFINE(_PGDIR_SHIFT, PGDIR_SHIFT);
diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
index 0569647152e9..ee179ccd3e3f 100644
--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -13,7 +13,7 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *ret, *init;
 
-	ret = (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_ORDER);
+	ret = (pgd_t *) __get_free_page(GFP_KERNEL);
 	if (ret) {
 		init = pgd_offset(&init_mm, 0UL);
 		pgd_init((unsigned long)ret);
-- 
2.34.1

