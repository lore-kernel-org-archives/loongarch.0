Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8C23BF
	for <loongarch@lists.linux.dev>; Thu, 20 Oct 2022 07:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D01C433D6;
	Thu, 20 Oct 2022 07:39:03 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 4/4] irqchip/loongson-pch-lpc: Add suspend/resume support
Date: Thu, 20 Oct 2022 15:35:27 +0800
Message-Id: <20221020073527.541845-5-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221020073527.541845-1-chenhuacai@loongson.cn>
References: <20221020073527.541845-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add suspend/resume support for PCH-LPC irqchip, which is needed for
upcoming suspend/hibernation.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-pch-lpc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index bf2324910a75..9b35492fb6be 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -13,6 +13,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/syscore_ops.h>
 
 /* Registers */
 #define LPC_INT_CTL		0x00
@@ -34,6 +35,7 @@ struct pch_lpc {
 	u32			saved_reg_pol;
 };
 
+static struct pch_lpc *pch_lpc_priv;
 struct fwnode_handle *pch_lpc_handle;
 
 static void lpc_irq_ack(struct irq_data *d)
@@ -147,6 +149,26 @@ static int pch_lpc_disabled(struct pch_lpc *priv)
 			(readl(priv->base + LPC_INT_STS) == 0xffffffff);
 }
 
+static int pch_lpc_suspend(void)
+{
+	pch_lpc_priv->saved_reg_ctl = readl(pch_lpc_priv->base + LPC_INT_CTL);
+	pch_lpc_priv->saved_reg_ena = readl(pch_lpc_priv->base + LPC_INT_ENA);
+	pch_lpc_priv->saved_reg_pol = readl(pch_lpc_priv->base + LPC_INT_POL);
+	return 0;
+}
+
+static void pch_lpc_resume(void)
+{
+	writel(pch_lpc_priv->saved_reg_ctl, pch_lpc_priv->base + LPC_INT_CTL);
+	writel(pch_lpc_priv->saved_reg_ena, pch_lpc_priv->base + LPC_INT_ENA);
+	writel(pch_lpc_priv->saved_reg_pol, pch_lpc_priv->base + LPC_INT_POL);
+}
+
+static struct syscore_ops pch_lpc_syscore_ops = {
+	.suspend = pch_lpc_suspend,
+	.resume = pch_lpc_resume,
+};
+
 int __init pch_lpc_acpi_init(struct irq_domain *parent,
 					struct acpi_madt_lpc_pic *acpi_pchlpc)
 {
@@ -191,7 +213,10 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 	parent_irq = irq_create_fwspec_mapping(&fwspec);
 	irq_set_chained_handler_and_data(parent_irq, lpc_irq_dispatch, priv);
 
+	pch_lpc_priv = priv;
 	pch_lpc_handle = irq_handle;
+	register_syscore_ops(&pch_lpc_syscore_ops);
+
 	return 0;
 
 free_irq_handle:
-- 
2.31.1

