Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAF81AE863
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866394; cv=none; b=pL9Jp2nPLnGyxdQBaSM/Exl8ljCzMNNXTKNZVRoW3pOtdA9B+Sb9dM7fMnznIcTOJW2sWrVQAnS6QO3dC+a5hiw03j6B+gMBSGngxWC0TcZrJaP6HKdKNDZFEA+hKWB129tz/xCyKkLP1798C/OLSWM1m9WXsZlPry3gXZsK8JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866394; c=relaxed/simple;
	bh=bGNreym3kW0bK7GMlgJ3cxOdk41TKb47ybJgVoM2Isw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM2NflGMD3OqHEIBrlVO4FbwtzZiZccvT4rsyS3Mnx5hrHebTFXISnMdmQzUivsFEFZP8iA4U4Y4DTcCFFLFPWKm25iQfB+Sa8E3Pvb1Hvt42OVN4lkpHaZ0stSEfZ+4rM9jXCnL8fCY4rNdUptWXKRGOfJCHSmUDsVthwAKW6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.147])
	by gateway (Coremail) with SMTP id _____8DxF+mWod5maJkCAA--.4995S3;
	Mon, 09 Sep 2024 15:19:50 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.147])
	by front1 (Coremail) with SMTP id qMiowMAxQNaQod5msioCAA--.7431S4;
	Mon, 09 Sep 2024 15:19:49 +0800 (CST)
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
Subject: [PATCH v1 6/8] ASoC: loongson: Replace if with ternary operator
Date: Mon,  9 Sep 2024 15:19:36 +0800
Message-ID: <94ec2ac178610f50af4815ef5b719695915bba31.1725844530.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMAxQNaQod5msioCAA--.7431S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF4xAFy7Kr43uw47WF13Jrc_yoW8trWDpr
	93u3yrWr9xXF4Iv3sIv3W8Jr1UJryftF9xWFsrtwn7Xr9rXF10gr1rJFs5Wr4xArW7K3yx
	uF4kA3yrGa4DurcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	ZF0_GryDMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUx_HUUUUUU

Replace an if statement with a ternary operator, making the code a tiny
bit shorter.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_i2s.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 3b9786076501..8bb38e418333 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -21,34 +21,30 @@
 			SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+#define LOONGSON_I2S_TX_ENABLE	(I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN)
+#define LOONGSON_I2S_RX_ENABLE	(I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN)
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
-- 
2.43.5

