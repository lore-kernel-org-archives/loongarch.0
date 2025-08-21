Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C24127875C
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755758363; cv=none; b=tOx4EUdOLpCBIyhRUHT6c2qzuoYEVRykUNqWOvXl1gDhl796rq+giPDQOPoGygz3uTXu0I13qBDGydfOi4tmQE0rLf9JeqYpFxyN4UA4mTdp7yt5BTCWkSVGecLYjEHLGY4p/xHpjgLYSO9OUJZSYlWmvZ6Szh7dkLNzM5gaNfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755758363; c=relaxed/simple;
	bh=AS6Uwp42hrMS6sl2VgWha6bdbhTusH2u48vnGbj/lgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8njrBZxtwfj9LWbsUlilXxOO8s2B5a/zEF7xx9QYLqbVoe71goGdBKy/fW9uGX4Ps76ZLT6PVvC4n92AjiRFWb5FN0EY6nLKlOiP4GFbnqIHCOEDf0vpSGP7E/jcx2+yokwI1ySSHBEHJ7lCHefVDGfVuYprWriMDPl3hBJiBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.45])
	by gateway (Coremail) with SMTP id _____8Bx1tAPv6ZojU0BAA--.2382S3;
	Thu, 21 Aug 2025 14:39:11 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.45])
	by front1 (Coremail) with SMTP id qMiowJAxT+YIv6ZohPRcAA--.21919S3;
	Thu, 21 Aug 2025 14:39:08 +0800 (CST)
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
Subject: [PATCH v3 1/7] mtd: rawnand: loongson1: Rename the prefix from ls1x to loongson
Date: Thu, 21 Aug 2025 14:38:54 +0800
Message-ID: <2243d55bc0e5b9cf0a2bef4a21d2564e7f960e64.1755757841.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1755757841.git.zhoubinbin@loongson.cn>
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxT+YIv6ZohPRcAA--.21919S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfZr45tryUXr48KFyrtF13GFX_yoW5CFW3Co
	WfXFn7Ar48tw4xXaySqwn2gF4xZ3Z8uw1UtF1S9as8C3yqyw1DJ3y3Jr47Wa18Xa15Jr4U
	AFyxGanxW39rZr1Ul-sFpf9Il3svdjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYG7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUAVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EoGPUUUUU==

I am going to introduce the NAND controllers of the Loongson-2K series
CPUs, which are similar to Loongson-1.

As preparation, rename all prefixes from Loongson1-specific to
Loongson-generic.

