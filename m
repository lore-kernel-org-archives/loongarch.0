Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8E418B1D
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 11:29:01 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.245])
	by gateway (Coremail) with SMTP id _____8AxV_F7j8tksKwPAA--.36960S3;
	Thu, 03 Aug 2023 19:28:59 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLCN1j8tk4R1HAA--.33555S5;
	Thu, 03 Aug 2023 19:28:58 +0800 (CST)
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
Subject: [PATCH v3 03/16] net: stmmac: dwmac1000: Add multi-channel support
Date: Thu,  3 Aug 2023 19:28:05 +0800
Message-Id: <a40bf8242d1805c94a1ff1a8762b87c7622cc1af.1691047285.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8CxLCN1j8tk4R1HAA--.33555S5
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xr1fAF17KFWkJw4kuryUurX_yoWfCF4rpa
	yqy3s5JFy5tr4fZF4kJr4DXry5X345KryxWF4fGw1a9ay29r1a9an09ayjyF13CF47Ar9I
	qrs8tw17Wr1UZrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==

Some platforms have dwmac1000 implementations that support multi-
channel. Extend the functions to add multi-channel support.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   | 70 +++++++++++++++++--
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   | 37 ++++++----
 2 files changed, 86 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 3996dea4b1e3..4cec78180556 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -114,15 +114,65 @@ static void dwmac1000_dma_init(struct stmmac_priv *priv, void __iomem *ioaddr,
 	writel(mask, ioaddr + DMA_INTR_ENA);
 }
 
