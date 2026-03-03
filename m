Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADA3480350
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537278; cv=none; b=aiQvFTlRQpU81MwhHfJUtNyoXkREm8dcFA32JnLxoqePwJse4GDUMZy0dJSHRvnagxxzvI+4gUowxVWMj1PW11lStHU7WRp177TDhSt6wj5j57QBaS0m4UMiGR84tcFODFazgpCwpzYUK82QKBSe5hxYTtqI3OkgcvAMekuEXvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537278; c=relaxed/simple;
	bh=kL4tlGbtwiu/jMCxEvjcPEd63SqyIdSUBrMtTgoSenQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwLg4zcN7vmoBCOoHk63PTepyuq0A5bV53OnYfZCdEp5OqsXaX1sGJ4fZ6bqHs9q6JcCiAHglm/M4aiedgxt/a3L1OfhIZV57woyurGI5ewuYVvtr5uqAcrM+DEt3zUrRdqKD1HqCBhA/oHT+LENmpnaZB6C8S2m74vPAzxQaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8BxksC4xaZpTQEXAA--.9964S3;
	Tue, 03 Mar 2026 19:27:52 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJAxHMKzxaZpM59NAA--.14456S4;
	Tue, 03 Mar 2026 19:27:51 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/3] mmc: loongson2: Gathering all SoCs private data together
Date: Tue,  3 Mar 2026 19:27:39 +0800
Message-ID: <9af14e15f1cd9b8826f10e15ceb0bbfcbf9d2833.1772529875.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772529875.git.zhoubinbin@loongson.cn>
References: <cover.1772529875.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxHMKzxaZpM59NAA--.14456S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEPCGmmeCEI-gAAsk
X-Coremail-Antispam: 1Uk129KBj93XoWxJw4rJFyfXFyfGr18Gr1xZwc_yoW5WryDpF
	9xA3yUKr48tr4YvF98X3yUZr1rZryaqFn2gF47Ww1F93Z8tryj9F1UJFyS9F40kFW3GF17
	WFs5W392k3WkCrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

More Loongson SoCs will be added, gathering all SoC private data
(`loongson2_mmc_pdata`) together to make the code clearer.

No functional change intended.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mmc/host/loongson2-mmc.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/loongson2-mmc.c b/drivers/mmc/host/loongson2-mmc.c
index 026cbd80f114..333bed60df3b 100644
--- a/drivers/mmc/host/loongson2-mmc.c
+++ b/drivers/mmc/host/loongson2-mmc.c
@@ -703,14 +703,6 @@ static int ls2k0500_mmc_set_external_dma(struct loongson2_mmc_host *host,
 	return 0;
 }
 
-static struct loongson2_mmc_pdata ls2k0500_mmc_pdata = {
-	.regmap_config		= &ls2k0500_mmc_regmap_config,
-	.reorder_cmd_data	= ls2k0500_mmc_reorder_cmd_data,
-	.setting_dma		= ls2k0500_mmc_set_external_dma,
-	.prepare_dma		= loongson2_mmc_prepare_external_dma,
-	.release_dma		= loongson2_mmc_release_external_dma,
-};
-
 static int ls2k1000_mmc_set_external_dma(struct loongson2_mmc_host *host,
 					 struct platform_device *pdev)
 {
@@ -735,14 +727,6 @@ static int ls2k1000_mmc_set_external_dma(struct loongson2_mmc_host *host,
 	return 0;
 }
 
-static struct loongson2_mmc_pdata ls2k1000_mmc_pdata = {
-	.regmap_config		= &ls2k0500_mmc_regmap_config,
-	.reorder_cmd_data	= ls2k0500_mmc_reorder_cmd_data,
-	.setting_dma		= ls2k1000_mmc_set_external_dma,
-	.prepare_dma		= loongson2_mmc_prepare_external_dma,
-	.release_dma		= loongson2_mmc_release_external_dma,
-};
-
 static const struct regmap_config ls2k2000_mmc_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -855,6 +839,22 @@ static void loongson2_mmc_release_internal_dma(struct loongson2_mmc_host *host,
 	dma_free_coherent(dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
 }
 
+static struct loongson2_mmc_pdata ls2k0500_mmc_pdata = {
+	.regmap_config		= &ls2k0500_mmc_regmap_config,
+	.reorder_cmd_data	= ls2k0500_mmc_reorder_cmd_data,
+	.setting_dma		= ls2k0500_mmc_set_external_dma,
+	.prepare_dma		= loongson2_mmc_prepare_external_dma,
+	.release_dma		= loongson2_mmc_release_external_dma,
+};
+
+static struct loongson2_mmc_pdata ls2k1000_mmc_pdata = {
+	.regmap_config		= &ls2k0500_mmc_regmap_config,
+	.reorder_cmd_data	= ls2k0500_mmc_reorder_cmd_data,
+	.setting_dma		= ls2k1000_mmc_set_external_dma,
+	.prepare_dma		= loongson2_mmc_prepare_external_dma,
+	.release_dma		= loongson2_mmc_release_external_dma,
+};
+
 static struct loongson2_mmc_pdata ls2k2000_mmc_pdata = {
 	.regmap_config		= &ls2k2000_mmc_regmap_config,
 	.reorder_cmd_data	= ls2k2000_mmc_reorder_cmd_data,
-- 
2.52.0

