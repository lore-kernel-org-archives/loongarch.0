Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADA232A3C1;
	Mon, 12 Jan 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207478; cv=none; b=QWiwpTBKwCLsRgqTT0SosXFwm7wUdQIAKKovarcBjAGpSlPn35iotL6a8UnX9Lg4uJO840nu5A8zC5/IwHAwP07YiioWRmThivOt0L7cOv4xeHr/xtz9eRQFx55+RuSKAMkdmRlMTO67CEKh6hm71TTn3gSQ/iZSTxrFLfuSLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207478; c=relaxed/simple;
	bh=+DrtJfuavYoccwOIdmy5if+qbnnLpqRQOHzCCWTiBPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fecDpJNw0WaaT80WClMOuk6CJUUdHiaaokT6glxvCUxqNp+vuZcC7VcE4eYoE4MTLVD4i5bmFtFtpHXGiPENElghJUri0n0rfZjukdV9X51aFTQK0Oyn0RrPsDjVNqPqPhF3jVEbOPdO/cz20irqK3c/u5jUZLBU/eGWtFL/afg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB84C116D0;
	Mon, 12 Jan 2026 08:44:36 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 3/7] irqchip/loongson-eiointc: Adjust irqchip driver for 32BIT/64BIT
Date: Mon, 12 Jan 2026 16:43:16 +0800
Message-ID: <20260112084320.1982244-4-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112084320.1982244-1-chenhuacai@loongson.cn>
References: <20260112084320.1982244-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iocsr_read64()/iocsr_write64() are only available on 64BIT LoongArch
platform, so add and use a pair of helpers, i.e. read_isr()/write_isr()
instead, so as to make the driver work on both 32BIT and 64BIT platform.

BTW, make eiointc_enable() be a no-op since it is only needed by 64BIT
platform.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 44 ++++++++++++++++++++------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index ad2105685b48..7fd0397d37f1 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -37,9 +37,9 @@
 #define  EXTIOI_ENABLE_INT_ENCODE      BIT(2)
 #define  EXTIOI_ENABLE_CPU_ENCODE      BIT(3)
 
-#define VEC_REG_COUNT		4
-#define VEC_COUNT_PER_REG	64
-#define VEC_COUNT		(VEC_REG_COUNT * VEC_COUNT_PER_REG)
+#define VEC_COUNT		256
+#define VEC_COUNT_PER_REG	BITS_PER_LONG
+#define VEC_REG_COUNT		(VEC_COUNT / BITS_PER_LONG)
 #define VEC_REG_IDX(irq_id)	((irq_id) / VEC_COUNT_PER_REG)
 #define VEC_REG_BIT(irq_id)     ((irq_id) % VEC_COUNT_PER_REG)
 #define EIOINTC_ALL_ENABLE	0xffffffff
@@ -85,11 +85,13 @@ static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
 
 static void eiointc_enable(void)
 {
-	uint64_t misc;
+	if (IS_ENABLED(CONFIG_MACH_LOONGSON64)) {
+		uint64_t misc;
 
-	misc = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
-	misc |= IOCSR_MISC_FUNC_EXT_IOI_EN;
-	iocsr_write64(misc, LOONGARCH_IOCSR_MISC_FUNC);
+		misc = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
+		misc |= IOCSR_MISC_FUNC_EXT_IOI_EN;
+		iocsr_write64(misc, LOONGARCH_IOCSR_MISC_FUNC);
+	}
 }
 
 static int cpu_to_eio_node(int cpu)
@@ -281,12 +283,34 @@ static int eiointc_router_init(unsigned int cpu)
 	return 0;
 }
 
+#if VEC_COUNT_PER_REG == 32
+static unsigned long read_isr(int i)
+{
+	return iocsr_read32(EIOINTC_REG_ISR + (i << 2));
+}
+
+static void write_isr(int i, unsigned long val)
+{
+	iocsr_write32(val, EIOINTC_REG_ISR + (i << 2));
+}
+#else
+static unsigned long read_isr(int i)
+{
+	return iocsr_read64(EIOINTC_REG_ISR + (i << 3));
+}
+
+static void write_isr(int i, unsigned long val)
+{
+	iocsr_write64(val, EIOINTC_REG_ISR + (i << 3));
+}
+#endif
+
 static void eiointc_irq_dispatch(struct irq_desc *desc)
 {
 	struct eiointc_ip_route *info = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	bool handled = false;
-	u64 pending;
+	unsigned long pending;
 	int i;
 
 	chained_irq_enter(chip, desc);
@@ -299,14 +323,14 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
 	 * read ISR for these 64 interrupt vectors rather than all vectors
 	 */
 	for (i = info->start; i < info->end; i++) {
-		pending = iocsr_read64(EIOINTC_REG_ISR + (i << 3));
+		pending = read_isr(i);
 
 		/* Skip handling if pending bitmap is zero */
 		if (!pending)
 			continue;
 
 		/* Clear the IRQs */
-		iocsr_write64(pending, EIOINTC_REG_ISR + (i << 3));
+		write_isr(i, pending);
 		while (pending) {
 			int bit = __ffs(pending);
 			int irq = bit + VEC_COUNT_PER_REG * i;
-- 
2.47.3

