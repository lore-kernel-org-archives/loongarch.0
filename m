Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41093946D
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 09:41:02 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8CxfOqsguRkBOAaAA--.27914S3;
	Tue, 22 Aug 2023 17:41:00 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxrM6pguRkkDVgAA--.38101S4;
	Tue, 22 Aug 2023 17:40:59 +0800 (CST)
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
	guyinggang@loongson.cn,
	siyanteng@loongson.cn,
	loongson-kernel@lists.loongnix.cn,
	netdev@vger.kernel.org,
	loongarch@lists.linux.dev,
	chris.chenfeiyang@gmail.com
Subject: [PATCH v4 06/11] net: stmmac: dwmac-loongson: Add LS7A support
Date: Tue, 22 Aug 2023 17:40:55 +0800
Message-Id: <d528fade56b507e4729895afb6d7655695a1c7dd.1692696115.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1692696115.git.chenfeiyang@loongson.cn>
References: <cover.1692696115.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxrM6pguRkkDVgAA--.38101S4
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFy5Kr1kWFWrJw13tF4kXwc_yoWrWFWfpa
	yfAFyaqr95Wry2gan5ZFWUX3WY9rW29348G3y2k34fuFWYvr4Yqr15tryjvFyxAFZ5C3ya
	gryjgFWvgF4Du3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4X_-DUUUU

Current dwmac-loongson only support LS2K in the "probed with PCI
and configured with DT" manner. Add LS7A support on which the
devices are fully PCI (non-DT).

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 81 ++++++++++---------
 1 file changed, 44 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ff4fa74d2a11..dd7e9f262ca6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -16,8 +16,12 @@ struct stmmac_pci_info {
 static void loongson_default_data(struct pci_dev *pdev,
 				  struct plat_stmmacenet_data *plat)
 {
+	/* Get bus_id, this can be overloaded later */
+	plat->bus_id = (pci_domain_nr(pdev->bus) << 16) |
+		       PCI_DEVID(pdev->bus->number, pdev->devfn);
+
 	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
-	plat->has_gmac = 1;
+	plat->has_egmac = 1;
 	plat->force_sf_dma_mode = 1;
 
 	/* Set default value for multicast hash bins */
@@ -56,6 +60,9 @@ static int loongson_gmac_data(struct pci_dev *pdev,
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
 
+	plat->clk_ref_rate = 125000000;
+	plat->clk_ptp_rate = 125000000;
+
 	return 0;
 }
 
@@ -72,13 +79,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev,
 	struct stmmac_resources res;
 	struct device_node *np;
 
-	np = dev_of_node(&pdev->dev);
-
-	if (!np) {
-		pr_info("dwmac_loongson_pci: No OF node\n");
-		return -ENODEV;
-	}
-
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
 		return -ENOMEM;
@@ -94,6 +94,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev,
 	if (!plat->dma_cfg)
 		return -ENOMEM;
 
+	np = dev_of_node(&pdev->dev);
 	plat->mdio_node = of_get_child_by_name(np, "mdio");
 	if (plat->mdio_node) {
 		dev_info(&pdev->dev, "Found MDIO subnode\n");
@@ -125,42 +126,48 @@ static int loongson_dwmac_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_disable_device;
 
-	bus_id = of_alias_get_id(np, "ethernet");
-	if (bus_id >= 0)
-		plat->bus_id = bus_id;
+	if (np) {
+		bus_id = of_alias_get_id(np, "ethernet");
+		if (bus_id >= 0)
+			plat->bus_id = bus_id;
 
-	phy_mode = device_get_phy_mode(&pdev->dev);
-	if (phy_mode < 0) {
-		dev_err(&pdev->dev, "phy_mode not found\n");
-		ret = phy_mode;
-		goto err_disable_device;
+		phy_mode = device_get_phy_mode(&pdev->dev);
+		if (phy_mode < 0) {
+			dev_err(&pdev->dev, "phy_mode not found\n");
+			ret = phy_mode;
+			goto err_disable_device;
+		}
+		plat->phy_interface = phy_mode;
 	}
-	plat->phy_interface = phy_mode;
 
 	pci_enable_msi(pdev);
 
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
-
-	res.irq = of_irq_get_byname(np, "macirq");
-	if (res.irq < 0) {
-		dev_err(&pdev->dev, "IRQ macirq not found\n");
-		ret = -ENODEV;
-		goto err_disable_msi;
-	}
-
-	res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
-	if (res.wol_irq < 0) {
-		dev_info(&pdev->dev,
-			 "IRQ eth_wake_irq not found, using macirq\n");
-		res.wol_irq = res.irq;
-	}
-
-	res.lpi_irq = of_irq_get_byname(np, "eth_lpi");
-	if (res.lpi_irq < 0) {
-		dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
-		ret = -ENODEV;
-		goto err_disable_msi;
+	if (np) {
+		res.irq = of_irq_get_byname(np, "macirq");
+		if (res.irq < 0) {
+			dev_err(&pdev->dev, "IRQ macirq not found\n");
+			ret = -ENODEV;
+			goto err_disable_msi;
+		}
+
+		res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
+		if (res.wol_irq < 0) {
+			dev_info(&pdev->dev,
+				 "IRQ eth_wake_irq not found, using macirq\n");
+			res.wol_irq = res.irq;
+		}
+
+		res.lpi_irq = of_irq_get_byname(np, "eth_lpi");
+		if (res.lpi_irq < 0) {
+			dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
+			ret = -ENODEV;
+			goto err_disable_msi;
+		}
+	} else {
+		res.irq = pdev->irq;
+		res.wol_irq = pdev->irq;
 	}
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
-- 
2.39.3

