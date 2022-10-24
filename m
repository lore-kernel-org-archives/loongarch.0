Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC1A21
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613589; bh=H3RHdiUlGXK2YbkpEF/FnGbhwPrqcqD8tH8JTRN7PfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TklhfAcdPYcY9KKc6j31bMahpTVo04V4p/8djA8+qbQo38O+LMkzEC8cfRyQIgywU
	 zo1nZrTDWT1ct+iN89SMjO9THahSYWDbv65e4u4Yfxw/i4UfTBm4B4c7NUzr9LMPBI
	 9CqIvTvK4Rhodpky1LNNeNmYsQS8NWfb0z2gBE9A=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C232E60199;
	Mon, 24 Oct 2022 20:13:09 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 03/13] LoongArch: Unify the exception code definitions with the manual
Date: Mon, 24 Oct 2022 20:12:55 +0800
Message-Id: <20221024121305.381776-4-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024121305.381776-1-kernel@xen0n.name>
References: <20221024121305.381776-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

There is apparently much MIPS leftover in those definitions. Amend the
names and comments according to the LoongArch ISA manual.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/loongarch.h | 68 +++++++++++++-------------
 arch/loongarch/kernel/traps.c          | 26 +++++-----
 arch/loongarch/mm/tlb.c                | 14 +++---
 3 files changed, 55 insertions(+), 53 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index ca01d04c784e..143e9ce912ae 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1381,39 +1381,41 @@ __BUILD_CSR_OP(tlbidx)
 #error Bad page size configuration for hugetlbfs!
 #endif
 
-/* ExStatus.ExcCode */
-#define EXCCODE_RSV		0	/* Reserved */
-#define EXCCODE_TLBL		1	/* TLB miss on a load */
-#define EXCCODE_TLBS		2	/* TLB miss on a store */
-#define EXCCODE_TLBI		3	/* TLB miss on a ifetch */
-#define EXCCODE_TLBM		4	/* TLB modified fault */
-#define EXCCODE_TLBNR		5	/* TLB Read-Inhibit exception */
-#define EXCCODE_TLBNX		6	/* TLB Execution-Inhibit exception */
-#define EXCCODE_TLBPE		7	/* TLB Privilege Error */
-#define EXCCODE_ADE		8	/* Address Error */
-	#define EXSUBCODE_ADEF		0	/* Fetch Instruction */
-	#define EXSUBCODE_ADEM		1	/* Access Memory*/
-#define EXCCODE_ALE		9	/* Unalign Access */
-#define EXCCODE_OOB		10	/* Out of bounds */
-#define EXCCODE_SYS		11	/* System call */
-#define EXCCODE_BP		12	/* Breakpoint */
-#define EXCCODE_INE		13	/* Inst. Not Exist */
-#define EXCCODE_IPE		14	/* Inst. Privileged Error */
-#define EXCCODE_FPDIS		15	/* FPU Disabled */
-#define EXCCODE_LSXDIS		16	/* LSX Disabled */
-#define EXCCODE_LASXDIS		17	/* LASX Disabled */
-#define EXCCODE_FPE		18	/* Floating Point Exception */
-	#define EXCSUBCODE_FPE		0	/* Floating Point Exception */
-	#define EXCSUBCODE_VFPE		1	/* Vector Exception */
-#define EXCCODE_WATCH		19	/* Watch address reference */
-#define EXCCODE_BTDIS		20	/* Binary Trans. Disabled */
-#define EXCCODE_BTE		21	/* Binary Trans. Exception */
-#define EXCCODE_PSI		22	/* Guest Privileged Error */
-#define EXCCODE_HYP		23	/* Hypercall */
-#define EXCCODE_GCM		24	/* Guest CSR modified */
-	#define EXCSUBCODE_GCSC		0	/* Software caused */
-	#define EXCSUBCODE_GCHC		1	/* Hardware caused */
-#define EXCCODE_SE		25	/* Security */
+/* CSR.ESTAT.ECode & EsubCode */
+#define ECODE_INT		0	/* INTerrupt */
+#define ECODE_PIL		1	/* Page Invalid for Load */
+#define ECODE_PIS		2	/* Page Invalid for Store */
+#define ECODE_PIF		3	/* Page Invalid for instruction Fetch */
+#define ECODE_PME		4	/* Page Modified Exception */
+#define ECODE_PNR		5	/* Page Non-Readable */
+#define ECODE_PNX		6	/* Page Non-eXecutable */
+#define ECODE_PPI		7	/* Page Privilege level Illegal */
+#define ECODE_ADE		8	/* ADdress Error */
+	#define ESUBCODE_ADEF		0	/* ... on instruction Fetch */
+	#define ESUBCODE_ADEM		1	/* ... on Memory access */
+#define ECODE_ALE		9	/* ALignment Exception */
+#define ECODE_BCE		10	/* Bound Check Error */
+#define ECODE_SYS		11	/* SYStem call */
+#define ECODE_BRK		12	/* BReaKpoint */
+#define ECODE_INE		13	/* Instruction Non-Existent */
+#define ECODE_IPE		14	/* Instruction Privilege Error */
+#define ECODE_FPD		15	/* FPU Disabled */
+#define ECODE_SXD		16	/* LSX unit Disabled */
+#define ECODE_ASXD		17	/* LASX unit Disabled */
+#define ECODE_FPE		18	/* FP Exception */
+	#define ESUBCODE_FPE		0	/* FPU Exception */
+	#define ESUBCODE_VFPE		1	/* Vector FPU Exception */
+#define ECODE_WPE		19	/* WatchPoint Exception */
+	#define ESUBCODE_WPEF		0	/* ... on instruction Fetch */
+	#define ESUBCODE_WPEM		1	/* ... on Memory access */
+#define ECODE_BTD		20	/* LBT unit Disabled */
+#define ECODE_BTE		21	/* LBT unit Exception */
+#define ECODE_GSPR		22	/* Guest Sensitive Privileged Resource exception */
+#define ECODE_HVC		23	/* HyperVisor Call */
+#define ECODE_GCM		24	/* Guest CSR modified */
+	#define ESUBCODE_GCSC		0	/* ..., Software Caused */
+	#define ESUBCODE_GCHC		1	/* ..., Hardware Caused */
+#define ECODE_SE		25	/* Undocumented: Security */
 
 #define EXCCODE_INT_START   64
 #define EXCCODE_SIP0        64
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 8d959e853ec3..8e4691801e34 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -198,7 +198,7 @@ static void __show_regs(const struct pt_regs *regs)
 	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
 	printk("ExcCode : %x (SubCode %x)\n", exccode, excsubcode);
 
