Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6400816DEA9
	for <loongarch@lists.linux.dev>; Tue, 13 Aug 2024 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539264; cv=none; b=s98kaUwq+1TRoeGC0CRI/hAgshwsvdwR49y1V9tA9m2HCqnoPGaJHDptoM9TXRCKmaAj4qgIleQLGd8YTEx7fjq+sqy6qVwCGayGMg/o/LPtzg1ny3cG4d0srUffv5ZW/cZEbkqHKz+Ey09CfpPEjOLMag/w1GEyagNJAUjzFfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539264; c=relaxed/simple;
	bh=99qHv74OASxAlC3ZKG47sDwra5wLJQY/UxW60bDJNYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m0py9Pd3eOf8HJT6D8k43Z3sA4hg+o6mZLL/poDEFka/bvbFuCnvAFCpv0gXIGdLAKOXs1ruqcnnQKlB77X+W2L14uhqmYowZCMEr0UK+1kFuLfwD26Z738XTfjRpC91y1mqJVxdyejJCXpFYU44oEM+bnf+k6vEB8Lk7LW/B5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8Dxi+o6H7tmVB0SAA--.45378S3;
	Tue, 13 Aug 2024 16:54:18 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMCxA+I6H7tmKfURAA--.19540S2;
	Tue, 13 Aug 2024 16:54:18 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: corbet@lwn.net,
	alexs@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	gaoliang@loongson.cn,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	zhangtianyang@loongson.cn,
	yijun@loongson.cn,
	mhocko@suse.com,
	akpm@linux-foundation.org,
	dianders@chromium.org,
	maobibo@loongson.cn,
	xry111@xry111.site,
	zhaotianrui@loongson.cn,
	nathan@kernel.org,
	yangtiezhu@loongson.cn,
	zhoubinbin@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH Loongarch-avec support V9 1/2] irqchip/loongson-pch-msi: Switch to MSI parent domains
Date: Tue, 13 Aug 2024 16:54:15 +0800
Message-Id: <20240813085415.20035-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxA+I6H7tmKfURAA--.19540S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAryxAryrKr1xXFyUXw43urX_yoWrAw4fpF
	W3u342vrW8Aay8ZFZ7GwnrZFy3Cas3tFWUta1fGw1ftry8Zw1vgF1DtF42krWYyFWkGryD
	Aa18Jr4Dua1DGFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxUc0eHDUUUU

From: Huacai Chen <chenhuacai@loongson.cn>

Now remove the global PCI/MSI irqdomain implementation and provide the
required MSI parent functionality by filling in msi_parent_ops, so the
PCI/MSI code can detect the new parent and setup per-device MSI domains.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/Kconfig                |  1 +
 drivers/irqchip/irq-loongson-pch-msi.c | 58 ++++++++++----------------
 2 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index d078bdc48c38..341cd9ca5a05 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -685,6 +685,7 @@ config LOONGSON_PCH_MSI
 	depends on PCI
 	default MACH_LOONGSON64
 	select IRQ_DOMAIN_HIERARCHY
+	select IRQ_MSI_LIB
 	select PCI_MSI
 	help
 	  Support for the Loongson PCH MSI Controller.
diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index dd4d699170f4..2242f63c66fc 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -15,6 +15,8 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 
+#include "irq-msi-lib.h"
+
 static int nr_pics;
 
 struct pch_msi_data {
@@ -27,26 +29,6 @@ struct pch_msi_data {
 
 static struct fwnode_handle *pch_msi_handle[MAX_IO_PICS];
 
-static void pch_msi_mask_msi_irq(struct irq_data *d)
-{
-	pci_msi_mask_irq(d);
-	irq_chip_mask_parent(d);
-}
-
-static void pch_msi_unmask_msi_irq(struct irq_data *d)
-{
-	irq_chip_unmask_parent(d);
-	pci_msi_unmask_irq(d);
-}
-
-static struct irq_chip pch_msi_irq_chip = {
-	.name			= "PCH PCI MSI",
-	.irq_mask		= pch_msi_mask_msi_irq,
-	.irq_unmask		= pch_msi_unmask_msi_irq,
-	.irq_ack		= irq_chip_ack_parent,
-	.irq_set_affinity	= irq_chip_set_affinity_parent,
-};
-
 static int pch_msi_allocate_hwirq(struct pch_msi_data *priv, int num_req)
 {
 	int first;
@@ -85,12 +67,6 @@ static void pch_msi_compose_msi_msg(struct irq_data *data,
 	msg->data = data->hwirq;
 }
 
-static struct msi_domain_info pch_msi_domain_info = {
-	.flags	= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
-	.chip	= &pch_msi_irq_chip,
-};
-
 static struct irq_chip middle_irq_chip = {
 	.name			= "PCH MSI",
 	.irq_mask		= irq_chip_mask_parent,
@@ -155,13 +131,31 @@ static void pch_msi_middle_domain_free(struct irq_domain *domain,
 static const struct irq_domain_ops pch_msi_middle_domain_ops = {
 	.alloc	= pch_msi_middle_domain_alloc,
 	.free	= pch_msi_middle_domain_free,
+	.select	= msi_lib_irq_domain_select,
+};
+
+#define PCH_MSI_FLAGS_REQUIRED  (MSI_FLAG_USE_DEF_DOM_OPS |	\
+				 MSI_FLAG_USE_DEF_CHIP_OPS |	\
+				 MSI_FLAG_PCI_MSI_MASK_PARENT)
+
+#define PCH_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |	\
+				 MSI_FLAG_PCI_MSIX      |	\
+				 MSI_FLAG_MULTI_PCI_MSI)
+
+static struct msi_parent_ops pch_msi_parent_ops = {
+	.required_flags		= PCH_MSI_FLAGS_REQUIRED,
+	.supported_flags	= PCH_MSI_FLAGS_SUPPORTED,
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.prefix			= "PCH-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
 static int pch_msi_init_domains(struct pch_msi_data *priv,
 				struct irq_domain *parent,
 				struct fwnode_handle *domain_handle)
 {
-	struct irq_domain *middle_domain, *msi_domain;
+	struct irq_domain *middle_domain;
 
 	middle_domain = irq_domain_create_hierarchy(parent, 0, priv->num_irqs,
 						    domain_handle,
@@ -174,14 +168,8 @@ static int pch_msi_init_domains(struct pch_msi_data *priv,
 
 	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
 
-	msi_domain = pci_msi_create_irq_domain(domain_handle,
-					       &pch_msi_domain_info,
-					       middle_domain);
-	if (!msi_domain) {
-		pr_err("Failed to create PCI MSI domain\n");
-		irq_domain_remove(middle_domain);
-		return -ENOMEM;
-	}
+	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
+	middle_domain->msi_parent_ops = &pch_msi_parent_ops;
 
 	return 0;
 }
-- 
2.20.1

