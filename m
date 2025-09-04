Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F28279795
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991266; cv=none; b=UUiSDqi0LuLT7d/8+8UvTUni+bM2N7yUhgy6ZGakLW1FsjoK2TVYGvJcRLJPIgD1yerzo8KYriAsT0Y2TKZ5xWG06xpS9eWMDefUTDIbff+NIi7NmPotk2W0xyGmjd25iAujV/6jBeWO0vsnBl2Zyun6UD9MEuu+Lg/9SG69cSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991266; c=relaxed/simple;
	bh=OE1tcKg7UIUBpQRs6VfSrfCFb7xoUtPxrSG+qtv06Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7WkiPM9HI1nL8h8bbY1xbcvWjANscxJn1LCM7nKJO4ZP0WJWmo/jrQKQf7w6PckRavxVP520No2TDsBpm3kfQjNcqxrV7xdFmVQWwUzSj9c+VcNc39IwVzWqMas7nbCMkE22ilpfWc7/zzpkgXxBOieQfqV95Zd1LiP40Fgkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8AxztIdj7log6wGAA--.13995S3;
	Thu, 04 Sep 2025 21:07:41 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJAxfcEIj7lotA5+AA--.16416S3;
	Thu, 04 Sep 2025 21:07:40 +0800 (CST)
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
Subject: [PATCH v4 5/7] mtd: rawnand: loongson: Add Loongson-2K0500 NAND controller support
Date: Thu,  4 Sep 2025 21:07:09 +0800
Message-ID: <fee72e4e98c6e50e72170db0d858339945f19c59.1756991031.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1756991031.git.zhoubinbin@loongson.cn>
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxfcEIj7lotA5+AA--.16416S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jw13JFWUKFy7XFyxXr4kZrc_yoW7Kr13pr
	45Zay3Krs5KF42ka1Yqa45Gr13Z34fJryDAa1qv342gwn7Jw1jga4UGF4Syr12yF1UWr1x
	uFWku39Y9anxJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3
	AwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

The Loongson-2K0500 NAND controller is similar to the Loongson-1C.

It supports a maximum capacity of 16GB FLASH per chip with a maximum
page size of 8KB, and it supports up to 4 chip selects and 4 RDY
signals.

Its DMA controller is defaulted to APBDMA0.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mtd/nand/raw/Kconfig                  |  2 +-
 .../mtd/nand/raw/loongson-nand-controller.c   | 53 ++++++++++++++++++-
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 489f5c05cda9..7408f34f0c68 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -438,7 +438,7 @@ config MTD_NAND_NUVOTON_MA35
 
 config MTD_NAND_LOONGSON
 	tristate "Loongson NAND controller"
-	depends on LOONGSON1_APB_DMA || COMPILE_TEST
+	depends on LOONGSON1_APB_DMA || LOONGSON2_APB_DMA || COMPILE_TEST
 	select REGMAP_MMIO
 	help
 	  Enables support for NAND controller on Loongson family chips.
diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 1427dd6943a7..427a0daf8c55 100644
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
+#define LOONGSON_NAND_CS_SEL0		BIT(0)
+#define LOONGSON_NAND_CS_SEL1		BIT(1)
+#define LOONGSON_NAND_CS_SEL2		BIT(2)
+#define LOONGSON_NAND_CS_SEL3		BIT(3)
+#define LOONGSON_NAND_CS_RDY0		BIT(0)
+#define LOONGSON_NAND_CS_RDY1		BIT(1)
+#define LOONGSON_NAND_CS_RDY2		BIT(2)
+#define LOONGSON_NAND_CS_RDY3		BIT(3)
+
 /* Bitfields of nand timing register */
 #define LOONGSON_NAND_WAIT_CYCLE_MASK	GENMASK(7, 0)
 #define LOONGSON_NAND_HOLD_CYCLE_MASK	GENMASK(15, 8)
@@ -83,6 +102,7 @@ struct loongson_nand_data {
 	unsigned int hold_cycle;
 	unsigned int wait_cycle;
 	unsigned int nand_cs;
+	unsigned int dma_bits;
 	void (*set_addr)(struct loongson_nand_host *host, struct loongson_nand_op *op);
 };
 
@@ -744,7 +764,7 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 	struct device *dev = host->dev;
 	struct dma_chan *chan;
 	struct dma_slave_config cfg = {};
-	int ret;
+	int ret, val;
 
 	host->regmap = devm_regmap_init_mmio(dev, host->reg_base, &loongson_nand_regmap_config);
 	if (IS_ERR(host->regmap))
@@ -754,6 +774,19 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 		regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, host->data->id_cycle_field,
 				   host->data->max_id_cycle << __ffs(host->data->id_cycle_field));
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(host->data->dma_bits));
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
+
+	val = FIELD_PREP(LOONGSON_NAND_MAP_CS1_SEL, LOONGSON_NAND_CS_SEL1) |
+	      FIELD_PREP(LOONGSON_NAND_MAP_RDY1_SEL, LOONGSON_NAND_CS_RDY1) |
+	      FIELD_PREP(LOONGSON_NAND_MAP_CS2_SEL, LOONGSON_NAND_CS_SEL2) |
+	      FIELD_PREP(LOONGSON_NAND_MAP_RDY2_SEL, LOONGSON_NAND_CS_RDY2) |
+	      FIELD_PREP(LOONGSON_NAND_MAP_CS3_SEL, LOONGSON_NAND_CS_SEL3) |
+	      FIELD_PREP(LOONGSON_NAND_MAP_RDY3_SEL, LOONGSON_NAND_CS_RDY3);
+
+	regmap_write(host->regmap, LOONGSON_NAND_CS_RDY_MAP, val);
+
 	chan = dma_request_chan(dev, "rxtx");
 	if (IS_ERR(chan))
 		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channel\n");
@@ -882,6 +915,7 @@ static const struct loongson_nand_data ls1b_nand_data = {
 	.status_field = GENMASK(15, 8),
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
+	.dma_bits = 32,
 	.set_addr = ls1b_nand_set_addr,
 };
 
@@ -892,6 +926,18 @@ static const struct loongson_nand_data ls1c_nand_data = {
 	.op_scope_field = GENMASK(29, 16),
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
+	.dma_bits = 32,
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
+	.dma_bits = 64,
 	.set_addr = ls1c_nand_set_addr,
 };
 
@@ -904,6 +950,10 @@ static const struct of_device_id loongson_nand_match[] = {
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
@@ -920,5 +970,6 @@ static struct platform_driver loongson_nand_driver = {
 module_platform_driver(loongson_nand_driver);
 
 MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
 MODULE_DESCRIPTION("Loongson NAND Controller Driver");
 MODULE_LICENSE("GPL");
-- 
2.47.3

