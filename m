Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689B72D7D3A
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 06:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211085; cv=none; b=KwDFGeBMDJe2d5RA9LHok7HsXASBNGmS6gbWCISxI5c/aieCSPVqFz2CqAC0gzsS1uXDBNaMeO26jLEL+NpIt3uBMrW2b4ap99/JZBe+ZvsUfIIa8uTK4AW+9XHK9PdxHfdq5j4qyff2Q1my7ZL/YMTVWSFdIUiDBQyr75Qeyhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211085; c=relaxed/simple;
	bh=eQoEotEpIpWesWbb93SbM6uiZ1ROkoiI2ggAao9QOQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9RSHFO+3/nypIW1RPFx0dcQcrYA4R20C+16reo6Ns6qTE+9uT9AcfSCsCzoZvq97Ng7opjcz2gWPHRWAYsKtWlOKe6TYrgHTokBCrHjkvuS29yp6Xh1ZfmkFZv4DMAU/glHX0cYS6dSAFmN6UF2jyZ0n7iTTXLrAENAEH2Lcu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8AxjsPEDbFp+dIZAA--.10626S3;
	Wed, 11 Mar 2026 14:37:56 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCx_8LCDbFp2clSAA--.26807S2;
	Wed, 11 Mar 2026 14:37:55 +0800 (CST)
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
Subject: [PATCH 4/6] ASoC: loongson: Separate external shared DMA from the platform interface
Date: Wed, 11 Mar 2026 14:37:46 +0800
Message-ID: <ee1309d49b93daaee62dc8f9a955dc4130d4bd0e.1773107475.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJCx_8LCDbFp2clSAA--.26807S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEDCGmxBCIAqwAAsd
X-Coremail-Antispam: 1Uk129KBj93XoW3JF45Xr4fGFWrXF43Xw4xAFc_yoW3GryrpF
	s3A3yxWrW5AF4avr98JryrZr1fArySkF9rGay7J348Ar9rA345u34DtF1qvF47CFWUWryk
	XFWkC3yrC3Z8GFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

External shared DMA has no binding relationship with the platform
interface. Separating external shared DMA-related definitions enhances
the clarity of the overall structural hierarchy.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/Makefile            |  4 +-
 sound/soc/loongson/loongson_dma.c      | 58 +++++++++++++++++++++++++
 sound/soc/loongson/loongson_dma.h      |  2 +
 sound/soc/loongson/loongson_i2s_plat.c | 59 +-------------------------
 4 files changed, 64 insertions(+), 59 deletions(-)

diff --git a/sound/soc/loongson/Makefile b/sound/soc/loongson/Makefile
index 4c6d3130bcee..6e43672071fc 100644
--- a/sound/soc/loongson/Makefile
+++ b/sound/soc/loongson/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 #Platform Support
-snd-soc-loongson-i2s-pci-y := loongson_i2s_pci.o loongson_dma.o
+snd-soc-loongson-i2s-pci-y := loongson_i2s_pci.o
 obj-$(CONFIG_SND_SOC_LOONGSON_I2S_PCI) += snd-soc-loongson-i2s-pci.o snd-soc-loongson-i2s.o
 
 snd-soc-loongson-i2s-plat-y := loongson_i2s_plat.o
 obj-$(CONFIG_SND_SOC_LOONGSON_I2S_PLATFORM) += snd-soc-loongson-i2s-plat.o snd-soc-loongson-i2s.o
 
-snd-soc-loongson-i2s-y := loongson_i2s.o
+snd-soc-loongson-i2s-y := loongson_i2s.o loongson_dma.o
 
 obj-$(CONFIG_SND_LOONGSON1_AC97) += loongson1_ac97.o
 
diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 07a084cebdc0..07ee9afc4981 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -343,3 +343,61 @@ const struct snd_soc_component_driver loongson_i2s_internal_dma_component = {
 	.mmap		= loongson_internal_dma_pcm_mmap,
 	.pcm_construct	= loongson_internal_dma_pcm_new,
 };
