Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661C52DE6F9
	for <loongarch@lists.linux.dev>; Sat,  6 Dec 2025 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765005099; cv=none; b=pZwpzEHWmy7Ssm/JRBa3MPF8+T6ZCo6P6Y5iEDuOWCrny5V41yWkurXiKEOKuMOwAR5W2lvvQZgCc8fCtbuSo7haqdTi6IHB66lENPepUI2hKOqRCMYSo0xpxTSSAZpu/dB5IExSxJ/SXK27dODTsV67XGEFSWbxE5Tin8d/9pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765005099; c=relaxed/simple;
	bh=0bkBUmx97QCJuRrNjTkHuif5W//TZyFWDqBdkm9fmcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nYQCXhpjE6wU6x2cQEfgZYPf6KA3HPGWKmdRNKAiGSO54n/R/Aoz5tzJgTOr4/uK98HP+VN1CP7NOCuQsFEddOHv47aReD2H1ZdhhhCH64u+VqzxvwPyAQ7mlxOaeDCwZrrIcCEzmpFz9zIevPrYrzqlmAjtVsj6FCF1pEK4mXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8BxWNEb1zNp77MrAA--.28924S3;
	Sat, 06 Dec 2025 15:11:23 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by front1 (Coremail) with SMTP id qMiowJCx2sAX1zNpmFZGAQ--.33246S3;
	Sat, 06 Dec 2025 15:11:22 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	lixianglai@loongson.cn
Subject: [PATCH v3 1/4] LongArch: KVM: Add some maccros for AVEC
Date: Sat,  6 Dec 2025 14:46:55 +0800
Message-Id: <20251206064658.714100-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20251206064658.714100-1-gaosong@loongson.cn>
References: <20251206064658.714100-1-gaosong@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx2sAX1zNpmFZGAQ--.33246S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Add some maccros for AVEC interrupt controller, so the dintc can use
those maccros.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 arch/loongarch/include/asm/irq.h     | 8 ++++++++
 drivers/irqchip/irq-loongarch-avec.c | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/irq.h b/arch/loongarch/include/asm/irq.h
index 12bd15578c33..aaa022fcb9e3 100644
--- a/arch/loongarch/include/asm/irq.h
+++ b/arch/loongarch/include/asm/irq.h
@@ -50,6 +50,14 @@ void spurious_interrupt(void);
 #define NR_LEGACY_VECTORS	16
 #define IRQ_MATRIX_BITS		NR_VECTORS
 
+#define AVEC_VIRQ_SHIFT		4
+#define AVEC_VIRQ_BIT		8
+#define AVEC_VIRQ_MASK		GENMASK(AVEC_VIRQ_BIT - 1, 0)
+#define AVEC_CPU_SHIFT		12
+#define AVEC_CPU_BIT		16
+#define AVEC_CPU_MASK		GENMASK(AVEC_CPU_BIT - 1, 0)
+
+
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 void arch_trigger_cpumask_backtrace(const struct cpumask *mask, int exclude_cpu);
 
diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index bf52dc8345f5..f0118cfd4363 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -209,8 +209,9 @@ static void avecintc_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
 	struct avecintc_data *adata = irq_data_get_irq_chip_data(d);
 
 	msg->address_hi = 0x0;
-	msg->address_lo = (loongarch_avec.msi_base_addr | (adata->vec & 0xff) << 4)
-			  | ((cpu_logical_map(adata->cpu & 0xffff)) << 12);
+	msg->address_lo = (loongarch_avec.msi_base_addr |
+			(adata->vec & AVEC_VIRQ_MASK) << AVEC_VIRQ_SHIFT) |
+			((cpu_logical_map(adata->cpu & AVEC_CPU_MASK)) << AVEC_CPU_SHIFT);
 	msg->data = 0x0;
 }
 
-- 
2.39.3

