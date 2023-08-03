Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1A68C0F
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 11:29:37 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.245])
	by gateway (Coremail) with SMTP id _____8AxXOqgj8tk_qwPAA--.9085S3;
	Thu, 03 Aug 2023 19:29:36 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxzM6dj8tkKx5HAA--.52441S5;
	Thu, 03 Aug 2023 19:29:36 +0800 (CST)
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
Subject: [PATCH v3 07/16] net: stmmac: dwmac1000: Add multiple retries for DMA reset
Date: Thu,  3 Aug 2023 19:29:27 +0800
Message-Id: <10952d824f3236758bcef3e5a3224e9ab87eac0f.1691047285.git.chenfeiyang@loongson.cn>
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
X-CM-TRANSID:AQAAf8DxzM6dj8tkKx5HAA--.52441S5
X-CM-SenderInfo: hfkh0wphl1t03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFy3ZrWktw4UWw45Gr48GrX_yoW5Jw4xp3
	9rCa45XrW0qr18ta1DAw4DZFyrX3y5Kr4UurWIkwsa9a1IvrZ0qrn0qFWFy3W7XFWqgFya
	gF1Y9ry7uF1DX3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E
	87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4EfOUUUUU

DMA reset on some platforms may fail, so add the dma_reset_times
variable to control the number of retries.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c    |  3 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c | 17 +++++++++++------
 include/linux/stmmac.h                          |  1 +
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index abcce58e9c29..ad712e337a50 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -541,6 +541,9 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 	else
 		priv->plat->dwmac_regs = &dwmac_default_dma_regs;
 
+	if (!priv->plat->dma_reset_times)
+		priv->plat->dma_reset_times = 1;
+
 	priv->dev->priv_flags |= IFF_UNICAST_FLT;
 	mac->pcsr = priv->ioaddr;
 	mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index fc0da4336e4e..de1b1844bb8a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -176,15 +176,20 @@ const struct dwmac_regs dwmac_loongson64_dma_regs = {
 
 int dwmac_dma_reset(struct stmmac_priv *priv, void __iomem *ioaddr)
 {
+	int err;
+	int cnt = priv->plat->dma_reset_times;
 	u32 value = readl(ioaddr + DMA_BUS_MODE);
 
-	/* DMA SW reset */
-	value |= DMA_BUS_MODE_SFT_RESET;
-	writel(value, ioaddr + DMA_BUS_MODE);
+	do {
+		value |= DMA_BUS_MODE_SFT_RESET;
+		writel(value, ioaddr + DMA_BUS_MODE);
 
-	return readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
-				 !(value & DMA_BUS_MODE_SFT_RESET),
-				 10000, 200000);
+		err = readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
+					 !(value & DMA_BUS_MODE_SFT_RESET),
+					 10000, 200000);
+	} while (cnt-- && err);
+
+	return err;
 }
 
 /* CSR1 enables the transmit DMA to check for new descriptor */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e1b9ddf83fe5..ad2905cd226c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -357,5 +357,6 @@ struct plat_stmmacenet_data {
 	bool has_integrated_pcs;
 	const struct dwmac_regs *dwmac_regs;
 	bool fix_channel_num;
+	bool dma_reset_times;
 };
 #endif
-- 
2.39.3