No functional change intended.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS                                   |   2 +-
 drivers/mtd/nand/raw/Kconfig                  |   6 +-
 drivers/mtd/nand/raw/Makefile                 |   2 +-
 ...ontroller.c => loongson-nand-controller.c} | 337 +++++++++---------
 4 files changed, 177 insertions(+), 170 deletions(-)
 rename drivers/mtd/nand/raw/{loongson1-nand-controller.c => loongson-nand-controller.c} (61%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bac4ea21b64..cc502582c9f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16722,7 +16722,7 @@ F:	Documentation/devicetree/bindings/*/loongson,ls1*.yaml
 F:	arch/mips/include/asm/mach-loongson32/
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
-F:	drivers/mtd/nand/raw/loongson1-nand-controller.c
+F:	drivers/mtd/nand/raw/loongson-nand-controller.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
 F:	sound/soc/loongson/loongson1_ac97.c
 
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 4b99d9c422c3..d9e3f13666ac 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -462,12 +462,12 @@ config MTD_NAND_NUVOTON_MA35
 	  Enables support for the NAND controller found on
 	  the Nuvoton MA35 series SoCs.
 
-config MTD_NAND_LOONGSON1
-	tristate "Loongson1 NAND controller"
+config MTD_NAND_LOONGSON
+	tristate "Loongson NAND controller"
 	depends on LOONGSON1_APB_DMA || COMPILE_TEST
 	select REGMAP_MMIO
 	help
-	  Enables support for NAND controller on Loongson1 SoCs.
+	  Enables support for NAND controller on Loongson family chips.
 
 comment "Misc"
 
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 711d043ad4f8..c182b9703a9e 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -59,7 +59,7 @@ obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+= rockchip-nand-controller.o
 obj-$(CONFIG_MTD_NAND_PL35X)		+= pl35x-nand-controller.o
 obj-$(CONFIG_MTD_NAND_RENESAS)		+= renesas-nand-controller.o
 obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)	+= nuvoton-ma35d1-nand-controller.o
-obj-$(CONFIG_MTD_NAND_LOONGSON1)	+= loongson1-nand-controller.o
+obj-$(CONFIG_MTD_NAND_LOONGSON)		+= loongson-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_onfi.o
diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
similarity index 61%
rename from drivers/mtd/nand/raw/loongson1-nand-controller.c
rename to drivers/mtd/nand/raw/loongson-nand-controller.c
index ef8e4f9ce287..b5a7be0fcacc 100644
--- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * NAND Controller Driver for Loongson-1 SoC
+ * NAND Controller Driver for Loongson family chips
  *
  * Copyright (C) 2015-2025 Keguang Zhang <keguang.zhang@gmail.com>
  */
@@ -17,42 +17,45 @@
 #include <linux/regmap.h>
 #include <linux/sizes.h>
 
-/* Loongson-1 NAND Controller Registers */
-#define LS1X_NAND_CMD		0x0
-#define LS1X_NAND_ADDR1		0x4
-#define LS1X_NAND_ADDR2		0x8
-#define LS1X_NAND_TIMING	0xc
-#define LS1X_NAND_IDL		0x10
-#define LS1X_NAND_IDH_STATUS	0x14
-#define LS1X_NAND_PARAM		0x18
-#define LS1X_NAND_OP_NUM	0x1c
-
-/* NAND Command Register Bits */
-#define LS1X_NAND_CMD_OP_DONE		BIT(10)
-#define LS1X_NAND_CMD_OP_SPARE		BIT(9)
-#define LS1X_NAND_CMD_OP_MAIN		BIT(8)
-#define LS1X_NAND_CMD_STATUS		BIT(7)
-#define LS1X_NAND_CMD_RESET		BIT(6)
-#define LS1X_NAND_CMD_READID		BIT(5)
-#define LS1X_NAND_CMD_BLOCKS_ERASE	BIT(4)
-#define LS1X_NAND_CMD_ERASE		BIT(3)
-#define LS1X_NAND_CMD_WRITE		BIT(2)
-#define LS1X_NAND_CMD_READ		BIT(1)
-#define LS1X_NAND_CMD_VALID		BIT(0)
-
-#define LS1X_NAND_WAIT_CYCLE_MASK	GENMASK(7, 0)
-#define LS1X_NAND_HOLD_CYCLE_MASK	GENMASK(15, 8)
-#define LS1X_NAND_CELL_SIZE_MASK	GENMASK(11, 8)
-
-#define LS1X_NAND_COL_ADDR_CYC		2U
-#define LS1X_NAND_MAX_ADDR_CYC		5U
-
-#define BITS_PER_WORD		(4 * BITS_PER_BYTE)
-
-struct ls1x_nand_host;
-
-struct ls1x_nand_op {
-	char addrs[LS1X_NAND_MAX_ADDR_CYC];
+/* Loongson NAND Controller Registers */
+#define LOONGSON_NAND_CMD		0x0
+#define LOONGSON_NAND_ADDR1		0x4
+#define LOONGSON_NAND_ADDR2		0x8
+#define LOONGSON_NAND_TIMING		0xc
+#define LOONGSON_NAND_IDL		0x10
+#define LOONGSON_NAND_IDH_STATUS	0x14
+#define LOONGSON_NAND_PARAM		0x18
+#define LOONGSON_NAND_OP_NUM		0x1c
+
+/* Bitfields of nand command register */
+#define LOONGSON_NAND_CMD_OP_DONE	BIT(10)
+#define LOONGSON_NAND_CMD_OP_SPARE	BIT(9)
+#define LOONGSON_NAND_CMD_OP_MAIN	BIT(8)
+#define LOONGSON_NAND_CMD_STATUS	BIT(7)
+#define LOONGSON_NAND_CMD_RESET		BIT(6)
+#define LOONGSON_NAND_CMD_READID	BIT(5)
+#define LOONGSON_NAND_CMD_BLOCKS_ERASE	BIT(4)
+#define LOONGSON_NAND_CMD_ERASE		BIT(3)
+#define LOONGSON_NAND_CMD_WRITE		BIT(2)
+#define LOONGSON_NAND_CMD_READ		BIT(1)
+#define LOONGSON_NAND_CMD_VALID		BIT(0)
+
+/* Bitfields of nand timing register */
+#define LOONGSON_NAND_WAIT_CYCLE_MASK	GENMASK(7, 0)
+#define LOONGSON_NAND_HOLD_CYCLE_MASK	GENMASK(15, 8)
+
+/* Bitfields of nand parameter register */
+#define LOONGSON_NAND_CELL_SIZE_MASK	GENMASK(11, 8)
+
+#define LOONGSON_NAND_COL_ADDR_CYC	2U
+#define LOONGSON_NAND_MAX_ADDR_CYC	5U
+
+#define BITS_PER_WORD			(4 * BITS_PER_BYTE)
+
+struct loongson_nand_host;
+
+struct loongson_nand_op {
+	char addrs[LOONGSON_NAND_MAX_ADDR_CYC];
 	unsigned int naddrs;
 	unsigned int addrs_offset;
 	unsigned int aligned_offset;
@@ -69,19 +72,19 @@ struct ls1x_nand_op {
 	char *buf;
 };
 
-struct ls1x_nand_data {
+struct loongson_nand_data {
 	unsigned int status_field;
 	unsigned int op_scope_field;
 	unsigned int hold_cycle;
 	unsigned int wait_cycle;
-	void (*set_addr)(struct ls1x_nand_host *host, struct ls1x_nand_op *op);
+	void (*set_addr)(struct loongson_nand_host *host, struct loongson_nand_op *op);
 };
 
-struct ls1x_nand_host {
+struct loongson_nand_host {
 	struct device *dev;
 	struct nand_chip chip;
 	struct nand_controller controller;
-	const struct ls1x_nand_data *data;
+	const struct loongson_nand_data *data;
 	void __iomem *reg_base;
 	struct regmap *regmap;
 	/* DMA Engine stuff */
@@ -91,40 +94,41 @@ struct ls1x_nand_host {
 	struct completion dma_complete;
 };
 
-static const struct regmap_config ls1x_nand_regmap_config = {
+static const struct regmap_config loongson_nand_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
 };
 
-static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls1x_nand_op *op, u8 opcode)
+static int loongson_nand_op_cmd_mapping(struct nand_chip *chip, struct loongson_nand_op *op,
+					u8 opcode)
 {
-	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	struct loongson_nand_host *host = nand_get_controller_data(chip);
 
 	op->row_start = chip->page_shift + 1;
 
 	/* The controller abstracts the following NAND operations. */
 	switch (opcode) {
 	case NAND_CMD_STATUS:
-		op->cmd_reg = LS1X_NAND_CMD_STATUS;
+		op->cmd_reg = LOONGSON_NAND_CMD_STATUS;
 		break;
 	case NAND_CMD_RESET:
-		op->cmd_reg = LS1X_NAND_CMD_RESET;
+		op->cmd_reg = LOONGSON_NAND_CMD_RESET;
 		break;
 	case NAND_CMD_READID:
 		op->is_readid = true;
-		op->cmd_reg = LS1X_NAND_CMD_READID;
+		op->cmd_reg = LOONGSON_NAND_CMD_READID;
 		break;
 	case NAND_CMD_ERASE1:
 		op->is_erase = true;
-		op->addrs_offset = LS1X_NAND_COL_ADDR_CYC;
+		op->addrs_offset = LOONGSON_NAND_COL_ADDR_CYC;
 		break;
 	case NAND_CMD_ERASE2:
 		if (!op->is_erase)
 			return -EOPNOTSUPP;
 		/* During erasing, row_start differs from the default value. */
 		op->row_start = chip->page_shift;
-		op->cmd_reg = LS1X_NAND_CMD_ERASE;
+		op->cmd_reg = LOONGSON_NAND_CMD_ERASE;
 		break;
 	case NAND_CMD_SEQIN:
 		op->is_write = true;
@@ -132,7 +136,7 @@ static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls1x_nand_op
 	case NAND_CMD_PAGEPROG:
 		if (!op->is_write)
 			return -EOPNOTSUPP;
-		op->cmd_reg = LS1X_NAND_CMD_WRITE;
+		op->cmd_reg = LOONGSON_NAND_CMD_WRITE;
 		break;
 	case NAND_CMD_READ0:
 		op->is_read = true;
@@ -140,7 +144,7 @@ static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls1x_nand_op
 	case NAND_CMD_READSTART:
 		if (!op->is_read)
 			return -EOPNOTSUPP;
-		op->cmd_reg = LS1X_NAND_CMD_READ;
+		op->cmd_reg = LOONGSON_NAND_CMD_READ;
 		break;
 	case NAND_CMD_RNDOUT:
 		op->is_change_column = true;
@@ -148,7 +152,7 @@ static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls1x_nand_op
 	case NAND_CMD_RNDOUTSTART:
 		if (!op->is_change_column)
 			return -EOPNOTSUPP;
-		op->cmd_reg = LS1X_NAND_CMD_READ;
+		op->cmd_reg = LOONGSON_NAND_CMD_READ;
 		break;
 	default:
 		dev_dbg(host->dev, "unsupported opcode: %u\n", opcode);
@@ -158,8 +162,8 @@ static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls1x_nand_op
 	return 0;
 }
 
-static int ls1x_nand_parse_instructions(struct nand_chip *chip,
-					const struct nand_subop *subop, struct ls1x_nand_op *op)
+static int loongson_nand_parse_instructions(struct nand_chip *chip, const struct nand_subop *subop,
+					    struct loongson_nand_op *op)
 {
 	unsigned int op_id;
 	int ret;
@@ -171,14 +175,14 @@ static int ls1x_nand_parse_instructions(struct nand_chip *chip,
 
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
-			ret = ls1x_nand_op_cmd_mapping(chip, op, instr->ctx.cmd.opcode);
+			ret = loongson_nand_op_cmd_mapping(chip, op, instr->ctx.cmd.opcode);
 			if (ret < 0)
 				return ret;
 
 			break;
 		case NAND_OP_ADDR_INSTR:
 			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
-			if (naddrs > LS1X_NAND_MAX_ADDR_CYC)
+			if (naddrs > LOONGSON_NAND_MAX_ADDR_CYC)
 				return -EOPNOTSUPP;
 			op->naddrs = naddrs;
 			offset = nand_subop_get_addr_start_off(subop, op_id);
@@ -206,57 +210,57 @@ static int ls1x_nand_parse_instructions(struct nand_chip *chip,
 	return 0;
 }
 
-static void ls1b_nand_set_addr(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
+static void ls1b_nand_set_addr(struct loongson_nand_host *host, struct loongson_nand_op *op)
 {
 	struct nand_chip *chip = &host->chip;
 	int i;
 
-	for (i = 0; i < LS1X_NAND_MAX_ADDR_CYC; i++) {
+	for (i = 0; i < LOONGSON_NAND_MAX_ADDR_CYC; i++) {
 		int shift, mask, val;
 
-		if (i < LS1X_NAND_COL_ADDR_CYC) {
+		if (i < LOONGSON_NAND_COL_ADDR_CYC) {
 			shift = i * BITS_PER_BYTE;
 			mask = (u32)0xff << shift;
 			mask &= GENMASK(chip->page_shift, 0);
 			val = (u32)op->addrs[i] << shift;
-			regmap_update_bits(host->regmap, LS1X_NAND_ADDR1, mask, val);
+			regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR1, mask, val);
 		} else if (!op->is_change_column) {
-			shift = op->row_start + (i - LS1X_NAND_COL_ADDR_CYC) * BITS_PER_BYTE;
+			shift = op->row_start + (i - LOONGSON_NAND_COL_ADDR_CYC) * BITS_PER_BYTE;
 			mask = (u32)0xff << shift;
 			val = (u32)op->addrs[i] << shift;
-			regmap_update_bits(host->regmap, LS1X_NAND_ADDR1, mask, val);
+			regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR1, mask, val);
 
 			if (i == 4) {
 				mask = (u32)0xff >> (BITS_PER_WORD - shift);
 				val = (u32)op->addrs[i] >> (BITS_PER_WORD - shift);
-				regmap_update_bits(host->regmap, LS1X_NAND_ADDR2, mask, val);
+				regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, mask, val);
 			}
 		}
 	}
 }
 
-static void ls1c_nand_set_addr(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
+static void ls1c_nand_set_addr(struct loongson_nand_host *host, struct loongson_nand_op *op)
 {
 	int i;
 
-	for (i = 0; i < LS1X_NAND_MAX_ADDR_CYC; i++) {
+	for (i = 0; i < LOONGSON_NAND_MAX_ADDR_CYC; i++) {
 		int shift, mask, val;
 
-		if (i < LS1X_NAND_COL_ADDR_CYC) {
+		if (i < LOONGSON_NAND_COL_ADDR_CYC) {
 			shift = i * BITS_PER_BYTE;
 			mask = (u32)0xff << shift;
 			val = (u32)op->addrs[i] << shift;
-			regmap_update_bits(host->regmap, LS1X_NAND_ADDR1, mask, val);
+			regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR1, mask, val);
 		} else if (!op->is_change_column) {
-			shift = (i - LS1X_NAND_COL_ADDR_CYC) * BITS_PER_BYTE;
+			shift = (i - LOONGSON_NAND_COL_ADDR_CYC) * BITS_PER_BYTE;
 			mask = (u32)0xff << shift;
 			val = (u32)op->addrs[i] << shift;
-			regmap_update_bits(host->regmap, LS1X_NAND_ADDR2, mask, val);
+			regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, mask, val);
 		}
 	}
 }
 
-static void ls1x_nand_trigger_op(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
+static void loongson_nand_trigger_op(struct loongson_nand_host *host, struct loongson_nand_op *op)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -280,7 +284,7 @@ static void ls1x_nand_trigger_op(struct ls1x_nand_host *host, struct ls1x_nand_o
 	else
 		op->len = op->orig_len;
 
-	writel(op->len, host->reg_base + LS1X_NAND_OP_NUM);
+	writel(op->len, host->reg_base + LOONGSON_NAND_OP_NUM);
 
 	/* set operation area and scope */
 	col = op->addrs[1] << BITS_PER_BYTE | op->addrs[0];
@@ -288,33 +292,35 @@ static void ls1x_nand_trigger_op(struct ls1x_nand_host *host, struct ls1x_nand_o
 		unsigned int op_scope = 0;
 
 		if (col < mtd->writesize) {
-			op->cmd_reg |= LS1X_NAND_CMD_OP_MAIN;
+			op->cmd_reg |= LOONGSON_NAND_CMD_OP_MAIN;
 			op_scope = mtd->writesize;
 		}
 
-		op->cmd_reg |= LS1X_NAND_CMD_OP_SPARE;
+		op->cmd_reg |= LOONGSON_NAND_CMD_OP_SPARE;
 		op_scope += mtd->oobsize;
 
 		op_scope <<= __ffs(host->data->op_scope_field);
-		regmap_update_bits(host->regmap, LS1X_NAND_PARAM,
+		regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM,
 				   host->data->op_scope_field, op_scope);
 	}
 
 	/* set command */
-	writel(op->cmd_reg, host->reg_base + LS1X_NAND_CMD);
+	writel(op->cmd_reg, host->reg_base + LOONGSON_NAND_CMD);
 
 	/* trigger operation */
-	regmap_write_bits(host->regmap, LS1X_NAND_CMD, LS1X_NAND_CMD_VALID, LS1X_NAND_CMD_VALID);
+	regmap_write_bits(host->regmap, LOONGSON_NAND_CMD, LOONGSON_NAND_CMD_VALID,
+			  LOONGSON_NAND_CMD_VALID);
 }
 
-static int ls1x_nand_wait_for_op_done(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
+static int loongson_nand_wait_for_op_done(struct loongson_nand_host *host,
+					  struct loongson_nand_op *op)
 {
 	unsigned int val;
 	int ret = 0;
 
 	if (op->rdy_timeout_ms) {
-		ret = regmap_read_poll_timeout(host->regmap, LS1X_NAND_CMD,
-					       val, val & LS1X_NAND_CMD_OP_DONE,
+		ret = regmap_read_poll_timeout(host->regmap, LOONGSON_NAND_CMD,
+					       val, val & LOONGSON_NAND_CMD_OP_DONE,
 					       0, op->rdy_timeout_ms * MSEC_PER_SEC);
 		if (ret)
 			dev_err(host->dev, "operation failed\n");
@@ -323,9 +329,9 @@ static int ls1x_nand_wait_for_op_done(struct ls1x_nand_host *host, struct ls1x_n
 	return ret;
 }
 
-static void ls1x_nand_dma_callback(void *data)
+static void loongson_nand_dma_callback(void *data)
 {
-	struct ls1x_nand_host *host = (struct ls1x_nand_host *)data;
+	struct loongson_nand_host *host = (struct loongson_nand_host *)data;
 	struct dma_chan *chan = host->dma_chan;
 	struct device *dev = chan->device->dev;
 	enum dma_status status;
@@ -339,7 +345,7 @@ static void ls1x_nand_dma_callback(void *data)
 	}
 }
 
-static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
+static int loongson_nand_dma_transfer(struct loongson_nand_host *host, struct loongson_nand_op *op)
 {
 	struct nand_chip *chip = &host->chip;
 	struct dma_chan *chan = host->dma_chan;
@@ -374,7 +380,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
 		ret = -ENOMEM;
 		goto err;
 	}
-	desc->callback = ls1x_nand_dma_callback;
+	desc->callback = loongson_nand_dma_callback;
 	desc->callback_param = host;
 
 	host->dma_cookie = dmaengine_submit(desc);
@@ -405,51 +411,51 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
 	return ret;
 }
 
-static int ls1x_nand_data_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
+static int loongson_nand_data_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
 {
-	struct ls1x_nand_host *host = nand_get_controller_data(chip);
-	struct ls1x_nand_op op = {};
+	struct loongson_nand_host *host = nand_get_controller_data(chip);
+	struct loongson_nand_op op = {};
 	int ret;
 
-	ret = ls1x_nand_parse_instructions(chip, subop, &op);
+	ret = loongson_nand_parse_instructions(chip, subop, &op);
 	if (ret)
 		return ret;
 
-	ls1x_nand_trigger_op(host, &op);
+	loongson_nand_trigger_op(host, &op);
 
-	ret = ls1x_nand_dma_transfer(host, &op);
+	ret = loongson_nand_dma_transfer(host, &op);
 	if (ret)
 		return ret;
 
-	return ls1x_nand_wait_for_op_done(host, &op);
+	return loongson_nand_wait_for_op_done(host, &op);
 }
 
-static int ls1x_nand_misc_type_exec(struct nand_chip *chip,
-				    const struct nand_subop *subop, struct ls1x_nand_op *op)
+static int loongson_nand_misc_type_exec(struct nand_chip *chip, const struct nand_subop *subop,
+					struct loongson_nand_op *op)
 {
-	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	struct loongson_nand_host *host = nand_get_controller_data(chip);
 	int ret;
 
-	ret = ls1x_nand_parse_instructions(chip, subop, op);
+	ret = loongson_nand_parse_instructions(chip, subop, op);
 	if (ret)
 		return ret;
 
-	ls1x_nand_trigger_op(host, op);
+	loongson_nand_trigger_op(host, op);
 
-	return ls1x_nand_wait_for_op_done(host, op);
+	return loongson_nand_wait_for_op_done(host, op);
 }
 
-static int ls1x_nand_zerolen_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
+static int loongson_nand_zerolen_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
 {
-	struct ls1x_nand_op op = {};
+	struct loongson_nand_op op = {};
 
-	return ls1x_nand_misc_type_exec(chip, subop, &op);
+	return loongson_nand_misc_type_exec(chip, subop, &op);
 }
 
-static int ls1x_nand_read_id_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
+static int loongson_nand_read_id_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
 {
-	struct ls1x_nand_host *host = nand_get_controller_data(chip);
-	struct ls1x_nand_op op = {};
+	struct loongson_nand_host *host = nand_get_controller_data(chip);
+	struct loongson_nand_op op = {};
 	int i, ret;
 	union {
 		char ids[5];
@@ -459,12 +465,12 @@ static int ls1x_nand_read_id_type_exec(struct nand_chip *chip, const struct nand
 		};
 	} nand_id;
 
-	ret = ls1x_nand_misc_type_exec(chip, subop, &op);
+	ret = loongson_nand_misc_type_exec(chip, subop, &op);
 	if (ret)
 		return ret;
 
-	nand_id.idl = readl(host->reg_base + LS1X_NAND_IDL);
-	nand_id.idh = readb(host->reg_base + LS1X_NAND_IDH_STATUS);
+	nand_id.idl = readl(host->reg_base + LOONGSON_NAND_IDL);
+	nand_id.idh = readb(host->reg_base + LOONGSON_NAND_IDH_STATUS);
 
 	for (i = 0; i < min(sizeof(nand_id.ids), op.orig_len); i++)
 		op.buf[i] = nand_id.ids[sizeof(nand_id.ids) - 1 - i];
@@ -472,60 +478,61 @@ static int ls1x_nand_read_id_type_exec(struct nand_chip *chip, const struct nand
 	return ret;
 }
 
-static int ls1x_nand_read_status_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
+static int loongson_nand_read_status_type_exec(struct nand_chip *chip,
+					       const struct nand_subop *subop)
 {
-	struct ls1x_nand_host *host = nand_get_controller_data(chip);
-	struct ls1x_nand_op op = {};
+	struct loongson_nand_host *host = nand_get_controller_data(chip);
+	struct loongson_nand_op op = {};
 	int val, ret;
 
-	ret = ls1x_nand_misc_type_exec(chip, subop, &op);
+	ret = loongson_nand_misc_type_exec(chip, subop, &op);
 	if (ret)
 		return ret;
 
-	val = readl(host->reg_base + LS1X_NAND_IDH_STATUS);
+	val = readl(host->reg_base + LOONGSON_NAND_IDH_STATUS);
 	val &= ~host->data->status_field;
 	op.buf[0] = val << ffs(host->data->status_field);
 
 	return ret;
 }
 
-static const struct nand_op_parser ls1x_nand_op_parser = NAND_OP_PARSER(
+static const struct nand_op_parser loongson_nand_op_parser = NAND_OP_PARSER(
 	NAND_OP_PARSER_PATTERN(
-		ls1x_nand_read_id_type_exec,
+		loongson_nand_read_id_type_exec,
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
-		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LOONGSON_NAND_MAX_ADDR_CYC),
 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 8)),
 	NAND_OP_PARSER_PATTERN(
-		ls1x_nand_read_status_type_exec,
+		loongson_nand_read_status_type_exec,
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 1)),
 	NAND_OP_PARSER_PATTERN(
-		ls1x_nand_zerolen_type_exec,
+		loongson_nand_zerolen_type_exec,
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
 	NAND_OP_PARSER_PATTERN(
-		ls1x_nand_zerolen_type_exec,
+		loongson_nand_zerolen_type_exec,
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
-		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LOONGSON_NAND_MAX_ADDR_CYC),
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
 	NAND_OP_PARSER_PATTERN(
-		ls1x_nand_data_type_exec,
+		loongson_nand_data_type_exec,
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
-		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LOONGSON_NAND_MAX_ADDR_CYC),
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 0)),
 	NAND_OP_PARSER_PATTERN(
-		ls1x_nand_data_type_exec,
+		loongson_nand_data_type_exec,
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
-		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LOONGSON_NAND_MAX_ADDR_CYC),
 		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 0),
 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
 	);
 
-static int ls1x_nand_is_valid_cmd(u8 opcode)
+static int loongson_nand_is_valid_cmd(u8 opcode)
 {
 	if (opcode == NAND_CMD_STATUS || opcode == NAND_CMD_RESET || opcode == NAND_CMD_READID)
 		return 0;
@@ -533,7 +540,7 @@ static int ls1x_nand_is_valid_cmd(u8 opcode)
 	return -EOPNOTSUPP;
 }
 
-static int ls1x_nand_is_valid_cmd_seq(u8 opcode1, u8 opcode2)
+static int loongson_nand_is_valid_cmd_seq(u8 opcode1, u8 opcode2)
 {
 	if (opcode1 == NAND_CMD_RNDOUT && opcode2 == NAND_CMD_RNDOUTSTART)
 		return 0;
@@ -550,7 +557,7 @@ static int ls1x_nand_is_valid_cmd_seq(u8 opcode1, u8 opcode2)
 	return -EOPNOTSUPP;
 }
 
-static int ls1x_nand_check_op(struct nand_chip *chip, const struct nand_operation *op)
+static int loongson_nand_check_op(struct nand_chip *chip, const struct nand_operation *op)
 {
 	const struct nand_op_instr *instr1 = NULL, *instr2 = NULL;
 	int op_id;
@@ -572,23 +579,23 @@ static int ls1x_nand_check_op(struct nand_chip *chip, const struct nand_operatio
 		return -EOPNOTSUPP;
 
 	if (!instr2)
-		return ls1x_nand_is_valid_cmd(instr1->ctx.cmd.opcode);
+		return loongson_nand_is_valid_cmd(instr1->ctx.cmd.opcode);
 
-	return ls1x_nand_is_valid_cmd_seq(instr1->ctx.cmd.opcode, instr2->ctx.cmd.opcode);
+	return loongson_nand_is_valid_cmd_seq(instr1->ctx.cmd.opcode, instr2->ctx.cmd.opcode);
 }
 
-static int ls1x_nand_exec_op(struct nand_chip *chip,
-			     const struct nand_operation *op, bool check_only)
+static int loongson_nand_exec_op(struct nand_chip *chip, const struct nand_operation *op,
+				 bool check_only)
 {
 	if (check_only)
-		return ls1x_nand_check_op(chip, op);
+		return loongson_nand_check_op(chip, op);
 
-	return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op, check_only);
+	return nand_op_parser_exec_op(chip, &loongson_nand_op_parser, op, check_only);
 }
 
-static int ls1x_nand_attach_chip(struct nand_chip *chip)
+static int loongson_nand_attach_chip(struct nand_chip *chip)
 {
-	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	struct loongson_nand_host *host = nand_get_controller_data(chip);
 	u64 chipsize = nanddev_target_size(&chip->base);
 	int cell_size = 0;
 
@@ -632,14 +639,14 @@ static int ls1x_nand_attach_chip(struct nand_chip *chip)
 	}
 
 	/* set cell size */
-	regmap_update_bits(host->regmap, LS1X_NAND_PARAM, LS1X_NAND_CELL_SIZE_MASK,
-			   FIELD_PREP(LS1X_NAND_CELL_SIZE_MASK, cell_size));
+	regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, LOONGSON_NAND_CELL_SIZE_MASK,
+			   FIELD_PREP(LOONGSON_NAND_CELL_SIZE_MASK, cell_size));
 
-	regmap_update_bits(host->regmap, LS1X_NAND_TIMING, LS1X_NAND_HOLD_CYCLE_MASK,
-			   FIELD_PREP(LS1X_NAND_HOLD_CYCLE_MASK, host->data->hold_cycle));
+	regmap_update_bits(host->regmap, LOONGSON_NAND_TIMING, LOONGSON_NAND_HOLD_CYCLE_MASK,
+			   FIELD_PREP(LOONGSON_NAND_HOLD_CYCLE_MASK, host->data->hold_cycle));
 
-	regmap_update_bits(host->regmap, LS1X_NAND_TIMING, LS1X_NAND_WAIT_CYCLE_MASK,
-			   FIELD_PREP(LS1X_NAND_WAIT_CYCLE_MASK, host->data->wait_cycle));
+	regmap_update_bits(host->regmap, LOONGSON_NAND_TIMING, LOONGSON_NAND_WAIT_CYCLE_MASK,
+			   FIELD_PREP(LOONGSON_NAND_WAIT_CYCLE_MASK, host->data->wait_cycle));
 
 	chip->ecc.read_page_raw = nand_monolithic_read_page_raw;
 	chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
@@ -647,25 +654,25 @@ static int ls1x_nand_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
-static const struct nand_controller_ops ls1x_nand_controller_ops = {
-	.exec_op = ls1x_nand_exec_op,
-	.attach_chip = ls1x_nand_attach_chip,
+static const struct nand_controller_ops loongson_nand_controller_ops = {
+	.exec_op = loongson_nand_exec_op,
+	.attach_chip = loongson_nand_attach_chip,
 };
 
-static void ls1x_nand_controller_cleanup(struct ls1x_nand_host *host)
+static void loongson_nand_controller_cleanup(struct loongson_nand_host *host)
 {
 	if (host->dma_chan)
 		dma_release_channel(host->dma_chan);
 }
 
-static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
+static int loongson_nand_controller_init(struct loongson_nand_host *host)
 {
 	struct device *dev = host->dev;
 	struct dma_chan *chan;
 	struct dma_slave_config cfg = {};
 	int ret;
 
-	host->regmap = devm_regmap_init_mmio(dev, host->reg_base, &ls1x_nand_regmap_config);
+	host->regmap = devm_regmap_init_mmio(dev, host->reg_base, &loongson_nand_regmap_config);
 	if (IS_ERR(host->regmap))
 		return dev_err_probe(dev, PTR_ERR(host->regmap), "failed to init regmap\n");
 
@@ -687,7 +694,7 @@ static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
 	return 0;
 }
 
-static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
+static int loongson_nand_chip_init(struct loongson_nand_host *host)
 {
 	struct device *dev = host->dev;
 	int nchips = of_get_child_count(dev->of_node);
@@ -728,11 +735,11 @@ static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
 	return 0;
 }
 
-static int ls1x_nand_probe(struct platform_device *pdev)
+static int loongson_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct ls1x_nand_data *data;
-	struct ls1x_nand_host *host;
+	const struct loongson_nand_data *data;
+	struct loongson_nand_host *host;
 	struct resource *res;
 	int ret;
 
@@ -759,15 +766,15 @@ static int ls1x_nand_probe(struct platform_device *pdev)
 
 	host->dev = dev;
 	host->data = data;
-	host->controller.ops = &ls1x_nand_controller_ops;
+	host->controller.ops = &loongson_nand_controller_ops;
 
 	nand_controller_init(&host->controller);
 
-	ret = ls1x_nand_controller_init(host);
+	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
 
-	ret = ls1x_nand_chip_init(host);
+	ret = loongson_nand_chip_init(host);
 	if (ret)
 		goto err;
 
@@ -775,31 +782,31 @@ static int ls1x_nand_probe(struct platform_device *pdev)
 
 	return 0;
 err:
-	ls1x_nand_controller_cleanup(host);
+	loongson_nand_controller_cleanup(host);
 
 	return ret;
 }
 
-static void ls1x_nand_remove(struct platform_device *pdev)
+static void loongson_nand_remove(struct platform_device *pdev)
 {
-	struct ls1x_nand_host *host = platform_get_drvdata(pdev);
+	struct loongson_nand_host *host = platform_get_drvdata(pdev);
 	struct nand_chip *chip = &host->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-	ls1x_nand_controller_cleanup(host);
+	loongson_nand_controller_cleanup(host);
 }
 
-static const struct ls1x_nand_data ls1b_nand_data = {
+static const struct loongson_nand_data ls1b_nand_data = {
 	.status_field = GENMASK(15, 8),
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
 	.set_addr = ls1b_nand_set_addr,
 };
 
-static const struct ls1x_nand_data ls1c_nand_data = {
+static const struct loongson_nand_data ls1c_nand_data = {
 	.status_field = GENMASK(23, 16),
 	.op_scope_field = GENMASK(29, 16),
 	.hold_cycle = 0x2,
@@ -807,7 +814,7 @@ static const struct ls1x_nand_data ls1c_nand_data = {
 	.set_addr = ls1c_nand_set_addr,
 };
 
-static const struct of_device_id ls1x_nand_match[] = {
+static const struct of_device_id loongson_nand_match[] = {
 	{
 		.compatible = "loongson,ls1b-nand-controller",
 		.data = &ls1b_nand_data,
@@ -818,19 +825,19 @@ static const struct of_device_id ls1x_nand_match[] = {
 	},
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, ls1x_nand_match);
+MODULE_DEVICE_TABLE(of, loongson_nand_match);
 
-static struct platform_driver ls1x_nand_driver = {
-	.probe = ls1x_nand_probe,
-	.remove = ls1x_nand_remove,
+static struct platform_driver loongson_nand_driver = {
+	.probe = loongson_nand_probe,
+	.remove = loongson_nand_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.of_match_table = ls1x_nand_match,
+		.of_match_table = loongson_nand_match,
 	},
 };
 
-module_platform_driver(ls1x_nand_driver);
+module_platform_driver(loongson_nand_driver);
 
 MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
-MODULE_DESCRIPTION("Loongson-1 NAND Controller Driver");
+MODULE_DESCRIPTION("Loongson NAND Controller Driver");
 MODULE_LICENSE("GPL");
-- 
2.47.3

