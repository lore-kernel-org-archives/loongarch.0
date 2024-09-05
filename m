Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD3D192B89
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 07:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519792; cv=none; b=ZjHr9JwWXOnEJiqiTbaUg+wZg4PwYL6yD1nlPzJ9YDrRpGZzeEnLVIGSO5cgp4uRD0EM8zI7J4gGvfm34NTyWyuupIW/DmzC3pRTt+62MuxRl5RxgA5zsa4ImXMzZ/xCqGiHmLjXhXmT0ZRdvMjgXnf1fiFipE+uayCG6oTN/5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519792; c=relaxed/simple;
	bh=3/CBZR6pzcmP47JzOTvZKGUcRW4mYPP9XpvPFsXbmdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+P6eCmUjqibuPYeSv6OnicE+NqCCHryoQ7Bs3TMOL9QhIoRDGxtumrBH+ze6MEuIktlBzhS3SUJEhMSikvKmNx3CdpqMDTOv73y6GZBvLG0/IUjRwPRZku4pTsVaX0d1RUanyBrGboJbU8HZXEBJDuztrSfyA3bun0LMDJ6VcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.71])
	by gateway (Coremail) with SMTP id _____8Cx+emsV9lm9BkrAA--.17505S3;
	Thu, 05 Sep 2024 15:03:08 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.71])
	by front1 (Coremail) with SMTP id qMiowMBxbNyhV9lmDcMEAA--.21040S3;
	Thu, 05 Sep 2024 15:03:04 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 05/10] ASoC: loongson: Improve code readability
Date: Thu,  5 Sep 2024 15:02:54 +0800
Message-ID: <c54fbc2582702689c005e1ba528ab2318b1adde6.1725518229.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1725518229.git.zhoubinbin@loongson.cn>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxbNyhV9lmDcMEAA--.21040S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoW3CFWkCr1xGw4fJF18Zr43Arc_yoW8CFWfZo
	W0vF93X3y5Xr18CFs0g34rWrnrZa15CF9Iyr92yrWqkw1jyF18W3y5ur47uFyfWay5Krs5
	JF9xtFs3GanxArWxl-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYn7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUsdb1UUUUU

This patch attempts to clean up driver code formatting issues.
Mainly as follows:
1. Use the BIT macro;
2. Use dev_err_probe() in every error path in probe in loongson_card
   driver;
3. Introduce loongson_card_acpi_find_device() to streamlined code.

No functional change intended.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c    | 144 +++++++++++++-------------
 sound/soc/loongson/loongson_dma.c     |  10 +-
 sound/soc/loongson/loongson_i2s.c     | 110 ++++++++++----------
 sound/soc/loongson/loongson_i2s.h     |  24 ++---
 sound/soc/loongson/loongson_i2s_pci.c |  51 ++++-----
 5 files changed, 166 insertions(+), 173 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 2c8dbdba27c5..a25287efdd5c 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -24,27 +24,27 @@ static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct loongson_card_data *ls_card = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret, mclk;
 
-	if (ls_card->mclk_fs) {
-		mclk = ls_card->mclk_fs * params_rate(params);
-		ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
-					     SND_SOC_CLOCK_OUT);
-		if (ret < 0) {
-			dev_err(codec_dai->dev, "cpu_dai clock not set\n");
-			return ret;
-		}
+	if (!ls_card->mclk_fs)
+		return 0;
 
-		ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
-					     SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(codec_dai->dev, "codec_dai clock not set\n");
-			return ret;
-		}
+	mclk = ls_card->mclk_fs * params_rate(params);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk, SND_SOC_CLOCK_OUT);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "cpu_dai clock not set\n");
+		return ret;
 	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "codec_dai clock not set\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -68,54 +68,61 @@ static struct snd_soc_dai_link loongson_dai_links[] = {
 	},
 };
 
