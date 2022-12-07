Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFFD8821
	for <loongarch@lists.linux.dev>; Wed,  7 Dec 2022 14:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C569FC43153;
	Wed,  7 Dec 2022 14:06:25 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH] irqchip/loongson-liointc: Save/restore int_edge/int_pol registers during S3/S4
Date: Wed,  7 Dec 2022 22:06:43 +0800
Message-Id: <20221207140643.1600743-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If int_edge/int_pol registers are configured to not be the default values, we
should save/restore them during S3/S4.

Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/irq-loongson-liointc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index c116f70929ae..4367ce9b558f 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -55,6 +55,8 @@ struct liointc_priv {
 	struct liointc_handler_data	handler[LIOINTC_NUM_PARENT];
 	void __iomem			*core_isr[LIOINTC_NUM_CORES];
 	u8				map_cache[LIOINTC_CHIP_IRQ];
+	u32				int_pol;
+	u32				int_edge;
 	bool				has_lpc_irq_errata;
 };
 
@@ -138,6 +140,14 @@ static int liointc_set_type(struct irq_data *data, unsigned int type)
 	return 0;
 }
 
+static void liointc_suspend(struct irq_chip_generic *gc)
+{
+	struct liointc_priv *priv = gc->private;
+
+	priv->int_pol = readl(gc->reg_base + LIOINTC_REG_INTC_POL);
+	priv->int_edge = readl(gc->reg_base + LIOINTC_REG_INTC_EDGE);
+}
+
 static void liointc_resume(struct irq_chip_generic *gc)
 {
 	struct liointc_priv *priv = gc->private;
@@ -150,6 +160,8 @@ static void liointc_resume(struct irq_chip_generic *gc)
 	/* Restore map cache */
 	for (i = 0; i < LIOINTC_CHIP_IRQ; i++)
 		writeb(priv->map_cache[i], gc->reg_base + i);
+	writel(priv->int_pol, gc->reg_base + LIOINTC_REG_INTC_POL);
+	writel(priv->int_edge, gc->reg_base + LIOINTC_REG_INTC_EDGE);
 	/* Restore mask cache */
 	writel(gc->mask_cache, gc->reg_base + LIOINTC_REG_INTC_ENABLE);
 	irq_gc_unlock_irqrestore(gc, flags);
@@ -261,6 +273,7 @@ static int liointc_init(phys_addr_t addr, unsigned long size, int revision,
 	gc->private = priv;
 	gc->reg_base = base;
 	gc->domain = domain;
+	gc->suspend = liointc_suspend;
 	gc->resume = liointc_resume;
 
 	ct = gc->chip_types;
-- 
2.31.1

