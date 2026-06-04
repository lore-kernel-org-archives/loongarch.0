Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACC2271450
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 02:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539105; cv=none; b=eq3L67ML34BIGqMRFjNpHi9YII4McvEar8ieoMd74Z/0cbsf/a0xPv6Qn2NypGjDg9oBzBX+lXf6py3GREy6kJIoUtJUsMLn48Cdta6Z0Rvag6h2RCwOOAYnOapV9ZCwFcelorBP6Ggi/viFZYczMvWPMzad39yZVxEqrZmzUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539105; c=relaxed/simple;
	bh=x0rjkB6VSM2DpvHGtAv6lYGGTUZrteHbc6IfcLCKDsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0XOAS8LR8PYg/xc5M9AOSxd+cbx3L9ubAfuH5nEMAj41nIcoheSql8bGrO0520aMiVgjOLuLS+I8ctBv+n/tDnJ2kiWZ7GtppHloJiyjPymSD0AUiV9Lx0UdhVDSeYXiFV1CVXlmJ9fsQ4nRGiZgx10meIhdrkiVAL6zl+t/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8AxvsDc3iBqLWEQAA--.21803S3;
	Thu, 04 Jun 2026 10:11:40 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJBx78LZ3iBq1UabAA--.33017S4;
	Thu, 04 Jun 2026 10:11:40 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 2/7] ASoC: loongson: Add Loongson-2K0300 I2S controller support
Date: Thu,  4 Jun 2026 10:11:22 +0800
Message-ID: <4b003425d16a18049c5b90dbdaf91024e265cd8e.1780538113.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1780538113.git.zhoubinbin@loongson.cn>
References: <cover.1780538113.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx78LZ3iBq1UabAA--.33017S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEICGofwl8ZYAAAsR
X-Coremail-Antispam: 1Uk129KBj93XoWxXFyfZF13ZF1kZF1kKw4UGFX_yoWrWr1fpr
	sxCaySgrWYgF1akFZxJrWkAF15uryftasrGF47Gw4xG3sIy34Fvwn5KF1ayF4xCFyDCryU
	Xa95KFW8CF45WFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7
	AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jo
	VbgUUUUU=

The Loongson-2K0300 I2S interface differs significantly from the
Loongson-2K1000. Although both utilize external DMA controllers, the
Loongson-2K0300 does not require additional registers for routing
configuration.

Due to hardware design flaw, an extra controller reset sequence is
required during probe.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_i2s_plat.c | 42 +++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/loongson_i2s_plat.c
index ac054b6ce632..b4d807ee7f8f 100644
--- a/sound/soc/loongson/loongson_i2s_plat.c
+++ b/sound/soc/loongson/loongson_i2s_plat.c
@@ -2,7 +2,7 @@
 //
 // Loongson I2S controller master mode dirver(platform device)
 //
-// Copyright (C) 2023-2024 Loongson Technology Corporation Limited
+// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
 //
 // Author: Yingkun Meng <mengyingkun@loongson.cn>
 //         Binbin Zhou <zhoubinbin@loongson.cn>
@@ -21,6 +21,7 @@
 #include "loongson_i2s.h"
 #include "loongson_dma.h"
 
+/* Loongson-2K1000 APBDMA routing */
 #define LOONGSON_I2S_RX_DMA_OFFSET	21
 #define LOONGSON_I2S_TX_DMA_OFFSET	18
 
@@ -30,6 +31,11 @@
 #define LOONGSON_DMA3_CONF	0x3
 #define LOONGSON_DMA4_CONF	0x4
 
+struct loongson_i2s_plat_config {
+	int rev_id;
+	int (*i2s_dma_config)(struct platform_device *pdev);
+};
+
 static int loongson_i2s_apbdma_config(struct platform_device *pdev)
 {
 	int val;
@@ -47,8 +53,18 @@ static int loongson_i2s_apbdma_config(struct platform_device *pdev)
 	return 0;
 }
 
+static struct loongson_i2s_plat_config ls2k1000_i2s_plat_config = {
+	.rev_id = 0,
+	.i2s_dma_config = loongson_i2s_apbdma_config,
+};
+
+static struct loongson_i2s_plat_config ls2k0300_i2s_plat_config = {
+	.rev_id = 1,
+};
+
 static int loongson_i2s_plat_probe(struct platform_device *pdev)
 {
+	const struct loongson_i2s_plat_config *plat_config;
 	struct device *dev = &pdev->dev;
 	struct loongson_i2s *i2s;
 	struct resource *res;
@@ -59,12 +75,17 @@ static int loongson_i2s_plat_probe(struct platform_device *pdev)
 	if (!i2s)
 		return -ENOMEM;
 
-	ret = loongson_i2s_apbdma_config(pdev);
-	if (ret)
-		return ret;
+	plat_config = device_get_match_data(dev);
+	if (!plat_config)
+		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2s->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	if (plat_config->i2s_dma_config) {
+		ret = plat_config->i2s_dma_config(pdev);
+		if (ret)
+			return ret;
+	}
+
+	i2s->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->reg_base))
 		return dev_err_probe(dev, PTR_ERR(i2s->reg_base),
 				     "devm_ioremap_resource failed\n");
@@ -87,11 +108,17 @@ static int loongson_i2s_plat_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s_clk))
 		return dev_err_probe(dev, PTR_ERR(i2s_clk), "clock property invalid\n");
 	i2s->clk_rate = clk_get_rate(i2s_clk);
+	i2s->rev_id = plat_config->rev_id;
 
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
 	dev_set_name(dev, LS_I2S_DRVNAME);
 	dev_set_drvdata(dev, i2s);
 
+	if (i2s->rev_id == 1) {
+		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_RESET, I2S_CTRL_RESET);
+		fsleep(200);
+	}
+
 	ret = devm_snd_soc_register_component(dev, &loongson_i2s_edma_component,
 					      &loongson_i2s_dai, 1);
 	if (ret)
@@ -102,7 +129,8 @@ static int loongson_i2s_plat_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id loongson_i2s_ids[] = {
-	{ .compatible = "loongson,ls2k1000-i2s" },
+	{ .compatible = "loongson,ls2k0300-i2s", .data = &ls2k0300_i2s_plat_config },
+	{ .compatible = "loongson,ls2k1000-i2s", .data = &ls2k1000_i2s_plat_config },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, loongson_i2s_ids);
-- 
2.52.0

