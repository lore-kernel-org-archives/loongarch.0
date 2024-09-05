Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805EC188A24
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519774; cv=none; b=BymxFW4+uan+3Eu4bK+1nIlyBGbJlrzAEKOFW3uZN2T7CLZrAM4cgDFtxXY92L+N27yMdzuOtkN1+lC1ddhQdxZfnAVpf4VXNRK0VkBlfOiJbV8BK55tGHt+clLNCRfUPsPRX6CKORhj5eIIFDdTkj3zwp5+KbNRteenb9u9T6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519774; c=relaxed/simple;
	bh=o5+iCJYkWJegFBJz0AhQ29i514liklJW0LsD+ebg29Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXk59BpPzu/4YejiCl8vFIz3z/QyL1E3RbGie4Mzq3p/ewO1ZeTNYbu/xICllx9qCGrwPp1N/i0JSWVZ1YOUYnPZHHUHsJ09trtJHZY1Hojrumw/Q+irAlX3H9LOwoD80N/YYLM3bRSQLb+XKoP+RMuGs7FMXI/F2twchFLOiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.71])
	by gateway (Coremail) with SMTP id _____8Ax2emZV9lmnRkrAA--.17851S3;
	Thu, 05 Sep 2024 15:02:49 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.71])
	by front1 (Coremail) with SMTP id qMiowMAxXNyJV9lm38IEAA--.21058S4;
	Thu, 05 Sep 2024 15:02:46 +0800 (CST)
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
Subject: [PATCH v1 02/10] ASoC: codecs: Add support for ES8323
Date: Thu,  5 Sep 2024 15:02:15 +0800
Message-ID: <c44a6525d77941ef235825a58a9ea91f9f7d7042.1725518229.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMAxXNyJV9lm38IEAA--.21058S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfXF4rZF1furWUCw4UJr13trc_yoW5tF18to
	WSq34rtw17JryxXry5Jr1fGFyj9r15WF1fJFs8AanYvr17Aa45Kw4jqw15Ga43XFyFv340
	qryDJ3s5Jwsakrsrl-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUY87kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==

Add a codec driver for the Everest ES8323. It supports two separate
audio outputs and two separate audio inputs.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/codecs/Kconfig  |   5 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/es8323.c | 849 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/es8323.h |  77 ++++
 4 files changed, 933 insertions(+)
 create mode 100644 sound/soc/codecs/es8323.c
 create mode 100644 sound/soc/codecs/es8323.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index b5e6d0a986c8..85270aa43512 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -112,6 +112,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_DA9055
 	imply SND_SOC_DMIC
 	imply SND_SOC_ES8316
+	imply SND_SOC_ES8323
 	imply SND_SOC_ES8326
 	imply SND_SOC_ES8328_SPI
 	imply SND_SOC_ES8328_I2C
@@ -1142,6 +1143,10 @@ config SND_SOC_ES8316
 	tristate "Everest Semi ES8316 CODEC"
 	depends on I2C
 
+config SND_SOC_ES8323
+	tristate "Everest Semi ES8323 CODEC"
+	depends on I2C
+
 config SND_SOC_ES8326
 	tristate "Everest Semi ES8326 CODEC"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 622e360f0086..00ff3fdf0133 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -125,6 +125,7 @@ snd-soc-es7241-y := es7241.o
 snd-soc-es83xx-dsm-common-y := es83xx-dsm-common.o
 snd-soc-es8311-y := es8311.o
 snd-soc-es8316-y := es8316.o
+snd-soc-es8323-y := es8323.o
 snd-soc-es8326-y := es8326.o
 snd-soc-es8328-y := es8328.o
 snd-soc-es8328-i2c-y := es8328-i2c.o
@@ -531,6 +532,7 @@ obj-$(CONFIG_SND_SOC_ES7241)	+= snd-soc-es7241.o
 obj-$(CONFIG_SND_SOC_ES83XX_DSM_COMMON)    += snd-soc-es83xx-dsm-common.o
 obj-$(CONFIG_SND_SOC_ES8311)    += snd-soc-es8311.o
 obj-$(CONFIG_SND_SOC_ES8316)    += snd-soc-es8316.o
+obj-$(CONFIG_SND_SOC_ES8323)	+= snd-soc-es8323.o
 obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
 obj-$(CONFIG_SND_SOC_ES8328)	+= snd-soc-es8328.o
 obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
