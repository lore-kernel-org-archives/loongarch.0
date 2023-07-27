Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889D7C14D
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 07:18:58 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.108])
	by gateway (Coremail) with SMTP id _____8DxBfFgGsJkhZwKAA--.26417S3;
	Thu, 27 Jul 2023 15:18:57 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.108])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax8uReGsJkn7c8AA--.31333S4;
	Thu, 27 Jul 2023 15:18:56 +0800 (CST)
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
Subject: [PATCH v2 10/10] net: stmmac: dwmac-loongson: Add GNET support
Date: Thu, 27 Jul 2023 15:18:53 +0800
Message-Id: <20aa37fdfd4b03b9614befe1c8f78ffc0ac5dead.1690439335.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8Ax8uReGsJkn7c8AA--.31333S4
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuryDGFyxtw17tw4DAw4fJFc_yoWrur1rp3
	y7Aa47Wr97XF13Xws8Jw4DZFyYkrW3trZrWFWxKw43WFZFkrZ0qrySgFW5AF17Cr4DWF1a
	qr4jkr4UuF4DCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzCJPUUUUU=

Add GNET support. Current GNET does not support half duplex mode,
and GNET on LS7A only supports ANE when speed is set to 1000M.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 51 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  6 +++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 include/linux/stmmac.h                        |  2 +
 4 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 2d6567f0da23..1519c90cf9cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -70,6 +70,55 @@ static struct stmmac_pci_info loongson_gmac_pci_info = {
 	.setup = loongson_gmac_data,
 };
 
+static void loongson_gnet_fix_speed(void *priv, unsigned int speed)
+{
+	struct net_device *ndev = (struct net_device *)(*(unsigned long *)priv);
+	struct stmmac_priv *ptr = netdev_priv(ndev);
+
+	/*
+	 * The controller and PHY don't work well together.
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
+	common_default_data(pdev, plat);
+
+	plat->mdio_bus_data->phy_mask = 0xfffffffb;
+
+	plat->phy_addr = 2;
+	plat->phy_interface = PHY_INTERFACE_MODE_INTERNAL;
+
+	plat->fix_mac_speed = loongson_gnet_fix_speed;
+
+	/* Get netdev pointer address */
+	plat->bsp_priv = &(pdev->dev.driver_data);
+
+	switch (pdev->revision) {
+	case 0x00:
+		plat->disable_half_duplex = true;
+		plat->disable_force_1000 = true;
+		break;
+	case 0x01:
+		plat->disable_half_duplex = true;
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
+};
+
 static int loongson_dwmac_probe(struct pci_dev *pdev,
 				const struct pci_device_id *id)
 {
@@ -291,9 +340,11 @@ static SIMPLE_DEV_PM_OPS(loongson_dwmac_pm_ops, loongson_dwmac_suspend,
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
index 4f69cad0be42..d0248effdc2e 100644
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
index 54b9f308aabb..e6852dcfd0c0 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -346,5 +346,7 @@ struct plat_stmmacenet_data {
 	bool dwmac_is_loongson;
 	int has_lgmac;
 	bool disable_flow_control;
+	bool disable_half_duplex;
+	bool disable_force_1000;
 };
 #endif
-- 
2.39.3

