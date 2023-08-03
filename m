Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EEA1DDEB
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 11:30:21 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.245])
	by gateway (Coremail) with SMTP id _____8Dxl+jMj8tkKK0PAA--.445S3;
	Thu, 03 Aug 2023 19:30:20 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXSPJj8tkgx5HAA--.33765S5;
	Thu, 03 Aug 2023 19:30:20 +0800 (CST)
From: Feiyang Chen <chenfeiyang@loongson.cn>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	chenhuacai@loongson.cn
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	linux@armlinux.org.uk,
	dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn,
	netdev@vger.kernel.org,
	loongarch@lists.linux.dev,
	chris.chenfeiyang@gmail.com
Subject: [PATCH v3 11/16] net: stmmac: dwmac-loongson: Refactor code for loongson_dwmac_probe()
Date: Thu,  3 Aug 2023 19:30:05 +0800
Message-Id: <ab0697a17cee6594bb9bbd72a151966a69c2efc0.1691047285.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1691047285.git.chenfeiyang@loongson.cn>
References: <cover.1691047285.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxXSPJj8tkgx5HAA--.33765S5
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jr1UtFWUAr1ktr1UXr4UKFX_yoW7Cr47p3
	yfCasIgrWftry29an5Zr4DZFyYyrWjy3yIgr42kwn7Wa4qyrW0qFyIgFWjyF97ArWkWw17
	X3WUKr48WF4DJrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzCJPUUUUU=

Add a setup() function to initialize data, and simplify code for
loongson_dwmac_probe().

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 89 +++++++++++--------
 1 file changed, 54 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index a25c187d3185..ff4fa74d2a11 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -9,7 +9,12 @@
 #include <linux/of_irq.h>
 #include "stmmac.h"
 
-static int loongson_default_data(struct plat_stmmacenet_data *plat)
+struct stmmac_pci_info {
+	int (*setup)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat);
+};
+
+static void loongson_default_data(struct pci_dev *pdev,
+				  struct plat_stmmacenet_data *plat)
 {
 	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
 	plat->has_gmac = 1;
@@ -34,23 +39,38 @@ static int loongson_default_data(struct plat_stmmacenet_data *plat)
 
 	/* Disable RX queues routing by default */
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
+}
+
+static int loongson_gmac_data(struct pci_dev *pdev,
+			      struct plat_stmmacenet_data *plat)
+{
+	loongson_default_data(pdev, plat);
+
+	plat->multicast_filter_bins = 256;
+
+	plat->mdio_bus_data->phy_mask = 0;
 
-	/* Default to phy auto-detection */
 	plat->phy_addr = -1;
+	plat->phy_interface = PHY_INTERFACE_MODE_RGMII_ID;
 
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
 
-	plat->multicast_filter_bins = 256;
 	return 0;
 }
 
-static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+static struct stmmac_pci_info loongson_gmac_pci_info = {
+	.setup = loongson_gmac_data,
+};
+
+static int loongson_dwmac_probe(struct pci_dev *pdev,
+				const struct pci_device_id *id)
 {
+	int ret, i, bus_id, phy_mode;
 	struct plat_stmmacenet_data *plat;
+	struct stmmac_pci_info *info;
 	struct stmmac_resources res;
 	struct device_node *np;
-	int ret, i, phy_mode;
 
 	np = dev_of_node(&pdev->dev);
 
@@ -59,39 +79,32 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		return -ENODEV;
 	}
 
-	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
-		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
-		return -ENODEV;
-	}
-
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
 		return -ENOMEM;
 
+	plat->mdio_bus_data = devm_kzalloc(&pdev->dev,
+					   sizeof(*plat->mdio_bus_data),
+					   GFP_KERNEL);
+	if (!plat->mdio_bus_data)
+		return -ENOMEM;
+
+	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
+				     GFP_KERNEL);
+	if (!plat->dma_cfg)
+		return -ENOMEM;
+
 	plat->mdio_node = of_get_child_by_name(np, "mdio");
 	if (plat->mdio_node) {
 		dev_info(&pdev->dev, "Found MDIO subnode\n");
-
-		plat->mdio_bus_data = devm_kzalloc(&pdev->dev,
-						   sizeof(*plat->mdio_bus_data),
-						   GFP_KERNEL);
-		if (!plat->mdio_bus_data) {
-			ret = -ENOMEM;
-			goto err_put_node;
-		}
 		plat->mdio_bus_data->needs_reset = true;
 	}
 
-	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
-	if (!plat->dma_cfg) {
-		ret = -ENOMEM;
-		goto err_put_node;
-	}
-
 	/* Enable pci device */
 	ret = pci_enable_device(pdev);
 	if (ret) {
-		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n", __func__);
+		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n",
+			__func__);
 		goto err_put_node;
 	}
 
@@ -105,9 +118,16 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		break;
 	}
 
-	plat->bus_id = of_alias_get_id(np, "ethernet");
-	if (plat->bus_id < 0)
-		plat->bus_id = pci_dev_id(pdev);
+	pci_set_master(pdev);
+
+	info = (struct stmmac_pci_info *)id->driver_data;
+	ret = info->setup(pdev, plat);
+	if (ret)
+		goto err_disable_device;
+
+	bus_id = of_alias_get_id(np, "ethernet");
+	if (bus_id >= 0)
+		plat->bus_id = bus_id;
 
 	phy_mode = device_get_phy_mode(&pdev->dev);
 	if (phy_mode < 0) {
@@ -115,14 +135,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		ret = phy_mode;
 		goto err_disable_device;
 	}
-
 	plat->phy_interface = phy_mode;
-	plat->interface = PHY_INTERFACE_MODE_GMII;
 
-	pci_set_master(pdev);
-
-	loongson_default_data(plat);
 	pci_enable_msi(pdev);
+
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
 
@@ -135,7 +151,8 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 
 	res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
 	if (res.wol_irq < 0) {
-		dev_info(&pdev->dev, "IRQ eth_wake_irq not found, using macirq\n");
+		dev_info(&pdev->dev,
+			 "IRQ eth_wake_irq not found, using macirq\n");
 		res.wol_irq = res.irq;
 	}
 
@@ -219,8 +236,10 @@ static int __maybe_unused loongson_dwmac_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(loongson_dwmac_pm_ops, loongson_dwmac_suspend,
 			 loongson_dwmac_resume);
 
+#define PCI_DEVICE_ID_LOONGSON_GMAC	0x7a03
+
 static const struct pci_device_id loongson_dwmac_id_table[] = {
-	{ PCI_VDEVICE(LOONGSON, 0x7a03) },
+	{ PCI_DEVICE_DATA(LOONGSON, GMAC, &loongson_gmac_pci_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, loongson_dwmac_id_table);
-- 
2.39.3

