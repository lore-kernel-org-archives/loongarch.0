Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C659419341F
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 07:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725519795; cv=none; b=LxV1xNJzR/jxyV6MNdKJpNoU8VvcTHXPzybpBTqiKFIBEMhVm5AsHvWSJlWezXW8QytdmAY395BBUsa+WnxqaTizbRBwzeqZ/JP9wOjJZd5pkV5xymTQu3V7SHEEMaBlWKQ/bn+ocodj4jExoxGov6hcVCyMi/kD1JoVtNOclzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725519795; c=relaxed/simple;
	bh=QcX2O7XnndxNWIhO8kVlxa928zU/85PG+bWjbsYou3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUmEyWHwYUIjvz23+KSgDMOY5izzHDrkz7YcdeIuplhZ8QcR/f+GuzMVIN4qsNh0o+jL2Hp7g6QxHxan2wVCMwWwMcnBgxCrp5fDU0WUv/jaUdFuj5UdLLiqN7HwHhZLsmq80PFbpy/g29L67018RaLuTmZ/T+5+jyplBKNKxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.71])
	by gateway (Coremail) with SMTP id _____8Dx+5qwV9lmDBorAA--.46678S3;
	Thu, 05 Sep 2024 15:03:12 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.71])
	by front1 (Coremail) with SMTP id qMiowMBxbNyhV9lmDcMEAA--.21040S4;
	Thu, 05 Sep 2024 15:03:09 +0800 (CST)
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
Subject: [PATCH v1 06/10] ASoC: loongson: Fix codec detection failure on FDT systems
Date: Thu,  5 Sep 2024 15:02:55 +0800
Message-ID: <f9111564acc6c9ac011318a7eb3c6843ea0529ce.1725518229.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMBxbNyhV9lmDcMEAA--.21040S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr17GFyUXw1kZw1UJF15Jrc_yoW5KF4Upr
	45uayYkryrJr1xuwnYqrW8Aa4akry8WrsrJay7K3WSk3Z3Z3s8Ww1j9F1UZF4ayFyUA34U
	XFW8Ka97Ka4UJFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jxKsUUUUUU=

When the Codec is compiled into a module, we can't use
snd_soc_of_get_dlc() to get the codec dai_name, use
snd_soc_get_dai_name() instead.

Also, for the cpu dailink, its dai_name is already defined as
"loongson-i2s", so just get the corresponding of_node attribute here.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 89 +++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 26 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index a25287efdd5c..d45a3e77cb90 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -119,44 +119,81 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 	return 0;
 }
 
-static int loongson_card_parse_of(struct loongson_card_data *data)
+static int loongson_parse_cpu(struct device *dev, struct device_node **dai_node)
 {
-	struct snd_soc_card *card = &data->snd_card;
-	struct device_node *cpu, *codec;
-	struct device *dev = card->dev;
-	int ret, i;
+	struct device_node *cpu;
+	int ret = 0;
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
-	if (!cpu) {
-		dev_err(dev, "platform property missing or invalid\n");
+	if (!cpu)
 		return -EINVAL;
-	}
+
+	*dai_node = of_parse_phandle(cpu, "sound-dai", 0);
+	if (!*dai_node)
+		ret = -EINVAL;
+
+	of_node_put(cpu);
+	return ret;
+}
+
+static int loongson_parse_codec(struct device *dev, struct device_node **dai_node,
+				const char **dai_name)
+{
+	struct of_phandle_args args;
+	struct device_node *codec;
+	int ret = 0;
 
 	codec = of_get_child_by_name(dev->of_node, "codec");
-	if (!codec) {
-		dev_err(dev, "audio-codec property missing or invalid\n");
+	if (!codec)
+		return -EINVAL;
+
+	ret = of_parse_phandle_with_args(codec, "sound-dai", "#sound-dai-cells", 0, &args);
+	if (ret)
+		goto free_codec;
+
+	ret = snd_soc_get_dai_name(&args, dai_name);
+	if (ret)
+		goto free_codec;
+
+	*dai_node = of_parse_phandle(codec, "sound-dai", 0);
+	if (!*dai_node)
 		ret = -EINVAL;
-		goto free_cpu;
+
+free_codec:
+	of_node_put(codec);
+	return ret;
+}
+
+static int loongson_card_parse_of(struct loongson_card_data *data)
+{
+	struct device_node *codec_dai_node, *cpu_dai_node;
+	struct snd_soc_card *card = &data->snd_card;
+	struct device *dev = card->dev;
+	const char *codec_dai_name;
+	int ret = 0, i;
+
+	ret = loongson_parse_cpu(dev, &cpu_dai_node);
+	if (ret) {
+		dev_err(dev, "cpu property missing or invalid.\n");
+		goto out;
+	}
+
+	ret = loongson_parse_codec(dev, &codec_dai_node, &codec_dai_name);
+	if (ret) {
+		dev_err(dev, "audio-codec property missing or invalid.\n");
+		goto out;
 	}
 
 	for (i = 0; i < card->num_links; i++) {
-		ret = snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[i].cpus, 0);
-		if (ret) {
-			dev_err(dev, "getting cpu dlc error (%d)\n", ret);
-			goto free_codec;
-		}
-
-		ret = snd_soc_of_get_dlc(codec, NULL, loongson_dai_links[i].codecs, 0);
-		if (ret) {
-			dev_err(dev, "getting codec dlc error (%d)\n", ret);
-			goto free_codec;
-		}
+		loongson_dai_links[i].platforms->of_node = cpu_dai_node;
+		loongson_dai_links[i].cpus->of_node = cpu_dai_node;
+		loongson_dai_links[i].codecs->of_node = codec_dai_node;
+		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
 	}
 
-free_codec:
-	of_node_put(codec);
-free_cpu:
-	of_node_put(cpu);
+out:
+	of_node_put(codec_dai_node);
+	of_node_put(cpu_dai_node);
 	return ret;
 }
 
-- 
2.43.5

