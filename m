Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED70A21
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613591; bh=9w/0dd8piFUDwCDXftCwK3FgyNCajmv8ErKohWcvaTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/dDRiWrCmTYmMCMoXeOoG9kBimlGW5EVA+n8yjgap0ohjP0EeNNJqzhBTJR87nIA
	 hQzjCIr8DRQ8343l5KDjcjpgf6YuW2tqLSXjNkPshQvCJ0GV/fssN7xWwOUxAbsb36
	 8OWMfQH4+MCHig6W9iLVk0Pcx1XfGT7s1POsVg5A=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F0CDF6019B;
	Mon, 24 Oct 2022 20:13:09 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 04/13] LoongArch: Clean up the architectural interrupt definitions
Date: Mon, 24 Oct 2022 20:12:56 +0800
Message-Id: <20221024121305.381776-5-kernel@xen0n.name>
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

While interrupts are assigned ECodes `64 + interrupt number`, all
existing use sites of interrupt numbers want the 64 subtracted.
Re-arrange the definitions so that the actual interrupt number is used
everywhere.

While at it, document an ISA manual erratum that is confirmed by Huacai
but not yet officially fixed in the official (Chinese) version of the
manual.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/loongarch.h | 45 ++++++++++++++++----------
 arch/loongarch/kernel/irq.c            |  2 +-
 arch/loongarch/kernel/perf_event.c     |  2 +-
 arch/loongarch/kernel/time.c           |  2 +-
 arch/loongarch/kernel/traps.c          |  2 +-
 drivers/irqchip/irq-loongarch-cpu.c    |  2 +-
 6 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 143e9ce912ae..86fe0eda1534 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1417,23 +1417,34 @@ __BUILD_CSR_OP(tlbidx)
 	#define ESUBCODE_GCHC		1	/* ..., Hardware Caused */
 #define ECODE_SE		25	/* Undocumented: Security */
 
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
+ * the description about CSR.ESTAT, Volume 1, section 7.4.6), unfortunately
+ * in this case the manual is wrong, and the definitions here shall prevail.
+ * In other words, the widths of CSR.ECFG.LIE and CSR.ESTAT.IS are 14 bits,
+ * instead of 13 as the manual suggests otherwise.
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
+#define INT_NUM		(INT_NMI - INT_SWI0)
+
+/* ECodes corresponding to interrupts */
+#define ECODE_INT_START	64
+#define ECODE_INT_END	(ECODE_INT_START + INT_NUM)
 
 /* FPU register names */
 #define LOONGARCH_FCSR0	$r0
diff --git a/arch/loongarch/kernel/irq.c b/arch/loongarch/kernel/irq.c
index 1ba19c76563e..242c22a0b994 100644
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
index 786735dcc8d6..571a7e639e64 100644
--- a/arch/loongarch/kernel/time.c
+++ b/arch/loongarch/kernel/time.c
@@ -128,7 +128,7 @@ static int get_timer_irq(void)
 	struct irq_domain *d = irq_find_matching_fwnode(cpuintc_handle, DOMAIN_BUS_ANY);
 
 	if (d)
-		return irq_create_mapping(d, EXCCODE_TIMER - EXCCODE_INT_START);
+		return irq_create_mapping(d, INT_TI);
 
 	return -EINVAL;
 }
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 8e4691801e34..d4dc35c39296 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -743,7 +743,7 @@ void __init trap_init(void)
 	long i;
 
 	/* Set interrupt vector handler */
-	for (i = EXCCODE_INT_START; i < EXCCODE_INT_END; i++)
+	for (i = ECODE_INT_START; i < ECODE_INT_END; i++)
 		set_handler(i * VECSIZE, handle_vint, VECSIZE);
 
 	set_handler(ECODE_ADE * VECSIZE, handle_ade, VECSIZE);
diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loongarch-cpu.c
index 093609c8eaa7..3fc5c9ea426a 100644
--- a/drivers/irqchip/irq-loongarch-cpu.c
+++ b/drivers/irqchip/irq-loongarch-cpu.c
@@ -125,7 +125,7 @@ static int __init cpuintc_acpi_init(union acpi_subtable_headers *header,
 	clear_csr_estat(ESTATF_IP);
 
 	cpuintc_handle = irq_domain_alloc_named_fwnode("CPUINTC");
-	irq_domain = irq_domain_create_linear(cpuintc_handle, EXCCODE_INT_NUM,
+	irq_domain = irq_domain_create_linear(cpuintc_handle, INT_NUM,
 					&loongarch_cpu_intc_irq_domain_ops, NULL);
 
 	if (!irq_domain)
-- 
2.38.0

