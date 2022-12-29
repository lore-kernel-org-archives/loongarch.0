Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77F1112
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 05:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1672292001; bh=4cwdkQ9fU2FqMzshSsxciNsE+2elsxPWA0121qmnE9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=buMvsPkkkJw+VIpJvwRFzoybLFJYQJhLuingUEpNfm5X4OhbA+ZALe1jMrptoLyP8
	 4JMBd4qC+gcg28kYBuOM9EmKoSMMkpSOLjM4d8j/2OEMxAtyg3ZBkZ3otVwpMEsdhF
	 VtKwedt4zRaXWw9H2o7O0PvUQ6qtY/sjwNq32qTc=
Received: from ld50.lan (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1D87E6014E;
	Thu, 29 Dec 2022 13:33:21 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 01/11] LoongArch: Clean up the architectural interrupt definitions
Date: Thu, 29 Dec 2022 13:32:56 +0800
Message-Id: <20221229053306.3285457-2-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229053306.3285457-1-kernel@xen0n.name>
References: <20221229053306.3285457-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

While interrupts are assigned ECodes `64 + interrupt number`, all
existing use sites of interrupt numbers want the 64 subtracted.
Re-arrange the definitions so that the actual interrupt number is used
everywhere, and make EXCCODE_INT_END inclusive as it is more intuitive
that way.

While at it, document an ISA manual erratum that is confirmed by Huacai
but not yet officially fixed in the official (Chinese) version of the
manual, namely the total number of architectural interrupts should be
(at least) 14 instead of 13. Relevant bitfields and masks have been
adjusted as well.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/loongarch.h | 56 ++++++++++++++++----------
 arch/loongarch/kernel/irq.c            |  2 +-
 arch/loongarch/kernel/perf_event.c     |  2 +-
 arch/loongarch/kernel/time.c           |  2 +-
 arch/loongarch/kernel/traps.c          |  2 +-
 5 files changed, 38 insertions(+), 26 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 7f8d57a61c8b..4910969928f0 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -311,8 +311,8 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
 #define  CSR_ECFG_VS_WIDTH		3
 #define  CSR_ECFG_VS			(_ULCAST_(0x7) << CSR_ECFG_VS_SHIFT)
 #define  CSR_ECFG_IM_SHIFT		0
-#define  CSR_ECFG_IM_WIDTH		13
-#define  CSR_ECFG_IM			(_ULCAST_(0x1fff) << CSR_ECFG_IM_SHIFT)
+#define  CSR_ECFG_IM_WIDTH		14
+#define  CSR_ECFG_IM			(_ULCAST_(0x3fff) << CSR_ECFG_IM_SHIFT)
 
 #define LOONGARCH_CSR_ESTAT		0x5	/* Exception status */
 #define  CSR_ESTAT_ESUBCODE_SHIFT	22
@@ -322,8 +322,8 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
 #define  CSR_ESTAT_EXC_WIDTH		6
 #define  CSR_ESTAT_EXC			(_ULCAST_(0x3f) << CSR_ESTAT_EXC_SHIFT)
 #define  CSR_ESTAT_IS_SHIFT		0
-#define  CSR_ESTAT_IS_WIDTH		15
-#define  CSR_ESTAT_IS			(_ULCAST_(0x7fff) << CSR_ESTAT_IS_SHIFT)
+#define  CSR_ESTAT_IS_WIDTH		14
+#define  CSR_ESTAT_IS			(_ULCAST_(0x3fff) << CSR_ESTAT_IS_SHIFT)
 
 #define LOONGARCH_CSR_ERA		0x6	/* ERA */
 
@@ -1087,7 +1087,7 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
 #define ECFGF_IPI		(_ULCAST_(1) << ECFGB_IPI)
 #define ECFGF(hwirq)		(_ULCAST_(1) << hwirq)
 
-#define ESTATF_IP		0x00001fff
+#define ESTATF_IP		0x00003fff
 
 #define LOONGARCH_IOCSR_FEATURES	0x8
 #define  IOCSRF_TEMP			BIT_ULL(0)
@@ -1415,23 +1415,35 @@ __BUILD_CSR_OP(tlbidx)
 	#define EXCSUBCODE_GCHC		1	/* Hardware caused */
 #define EXCCODE_SE		25	/* Security */
 
