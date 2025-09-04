Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725002FD1BA
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991233; cv=none; b=LNMril7TzlhWwpoYobRvNHj3TjY3spfsOplQmvbtIhwa6GX4knoXu221vhjc9vzE2WB5feYOb3w3EYFy9h9ek3DX8qF0iksMvmxXrc65OMSnUhXl6k3o8f0aE5nkcFjzdpfOgfQuWJXlQcah5ruGipGg7mqnaOm/QHXQyFf1ZYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991233; c=relaxed/simple;
	bh=jz+X+kWbW8EPQQdcv+bUZfVQCs5JfHDU+5Er/bXJG80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYDp2FxNTz7rfVZKgB3cg09xEcWXhNKfltV7B2dYS8dykSeGVQiXO1JJfJWsu6st9t6sNOfOdW3SVKpi5q2jsIb9rUGrm1ff4NGUNOcvB4z/SqoMwfr6capnx7JnS6v11wnT1IXPNLSXZSXmqWP+j5+ypzEwBb6MKLwnGQewxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8Dx+tHzjrloR6wGAA--.14196S3;
	Thu, 04 Sep 2025 21:06:59 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJCxocLpjrlofA5+AA--.2906S4;
	Thu, 04 Sep 2025 21:06:59 +0800 (CST)
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
Subject: [PATCH v4 2/7] mtd: rawnand: loongson: Add 6-byte NAND ID reading support
Date: Thu,  4 Sep 2025 21:06:34 +0800
Message-ID: <27a9ff3bfde299badcd5c3cb121021144c0a2476.1756991031.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxocLpjrlofA5+AA--.2906S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw18WF43ZrWrCFW3CFy7XFc_yoW5KF17pa
	yrAwsIkrs8tr4a9FyjqFZ8CF15uryfJ39rGa97u34I9wn3Jw17Wa45GF1FyFnIkr1Yqr1U
	ZFyvga9Y9anrJrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07je1v3UUUUU=

From: Keguang Zhang <keguang.zhang@gmail.com>

Loongson-1C and Loongson-2K SoCs support NAND flash chips with 6-byte ID.
However, the current implementation only handles 5-byte ID which can lead
to incorrect chip detection.

Extend loongson_nand_read_id_type_exec() to support 6-byte NAND ID.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
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

