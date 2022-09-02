Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13F010E5
	for <loongarch@lists.linux.dev>; Fri,  2 Sep 2022 03:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13296C433C1;
	Fri,  2 Sep 2022 03:14:29 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Improve dump_tlb() output messages
Date: Fri,  2 Sep 2022 11:14:02 +0800
Message-Id: <20220902031402.305128-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1, Use nr/nx to replace ri/xi;
2, Add 0x prefix for hexadecimal data.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/lib/dump_tlb.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/lib/dump_tlb.c b/arch/loongarch/lib/dump_tlb.c
index cda2c6bc7f09..c3b6eddb84b7 100644
--- a/arch/loongarch/lib/dump_tlb.c
+++ b/arch/loongarch/lib/dump_tlb.c
@@ -18,11 +18,11 @@ void dump_tlb_regs(void)
 {
 	const int field = 2 * sizeof(unsigned long);
 
-	pr_info("Index    : %0x\n", read_csr_tlbidx());
-	pr_info("PageSize : %0x\n", read_csr_pagesize());
-	pr_info("EntryHi  : %0*llx\n", field, read_csr_entryhi());
-	pr_info("EntryLo0 : %0*llx\n", field, read_csr_entrylo0());
-	pr_info("EntryLo1 : %0*llx\n", field, read_csr_entrylo1());
+	pr_info("Index    : 0x%0x\n", read_csr_tlbidx());
+	pr_info("PageSize : 0x%0x\n", read_csr_pagesize());
+	pr_info("EntryHi  : 0x%0*llx\n", field, read_csr_entryhi());
+	pr_info("EntryLo0 : 0x%0*llx\n", field, read_csr_entrylo0());
+	pr_info("EntryLo1 : 0x%0*llx\n", field, read_csr_entrylo1());
 }
 
 static void dump_tlb(int first, int last)
@@ -33,8 +33,8 @@ static void dump_tlb(int first, int last)
 	unsigned int s_index, s_asid;
 	unsigned int pagesize, c0, c1, i;
 	unsigned long asidmask = cpu_asid_mask(&current_cpu_data);
-	int pwidth = 11;
-	int vwidth = 11;
+	int pwidth = 16;
+	int vwidth = 16;
 	int asidwidth = DIV_ROUND_UP(ilog2(asidmask) + 1, 4);
 
 	s_entryhi = read_csr_entryhi();
@@ -64,22 +64,22 @@ static void dump_tlb(int first, int last)
 		/*
 		 * Only print entries in use
 		 */
-		pr_info("Index: %2d pgsize=%x ", i, (1 << pagesize));
+		pr_info("Index: %4d pgsize=0x%x ", i, (1 << pagesize));
 
 		c0 = (entrylo0 & ENTRYLO_C) >> ENTRYLO_C_SHIFT;
 		c1 = (entrylo1 & ENTRYLO_C) >> ENTRYLO_C_SHIFT;
 
-		pr_cont("va=%0*lx asid=%0*lx",
+		pr_cont("va=0x%0*lx asid=0x%0*lx",
 			vwidth, (entryhi & ~0x1fffUL), asidwidth, asid & asidmask);
 
 		/* NR/NX are in awkward places, so mask them off separately */
 		pa = entrylo0 & ~(ENTRYLO_NR | ENTRYLO_NX);
 		pa = pa & PAGE_MASK;
 		pr_cont("\n\t[");
-		pr_cont("ri=%d xi=%d ",
+		pr_cont("nr=%d nx=%d ",
 			(entrylo0 & ENTRYLO_NR) ? 1 : 0,
 			(entrylo0 & ENTRYLO_NX) ? 1 : 0);
-		pr_cont("pa=%0*llx c=%d d=%d v=%d g=%d plv=%lld] [",
+		pr_cont("pa=0x%0*llx c=%d d=%d v=%d g=%d plv=%lld] [",
 			pwidth, pa, c0,
 			(entrylo0 & ENTRYLO_D) ? 1 : 0,
 			(entrylo0 & ENTRYLO_V) ? 1 : 0,
@@ -88,10 +88,10 @@ static void dump_tlb(int first, int last)
 		/* NR/NX are in awkward places, so mask them off separately */
 		pa = entrylo1 & ~(ENTRYLO_NR | ENTRYLO_NX);
 		pa = pa & PAGE_MASK;
-		pr_cont("ri=%d xi=%d ",
+		pr_cont("nr=%d nx=%d ",
 			(entrylo1 & ENTRYLO_NR) ? 1 : 0,
 			(entrylo1 & ENTRYLO_NX) ? 1 : 0);
-		pr_cont("pa=%0*llx c=%d d=%d v=%d g=%d plv=%lld]\n",
+		pr_cont("pa=0x%0*llx c=%d d=%d v=%d g=%d plv=%lld]\n",
 			pwidth, pa, c1,
 			(entrylo1 & ENTRYLO_D) ? 1 : 0,
 			(entrylo1 & ENTRYLO_V) ? 1 : 0,
-- 
2.31.1

