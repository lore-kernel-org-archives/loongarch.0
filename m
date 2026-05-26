Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ED72DECBA
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796585; cv=none; b=AqyWaI1lmMvPhaOQSzoPe1+ebMKVUyz8WvtWcevnPbqRY5cApIZ82V799fMlEm2Tk+e7d+ExK8g9gVG3cC4CAwR1uMdou+Z0Aml7FJ+Kkzwvbqq1fTYLNnKcQewiLDRsHcIAOQN6tgr0uJ63iN5x5w+MZRIsw0EfqXL/aqefdF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796585; c=relaxed/simple;
	bh=W6XFj8rwAv9tKzD94HdLIZr0D5x3g/T4/Xljmq6hc8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtlHeHB/IxEgUiapSZL/ytgrXVMWQpRROs7cr5hxS3JjDW+Wg/e1jodNuBrK8wUlKndz7CkwRl7bJCE0C6jWdAnUmCKRwJef/LO+gLNH1pPZ3sgkpxRT/MoPsldFRSjtPLeFZQCHlHORO7/jdHuaiZk+YVh0YZUJPNUUazXL9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8AxX+tgihVqn2MNAA--.38174S3;
	Tue, 26 May 2026 19:56:16 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGOBYihVq04+RAA--.13379S4;
	Tue, 26 May 2026 19:56:15 +0800 (CST)
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
Subject: [PATCH v2 2/5] ASoC: loongson: Combined regmap definitions
Date: Tue, 26 May 2026 19:56:00 +0800
Message-ID: <6fd63cc57c112218ae0873b73d8c3a4b24304b80.1779796354.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1779796354.git.zhoubinbin@loongson.cn>
References: <cover.1779796354.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOBYihVq04+RAA--.13379S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQETCGoVNlwIvQAAs7
X-Coremail-Antispam: 1Uk129KBj93XoWxtr48tF48JF13Xw4rGw1xJFc_yoW7Kr45pr
	nxAa97WrW5Jr4ay3ZIyrW8JFy5Cry3Cr93CF47Jw17W3srCw18uF15tF15Aa13uryDGFyI
	vry8GrW8Ga4UGabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

Previously, the regmap configuration for Loongson I2S controller was
duplicated in both PCI and platform glue drivers. Move the common
regmap configuration into the shared loongson_i2s.c to avoid code
duplication and centralize register access handling.

While moving, adjust the following:
- Mark only RX_DATA and TX_DATA as volatile registers. The PCI version
  incorrectly marked CFG/CTRL/CFG1 as volatile, which prevented proper
  regcache synchronization.
- Change cache type from REGCACHE_FLAT to REGCACHE_MAPLE. The register
  map is sparse and the number of registers is small; MAPLE tree provides
  better scalability and is the recommended cache type for modern
  regmap users.

Also, the following warning for the i2s_plat driver will be eliminated:

loongson-i2s-plat loongson-i2s: using zero-initialized flat cache, this may cause unexpected behavior.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_i2s.c      | 55 +++++++++++++++++++++++++-
 sound/soc/loongson/loongson_i2s.h      |  1 +
 sound/soc/loongson/loongson_i2s_pci.c  | 54 -------------------------
 sound/soc/loongson/loongson_i2s_plat.c |  8 ----
 4 files changed, 55 insertions(+), 63 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index e336656e13eb..56bb6a85e58b 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -254,6 +254,7 @@ static int i2s_suspend(struct device *dev)
 	struct loongson_i2s *i2s = dev_get_drvdata(dev);
 
 	regcache_cache_only(i2s->regmap, true);
+	regcache_mark_dirty(i2s->regmap);
 
 	return 0;
 }
@@ -263,7 +264,7 @@ static int i2s_resume(struct device *dev)
 	struct loongson_i2s *i2s = dev_get_drvdata(dev);
 
 	regcache_cache_only(i2s->regmap, false);
-	regcache_mark_dirty(i2s->regmap);
+
 	return regcache_sync(i2s->regmap);
 }
 
@@ -272,5 +273,57 @@ const struct dev_pm_ops loongson_i2s_pm = {
 };
 EXPORT_SYMBOL_GPL(loongson_i2s_pm);
 
+static bool loongson_i2s_rd_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LS_I2S_VER:
+	case LS_I2S_CFG:
+	case LS_I2S_CTRL:
+	case LS_I2S_RX_DATA:
+	case LS_I2S_TX_DATA:
+	case LS_I2S_CFG1:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LS_I2S_CFG:
+	case LS_I2S_CTRL:
+	case LS_I2S_RX_DATA:
+	case LS_I2S_TX_DATA:
+	case LS_I2S_CFG1:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LS_I2S_RX_DATA:
+	case LS_I2S_TX_DATA:
+		return true;
+	default:
+		return false;
+	};
+}
+
+const struct regmap_config loongson_i2s_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = LS_I2S_CFG1,
+	.readable_reg = loongson_i2s_rd_reg,
+	.writeable_reg = loongson_i2s_wr_reg,
+	.volatile_reg = loongson_i2s_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+EXPORT_SYMBOL_GPL(loongson_i2s_regmap_config);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Common functions for loongson I2S controller driver");
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index c8052a762c1b..e73ffa954ec9 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -65,6 +65,7 @@ struct loongson_i2s {
 	u32 sysclk;
 };
 
+extern const struct regmap_config loongson_i2s_regmap_config;
 extern const struct dev_pm_ops loongson_i2s_pm;
 extern struct snd_soc_dai_driver loongson_i2s_dai;
 
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index 1ea5501a97f8..dea1e4ebee29 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -18,60 +18,6 @@
 
 #define DRIVER_NAME "loongson-i2s-pci"
 
-static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case LS_I2S_CFG:
-	case LS_I2S_CTRL:
-	case LS_I2S_RX_DATA:
-	case LS_I2S_TX_DATA:
-	case LS_I2S_CFG1:
-		return true;
-	default:
-		return false;
-	};
-}
-
-static bool loongson_i2s_rd_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case LS_I2S_VER:
-	case LS_I2S_CFG:
-	case LS_I2S_CTRL:
-	case LS_I2S_RX_DATA:
-	case LS_I2S_TX_DATA:
-	case LS_I2S_CFG1:
-		return true;
-	default:
-		return false;
-	};
-}
-
-static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case LS_I2S_CFG:
-	case LS_I2S_CTRL:
-	case LS_I2S_RX_DATA:
-	case LS_I2S_TX_DATA:
-	case LS_I2S_CFG1:
-		return true;
-	default:
-		return false;
-	};
-}
-
-static const struct regmap_config loongson_i2s_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = LS_I2S_CFG1,
-	.writeable_reg = loongson_i2s_wr_reg,
-	.readable_reg = loongson_i2s_rd_reg,
-	.volatile_reg = loongson_i2s_volatile_reg,
-	.cache_type = REGCACHE_FLAT,
-};
-
 static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 				  const struct pci_device_id *pid)
 {
diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongson/loongson_i2s_plat.c
index fa2e450ff618..f8d7aca8b903 100644
--- a/sound/soc/loongson/loongson_i2s_plat.c
+++ b/sound/soc/loongson/loongson_i2s_plat.c
@@ -85,14 +85,6 @@ static const struct snd_soc_component_driver loongson_i2s_component_driver = {
 	.open	= loongson_pcm_open,
 };
 
-static const struct regmap_config loongson_i2s_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x14,
-	.cache_type = REGCACHE_FLAT,
-};
-
 static int loongson_i2s_apbdma_config(struct platform_device *pdev)
 {
 	int val;
-- 
2.52.0