-static int loongson_card_parse_acpi(struct loongson_card_data *data)
+static struct acpi_device *
+loongson_card_acpi_find_device(struct snd_soc_card *card, const char *name)
 {
-	struct snd_soc_card *card = &data->snd_card;
 	struct fwnode_handle *fwnode = card->dev->fwnode;
 	struct fwnode_reference_args args;
+	int status;
+
+	memset(&args, 0, sizeof(args));
+	status = acpi_node_get_property_reference(fwnode, name, 0, &args);
+	if (ACPI_FAILURE(status) || !is_acpi_device_node(args.fwnode)) {
+		dev_err(card->dev, "No matching phy in ACPI table\n");
+		return NULL;
+	}
+
+	return to_acpi_device_node(args.fwnode);
+}
+
+static int loongson_card_parse_acpi(struct loongson_card_data *data)
+{
+	struct snd_soc_card *card = &data->snd_card;
 	const char *codec_dai_name;
 	struct acpi_device *adev;
 	struct device *phy_dev;
-	int ret, i;
+	int i;
 
 	/* fixup platform name based on reference node */
-	memset(&args, 0, sizeof(args));
-	ret = acpi_node_get_property_reference(fwnode, "cpu", 0, &args);
-	if (ret || !is_acpi_device_node(args.fwnode)) {
-		dev_err(card->dev, "No matching phy in ACPI table\n");
-		return ret ?: -ENOENT;
-	}
-	adev = to_acpi_device_node(args.fwnode);
+	adev = loongson_card_acpi_find_device(card, "cpu");
+	if (!adev)
+		return -ENOENT;
+
 	phy_dev = acpi_get_first_physical_node(adev);
 	if (!phy_dev)
 		return -EPROBE_DEFER;
-	for (i = 0; i < card->num_links; i++)
-		loongson_dai_links[i].platforms->name = dev_name(phy_dev);
 
 	/* fixup codec name based on reference node */
-	memset(&args, 0, sizeof(args));
-	ret = acpi_node_get_property_reference(fwnode, "codec", 0, &args);
-	if (ret || !is_acpi_device_node(args.fwnode)) {
-		dev_err(card->dev, "No matching phy in ACPI table\n");
-		return ret ?: -ENOENT;
-	}
-	adev = to_acpi_device_node(args.fwnode);
+	adev = loongson_card_acpi_find_device(card, "codec");
+	if (!adev)
+		return -ENOENT;
 	snprintf(codec_name, sizeof(codec_name), "i2c-%s", acpi_dev_name(adev));
-	for (i = 0; i < card->num_links; i++)
-		loongson_dai_links[i].codecs->name = codec_name;
 
-	device_property_read_string(card->dev, "codec-dai-name",
-				    &codec_dai_name);
-	for (i = 0; i < card->num_links; i++)
+	device_property_read_string(card->dev, "codec-dai-name", &codec_dai_name);
+
+	for (i = 0; i < card->num_links; i++) {
+		loongson_dai_links[i].platforms->name = dev_name(phy_dev);
+		loongson_dai_links[i].codecs->name = codec_name;
 		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
+	}
 
 	return 0;
 }
 
 static int loongson_card_parse_of(struct loongson_card_data *data)
 {
-	struct device_node *cpu, *codec;
 	struct snd_soc_card *card = &data->snd_card;
+	struct device_node *cpu, *codec;
 	struct device *dev = card->dev;
 	int ret, i;
 
@@ -124,77 +131,68 @@ static int loongson_card_parse_of(struct loongson_card_data *data)
 		dev_err(dev, "platform property missing or invalid\n");
 		return -EINVAL;
 	}
+
 	codec = of_get_child_by_name(dev->of_node, "codec");
 	if (!codec) {
 		dev_err(dev, "audio-codec property missing or invalid\n");
-		of_node_put(cpu);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_cpu;
 	}
 
 	for (i = 0; i < card->num_links; i++) {
 		ret = snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[i].cpus, 0);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(dev, "getting cpu dlc error (%d)\n", ret);
-			goto err;
+			goto free_codec;
 		}
 
 		ret = snd_soc_of_get_dlc(codec, NULL, loongson_dai_links[i].codecs, 0);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(dev, "getting codec dlc error (%d)\n", ret);
-			goto err;
+			goto free_codec;
 		}
 	}
 
