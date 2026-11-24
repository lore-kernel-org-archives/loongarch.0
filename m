Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505073;
	b=Mu5CX5m8MLMiPK+5fgmsB08AbUN4OAQWBHe4CJZ7J5edt4N7WYSnbukdHy0DilO07Lam
	 xwXnGlZONMiN2QTLiNPF2R7luwrqM1yYPYnPtl0VGG4V/JO/2m83wPqiDqJwF3WB6OkdM
	 Q/Io/i1J4SkSTQX8BDUI6nEuT5EWNhvTOuI2Uf2qfO+NZDy/9EJrm5JFJij0CzJLmL60X
	 PZlSmaOXpWYuBNcuR7Ncv8wwMwOBfkwrtr5pieMhBdqGdU8vl1g3ZfB+eI7OQ0LM72O+b
	 GmFWJrZNEaUNmWJuC/rqVfZnR0Ga0bIJHETafyi5X6Yg61i1yvk7xxdLhR10MeQ6Udw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505073;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=IIXf2HR8u9Gd/1ONsl6HkyIM2LQj9LSZX8ukWkT9n/k=;
	b=phO9O6+CrzsMwLH1EHzjcGhyX3TfXB7mZCsP0Q1ETZH/glfe8g149TxZ0udHVbKXy+hT
	 ENvb2tLVgU7ZtpqowlhRzx9U27Stwcao/Rg8at827bVrmmUE67MRyMQTBwI48xeAOlKMr
	 V/9zz/0Kh1OZs+N4K8ePeejoaoQiE3LXi2IglgDK25G8xqF6w1TBwbAnRRC28Lig7bN2q
	 VXlW4xp27u/+k8DG44sMeg/s0yNF3dwsGu9C9/kAj4ZGgzf7N5kXclDcoLhTgb+FPe400
	 /+1SSjwcZ7qVjdY8hmru6JH6PQD93OrPDxHJGJGSumtEUe4qM6x1+5phIJA+Z/iaJcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D237A606A326
	for <loongarch@lists.linux.dev>; Tue, 24 Nov 2026 07:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D237A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.66])
	by gateway (Coremail) with SMTP id _____8DxC9KsOwVrLnwiAA--.32651S3;
	Tue, 24 Nov 2026 15:24:29 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.66])
	by front1 (Coremail) with SMTP id qMiowJAx3c6nOwVrkwM3AA--.44223S2;
	Tue, 24 Nov 2026 15:24:25 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] ASoC: loongson: Set dai_fmt for auto format selection
Date: Tue, 24 Nov 2026 15:24:13 +0800
Message-ID: <20261124072413.3282851-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c6nOwVrkwM3AA--.44223S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEBCGsE8HwEyQAAsn
X-Coremail-Antispam: 1Uk129KBj93XoWxJrW5tF13KFW5XF4UJw4fZwc_yoW8tFW3p3
	W3Z3yDKrW5tF1UZFn5t3yrJFn8A3yfGrnxJF47t3s2krs3Aw45uryDGF12yFW2yr95JFyj
	qFy8GrWkGF45GagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU88Ma5UUUUU==

.auto_selectable_formats only covers the signal format, clock gating and
polarity, not the clock provider: the core takes that field from
dai_link->dai_fmt. loongson_dai_links leaves .dai_fmt unset and only
programmed the format from hw_params, which worked until both es8328 and
loongson-i2s advertised .auto_selectable_formats. The core now sets
SND_SOC_DAIFMT_I2S (1) without CLOCK_PROVIDER bits at bind time and
es8328_set_dai_fmt() rejects it with -EINVAL.

Set .dai_fmt from the board config, and drop the redundant
snd_soc_runtime_set_dai_fmt() call from hw_params.

Fixes: da659805e0b0 ("ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever Pi sound card support")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index b06b596047b8..b4dc3cd6e4d6 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -152,7 +152,7 @@ static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	return snd_soc_runtime_set_dai_fmt(rtd, ls_card->cfg->fmt);
+	return 0;
 }
 
 static const struct snd_soc_ops loongson_ops = {
@@ -312,6 +312,16 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	card->dai_link = loongson_dai_links;
 	card->num_links = ARRAY_SIZE(loongson_dai_links);
 
+	/*
+	 * The DAI format is fixed per board. Describe it in the DAI link so
+	 * that the ASoC core takes it into account when it auto-selects the
+	 * format from the DAIs' .auto_selectable_formats. Otherwise the
+	 * CLOCK_PROVIDER bits are lost and the codec is configured with a
+	 * format it cannot accept (e.g. es8328_set_dai_fmt() rejecting it).
+	 */
+	for (unsigned int i = 0; i < card->num_links; i++)
+		loongson_dai_links[i].dai_fmt = ls_priv->cfg->fmt;
+
 	if (ls_priv->cfg->add_dapm_widgets) {
 		card->dapm_widgets = loongson_asoc_dapm_widgets;
 		card->num_dapm_widgets = ARRAY_SIZE(loongson_asoc_dapm_widgets);

base-commit: 2c0f21bfcda98db49f6476ff9b042402e5f20d3e
-- 
2.52.0

