Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6A71ACE03
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866377; cv=none; b=Fc0t3ZHIEHXsJURQPZBQHbhbguaH067jGE4yh7/SMWFW+JjsO7oCP2TtdGexT0lFjNAOcqJq7uQy8OvffVTlhGBZWVC+I9sg+3S1/jYtCfK93zuLlljzEFuXtrLUUULivRizgo9qX4r19OZYBZ37G2c/JB0M3WZKkuvHf4nuWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866377; c=relaxed/simple;
	bh=4v1hNFa8gP8yNSkPi4WvZqpiFm1g6Ql57CTLvLNJSAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BD0Eta3t3u6mNqkQkV/3jlRH5selj7o01JrbcNNgodWYBRn0Prz8bqfcywtdY8iTaAO8s7NJCvMF0j70PDrVKv2Pxm02Sf0lchItVLM6kh4mr+FPFY5mOEAYHbsYb97/8dWnoRbbbqLQ4JheHIt5BXnJsm/WgLMTWQzeLptgdcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.147])
	by gateway (Coremail) with SMTP id _____8CxB+mFod5mD5kCAA--.4957S3;
	Mon, 09 Sep 2024 15:19:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.147])
	by front1 (Coremail) with SMTP id qMiowMCxodZ+od5mqyoCAA--.12416S5;
	Mon, 09 Sep 2024 15:19:32 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	linux-sound@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 3/8] ASoC: loongson: Simplify with dev_err_probe()
Date: Mon,  9 Sep 2024 15:19:07 +0800
Message-ID: <07855aa6c290ec826d63e68b898e7f4afac5e30d.1725844530.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1725844530.git.zhoubinbin@loongson.cn>
References: <cover.1725844530.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxodZ+od5mqyoCAA--.12416S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr17GF45AFWDCr1DXryxJFc_yoWrGryUpr
	ZxJay3KryrXF1fZ343Jr48AF1Yyry7ZayxXa1xJw1xtr9xArn0g3y3GF4IvayFkFWUX34U
	X348Way8Ca17WFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jqRRiUUUUU=

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c    | 23 ++++++++-----------
 sound/soc/loongson/loongson_i2s_pci.c | 33 ++++++++++-----------------
 2 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index d3cd23ddd027..f0ed4508f38a 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -176,22 +176,17 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, ls_priv);
 
 	ret = device_property_read_string(dev, "model", &card->name);
-	if (ret) {
-		dev_err(dev, "Error parsing card name: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		dev_err_probe(dev, ret, "Error parsing card name\n");
+
 	ret = device_property_read_u32(dev, "mclk-fs", &ls_priv->mclk_fs);
-	if (ret) {
-		dev_err(dev, "Error parsing mclk-fs: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		dev_err_probe(dev, ret, "Error parsing mclk-fs\n");
 
-	if (has_acpi_companion(dev))
-		ret = loongson_card_parse_acpi(ls_priv);
-	else
-		ret = loongson_card_parse_of(ls_priv);
-	if (ret < 0)
-		return ret;
+	ret = has_acpi_companion(dev) ? loongson_card_parse_acpi(ls_priv)
+				      : loongson_card_parse_of(ls_priv);
+	if (ret)
+		dev_err_probe(dev, ret, "Error parsing acpi/of properties\n");
 
 	return devm_snd_soc_register_card(dev, card);
 }
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index e8ea28bc5a5f..3872b1d8fce0 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -97,13 +97,12 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 		dev_err(dev, "iomap_regions failed\n");
 		return ret;
 	}
+
 	i2s->reg_base = pcim_iomap_table(pdev)[0];
 	i2s->regmap = devm_regmap_init_mmio(dev, i2s->reg_base,
 					    &loongson_i2s_regmap_config);
-	if (IS_ERR(i2s->regmap)) {
-		dev_err(dev, "regmap_init_mmio failed\n");
-		return PTR_ERR(i2s->regmap);
-	}
+	if (IS_ERR(i2s->regmap))
+		dev_err_probe(dev, PTR_ERR(i2s->regmap), "regmap_init_mmio failed\n");
 
 	tx_data = &i2s->tx_dma_data;
 	rx_data = &i2s->rx_dma_data;
@@ -115,22 +114,16 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 	rx_data->order_addr = i2s->reg_base + LS_I2S_RX_ORDER;
 
 	tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
-	if (tx_data->irq < 0) {
-		dev_err(dev, "dma tx irq invalid\n");
-		return tx_data->irq;
-	}
+	if (tx_data->irq < 0)
+		dev_err_probe(dev, tx_data->irq, "dma tx irq invalid\n");
 
 	rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
-	if (rx_data->irq < 0) {
-		dev_err(dev, "dma rx irq invalid\n");
-		return rx_data->irq;
-	}
+	if (rx_data->irq < 0)
+		dev_err_probe(dev, rx_data->irq, "dma rx irq invalid\n");
 
-	device_property_read_u32(dev, "clock-frequency", &i2s->clk_rate);
-	if (!i2s->clk_rate) {
-		dev_err(dev, "clock-frequency property invalid\n");
-		return -EINVAL;
-	}
+	ret = device_property_read_u32(dev, "clock-frequency", &i2s->clk_rate);
+	if (ret)
+		dev_err_probe(dev, ret, "clock-frequency property invalid\n");
 
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
 
@@ -141,10 +134,8 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 
 	ret = devm_snd_soc_register_component(dev, &loongson_i2s_component,
 					      &loongson_i2s_dai, 1);
-	if (ret) {
-		dev_err(dev, "register DAI failed %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		dev_err_probe(dev, ret, "register DAI failed\n");
 
 	return 0;
 }
-- 
2.43.5

