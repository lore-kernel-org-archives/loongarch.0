Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08413210972
	for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235119; cv=none; b=EIZl+MIQgv4FApr4JJy9kC6kj75qZZvX3cMfeQLkYUix4Hu8qJQbuhHDDB4kZsQdTJ/R/9OVy/9WwW7WYMFRUKpc4jSMfQa3OHwDeW23mXhwSOIwE26tGWmo2R+z5fldHPWqYMJN09Hb1jI+KE+q52ckmebZWv7UmP23cZjvDQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235119; c=relaxed/simple;
	bh=nizlCHfbuoGImdFJM4bzVM7rc1oIMDc3cMJIQ6PswdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z9w0Jt0eKMyfEZS+vWqiAIheaQlBSn0dWqD3jEeaFkGvpPI3GijP5yUOiLpWNtpdHWQnG6YchY93fcQYec6iwhQYhmCHEcKwB//MmeDTW4yzf9pynXvG/maFnEBJ3SQBs/pdhhj8naba1zAn5qVeWauxst1WXlrsHX8R+Y9Zu5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxHJtqvcVm4RAbAA--.21643S3;
	Wed, 21 Aug 2024 18:11:54 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMAxouFqvcVm_oIcAA--.60915S3;
	Wed, 21 Aug 2024 18:11:54 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [RFC 1/2] irqchip/loongson-eiointc: Route interrupt parsed from acpi table
Date: Wed, 21 Aug 2024 18:11:52 +0800
Message-Id: <20240821101153.2262290-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240821101153.2262290-1-maobibo@loongson.cn>
References: <20240821101153.2262290-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxouFqvcVm_oIcAA--.60915S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Interrupt controller eiointc routes irq to cpu interface IP0 - IP7,
now it is hard-coded that eiointc routes irq to CPU started from IP1.
It can be parsed from acpi table, instead hwirq is used for function
irq_create_mapping() already, routed interrupt pin must be the same
with parent hwirq.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index b1f2080be2be..e9ec63d85ee8 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -42,6 +42,7 @@ struct eiointc_priv {
 	cpumask_t		cpuspan_map;
 	struct fwnode_handle	*domain_handle;
 	struct irq_domain	*eiointc_domain;
+	int			parent_hwirq;
 };
 
 static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
@@ -159,7 +160,12 @@ static int eiointc_router_init(unsigned int cpu)
 		}
 
 		for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
-			bit = BIT(1 + index); /* Route to IP[1 + index] */
+			/*
+			 * Route to interrupt pin, using offset minus INT_HWI0
+			 * Offset 0 means IP0 and so on
+			 * Every 32 vector routing to one interrupt pin
+			 */
+			bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
 			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
 			iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
 		}
@@ -424,7 +430,7 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 
 	priv->vec_count = VEC_COUNT;
 	priv->node = acpi_eiointc->node;
-
+	priv->parent_hwirq = acpi_eiointc->cascade;
 	parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
 
 	ret = eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
@@ -458,6 +464,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 {
 	int parent_irq, ret;
 	struct eiointc_priv *priv;
+	struct irq_data *irq_data;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -473,6 +480,12 @@ static int __init eiointc_of_init(struct device_node *of_node,
 	if (ret < 0)
 		goto out_free_priv;
 
+	irq_data = irq_get_irq_data(parent_irq);
+	if (!irq_data) {
+		ret = -ENODEV;
+		goto out_free_priv;
+	}
+
 	/*
 	 * In particular, the number of devices supported by the LS2K0500
 	 * extended I/O interrupt vector is 128.
@@ -484,7 +497,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 
 	priv->node = 0;
 	priv->domain_handle = of_node_to_fwnode(of_node);
-
+	priv->parent_hwirq = irqd_to_hwirq(irq_data);
 	ret = eiointc_init(priv, parent_irq, 0);
 	if (ret < 0)
 		goto out_free_priv;
-- 
2.39.3

