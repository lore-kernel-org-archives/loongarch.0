Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD54C2DAFDF
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211083; cv=none; b=bCDMghGmbmeaXllk5JlZZxkCFU0mvWHBkToSRd0L3TnoQy9ZmXfC4g83eSbCSBQqJpOAt26ORHYMNqdWVE+CxegBeJhoWEMZadUK1gNuobb06RCsybmwqOqxippyOYUyGB19vxe/2vbf0ImHBvamxwQoY7iZlejA/V76PIbxiVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211083; c=relaxed/simple;
	bh=AbsCMNyX0W5lDmXtP9Ts02P56pjOywD+SfNK7kYOuFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JK6rMvC9XGXnouPcLys0EPb5pCUnJcdv0prila61BYhZLEgd8HKqSBO+RPv3Q1YyhlCS/1bOSyjYqAeZ3d9LtNNHwKnlXE9xZEr6XAojyb7ajP4jBcJyA5KJ/fd6GFdCDCNdzbxKc1X7dnS1hYVlZ2COtG1VA5DNtdoxgmUEWeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8AxisLGDbFpCNMZAA--.10012S3;
	Wed, 11 Mar 2026 14:37:58 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8LCDbFp2clSAA--.26807S4;
	Wed, 11 Mar 2026 14:37:57 +0800 (CST)
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
Subject: [PATCH 6/6] ASoC: loongson: Add Loongson-2k0300 I2S controller support
Date: Wed, 11 Mar 2026 14:37:48 +0800
Message-ID: <cb7062433863aea0d66959fc0f4aee791cab6402.1773107475.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773107475.git.zhoubinbin@loongson.cn>
References: <cover.1773107475.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx_8LCDbFp2clSAA--.26807S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEDCGmxBEIAqAAAs9
X-Coremail-Antispam: 1Uk129KBj93XoW3JFy8AFyUJryDuw47Zr45XFc_yoW7GF1Upr
	sxA3ySgrW5XF1akF98Jry8Jr15Ary3AasrGF47J34xGr9Fyw1rZ3s5JF1UAF4xCryDGry8
	XFZ5GFW8CFn8GFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnL05UUUUU=

The Loongson-2K0300 I2S interface differs significantly from the
Loongson-2K1000. Although both utilize external DMA controllers, the
Loongson-2K0300 does not require additional registers for routing
configuration.

Due to a hardware design flaw, PCM_START requires an explicit reset.
It has been tested and does not affect other machines.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c     |  2 +-
 sound/soc/loongson/loongson_i2s.c      |  6 +++--
 sound/soc/loongson/loongson_i2s_plat.c | 35 +++++++++++++++++++++-----
 3 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 7910d5d9ac4f..0d891b716e19 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -61,7 +61,7 @@ static struct snd_soc_dai_link loongson_dai_links[] = {
 	{
 		.name = "Loongson Audio Port",
 		.stream_name = "Loongson Audio",
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 			| SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(analog),
 		.ops = &loongson_ops,
diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 09ccab0c535e..4393410a1c98 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -32,14 +32,16 @@ static int loongson_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
 	struct loongson_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	unsigned int mask;
+	unsigned int mask = 0;
 	int ret = 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
+		mask = I2S_CTRL_RESET;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		mask = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		mask |= (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		       LOONGSON_I2S_TX_ENABLE : LOONGSON_I2S_RX_ENABLE;
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, mask, mask);
 		break;
diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/loongson_i2s_plat.c
index eaaab2b05633..15ccaca4b969 100644
--- a/sound/soc/loongson/loongson_i2s_plat.c
+++ b/sound/soc/loongson/loongson_i2s_plat.c
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
+
+	if (plat_config->i2s_dma_config) {
+		ret = plat_config->i2s_dma_config(pdev);
+		if (ret)
+			return ret;
+	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2s->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	i2s->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->reg_base))
 		return dev_err_probe(dev, PTR_ERR(i2s->reg_base),
 				     "devm_ioremap_resource failed\n");
@@ -87,6 +108,7 @@ static int loongson_i2s_plat_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s_clk))
 		return dev_err_probe(dev, PTR_ERR(i2s_clk), "clock property invalid\n");
 	i2s->clk_rate = clk_get_rate(i2s_clk);
+	i2s->rev_id = plat_config->rev_id;
 
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
 	dev_set_name(dev, LS_I2S_DRVNAME);
@@ -102,7 +124,8 @@ static int loongson_i2s_plat_probe(struct platform_device *pdev)
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

