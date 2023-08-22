Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214D11172D
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 09:41:03 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8AxXOqtguRkDeAaAA--.27748S3;
	Tue, 22 Aug 2023 17:41:01 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxrM6pguRkkDVgAA--.38101S5;
	Tue, 22 Aug 2023 17:41:00 +0800 (CST)
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
Subject: [PATCH v4 07/11] net: stmmac: dwmac-loongson: Add 64-bit DMA and MSI support
Date: Tue, 22 Aug 2023 17:40:56 +0800
Message-Id: <aa516a43999f43a29e3df24e9bb9968747b38438.1692696115.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8BxrM6pguRkkDVgAA--.38101S5
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtr17KF1rZry5Aw47Gw1rAFc_yoW7tF4xpr
	W3Aa4agrW0gry3WaykZayUXF1YyrWava48trW2kwnakayYyr9YqF18tFy2yryxCrZ5Cw43
	WFZ8KFW8ua1DAFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4EfOUUUUU

Set 64-Bit DMA and request allocation for MSI for specific versions.
Some features of Loongson platforms are bound to the GMAC_VERSION
register. We have to read its value in order to get the correct
channel number and DMA configuration.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 153 ++++++++++++++----
 1 file changed, 123 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index dd7e9f262ca6..0748bafd3aec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -6,13 +6,108 @@
 #include <linux/pci.h>
 #include <linux/dmi.h>
 #include <linux/device.h>
+#include <linux/interrupt.h>
 #include <linux/of_irq.h>
 #include "stmmac.h"
 
 struct stmmac_pci_info {
 	int (*setup)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat);
+	int (*config)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat,
+		      struct stmmac_resources *res, struct device_node *np);
 };
 
+static void loongson_dwmac_config_dma64(struct plat_stmmacenet_data *plat)
+{
+	plat->host_dma_width = 64;
+	plat->dma_cfg->dma64 = true;
+}
+
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
+static int loongson_dwmac_config_single_irq(struct pci_dev *pdev,
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
+	plat->multi_msi_en = 0;
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
+		return loongson_dwmac_config_single_irq(pdev, plat, res, np);
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
+	plat->multi_msi_en = 1;
+	dev_info(&pdev->dev, "%s: multi MSI enablement successful\n", __func__);
+
+	return 0;
+}
+
 static void loongson_default_data(struct pci_dev *pdev,
 				  struct plat_stmmacenet_data *plat)
 {
@@ -66,8 +161,32 @@ static int loongson_gmac_data(struct pci_dev *pdev,
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
+	if (version & 0x00008000)
+		loongson_dwmac_config_dma64(plat);
+
+	switch (version & 0xff) {
+	case DWEGMAC_CORE_1_00:
+		ret = loongson_dwmac_config_multi_msi(pdev, plat, res, np, 8);
+		break;
+	default:
+		ret = loongson_dwmac_config_single_irq(pdev, plat, res, np);
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
@@ -140,44 +259,19 @@ static int loongson_dwmac_probe(struct pci_dev *pdev,
 		plat->phy_interface = phy_mode;
 	}
 
-	pci_enable_msi(pdev);
-
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
@@ -201,7 +295,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 		break;
 	}
 
-	pci_disable_msi(pdev);
 	pci_disable_device(pdev);
 }
 
-- 
2.39.3

