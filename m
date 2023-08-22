Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE07944C
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 09:41:00 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8CxNvGqguRk8d8aAA--.54833S3;
	Tue, 22 Aug 2023 17:40:58 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxrM6pguRkkDVgAA--.38101S2;
	Tue, 22 Aug 2023 17:40:58 +0800 (CST)
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
Subject: [PATCH v4 04/11] net: stmmac: Allow platforms to set irq_flags
Date: Tue, 22 Aug 2023 17:40:53 +0800
Message-Id: <fb70964b2a1e58ef9987e709952001aeb000814f.1692696115.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8BxrM6pguRkkDVgAA--.38101S2
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr4fGF45KrWDKw4ftFWrZwc_yoWrGr1Dpa
	y7Aas5tFn2qr12gan8AayDZFyYk34xKa4fAFyxJwnxJFWIyr9avr1FqrySyF1fCrZ5ArWa
	qFWDua18C3WUWrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW3AVW8Xw1lYx0Ex4A2
	jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4EfOUUUUU

Some platforms need extra irq flags to request irq multi msi, add
irq_flags variable for them.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 +++++++++-------
 include/linux/stmmac.h                           |  1 +
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f91dd3f69fef..1d67e5ec5fac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3515,7 +3515,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	int_name = priv->int_name_mac;
 	sprintf(int_name, "%s:%s", dev->name, "mac");
 	ret = request_irq(dev->irq, stmmac_mac_interrupt,
-			  0, int_name, dev);
+			  priv->plat->irq_flags, int_name, dev);
 	if (unlikely(ret < 0)) {
 		netdev_err(priv->dev,
 			   "%s: alloc mac MSI %d (error: %d)\n",
@@ -3532,7 +3532,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s", dev->name, "wol");
 		ret = request_irq(priv->wol_irq,
 				  stmmac_mac_interrupt,
-				  0, int_name, dev);
+				  priv->plat->irq_flags, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc wol MSI %d (error: %d)\n",
@@ -3550,7 +3550,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s", dev->name, "lpi");
 		ret = request_irq(priv->lpi_irq,
 				  stmmac_mac_interrupt,
-				  0, int_name, dev);
+				  priv->plat->irq_flags, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc lpi MSI %d (error: %d)\n",
@@ -3568,7 +3568,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s", dev->name, "safety-ce");
 		ret = request_irq(priv->sfty_ce_irq,
 				  stmmac_safety_interrupt,
-				  0, int_name, dev);
+				  priv->plat->irq_flags, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc sfty ce MSI %d (error: %d)\n",
@@ -3586,7 +3586,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s", dev->name, "safety-ue");
 		ret = request_irq(priv->sfty_ue_irq,
 				  stmmac_safety_interrupt,
-				  0, int_name, dev);
+				  priv->plat->irq_flags, int_name, dev);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc sfty ue MSI %d (error: %d)\n",
@@ -3607,7 +3607,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
 		ret = request_irq(priv->rx_irq[i],
 				  stmmac_msi_intr_rx,
-				  0, int_name, &priv->dma_conf.rx_queue[i]);
+				  priv->plat->irq_flags, int_name,
+				  &priv->dma_conf.rx_queue[i]);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc rx-%d  MSI %d (error: %d)\n",
@@ -3632,7 +3633,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 		sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
 		ret = request_irq(priv->tx_irq[i],
 				  stmmac_msi_intr_tx,
-				  0, int_name, &priv->dma_conf.tx_queue[i]);
+				  priv->plat->irq_flags, int_name,
+				  &priv->dma_conf.tx_queue[i]);
 		if (unlikely(ret < 0)) {
 			netdev_err(priv->dev,
 				   "%s: alloc tx-%d  MSI %d (error: %d)\n",
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 0e36259a9568..75da4c7eb85c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -296,5 +296,6 @@ struct plat_stmmacenet_data {
 	const struct dwmac4_addrs *dwmac4_addrs;
 	bool has_integrated_pcs;
 	int has_egmac;
+	u32 irq_flags;
 };
 #endif
-- 
2.39.3

