Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA40738CFE6
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825430; cv=none; b=Y35NP+Vo4zfyEfNnxVnVP46EaUK0tHBl2AKnjsvAuTBli+SVeCgVF9zCt2tGHDegvdkEXO09lrnXA+FKuZSiKxdXQmpqE9JOMLK/dsFHJkOrskzUPMbizyuezi5gvTRRvkn/ogjGTjYFygLm8nUPvaCMfJ5lcRM6AVEFSC5n3HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825430; c=relaxed/simple;
	bh=//U39v8SiSh5ancsyLM5KYVkd0RxC6CY8NVKZLv3ZYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHoPbgxRtpEdrA2Ux0GeJ2Ukesq8ii0C8e6cX8isWEbDrT/83oSGxsN8f7bE8Gfsz/W7mSaRbdJskpdj64eskVujySjDPPDqlrvvrsEAmZnVuul5mYzI7waL18x4g7zkkLt0aEWWwUaZY3kdPZSVtXS3F2zYIauYgzpKDBTzTbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8DxNMGSbbpp_0QcAA--.34456S3;
	Wed, 18 Mar 2026 17:17:06 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJBxKMF+bbppwqlXAA--.23316S5;
	Wed, 18 Mar 2026 17:17:05 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 3/4] ASoC: loongson: Use the `idma` identifier for internal DMA variables
Date: Wed, 18 Mar 2026 17:16:37 +0800
Message-ID: <41a98cd2d8e9de813b7b6eb9a921b93d8808892d.1773821115.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773821115.git.zhoubinbin@loongson.cn>
References: <cover.1773821115.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMF+bbppwqlXAA--.23316S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGm6PsMDlwAAs4
X-Coremail-Antispam: 1Uk129KBj93XoW3tFWkWryxKF47uw15Cr1DCFX_yoWkur17pF
	n3A39Ygr4YqF13ur98Ars5ur1ayryFkrZIga17Z34Skr9rtw1F9Fy8GF10vF4ak34UCrnF
	vrW0g3yrG3W3G3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r4j6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUoxR6UUUUU

The DMA controller used in Loongson I2S is divided into internal
exclusive DMA and external shared DMA (APBDMA). Add the `idma` dentifier
to internal DMA variable names to better distinguish them from external
shared DMA.

No functional change intended.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_dma.c     | 89 ++++++++++++++-------------
 sound/soc/loongson/loongson_dma.h     |  4 +-
 sound/soc/loongson/loongson_i2s.h     |  6 +-
 sound/soc/loongson/loongson_i2s_pci.c |  5 +-
 4 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index a149b643175c..3ebf59d60a71 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -14,9 +14,10 @@
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+
 #include "loongson_i2s.h"
 
-/* DMA dma_order Register */
+/* Internal DMA dma_order Register */
 #define DMA_ORDER_STOP          BIT(4) /* DMA stop */
 #define DMA_ORDER_START         BIT(3) /* DMA start */
 #define DMA_ORDER_ASK_VALID     BIT(2) /* DMA ask valid flag */
@@ -27,9 +28,9 @@
 #define DMA_ORDER_CTRL_MASK     (0x0fUL)  /* Control mask  */
 
 /*
- * DMA registers descriptor.
+ * Internal DMA registers descriptor.
  */
