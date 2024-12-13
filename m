Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D180E15F41F
	for <loongarch@lists.linux.dev>; Fri, 13 Dec 2024 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734061840; cv=none; b=gz/l7ZK/uDydfnhryYq+t+VdiSkb0mX6z75oDFfe0j3C0OL0pqYVc4OafqIolzHSTeqTXNdM15/U/G6bWXYACJKOjePGgJ0LEWD/zLOkRWC7Eq+S8rnUKxOvDFSdYTmfPBZpnuCGj5FPKYHJNk+sDMGaJYasQfPXymBjbGUrwtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734061840; c=relaxed/simple;
	bh=e8Vjb9jS5Fr6B5xBe93FB8ZBrvA5lsk+WslJjxoMPn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IMwoVvhi9UtRs+JKVsrXTJ8CBDxwgSuFlbmmc9k2AJsR2w0WkOx7ZqSuKB2o+kktEleeIIOiTOVRg8Zn4qAtWnof7vIFiFA33JhVDuBHf8NlpZuzGu+J2mbzolI4VAzSgrzNPipWiFY58gsc0UDC8VRUo/GUc1qWHbUs5/DrawI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxG+IFr1tnNXBWAA--.36938S3;
	Fri, 13 Dec 2024 11:50:29 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMBxP+EDr1tnV3WBAA--.53391S3;
	Fri, 13 Dec 2024 11:50:28 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v3 1/2] irqchip/loongson-eiointc: Route interrupt parsed from bios table
Date: Fri, 13 Dec 2024 11:50:25 +0800
Message-Id: <20241213035026.1643517-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20241213035026.1643517-1-maobibo@loongson.cn>
References: <20241213035026.1643517-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxP+EDr1tnV3WBAA--.53391S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Interrupt controller eiointc routes irq to cpu interface IP0 - IP7,
now it is hard-coded that eiointc routes irq to CPU started from IP1,
however with function irq_create_mapping() parameter parent hwirq
uses irq parsed from ACPI or DTS table.

Routed interrupt pin need be the consistent with parent hwirq.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index bb79e19dfb59..72979f9f0e05 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -68,6 +68,7 @@ struct eiointc_priv {
 	struct fwnode_handle	*domain_handle;
 	struct irq_domain	*eiointc_domain;
 	int			flags;
+	irq_hw_number_t		parent_hwirq;
 };
 
 static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
@@ -211,7 +212,12 @@ static int eiointc_router_init(unsigned int cpu)
 		}
 
 		for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
-			bit = BIT(1 + index); /* Route to IP[1 + index] */
+			/*
+			 * Route to interrupt pin, relative offset used here
+			 * Offset 0 means routing to IP0 and so on
+			 * Every 32 vector routing to one interrupt pin
+			 */
+			bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
 			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
 			iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
 		}
@@ -495,7 +501,7 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 
 	priv->vec_count = VEC_COUNT;
 	priv->node = acpi_eiointc->node;
-
+	priv->parent_hwirq = acpi_eiointc->cascade;
 	parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
 
 	ret = eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
@@ -529,6 +535,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 {
 	int parent_irq, ret;
 	struct eiointc_priv *priv;
+	struct irq_data *irq_data;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -544,6 +551,12 @@ static int __init eiointc_of_init(struct device_node *of_node,
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
@@ -555,7 +568,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 
 	priv->node = 0;
 	priv->domain_handle = of_node_to_fwnode(of_node);
-
+	priv->parent_hwirq = irqd_to_hwirq(irq_data);
 	ret = eiointc_init(priv, parent_irq, 0);
 	if (ret < 0)
 		goto out_free_priv;
-- 
2.39.3

