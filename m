Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2ECD2DAFB2
	for <loongarch@lists.linux.dev>; Tue, 22 Jul 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175466; cv=none; b=VHGqPzghfzfEVutYS+eX18ocIL6/TiuaXaJpnySAwacqS7weEEX7ws8f9o/aCdNYIEfdX0jF/m+g3UKawyRbfJ/WivlT3SVzW73Nza5epCsD0NkeLCzpcry1TioNPjKrkjNrnLujKIOODCRfqwuBin1P3n0X8Qfz++5DVlJa2+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175466; c=relaxed/simple;
	bh=fMyuKpZX3ynh/FaEEAEWr/uI2NiSdpr1PH03YqpiUEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAE7vZtoccGu8NzJ/KV1ai5XP/MHICFR+5VXXQuTyFSC5sKXCU5E0jmCh3m5bipbhCdeG9sPlJ00V/RCCkz58g04ChWwdZYKM+U6NJey+GOYlVlpvC09fWInEr/YgmeOu0bYji/f9G6IDJkjCI/ebQnV95I/ehItkajr9Gz0nd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8DxQK+kVX9oWX8vAQ--.61753S3;
	Tue, 22 Jul 2025 17:11:00 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJAxQMKUVX9oprIhAA--.38699S5;
	Tue, 22 Jul 2025 17:10:59 +0800 (CST)
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
Subject: [PATCH v1 3/8] mtd: rawnand: loongson: Add 6-byte NAND ID reading support
Date: Tue, 22 Jul 2025 17:10:34 +0800
Message-ID: <7777bd2b47bdc4ab1406500d0abcd428cc15fba5.1753166096.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJAxQMKUVX9oprIhAA--.38699S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw1UKF15uFWUWFW3Gw1fKrX_yoW5KF17pa
	yrAwsIkrs5tr4a9FyjqFZ8CF15uryfJ39rGa97u34I9wn3Jw17Wa45GF1FyFnIkryYqr1U
	ZFyvga9Y9anrJrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxhiSDUUUU

From: Keguang Zhang <keguang.zhang@gmail.com>

Loongson-1C and Loongson-2K SoCs support NAND flash chips with 6-byte ID.
However, the current implementation only handles 5-byte ID which can lead
to incorrect chip detection.

Extend loongson_nand_read_id_type_exec() to support 6-byte NAND ID.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 .../mtd/nand/raw/loongson-nand-controller.c   | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index b5a7be0fcacc..97cd566420a8 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -50,6 +50,9 @@
 #define LOONGSON_NAND_COL_ADDR_CYC	2U
 #define LOONGSON_NAND_MAX_ADDR_CYC	5U
 
+#define LOONGSON_NAND_READ_ID_SLEEP_US		1000
+#define LOONGSON_NAND_READ_ID_TIMEOUT_US	5000
+
 #define BITS_PER_WORD			(4 * BITS_PER_BYTE)
 
 struct loongson_nand_host;
@@ -73,6 +76,8 @@ struct loongson_nand_op {
 };
 
 struct loongson_nand_data {
+	unsigned int max_id_cycle;
+	unsigned int id_cycle_field;
 	unsigned int status_field;
 	unsigned int op_scope_field;
 	unsigned int hold_cycle;
@@ -458,10 +463,10 @@ static int loongson_nand_read_id_type_exec(struct nand_chip *chip, const struct
 	struct loongson_nand_op op = {};
 	int i, ret;
 	union {
-		char ids[5];
+		char ids[6];
 		struct {
 			int idl;
-			char idh;
+			u16 idh;
 		};
 	} nand_id;
 
@@ -469,11 +474,16 @@ static int loongson_nand_read_id_type_exec(struct nand_chip *chip, const struct
 	if (ret)
 		return ret;
 
-	nand_id.idl = readl(host->reg_base + LOONGSON_NAND_IDL);
-	nand_id.idh = readb(host->reg_base + LOONGSON_NAND_IDH_STATUS);
+	ret = regmap_read_poll_timeout(host->regmap, LOONGSON_NAND_IDL, nand_id.idl, nand_id.idl,
+				       LOONGSON_NAND_READ_ID_SLEEP_US,
+				       LOONGSON_NAND_READ_ID_TIMEOUT_US);
+	if (ret)
+		return ret;
 
-	for (i = 0; i < min(sizeof(nand_id.ids), op.orig_len); i++)
-		op.buf[i] = nand_id.ids[sizeof(nand_id.ids) - 1 - i];
+	nand_id.idh = readw(host->reg_base + LOONGSON_NAND_IDH_STATUS);
+
+	for (i = 0; i < min(host->data->max_id_cycle, op.orig_len); i++)
+		op.buf[i] = nand_id.ids[host->data->max_id_cycle - 1 - i];
 
 	return ret;
 }
@@ -676,6 +686,10 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 	if (IS_ERR(host->regmap))
 		return dev_err_probe(dev, PTR_ERR(host->regmap), "failed to init regmap\n");
 
+	if (host->data->id_cycle_field)
+		regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, host->data->id_cycle_field,
+				   host->data->max_id_cycle << __ffs(host->data->id_cycle_field));
+
 	chan = dma_request_chan(dev, "rxtx");
 	if (IS_ERR(chan))
 		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channel\n");
@@ -800,6 +814,7 @@ static void loongson_nand_remove(struct platform_device *pdev)
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {
+	.max_id_cycle = 5,
 	.status_field = GENMASK(15, 8),
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
@@ -807,6 +822,8 @@ static const struct loongson_nand_data ls1b_nand_data = {
 };
 
 static const struct loongson_nand_data ls1c_nand_data = {
+	.max_id_cycle = 6,
+	.id_cycle_field = GENMASK(14, 12),
 	.status_field = GENMASK(23, 16),
 	.op_scope_field = GENMASK(29, 16),
 	.hold_cycle = 0x2,
-- 
2.47.3

