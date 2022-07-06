Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01477C
	for <loongarch@lists.linux.dev>; Wed,  6 Jul 2022 08:59:36 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=33;SR=0;TI=SMTPD_---0VIXnCQL_1657097963;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VIXnCQL_1657097963)
          by smtp.aliyun-inc.com;
          Wed, 06 Jul 2022 16:59:24 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org
Cc: rppt@linux.ibm.com,
	willy@infradead.org,
	will@kernel.org,
	aneesh.kumar@linux.ibm.com,
	npiggin@gmail.com,
	peterz@infradead.org,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tsbogend@alpha.franken.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	arnd@arndb.de,
	guoren@kernel.org,
	monstr@monstr.eu,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	baolin.wang@linux.alibaba.com,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-csky@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mm: Factor out the pagetable pages account into new helper function
Date: Wed,  6 Jul 2022 16:59:15 +0800
Message-Id: <a131bd98f7fd0c5b904b05496d53caaa2c62cde5.1657096412.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
References: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
References: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Factor out the pagetable pages account and pagetable setting into new
helper functions to avoid duplicated code. Meanwhile these helper
functions also will be used to account pagetable pages which do not
need split pagetable lock.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 include/linux/mm.h | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d084ce5..7894bc5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2352,20 +2352,30 @@ static inline void pgtable_init(void)
 	pgtable_cache_init();
 }
 
+static inline void page_set_pgtable(struct page *page)
+{
+	__SetPageTable(page);
+	inc_lruvec_page_state(page, NR_PAGETABLE);
+}
+
+static inline void page_clear_pgtable(struct page *page)
+{
+	__ClearPageTable(page);
+	dec_lruvec_page_state(page, NR_PAGETABLE);
+}
+
 static inline bool pgtable_pte_page_ctor(struct page *page)
 {
 	if (!ptlock_init(page))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	page_set_pgtable(page);
 	return true;
 }
 
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
 	ptlock_free(page);
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	page_clear_pgtable(page);
 }
 
 #define pte_offset_map_lock(mm, pmd, address, ptlp)	\
@@ -2451,16 +2461,14 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
 	if (!pmd_ptlock_init(page))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	page_set_pgtable(page);
 	return true;
 }
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
 	pmd_ptlock_free(page);
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	page_clear_pgtable(page);
 }
 
 /*
-- 
1.8.3.1

