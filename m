Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7E41AE050
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866393; cv=none; b=pppRh49lGTH8fXGJ4Te5vWtx7jaCwCWxjsskkPFfiAiKLlfcQL1irnpKapxeUIq8SOfueTe68lwgn20rR352B2z0ICSlVMMQxF++L5emsAhrRFwEB3WFZCjfrJ0aFVLkKXolZXLheSv74/8mnEEcqJ389DhVbNRD4WJG9znbIYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866393; c=relaxed/simple;
	bh=tQ9tI8fbsDBpMF4xv2L9qGPzuBFkN6oh6addtpmGrjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SnK55DD/HW8OPw+IHqzXwE7owf6oiP5Aefj6MlSmIKC/IlxV6UiYjHbUam8/AYv5cmB5OCxuLDzKVpZ2yP/C5j3CbXZ9RevCkaQujLh6yGx0pVDDnAmZG4LwIkuVINPziKio7epLRldVZHg44+ckZO3PBhK55xHqz1NVlT6bcaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.147])
	by gateway (Coremail) with SMTP id _____8BxtuiVod5mYJkCAA--.5025S3;
	Mon, 09 Sep 2024 15:19:49 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.147])
	by front1 (Coremail) with SMTP id qMiowMAxQNaQod5msioCAA--.7431S3;
	Mon, 09 Sep 2024 15:19:47 +0800 (CST)
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
Subject: [PATCH v1 5/8] ASoC: loongson: Simplify of_node_put() reference
Date: Mon,  9 Sep 2024 15:19:35 +0800
Message-ID: <56a7aed94441f09ab28bb55a3e3955ce1da8f0f7.1725844530.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMAxQNaQod5msioCAA--.7431S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJrW3Gry3tryrKw43WryfAFc_yoW8Cr48pF
	sxA39I9rWUJr1xurn5trW8Xa4ak34rWFsrWa17K3Wvkr9IyF1DWr17GF18ZFWakFy8t34D
	Zry8Kay0ga48GabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVeHDUUUUU=

There are multiple references to of_node_put() in
loongson_card_parse_of(). We can merge them into one place to improve
code readability.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 3dd82caaae3b..4033cd7f09f6 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -114,45 +114,42 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 
 static int loongson_card_parse_of(struct loongson_card_data *data)
 {
-	struct device_node *cpu, *codec;
 	struct snd_soc_card *card = &data->snd_card;
+	struct device_node *cpu, *codec;
 	struct device *dev = card->dev;
-	int ret, i;
+	int ret = 0, i;
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
 	if (!cpu) {
 		dev_err(dev, "platform property missing or invalid\n");
 		return -EINVAL;
 	}
+
 	codec = of_get_child_by_name(dev->of_node, "codec");
 	if (!codec) {
 		dev_err(dev, "audio-codec property missing or invalid\n");
-		of_node_put(cpu);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto cpu_put;
 	}
 
 	for (i = 0; i < card->num_links; i++) {
 		ret = snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[i].cpus, 0);
 		if (ret < 0) {
 			dev_err(dev, "getting cpu dlc error (%d)\n", ret);
-			goto err;
+			goto codec_put;
 		}
 
 		ret = snd_soc_of_get_dlc(codec, NULL, loongson_dai_links[i].codecs, 0);
 		if (ret < 0) {
 			dev_err(dev, "getting codec dlc error (%d)\n", ret);
-			goto err;
+			goto codec_put;
 		}
 	}
 
-	of_node_put(cpu);
+codec_put:
 	of_node_put(codec);
-
-	return 0;
-
-err:
+cpu_put:
 	of_node_put(cpu);
-	of_node_put(codec);
 	return ret;
 }
 
-- 
2.43.5