+EXPORT_SYMBOL_GPL(loongson_i2s_internal_dma_component);
+
+static const struct snd_pcm_hardware loongson_external_dma_hardware = {
+	.info = SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_RESUME |
+		SNDRV_PCM_INFO_PAUSE,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |
+		   SNDRV_PCM_FMTBIT_S20_3LE |
+		   SNDRV_PCM_FMTBIT_S24_LE,
+	.period_bytes_min = 128,
+	.period_bytes_max = 128 * 1024,
+	.periods_min = 1,
+	.periods_max = 64,
+	.buffer_bytes_max = 1024 * 1024,
+};
+
+const struct snd_dmaengine_pcm_config loongson_dmaengine_pcm_config = {
+	.pcm_hardware = &loongson_external_dma_hardware,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.prealloc_buffer_size = 128 * 1024,
+};
+EXPORT_SYMBOL_GPL(loongson_dmaengine_pcm_config);
+
+static int loongson_external_dma_pcm_open(struct snd_soc_component *component,
+					  struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->pcm->device & 1) {
+		runtime->hw.info &= ~SNDRV_PCM_INFO_INTERLEAVED;
+		runtime->hw.info |= SNDRV_PCM_INFO_NONINTERLEAVED;
+	}
+
+	if (substream->pcm->device & 2)
+		runtime->hw.info &= ~(SNDRV_PCM_INFO_MMAP |
+				      SNDRV_PCM_INFO_MMAP_VALID);
+	/*
+	 * For mysterious reasons (and despite what the manual says)
+	 * playback samples are lost if the DMA count is not a multiple
+	 * of the DMA burst size.  Let's add a rule to enforce that.
+	 */
+	snd_pcm_hw_constraint_step(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 128);
+	snd_pcm_hw_constraint_step(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
+	snd_pcm_hw_constraint_integer(substream->runtime,
+				      SNDRV_PCM_HW_PARAM_PERIODS);
+
+	return 0;
+}
+
+const struct snd_soc_component_driver loongson_i2s_external_dma_component = {
+	.name   = LS_I2S_DRVNAME,
+	.open	= loongson_external_dma_pcm_open,
+};
+EXPORT_SYMBOL_GPL(loongson_i2s_external_dma_component);
diff --git a/sound/soc/loongson/loongson_dma.h b/sound/soc/loongson/loongson_dma.h
index 8795fd7874bb..989832385220 100644
--- a/sound/soc/loongson/loongson_dma.h
+++ b/sound/soc/loongson/loongson_dma.h
@@ -10,5 +10,7 @@
 #define _LOONGSON_DMA_H
 
 extern const struct snd_soc_component_driver loongson_i2s_internal_dma_component;
+extern const struct snd_soc_component_driver loongson_i2s_external_dma_component;
+extern const struct snd_dmaengine_pcm_config loongson_dmaengine_pcm_config;
 
 #endif
diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/loongson_i2s_plat.c
index f8d7aca8b903..eaaab2b05633 100644
--- a/sound/soc/loongson/loongson_i2s_plat.c
+++ b/sound/soc/loongson/loongson_i2s_plat.c
@@ -19,6 +19,7 @@
 #include <sound/soc.h>
 
 #include "loongson_i2s.h"
+#include "loongson_dma.h"
 
 #define LOONGSON_I2S_RX_DMA_OFFSET	21
 #define LOONGSON_I2S_TX_DMA_OFFSET	18
@@ -29,62 +30,6 @@
 #define LOONGSON_DMA3_CONF	0x3
 #define LOONGSON_DMA4_CONF	0x4
 
-/* periods_max = PAGE_SIZE / sizeof(struct ls_dma_chan_reg) */
-static const struct snd_pcm_hardware loongson_pcm_hardware = {
-	.info = SNDRV_PCM_INFO_MMAP |
-		SNDRV_PCM_INFO_INTERLEAVED |
-		SNDRV_PCM_INFO_MMAP_VALID |
-		SNDRV_PCM_INFO_RESUME |
-		SNDRV_PCM_INFO_PAUSE,
-	.formats = SNDRV_PCM_FMTBIT_S16_LE |
-		   SNDRV_PCM_FMTBIT_S20_3LE |
-		   SNDRV_PCM_FMTBIT_S24_LE,
-	.period_bytes_min = 128,
-	.period_bytes_max = 128 * 1024,
-	.periods_min = 1,
-	.periods_max = 64,
-	.buffer_bytes_max = 1024 * 1024,
-};
-
-static const struct snd_dmaengine_pcm_config loongson_dmaengine_pcm_config = {
-	.pcm_hardware = &loongson_pcm_hardware,
-	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
-	.prealloc_buffer_size = 128 * 1024,
-};
-
-static int loongson_pcm_open(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	if (substream->pcm->device & 1) {
-		runtime->hw.info &= ~SNDRV_PCM_INFO_INTERLEAVED;
-		runtime->hw.info |= SNDRV_PCM_INFO_NONINTERLEAVED;
-	}
-
-	if (substream->pcm->device & 2)
-		runtime->hw.info &= ~(SNDRV_PCM_INFO_MMAP |
-				      SNDRV_PCM_INFO_MMAP_VALID);
-	/*
-	 * For mysterious reasons (and despite what the manual says)
-	 * playback samples are lost if the DMA count is not a multiple
-	 * of the DMA burst size.  Let's add a rule to enforce that.
-	 */
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 128);
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
-	snd_pcm_hw_constraint_integer(substream->runtime,
-				      SNDRV_PCM_HW_PARAM_PERIODS);
-
-	return 0;
-}
-
-static const struct snd_soc_component_driver loongson_i2s_component_driver = {
-	.name   = LS_I2S_DRVNAME,
-	.open	= loongson_pcm_open,
-};
-
 static int loongson_i2s_apbdma_config(struct platform_device *pdev)
 {
 	int val;
@@ -147,7 +92,7 @@ static int loongson_i2s_plat_probe(struct platform_device *pdev)
 	dev_set_name(dev, LS_I2S_DRVNAME);
 	dev_set_drvdata(dev, i2s);
 
-	ret = devm_snd_soc_register_component(dev, &loongson_i2s_component_driver,
+	ret = devm_snd_soc_register_component(dev, &loongson_i2s_external_dma_component,
 					      &loongson_i2s_dai, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register DAI\n");
-- 
2.52.0

