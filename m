Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668D7388
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 02:49:03 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8BxY_AdZq9kIUAEAA--.12066S3;
	Thu, 13 Jul 2023 10:49:01 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxxswbZq9khJgrAA--.34828S4;
	Thu, 13 Jul 2023 10:49:01 +0800 (CST)
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
Subject: [RFC PATCH 07/10] net: stmmac: Add Loongson HWIF entry
Date: Thu, 13 Jul 2023 10:48:52 +0800
Message-Id: <a865956c2273e28a40428e6686918ad26c800a33.1689215889.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1689215889.git.chenfeiyang@loongson.cn>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxxswbZq9khJgrAA--.34828S4
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3CF4UKw18GF4kuw4UKFW8KrX_yoWDAry3pa
	yUAa4qvry8tF1Igan5Aw4DuFy5K34SkF42y3yfG3y3WF4avr9Fqr9IqFW5ArnrGFW5Xa4a
	qFyq9w1ku3WUJrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW3AVW8Xw1lYx0Ex4A2
	jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzCJPUUUUU=

Add a new entry to HWIF table for Loongson.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  3 ++
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |  6 +++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    | 48 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++----
 include/linux/stmmac.h                        |  1 +
 5 files changed, 73 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 4ad692c4116c..45c49c7a9ccb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -29,11 +29,13 @@
 /* Synopsys Core versions */
 #define	DWMAC_CORE_3_40		0x34
 #define	DWMAC_CORE_3_50		0x35
+#define	DWMAC_CORE_3_70		0x37
 #define	DWMAC_CORE_4_00		0x40
 #define DWMAC_CORE_4_10		0x41
 #define DWMAC_CORE_5_00		0x50
 #define DWMAC_CORE_5_10		0x51
 #define DWMAC_CORE_5_20		0x52
+#define DWLGMAC_CORE_1_00	0x10
 #define DWXGMAC_CORE_2_10	0x21
 #define DWXLGMAC_CORE_2_00	0x20
 
@@ -546,6 +548,7 @@ int dwmac1000_setup(struct stmmac_priv *priv);
 int dwmac4_setup(struct stmmac_priv *priv);
 int dwxgmac2_setup(struct stmmac_priv *priv);
 int dwxlgmac2_setup(struct stmmac_priv *priv);
+int dwmac_loongson_setup(struct stmmac_priv *priv);
 
 void stmmac_set_mac_addr(void __iomem *ioaddr, const u8 addr[6],
 			 unsigned int high, unsigned int low);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 7aa450d6a81a..5da5f111d7e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -172,6 +172,12 @@ static void dwmac1000_dma_init_rx(struct stmmac_priv *priv,
 		       chan * DMA_CHAN_OFFSET);
 		writel(upper_32_bits(dma_rx_phy), ioaddr + DMA_RCV_BASE_ADDR_HI +
 		       chan * DMA_CHAN_OFFSET);
