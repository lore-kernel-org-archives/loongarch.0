Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3F7B
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 06:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681625044; bh=avk/Pr8w1doQEcbXZ/FEXZXdmDJCg0he8rFGYHee09U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pafEE/k31izolCZMTmQ5B6rPRFXJ7ljERHeSVzrrxFQt7Cbd957xFSExNVErtr8Wn
	 yhXM3fn/ipLIYgdF6PDlqVXZoey5+0PyA6f/HffL0yuQkKMSjqlKEhy0xXtsxB+Cn3
	 3dVQdILZjNwfhQjhBOLPeYvHFfhhHncN+ShK6e0w=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 73C156015B;
	Sun, 16 Apr 2023 14:04:04 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 01/12] LoongArch: Clean up the architectural interrupt definitions
Date: Sun, 16 Apr 2023 14:03:45 +0800
Message-Id: <20230416060356.3711529-2-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416060356.3711529-1-kernel@xen0n.name>
References: <20230416060356.3711529-1-kernel@xen0n.name>
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
index 8c2969965c3c..a8ead016f329 100644
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
 
@@ -1090,7 +1090,7 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
 #define ECFGF_IPI		(_ULCAST_(1) << ECFGB_IPI)
 #define ECFGF(hwirq)		(_ULCAST_(1) << hwirq)
 
-#define ESTATF_IP		0x00001fff
+#define ESTATF_IP		0x00003fff
 
 #define LOONGARCH_IOCSR_FEATURES	0x8
 #define  IOCSRF_TEMP			BIT_ULL(0)
@@ -1418,23 +1418,35 @@ __BUILD_CSR_OP(tlbidx)
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
index 4351f69d9950..f377e50f3c66 100644
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
index c8b3bd76c941..2f4279f612e7 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -868,7 +868,7 @@ void __init trap_init(void)
 	long i;
 
 	/* Set interrupt vector handler */
-	for (i = EXCCODE_INT_START; i < EXCCODE_INT_END; i++)
+	for (i = EXCCODE_INT_START; i <= EXCCODE_INT_END; i++)
 		set_handler(i * VECSIZE, handle_vint, VECSIZE);
 
 	set_handler(EXCCODE_ADE * VECSIZE, handle_ade, VECSIZE);
-- 
2.40.0

