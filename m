Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7526DBE7E
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 07:16:19 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8BxIvDBGcJkdpsKAA--.25558S3;
	Thu, 27 Jul 2023 15:16:17 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ8y8GcJkkrY8AA--.56466S4;
	Thu, 27 Jul 2023 15:16:15 +0800 (CST)
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
Subject: [PATCH v2 03/10] net: stmmac: dwmac1000: Add multi-channel support
Date: Thu, 27 Jul 2023 15:15:46 +0800
Message-Id: <373259d4ac9ac0b9e1e64ad96d60a9bbd35b85aa.1690439335.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1690439335.git.chenfeiyang@loongson.cn>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxJ8y8GcJkkrY8AA--.56466S4
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xr1fAF15GF17ZFW5KF1DXFc_yoWfZrW7pa
	y5t3s5XFyrtr4fZa1kJws8Xr15J34agrWxuF4fG3yS9a1a9r1agrs0gayjyF13CFZ7Ar9I
	qrWYvw17Wr1UZrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

Some platforms have dwmac1000 implementations that support multi-
channel. Extend the functions to add multi-channel support.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  1 +
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   | 64 +++++++++++++++++--
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   | 28 ++++----
 include/linux/stmmac.h                        |  1 +
 4 files changed, 73 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 9015a61f804c..a9b42a122ed6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -562,6 +562,7 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 {
 	dev_info(priv->device, "\tDWMAC1000\n");
 
+	priv->plat->dwmac_is_loongson = false;
 	priv->plat->dwmac_regs = &dwmac_default_dma_regs;
 
 	return _dwmac1000_setup(priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index ce0e6ca6f3a2..efb219999a20 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -111,13 +111,61 @@ static void dwmac1000_dma_init(struct stmmac_priv *priv, void __iomem *ioaddr,
 	writel(DMA_INTR_DEFAULT_MASK, ioaddr + DMA_INTR_ENA);
 }
 
+void dwmac1000_dma_init_channel(struct stmmac_priv *priv, void __iomem *ioaddr,
+				struct stmmac_dma_cfg *dma_cfg,
+				u32 chan)
+{
+	u32 value;
+	int txpbl = dma_cfg->txpbl ?: dma_cfg->pbl;
+	int rxpbl = dma_cfg->rxpbl ?: dma_cfg->pbl;
+
+	if (!priv->plat->dwmac_is_loongson)
+		return;
+
+	/* common channel control register config */
+	value = readl(ioaddr + DMA_BUS_MODE + chan * DMA_CHAN_OFFSET);
+
+	/*
+	 * Set the DMA PBL (Programmable Burst Length) mode.
+	 *
+	 * Note: before stmmac core 3.50 this mode bit was 4xPBL, and
+	 * post 3.5 mode bit acts as 8*PBL.
+	 */
+	if (dma_cfg->pblx8)
+		value |= DMA_BUS_MODE_MAXPBL;
+	value |= DMA_BUS_MODE_USP;
+	value &= ~(DMA_BUS_MODE_PBL_MASK | DMA_BUS_MODE_RPBL_MASK);
+	value |= (txpbl << DMA_BUS_MODE_PBL_SHIFT);
+	value |= (rxpbl << DMA_BUS_MODE_RPBL_SHIFT);
+
+	/* Set the Fixed burst mode */
+	if (dma_cfg->fixed_burst)
+		value |= DMA_BUS_MODE_FB;
+
+	/* Mixed Burst has no effect when fb is set */
+	if (dma_cfg->mixed_burst)
+		value |= DMA_BUS_MODE_MB;
+
+	value |= DMA_BUS_MODE_ATDS;
+
+	if (dma_cfg->aal)
+		value |= DMA_BUS_MODE_AAL;
+
+	writel(value, ioaddr + DMA_BUS_MODE + chan * DMA_CHAN_OFFSET);
+
+	/* Mask interrupts by writing to CSR7 */
+	writel(DMA_INTR_DEFAULT_MASK,
+	       ioaddr + DMA_INTR_ENA + chan * DMA_CHAN_OFFSET);
+}
+
 static void dwmac1000_dma_init_rx(struct stmmac_priv *priv,
 				  void __iomem *ioaddr,
 				  struct stmmac_dma_cfg *dma_cfg,
 				  dma_addr_t dma_rx_phy, u32 chan)
 {
 	/* RX descriptor base address list must be written into DMA CSR3 */
-	writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_RCV_BASE_ADDR);
+	writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_RCV_BASE_ADDR +
+		chan * DMA_CHAN_OFFSET);
 }
 
 static void dwmac1000_dma_init_tx(struct stmmac_priv *priv,
@@ -126,7 +174,8 @@ static void dwmac1000_dma_init_tx(struct stmmac_priv *priv,
 				  dma_addr_t dma_tx_phy, u32 chan)
 {
 	/* TX descriptor base address list must be written into DMA CSR4 */
-	writel(lower_32_bits(dma_tx_phy), ioaddr + DMA_TX_BASE_ADDR);
+	writel(lower_32_bits(dma_tx_phy), ioaddr + DMA_TX_BASE_ADDR +
+		chan * DMA_CHAN_OFFSET);
 }
 
 static u32 dwmac1000_configure_fc(u32 csr6, int rxfifosz)
@@ -154,7 +203,7 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 					    void __iomem *ioaddr, int mode,
 					    u32 channel, int fifosz, u8 qmode)
 {
-	u32 csr6 = readl(ioaddr + DMA_CONTROL);
+	u32 csr6 = readl(ioaddr + DMA_CONTROL + channel * DMA_CHAN_OFFSET);
 
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
@@ -176,14 +225,14 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 	/* Configure flow control based on rx fifo size */
 	csr6 = dwmac1000_configure_fc(csr6, fifosz);
 
-	writel(csr6, ioaddr + DMA_CONTROL);
+	writel(csr6, ioaddr + DMA_CONTROL + channel * DMA_CHAN_OFFSET);
 }
 
 static void dwmac1000_dma_operation_mode_tx(struct stmmac_priv *priv,
 					    void __iomem *ioaddr, int mode,
 					    u32 channel, int fifosz, u8 qmode)
 {
-	u32 csr6 = readl(ioaddr + DMA_CONTROL);
+	u32 csr6 = readl(ioaddr + DMA_CONTROL + channel * DMA_CHAN_OFFSET);
 
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable TX store and forward mode\n");
@@ -210,7 +259,7 @@ static void dwmac1000_dma_operation_mode_tx(struct stmmac_priv *priv,
 			csr6 |= DMA_CONTROL_TTC_256;
 	}
 
-	writel(csr6, ioaddr + DMA_CONTROL);
+	writel(csr6, ioaddr + DMA_CONTROL + channel * DMA_CHAN_OFFSET);
 }
 
 static void dwmac1000_dump_dma_regs(struct stmmac_priv *priv,
@@ -273,12 +322,13 @@ static int dwmac1000_get_hw_feature(struct stmmac_priv *priv,
 static void dwmac1000_rx_watchdog(struct stmmac_priv *priv,
 				  void __iomem *ioaddr, u32 riwt, u32 queue)
 {
-	writel(riwt, ioaddr + DMA_RX_WATCHDOG);
+	writel(riwt, ioaddr + DMA_RX_WATCHDOG + queue * DMA_CHAN_OFFSET);
 }
 
 const struct stmmac_dma_ops dwmac1000_dma_ops = {
 	.reset = dwmac_dma_reset,
 	.init = dwmac1000_dma_init,
+	.init_chan = dwmac1000_dma_init_channel,
 	.init_rx_chan = dwmac1000_dma_init_rx,
 	.init_tx_chan = dwmac1000_dma_init_tx,
 	.axi = dwmac1000_dma_axi,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 266f64148c1a..99838497b183 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -71,63 +71,63 @@ int dwmac_dma_reset(void __iomem *ioaddr)
 void dwmac_enable_dma_transmission(struct stmmac_priv *priv,
 				   void __iomem *ioaddr, u32 chan)
 {
-	writel(1, ioaddr + DMA_XMT_POLL_DEMAND);
+	writel(1, ioaddr + DMA_XMT_POLL_DEMAND + chan * DMA_CHAN_OFFSET);
 }
 
 void dwmac_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			  u32 chan, bool rx, bool tx)
 {
-	u32 value = readl(ioaddr + DMA_INTR_ENA);
+	u32 value = readl(ioaddr + DMA_INTR_ENA + chan * DMA_CHAN_OFFSET);
 
 	if (rx)
 		value |= DMA_INTR_DEFAULT_RX;
 	if (tx)
 		value |= DMA_INTR_DEFAULT_TX;
 
-	writel(value, ioaddr + DMA_INTR_ENA);
+	writel(value, ioaddr + DMA_INTR_ENA + chan * DMA_CHAN_OFFSET);
 }
 
 void dwmac_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			   u32 chan, bool rx, bool tx)
 {
-	u32 value = readl(ioaddr + DMA_INTR_ENA);
+	u32 value = readl(ioaddr + DMA_INTR_ENA + chan * DMA_CHAN_OFFSET);
 
 	if (rx)
 		value &= ~DMA_INTR_DEFAULT_RX;
 	if (tx)
 		value &= ~DMA_INTR_DEFAULT_TX;
 
-	writel(value, ioaddr + DMA_INTR_ENA);
+	writel(value, ioaddr + DMA_INTR_ENA + chan * DMA_CHAN_OFFSET);
 }
 
 void dwmac_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 			u32 chan)
 {
-	u32 value = readl(ioaddr + DMA_CONTROL);
+	u32 value = readl(ioaddr + DMA_CONTROL + chan * DMA_CHAN_OFFSET);
 	value |= DMA_CONTROL_ST;
-	writel(value, ioaddr + DMA_CONTROL);
+	writel(value, ioaddr + DMA_CONTROL + chan * DMA_CHAN_OFFSET);
 }
 
 void dwmac_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr, u32 chan)
 {
-	u32 value = readl(ioaddr + DMA_CONTROL);
+	u32 value = readl(ioaddr + DMA_CONTROL + chan * DMA_CHAN_OFFSET);
 	value &= ~DMA_CONTROL_ST;
-	writel(value, ioaddr + DMA_CONTROL);
+	writel(value, ioaddr + DMA_CONTROL + chan * DMA_CHAN_OFFSET);
 }
 
 void dwmac_dma_start_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
 			u32 chan)
 {
-	u32 value = readl(ioaddr + DMA_CONTROL);
+	u32 value = readl(ioaddr + DMA_CONTROL + chan * DMA_CHAN_OFFSET);
 	value |= DMA_CONTROL_SR;
-	writel(value, ioaddr + DMA_CONTROL);
+	writel(value, ioaddr + DMA_CONTROL + chan * DMA_CHAN_OFFSET);
 }
 
 void dwmac_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr, u32 chan)
 {
-	u32 value = readl(ioaddr + DMA_CONTROL);
+	u32 value = readl(ioaddr + DMA_CONTROL + chan * DMA_CHAN_OFFSET);
 	value &= ~DMA_CONTROL_SR;
-	writel(value, ioaddr + DMA_CONTROL);
+	writel(value, ioaddr + DMA_CONTROL + chan * DMA_CHAN_OFFSET);
 }
 
 #ifdef DWMAC_DMA_DEBUG
@@ -205,7 +205,7 @@ int dwmac_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 {
 	int ret = 0;
 	/* read the status register (CSR5) */
-	u32 intr_status = readl(ioaddr + DMA_STATUS);
+	u32 intr_status = readl(ioaddr + DMA_STATUS + chan * DMA_CHAN_OFFSET);
 
 #ifdef DWMAC_DMA_DEBUG
 	/* Enable it to monitor DMA rx/tx status in case of critical problems */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index db61dc7c931d..5e68553433a7 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -342,5 +342,6 @@ struct plat_stmmacenet_data {
 	const struct dwmac4_addrs *dwmac4_addrs;
 	bool has_integrated_pcs;
 	const struct dwmac_regs *dwmac_regs;
+	bool dwmac_is_loongson;
 };
 #endif
-- 
2.39.3