+		if (priv->plat->has_lgmac) {
+			writel(upper_32_bits(dma_rx_phy),
+			       ioaddr + DMA_RCV_BASE_ADDR_SHADOW1);
+			writel(upper_32_bits(dma_rx_phy),
+			       ioaddr + DMA_RCV_BASE_ADDR_SHADOW2);
+		}
 	} else {
 		/* RX descriptor base address list must be written into DMA CSR3 */
 		writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_RCV_BASE_ADDR +
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index b8ba8f2d8041..b376ac4f80d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -58,7 +58,8 @@ static int stmmac_dwmac1_quirks(struct stmmac_priv *priv)
 		dev_info(priv->device, "Enhanced/Alternate descriptors\n");
 
 		/* GMAC older than 3.50 has no extended descriptors */
-		if (priv->synopsys_id >= DWMAC_CORE_3_50) {
+		if (priv->synopsys_id >= DWMAC_CORE_3_50 ||
+		    priv->plat->has_lgmac) {
 			dev_info(priv->device, "Enabled extended descriptors\n");
 			priv->extend_desc = 1;
 		} else {
@@ -104,6 +105,7 @@ static const struct stmmac_hwif_entry {
 	bool gmac;
 	bool gmac4;
 	bool xgmac;
+	bool lgmac;
 	u32 min_id;
 	u32 dev_id;
 	const struct stmmac_regs_off regs;
@@ -122,6 +124,7 @@ static const struct stmmac_hwif_entry {
 		.gmac = false,
 		.gmac4 = false,
 		.xgmac = false,
+		.lgmac = false,
 		.min_id = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC3_X_OFFSET,
@@ -140,6 +143,7 @@ static const struct stmmac_hwif_entry {
 		.gmac = true,
 		.gmac4 = false,
 		.xgmac = false,
+		.lgmac = false,
 		.min_id = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC3_X_OFFSET,
@@ -158,6 +162,7 @@ static const struct stmmac_hwif_entry {
 		.gmac = false,
 		.gmac4 = true,
 		.xgmac = false,
+		.lgmac = false,
 		.min_id = 0,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
@@ -176,6 +181,7 @@ static const struct stmmac_hwif_entry {
 		.gmac = false,
 		.gmac4 = true,
 		.xgmac = false,
+		.lgmac = false,
 		.min_id = DWMAC_CORE_4_00,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
@@ -194,6 +200,7 @@ static const struct stmmac_hwif_entry {
 		.gmac = false,
 		.gmac4 = true,
 		.xgmac = false,
+		.lgmac = false,
 		.min_id = DWMAC_CORE_4_10,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
@@ -212,6 +219,7 @@ static const struct stmmac_hwif_entry {
 		.gmac = false,
 		.gmac4 = true,
 		.xgmac = false,
+		.lgmac = false,
 		.min_id = DWMAC_CORE_5_10,
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
@@ -230,6 +238,7 @@ static const struct stmmac_hwif_entry {
 		.gmac = false,
 		.gmac4 = false,
 		.xgmac = true,
+		.lgmac = false,
 		.min_id = DWXGMAC_CORE_2_10,
 		.dev_id = DWXGMAC_ID,
 		.regs = {
@@ -249,6 +258,7 @@ static const struct stmmac_hwif_entry {
 		.gmac = false,
 		.gmac4 = false,
 		.xgmac = true,
+		.lgmac = false,
 		.min_id = DWXLGMAC_CORE_2_00,
 		.dev_id = DWXLGMAC_ID,
 		.regs = {
@@ -264,6 +274,42 @@ static const struct stmmac_hwif_entry {
 		.mmc = &dwxgmac_mmc_ops,
 		.setup = dwxlgmac2_setup,
 		.quirks = stmmac_dwxlgmac_quirks,
+	}, {
+		.gmac = true,
+		.gmac4 = false,
+		.xgmac = false,
+		.lgmac = true,
+		.min_id = DWLGMAC_CORE_1_00,
+		.regs = {
+			.ptp_off = PTP_GMAC3_X_OFFSET,
+			.mmc_off = MMC_GMAC3_X_OFFSET,
+		},
+		.desc = NULL,
+		.dma = &dwmac1000_dma_ops,
+		.mac = &dwmac1000_ops,
+		.hwtimestamp = &stmmac_ptp,
+		.mode = NULL,
+		.tc = NULL,
+		.setup = dwmac_loongson_setup,
+		.quirks = stmmac_dwmac1_quirks,
+	}, {
+		.gmac = true,
+		.gmac4 = false,
+		.xgmac = false,
+		.lgmac = true,
+		.min_id = DWMAC_CORE_3_50,
+		.regs = {
+			.ptp_off = PTP_GMAC3_X_OFFSET,
+			.mmc_off = MMC_GMAC3_X_OFFSET,
+		},
+		.desc = NULL,
+		.dma = &dwmac1000_dma_ops,
+		.mac = &dwmac1000_ops,
+		.hwtimestamp = &stmmac_ptp,
+		.mode = NULL,
+		.tc = NULL,
+		.setup = dwmac1000_setup,
+		.quirks = stmmac_dwmac1_quirks,
 	},
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2e95568b1e4a..59e9b61315bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3494,17 +3494,21 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	enum request_irq_err irq_err;
+	unsigned long flags = 0;
 	cpumask_t cpu_mask;
 	int irq_idx = 0;
 	char *int_name;
 	int ret;
 	int i;
 
+	if (priv->plat->has_lgmac)
+		flags |= IRQF_TRIGGER_RISING;
+
 	/* For common interrupt */
 	int_name = priv->int_name_mac;
 	sprintf(int_name, "%s:%s", dev->name, "mac");
 	ret = request_irq(dev->irq, stmmac_mac_interrupt,
-			  0, int_name, dev);
+			  flags, int_name, dev);
 	if (unlikely(ret < 0)) {
 		netdev_err(priv->dev,
 			   "%s: alloc mac MSI %d (error: %d)\n",
@@ -3521,7 +3525,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s", dev->name, "wol");
 		ret = request_irq(priv->wol_irq,
 				  stmmac_mac_interrupt,
-				  0, int_name, dev);
+				  flags, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc wol MSI %d (error: %d)\n",
@@ -3539,7 +3543,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s", dev->name, "lpi");
 		ret = request_irq(priv->lpi_irq,
 				  stmmac_mac_interrupt,
-				  0, int_name, dev);
+				  flags, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc lpi MSI %d (error: %d)\n",
@@ -3557,7 +3561,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s", dev->name, "safety-ce");
 		ret = request_irq(priv->sfty_ce_irq,
 				  stmmac_safety_interrupt,
-				  0, int_name, dev);
+				  flags, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc sfty ce MSI %d (error: %d)\n",
@@ -3575,7 +3579,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s", dev->name, "safety-ue");
 		ret = request_irq(priv->sfty_ue_irq,
 				  stmmac_safety_interrupt,
-				  0, int_name, dev);
+				  flags, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc sfty ue MSI %d (error: %d)\n",
@@ -3596,7 +3600,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
 		ret = request_irq(priv->rx_irq[i],
 				  stmmac_msi_intr_rx,
-				  0, int_name, &priv->dma_conf.rx_queue[i]);
+				  flags, int_name, &priv->dma_conf.rx_queue[i]);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc rx-%d  MSI %d (error: %d)\n",
@@ -3621,7 +3625,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
 		ret = request_irq(priv->tx_irq[i],
 				  stmmac_msi_intr_tx,
-				  0, int_name, &priv->dma_conf.tx_queue[i]);
+				  flags, int_name, &priv->dma_conf.tx_queue[i]);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc tx-%d  MSI %d (error: %d)\n",
@@ -6045,8 +6049,10 @@ static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *skb,
 			       struct net_device *sb_dev)
 {
 	int gso = skb_shinfo(skb)->gso_type;
+	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6 | SKB_GSO_UDP_L4)) {
+	if ((gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6 | SKB_GSO_UDP_L4)) ||
+	    priv->plat->has_lgmac) {
 		/*
 		 * There is no way to determine the number of TSO/USO
 		 * capable Queues. Let's use always the Queue 0
@@ -6924,7 +6930,8 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	 * riwt_off field from the platform.
 	 */
 	if (((priv->synopsys_id >= DWMAC_CORE_3_50) ||
-	    (priv->plat->has_xgmac)) && (!priv->plat->riwt_off)) {
+	    (priv->plat->has_xgmac) || (priv->plat->has_lgmac)) &&
+	    (!priv->plat->riwt_off)) {
 		priv->use_riwt = 1;
 		dev_info(priv->device,
 			 "Enable RX Mitigation via HW Watchdog Timer\n");
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f9af24f760d4..8ee1d8c7827f 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -341,6 +341,7 @@ struct plat_stmmacenet_data {
 	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
+	int has_lgmac;
 	bool dwmac_is_loongson;
 	const struct dwmac_regs *dwmac_regs;
 };
-- 
2.39.3

