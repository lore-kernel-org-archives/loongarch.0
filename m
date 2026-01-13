Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C599E3806CE;
	Tue, 13 Jan 2026 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294837; cv=none; b=BLhF+ZZ+YZwm0WlJzMYJKg5RoePGLL3I5DtlvMnbPx7Os2/32J0RGtB3J62d9Vi7j8u38CDiTHOU7P1GCc6hqyIX8IbN1J/NZSENLIFbiRqQg11LIxqyzHIKRrIUok99U5r0gzPYSEi2b0c2UuVfnlAAz3YBHOlCZfdi1cPN8/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294837; c=relaxed/simple;
	bh=q0CZF+CNg4Eo07tB77hWIOdhlAl3OZt8QEIqL+xObvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+1GhhNaWL5C6WAY2EWgWX6ZLVXExJ/v7QkMEjrka0AcJMpZVlYMMhOiOnVQHlH6ESVl4U7/rDeXGqR61fWT3JOtvAZWu/lC4mG7NbiSnTqXYgHyz3u0tNyFu9OQj6E+PdHBNeeeROHfVnjzCehYTexMEy1i5OQLtLQnV0xu/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D825BC19424;
	Tue, 13 Jan 2026 09:00:35 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V3 1/7] irqchip/loongarch-avec: Adjust irqchip driver for 32BIT/64BIT
Date: Tue, 13 Jan 2026 16:59:34 +0800
Message-ID: <20260113085940.3344837-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113085940.3344837-1-chenhuacai@loongson.cn>
References: <20260113085940.3344837-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

csr_read64() is only available on 64BIT LoongArch platform, so use
recently added adaptive csr_read() instead, so as to make the driver
work on both 32BIT and 64BIT platform.

BTW, make avecintc_enable() be a no-op since it is only needed by 64BIT
platform.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index ba556c008cf3..fb8efde95393 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -58,11 +58,13 @@ struct avecintc_data {
 
 static inline void avecintc_enable(void)
 {
+#ifdef CONFIG_MACH_LOONGSON64
 	u64 value;
 
 	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
 	value |= IOCSR_MISC_FUNC_AVEC_EN;
 	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
+#endif
 }
 
 static inline void avecintc_ack_irq(struct irq_data *d)
@@ -167,7 +169,7 @@ void complete_irq_moving(void)
 	struct pending_list *plist = this_cpu_ptr(&pending_list);
 	struct avecintc_data *adata, *tdata;
 	int cpu, vector, bias;
-	uint64_t isr;
+	unsigned long isr;
 
 	guard(raw_spinlock)(&loongarch_avec.lock);
 
@@ -177,16 +179,16 @@ void complete_irq_moving(void)
 		bias = vector / VECTORS_PER_REG;
 		switch (bias) {
 		case 0:
-			isr = csr_read64(LOONGARCH_CSR_ISR0);
+			isr = csr_read(LOONGARCH_CSR_ISR0);
 			break;
 		case 1:
-			isr = csr_read64(LOONGARCH_CSR_ISR1);
+			isr = csr_read(LOONGARCH_CSR_ISR1);
 			break;
 		case 2:
-			isr = csr_read64(LOONGARCH_CSR_ISR2);
+			isr = csr_read(LOONGARCH_CSR_ISR2);
 			break;
 		case 3:
-			isr = csr_read64(LOONGARCH_CSR_ISR3);
+			isr = csr_read(LOONGARCH_CSR_ISR3);
 			break;
 		}
 
@@ -234,7 +236,7 @@ static void avecintc_irq_dispatch(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 
 	while (true) {
-		unsigned long vector = csr_read64(LOONGARCH_CSR_IRR);
+		unsigned long vector = csr_read(LOONGARCH_CSR_IRR);
 		if (vector & IRR_INVALID_MASK)
 			break;
 
-- 
2.47.3

