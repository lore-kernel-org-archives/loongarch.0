Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5EB2BE03C
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 02:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539121; cv=none; b=jUFqPJavQqKHSj91gBlM2LcPGFHUlWzd4LLET4pNa8rQYPNNBYPZR5FFq437zMfAtA/lm3/xWA3PzZnUxHGeC2mXQCzONfVq+Lomt+qr0XVptzTxMUwPSjhbZoG2wVPwWqAHGComFrsJvszewO3K479wNhw5TKxR0ZCZTonAejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539121; c=relaxed/simple;
	bh=x4qM0lirGGeUmWdQFfQc+ktRyAcYQSgxJqQWr/toTR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdQ6HB++GPrdndNJJm9OU9UjiOpOH5b1dSptb1LKD3kfWPm1SGjHS8DHwJ+eucn8zzs5xmzdtGr++jnQUXFoV4rOM/83l5EbwNNdGU8uaqU3OAQegVYPxQB/7agb2cPsqAsyGHKCa2rDK7+b4rsPR2V/LITDw5JkqVLTePLrbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8DxEvDu3iBqUmEQAA--.45618S3;
	Thu, 04 Jun 2026 10:11:58 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGODr3iBq5EabAA--.32358S3;
	Thu, 04 Jun 2026 10:11:57 +0800 (CST)
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
Subject: [PATCH v2 5/7] ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever Pi sound card support
Date: Thu,  4 Jun 2026 10:11:45 +0800
Message-ID: <1b2fa7b37c354df6ac7b2c1c5f9f3fac2b8af3ff.1780538113.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxGODr3iBq5EabAA--.32358S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEICGofwl8ZZwAAsW
X-Coremail-Antispam: 1Uk129KBj93XoWxCrWDXF1fAF43Ar18Jw48Zrc_yoW5CFyDpa
	nxA3yjgr4YqF13uFn8XFWrAF15Z3s3A3ZFqF47Jw18Kr9Fyw15u34UJF1jvF4ayrykGFyU
	ZrykCrWxG3WDGrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==

The Loongson-2K0300 audio card uses a different DAI format compared to
existing Loongson platforms.

Move the dai_fmt setting from the static DAI link to runtime hw_params
via snd_soc_runtime_set_dai_fmt(), and pass the correct format through
driver match data.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 34 +++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 7910d5d9ac4f..9200e8476c1f 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -2,8 +2,9 @@
 //
 // Loongson ASoC Audio Machine driver
 //
-// Copyright (C) 2023 Loongson Technology Corporation Limited
+// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
 // Author: Yingkun Meng <mengyingkun@loongson.cn>
+//         Binbin Zhou <zhoubinbin@loongson.cn>
 //
 
 #include <linux/module.h>
@@ -18,6 +19,19 @@ static char codec_name[SND_ACPI_I2C_ID_LEN];
 struct loongson_card_data {
 	struct snd_soc_card snd_card;
 	unsigned int mclk_fs;
+	const struct loongson_card_config *cfg;
+};
+
+struct loongson_card_config {
+	unsigned int fmt;
+};
+
+static const struct loongson_card_config ls2k1000_card_config = {
+	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_CBC_CFC,
+};
+
+static const struct loongson_card_config ls2k0300_forever_pi_card_config = {
+	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
 };
 
 static int loongson_card_hw_params(struct snd_pcm_substream *substream,
@@ -45,7 +59,7 @@ static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	return 0;
+	return snd_soc_runtime_set_dai_fmt(rtd, ls_card->cfg->fmt);
 }
 
 static const struct snd_soc_ops loongson_ops = {
@@ -61,8 +75,6 @@ static struct snd_soc_dai_link loongson_dai_links[] = {
 	{
 		.name = "Loongson Audio Port",
 		.stream_name = "Loongson Audio",
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF
-			| SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(analog),
 		.ops = &loongson_ops,
 	},
@@ -175,6 +187,10 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	if (!ls_priv)
 		return -ENOMEM;
 
+	ls_priv->cfg = (const struct loongson_card_config *)device_get_match_data(dev);
+	if (!ls_priv->cfg)
+		return -EINVAL;
+
 	card = &ls_priv->snd_card;
 
 	card->dev = dev;
@@ -200,7 +216,15 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id loongson_asoc_dt_ids[] = {
-	{ .compatible = "loongson,ls-audio-card" },
+	/* Loongson-2K1000/Loongson-2K2000/LS7A */
+	{
+		.compatible = "loongson,ls-audio-card",
+		.data = &ls2k1000_card_config
+	},
+	{
+		.compatible = "loongson,ls2k0300-forever-pi-audio-card",
+		.data = &ls2k0300_forever_pi_card_config
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, loongson_asoc_dt_ids);
-- 
2.52.0

