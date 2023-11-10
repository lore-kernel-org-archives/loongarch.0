Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4A0125B4
	for <loongarch@lists.linux.dev>; Fri, 10 Nov 2023 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8Bxd+iS901lQrQ4AA--.9860S3;
	Fri, 10 Nov 2023 17:27:46 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxK9yQ901l5_o9AA--.4030S3;
	Fri, 10 Nov 2023 17:27:46 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	fancer.lancer@gmail.com,
	Jose.Abreu@synopsys.com,
	chenhuacai@loongson.cn,
	linux@armlinux.org.uk,
	dongbiao@loongson.cn,
	guyinggang@loongson.cn,
	netdev@vger.kernel.org,
	loongarch@lists.linux.dev,
	chris.chenfeiyang@gmail.com
Subject: [PATCH v5 6/9] net: stmmac: dwmac-loongson: Add MSI support
Date: Fri, 10 Nov 2023 17:27:31 +0800
Message-Id: <7c42f8dc2c7dbd4cfd815f5c450888a5bca2ca5d.1699533745.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1699533745.git.siyanteng@loongson.cn>
References: <cover.1699533745.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxK9yQ901l5_o9AA--.4030S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jr15CFWDArW5XrW3Kr13Jrc_yoW7CFy3pr
	W3Aa4agryFgry3WaykZa1UXF1YyrW2v348trW2kw1S9ayYyr9YqF1rtFy2yryxCrZ5Cr43
	XFZ8KFW8ua1DCFbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUx5fQDUUUU

Request allocation for MSI for specific versions.

Some features of Loongson platforms are bound to the GMAC_VERSION
register. We have to read its value in order to get the correct channel
number.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 143 ++++++++++++++----
 1 file changed, 113 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 0d79104d7fd3..a23735371b35 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -11,8 +11,96 @@
 
 struct stmmac_pci_info {
 	int (*setup)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat);
+	int (*config)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat,
+		      struct stmmac_resources *res, struct device_node *np);
 };
 
