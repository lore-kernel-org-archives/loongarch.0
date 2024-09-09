Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06A81AE861
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866401; cv=none; b=jZ3y/Hr06IytB6N0SuJ4k4WoSZiLjY2juT2weuKtjz3X48N0Mbd8YajGOpyc3OXNdgNfZnTZH8mSBCAhYIu7d9iX+NEIH8Bugbw/t2XrrFeDjR3OqMTEeemHvygIuPZPU5kqI6ELfVtAXtg12IyUSzQFwjk7PrZWlslnOpBxJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866401; c=relaxed/simple;
	bh=scMAbo727rPIJzk7G5OE+BGtvs4ECmfCYgeEeYM24G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXnS0Zzri/rXHxUV0yLBZ/Ltan9Oo2SOEbrSnmsgZcktS64VTdrFKKIlnkr/WsO9vCPINbCCD5or+TqxCCh5xUuSLLnJ680yir/uJXY9VgCGviQfG+1lp0A5oznOyit1BmiajhjLm1wwDtSGtCSVkToTwyN9/spCy4SFHBI2SnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.147])
	by gateway (Coremail) with SMTP id _____8DxG+qeod5mspkCAA--.6103S3;
	Mon, 09 Sep 2024 15:19:58 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.147])
	by front1 (Coremail) with SMTP id qMiowMDx_9ecod5mtSoCAA--.12968S2;
	Mon, 09 Sep 2024 15:19:58 +0800 (CST)
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
Subject: [PATCH v1 8/8] ASoC: loongson: Factor out loongson i2s enable clock functions
Date: Mon,  9 Sep 2024 15:19:55 +0800
Message-ID: <d6f6c818b0ecee87277f704b6a801cbbf5e712ce.1725844530.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMDx_9ecod5mtSoCAA--.12968S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZrW5KFy7AF4xtryUJr1fAFc_yoWrWr4Upr
	sIvas0gryftrW2ywnIvrs8Jr1UCryxXasxGFsrK34xZrnrAr4Fgw1fJF93AFW2kF95GFWU
	Z3Z7AFW8CFyUWabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUIf-BDUUUU

There are a few i2s clock enable operations in loongson_i2s_set_fmt(),
convert them to simple helper functions called
loongson_i2s_enable_mclk() and loongson_i2s_enable_bclk().

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_i2s.c | 86 +++++++++++++++++--------------
 1 file changed, 47 insertions(+), 39 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 8bb38e418333..40bbf3205391 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -24,6 +24,9 @@
 #define LOONGSON_I2S_TX_ENABLE	(I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN)
 #define LOONGSON_I2S_RX_ENABLE	(I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN)
 
+#define LOONGSON_I2S_DEF_DELAY		10
+#define LOONGSON_I2S_DEF_TIMEOUT	500000
+
 static int loongson_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
@@ -119,10 +122,40 @@ static int loongson_i2s_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
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
@@ -144,54 +177,29 @@ static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
-- 
2.43.5

