Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A192DCF4C
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 02:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539125; cv=none; b=el3I3UxBx0xaaYSikP6s+Ihamm/hl5c5r0Q4J3xr/R00BgCctiB74OBP5TbsTD56QhP1uiy5e6hKUhEKxwHqT25iDJvctnim2/ULix5eNwYtmpwkrXB9w6X/WYz4j9uT00BxFAkE5xC3W/pNJQC7CzzZmTwvajbkm/Zrk/gP3Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539125; c=relaxed/simple;
	bh=Nnu+nXEgxunMHW9eK854pQQ0K7ngAHKkgBe/ZilzG6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPFtpajcw8fEun3bkNu808yp/7MQrfyGld/vpyVT2/SZ37nWLBDp4LVcPcDiZcJHd9l0Wu47FvQ8/Q3RUp3ZeTqj+oKWYv7u7hxDZ+SBiPqVI3mnshOLe29LtZNQHot/JX08NiZAARwUGCion2+fI0rmdpmM3pN7/ljjTif2zZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8BxzsDx3iBqYGEQAA--.22025S3;
	Thu, 04 Jun 2026 10:12:01 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGODr3iBq5EabAA--.32358S5;
	Thu, 04 Jun 2026 10:12:00 +0800 (CST)
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
Subject: [PATCH v2 7/7] ASoC: loongson: Add headphone jack detection and DAPM routing
Date: Thu,  4 Jun 2026 10:11:47 +0800
Message-ID: <2736a44ee11bcc0bbf282c69e99cb05b12469207.1780538113.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCxGODr3iBq5EabAA--.32358S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEICGofwl8ZbQAAsc
X-Coremail-Antispam: 1Uk129KBj93XoW3GFyfGr13CFyUCF4fKFW3Jwc_yoWxCF1xp3
	ZrZayYgF4rJrWrAa15XrW5ArnxA3yfCa9xtF4xtw1vkF42ywn5WFykKF12vF43CryDGr15
	XFWkCF4fCa45uFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnL05UUUUU=

Extend the Loongson audio machine driver with jack detection, DAPM
widgets support, enabling proper switching between headphones and
speakers on the Loongson-2K0300 ATK-DL2K0300B board.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 129 ++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 3 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 9200e8476c1f..ee0cf305187a 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -7,33 +7,129 @@
 //         Binbin Zhou <zhoubinbin@loongson.cn>
 //
 
-#include <linux/module.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
 #include <linux/acpi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
 #include <linux/pci.h>
+#include <sound/jack.h>
 #include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
 
 static char codec_name[SND_ACPI_I2C_ID_LEN];
 
 struct loongson_card_data {
 	struct snd_soc_card snd_card;
 	unsigned int mclk_fs;
+	struct gpio_desc *gpiod_hp_det;
+	struct gpio_desc *gpiod_hp_mute;
+	struct gpio_desc *gpiod_spkr_en;
 	const struct loongson_card_config *cfg;
 };
 
 struct loongson_card_config {
 	unsigned int fmt;
+	bool add_hp_jack;
+	bool add_dapm_widgets;
 };
 
 static const struct loongson_card_config ls2k1000_card_config = {
 	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_CBC_CFC,
+	.add_hp_jack = false,
+	.add_dapm_widgets = false,
 };
 
 static const struct loongson_card_config ls2k0300_forever_pi_card_config = {
 	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
+	.add_hp_jack = false,
+	.add_dapm_widgets = false,
+};
+
+static const struct loongson_card_config ls2k0300_dl2k0300b_card_config = {
+	.fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
+	.add_hp_jack = true,
+	.add_dapm_widgets = true,
+};
+
+/* DAPM widget event: control headphone mute GPIO */
+static int headphone_widget_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct loongson_card_data *priv = snd_soc_card_get_drvdata(card);
+
+	gpiod_set_value_cansleep(priv->gpiod_hp_mute, SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+/* DAPM widget event: control speaker enable GPIO */
+static int speaker_widget_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct loongson_card_data *priv = snd_soc_card_get_drvdata(card);
+
+	gpiod_set_value_cansleep(priv->gpiod_spkr_en, SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget loongson_aosc_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", headphone_widget_event),
+	SND_SOC_DAPM_SPK("Speaker", speaker_widget_event),
+};
+
+/* Headphones Jack */
+
+static struct snd_soc_jack loongson_asoc_hp_jack;
+
+static struct snd_soc_jack_pin loongson_asoc_hp_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE
+	},
+	{
+		.pin = "Speaker",
+		.mask = SND_JACK_HEADPHONE,
+		.invert = 1
+	},
 };
 