-	of_node_put(cpu);
+free_codec:
 	of_node_put(codec);
-
-	return 0;
-
-err:
+free_cpu:
 	of_node_put(cpu);
-	of_node_put(codec);
 	return ret;
 }
 
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
-	if (ret) {
-		dev_err(&pdev->dev, "Error parsing card name: %d\n", ret);
-		return ret;
-	}
-	ret = device_property_read_u32(&pdev->dev, "mclk-fs", &ls_priv->mclk_fs);
-	if (ret) {
-		dev_err(&pdev->dev, "Error parsing mclk-fs: %d\n", ret);
-		return ret;
-	}
+	ret = device_property_read_string(dev, "model", &card->name);
+	if (ret)
+		dev_err_probe(dev, ret, "Error parsing card name.\n");
 
-	if (has_acpi_companion(&pdev->dev))
-		ret = loongson_card_parse_acpi(ls_priv);
-	else
-		ret = loongson_card_parse_of(ls_priv);
-	if (ret < 0)
-		return ret;
+	ret = device_property_read_u32(dev, "mclk-fs", &ls_priv->mclk_fs);
+	if (ret)
+		dev_err_probe(dev, ret, "Error parsing mclk-fs.\n");
 
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	ret = has_acpi_companion(dev) ? loongson_card_parse_acpi(ls_priv)
+				      : loongson_card_parse_of(ls_priv);
+	if (ret)
+		dev_err_probe(dev, ret, "Error parsing acpi/of properties.\n");
 
-	return ret;
+	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id loongson_asoc_dt_ids[] = {
diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 0238f88bc674..20e4a0641340 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -17,11 +17,11 @@
 #include "loongson_i2s.h"
 
 /* DMA dma_order Register */
-#define DMA_ORDER_STOP          (1 << 4) /* DMA stop */
-#define DMA_ORDER_START         (1 << 3) /* DMA start */
-#define DMA_ORDER_ASK_VALID     (1 << 2) /* DMA ask valid flag */
-#define DMA_ORDER_AXI_UNCO      (1 << 1) /* Uncache access */
-#define DMA_ORDER_ADDR_64       (1 << 0) /* 64bits address support */
+#define DMA_ORDER_STOP          BIT(4) /* DMA stop */
+#define DMA_ORDER_START         BIT(3) /* DMA start */
+#define DMA_ORDER_ASK_VALID     BIT(2) /* DMA ask valid flag */
+#define DMA_ORDER_AXI_UNCO      BIT(1) /* Uncache access */
+#define DMA_ORDER_ADDR_64       BIT(0) /* 64bits address support */
 
 #define DMA_ORDER_ASK_MASK      (~0x1fUL) /* Ask addr mask */
 #define DMA_ORDER_CTRL_MASK     (0x0fUL)  /* Control mask  */
diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 3b9786076501..40bbf3205391 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -21,34 +21,33 @@
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+#define LOONGSON_I2S_TX_ENABLE	(I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN)
+#define LOONGSON_I2S_RX_ENABLE	(I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN)
+
+#define LOONGSON_I2S_DEF_DELAY		10
+#define LOONGSON_I2S_DEF_TIMEOUT	500000
+
 static int loongson_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
 	struct loongson_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask;
 	int ret = 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
-					   I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN,
-					   I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN);
-		else
-			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
-					   I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN,
-					   I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN);
+		mask = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		       LOONGSON_I2S_TX_ENABLE : LOONGSON_I2S_RX_ENABLE;
+		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, mask, mask);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
-					I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN, 0);
-		else
-			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
-					I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN, 0);
+		mask = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		       LOONGSON_I2S_TX_ENABLE : LOONGSON_I2S_RX_ENABLE;
+		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, mask, 0);
 		break;
 	default:
 		ret = -EINVAL;
