Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3B3270EA5
	for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175482; cv=none; b=ILkqNhLj1wzHCivm3itqRBhCt3v9koR9eyGef/K+KTCccgv4hbOMB+Zx2OpYGiJU7/1kC98tzfe3ULY4cQ7PMotf9wXKfKAA+ZdEQIoDTlPmFsL5okyDBMrTkvaLhANuySHnkfU8s8RhH4/KjVBI5DWG7gHTqLGSGQOEQJdy7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175482; c=relaxed/simple;
	bh=B+ALHIxSvZfleHOCGm3/XpUzcvYjO6YL3YckyYcIH84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfJwgYkF9mSWfo00u9YT3jrjCurQi0MrSfcAAmdIG41jYzcZSJNeK+EQWdJOJa7xiieiI/NspkPxOvFXrkqF7CWgoN8X5AzOiTpMg7CN2mrjCRTxUb4Qd1I3oXldipIzz0WWulmBeUcfMH2FYd2NvDvZPBb/CGhhnmBSlo3vsmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8AxmnG2VX9omn8vAQ--.31007S3;
	Tue, 22 Jul 2025 17:11:18 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJDx_8OzVX9o7bIhAA--.43818S2;
	Tue, 22 Jul 2025 17:11:18 +0800 (CST)
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
Subject: [PATCH v1 4/8] mtd: rawnand: loongson: Add nand chip select support
Date: Tue, 22 Jul 2025 17:11:03 +0800
Message-ID: <b183cac3e7fc1613bd9ea07a19ec0de7b0f86e70.1753166096.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1753166096.git.zhoubinbin@loongson.cn>
References: <cover.1753166096.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDx_8OzVX9o7bIhAA--.43818S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Ar1kJF15Xw1rGFyUuryDJwc_yoW7KrWUpa
	y5Aw4Skrn5KF1Uur4DKFs5Cr1ay3yrtrZrGFZ2934SkwnxJ347WF15CFyYqFWF9w1UKw1a
	vw4vga97CF17WrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY
	6Fy7McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUneRRtUUUUU==

The page address register describes the page address of the starting
address for NAND read/write/erase operations.

According to the manual, it consists of two parts:
	{chip select, page number}

The `chip select` is fixed at 2 bits, and the `page number` is
determined based on the actual capacity of the single-chip memory.
Therefore we need to determine the `chip select` bits base on the `page
number`.

For example, for a 1GB capacity chip (2K page size), it has 1M pages.
Thus, [19:0] is used to represent the page number, and [21:20]
represents the chip select.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../mtd/nand/raw/loongson-nand-controller.c   | 133 ++++++++++++++----
 1 file changed, 103 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 97cd566420a8..5a51c7d299cc 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -82,6 +82,7 @@ struct loongson_nand_data {
 	unsigned int op_scope_field;
 	unsigned int hold_cycle;
 	unsigned int wait_cycle;
+	unsigned int nand_cs;
 	void (*set_addr)(struct loongson_nand_host *host, struct loongson_nand_op *op);
 };
 
@@ -90,6 +91,7 @@ struct loongson_nand_host {
 	struct nand_chip chip;
 	struct nand_controller controller;
 	const struct loongson_nand_data *data;
+	unsigned int addr_cs_field;
 	void __iomem *reg_base;
 	struct regmap *regmap;
 	/* DMA Engine stuff */
@@ -215,6 +217,26 @@ static int loongson_nand_parse_instructions(struct nand_chip *chip, const struct
 	return 0;
 }
 
+static void loongson_nand_set_addr_cs(struct loongson_nand_host *host)
+{
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	if (!host->data->nand_cs)
+		return;
+
+	/*
+	 * The Manufacturer/Chip ID read operation precedes attach_chip, at which point
+	 * information such as NAND chip selection and capacity is unknown. As a
+	 * workaround, we use 128MB cellsize (2KB pagesize) as a fallback.
+	 */
+	if (!mtd->writesize)
+		host->addr_cs_field = GENMASK(17, 16);
+
+	regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, host->addr_cs_field,
+			   host->data->nand_cs << __ffs(host->addr_cs_field));
+}
+
 static void ls1b_nand_set_addr(struct loongson_nand_host *host, struct loongson_nand_op *op)
 {
 	struct nand_chip *chip = &host->chip;
@@ -263,6 +285,8 @@ static void ls1c_nand_set_addr(struct loongson_nand_host *host, struct loongson_
 			regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, mask, val);
 		}
 	}
