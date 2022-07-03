Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05323CF
	for <loongarch@lists.linux.dev>; Sun,  3 Jul 2022 14:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD358C341CA;
	Sun,  3 Jul 2022 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656857605;
	bh=2HLdhGohvtU2vrk5zor8RsOnp9/oF/6GSuTN52JoA1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uiJEPNefQ1Xwgm1PCjI1uzqAfLOCjVuzKjLNFQ/4h8ca55UN/5ogUX2EsaJt0Ewhd
	 tpWMJ5kQmPDezI3ykQebfoZkWyRYsGVVU6rbOL0jzC3KbPchJQ7b9Oj44Muu+0YJWs
	 HyWURIoPgsirPb4gNJ+sa04pTj8YcYSiiit/Ar0nwIGE3Q4xn5EJw9d5qbmqnn+F/D
	 CpkpqjzGVHfXSduECjvmjHJKd/FIbiLu6fbGxADk9f8I3+W0Vm2yFv4zOrYuBY3EX7
	 h5F1L0WwnnEZvSU45s+rUdz0tSDRdKYdsn40qGClG1q48k/BUGv+cPhbVizr+529+f
	 f5YkfcNNgUfQQ==
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
Subject: [PATCH 11/14] loongarch: drop definition of PUD_ORDER
Date: Sun,  3 Jul 2022 17:12:00 +0300
Message-Id: <20220703141203.147893-12-rppt@kernel.org>
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

This is the order of the page table allocation, not the order of a PUD.
Since its always hardwired to 0, simply drop it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/loongarch/include/asm/pgalloc.h | 2 +-
 arch/loongarch/include/asm/pgtable.h | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 93e785f46639..4bfeb3c9c9ac 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -90,7 +90,7 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
 
-	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_ORDER);
+	pud = (pud_t *) __get_free_page(GFP_KERNEL);
 	if (pud)
 		pud_init((unsigned long)pud, (unsigned long)invalid_pmd_table);
 	return pud;
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f926537d2233..a97996fefaed 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -22,7 +22,6 @@
 #endif
 
 #define PGD_ORDER		0
-#define PUD_ORDER		0
 
 #if CONFIG_PGTABLE_LEVELS == 2
 #define PGDIR_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT - 3))
@@ -38,7 +37,7 @@
 #define PUD_SHIFT	(PMD_SHIFT + (PAGE_SHIFT - 3))
 #define PUD_SIZE	(1UL << PUD_SHIFT)
 #define PUD_MASK	(~(PUD_SIZE-1))
-#define PGDIR_SHIFT	(PUD_SHIFT + (PAGE_SHIFT + PUD_ORDER - 3))
+#define PGDIR_SHIFT	(PUD_SHIFT + (PAGE_SHIFT - 3))
 #endif
 
 #define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
@@ -48,7 +47,7 @@
 
 #define PTRS_PER_PGD	((PAGE_SIZE << PGD_ORDER) >> 3)
 #if CONFIG_PGTABLE_LEVELS > 3
-#define PTRS_PER_PUD	((PAGE_SIZE << PUD_ORDER) >> 3)
+#define PTRS_PER_PUD	(PAGE_SIZE >> 3)
 #endif
 #if CONFIG_PGTABLE_LEVELS > 2
 #define PTRS_PER_PMD	(PAGE_SIZE >> 3)
-- 
2.34.1

