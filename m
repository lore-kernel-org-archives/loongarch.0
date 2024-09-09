Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5691AE050
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866376; cv=none; b=sH/mbbKctt8cR0Hd6TEfD49TnkkP7hAlZkGVpgFlEb+Yyekq1sXqYkVtvOCWZw+eXvgPdijyxEscu9kDT2GoCR6wrq0W7YSTpqTAZ3AHUUNz0xgDiWFGuemu54DEpo2V7jssdmaaUbMorKWOecPYVJjreAnrgPu3sjPOKos9OaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866376; c=relaxed/simple;
	bh=JOihXydgq/u5KySnotZr30ye8vsBrNJSf5ayFV6Z/BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpVkmEb71takhnBW559YZI6brQTiOlKh/7mrUUQi2ntHGmS7c5e1ZSLwwINlmEXZrJhKRKaSYLZfJWshlJtx1JhygH6xUjWCgLnjICvAJURVu2UJPRv/4oWGugqMKN3+IQN6HC5m3kaCEqr88DSEhVHry62xzaQIa5Qm95CgJcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.147])
	by gateway (Coremail) with SMTP id _____8Dx1uiEod5mBJkCAA--.4817S3;
	Mon, 09 Sep 2024 15:19:32 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.147])
	by front1 (Coremail) with SMTP id qMiowMCxodZ+od5mqyoCAA--.12416S4;
	Mon, 09 Sep 2024 15:19:31 +0800 (CST)
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
Subject: [PATCH v1 2/8] ASoC: loongson: Simplify probe() with local dev variable
Date: Mon,  9 Sep 2024 15:19:06 +0800
Message-ID: <1984a20930da515e2a478b02159f83c02498f6be.1725844530.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMCxodZ+od5mqyoCAA--.12416S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WrWDWF1kKw4DtF1DurWUZFc_yoW7Wr18pr
	9xAayYgr17Xr1fZry5JrWrA3WYyryxua1xXa17G3s7Kr9IyrsYgrWfGF1jyFWFkF95CayD
	XryUGay0kF1DuabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8KNt3UUUUU==

Simplify the probe() function by using local 'dev' instead of
&pdev->dev.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c    | 17 ++++++++-------
 sound/soc/loongson/loongson_i2s_pci.c | 30 +++++++++++++--------------
 2 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 4d511b7589d0..d3cd23ddd027 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -159,40 +159,41 @@ static int loongson_card_parse_of(struct loongson_card_data *data)
 static int loongson_asoc_card_probe(struct platform_device *pdev)
 {
 	struct loongson_card_data *ls_priv;
+	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	int ret;
 
-	ls_priv = devm_kzalloc(&pdev->dev, sizeof(*ls_priv), GFP_KERNEL);
+	ls_priv = devm_kzalloc(dev, sizeof(*ls_priv), GFP_KERNEL);
 	if (!ls_priv)
 		return -ENOMEM;
 
 	card = &ls_priv->snd_card;
 
-	card->dev = &pdev->dev;
+	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = loongson_dai_links;
 	card->num_links = ARRAY_SIZE(loongson_dai_links);
 	snd_soc_card_set_drvdata(card, ls_priv);
 
-	ret = device_property_read_string(&pdev->dev, "model", &card->name);
+	ret = device_property_read_string(dev, "model", &card->name);
 	if (ret) {
-		dev_err(&pdev->dev, "Error parsing card name: %d\n", ret);
+		dev_err(dev, "Error parsing card name: %d\n", ret);
 		return ret;
 	}
-	ret = device_property_read_u32(&pdev->dev, "mclk-fs", &ls_priv->mclk_fs);
+	ret = device_property_read_u32(dev, "mclk-fs", &ls_priv->mclk_fs);
 	if (ret) {
-		dev_err(&pdev->dev, "Error parsing mclk-fs: %d\n", ret);
+		dev_err(dev, "Error parsing mclk-fs: %d\n", ret);
 		return ret;
 	}
 
-	if (has_acpi_companion(&pdev->dev))
+	if (has_acpi_companion(dev))
 		ret = loongson_card_parse_acpi(ls_priv);
 	else
 		ret = loongson_card_parse_of(ls_priv);
 	if (ret < 0)
 		return ret;
 
-	return devm_snd_soc_register_card(&pdev->dev, card);
+	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id loongson_asoc_dt_ids[] = {
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index ec18b122cd79..e8ea28bc5a5f 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -75,32 +75,33 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 {
 	const struct fwnode_handle *fwnode = pdev->dev.fwnode;
 	struct loongson_dma_data *tx_data, *rx_data;
+	struct device *dev = &pdev->dev;
 	struct loongson_i2s *i2s;
 	int ret;
 
 	if (pcim_enable_device(pdev)) {
-		dev_err(&pdev->dev, "pci_enable_device failed\n");
+		dev_err(dev, "pci_enable_device failed\n");
 		return -ENODEV;
 	}
 
-	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
+	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)
 		return -ENOMEM;
 
 	i2s->rev_id = pdev->revision;
-	i2s->dev = &pdev->dev;
+	i2s->dev = dev;
 	pci_set_drvdata(pdev, i2s);
 
-	ret = pcim_iomap_regions(pdev, 1 << 0, dev_name(&pdev->dev));
+	ret = pcim_iomap_regions(pdev, 1 << 0, dev_name(dev));
 	if (ret < 0) {
-		dev_err(&pdev->dev, "iomap_regions failed\n");
+		dev_err(dev, "iomap_regions failed\n");
 		return ret;
 	}
 	i2s->reg_base = pcim_iomap_table(pdev)[0];
-	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, i2s->reg_base,
+	i2s->regmap = devm_regmap_init_mmio(dev, i2s->reg_base,
 					    &loongson_i2s_regmap_config);
 	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "regmap_init_mmio failed\n");
+		dev_err(dev, "regmap_init_mmio failed\n");
 		return PTR_ERR(i2s->regmap);
 	}
 
@@ -115,34 +116,33 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 
 	tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
 	if (tx_data->irq < 0) {
-		dev_err(&pdev->dev, "dma tx irq invalid\n");
+		dev_err(dev, "dma tx irq invalid\n");
 		return tx_data->irq;
 	}
 
 	rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
 	if (rx_data->irq < 0) {
-		dev_err(&pdev->dev, "dma rx irq invalid\n");
+		dev_err(dev, "dma rx irq invalid\n");
 		return rx_data->irq;
 	}
 
-	device_property_read_u32(&pdev->dev, "clock-frequency", &i2s->clk_rate);
+	device_property_read_u32(dev, "clock-frequency", &i2s->clk_rate);
 	if (!i2s->clk_rate) {
-		dev_err(&pdev->dev, "clock-frequency property invalid\n");
+		dev_err(dev, "clock-frequency property invalid\n");
 		return -EINVAL;
 	}
 
-	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
 
 	if (i2s->rev_id == 1) {
 		regmap_write(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_RESET);
 		udelay(200);
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &loongson_i2s_component,
+	ret = devm_snd_soc_register_component(dev, &loongson_i2s_component,
 					      &loongson_i2s_dai, 1);
 	if (ret) {
-		dev_err(&pdev->dev, "register DAI failed %d\n", ret);
+		dev_err(dev, "register DAI failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.5