+static struct snd_soc_jack_gpio loongson_asoc_hp_jack_gpio = {
+	.name = "Headphones detection",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
+};
+
+static int loongson_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct loongson_card_data *ls_priv = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+
+	if (!ls_priv->cfg->add_hp_jack)
+		return 0;
+
+	ret = snd_soc_card_jack_new_pins(card, "Headphones Jack",
+					 SND_JACK_HEADPHONE,
+					 &loongson_asoc_hp_jack,
+					 loongson_asoc_hp_jack_pins,
+					 ARRAY_SIZE(loongson_asoc_hp_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "Headphones Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	loongson_asoc_hp_jack_gpio.desc = ls_priv->gpiod_hp_det;
+
+	ret = snd_soc_jack_add_gpios(&loongson_asoc_hp_jack, 1, &loongson_asoc_hp_jack_gpio);
+	if (ret)
+		dev_err(rtd->dev, "Headphone GPIO not added: %d\n", ret);
+
+	return ret;
+}
+
 static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
@@ -75,6 +171,7 @@ static struct snd_soc_dai_link loongson_dai_links[] = {
 	{
 		.name = "Loongson Audio Port",
 		.stream_name = "Loongson Audio",
+		.init = loongson_asoc_machine_init,
 		SND_SOC_DAILINK_REG(analog),
 		.ops = &loongson_ops,
 	},
@@ -197,6 +294,12 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	card->owner = THIS_MODULE;
 	card->dai_link = loongson_dai_links;
 	card->num_links = ARRAY_SIZE(loongson_dai_links);
+
+	if (ls_priv->cfg->add_dapm_widgets) {
+		card->dapm_widgets = loongson_aosc_dapm_widgets;
+		card->num_dapm_widgets = ARRAY_SIZE(loongson_aosc_dapm_widgets);
+	}
+
 	snd_soc_card_set_drvdata(card, ls_priv);
 
 	ret = device_property_read_string(dev, "model", &card->name);
@@ -207,6 +310,22 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Error parsing mclk-fs\n");
 
+	ls_priv->gpiod_hp_det = devm_gpiod_get_optional(dev, "loongson,hp-det", GPIOD_IN);
+	if (IS_ERR(ls_priv->gpiod_hp_det))
+		return PTR_ERR(ls_priv->gpiod_hp_det);
+
+	ls_priv->gpiod_hp_mute = devm_gpiod_get_optional(dev, "loongson,hp-mute", GPIOD_OUT_LOW);
+	if (IS_ERR(ls_priv->gpiod_hp_mute))
+		return PTR_ERR(ls_priv->gpiod_hp_mute);
+
+	ls_priv->gpiod_spkr_en = devm_gpiod_get_optional(dev, "loongson,spkr-en", GPIOD_OUT_LOW);
+	if (IS_ERR(ls_priv->gpiod_spkr_en))
+		return PTR_ERR(ls_priv->gpiod_spkr_en);
+
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+	if (ret)
+		dev_warn(dev, "Unable to parse routing\n");
+
 	ret = has_acpi_companion(dev) ? loongson_card_parse_acpi(ls_priv)
 				      : loongson_card_parse_of(ls_priv);
 	if (ret)
@@ -225,6 +344,10 @@ static const struct of_device_id loongson_asoc_dt_ids[] = {
 		.compatible = "loongson,ls2k0300-forever-pi-audio-card",
 		.data = &ls2k0300_forever_pi_card_config
 	},
+	{
+		.compatible = "loongson,ls2k0300-dl2k0300b-audio-card",
+		.data = &ls2k0300_dl2k0300b_card_config
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, loongson_asoc_dt_ids);
-- 
2.52.0