+
+	loongson_nand_set_addr_cs(host);
 }
 
 static void loongson_nand_trigger_op(struct loongson_nand_host *host, struct loongson_nand_op *op)
@@ -603,42 +627,89 @@ static int loongson_nand_exec_op(struct nand_chip *chip, const struct nand_opera
 	return nand_op_parser_exec_op(chip, &loongson_nand_op_parser, op, check_only);
 }
 
-static int loongson_nand_attach_chip(struct nand_chip *chip)
+static int loongson_nand_get_chip_capacity(struct nand_chip *chip)
 {
 	struct loongson_nand_host *host = nand_get_controller_data(chip);
 	u64 chipsize = nanddev_target_size(&chip->base);
-	int cell_size = 0;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	switch (chipsize) {
-	case SZ_128M:
-		cell_size = 0x0;
-		break;
-	case SZ_256M:
-		cell_size = 0x1;
-		break;
-	case SZ_512M:
-		cell_size = 0x2;
-		break;
-	case SZ_1G:
-		cell_size = 0x3;
-		break;
-	case SZ_2G:
-		cell_size = 0x4;
-		break;
-	case SZ_4G:
-		cell_size = 0x5;
-		break;
-	case SZ_8G:
-		cell_size = 0x6;
-		break;
-	case SZ_16G:
-		cell_size = 0x7;
-		break;
-	default:
-		dev_err(host->dev, "unsupported chip size: %llu MB\n", chipsize);
-		return -EINVAL;
+	if (mtd->writesize == SZ_4K && chipsize == SZ_2G) {
+		host->addr_cs_field = GENMASK(20, 19);
+		return 0x4;
 	}
 
+	if (mtd->writesize == SZ_2K) {
+		switch (chipsize) {
+		case SZ_128M:
+			host->addr_cs_field = GENMASK(17, 16);
+			return 0;
+		case SZ_256M:
+			host->addr_cs_field = GENMASK(18, 17);
+			return 0x1;
+		case SZ_512M:
+			host->addr_cs_field = GENMASK(19, 18);
+			return 0x2;
+		case SZ_1G:
+			host->addr_cs_field = GENMASK(20, 19);
+			return 0x3;
+		default:
+			goto err;
+		}
+	}
+
+	if (mtd->writesize == SZ_8K) {
+		switch (chipsize) {
+		case SZ_4G:
+			host->addr_cs_field = GENMASK(20, 19);
+			return 0x5;
+		case SZ_8G:
+			host->addr_cs_field = GENMASK(21, 20);
+			return 0x6;
+		case SZ_16G:
+			host->addr_cs_field = GENMASK(22, 21);
+			return 0x7;
+		default:
+			goto err;
+		}
+	}
+
+	if (mtd->writesize == SZ_512) {
+		switch (chipsize) {
+		case SZ_8M:
+			host->addr_cs_field = GENMASK(15, 14);
+			return 0x9;
+		case SZ_16M:
+			host->addr_cs_field = GENMASK(16, 15);
+			return 0xa;
+		case SZ_32M:
+			host->addr_cs_field = GENMASK(17, 16);
+			return 0xb;
+		case SZ_64M:
+			host->addr_cs_field = GENMASK(18, 17);
+			return 0xc;
+		case SZ_128M:
+			host->addr_cs_field = GENMASK(19, 18);
+			return 0xd;
+		default:
+			goto err;
+		}
+	}
+
+err:
+	dev_err(host->dev, "Unsupported chip size: %llu MB with page size %u B\n",
+		chipsize, mtd->writesize);
+	return -EINVAL;
+}
+
+static int loongson_nand_attach_chip(struct nand_chip *chip)
+{
+	struct loongson_nand_host *host = nand_get_controller_data(chip);
+	int cell_size = 0;
+
+	cell_size = loongson_nand_get_chip_capacity(chip);
+	if (cell_size < 0)
+		return cell_size;
+
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_NONE:
 		break;
@@ -818,6 +889,7 @@ static const struct loongson_nand_data ls1b_nand_data = {
 	.status_field = GENMASK(15, 8),
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
+	.nand_cs = 0x0,
 	.set_addr = ls1b_nand_set_addr,
 };
 
@@ -828,6 +900,7 @@ static const struct loongson_nand_data ls1c_nand_data = {
 	.op_scope_field = GENMASK(29, 16),
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
+	.nand_cs = 0x0,
 	.set_addr = ls1c_nand_set_addr,
 };
 
-- 
2.47.3

