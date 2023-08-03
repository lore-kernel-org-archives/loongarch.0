Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA24B1DDEB
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 11:30:50 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.245])
	by gateway (Coremail) with SMTP id _____8Bxyerpj8tkWq0PAA--.26844S3;
	Thu, 03 Aug 2023 19:30:49 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxTSPoj8tkyR5HAA--.34056S2;
	Thu, 03 Aug 2023 19:30:49 +0800 (CST)
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
Subject: [PATCH v3 13/16] net: stmmac: dwmac-loongson: Add 64-bit DMA and multi-vector support
Date: Thu,  3 Aug 2023 19:30:34 +0800
Message-Id: <48ceed6b5d7b32c2e46b79fa597466b9212f745e.1691047285.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxTSPoj8tkyR5HAA--.34056S2
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr1UWryrKryUWF1kXw4UJrc_yoWrWr17pF
	ZxAa47KrW8Jr17Wan8Aw4DAF1YyrWav3y0grWakwnakayqkr9YqFyvqFWIvryxCrWkGF17
	XF4DKF48W3WUJFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW3AVW8Xw1lYx0Ex4A2
	jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y4
	0E4IxF1VCIxcxG6Fyj6r4UJwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU5DKsUUUUUU==

Set 64-Bit DMA for specific versions. Request allocation for multi-
vector interrupts for DWLGMAC_CORE_1_00. If it fails, fallback to
request allocation for single interrupts.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 83 ++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index c7790f73fe18..18bca996e1cb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -6,11 +6,15 @@
 #include <linux/pci.h>
 #include <linux/dmi.h>
 #include <linux/device.h>
+#include <linux/interrupt.h>
 #include <linux/of_irq.h>
+#include "dwmac1000.h"
 #include "stmmac.h"
 
 struct stmmac_pci_info {
 	int (*setup)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat);
+	int (*config)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat,
+		      struct stmmac_resources *res);
 };
 
 static void loongson_default_data(struct pci_dev *pdev,
@@ -66,14 +70,54 @@ static int loongson_gmac_data(struct pci_dev *pdev,
 	return 0;
 }
 
+static int loongson_gmac_config(struct pci_dev *pdev,
+				struct plat_stmmacenet_data *plat,
+				struct stmmac_resources *res)
+{
+	u32 version = readl(res->addr + GMAC_VERSION);
+
+	switch (version & 0xff) {
+	case DWLGMAC_CORE_1_00:
+		plat->multi_msi_en = 1;
+		plat->rx_queues_to_use = 8;
+		plat->tx_queues_to_use = 8;
+		plat->fix_channel_num = true;
+		break;
+	case DWMAC_CORE_3_50:
+	case DWMAC_CORE_3_70:
+		if (version & 0x00008000) {
+			plat->host_dma_width = 64;
+			plat->dma_cfg->dma64 = true;
+		}
+		break;
+	default:
+		break;
+	}
+
+	plat->dma_reset_times = 5;
+
+	return 0;
+}
+
 static struct stmmac_pci_info loongson_gmac_pci_info = {
 	.setup = loongson_gmac_data,
+	.config = loongson_gmac_config,
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
 static int loongson_dwmac_probe(struct pci_dev *pdev,
 				const struct pci_device_id *id)
 {
-	int ret, i, bus_id, phy_mode;
+	int ret, i, bus_id, phy_mode, ch_cnt, vecs;
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_pci_info *info;
 	struct stmmac_resources res;
@@ -170,12 +214,46 @@ static int loongson_dwmac_probe(struct pci_dev *pdev,
 		res.wol_irq = pdev->irq;
 	}
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
+	ret = info->config(pdev, plat, &res);
 	if (ret)
 		goto err_disable_msi;
 
+	if (plat->multi_msi_en) {
+		ch_cnt = plat->rx_queues_to_use;
+
+		pci_disable_msi(pdev);
+
+		res.irq = pci_irq_vector(pdev, 0);
+		res.wol_irq = res.irq;
+		vecs = roundup_pow_of_two(ch_cnt * 2 + 1);
+		if (pci_alloc_irq_vectors(pdev, vecs, vecs, PCI_IRQ_MSI) < 0) {
+			dev_info(&pdev->dev,
+				 "MSI enable failed, Fallback to line interrupt\n");
+			plat->multi_msi_en = 0;
+		} else {
+			/* INT NAME | MAC | CH7 rx | CH7 tx | ... | CH0 rx | CH0 tx |
+			 * --------- ----- -------- --------  ...  -------- --------
+			 * IRQ NUM  |  0  |   1    |   2    | ... |   15   |   16   |
+			 */
+			for (i = 0; i < ch_cnt; i++) {
+				res.rx_irq[ch_cnt - 1 - i] = pci_irq_vector(pdev, 1 + i * 2);
+				res.tx_irq[ch_cnt - 1 - i] = pci_irq_vector(pdev, 2 + i * 2);
+			}
+
+			plat->control_value = GMAC_CONTROL_ACS;
+			plat->irq_flags = get_irq_type(np);
+		}
+	}
+
+	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
+	if (ret)
+		goto err_free_irq_vectors;
+
 	return ret;
 
+err_free_irq_vectors:
+	if (plat->multi_msi_en)
+		pci_free_irq_vectors(pdev);
 err_disable_msi:
 	pci_disable_msi(pdev);
 err_disable_device:
@@ -201,6 +279,7 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 		break;
 	}
 
+	pci_free_irq_vectors(pdev);
 	pci_disable_msi(pdev);
 	pci_disable_device(pdev);
 }
-- 
2.39.3