@@ -123,10 +122,40 @@ static int loongson_i2s_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
+static int loongson_i2s_enable_mclk(struct loongson_i2s *i2s)
+{
+	u32 val;
+
+	if (i2s->rev_id == 0)
+		return 0;
+
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
+			   I2S_CTRL_MCLK_EN, I2S_CTRL_MCLK_EN);
+
+	return regmap_read_poll_timeout_atomic(i2s->regmap,
+					       LS_I2S_CTRL, val,
+					       val & I2S_CTRL_MCLK_READY,
+					       LOONGSON_I2S_DEF_DELAY,
+					       LOONGSON_I2S_DEF_TIMEOUT);
+}
+
+static int loongson_i2s_enable_bclk(struct loongson_i2s *i2s)
+{
+	u32 val;
+
+	if (i2s->rev_id == 0)
+		return 0;
+
+	return regmap_read_poll_timeout_atomic(i2s->regmap,
+					       LS_I2S_CTRL, val,
+					       val & I2S_CTRL_CLK_READY,
+					       LOONGSON_I2S_DEF_DELAY,
+					       LOONGSON_I2S_DEF_TIMEOUT);
+}
+
 static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct loongson_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	u32 val;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -148,54 +177,29 @@ static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		/* Enable master mode */
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
-		if (i2s->rev_id == 1) {
-			ret = regmap_read_poll_timeout_atomic(i2s->regmap,
-						LS_I2S_CTRL, val,
-						val & I2S_CTRL_CLK_READY,
-						10, 500000);
-			if (ret < 0)
-				dev_warn(dai->dev, "wait BCLK ready timeout\n");
-		}
+		ret = loongson_i2s_enable_bclk(i2s);
+		if (ret < 0)
+			dev_warn(dai->dev, "wait BCLK ready timeout\n");
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
 		/* Enable MCLK */
-		if (i2s->rev_id == 1) {
-			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
-					   I2S_CTRL_MCLK_EN,
-					   I2S_CTRL_MCLK_EN);
-			ret = regmap_read_poll_timeout_atomic(i2s->regmap,
-						LS_I2S_CTRL, val,
-						val & I2S_CTRL_MCLK_READY,
-						10, 500000);
-			if (ret < 0)
-				dev_warn(dai->dev, "wait MCLK ready timeout\n");
-		}
+		ret = loongson_i2s_enable_mclk(i2s);
+		if (ret < 0)
+			dev_warn(dai->dev, "wait MCLK ready timeout\n");
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
 		/* Enable MCLK */
-		if (i2s->rev_id == 1) {
-			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
-					   I2S_CTRL_MCLK_EN,
-					   I2S_CTRL_MCLK_EN);
-			ret = regmap_read_poll_timeout_atomic(i2s->regmap,
-						LS_I2S_CTRL, val,
-						val & I2S_CTRL_MCLK_READY,
-						10, 500000);
-			if (ret < 0)
-				dev_warn(dai->dev, "wait MCLK ready timeout\n");
-		}
+		ret = loongson_i2s_enable_mclk(i2s);
+		if (ret < 0)
+			dev_warn(dai->dev, "wait MCLK ready timeout\n");
 
 		/* Enable master mode */
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
-		if (i2s->rev_id == 1) {
-			ret = regmap_read_poll_timeout_atomic(i2s->regmap,
-						LS_I2S_CTRL, val,
-						val & I2S_CTRL_CLK_READY,
-						10, 500000);
-			if (ret < 0)
-				dev_warn(dai->dev, "wait BCLK ready timeout\n");
-		}
+
+		ret = loongson_i2s_enable_bclk(i2s);
+		if (ret < 0)
+			dev_warn(dai->dev, "wait BCLK ready timeout\n");
 		break;
 	default:
 		return -EINVAL;
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index 89492eebf834..c8052a762c1b 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -27,18 +27,18 @@
 #define LS_I2S_RX_ORDER 0x110 /* RX DMA Order */
 
 /* Loongson I2S Control Register */