+static u32 get_irq_type(struct device_node *np)
+{
+	struct of_phandle_args oirq;
+
+	if (np && of_irq_parse_one(np, 0, &oirq) == 0 && oirq.args_count == 2)
+		return oirq.args[1];
+
+	return IRQF_TRIGGER_RISING;
+}
+
+static int loongson_dwmac_config_legacy(struct pci_dev *pdev,
+					    struct plat_stmmacenet_data *plat,
+					    struct stmmac_resources *res,
+					    struct device_node *np)
+{
+	if (np) {
+		res->irq = of_irq_get_byname(np, "macirq");
+		if (res->irq < 0) {
+			dev_err(&pdev->dev, "IRQ macirq not found\n");
+			return -ENODEV;
+		}
+
+		res->wol_irq = of_irq_get_byname(np, "eth_wake_irq");
+		if (res->wol_irq < 0) {
+			dev_info(&pdev->dev,
+				 "IRQ eth_wake_irq not found, using macirq\n");
+			res->wol_irq = res->irq;
+		}
+
+		res->lpi_irq = of_irq_get_byname(np, "eth_lpi");
+		if (res->lpi_irq < 0) {
+			dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
+			return -ENODEV;
+		}
+	} else {
+		res->irq = pdev->irq;
+		res->wol_irq = res->irq;
+	}
+
+	plat->flags &= ~STMMAC_FLAG_MULTI_MSI_EN;
+	dev_info(&pdev->dev, "%s: Single IRQ enablement successful\n",
+		 __func__);
+
+	return 0;
+}
+
+static int loongson_dwmac_config_multi_msi(struct pci_dev *pdev,
+					   struct plat_stmmacenet_data *plat,
+					   struct stmmac_resources *res,
+					   struct device_node *np,
+					   int channel_num)
+{
+	int i, ret, vecs;
+
+	vecs = roundup_pow_of_two(channel_num * 2 + 1);
+	ret = pci_alloc_irq_vectors(pdev, vecs, vecs, PCI_IRQ_MSI);
+	if (ret < 0) {
+		dev_info(&pdev->dev,
+			 "MSI enable failed, Fallback to legacy interrupt\n");
+		return loongson_dwmac_config_legacy(pdev, plat, res, np);
+	}
+
+	plat->rx_queues_to_use = channel_num;
+	plat->tx_queues_to_use = channel_num;
+	plat->irq_flags = get_irq_type(np);
+
+	res->irq = pci_irq_vector(pdev, 0);
+	res->wol_irq = res->irq;
+
+	/* INT NAME | MAC | CH7 rx | CH7 tx | ... | CH0 rx | CH0 tx |
+	 * --------- ----- -------- --------  ...  -------- --------
+	 * IRQ NUM  |  0  |   1    |   2    | ... |   15   |   16   |
+	 */
+	for (i = 0; i < channel_num; i++) {
+		res->rx_irq[channel_num - 1 - i] =
+			pci_irq_vector(pdev, 1 + i * 2);
+		res->tx_irq[channel_num - 1 - i] =
+			pci_irq_vector(pdev, 2 + i * 2);
+	}
+
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
+	dev_info(&pdev->dev, "%s: multi MSI enablement successful\n", __func__);
+
+	return 0;
+}
+
 static void loongson_default_data(struct pci_dev *pdev,
 				  struct plat_stmmacenet_data *plat)
 {
@@ -66,8 +154,29 @@ static int loongson_gmac_data(struct pci_dev *pdev,
 	return 0;
 }
 
+static int loongson_gmac_config(struct pci_dev *pdev,
+				struct plat_stmmacenet_data *plat,
+				struct stmmac_resources *res,
+				struct device_node *np)
+{
+	int ret;
+	u32 version = readl(res->addr + GMAC_VERSION);
+
+	switch (version & 0xff) {
+	case DWGMAC_CORE_1_00:
+		ret = loongson_dwmac_config_multi_msi(pdev, plat, res, np, 8);
+		break;
+	default:
+		ret = loongson_dwmac_config_legacy(pdev, plat, res, np);
+		break;
+	}
+
+	return ret;
+}
+
 static struct stmmac_pci_info loongson_gmac_pci_info = {
 	.setup = loongson_gmac_data,
+	.config = loongson_gmac_config,
 };
 
 static int loongson_dwmac_probe(struct pci_dev *pdev,
@@ -140,44 +249,19 @@ static int loongson_dwmac_probe(struct pci_dev *pdev,
 		plat->phy_interface = phy_mode;
 	}
 
-	pci_enable_msi(pdev);
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
 
-	if (np) {
-		res.irq = of_irq_get_byname(np, "macirq");
-		if (res.irq < 0) {
-			dev_err(&pdev->dev, "IRQ macirq not found\n");
-			ret = -ENODEV;
-			goto err_disable_msi;
-		}
-
-		res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
-		if (res.wol_irq < 0) {
-			dev_info(&pdev->dev,
-				 "IRQ eth_wake_irq not found, using macirq\n");
-			res.wol_irq = res.irq;
-		}
-
-		res.lpi_irq = of_irq_get_byname(np, "eth_lpi");
-		if (res.lpi_irq < 0) {
-			dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
-			ret = -ENODEV;
-			goto err_disable_msi;
-		}
-	} else {
-		res.irq = pdev->irq;
-		res.wol_irq = pdev->irq;
-	}
+	ret = info->config(pdev, plat, &res, np);
+	if (ret)
+		goto err_disable_device;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
 	if (ret)
-		goto err_disable_msi;
+		goto err_disable_device;
 
 	return ret;
 
-err_disable_msi:
-	pci_disable_msi(pdev);
 err_disable_device:
 	pci_disable_device(pdev);
 err_put_node:
@@ -201,7 +285,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 		break;
 	}
 
-	pci_disable_msi(pdev);
 	pci_disable_device(pdev);
 }
 
-- 
2.31.4