+static void dwmac1000_dma_init_channel(struct stmmac_priv *priv,
+				       void __iomem *ioaddr,
+				       struct stmmac_dma_cfg *dma_cfg,
+				       u32 chan)
+{
+	u32 value;
+	int txpbl = dma_cfg->txpbl ?: dma_cfg->pbl;
+	int rxpbl = dma_cfg->rxpbl ?: dma_cfg->pbl;
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 mask = priv->plat->dwmac_regs->intr_ena->default_mask;
+
+	if (!priv->plat->multi_msi_en)
+		return;
+
+	/* common channel control register config */
+	value = readl(ioaddr + DMA_BUS_MODE + chan * offset);
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
+	writel(value, ioaddr + DMA_BUS_MODE + chan * offset);
+
+	/* Mask interrupts by writing to CSR7 */
+	writel(mask, ioaddr + DMA_INTR_ENA + chan * offset);
+}
+
 static void dwmac1000_dma_init_rx(struct stmmac_priv *priv,
 				  void __iomem *ioaddr,
 				  struct stmmac_dma_cfg *dma_cfg,
 				  dma_addr_t dma_rx_phy, u32 chan)
 {
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
 	u32 addr = priv->plat->dwmac_regs->addrs->rcv_base_addr;
 
 	/* RX descriptor base address list must be written into DMA CSR3 */
-	writel(lower_32_bits(dma_rx_phy), ioaddr + addr);
+	writel(lower_32_bits(dma_rx_phy), ioaddr + addr + chan * offset);
 }
 
 static void dwmac1000_dma_init_tx(struct stmmac_priv *priv,
@@ -130,10 +180,11 @@ static void dwmac1000_dma_init_tx(struct stmmac_priv *priv,
 				  struct stmmac_dma_cfg *dma_cfg,
 				  dma_addr_t dma_tx_phy, u32 chan)
 {
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
 	u32 addr = priv->plat->dwmac_regs->addrs->tx_base_addr;
 
 	/* TX descriptor base address list must be written into DMA CSR4 */
-	writel(lower_32_bits(dma_tx_phy), ioaddr + addr);
+	writel(lower_32_bits(dma_tx_phy), ioaddr + addr + chan * offset);
 }
 
 static u32 dwmac1000_configure_fc(u32 csr6, int rxfifosz)
@@ -161,7 +212,8 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 					    void __iomem *ioaddr, int mode,
 					    u32 channel, int fifosz, u8 qmode)
 {
-	u32 csr6 = readl(ioaddr + DMA_CONTROL);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 csr6 = readl(ioaddr + DMA_CONTROL + channel * offset);
 
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
@@ -183,14 +235,15 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 	/* Configure flow control based on rx fifo size */
 	csr6 = dwmac1000_configure_fc(csr6, fifosz);
 
-	writel(csr6, ioaddr + DMA_CONTROL);
+	writel(csr6, ioaddr + DMA_CONTROL + channel * offset);
 }
 
 static void dwmac1000_dma_operation_mode_tx(struct stmmac_priv *priv,
 					    void __iomem *ioaddr, int mode,
 					    u32 channel, int fifosz, u8 qmode)
 {
-	u32 csr6 = readl(ioaddr + DMA_CONTROL);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 csr6 = readl(ioaddr + DMA_CONTROL + channel * offset);
 
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable TX store and forward mode\n");
@@ -217,7 +270,7 @@ static void dwmac1000_dma_operation_mode_tx(struct stmmac_priv *priv,
 			csr6 |= DMA_CONTROL_TTC_256;
 	}
 
-	writel(csr6, ioaddr + DMA_CONTROL);
+	writel(csr6, ioaddr + DMA_CONTROL + channel * offset);
 }
 
 static void dwmac1000_dump_dma_regs(struct stmmac_priv *priv,
@@ -280,12 +333,15 @@ static int dwmac1000_get_hw_feature(struct stmmac_priv *priv,
 static void dwmac1000_rx_watchdog(struct stmmac_priv *priv,
 				  void __iomem *ioaddr, u32 riwt, u32 queue)
 {
-	writel(riwt, ioaddr + DMA_RX_WATCHDOG);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+
+	writel(riwt, ioaddr + DMA_RX_WATCHDOG + queue * offset);
 }
 
 const struct stmmac_dma_ops dwmac1000_dma_ops = {
 	.reset = dwmac_dma_reset,
 	.init = dwmac1000_dma_init,
+	.init_chan = dwmac1000_dma_init_channel,
 	.init_rx_chan = dwmac1000_dma_init_rx,
 	.init_tx_chan = dwmac1000_dma_init_tx,
 	.axi = dwmac1000_dma_axi,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 6411be0f3612..cf9e3e7b6b3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -103,63 +103,71 @@ int dwmac_dma_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
 void dwmac_enable_dma_transmission(struct stmmac_priv *priv,
 				   void __iomem *ioaddr, u32 chan)
 {
-	writel(1, ioaddr + DMA_XMT_POLL_DEMAND);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+
+	writel(1, ioaddr + DMA_XMT_POLL_DEMAND + chan * offset);
 }
 
 void dwmac_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			  u32 chan, bool rx, bool tx)
 {
-	u32 value = readl(ioaddr + DMA_INTR_ENA);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 value = readl(ioaddr + DMA_INTR_ENA + chan * offset);
 
 	if (rx)
 		value |= DMA_INTR_DEFAULT_RX;
 	if (tx)
 		value |= DMA_INTR_DEFAULT_TX;
 
-	writel(value, ioaddr + DMA_INTR_ENA);
+	writel(value, ioaddr + DMA_INTR_ENA + chan * offset);
 }
 
 void dwmac_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			   u32 chan, bool rx, bool tx)
 {
-	u32 value = readl(ioaddr + DMA_INTR_ENA);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 value = readl(ioaddr + DMA_INTR_ENA + chan * offset);
 
 	if (rx)
 		value &= ~DMA_INTR_DEFAULT_RX;
 	if (tx)
 		value &= ~DMA_INTR_DEFAULT_TX;
 
-	writel(value, ioaddr + DMA_INTR_ENA);
+	writel(value, ioaddr + DMA_INTR_ENA + chan * offset);
 }
 
 void dwmac_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 			u32 chan)
 {
-	u32 value = readl(ioaddr + DMA_CONTROL);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 value = readl(ioaddr + DMA_CONTROL + chan * offset);
 	value |= DMA_CONTROL_ST;
-	writel(value, ioaddr + DMA_CONTROL);
+	writel(value, ioaddr + DMA_CONTROL + chan * offset);
 }
 
 void dwmac_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr, u32 chan)
 {
-	u32 value = readl(ioaddr + DMA_CONTROL);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 value = readl(ioaddr + DMA_CONTROL + chan * offset);
 	value &= ~DMA_CONTROL_ST;
-	writel(value, ioaddr + DMA_CONTROL);
+	writel(value, ioaddr + DMA_CONTROL + chan * offset);
 }
 
 void dwmac_dma_start_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
 			u32 chan)
 {
-	u32 value = readl(ioaddr + DMA_CONTROL);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 value = readl(ioaddr + DMA_CONTROL + chan * offset);
 	value |= DMA_CONTROL_SR;
-	writel(value, ioaddr + DMA_CONTROL);
+	writel(value, ioaddr + DMA_CONTROL + chan * offset);
 }
 
 void dwmac_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr, u32 chan)
 {
-	u32 value = readl(ioaddr + DMA_CONTROL);
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
+	u32 value = readl(ioaddr + DMA_CONTROL + chan * offset);
 	value &= ~DMA_CONTROL_SR;
-	writel(value, ioaddr + DMA_CONTROL);
+	writel(value, ioaddr + DMA_CONTROL + chan * offset);
 }
 
 #ifdef DWMAC_DMA_DEBUG
@@ -238,9 +246,10 @@ int dwmac_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 			struct stmmac_extra_stats *x, u32 chan, u32 dir)
 {
 	const struct dwmac_dma_status *status = priv->plat->dwmac_regs->status;
+	u32 offset = priv->plat->dwmac_regs->addrs->chan_offset;
 	int ret = 0;
 	/* read the status register (CSR5) */
-	u32 intr_status = readl(ioaddr + DMA_STATUS);
+	u32 intr_status = readl(ioaddr + DMA_STATUS + chan * offset);
 
 #ifdef DWMAC_DMA_DEBUG
 	/* Enable it to monitor DMA rx/tx status in case of critical problems */
-- 
2.39.3