-#define I2S_CTRL_MCLK_READY	(1 << 16) /* MCLK ready */
-#define I2S_CTRL_MASTER		(1 << 15) /* Master mode */
-#define I2S_CTRL_MSB		(1 << 14) /* MSB bit order */
-#define I2S_CTRL_RX_EN		(1 << 13) /* RX enable */
-#define I2S_CTRL_TX_EN		(1 << 12) /* TX enable */
-#define I2S_CTRL_RX_DMA_EN	(1 << 11) /* DMA RX enable */
-#define I2S_CTRL_CLK_READY	(1 << 8)  /* BCLK ready */
-#define I2S_CTRL_TX_DMA_EN	(1 << 7)  /* DMA TX enable */
-#define I2S_CTRL_RESET		(1 << 4)  /* Controller soft reset */
-#define I2S_CTRL_MCLK_EN	(1 << 3)  /* Enable MCLK */
-#define I2S_CTRL_RX_INT_EN	(1 << 1)  /* RX interrupt enable */
-#define I2S_CTRL_TX_INT_EN	(1 << 0)  /* TX interrupt enable */
+#define I2S_CTRL_MCLK_READY	BIT(16) /* MCLK ready */
+#define I2S_CTRL_MASTER		BIT(15) /* Master mode */
+#define I2S_CTRL_MSB		BIT(14) /* MSB bit order */
+#define I2S_CTRL_RX_EN		BIT(13) /* RX enable */
+#define I2S_CTRL_TX_EN		BIT(12) /* TX enable */
+#define I2S_CTRL_RX_DMA_EN	BIT(11) /* DMA RX enable */
+#define I2S_CTRL_CLK_READY	BIT(8)  /* BCLK ready */
+#define I2S_CTRL_TX_DMA_EN	BIT(7)  /* DMA TX enable */
+#define I2S_CTRL_RESET		BIT(4)  /* Controller soft reset */
+#define I2S_CTRL_MCLK_EN	BIT(3)  /* Enable MCLK */
+#define I2S_CTRL_RX_INT_EN	BIT(1)  /* RX interrupt enable */
+#define I2S_CTRL_TX_INT_EN	BIT(0)  /* TX interrupt enable */
 
 #define LS_I2S_DRVNAME		"loongson-i2s"
 
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index ec18b122cd79..3872b1d8fce0 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -75,34 +75,34 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
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
+
 	i2s->reg_base = pcim_iomap_table(pdev)[0];
-	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, i2s->reg_base,
+	i2s->regmap = devm_regmap_init_mmio(dev, i2s->reg_base,
 					    &loongson_i2s_regmap_config);
-	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "regmap_init_mmio failed\n");
-		return PTR_ERR(i2s->regmap);
-	}
+	if (IS_ERR(i2s->regmap))
+		dev_err_probe(dev, PTR_ERR(i2s->regmap), "regmap_init_mmio failed\n");
 
 	tx_data = &i2s->tx_dma_data;
 	rx_data = &i2s->rx_dma_data;
@@ -114,37 +114,28 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 	rx_data->order_addr = i2s->reg_base + LS_I2S_RX_ORDER;
 
 	tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
-	if (tx_data->irq < 0) {
-		dev_err(&pdev->dev, "dma tx irq invalid\n");
-		return tx_data->irq;
-	}
+	if (tx_data->irq < 0)
+		dev_err_probe(dev, tx_data->irq, "dma tx irq invalid\n");
 
 	rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
-	if (rx_data->irq < 0) {
-		dev_err(&pdev->dev, "dma rx irq invalid\n");
-		return rx_data->irq;
-	}
+	if (rx_data->irq < 0)
+		dev_err_probe(dev, rx_data->irq, "dma rx irq invalid\n");
 
-	device_property_read_u32(&pdev->dev, "clock-frequency", &i2s->clk_rate);
-	if (!i2s->clk_rate) {
-		dev_err(&pdev->dev, "clock-frequency property invalid\n");
-		return -EINVAL;
-	}
+	ret = device_property_read_u32(dev, "clock-frequency", &i2s->clk_rate);
+	if (ret)
+		dev_err_probe(dev, ret, "clock-frequency property invalid\n");
 
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
-	if (ret) {
-		dev_err(&pdev->dev, "register DAI failed %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		dev_err_probe(dev, ret, "register DAI failed\n");
 
 	return 0;
 }
-- 
2.43.5