new file mode 100644
index 000000000000..596eba3214ea
--- /dev/null
+++ b/sound/soc/codecs/es8323.c
@@ -0,0 +1,847 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * es8323.c -- es8323 ALSA SoC audio driver
+ *
+ * Copyright Rockchip Electronics Co. Ltd.
+ * Copyright Everest Semiconductor Co.,Ltd
+ *
+ * Author: Mark Brown <will@everset-semi.com>
+ *         Jianqun Xu <jay.xu@rock-chips.com>
+ *         Nickey Yang <nickey.yang@rock-chips.com>
+ */
+
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/of_gpio.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+
+#include "es8323.h"
+
+#define ES8323_CODEC_SET_SPK	1
+#define ES8323_CODEC_SET_HP	2
+
+#define ES8323_DEF_VOL		0x1b
+
+/*
+ * es8323 register cache
+ * We can't read the es8323 register space when we
+ * are using 2 wire for device control, so we cache them instead.
+ */
+static u16 es8323_reg[] = {
+	0x06, 0x1C, 0xC3, 0xFC,	/*  0 */
+	0xC0, 0x00, 0x00, 0x7C,	/*  4 */
+	0x80, 0x00, 0x00, 0x06,	/*  8 */
+	0x00, 0x06, 0x30, 0x30,	/* 12 */
+	0xC0, 0xC0, 0x38, 0xB0,	/* 16 */
+	0x32, 0x06, 0x00, 0x00,	/* 20 */
+	0x06, 0x30, 0xC0, 0xC0,	/* 24 */
+	0x08, 0x06, 0x1F, 0xF7,	/* 28 */
+	0xFD, 0xFF, 0x1F, 0xF7,	/* 32 */
+	0xFD, 0xFF, 0x00, 0x38,	/* 36 */
+	0x38, 0x38, 0x38, 0x38,	/* 40 */
+	0x38, 0x00, 0x00, 0x00,	/* 44 */
+	0x00, 0x00, 0x00, 0x00,	/* 48 */
+	0x00, 0x00, 0x00, 0x00,	/* 52 */
+};
+
+/* codec private data */
+struct es8323_priv {
+	unsigned int sysclk;
+	struct clk *mclk;
+	struct snd_pcm_hw_constraint_list *sysclk_constraints;
+	struct snd_soc_component *component;
+	struct i2c_client *i2c;
+	int spk_ctl_gpio;
+	bool hp_inserted;
+	bool spk_gpio_level;
+};
+
+static const char *const es8323_line_texts[] = {
+	"Line 1", "Line 2", "PGA"
+};
+
+static const unsigned int es8323_line_values[] = {
+	0, 1, 3
+};
+
+static const char *const es8323_pga_sell[] = { "Line 1L", "Line 2L", "NC", "DifferentialL" };
+static const char *const es8323_pga_selr[] = { "Line 1R", "Line 2R", "NC", "DifferentialR" };
+static const char *const es8323_lin_sell[] = { "Line 1L", "Line 2L", "NC", "MicL" };
+static const char *const es8323_lin_selr[] = { "Line 1R", "Line 2R", "NC", "MicR" };
+
+static const char *const stereo_3d_txt[] = { "No 3D  ", "Level 1", "Level 2", "Level 3",
+					     "Level 4", "Level 5", "Level 6", "Level 7" };
+static const char *const ng_type_txt[] = { "Constant PGA Gain", "Mute ADC Output" };
+static const char *const deemph_txt[] = { "None", "32Khz", "44.1Khz", "48Khz" };
+static const char *const adcpol_txt[] = { "Normal", "L Invert", "R Invert", "L + R Invert" };
+
+static const char *const es8323_mono_mux[] = { "Stereo", "Mono (Left)", "Mono (Right)" };
+static const char *const es8323_diff_sel[] = { "Line 1", "Line 2" };
+
+static SOC_ENUM_SINGLE_DECL(es8323_left_dac_enum, ES8323_ADCCONTROL2, 6, es8323_pga_sell);
+static SOC_ENUM_SINGLE_DECL(es8323_right_dac_enum, ES8323_ADCCONTROL2, 4, es8323_pga_selr);
+static SOC_ENUM_SINGLE_DECL(es8323_diff_enum, ES8323_ADCCONTROL3, 7, es8323_diff_sel);
+static SOC_ENUM_SINGLE_DECL(es8323_llin_enum, ES8323_DACCONTROL16, 3, es8323_lin_sell);
+static SOC_ENUM_SINGLE_DECL(es8323_rlin_enum, ES8323_DACCONTROL16, 0, es8323_lin_selr);
+static SOC_ENUM_SINGLE_DECL(es8323_mono_enum, ES8323_ADCCONTROL3, 3, es8323_mono_mux);
+
+static const struct soc_enum es8323_enum[] = {
+	SOC_VALUE_ENUM_SINGLE(ES8323_DACCONTROL16, 3, 7, ARRAY_SIZE(es8323_line_texts),
+			      es8323_line_texts, es8323_line_values),	/* LLINE */
+	SOC_VALUE_ENUM_SINGLE(ES8323_DACCONTROL16, 0, 7, ARRAY_SIZE(es8323_line_texts),
+			      es8323_line_texts, es8323_line_values),	/* RLINE */
+	SOC_VALUE_ENUM_SINGLE(ES8323_ADCCONTROL2, 6, 3, ARRAY_SIZE(es8323_pga_sell),
+			      es8323_line_texts, es8323_line_values),	/* Left PGA Mux */
+	SOC_VALUE_ENUM_SINGLE(ES8323_ADCCONTROL2, 4, 3, ARRAY_SIZE(es8323_pga_sell),
+			      es8323_line_texts, es8323_line_values),	/* Right PGA Mux */
+	SOC_ENUM_SINGLE(ES8323_DACCONTROL7, 2, 8, stereo_3d_txt),	/* stereo-3d */
+	SOC_ENUM_SINGLE(ES8323_ADCCONTROL14, 1, 2, ng_type_txt),	/* noise gate type */
+	SOC_ENUM_SINGLE(ES8323_DACCONTROL6, 6, 4, deemph_txt),	/* Playback De-emphasis */
+	SOC_ENUM_SINGLE(ES8323_ADCCONTROL6, 6, 4, adcpol_txt),
+	SOC_ENUM_SINGLE(ES8323_ADCCONTROL3, 3, 3, es8323_mono_mux),
+	SOC_ENUM_SINGLE(ES8323_ADCCONTROL3, 7, 2, es8323_diff_sel),
+};
+
+static const DECLARE_TLV_DB_SCALE(pga_tlv, 0, 300, 0);
+static const DECLARE_TLV_DB_SCALE(adc_tlv, -9600, 50, 1);
+static const DECLARE_TLV_DB_SCALE(dac_tlv, -9600, 50, 1);
+static const DECLARE_TLV_DB_SCALE(out_tlv, -4500, 150, 0);
+static const DECLARE_TLV_DB_SCALE(bypass_tlv, 0, 300, 0);
+static const DECLARE_TLV_DB_SCALE(bypass_tlv2, -15, 300, 0);
+
+static const struct snd_kcontrol_new es8323_snd_controls[] = {
+	SOC_ENUM("3D Mode", es8323_enum[4]),
+	SOC_ENUM("ALC Capture Function", es8323_enum[5]),
+	SOC_SINGLE("ALC Capture ZC Switch", ES8323_ADCCONTROL13, 6, 1, 0),
+	SOC_SINGLE("ALC Capture Decay Time", ES8323_ADCCONTROL12, 4, 15, 0),
+	SOC_SINGLE("ALC Capture Attack Time", ES8323_ADCCONTROL12, 0, 15, 0),
+	SOC_SINGLE("ALC Capture NG Threshold", ES8323_ADCCONTROL14, 3, 31, 0),
+	SOC_ENUM("ALC Capture NG Type", es8323_enum[6]),
+	SOC_SINGLE("ALC Capture NG Switch", ES8323_ADCCONTROL14, 0, 1, 0),
+	SOC_SINGLE("ZC Timeout Switch", ES8323_ADCCONTROL13, 6, 1, 0),
+	SOC_DOUBLE_R_TLV("Capture Digital Volume", ES8323_LADC_VOL,
+			 ES8323_RADC_VOL, 0, 192, 1, adc_tlv),
+	SOC_SINGLE("Capture Mute", ES8323_ADC_MUTE, 2, 1, 0),
+	SOC_SINGLE_TLV("Left Channel Capture Volume", ES8323_ADCCONTROL1, 4, 8,
+		       0, bypass_tlv),
+	SOC_SINGLE_TLV("Right Channel Capture Volume", ES8323_ADCCONTROL1, 0,
+		       8, 0, bypass_tlv),
+	SOC_ENUM("Playback De-emphasis", es8323_enum[7]),
+	SOC_ENUM("Capture Polarity", es8323_enum[8]),
+	SOC_DOUBLE_R_TLV("PCM Volume", ES8323_LDAC_VOL, ES8323_RDAC_VOL,
+			 0, 192, 1, dac_tlv),
+	SOC_SINGLE_TLV("Left Mixer Left Bypass Volume", ES8323_DACCONTROL17, 3,
+		       7, 1, bypass_tlv2),
+	SOC_SINGLE_TLV("Right Mixer Right Bypass Volume", ES8323_DACCONTROL20,
+		       3, 7, 1, bypass_tlv2),
+	SOC_DOUBLE_R_TLV("Output 1 Playback Volume", ES8323_LOUT1_VOL,
+			 ES8323_ROUT1_VOL, 0, 33, 0, out_tlv),
+	SOC_DOUBLE_R_TLV("Output 2 Playback Volume", ES8323_LOUT2_VOL,
+			 ES8323_ROUT2_VOL, 0, 33, 0, out_tlv),
+};
+
+static const struct snd_kcontrol_new es8323_left_dac_mux_controls =
+	SOC_DAPM_ENUM("Route", es8323_left_dac_enum);
+
+static const struct snd_kcontrol_new es8323_right_dac_mux_controls =
+	SOC_DAPM_ENUM("Route", es8323_right_dac_enum);
+
+static const struct snd_kcontrol_new es8323_left_line_controls =
+	SOC_DAPM_ENUM("LLIN Mux", es8323_llin_enum);
+
+static const struct snd_kcontrol_new es8323_right_line_controls =
+	SOC_DAPM_ENUM("RLIN Mux", es8323_rlin_enum);
+
+/* Differential Mux */
+static const struct snd_kcontrol_new es8323_diffmux_controls =
+	SOC_DAPM_ENUM("Route2", es8323_diff_enum);
+
+/* Mono ADC Mux */
+static const struct snd_kcontrol_new es8323_monomux_controls =
+	SOC_DAPM_ENUM("Mono Mux", es8323_mono_enum);
+
+/* Right PGA Mux */
+static const struct snd_kcontrol_new es8323_right_pga_controls =
+	SOC_DAPM_ENUM("Route", es8323_enum[3]);
+
+/* Left Mixer */
+static const struct snd_kcontrol_new es8323_left_mixer_controls[] = {
+	SOC_DAPM_SINGLE("Left Playback Switch", SND_SOC_NOPM, 7, 1, 1),
+	SOC_DAPM_SINGLE("Left Bypass Switch", ES8323_DACCONTROL17, 6, 1, 0),
+};
+
+/* Right Mixer */
+static const struct snd_kcontrol_new es8323_right_mixer_controls[] = {
+	SOC_DAPM_SINGLE("Right Playback Switch", SND_SOC_NOPM, 6, 1, 1),
+	SOC_DAPM_SINGLE("Right Bypass Switch", ES8323_DACCONTROL20, 6, 1, 0),
+};
+
+static const struct snd_soc_dapm_widget es8323_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("LINPUT1"),
+	SND_SOC_DAPM_INPUT("LINPUT2"),
+	SND_SOC_DAPM_INPUT("RINPUT1"),
+	SND_SOC_DAPM_INPUT("RINPUT2"),
+
+	SND_SOC_DAPM_MUX("Left PGA Mux", SND_SOC_NOPM, 0, 0,
+			 &es8323_left_dac_mux_controls),
+	SND_SOC_DAPM_MUX("Right PGA Mux", SND_SOC_NOPM, 0, 0,
+			 &es8323_right_dac_mux_controls),
+	SND_SOC_DAPM_MICBIAS("Mic Bias", SND_SOC_NOPM, 3, 1),
+
+	SND_SOC_DAPM_MUX("Differential Mux", SND_SOC_NOPM, 0, 0,
+			 &es8323_diffmux_controls),
+
+	SND_SOC_DAPM_MUX("Left ADC Mux", SND_SOC_NOPM, 0, 0,
+			 &es8323_monomux_controls),
+	SND_SOC_DAPM_MUX("Right ADC Mux", SND_SOC_NOPM, 0, 0,
+			 &es8323_monomux_controls),
+	SND_SOC_DAPM_MUX("Left Line Mux", SND_SOC_NOPM, 0, 0,
+			 &es8323_left_line_controls),
+	SND_SOC_DAPM_MUX("Right Line Mux", SND_SOC_NOPM, 0, 0,
+			 &es8323_right_line_controls),
+	SND_SOC_DAPM_ADC("Right ADC", "Right Capture", SND_SOC_NOPM, 4, 1),
+	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", SND_SOC_NOPM, 5, 1),
+	/* gModify.Cmmt Implement when suspend/startup */
+	SND_SOC_DAPM_DAC("Right DAC", "Right Playback", SND_SOC_NOPM, 6, 1),
+	SND_SOC_DAPM_DAC("Left DAC", "Left Playback", SND_SOC_NOPM, 7, 1),
+	SND_SOC_DAPM_MIXER("Left Mixer", SND_SOC_NOPM, 0, 0,
+			   &es8323_left_mixer_controls[0],
+			   ARRAY_SIZE(es8323_left_mixer_controls)),
+	SND_SOC_DAPM_MIXER("Right Mixer", SND_SOC_NOPM, 0, 0,
+			   &es8323_right_mixer_controls[0],
+			   ARRAY_SIZE(es8323_right_mixer_controls)),
+
+	SND_SOC_DAPM_PGA("Right ADC Power", SND_SOC_NOPM, 6, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("Left ADC Power", SND_SOC_NOPM, 7, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("Right Out 2", SND_SOC_NOPM, 2, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Left Out 2", SND_SOC_NOPM, 3, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Right Out 1", SND_SOC_NOPM, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Left Out 1", SND_SOC_NOPM, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("LAMP", ES8323_ADCCONTROL1, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("RAMP", ES8323_ADCCONTROL1, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_OUTPUT("LOUT1"),
+	SND_SOC_DAPM_OUTPUT("ROUT1"),
+	SND_SOC_DAPM_OUTPUT("LOUT2"),
+	SND_SOC_DAPM_OUTPUT("ROUT2"),
+	SND_SOC_DAPM_OUTPUT("VREF"),
+};
+
+static const struct snd_soc_dapm_route audio_map[] = {
+	/*12.22*/
+	{"Left PGA Mux", "Line 1L", "LINPUT1"},
+	{"Left PGA Mux", "Line 2L", "LINPUT2"},
+	{"Left PGA Mux", "DifferentialL", "Differential Mux"},
+
+	{"Right PGA Mux", "Line 1R", "RINPUT1"},
+	{"Right PGA Mux", "Line 2R", "RINPUT2"},
+	{"Right PGA Mux", "DifferentialR", "Differential Mux"},
+
+	{"Differential Mux", "Line 1", "LINPUT1"},
+	{"Differential Mux", "Line 1", "RINPUT1"},
+	{"Differential Mux", "Line 2", "LINPUT2"},
+	{"Differential Mux", "Line 2", "RINPUT2"},
+
+	{"Left ADC Mux", "Stereo", "Right PGA Mux"},
+	{"Left ADC Mux", "Stereo", "Left PGA Mux"},
+	{"Left ADC Mux", "Mono (Left)", "Left PGA Mux"},
+
+	{"Right ADC Mux", "Stereo", "Left PGA Mux"},
+	{"Right ADC Mux", "Stereo", "Right PGA Mux"},
+	{"Right ADC Mux", "Mono (Right)", "Right PGA Mux"},
+
+	{"Left ADC Power", NULL, "Left ADC Mux"},
+	{"Right ADC Power", NULL, "Right ADC Mux"},
+	{"Left ADC", NULL, "Left ADC Power"},
+	{"Right ADC", NULL, "Right ADC Power"},
+
+	{"Left Line Mux", "Line 1L", "LINPUT1"},
+	{"Left Line Mux", "Line 2L", "LINPUT2"},
+	{"Left Line Mux", "MicL", "Left PGA Mux"},
+
+	{"Right Line Mux", "Line 1R", "RINPUT1"},
+	{"Right Line Mux", "Line 2R", "RINPUT2"},
+	{"Right Line Mux", "MicR", "Right PGA Mux"},
+
+	{"Left Mixer", "Left Playback Switch", "Left DAC"},
+	{"Left Mixer", "Left Bypass Switch", "Left Line Mux"},
+
+	{"Right Mixer", "Right Playback Switch", "Right DAC"},
+	{"Right Mixer", "Right Bypass Switch", "Right Line Mux"},
+
+	{"Left Out 1", NULL, "Left Mixer"},
+	{"LOUT1", NULL, "Left Out 1"},
+	{"Right Out 1", NULL, "Right Mixer"},
+	{"ROUT1", NULL, "Right Out 1"},
+
+	{"Left Out 2", NULL, "Left Mixer"},
+	{"LOUT2", NULL, "Left Out 2"},
+	{"Right Out 2", NULL, "Right Mixer"},
+	{"ROUT2", NULL, "Right Out 2"},
+};
+
+struct coeff_div {
+	u32 mclk;
+	u32 rate;
+	u16 fs;
+	u8 sr:4;
+	u8 usb:1;
+};
+
+/* codec hifi mclk clock divider coefficients */
+static const struct coeff_div es8323_coeff_div[] = {
+	/* 8k */
+	{12288000, 8000, 1536, 0xa, 0x0},
+	{11289600, 8000, 1408, 0x9, 0x0},
+	{18432000, 8000, 2304, 0xc, 0x0},
+	{16934400, 8000, 2112, 0xb, 0x0},
+	{12000000, 8000, 1500, 0xb, 0x1},
+
+	/* 11.025k */
+	{11289600, 11025, 1024, 0x7, 0x0},
+	{16934400, 11025, 1536, 0xa, 0x0},
+	{12000000, 11025, 1088, 0x9, 0x1},
+
+	/* 16k */
+	{12288000, 16000, 768, 0x6, 0x0},
+	{18432000, 16000, 1152, 0x8, 0x0},
+	{12000000, 16000, 750, 0x7, 0x1},
+
+	/* 22.05k */
+	{11289600, 22050, 512, 0x4, 0x0},
+	{16934400, 22050, 768, 0x6, 0x0},
+	{12000000, 22050, 544, 0x6, 0x1},
+
+	/* 32k */
+	{12288000, 32000, 384, 0x3, 0x0},
+	{18432000, 32000, 576, 0x5, 0x0},
+	{12000000, 32000, 375, 0x4, 0x1},
+
+	/* 44.1k */
+	{11289600, 44100, 256, 0x2, 0x0},
+	{16934400, 44100, 384, 0x3, 0x0},
+	{12000000, 44100, 272, 0x3, 0x1},
+
+	/* 48k */
+	{12288000, 48000, 256, 0x2, 0x0},
+	{18432000, 48000, 384, 0x3, 0x0},
+	{12000000, 48000, 250, 0x2, 0x1},
+
+	/* 88.2k */
+	{11289600, 88200, 128, 0x0, 0x0},
+	{16934400, 88200, 192, 0x1, 0x0},
+	{12000000, 88200, 136, 0x1, 0x1},
+
+	/* 96k */
+	{12288000, 96000, 128, 0x0, 0x0},
+	{18432000, 96000, 192, 0x1, 0x0},
+	{12000000, 96000, 125, 0x0, 0x1},
+};
+
+/* The set of rates we can generate from the above for each SYSCLK */
+
+static unsigned int rates_12288[] = {
+	8000, 12000, 16000, 24000, 24000, 32000, 48000, 96000,
+};
+
+static struct snd_pcm_hw_constraint_list constraints_12288 = {
+	.count = ARRAY_SIZE(rates_12288),
+	.list = rates_12288,
+};
+
+static unsigned int rates_112896[] = {
+	8000, 11025, 22050, 44100,
+};
+
+static struct snd_pcm_hw_constraint_list constraints_112896 = {
+	.count = ARRAY_SIZE(rates_112896),
+	.list = rates_112896,
+};
+
+static unsigned int rates_12[] = {
+	8000, 11025, 12000, 16000, 22050, 24000,
+	32000, 44100, 48000, 48000, 88235, 96000,
+};
+
+static struct snd_pcm_hw_constraint_list constraints_12 = {
+	.count = ARRAY_SIZE(rates_12),
+	.list = rates_12,
+};
+
+static inline int get_coeff(int mclk, int rate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(es8323_coeff_div); i++) {
+		if (es8323_coeff_div[i].rate == rate &&
+		    es8323_coeff_div[i].mclk == mclk)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static void es8323_set_gpio(int gpio, bool level, int spk_ctl_gpio)
+{
+	if (!(gpio & ES8323_CODEC_SET_SPK) || spk_ctl_gpio == -1)
+		return;
+
+	gpio_set_value(spk_ctl_gpio, level);
+}
+
+static int es8323_write(struct snd_soc_component *component,
+			unsigned int reg, unsigned int value)
+{
+	int ret;
+	u8 data[2];
+	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
+
+	data[0] = reg;
+	data[1] = value & 0x00ff;
+
+	if (reg < ARRAY_SIZE(es8323_reg))
+		es8323_reg[reg] = value;
+
+	ret = i2c_master_send(es8323->i2c, data, 2);
+	if (ret == 2)
+		return 0;
+
+	return (ret < 0) ? ret : -EIO;
+}
+
+static unsigned int es8323_read_reg_cache(struct snd_soc_component *component,
+					  unsigned int reg)
+{
+	if (reg >= ARRAY_SIZE(es8323_reg))
+		return -1;
+
+	return es8323_reg[reg];
+}
+
+static void es8323_reset(struct snd_soc_component *component)
+{
+	snd_soc_component_write(component, ES8323_CONTROL1, 0x80);
+	snd_soc_component_write(component, ES8323_CONTROL1, 0x00);
+}
+
+/*
+ * Note that this should be called from init rather than from hw_params.
+ */
+static int es8323_set_dai_sysclk(struct snd_soc_dai *codec_dai,
+				 int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
+
+	switch (freq) {
+	case 11289600:
+	case 18432000:
+	case 22579200:
+	case 36864000:
+		es8323->sysclk_constraints = &constraints_112896;
+		es8323->sysclk = freq;
+		break;
+	case 12288000:
+	case 16934400:
+	case 24576000:
+	case 33868800:
+		es8323->sysclk_constraints = &constraints_12288;
+		es8323->sysclk = freq;
+		break;
+	case 12000000:
+	case 24000000:
+		es8323->sysclk_constraints = &constraints_12;
+		es8323->sysclk = freq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int es8323_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	u8 iface = snd_soc_component_read(component, ES8323_MASTERMODE);
+	u8 adciface = snd_soc_component_read(component, ES8323_ADC_IFACE);
+	u8 daciface = snd_soc_component_read(component, ES8323_DAC_IFACE);
+
+	/* set master/slave audio interface */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:	/* MASTER MODE */
+		iface |= 0x80;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:	/* SLAVE MODE */
+		iface &= 0x7F;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* interface format */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		adciface &= 0xFC;
+		daciface &= 0xF9;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+	case SND_SOC_DAIFMT_LEFT_J:
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* clock inversion */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		iface &= 0xDF;
+		adciface &= 0xDF;
+		daciface &= 0xBF;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		iface |= 0x20;
+		adciface |= 0x20;
+		daciface |= 0x40;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		iface |= 0x20;
+		adciface &= 0xDF;
+		daciface &= 0xBF;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		iface &= 0xDF;
+		adciface |= 0x20;
+		daciface |= 0x40;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	snd_soc_component_write(component, ES8323_MASTERMODE, iface);
+	snd_soc_component_write(component, ES8323_ADC_IFACE, adciface);
+	snd_soc_component_write(component, ES8323_DAC_IFACE, daciface);
+
+	return 0;
+}
+
+static int es8323_pcm_startup(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
+
+	if (es8323->sysclk) {
+		snd_pcm_hw_constraint_list(substream->runtime, 0,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   es8323->sysclk_constraints);
+	}
+
+	return 0;
+}
+
+static int es8323_pcm_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
+	u16 srate = snd_soc_component_read(component, ES8323_MASTERMODE) & 0x80;
+	u16 adciface = snd_soc_component_read(component, ES8323_ADC_IFACE) & 0xE3;
+	u16 daciface = snd_soc_component_read(component, ES8323_DAC_IFACE) & 0xC7;
+	int coeff;
+
+	coeff = get_coeff(es8323->sysclk, params_rate(params));
+	if (coeff < 0) {
+		coeff = get_coeff(es8323->sysclk / 2, params_rate(params));
+		srate |= 0x40;
+	}
+
+	if (coeff < 0) {
+		dev_err(component->dev,
+			"Unable to configure sample rate %dHz with %dHz MCLK\n",
+			params_rate(params), es8323->sysclk);
+		return coeff;
+	}
+
+	/* bit size */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		adciface |= 0x000C;
+		daciface |= 0x0018;
+		break;
+	case SNDRV_PCM_FORMAT_S20_3LE:
+		adciface |= 0x0004;
+		daciface |= 0x0008;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		adciface |= 0x0010;
+		daciface |= 0x0020;
+		break;
+	}
+
+	/* set iface & srate */
+	snd_soc_component_write(component, ES8323_DAC_IFACE, daciface);
+	snd_soc_component_write(component, ES8323_ADC_IFACE, adciface);
+
+	snd_soc_component_write(component, ES8323_MASTERMODE, srate);
+	snd_soc_component_write(component, ES8323_ADCCONTROL5,
+				es8323_coeff_div[coeff].sr |
+				(es8323_coeff_div[coeff].usb) << 4);
+	snd_soc_component_write(component, ES8323_DACCONTROL2,
+				es8323_coeff_div[coeff].sr |
+				(es8323_coeff_div[coeff].usb) << 4);
+
+	/* open dac output here */
+	snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
+
+	return 0;
+}
+
+static int es8323_mute(struct snd_soc_dai *dai, int mute,  int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
+
+	if (mute) {
+		es8323_set_gpio(ES8323_CODEC_SET_SPK,
+				!es8323->spk_gpio_level, es8323->spk_ctl_gpio);
+		usleep_range(2000, 3000);
+		snd_soc_component_write(component, ES8323_DAC_MUTE, 0x06);
+	} else {
+		snd_soc_component_write(component, ES8323_DAC_MUTE, 0x02);
+		usleep_range(2000, 3000);
+		if (!es8323->hp_inserted)
+			es8323_set_gpio(ES8323_CODEC_SET_SPK,
+					es8323->spk_gpio_level, es8323->spk_ctl_gpio);
+		usleep_range(2000, 3000);
+	}
+
+	return 0;
+}
+
+#define ES8323_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+			SNDRV_PCM_FMTBIT_S24_LE)
+
+static const struct snd_soc_dai_ops es8323_ops = {
+	.startup	= es8323_pcm_startup,
+	.hw_params	= es8323_pcm_hw_params,
+	.set_fmt	= es8323_set_dai_fmt,
+	.set_sysclk	= es8323_set_dai_sysclk,
+	.mute_stream	= es8323_mute,
+};
+
+static struct snd_soc_dai_driver es8323_dai = {
+	.name = "ES8323 HiFi",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = ES8323_FORMATS,
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = ES8323_FORMATS,
+	},
+	.ops = &es8323_ops,
+	.symmetric_rate = 1,
+};
+
+static int es8323_suspend(struct snd_soc_component *component)
+{
+	snd_soc_component_write(component, ES8323_DAC_MUTE, 0x06);
+	snd_soc_component_write(component, ES8323_LOUT1_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_ROUT1_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_LOUT2_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_ROUT2_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_DACCONTROL17, 0x38);
+	snd_soc_component_write(component, ES8323_DACCONTROL20, 0x38);
+	snd_soc_component_write(component, ES8323_DACPOWER, 0x00);
+	snd_soc_component_write(component, ES8323_DACPOWER, 0xc0);
+	snd_soc_component_write(component, ES8323_ADCPOWER, 0xff);
+	snd_soc_component_write(component, ES8323_CHIPPOWER, 0xf3);
+	snd_soc_component_write(component, ES8323_DACCONTROL21, 0x9c);
+	snd_soc_component_write(component, ES8323_CONTROL1, 0x06);
+	snd_soc_component_write(component, ES8323_CONTROL2, 0x58);
+	usleep_range(18000, 20000);
+
+	return 0;
+}
+
+static void es8323_init_component_regs(struct snd_soc_component *component)
+{
+	snd_soc_component_write(component, ES8323_CONTROL2, 0x60);
+	snd_soc_component_write(component, ES8323_CHIPPOWER, 0xF3);
+	snd_soc_component_write(component, ES8323_CHIPPOWER, 0xF0);
+	snd_soc_component_write(component, ES8323_DACCONTROL21, 0x80);
+	snd_soc_component_write(component, ES8323_CONTROL1, 0x36);
+	snd_soc_component_write(component, ES8323_MASTERMODE, 0x00);
+	snd_soc_component_write(component, ES8323_DACPOWER, 0x00);
+	snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0xC3);
+	snd_soc_component_write(component, ES8323_DAC_MUTE, 0x02);
+	snd_soc_component_write(component, ES8323_ADCCONTROL1, 0x88);
+	snd_soc_component_write(component, ES8323_ADCCONTROL2, 0xF0);
+	snd_soc_component_write(component, ES8323_ADCCONTROL3, 0x02);
+	snd_soc_component_write(component, ES8323_ADCCONTROL4, 0x0C);
+	snd_soc_component_write(component, ES8323_ADCCONTROL5, 0x02);
+	snd_soc_component_write(component, ES8323_LADC_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_RADC_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_ADCCONTROL10, 0xea);
+	snd_soc_component_write(component, ES8323_ADCCONTROL11, 0xa2);
+	snd_soc_component_write(component, ES8323_ADCCONTROL12, 0x32);
+	snd_soc_component_write(component, ES8323_DACCONTROL1, 0x18);
+	snd_soc_component_write(component, ES8323_DACCONTROL2, 0x02);
+	snd_soc_component_write(component, ES8323_LDAC_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_RDAC_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_DACCONTROL17, 0xB8);
+	snd_soc_component_write(component, ES8323_DACCONTROL20, 0xB8);
+	usleep_range(18000, 20000);
+	snd_soc_component_write(component, ES8323_LOUT1_VOL, 0x1e);
+	snd_soc_component_write(component, ES8323_ROUT1_VOL, 0x1e);
+	snd_soc_component_write(component, ES8323_LOUT2_VOL, 0x1e);
+	snd_soc_component_write(component, ES8323_ROUT2_VOL, 0x1e);
+	snd_soc_component_write(component, ES8323_ADCPOWER, 0x09);
+	snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
+	usleep_range(18000, 20000);
+}
+
+static int es8323_resume(struct snd_soc_component *component)
+{
+	es8323_init_component_regs(component);
+	/* open dac output */
+	snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
+
+	return 0;
+}
+
+static void es8323_remove(struct snd_soc_component *component)
+{
+	snd_soc_component_write(component, ES8323_CONTROL2, 0x58);
+	snd_soc_component_write(component, ES8323_CONTROL1, 0x32);
+	snd_soc_component_write(component, ES8323_CHIPPOWER, 0xf3);
+	snd_soc_component_write(component, ES8323_DACPOWER, 0xc0);
+	mdelay(50);
+	snd_soc_component_write(component, ES8323_LOUT2_VOL, 0x00);
+	snd_soc_component_write(component, ES8323_ROUT2_VOL, 0x00);
+	mdelay(50);
+	snd_soc_component_write(component, ES8323_CONTROL1, 0x30);
+	snd_soc_component_write(component, ES8323_CONTROL1, 0x34);
+}
+
+static int es8323_probe(struct snd_soc_component *component)
+{
+	struct es8323_priv *es8323 = snd_soc_component_get_drvdata(component);
+
+	es8323->mclk = devm_clk_get_optional_enabled(component->dev, "mclk");
+	if (IS_ERR(es8323->mclk)) {
+		dev_err(component->dev, "mclk is missing or invalid\n");
+		return PTR_ERR(es8323->mclk);
+	}
+
+	es8323->component = component;
+	es8323_reset(component);
+	es8323_init_component_regs(component);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_es8323 = {
+	.probe			= es8323_probe,
+	.remove			= es8323_remove,
+	.suspend		= es8323_suspend,
+	.resume			= es8323_resume,
+	.read			= es8323_read_reg_cache,
+	.write			= es8323_write,
+	.dapm_widgets		= es8323_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(es8323_dapm_widgets),
+	.dapm_routes		= audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(audio_map),
+	.controls		= es8323_snd_controls,
+	.num_controls		= ARRAY_SIZE(es8323_snd_controls),
+};
+
+static int es8323_i2c_probe(struct i2c_client *i2c)
+{
+	struct es8323_priv *es8323;
+	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
+		dev_warn(&adapter->dev,
+			 "I2C-Adapter doesn't support I2C_FUNC_I2C\n");
+		return -EIO;
+	}
+
+	es8323 = devm_kzalloc(&i2c->dev, sizeof(*es8323), GFP_KERNEL);
+	if (IS_ERR(es8323))
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, es8323);
+	es8323->i2c = i2c;
+
+	return devm_snd_soc_register_component(&i2c->dev,
+					       &soc_codec_dev_es8323,
+					       &es8323_dai, 1);
+}
+
+static void es8323_i2c_shutdown(struct i2c_client *client)
+{
+	struct es8323_priv *es8323 = i2c_get_clientdata(client);
+	struct snd_soc_component *component = es8323->component;
+
+	es8323_set_gpio(ES8323_CODEC_SET_SPK,
+			!es8323->spk_gpio_level, es8323->spk_ctl_gpio);
+
+	es8323_remove(component);
+}
+
+static const struct i2c_device_id es8323_i2c_id[] = {
+	{ "es8323", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, es8323_i2c_id);
+
+static const struct acpi_device_id es8323_acpi_match[] = {
+	{ "ESSX8323", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, es8323_acpi_match);
+
+static const struct of_device_id es8323_of_match[] = {
+	{ .compatible = "everest,es8323" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, es8323_of_match);
+
+static struct i2c_driver es8323_i2c_driver = {
+	.driver = {
+		.name = "ES8323",
+		.acpi_match_table = es8323_acpi_match,
+		.of_match_table = es8323_of_match,
+	},
+	.shutdown = es8323_i2c_shutdown,
+	.probe = es8323_i2c_probe,
+	.id_table = es8323_i2c_id,
+};
+module_i2c_driver(es8323_i2c_driver);
+
+MODULE_DESCRIPTION("Everest Semi ES8323 ALSA SoC Codec Driver");
+MODULE_AUTHOR("Mark Brown <will@everset-semi.com>");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/es8323.h b/sound/soc/codecs/es8323.h
new file mode 100644
index 000000000000..d379dcfc4fed
--- /dev/null
+++ b/sound/soc/codecs/es8323.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright Openedhand Ltd.
+ *
+ * Author: Richard Purdie <richard@openedhand.com>
+ *
+ */
+
+#ifndef _ES8323_H
+#define _ES8323_H
+
+/* ES8323 register space */
+
+/* Chip Control and Power Management */
+#define ES8323_CONTROL1		0x00
+#define ES8323_CONTROL2		0x01
+#define ES8323_CHIPPOWER	0x02
+#define ES8323_ADCPOWER		0x03
+#define ES8323_DACPOWER		0x04
+#define ES8323_CHIPLOPOW1	0x05
+#define ES8323_CHIPLOPOW2	0x06
+#define ES8323_ANAVOLMANAG	0x07
+#define ES8323_MASTERMODE	0x08
+
+/* ADC Control */
+#define ES8323_ADCCONTROL1	0x09
+#define ES8323_ADCCONTROL2	0x0a
+#define ES8323_ADCCONTROL3	0x0b
+#define ES8323_ADCCONTROL4	0x0c
+#define ES8323_ADCCONTROL5	0x0d
+#define ES8323_ADCCONTROL6	0x0e
+#define ES8323_ADC_MUTE		0x0f
+#define ES8323_LADC_VOL		0x10
+#define ES8323_RADC_VOL		0x11
+#define ES8323_ADCCONTROL10	0x12
+#define ES8323_ADCCONTROL11	0x13
+#define ES8323_ADCCONTROL12	0x14
+#define ES8323_ADCCONTROL13	0x15
+#define ES8323_ADCCONTROL14	0x16
+
+/* DAC Control */
+#define ES8323_DACCONTROL1	0x17
+#define ES8323_DACCONTROL2	0x18
+#define ES8323_DAC_MUTE		0x19
+#define ES8323_LDAC_VOL		0x1a
+#define ES8323_RDAC_VOL		0x1b
+#define ES8323_DACCONTROL6	0x1c
+#define ES8323_DACCONTROL7	0x1d
+#define ES8323_DACCONTROL8	0x1e
+#define ES8323_DACCONTROL9	0x1f
+#define ES8323_DACCONTROL10	0x20
+#define ES8323_DACCONTROL11	0x21
+#define ES8323_DACCONTROL12	0x22
+#define ES8323_DACCONTROL13	0x23
+#define ES8323_DACCONTROL14	0x24
+#define ES8323_DACCONTROL15	0x25
+#define ES8323_DACCONTROL16	0x26
+#define ES8323_DACCONTROL17	0x27
+#define ES8323_DACCONTROL18	0x28
+#define ES8323_DACCONTROL19	0x29
+#define ES8323_DACCONTROL20	0x2a
+#define ES8323_DACCONTROL21	0x2b
+#define ES8323_DACCONTROL22	0x2c
+#define ES8323_DACCONTROL23	0x2d
+#define ES8323_LOUT1_VOL	0x2e
+#define ES8323_ROUT1_VOL	0x2f
+#define ES8323_LOUT2_VOL	0x30
+#define ES8323_ROUT2_VOL	0x31
+#define ES8323_DACCONTROL28	0x32
+#define ES8323_DACCONTROL29	0x33
+#define ES8323_DACCONTROL30	0x34
+
+#define ES8323_ADC_IFACE	ES8323_ADCCONTROL4
+#define ES8323_ADC_SRATE	ES8323_ADCCONTROL5
+#define ES8323_DAC_IFACE	ES8323_DACCONTROL1
+#define ES8323_DAC_SRATE	ES8323_DACCONTROL2
+#endif
-- 
2.43.5

