Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CB626E6E6
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 06:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754892221; cv=none; b=ITDsZFu/caUaUd6xO00GBSTXLncoO3v+jrwYUqqT3oJbRZlwItwSmcIUtrrQ6IsqNf12h+lKNfP7FLaTBnAbtvEt1Kq0+CalAi3FFK8WaEareDUIf9NlIlxYpMA+j8U1haiSZef60duMWzA5ZtwBPSGyauzwtu3fgl/C0DpT6u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754892221; c=relaxed/simple;
	bh=QQSmYlj7f3SHVbZNakKOwDZGBAXZCkqOrd/9cOpaRkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hg2Os28/SSu5UlKEgEkla852clP044aBD3PPS2+/3QrBrdjawRCD7oy1GX1SuPlULicGokJ9teygIBt4pVu9sY0NbMV6BWFJdF770OB32t77aplWCRls9Xk8gMpfa+PPCAMTS2rxwjZI0Es8Bhbbtc8VUVDV6yBp/7EFYFU9gEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8DxC3K3h5lo3EI+AQ--.51883S3;
	Mon, 11 Aug 2025 14:03:35 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJAxVOSrh5loVlVCAA--.52188S4;
	Mon, 11 Aug 2025 14:03:34 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 6/8] mtd: rawnand: loongson: Add Loongson-2K0500 NAND controller support
Date: Mon, 11 Aug 2025 14:03:13 +0800
Message-ID: <89732d64415077ecd9f74c5853c542e62c0dfe26.1754890670.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1754890670.git.zhoubinbin@loongson.cn>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxVOSrh5loVlVCAA--.52188S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jw13JFykCr17XF4xGryUArc_yoWxXF4xpr
	W5Zay3Krs7KF429a1Yqa45Cr13Z34fJryDAa1qv34jgwnrJw1jga4UCF4Syr12yr15Wryx
	uFWku39Y9anxJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

The Loongson-2K0500 NAND controller is similar to the Loongson-1C.

It supports a maximum capacity of 16GB FLASH per chip with a maximum
page size of 8KB, and it supports up to 4 chip selects and 4 RDY
signals.

Its DMA controller is defaulted to APBDMA0.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mtd/nand/raw/Kconfig                  |  2 +-
 .../mtd/nand/raw/loongson-nand-controller.c   | 55 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index d9e3f13666ac..7b0c5d06aa95 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -464,7 +464,7 @@ config MTD_NAND_NUVOTON_MA35
 
 config MTD_NAND_LOONGSON
 	tristate "Loongson NAND controller"
-	depends on LOONGSON1_APB_DMA || COMPILE_TEST
+	depends on LOONGSON1_APB_DMA || LOONGSON2_APB_DMA || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  Enables support for NAND controller on Loongson family chips.
diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 5a51c7d299cc..7a15df3fcd31 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -3,6 +3,7 @@
  * NAND Controller Driver for Loongson family chips
  *
  * Copyright (C) 2015-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ * Copyright (C) 2025 Binbin Zhou <zhoubinbin@loongson.cn>
  */
 
 #include <linux/kernel.h>
@@ -26,6 +27,7 @@
 #define LOONGSON_NAND_IDH_STATUS	0x14
 #define LOONGSON_NAND_PARAM		0x18
 #define LOONGSON_NAND_OP_NUM		0x1c
+#define LOONGSON_NAND_CS_RDY_MAP	0x20
 
 /* Bitfields of nand command register */
 #define LOONGSON_NAND_CMD_OP_DONE	BIT(10)
@@ -40,6 +42,23 @@
 #define LOONGSON_NAND_CMD_READ		BIT(1)
 #define LOONGSON_NAND_CMD_VALID		BIT(0)
 
+/* Bitfields of nand cs/rdy map register */
+#define LOONGSON_NAND_MAP_CS1_SEL	GENMASK(11, 8)
+#define LOONGSON_NAND_MAP_RDY1_SEL	GENMASK(15, 12)
+#define LOONGSON_NAND_MAP_CS2_SEL	GENMASK(19, 16)
+#define LOONGSON_NAND_MAP_RDY2_SEL	GENMASK(23, 20)
+#define LOONGSON_NAND_MAP_CS3_SEL	GENMASK(27, 24)
+#define LOONGSON_NAND_MAP_RDY3_SEL	GENMASK(31, 28)
+
+#define LOONGSON_NAND_CS_SEL0	BIT(0)
+#define LOONGSON_NAND_CS_SEL1	BIT(1)
+#define LOONGSON_NAND_CS_SEL2	BIT(2)
+#define LOONGSON_NAND_CS_SEL3	BIT(3)
+#define LOONGSON_NAND_CS_RDY0	BIT(0)
+#define LOONGSON_NAND_CS_RDY1	BIT(1)
+#define LOONGSON_NAND_CS_RDY2	BIT(2)
+#define LOONGSON_NAND_CS_RDY3	BIT(3)
+
 /* Bitfields of nand timing register */
 #define LOONGSON_NAND_WAIT_CYCLE_MASK	GENMASK(7, 0)
 #define LOONGSON_NAND_HOLD_CYCLE_MASK	GENMASK(15, 8)