-	if (exccode >= EXCCODE_TLBL && exccode <= EXCCODE_ALE)
+	if (exccode >= ECODE_PIL && exccode <= ECODE_ALE)
 		printk("BadVA : %0*lx\n", field, regs->csr_badvaddr);
 
 	printk("PrId  : %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
@@ -746,18 +746,18 @@ void __init trap_init(void)
 	for (i = EXCCODE_INT_START; i < EXCCODE_INT_END; i++)
 		set_handler(i * VECSIZE, handle_vint, VECSIZE);
 
-	set_handler(EXCCODE_ADE * VECSIZE, handle_ade, VECSIZE);
-	set_handler(EXCCODE_ALE * VECSIZE, handle_ale, VECSIZE);
-	set_handler(EXCCODE_SYS * VECSIZE, handle_sys, VECSIZE);
-	set_handler(EXCCODE_BP * VECSIZE, handle_bp, VECSIZE);
-	set_handler(EXCCODE_INE * VECSIZE, handle_ri, VECSIZE);
-	set_handler(EXCCODE_IPE * VECSIZE, handle_ri, VECSIZE);
-	set_handler(EXCCODE_FPDIS * VECSIZE, handle_fpu, VECSIZE);
-	set_handler(EXCCODE_LSXDIS * VECSIZE, handle_lsx, VECSIZE);
-	set_handler(EXCCODE_LASXDIS * VECSIZE, handle_lasx, VECSIZE);
-	set_handler(EXCCODE_FPE * VECSIZE, handle_fpe, VECSIZE);
-	set_handler(EXCCODE_BTDIS * VECSIZE, handle_lbt, VECSIZE);
-	set_handler(EXCCODE_WATCH * VECSIZE, handle_watch, VECSIZE);
+	set_handler(ECODE_ADE * VECSIZE, handle_ade, VECSIZE);
+	set_handler(ECODE_ALE * VECSIZE, handle_ale, VECSIZE);
+	set_handler(ECODE_SYS * VECSIZE, handle_sys, VECSIZE);
+	set_handler(ECODE_BRK * VECSIZE, handle_bp, VECSIZE);
+	set_handler(ECODE_INE * VECSIZE, handle_ri, VECSIZE);
+	set_handler(ECODE_IPE * VECSIZE, handle_ri, VECSIZE);
+	set_handler(ECODE_FPD * VECSIZE, handle_fpu, VECSIZE);
+	set_handler(ECODE_SXD * VECSIZE, handle_lsx, VECSIZE);
+	set_handler(ECODE_ASXD * VECSIZE, handle_lasx, VECSIZE);
+	set_handler(ECODE_FPE * VECSIZE, handle_fpe, VECSIZE);
+	set_handler(ECODE_BTD * VECSIZE, handle_lbt, VECSIZE);
+	set_handler(ECODE_WPE * VECSIZE, handle_watch, VECSIZE);
 
 	cache_error_setup();
 
diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index da3681f131c8..caaf70e8f5ec 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -264,13 +264,13 @@ void setup_tlb_handler(int cpu)
 	if (cpu == 0) {
 		memcpy((void *)tlbrentry, handle_tlb_refill, 0x80);
 		local_flush_icache_range(tlbrentry, tlbrentry + 0x80);
-		set_handler(EXCCODE_TLBI * VECSIZE, handle_tlb_load, VECSIZE);
-		set_handler(EXCCODE_TLBL * VECSIZE, handle_tlb_load, VECSIZE);
-		set_handler(EXCCODE_TLBS * VECSIZE, handle_tlb_store, VECSIZE);
-		set_handler(EXCCODE_TLBM * VECSIZE, handle_tlb_modify, VECSIZE);
-		set_handler(EXCCODE_TLBNR * VECSIZE, handle_tlb_protect, VECSIZE);
-		set_handler(EXCCODE_TLBNX * VECSIZE, handle_tlb_protect, VECSIZE);
-		set_handler(EXCCODE_TLBPE * VECSIZE, handle_tlb_protect, VECSIZE);
+		set_handler(ECODE_PIF * VECSIZE, handle_tlb_load, VECSIZE);
+		set_handler(ECODE_PIL * VECSIZE, handle_tlb_load, VECSIZE);
+		set_handler(ECODE_PIS * VECSIZE, handle_tlb_store, VECSIZE);
+		set_handler(ECODE_PME * VECSIZE, handle_tlb_modify, VECSIZE);
+		set_handler(ECODE_PNR * VECSIZE, handle_tlb_protect, VECSIZE);
+		set_handler(ECODE_PNX * VECSIZE, handle_tlb_protect, VECSIZE);
+		set_handler(ECODE_PPI * VECSIZE, handle_tlb_protect, VECSIZE);
 	}
 #ifdef CONFIG_NUMA
 	else {
-- 
2.38.0