-struct loongson_dma_desc {
+struct loongson_idma_desc {
 	u32 order;		/* Next descriptor address register */
 	u32 saddr;		/* Source address register */
 	u32 daddr;		/* Device address register */
@@ -44,17 +45,17 @@ struct loongson_dma_desc {
 } __packed;
 
 struct loongson_runtime_data {
-	struct loongson_dma_data *dma_data;
+	struct loongson_idma_data *dma_data;
 
-	struct loongson_dma_desc *dma_desc_arr;
+	struct loongson_idma_desc *dma_desc_arr;
 	dma_addr_t dma_desc_arr_phy;
 	int dma_desc_arr_size;
 
-	struct loongson_dma_desc *dma_pos_desc;
+	struct loongson_idma_desc *dma_pos_desc;
 	dma_addr_t dma_pos_desc_phy;
 };
 
-static const struct snd_pcm_hardware ls_pcm_hardware = {
+static const struct snd_pcm_hardware loongson_idma_hardware = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_MMAP_VALID |
@@ -67,12 +68,11 @@ static const struct snd_pcm_hardware ls_pcm_hardware = {
 	.period_bytes_min = 128,
 	.period_bytes_max = 128 * 1024,
 	.periods_min = 1,
-	.periods_max = PAGE_SIZE / sizeof(struct loongson_dma_desc),
+	.periods_max = PAGE_SIZE / sizeof(struct loongson_idma_desc),
 	.buffer_bytes_max = 1024 * 1024,
 };
 
-static struct
-loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
+static struct loongson_idma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
 {
 	void __iomem *order_reg = prtd->dma_data->order_addr;
 	u64 val;
@@ -88,8 +88,8 @@ loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
 	return prtd->dma_pos_desc;
 }
 
-static int loongson_pcm_trigger(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream, int cmd)
+static int loongson_idma_pcm_trigger(struct snd_soc_component *component,
+				     struct snd_pcm_substream *substream, int cmd)
 {
 	struct loongson_runtime_data *prtd = substream->runtime->private_data;
 	struct device *dev = substream->pcm->card->dev;
@@ -131,9 +131,9 @@ static int loongson_pcm_trigger(struct snd_soc_component *component,
 	return 0;
 }
 
-static int loongson_pcm_hw_params(struct snd_soc_component *component,
-				  struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *params)
+static int loongson_idma_pcm_hw_params(struct snd_soc_component *component,
+				       struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct device *dev = substream->pcm->card->dev;
@@ -141,7 +141,7 @@ static int loongson_pcm_hw_params(struct snd_soc_component *component,
 	size_t buf_len = params_buffer_bytes(params);
 	size_t period_len = params_period_bytes(params);
 	dma_addr_t order_addr, mem_addr;
-	struct loongson_dma_desc *desc;
+	struct loongson_idma_desc *desc;
 	u32 num_periods;
 	int i;
 
@@ -195,12 +195,12 @@ static int loongson_pcm_hw_params(struct snd_soc_component *component,
 }
 
 static snd_pcm_uframes_t
-loongson_pcm_pointer(struct snd_soc_component *component,
-		     struct snd_pcm_substream *substream)
+loongson_idma_pcm_pointer(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct loongson_runtime_data *prtd = runtime->private_data;
-	struct loongson_dma_desc *desc;
+	struct loongson_idma_desc *desc;
 	snd_pcm_uframes_t x;
 	u64 addr;
 
@@ -213,7 +213,7 @@ loongson_pcm_pointer(struct snd_soc_component *component,
 	return x;
 }
 
-static irqreturn_t loongson_pcm_dma_irq(int irq, void *devid)
+static irqreturn_t loongson_idma_pcm_dma_irq(int irq, void *devid)
 {
 	struct snd_pcm_substream *substream = devid;
 
@@ -221,14 +221,14 @@ static irqreturn_t loongson_pcm_dma_irq(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static int loongson_pcm_open(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream)
+static int loongson_idma_pcm_open(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_card *card = substream->pcm->card;
 	struct loongson_runtime_data *prtd;
-	struct loongson_dma_data *dma_data;
+	struct loongson_idma_data *dma_data;
 
 	/*
 	 * For mysterious reasons (and despite what the manual says)
@@ -241,7 +241,7 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
-	snd_soc_set_runtime_hwparams(substream, &ls_pcm_hardware);
+	snd_soc_set_runtime_hwparams(substream, &loongson_idma_hardware);
 
 	prtd = kzalloc_obj(*prtd);
 	if (!prtd)
@@ -277,8 +277,8 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 	return -ENOMEM;
 }
 
-static int loongson_pcm_close(struct snd_soc_component *component,
-			      struct snd_pcm_substream *substream)
+static int loongson_idma_pcm_close(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
 {
 	struct snd_card *card = substream->pcm->card;
 	struct loongson_runtime_data *prtd = substream->runtime->private_data;
@@ -293,21 +293,21 @@ static int loongson_pcm_close(struct snd_soc_component *component,
 	return 0;
 }
 
-static int loongson_pcm_mmap(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream,
-			     struct vm_area_struct *vma)
+static int loongson_idma_pcm_mmap(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream,
+				  struct vm_area_struct *vma)
 {
 	return remap_pfn_range(vma, vma->vm_start,
-			substream->dma_buffer.addr >> PAGE_SHIFT,
-			vma->vm_end - vma->vm_start, vma->vm_page_prot);
+			       substream->dma_buffer.addr >> PAGE_SHIFT,
+			       vma->vm_end - vma->vm_start, vma->vm_page_prot);
 }
 
-static int loongson_pcm_new(struct snd_soc_component *component,
-			    struct snd_soc_pcm_runtime *rtd)
+static int loongson_idma_pcm_new(struct snd_soc_component *component,
+				 struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm_substream *substream;
-	struct loongson_dma_data *dma_data;
+	struct loongson_idma_data *dma_data;
 	unsigned int i;
 	int ret;
 
@@ -319,7 +319,7 @@ static int loongson_pcm_new(struct snd_soc_component *component,
 		dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0),
 						    substream);
 		ret = devm_request_irq(card->dev, dma_data->irq,
-				       loongson_pcm_dma_irq,
+				       loongson_idma_pcm_dma_irq,
 				       IRQF_TRIGGER_HIGH, LS_I2S_DRVNAME,
 				       substream);
 		if (ret < 0) {
@@ -330,16 +330,17 @@ static int loongson_pcm_new(struct snd_soc_component *component,
 
 	return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
 					    card->dev,
-					    ls_pcm_hardware.buffer_bytes_max);
+					    loongson_idma_hardware.buffer_bytes_max);
 }
 
-const struct snd_soc_component_driver loongson_i2s_component = {
+/* Internal DMA component */
+const struct snd_soc_component_driver loongson_i2s_idma_component = {
 	.name		= LS_I2S_DRVNAME,
-	.open		= loongson_pcm_open,
-	.close		= loongson_pcm_close,
-	.hw_params	= loongson_pcm_hw_params,
-	.trigger	= loongson_pcm_trigger,
-	.pointer	= loongson_pcm_pointer,
-	.mmap		= loongson_pcm_mmap,
-	.pcm_new	= loongson_pcm_new,
+	.open		= loongson_idma_pcm_open,
+	.close		= loongson_idma_pcm_close,
+	.hw_params	= loongson_idma_pcm_hw_params,
+	.trigger	= loongson_idma_pcm_trigger,
+	.pointer	= loongson_idma_pcm_pointer,
+	.mmap		= loongson_idma_pcm_mmap,
+	.pcm_new	= loongson_idma_pcm_new,
 };
diff --git a/sound/soc/loongson/loongson_dma.h b/sound/soc/loongson/loongson_dma.h
index 073ee8c0c046..8a8fa8abd85a 100644
--- a/sound/soc/loongson/loongson_dma.h
+++ b/sound/soc/loongson/loongson_dma.h
@@ -9,8 +9,6 @@
 #ifndef _LOONGSON_DMA_H
 #define _LOONGSON_DMA_H
 
-#include <sound/soc.h>
-
-extern const struct snd_soc_component_driver loongson_i2s_component;
+extern const struct snd_soc_component_driver loongson_i2s_idma_component;
 
 #endif
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index e73ffa954ec9..8b4603c876c5 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -42,7 +42,7 @@
 
 #define LS_I2S_DRVNAME		"loongson-i2s"
 
-struct loongson_dma_data {
+struct loongson_idma_data {
 	dma_addr_t dev_addr;		/* device physical address for DMA */
 	void __iomem *order_addr;	/* DMA order register */
 	int irq;			/* DMA irq */
@@ -52,11 +52,11 @@ struct loongson_i2s {
 	struct device *dev;
 	union {
 		struct snd_dmaengine_dai_dma_data playback_dma_data;
-		struct loongson_dma_data tx_dma_data;
+		struct loongson_idma_data tx_dma_data;
 	};
 	union {
 		struct snd_dmaengine_dai_dma_data capture_dma_data;
-		struct loongson_dma_data rx_dma_data;
+		struct loongson_idma_data rx_dma_data;
 	};
 	struct regmap *regmap;
 	void __iomem *reg_base;
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index dea1e4ebee29..f5b560465706 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -13,6 +13,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <sound/soc.h>
+
 #include "loongson_i2s.h"
 #include "loongson_dma.h"
 
@@ -22,7 +23,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 				  const struct pci_device_id *pid)
 {
 	const struct fwnode_handle *fwnode = pdev->dev.fwnode;
-	struct loongson_dma_data *tx_data, *rx_data;
+	struct loongson_idma_data *tx_data, *rx_data;
 	struct device *dev = &pdev->dev;
 	struct loongson_i2s *i2s;
 	int ret;
@@ -79,7 +80,7 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 		udelay(200);
 	}
 
-	ret = devm_snd_soc_register_component(dev, &loongson_i2s_component,
+	ret = devm_snd_soc_register_component(dev, &loongson_i2s_idma_component,
 					      &loongson_i2s_dai, 1);
 	if (ret)
 		return dev_err_probe(dev, ret, "register DAI failed\n");
-- 
2.52.0

