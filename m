Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E75342C80;
	Mon, 12 Jan 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207441; cv=none; b=ZpVOdX6hgQ85TbhVvq17EbEPAF29HssfTpIb0nSS6keDZvNXxmAFTRiICCd5E8GvZ+1MqLPUAyaxriZtUKRXPsLoVmtEqz9HooRu9ztrHjjDBv51q17541S1Jkp3ItqJs1jTFnWbVTRS469UuUzac3KXqkfpkeeEmmmPYJs0Wuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207441; c=relaxed/simple;
	bh=aKhduY20fT9Hpvr0jeldTUmtyfo5KwPrSMTVQGzYKtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LmZoeeTkhxoggkR3GIoaDjxWsKV8r3nXXmvEvZMkk07ZQJmhe/ZEl2g0D68R3YuMpZP4XBzAQu9ObeqgyLjzkwce2kphwLPVm634YyWtEXOsRUdgPQ5Y8KYeWeoVnNBQOd4JPAQgYiiO5qqbPWmBYEyTaZMRF63Scd5rkbsrrsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CDEC116D0;
	Mon, 12 Jan 2026 08:43:58 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 1/7] irqchip/loongarch-avec: Adjust irqchip driver for 32BIT/64BIT
Date: Mon, 12 Jan 2026 16:43:14 +0800
Message-ID: <20260112084320.1982244-2-chenhuacai@loongson.cn>
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

csr_read64() is only available on 64BIT LoongArch platform, so use
recently added adaptive csr_read() instead, so as to make the driver
work on both 32BIT and 64BIT platform.

BTW, make avecintc_enable() be a no-op since it is only needed by 64BIT
platform.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index ba556c008cf3..bd29bf4c07ed 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -58,11 +58,13 @@ struct avecintc_data {
 
 static inline void avecintc_enable(void)
 {
-	u64 value;
+	if (IS_ENABLED(CONFIG_MACH_LOONGSON64)) {
+		u64 value;
 
-	value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
-	value |= IOCSR_MISC_FUNC_AVEC_EN;
-	iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
+		value = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
+		value |= IOCSR_MISC_FUNC_AVEC_EN;
+		iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
+	}
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

