Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7202877D2;
	Tue, 23 Dec 2025 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477203; cv=none; b=rWEwkJgr7wrJj3u/5AgUvZN+vBXR+6RGdPDT6sNzxg/If4QAdmo3s3Al9bsqwY/LmUGSTqNZRs05zvBdxEMhAq2XIifaUGwaN2y4uQrtfkmHxFJXhLBhtimfrRs+9ZXsy8f/e2ibRUi5mX0mrKvM57+sGnyWQvEtDkSlsW7IO7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477203; c=relaxed/simple;
	bh=7r8cMcFUbks3jEu1KT5WilPmKDYxhwDdwyft8WEDieU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBwMGIjE0ohX+alF35OyhncL4BE+axwbK/ZuDIcuQSorh2Qn+366jZ9b2EHTnh4nCx4yrFheHtEZK12c5goOB9gKfw+gsB0coHk5NlFKQgzBYLuejPC9YFfb7o1RenCiWOHWj3xj3z3zhESY25mMsqg36pPBU2fxGdleE280i18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562BCC113D0;
	Tue, 23 Dec 2025 08:06:41 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 3/7] irqchip/loongson-eiointc: Adjust irqchip driver for 32BIT/64BIT
Date: Tue, 23 Dec 2025 16:04:33 +0800
Message-ID: <20251223080437.3367240-4-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223080437.3367240-1-chenhuacai@loongson.cn>
References: <20251223080437.3367240-1-chenhuacai@loongson.cn>
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

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 36 +++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index ad2105685b48..e2eb4cd27f78 100644
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
+#ifdef CONFIG_MACH_LOONGSON64
 	uint64_t misc;
 
 	misc = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
 	misc |= IOCSR_MISC_FUNC_EXT_IOI_EN;
 	iocsr_write64(misc, LOONGARCH_IOCSR_MISC_FUNC);
+#endif
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

