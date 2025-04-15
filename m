Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E35275114
	for <loongarch@lists.linux.dev>; Tue, 15 Apr 2025 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701128; cv=none; b=Atr5aX5gPQeBUNUdkABqucLvFPsFIlJHLq2uQl0Z3Xo2uGTWW/L7CkiVzNW4uCehDhcwfK1vkLObWhGAMw8pYfnvzbCHfUv2Rf1OaoD2IYFM7+gnJg2A8HpDhknsUzRmj6FxPy95kpdw/paDaqZiT+rWdyCHfTzRIBvL3Zb2cGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701128; c=relaxed/simple;
	bh=KjRBHpnhNx2L2f4e+8bxxLFlyH6oMQahHuhznMztzag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLDlGtR8CsnMbskwKKh9WUAbfKEWk+6DJb+0H5VjwORW6vVBPqCy+Vrg6GJCL6sF3gayRLp0IataJQhyomiWzxbz9jHwquoa+WVp3EV55qgiMCq0tG5LB6U9mmM+KY5aCwMRwDMeVSA/tWObnMerxH+qY17hgEXsSS6fRUFwz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8DxOGrCBv5n74m9AA--.53837S3;
	Tue, 15 Apr 2025 15:12:02 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMBxGcS1Bv5ni3SCAA--.35528S3;
	Tue, 15 Apr 2025 15:12:01 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Yanteng Si <si.yanteng@linux.dev>,
	Feiyang Chen <chris.chenfeiyang@gmail.com>,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Biao Dong <dongbiao@loongson.cn>,
	Baoqi Zhang <zhangbaoqi@loongson.cn>
Subject: [PATCH net-next 1/3] net: stmmac: dwmac-loongson: Move queue number init to common function
Date: Tue, 15 Apr 2025 15:11:26 +0800
Message-ID: <20250415071128.3774235-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250415071128.3774235-1-chenhuacai@loongson.cn>
References: <20250415071128.3774235-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxGcS1Bv5ni3SCAA--.35528S3
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAw4UCw4DtrW8WrWfZw1xCrX_yoW5Wr4xp3
	y3Aay7WrWftr9rKan8J3yUZry5ArWFqrZ2gFW2kw1fCFyqkw1qq34rKFWvkFZ7AFWDu3W3
	ZF4jkr4UWF1qkwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxhiSDUUUU

Currently, the tx and rx queue number initialization is duplicated in
loongson_gmac_data() and loongson_gnet_data(), so move it to the common
function loongson_default_data().

This is a preparation for later patches.

Tested-by: Biao Dong <dongbiao@loongson.cn>
Signed-off-by: Baoqi Zhang <zhangbaoqi@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 39 +++++--------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 1a93787056a7..f5fdef56da2c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -83,6 +83,9 @@ struct stmmac_pci_info {
 static void loongson_default_data(struct pci_dev *pdev,
 				  struct plat_stmmacenet_data *plat)
 {
+	int i;
+	struct loongson_data *ld = plat->bsp_priv;
+
 	/* Get bus_id, this can be overwritten later */
 	plat->bus_id = pci_dev_id(pdev);
 
@@ -116,17 +119,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
-}
-
-static int loongson_gmac_data(struct pci_dev *pdev,
-			      struct plat_stmmacenet_data *plat)
-{
-	struct loongson_data *ld;
-	int i;
-
-	ld = plat->bsp_priv;
-
-	loongson_default_data(pdev, plat);
 
 	if (ld->loongson_id == DWMAC_CORE_LS_MULTICHAN) {
 		plat->rx_queues_to_use = CHANNEL_NUM;
@@ -141,6 +133,12 @@ static int loongson_gmac_data(struct pci_dev *pdev,
 		plat->tx_queues_to_use = 1;
 		plat->rx_queues_to_use = 1;
 	}
+}
+
+static int loongson_gmac_data(struct pci_dev *pdev,
+			      struct plat_stmmacenet_data *plat)
+{
+	loongson_default_data(pdev, plat);
 
 	plat->phy_interface = PHY_INTERFACE_MODE_RGMII_ID;
 
@@ -172,27 +170,8 @@ static void loongson_gnet_fix_speed(void *priv, int speed, unsigned int mode)
 static int loongson_gnet_data(struct pci_dev *pdev,
 			      struct plat_stmmacenet_data *plat)
 {
-	struct loongson_data *ld;
-	int i;
-
-	ld = plat->bsp_priv;
-
 	loongson_default_data(pdev, plat);
 
-	if (ld->loongson_id == DWMAC_CORE_LS_MULTICHAN) {
-		plat->rx_queues_to_use = CHANNEL_NUM;
-		plat->tx_queues_to_use = CHANNEL_NUM;
-
-		/* Only channel 0 supports checksum,
-		 * so turn off checksum to enable multiple channels.
-		 */
-		for (i = 1; i < CHANNEL_NUM; i++)
-			plat->tx_queues_cfg[i].coe_unsupported = 1;
-	} else {
-		plat->tx_queues_to_use = 1;
-		plat->rx_queues_to_use = 1;
-	}
-
 	plat->phy_interface = PHY_INTERFACE_MODE_GMII;
 	plat->mdio_bus_data->phy_mask = ~(u32)BIT(2);
 	plat->fix_mac_speed = loongson_gnet_fix_speed;
-- 
2.47.1