@@ -53,6 +72,8 @@
 #define LOONGSON_NAND_READ_ID_SLEEP_US		1000
 #define LOONGSON_NAND_READ_ID_TIMEOUT_US	5000
 
+#define LOONGSON_NAND_64BIT_DMA		BIT(0)
+
 #define BITS_PER_WORD			(4 * BITS_PER_BYTE)
 
 struct loongson_nand_host;
@@ -83,6 +104,7 @@ struct loongson_nand_data {
 	unsigned int hold_cycle;
 	unsigned int wait_cycle;
 	unsigned int nand_cs;
+	unsigned int flags;
 	void (*set_addr)(struct loongson_nand_host *host, struct loongson_nand_op *op);
 };
 
@@ -751,7 +773,7 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 	struct device *dev = host->dev;
 	struct dma_chan *chan;
 	struct dma_slave_config cfg = {};
-	int ret;
+	int ret, val;
 
 	host->regmap = devm_regmap_init_mmio(dev, host->reg_base, &loongson_nand_regmap_config);
 	if (IS_ERR(host->regmap))
@@ -761,6 +783,9 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 		regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, host->data->id_cycle_field,
 				   host->data->max_id_cycle << __ffs(host->data->id_cycle_field));
 
+	if (host->data->flags & LOONGSON_NAND_64BIT_DMA)
+		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+
 	chan = dma_request_chan(dev, "rxtx");
 	if (IS_ERR(chan))
 		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channel\n");
@@ -776,7 +801,14 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 
 	init_completion(&host->dma_complete);
 
-	return 0;
+	val = FIELD_PREP(LOONGSON_NAND_MAP_CS1_SEL, LOONGSON_NAND_CS_SEL1)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY1_SEL, LOONGSON_NAND_CS_RDY1)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_CS2_SEL, LOONGSON_NAND_CS_SEL2)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY2_SEL, LOONGSON_NAND_CS_RDY2)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_CS3_SEL, LOONGSON_NAND_CS_SEL3)
+	    | FIELD_PREP(LOONGSON_NAND_MAP_RDY3_SEL, LOONGSON_NAND_CS_RDY3);
+
+	return regmap_write(host->regmap, LOONGSON_NAND_CS_RDY_MAP, val);
 }
 
 static int loongson_nand_chip_init(struct loongson_nand_host *host)
@@ -890,6 +922,7 @@ static const struct loongson_nand_data ls1b_nand_data = {
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
 	.nand_cs = 0x0,
+	.flags = 0,
 	.set_addr = ls1b_nand_set_addr,
 };
 
@@ -901,6 +934,19 @@ static const struct loongson_nand_data ls1c_nand_data = {
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
 	.nand_cs = 0x0,
+	.flags = 0,
+	.set_addr = ls1c_nand_set_addr,
+};
+
+static const struct loongson_nand_data ls2k0500_nand_data = {
+	.max_id_cycle = 6,
+	.id_cycle_field = GENMASK(14, 12),
+	.status_field = GENMASK(23, 16),
+	.op_scope_field = GENMASK(29, 16),
+	.hold_cycle = 0x4,
+	.wait_cycle = 0x12,
+	.nand_cs = 0x0,
+	.flags = LOONGSON_NAND_64BIT_DMA,
 	.set_addr = ls1c_nand_set_addr,
 };
 
@@ -913,6 +959,10 @@ static const struct of_device_id loongson_nand_match[] = {
 		.compatible = "loongson,ls1c-nand-controller",
 		.data = &ls1c_nand_data,
 	},
+	{
+		.compatible = "loongson,ls2k0500-nand-controller",
+		.data = &ls2k0500_nand_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, loongson_nand_match);
@@ -929,5 +979,6 @@ static struct platform_driver loongson_nand_driver = {
 module_platform_driver(loongson_nand_driver);
 
 MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
 MODULE_DESCRIPTION("Loongson NAND Controller Driver");
 MODULE_LICENSE("GPL");
-- 
2.47.3

