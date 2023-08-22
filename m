Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954018F74
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 09:41:23 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8BxyerBguRkO+AaAA--.45507S3;
	Tue, 22 Aug 2023 17:41:21 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c7AguRkqTVgAA--.38684S2;
	Tue, 22 Aug 2023 17:41:21 +0800 (CST)
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
Subject: [PATCH v4 08/11] net: stmmac: dwegmac: Fix channel numbers
Date: Tue, 22 Aug 2023 17:41:16 +0800
Message-Id: <65b1dc40d509676f81669bbc6b32531b1e6f3441.1692696115.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8Ax3c7AguRkqTVgAA--.38684S2
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr1fZF48AFWDXw4xWr17urX_yoW5CFW8pF
	W7Aa4j9ryjyF15Xa1kt3ykXF98Ga4FgrWxWr4jk3yfua9FyFyYqrnIyayYyF18ZF4DX3W2
	yF18uw45WFyDXrgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjc
	xG6xCI17CEII8vrVW3JVW8Jr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07b5yIUUUUUU=

Some Loongson platforms cannot obtain the TX and RX number of channels.
Add the dwegmac_flag for them and specify the number of channels.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
---
 drivers/net/ethernet/stmicro/stmmac/dwegmac_dma.c    | 10 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  1 +
 include/linux/stmmac.h                               |  5 +++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwegmac_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwegmac_dma.c
index 9bb0564fbeff..157f0e3687be 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwegmac_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwegmac_dma.c
@@ -479,8 +479,14 @@ static int dwegmac_get_hw_feature(struct stmmac_priv *priv,
 	dma_cap->rx_coe_type2 = (hw_cap & DMA_HW_FEAT_RXTYP2COE) >> 18;
 	dma_cap->rxfifo_over_2048 = (hw_cap & DMA_HW_FEAT_RXFIFOSIZE) >> 19;
 	/* TX and RX number of channels */
-	dma_cap->number_rx_channel = (hw_cap & DMA_HW_FEAT_RXCHCNT) >> 20;
-	dma_cap->number_tx_channel = (hw_cap & DMA_HW_FEAT_TXCHCNT) >> 22;
+	if (FIELD_GET(DWEGMAC_FIX_CHANNEL_NUM, priv->plat->dwegmac_flags) &&
+	    ((hw_cap & (DMA_HW_FEAT_RXCHCNT | DMA_HW_FEAT_TXCHCNT)) >> 20) == 0) {
+		dma_cap->number_rx_channel = 8;
+		dma_cap->number_tx_channel = 8;
+	} else {
+		dma_cap->number_rx_channel = (hw_cap & DMA_HW_FEAT_RXCHCNT) >> 20;
+		dma_cap->number_tx_channel = (hw_cap & DMA_HW_FEAT_TXCHCNT) >> 22;
+	}
 	/* Alternate (enhanced) DESC mode */
 	dma_cap->enh_desc = (hw_cap & DMA_HW_FEAT_ENHDESSEL) >> 24;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 0748bafd3aec..9fb27fc94d2a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -175,6 +175,7 @@ static int loongson_gmac_config(struct pci_dev *pdev,
 	switch (version & 0xff) {
 	case DWEGMAC_CORE_1_00:
 		ret = loongson_dwmac_config_multi_msi(pdev, plat, res, np, 8);
+		plat->dwegmac_flags |= FIELD_PREP(DWEGMAC_FIX_CHANNEL_NUM, 1);
 		break;
 	default:
 		ret = loongson_dwmac_config_single_irq(pdev, plat, res, np);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 75da4c7eb85c..e4088d2a0f39 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -14,6 +14,8 @@
 
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 
 #define MTL_MAX_RX_QUEUES	8
 #define MTL_MAX_TX_QUEUES	8
@@ -205,6 +207,8 @@ struct dwmac4_addrs {
 	u32 mtl_low_cred_offset;
 };
 
+#define DWEGMAC_FIX_CHANNEL_NUM		BIT(0)
+
 struct plat_stmmacenet_data {
 	int bus_id;
 	int phy_addr;
@@ -297,5 +301,6 @@ struct plat_stmmacenet_data {
 	bool has_integrated_pcs;
 	int has_egmac;
 	u32 irq_flags;
+	unsigned int dwegmac_flags;
 };
 #endif
-- 
2.39.3

