Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AD11F176
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 11:30:52 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.245])
	by gateway (Coremail) with SMTP id _____8DxBfHrj8tkf60PAA--.36500S3;
	Thu, 03 Aug 2023 19:30:51 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxTSPoj8tkyR5HAA--.34056S5;
	Thu, 03 Aug 2023 19:30:51 +0800 (CST)
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
Subject: [PATCH v3 16/16] net: stmmac: dwmac-loongson: Add GNET support
Date: Thu,  3 Aug 2023 19:30:37 +0800
Message-Id: <88a8839c7cd46a177fb47288d777d89ee44a3db2.1691047285.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxTSPoj8tkyR5HAA--.34056S5
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuryDGFyxtw17tFyfZrWrZwc_yoW7Jryxp3
	y7Aa47Wr97XF1aqws8Jw4DZFyYkay3trZ7WFWxK393WFW2krWaqr1agFWjyFnrCr4DW3Wa
	qr4jkr4Uu3WDC3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW8Xw0E3s1lYx0Ex4A2
	jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y4
	0E4IxF1VCIxcxG6Fyj6r4UJwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7IUYzxRDUUUUU==

Add GNET support. Current GNET does not support half duplex mode.
and GNET on LS7A only supports ANE when speed is set to 1000M, and
GNET on LS2K should use single queue.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 67 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  6 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 include/linux/stmmac.h                        |  2 +
 4 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index d3ade3ae9014..712fede3c4b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -106,6 +106,71 @@ static struct stmmac_pci_info loongson_gmac_pci_info = {
 	.config = loongson_gmac_config,
 };
 
+static void loongson_gnet_fix_speed(void *priv, unsigned int speed)
+{
+	struct net_device *ndev = dev_get_drvdata(priv);
+	struct stmmac_priv *ptr = netdev_priv(ndev);
+
+	/* The controller and PHY don't work well together.
+	 * We need to use the PS bit to check if the controller's status
+	 * is correct and reset PHY if necessary.
+	 */
+	if (speed == SPEED_1000)
+		if (readl(ptr->ioaddr + MAC_CTRL_REG) & (1 << 15) /* PS */)
+			phy_restart_aneg(ndev->phydev);
+}
+
+static int loongson_gnet_data(struct pci_dev *pdev,
+			      struct plat_stmmacenet_data *plat)
+{
+	loongson_default_data(pdev, plat);
+
+	plat->multicast_filter_bins = 256;
+
+	plat->mdio_bus_data->phy_mask = 0xfffffffb;
+
+	plat->phy_addr = 2;
+	plat->phy_interface = PHY_INTERFACE_MODE_INTERNAL;
+
+	plat->bsp_priv = &pdev->dev;
+	plat->fix_mac_speed = loongson_gnet_fix_speed;
+
+	plat->dma_cfg->pbl = 32;
+	plat->dma_cfg->pblx8 = true;
+
+	plat->clk_ref_rate = 125000000;
+	plat->clk_ptp_rate = 125000000;
+
+	return 0;
+}
+
+static int loongson_gnet_config(struct pci_dev *pdev,
+				struct plat_stmmacenet_data *plat,
+				struct stmmac_resources *res)
+{
+	plat->dma_reset_times = 5;
+
+	switch (pdev->revision) {
+	case 0x00:
+		plat->disable_half_duplex = true;
+		plat->disable_force_1000 = true;
+		break;
+	case 0x01:
+		plat->disable_half_duplex = true;
+		plat->use_single_queue = true;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static struct stmmac_pci_info loongson_gnet_pci_info = {
+	.setup = loongson_gnet_data,
+	.config = loongson_gnet_config,
+};
+
 static u32 get_irq_type(struct device_node *np)
 {
 	struct of_phandle_args oirq;
@@ -325,9 +390,11 @@ static SIMPLE_DEV_PM_OPS(loongson_dwmac_pm_ops, loongson_dwmac_suspend,
 			 loongson_dwmac_resume);
 
 #define PCI_DEVICE_ID_LOONGSON_GMAC	0x7a03
+#define PCI_DEVICE_ID_LOONGSON_GNET	0x7a13
 
 static const struct pci_device_id loongson_dwmac_id_table[] = {
 	{ PCI_DEVICE_DATA(LOONGSON, GMAC, &loongson_gmac_pci_info) },
+	{ PCI_DEVICE_DATA(LOONGSON, GNET, &loongson_gnet_pci_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, loongson_dwmac_id_table);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 2ae73ab842d4..066f42ecf832 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -404,6 +404,12 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 		return 0;
 	}
 
+	if (priv->plat->disable_force_1000) {
+		if (cmd->base.speed == SPEED_1000 &&
+		    cmd->base.autoneg != AUTONEG_ENABLE)
+			return -EOPNOTSUPP;
+	}
+
 	return phylink_ethtool_ksettings_set(priv->phylink, cmd);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 692f41a7a175..6797b1742391 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1240,7 +1240,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	}
 
 	/* Half-Duplex can only work with single queue */
-	if (priv->plat->tx_queues_to_use > 1)
+	if (priv->plat->tx_queues_to_use > 1 || priv->plat->disable_half_duplex)
 		priv->phylink_config.mac_capabilities &=
 			~(MAC_10HD | MAC_100HD | MAC_1000HD);
 	priv->phylink_config.mac_managed_pm = true;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 9afee011839a..18b4ef614d25 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -362,5 +362,7 @@ struct plat_stmmacenet_data {
 	u32 irq_flags;
 	bool disable_flow_control;
 	bool use_single_queue;
+	bool disable_half_duplex;
+	bool disable_force_1000;
 };
 #endif
-- 
2.39.3

