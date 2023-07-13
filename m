Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FAE62B
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 02:47:14 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8DxRvGxZa9kyD8EAA--.12229S3;
	Thu, 13 Jul 2023 10:47:13 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx_c6sZa9kuJcrAA--.57200S6;
	Thu, 13 Jul 2023 10:47:12 +0800 (CST)
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
Subject: [RFC PATCH 04/10] net: stmmac: dwmac1000: Add multi-channel support
Date: Thu, 13 Jul 2023 10:46:56 +0800
Message-Id: <b2e287d99da1f5ee76cd80bce34879cc7f773b5c.1689215889.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8Cx_c6sZa9kuJcrAA--.57200S6
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xr1fAF15GF17ZFW5KF1DXFc_yoWfZF4Dpa
	y5t3s5XFyrtr4fZ3WkJws8Xry5J34agrWxuF4fG3yS9a1a9r1agrs0gayjyF13CFZ7Ar9I
	qrWYvw17Wr1UArgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jxKsUUUUUU=

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
index eafe85e45977..ff539681a3a4 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -340,6 +340,7 @@ struct plat_stmmacenet_data {
 	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
+	bool dwmac_is_loongson;
 	const struct dwmac_regs *dwmac_regs;
 };
 #endif
-- 
2.39.3

