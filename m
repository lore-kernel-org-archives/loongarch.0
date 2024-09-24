Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050D747F69
	for <loongarch@lists.linux.dev>; Tue, 24 Sep 2024 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727161245; cv=none; b=Wi9qzBMn4FdqXyVXgEiiBp3Ze7fhCvY/aipEZkk43jklflWq7FFXqMf7N2dcvLB8hdzVwdXwmCTroZJ08E8NX6E0/RGs2XD3dEUnx55r/CcOgDg5CGyOPbb/+biQG38p2kp2Q+DVzVZzDs+1nSXi641SHTN7dWYFz3yguWuhJeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727161245; c=relaxed/simple;
	bh=6szpx7WIBp+NTw/J0Udr471Do2nvuHh2tO3manZxiv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ykxkz4EPrE3Vf9OLG4chmRD2CyaJlGjy6/+lAxy9YwEIMCts5N8P0PSt+Sx1T7uFt+BkHKfZvoBsa2UnhasvFd6Qt6VWfZzVIqbAogfZeyk0p2+SEI/Rtut0mHb4kFERGIrUM4vpHh7J6eefl0XySwH9wyAltFvtzH5T9XVxFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8AxKOmaY_Jm_sQNAA--.30757S3;
	Tue, 24 Sep 2024 15:00:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMBxn+SRY_Jm0KQNAA--.11471S3;
	Tue, 24 Sep 2024 15:00:41 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuming Fan <shumingf@realtek.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 5/9] ASoC: loongson: Fix codec detection failure on FDT systems
Date: Tue, 24 Sep 2024 15:00:32 +0800
Message-ID: <9a286537a20f0f96597090f59165b4532e41bdb8.1727056789.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1727056789.git.zhoubinbin@loongson.cn>
References: <cover.1727056789.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxn+SRY_Jm0KQNAA--.11471S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr17GF4rtw4UXw1UuF48GrX_yoW5uFW5p3
	ZxC3yYkrWrJr1xuwnYqrWUAFyakry8W39rJay7K3WIkr9xA3s8uw18WF1UZF4akFy8G34U
	XFWrKa92ka4UJFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU4BT5DUUUU

When the Codec is compiled into a module, we can't use
snd_soc_of_get_dlc() to get the codec dai_name, use
snd_soc_get_dai_name() instead.

Also, for the cpu dailink, its dai_name is already defined as
"loongson-i2s", so just get the corresponding of_node attribute here.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 81 ++++++++++++++++++++----------
 1 file changed, 55 insertions(+), 26 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 7379f24d385c..b07b8652d95b 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -119,48 +119,77 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 	return 0;
 }
 
-static int loongson_card_parse_of(struct loongson_card_data *data)
+static int loongson_parse_cpu(struct snd_soc_card *card)
 {
-	struct device_node *cpu, *codec;
-	struct snd_soc_card *card = &data->snd_card;
+	struct device_node *dai_node = NULL, *cpu = NULL;
 	struct device *dev = card->dev;
-	int ret, i;
+	int i;
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
-	if (!cpu) {
-		dev_err(dev, "platform property missing or invalid\n");
+	if (!cpu)
 		return -EINVAL;
+
+	dai_node = of_parse_phandle(cpu, "sound-dai", 0);
+	of_node_put(cpu);
+	if (!dai_node)
+		return -EINVAL;
+
+	for (i = 0; i < card->num_links; i++) {
+		loongson_dai_links[i].platforms->of_node = dai_node;
+		loongson_dai_links[i].cpus->of_node = dai_node;
 	}
+
+	of_node_put(dai_node);
+	return 0;
+}
+
+static int loongson_parse_codec(struct snd_soc_card *card)
+{
+	struct device_node *codec = NULL, *dai_node = NULL;
+	struct device *dev = card->dev;
+	struct of_phandle_args args;
+	const char *dai_name;
+	int ret = 0, i;
+
 	codec = of_get_child_by_name(dev->of_node, "codec");
-	if (!codec) {
-		dev_err(dev, "audio-codec property missing or invalid\n");
-		of_node_put(cpu);
+	if (!codec)
 		return -EINVAL;
+
+	ret = of_parse_phandle_with_args(codec, "sound-dai", "#sound-dai-cells", 0, &args);
+	if (ret)
+		goto codec_put;
+
+	ret = snd_soc_get_dai_name(&args, &dai_name);
+	of_node_put(args.np);
+	if (ret)
+		goto codec_put;
+
+	dai_node = of_parse_phandle(codec, "sound-dai", 0);
+	if (!dai_node) {
+		ret = -EINVAL;
+		goto codec_put;
 	}
 
 	for (i = 0; i < card->num_links; i++) {
-		ret = snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[i].cpus, 0);
-		if (ret < 0) {
-			dev_err(dev, "getting cpu dlc error (%d)\n", ret);
-			goto err;
-		}
-
-		ret = snd_soc_of_get_dlc(codec, NULL, loongson_dai_links[i].codecs, 0);
-		if (ret < 0) {
-			dev_err(dev, "getting codec dlc error (%d)\n", ret);
-			goto err;
-		}
+		loongson_dai_links[i].codecs->of_node = dai_node;
+		loongson_dai_links[i].codecs->dai_name = dai_name;
 	}
 
-	of_node_put(cpu);
+codec_put:
 	of_node_put(codec);
+	return ret;
+}
 
-	return 0;
+static int loongson_card_parse_of(struct loongson_card_data *data)
+{
+	struct snd_soc_card *card = &data->snd_card;
+	int ret;
 
-err:
-	of_node_put(cpu);
-	of_node_put(codec);
-	return ret;
+	ret = loongson_parse_cpu(card);
+	if (ret)
+		return ret;
+
+	return loongson_parse_codec(card);
 }
 
 static int loongson_asoc_card_probe(struct platform_device *pdev)
-- 
2.43.5