-#define EXCCODE_INT_START   64
-#define EXCCODE_SIP0        64
-#define EXCCODE_SIP1        65
-#define EXCCODE_IP0         66
-#define EXCCODE_IP1         67
-#define EXCCODE_IP2         68
-#define EXCCODE_IP3         69
-#define EXCCODE_IP4         70
-#define EXCCODE_IP5         71
-#define EXCCODE_IP6         72
-#define EXCCODE_IP7         73
-#define EXCCODE_PMC         74 /* Performance Counter */
-#define EXCCODE_TIMER       75
-#define EXCCODE_IPI         76
-#define EXCCODE_NMI         77
-#define EXCCODE_INT_END     78
-#define EXCCODE_INT_NUM	    (EXCCODE_INT_END - EXCCODE_INT_START)
+/*
+ * Interrupt numbers
+ *
+ * The LoongArch ISA manual v1.02 says there are 13 interrupts in total (see
+ * the description about CSR.ESTAT, Volume 1, section 7.4.6), namely omitting
+ * the NMI.
+ * Unfortunately in this case the manual is wrong, and the definitions here
+ * shall prevail. In other words, CSR.ECFG.LIE and CSR.ESTAT.IS are 14 bits
+ * wide, instead of 13 as the manual suggests otherwise.
+ */
+#define INT_SWI0	0	/* Software Interrupts */
+#define INT_SWI1	1
+#define INT_HWI0	2	/* Hardware Interrupts */
+#define INT_HWI1	3
+#define INT_HWI2	4
+#define INT_HWI3	5
+#define INT_HWI4	6
+#define INT_HWI5	7
+#define INT_HWI6	8
+#define INT_HWI7	9
+#define INT_PCOV	10	/* Performance Counter Overflow */
+#define INT_TI		11	/* Timer */
+#define INT_IPI		12
+#define INT_NMI		13
+
+/* ExcCodes corresponding to interrupts */
+#define EXCCODE_INT_NUM		(INT_NMI + 1)
+#define EXCCODE_INT_START	64
+#define EXCCODE_INT_END		(EXCCODE_INT_START + EXCCODE_INT_NUM - 1)
 
 /* FPU register names */
 #define LOONGARCH_FCSR0	$r0
diff --git a/arch/loongarch/kernel/irq.c b/arch/loongarch/kernel/irq.c
index 0524bf1169b7..883e5066ae44 100644
--- a/arch/loongarch/kernel/irq.c
+++ b/arch/loongarch/kernel/irq.c
@@ -92,7 +92,7 @@ static int __init get_ipi_irq(void)
 	struct irq_domain *d = irq_find_matching_fwnode(cpuintc_handle, DOMAIN_BUS_ANY);
 
 	if (d)
-		return irq_create_mapping(d, EXCCODE_IPI - EXCCODE_INT_START);
+		return irq_create_mapping(d, INT_IPI);
 
 	return -EINVAL;
 }
diff --git a/arch/loongarch/kernel/perf_event.c b/arch/loongarch/kernel/perf_event.c
index 707bd32e5c4f..ff28f99b47d7 100644
--- a/arch/loongarch/kernel/perf_event.c
+++ b/arch/loongarch/kernel/perf_event.c
@@ -461,7 +461,7 @@ static int get_pmc_irq(void)
 	struct irq_domain *d = irq_find_matching_fwnode(cpuintc_handle, DOMAIN_BUS_ANY);
 
 	if (d)
-		return irq_create_mapping(d, EXCCODE_PMC - EXCCODE_INT_START);
+		return irq_create_mapping(d, INT_PCOV);
 
 	return -EINVAL;
 }
diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
index a6576dea590c..c76a2a22e8e3 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -133,7 +133,7 @@ static int get_timer_irq(void)
 	struct irq_domain *d = irq_find_matching_fwnode(cpuintc_handle, DOMAIN_BUS_ANY);
 
 	if (d)
-		return irq_create_mapping(d, EXCCODE_TIMER - EXCCODE_INT_START);
+		return irq_create_mapping(d, INT_TI);
 
 	return -EINVAL;
 }
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 7ea62faeeadb..ee5454bdcc74 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -743,7 +743,7 @@ void __init trap_init(void)
 	long i;
 
 	/* Set interrupt vector handler */
-	for (i = EXCCODE_INT_START; i < EXCCODE_INT_END; i++)
+	for (i = EXCCODE_INT_START; i <= EXCCODE_INT_END; i++)
 		set_handler(i * VECSIZE, handle_vint, VECSIZE);
 
 	set_handler(EXCCODE_ADE * VECSIZE, handle_ade, VECSIZE);
-- 
2.38.1

