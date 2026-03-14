Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826624DD17
	for <loongarch@lists.linux.dev>; Sat, 14 Mar 2026 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773505750; cv=none; b=pa7xRjglbPVAbjmdYTR09TlvWCmjFVjVS4RwbRzYphOrmSkT17nqg941rmSnd5+nGevVneMoHmkRSj8W6MnAoHRDw2szGXjPEId5+bicOT57IJPOVVHvUOCkAv7bxO9YGXwH/gWloo8Cq2XLuonNA7sUD1he/A7CeShCm+bcEuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773505750; c=relaxed/simple;
	bh=YC/+ebm8Cqxl0znQ7rNNV5Z2iHbUcp/64cbcLw8aYLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jNqvsD8B7yGSkm45TJJIyMOztXTLPWx8R38R6bfFHVRkp9rtSlRJs7del74gGyyaEzAQIRCMKSLEiSACT2Umxsr1C+3ehbi87Iq5nxUZ0rGZ1XkR23WhFxaslfH6KJX2GZAF6imuhE3G60SpUBl+SWJnXacYw4ezdbJ8U/Jm2QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.43])
	by APP-03 (Coremail) with SMTP id rQCowAB3ktmwjLVpHpqpCg--.41252S6;
	Sun, 15 Mar 2026 00:28:57 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 4/8] irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACPI init
Date: Sun, 15 Mar 2026 00:28:24 +0800
Message-ID: <20260314162828.1055188-5-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3ktmwjLVpHpqpCg--.41252S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1xAF1rZr48JFW5AF15twb_yoWrXrWfpF
	W5Xa42vF45JF4jgw1kA3WDZ3y3Aw1fKayUAFWfC34xJrnF9r1vkF10y3WDZF4fArW5WF45
	Zr4vv3W8CrnxAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUOyIUUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

A lot of code could be shared between the current ACPI init flow with
the possible OF init flow.

Extract it to a dedicated function.

The re-ordering of parent interrupt acquisition requires the
architecture code to reserve legacy interrupts from the dynamic
allocation by overriding arch_dynirq_lower_bound(), otherwise the parent
of LPC irqchip will be allocated to the intended static range of LPC
interrupts, which leads to allocation failure of LPC interrupts.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Tested-by: Yao Zi <me@ziyao.cc>
---
 drivers/irqchip/irq-loongson-pch-lpc.c | 52 ++++++++++++++++----------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 3ad46ec94e3c0..38d05135d2a7c 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -175,13 +175,10 @@ static struct syscore pch_lpc_syscore = {
 	.ops = &pch_lpc_syscore_ops,
 };
 
-int __init pch_lpc_acpi_init(struct irq_domain *parent,
-					struct acpi_madt_lpc_pic *acpi_pchlpc)
+static int __init pch_lpc_init(phys_addr_t addr, unsigned long size,
+			       struct fwnode_handle *irq_handle, int parent_irq)
 {
-	int parent_irq;
 	struct pch_lpc *priv;
-	struct irq_fwspec fwspec;
-	struct fwnode_handle *irq_handle;
 
 	priv = kzalloc_obj(*priv);
 	if (!priv)
@@ -189,7 +186,7 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 
 	raw_spin_lock_init(&priv->lpc_lock);
 
-	priv->base = ioremap(acpi_pchlpc->address, acpi_pchlpc->size);
+	priv->base = ioremap(addr, size);
 	if (!priv->base)
 		goto free_priv;
 
@@ -198,12 +195,6 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 		goto iounmap_base;
 	}
 
-	irq_handle = irq_domain_alloc_named_fwnode("lpcintc");
-	if (!irq_handle) {
-		pr_err("Unable to allocate domain handle\n");
-		goto iounmap_base;
-	}
-
 	/*
 	 * The LPC interrupt controller is a legacy i8259-compatible device,
 	 * which requires a static 1:1 mapping for IRQs 0-15.
@@ -213,15 +204,10 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 						    &pch_lpc_domain_ops, priv);
 	if (!priv->lpc_domain) {
 		pr_err("Failed to create IRQ domain\n");
-		goto free_irq_handle;
+		goto iounmap_base;
 	}
 	pch_lpc_reset(priv);
 
-	fwspec.fwnode = parent->fwnode;
-	fwspec.param[0] = acpi_pchlpc->cascade + GSI_MIN_PCH_IRQ;
-	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
-	fwspec.param_count = 2;
-	parent_irq = irq_create_fwspec_mapping(&fwspec);
 	irq_set_chained_handler_and_data(parent_irq, lpc_irq_dispatch, priv);
 
 	pch_lpc_priv = priv;
@@ -230,8 +216,6 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 
 	return 0;
 
-free_irq_handle:
-	irq_domain_free_fwnode(irq_handle);
 iounmap_base:
 	iounmap(priv->base);
 free_priv:
@@ -239,3 +223,31 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 
 	return -ENOMEM;
 }
+
+int __init pch_lpc_acpi_init(struct irq_domain *parent, struct acpi_madt_lpc_pic *acpi_pchlpc)
+{
+	struct fwnode_handle *irq_handle;
+	struct irq_fwspec fwspec;
+	int parent_irq, ret;
+
+	irq_handle = irq_domain_alloc_named_fwnode("lpcintc");
+	if (!irq_handle) {
+		pr_err("Unable to allocate domain handle\n");
+		return -ENOMEM;
+	}
+
+	fwspec.fwnode = parent->fwnode;
+	fwspec.param[0] = acpi_pchlpc->cascade + GSI_MIN_PCH_IRQ;
+	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
+	fwspec.param_count = 2;
+	parent_irq = irq_create_fwspec_mapping(&fwspec);
+
+	ret = pch_lpc_init(acpi_pchlpc->address, acpi_pchlpc->size,
+			   irq_handle, parent_irq);
+	if (ret) {
+		irq_domain_free_fwnode(irq_handle);
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.52.0

