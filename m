Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B592FC01B
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 02:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440850; cv=none; b=MZ7tBkgvucSlozyFD4OMHrunlwThtQq6YHUCI7bRZDUdKRvcZlwv5ekT4+HBqsiWnGaMX6ePj47E/py9glbQ9WpF9ZJ+bPyiBNFwGYvjjxnBy93knoUd6x/Vb3+qSo0sJWPvYeZkhF09lKEZ3HZQZMPbs8rHEhtStJd8NLPmHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440850; c=relaxed/simple;
	bh=9jjZO49qbEjlqprPQgCYrZ5arnRSH24CacRg4fo7BpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHmd/3MccA60Rfv9ki16fIJSFHmfuxlgzYEi02hpgZYG32lmk86/+H6i2F1PjpD3P+waNRBJAmRp+oOXOXmSszSBpOMj5yElRBHbD7suXVYJ6E9WxwuGRNTcszs9kAsZLvHB8vmbVzcgeDYS4ogF2GcMOwd2kpWQRsDVzsMjrI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8CxX+qL4z1q0TAYAA--.61186S3;
	Fri, 26 Jun 2026 10:27:23 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJBxSeCC4z1qim2zAA--.12873S5;
	Fri, 26 Jun 2026 10:27:23 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 3/9] ASoC: loongson: Add Loongson-2K0300 I2S controller support
Date: Fri, 26 Jun 2026 10:27:05 +0800
Message-ID: <4d3caa62d4275e1495505387198408f4d30d453c.1782439646.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeCC4z1qim2zAA--.12873S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGo8w2QamQAAsw
X-Coremail-Antispam: 1Uk129KBj93XoWxXFyfZF13ZF1kZF1kKw4UGFX_yoWrWr4fpr
	sxCaySgrWYgF1akFZxJrWkAF15Cryfta9xGF47G3yxG3sIy34Fvwn5KF1ayF4xCFyDCryU
	Xa95KFW8CF15WFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==

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
index ac054b6ce632..82d95c6644ef 100644
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
 
+static const struct loongson_i2s_plat_config ls2k0300_i2s_plat_config = {
+	.rev_id = 1,
+};
+
+static const struct loongson_i2s_plat_config ls2k1000_i2s_plat_config = {
+	.rev_id = 0,
+	.i2s_dma_config = loongson_i2s_apbdma_config,
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

