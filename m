Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3F738F248
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825431; cv=none; b=V1yAamKfsgS1Od4JGWWOkUNPCQSf4OAMXk9bA+ENgCY29pXazVMBY6sWcdazT1Pbpex//zS/vav/naHvwBzuAOUcgAVaPwjRN1hmBNu0E6XO7XuCrtv2U3mwynbeGfMJq7GXusZ2LbihTvvjkChAtsRkld9P8z3K0E5aa4ge3YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825431; c=relaxed/simple;
	bh=cHFCaXo8+8GByNGEKJxQ6MKkosLVkLvThedqYMkb8Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrrpVLmtjQj7gGmiydNrVeTeWpvhQvjYVpr9mrUW/SepFN9ypIJTPfLhpIgldYg/w3RMq2K8qhv6dCRSMGGOBuRCpIpyrWUrSJQGGqrZJkZtmOBYzrdyVDudupG4tbSC6mfAPjgUew6NFzQ8sguSlWz5Nz1zUaDWJNTOXvM9p5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8AxQcCQbbpp90QcAA--.22635S3;
	Wed, 18 Mar 2026 17:17:04 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJBxKMF+bbppwqlXAA--.23316S4;
	Wed, 18 Mar 2026 17:16:59 +0800 (CST)
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
Subject: [PATCH 2/4] ASoC: loongson: Combined regmap definitions
Date: Wed, 18 Mar 2026 17:16:36 +0800
Message-ID: <f6768a2027f788697ed9f7bb161c8564261f02bb.1773821115.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJBxKMF+bbppwqlXAA--.23316S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGm6PqMDjgAAsC
X-Coremail-Antispam: 1Uk129KBj93XoW3GF13uw17XFWDWF1xKry3GFX_yoW7GFW7pr
	nxAa93WrW5Jr4ayanIyry8JFy5Cry3Cr93CF47Jw17Wr9rCw15uF4rtF15Aw43CryDGryI
	vry8GrW8Ga45G3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUoxR6UUUUU

For Loongson I2S, the difference between i2s_plat and i2s_pci is more in
the external interface, the internal registers are accessed in the same
way, so the regmap definitions can be united to simplify the code.

Also, the following warning for the i2s_plat driver will be eliminated:

loongson-i2s-plat loongson-i2s: using zero-initialized flat cache, this may cause unexpected behavior.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/loongson/loongson_i2s.c      | 55 ++++++++++++++++++++++++++
 sound/soc/loongson/loongson_i2s.h      |  1 +
 sound/soc/loongson/loongson_i2s_pci.c  | 54 -------------------------
 sound/soc/loongson/loongson_i2s_plat.c |  8 ----
 4 files changed, 56 insertions(+), 62 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index e336656e13eb..bd504cf41a29 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -272,5 +272,60 @@ const struct dev_pm_ops loongson_i2s_pm = {
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
+const struct regmap_config loongson_i2s_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= LS_I2S_CFG1,
+	.readable_reg	= loongson_i2s_rd_reg,
+	.writeable_reg	= loongson_i2s_wr_reg,
+	.volatile_reg	= loongson_i2s_volatile_reg,
+	.cache_type	= REGCACHE_FLAT,
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

