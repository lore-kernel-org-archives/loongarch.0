Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F8530215F
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322556; cv=none; b=mCadG4WB7k8Ptj08QgAXToqg1Ux6fMcQlYLh+oNoe+OU/t4re3Ga/RWBYFzKn/zXvrcBxn+0Y5v/TGXsg+lel8XPDdncotIZeQHnOn84cZRZZYYnGuqy/4S4/moocQzbjad0OoEYpeUf+v98thyhdHMYEQajXo6jOMZl/nCNfX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322556; c=relaxed/simple;
	bh=0bkBUmx97QCJuRrNjTkHuif5W//TZyFWDqBdkm9fmcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MO4e1VZeXGUvwsIrAGWZkIX4KbE/9OoG8gLEkWroSH+jZluMKiQTRQYJ7WBoFpOE5ToQEGEHdQYIz7XgRc+E3I7ESePFANGzwaNFaxNCDle2mVVqy4acPUo9rJZtuwo9578H9pYGr62hJdDKJgOuT6FBrI2/ltueusWVaDw5XyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8CxrtPubClpPg8pAA--.18069S3;
	Fri, 28 Nov 2025 17:35:42 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by front1 (Coremail) with SMTP id qMiowJCx2sDtbClpo+xBAQ--.23356S3;
	Fri, 28 Nov 2025 17:35:42 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] LongArch: KVM: Add some maccros for AVEC
Date: Fri, 28 Nov 2025 17:11:22 +0800
Message-Id: <20251128091125.2720148-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20251128091125.2720148-1-gaosong@loongson.cn>
References: <20251128091125.2720148-1-gaosong@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx2sDtbClpo+xBAQ--.23356S3
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

