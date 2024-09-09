Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C361AE050
	for <loongarch@lists.linux.dev>; Mon,  9 Sep 2024 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866395; cv=none; b=pM9H3d04wpLYcWK01Y76E4D7kSeSJgmIUJCg4xj4oRHo1GR1KNVmsWJC2tvz0YLw+EOriMRzxtNg/uOmg7uzVCPt1Z0nzPFNWeCk0jfvqYC9a7IHfLY0UY75hvueVujom/YYi1V5WQtyWisWnbgxqkbFd2f4cf11XOaGHSH5ZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866395; c=relaxed/simple;
	bh=iZ0f0XnWDazREs9NOwhn8jGxiZOjDi5eh+OSniQcX5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASXiyWs7kLfLYNocyVoGU+zS1yuv+YVBg1ap9IHV5zGjYKDTN/qfNSyLtEts16gvVk2at9z/m+Mz1i1EI+07K7ZbTH/mVMTjp+BWF8MdZGfgMvL61Plxo8EIL1EMY+p1p70CGrRtXUHnjxU4uhWwnTGDQpSKPqpqBdbV8OYDn0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.147])
	by gateway (Coremail) with SMTP id _____8CxheiXod5meJkCAA--.5038S3;
	Mon, 09 Sep 2024 15:19:51 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.147])
	by front1 (Coremail) with SMTP id qMiowMAxQNaQod5msioCAA--.7431S5;
	Mon, 09 Sep 2024 15:19:50 +0800 (CST)
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
Subject: [PATCH v1 7/8] ASoC: loongson: Factor out loongson_card_acpi_find_device() function
Date: Mon,  9 Sep 2024 15:19:37 +0800
Message-ID: <3b7da05e5fd4326e7944aa749bf06dd44e964f6c.1725844530.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMAxQNaQod5msioCAA--.7431S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF15Zw48AF1DJr48Cr4Utrc_yoW5uF1xpF
	4aya909r98tF1SkrnYqrW5Crya93yxuw47JayxGwn7K3s3Z345X34I9F1UZrWFy34DAa1U
	ZrW3Kay8Ka4DJrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBlb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0aLvJUUUUU==

The operations for reading the cpu and codec nodes in
loongson_card_parse_acpi() are similar, so we convert them into a simple
helper function called loongson_card_acpi_find_device().

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_card.c | 55 +++++++++++++++++-------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 4033cd7f09f6..e55ad52ff43b 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -68,46 +68,53 @@ static struct snd_soc_dai_link loongson_dai_links[] = {
 	},
 };
 
-static int loongson_card_parse_acpi(struct loongson_card_data *data)
+static struct acpi_device *loongson_card_acpi_find_device(struct snd_soc_card *card,
+							  const char *name)
 {
-	struct snd_soc_card *card = &data->snd_card;
 	struct fwnode_handle *fwnode = card->dev->fwnode;
 	struct fwnode_reference_args args;
+	int status;
+
+	memset(&args, 0, sizeof(args));
+	status = acpi_node_get_property_reference(fwnode, name, 0, &args);
+	if (status || !is_acpi_device_node(args.fwnode)) {
+		dev_err(card->dev, "No matching phy in ACPI table\n");
+		return NULL;
+	}
+
+	return to_acpi_device_node(args.fwnode);
+}
+
+static int loongson_card_parse_acpi(struct loongson_card_data *data)
+{
+	struct snd_soc_card *card = &data->snd_card;
 	const char *codec_dai_name;
 	struct acpi_device *adev;
 	struct device *phy_dev;
-	int ret, i;
+	int i;
 
 	/* fixup platform name based on reference node */
-	memset(&args, 0, sizeof(args));
-	ret = acpi_node_get_property_reference(fwnode, "cpu", 0, &args);
-	if (ret || !is_acpi_device_node(args.fwnode)) {
-		dev_err(card->dev, "No matching phy in ACPI table\n");
-		return ret ?: -ENOENT;
-	}
-	adev = to_acpi_device_node(args.fwnode);
+	adev = loongson_card_acpi_find_device(card, "cpu");
+	if (!adev)
+		return -ENOENT;
+
 	phy_dev = acpi_get_first_physical_node(adev);
 	if (!phy_dev)
 		return -EPROBE_DEFER;
-	for (i = 0; i < card->num_links; i++)
-		loongson_dai_links[i].platforms->name = dev_name(phy_dev);
 
 	/* fixup codec name based on reference node */
-	memset(&args, 0, sizeof(args));
-	ret = acpi_node_get_property_reference(fwnode, "codec", 0, &args);
-	if (ret || !is_acpi_device_node(args.fwnode)) {
-		dev_err(card->dev, "No matching phy in ACPI table\n");
-		return ret ?: -ENOENT;
-	}
-	adev = to_acpi_device_node(args.fwnode);
+	adev = loongson_card_acpi_find_device(card, "codec");
+	if (!adev)
+		return -ENOENT;
 	snprintf(codec_name, sizeof(codec_name), "i2c-%s", acpi_dev_name(adev));
-	for (i = 0; i < card->num_links; i++)
-		loongson_dai_links[i].codecs->name = codec_name;
 
-	device_property_read_string(card->dev, "codec-dai-name",
-				    &codec_dai_name);
-	for (i = 0; i < card->num_links; i++)
+	device_property_read_string(card->dev, "codec-dai-name", &codec_dai_name);
+
+	for (i = 0; i < card->num_links; i++) {
+		loongson_dai_links[i].platforms->name = dev_name(phy_dev);
+		loongson_dai_links[i].codecs->name = codec_name;
 		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
+	}
 
 	return 0;
 }
-- 
2.43.5

