Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA731C281
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 09:41:27 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8DxxPDFguRkWeAaAA--.55790S3;
	Tue, 22 Aug 2023 17:41:25 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c7AguRkqTVgAA--.38684S5;
	Tue, 22 Aug 2023 17:41:24 +0800 (CST)
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
Subject: [PATCH v4 11/11] net: stmmac: dwmac-loongson: Add GNET support
Date: Tue, 22 Aug 2023 17:41:19 +0800
Message-Id: <e83b526e0ee0f90ba0e645efec405de957c28bcb.1692696115.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8Ax3c7AguRkqTVgAA--.38684S5
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jr15CFWDArW5XF43XrWkGrX_yoW7Cry5pw
	43Aa47Wry2qF17Kan5Jw4DZFyYyrW3KrZ7WFW7tws3WFZFkryYqryYgFWayrnrCr4DWF1a
	qr4jkr4UWFs8CrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Gryq6s0DMcIj6I8E
	87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjc
	xG6xCI17CEII8vrVW3JVW8Jr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2
	KfnxnUUI43ZEXa7IUYTbyJUUUUU==

Add GNET support. Current GNET does not support half duplex mode.
GNET on LS7A only supports ANE when speed is set to 1000M.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 82 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  6 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +-
 include/linux/stmmac.h                        |  2 +
 4 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 1f466b1e80d9..7b08c54f6c62 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -192,6 +192,86 @@ static struct stmmac_pci_info loongson_gmac_pci_info = {
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
+	switch (pdev->revision) {
+	case 0x00:
+		plat->dwegmac_flags |=
+			FIELD_PREP(DWEGMAC_DISABLE_HALF_DUPLEX, 1) |
+			FIELD_PREP(DWEGMAC_DISABLE_FORCE_1000, 1);
+		break;
+	case 0x01:
+		plat->dwegmac_flags |=
+			FIELD_PREP(DWEGMAC_DISABLE_HALF_DUPLEX, 1);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static struct stmmac_pci_info loongson_gnet_pci_info = {
+	.setup = loongson_gnet_data,
+	.config = loongson_gnet_config,
+};
+
 static int loongson_dwmac_probe(struct pci_dev *pdev,
 				const struct pci_device_id *id)
 {
@@ -340,9 +420,11 @@ static SIMPLE_DEV_PM_OPS(loongson_dwmac_pm_ops, loongson_dwmac_suspend,
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
index dba33ce392a8..0006a0b2754b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -404,6 +404,12 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 		return 0;
 	}
 
+	if (FIELD_GET(DWEGMAC_DISABLE_FORCE_1000, priv->plat->dwegmac_flags)) {
+		if (cmd->base.speed == SPEED_1000 &&
+		    cmd->base.autoneg != AUTONEG_ENABLE)
+			return -EOPNOTSUPP;
+	}
+
 	return phylink_ethtool_ksettings_set(priv->phylink, cmd);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a98bcd797720..fa4d7b90c5fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1242,7 +1242,8 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	}
 
 	/* Half-Duplex can only work with single queue */
-	if (priv->plat->tx_queues_to_use > 1)
+	if (priv->plat->tx_queues_to_use > 1 ||
+	    FIELD_GET(DWEGMAC_DISABLE_HALF_DUPLEX, priv->plat->dwegmac_flags))
 		priv->phylink_config.mac_capabilities &=
 			~(MAC_10HD | MAC_100HD | MAC_1000HD);
 	priv->phylink_config.mac_managed_pm = true;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e97774efd451..d369993a5d9d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -209,6 +209,8 @@ struct dwmac4_addrs {
 
 #define DWEGMAC_FIX_CHANNEL_NUM		BIT(0)
 #define DWEGMAC_DISABLE_FLOW_CONTROL	BIT(1)
+#define DWEGMAC_DISABLE_HALF_DUPLEX	BIT(2)
+#define DWEGMAC_DISABLE_FORCE_1000	BIT(3)
 
 struct plat_stmmacenet_data {
 	int bus_id;
-- 
2.39.3

