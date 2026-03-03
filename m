Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C48480354
	for <loongarch@lists.linux.dev>; Tue,  3 Mar 2026 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537279; cv=none; b=B4bXo4Zl5MboWEm9JK6nPsLRlQtzwQNLjRerk1+qchC1G2cs3fhnSLD46gqKFMkuWovCm9CtIEbFGhVxjdXdRUhNrijBnaS6MwLtXO/SZDRVoJrnoaw3QS2n8aimLgF6t80SgUpnblEIa3GLRrSjmEKbBP7W+BKsTgkwI2epbr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537279; c=relaxed/simple;
	bh=SJe5esYN7YvntoVpKqkDm4cXCVGplHyoosdxsF/e4QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTherUzCpV65oZvCBdc1fuD1TQqmZVqq+hrl3dOfjog/TACcI5x9r+Pf4e3YPTpbgGtya5smAzggjcwZI3ABuDa+cIZHQ7SOSlSKqjT+ezpEqQJlJVjUEizobFLm9Do3Msvmemk+43cFT7yt8QSs7p73qw7oGJbQ8pkOuB0hUwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8Axw8C5xaZpUwEXAA--.10079S3;
	Tue, 03 Mar 2026 19:27:53 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJAxHMKzxaZpM59NAA--.14456S5;
	Tue, 03 Mar 2026 19:27:52 +0800 (CST)
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
Subject: [PATCH 3/3] mmc: loongson2: Add Loongson-2K0300 SD/SDIO/eMMC controller driver
Date: Tue,  3 Mar 2026 19:27:40 +0800
Message-ID: <365d1022b4b33f69bbd9b561aa15df2a07795e79.1772529875.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJAxHMKzxaZpM59NAA--.14456S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGmmeEEIjgAAs3
X-Coremail-Antispam: 1Uk129KBj93XoWxWrW5Wr43JF4fKr1xCF4fCrX_yoWrGw4rpF
	W7Z3yUKF4UKF4Y9F98XayUZr15ZrySqF9Fya17Ww1av3s5t34Dur1UJFySvF4FkFyxGF17
	Xr4kWws293WDCrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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

This patch describes the two MMC controllers of the Loongson-2K0300 SoC,
one providing an eMMC interface and the other exporting an SD/SDIO
interface.

Its hardware design is similar to that of the Loongson-2K2000, but it
suffers from hardware defects such as missing CMD48 interrupts.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mmc/host/loongson2-mmc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mmc/host/loongson2-mmc.c b/drivers/mmc/host/loongson2-mmc.c
index 333bed60df3b..f553e92fd9e5 100644
--- a/drivers/mmc/host/loongson2-mmc.c
+++ b/drivers/mmc/host/loongson2-mmc.c
@@ -189,6 +189,12 @@
 #define LOONGSON2_MMC_DLLVAL_TIMEOUT_US		4000
 #define LOONGSON2_MMC_TXFULL_TIMEOUT_US		500
 
+/*
+ * Due to a hardware design flaw, the Loongson-2K0300 may fail to recognize the
+ * CMD48 (SD_READ_EXTR_SINGLE) interrupt.
+ */
+#define LOONGSON2_MMC_CMD48_QUIRK	BIT(0)
+
 /* Loongson-2K1000 SDIO2 DMA routing register */
 #define LS2K1000_SDIO_DMA_MASK		GENMASK(17, 15)
 #define LS2K1000_DMA0_CONF		0x0
@@ -245,6 +251,7 @@ struct loongson2_mmc_host {
 };
 
 struct loongson2_mmc_pdata {
+	u32 flags;
 	const struct regmap_config *regmap_config;
 	void (*reorder_cmd_data)(struct loongson2_mmc_host *host, struct mmc_command *cmd);
 	void (*fix_data_timeout)(struct loongson2_mmc_host *host, struct mmc_command *cmd);
@@ -568,6 +575,12 @@ static void loongson2_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 {
 	struct loongson2_mmc_host *host = mmc_priv(mmc);
 
+	if ((host->pdata->flags & LOONGSON2_MMC_CMD48_QUIRK) &&
+	    mrq->cmd->opcode == SD_READ_EXTR_SINGLE) {
+		mmc_request_done(mmc, mrq);
+		return;
+	}
+
 	host->cmd_is_stop = 0;
 	host->mrq = mrq;
 	loongson2_mmc_send_request(mmc);
@@ -839,7 +852,18 @@ static void loongson2_mmc_release_internal_dma(struct loongson2_mmc_host *host,
 	dma_free_coherent(dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
 }
 
+static struct loongson2_mmc_pdata ls2k0300_mmc_pdata = {
+	.flags			= LOONGSON2_MMC_CMD48_QUIRK,
+	.regmap_config		= &ls2k2000_mmc_regmap_config,
+	.reorder_cmd_data	= ls2k2000_mmc_reorder_cmd_data,
+	.fix_data_timeout	= ls2k2000_mmc_fix_data_timeout,
+	.setting_dma		= ls2k2000_mmc_set_internal_dma,
+	.prepare_dma		= loongson2_mmc_prepare_internal_dma,
+	.release_dma		= loongson2_mmc_release_internal_dma,
+};
+
 static struct loongson2_mmc_pdata ls2k0500_mmc_pdata = {
+	.flags			= 0,
 	.regmap_config		= &ls2k0500_mmc_regmap_config,
 	.reorder_cmd_data	= ls2k0500_mmc_reorder_cmd_data,
 	.setting_dma		= ls2k0500_mmc_set_external_dma,
@@ -848,6 +872,7 @@ static struct loongson2_mmc_pdata ls2k0500_mmc_pdata = {
 };
 
 static struct loongson2_mmc_pdata ls2k1000_mmc_pdata = {
+	.flags			= 0,
 	.regmap_config		= &ls2k0500_mmc_regmap_config,
 	.reorder_cmd_data	= ls2k0500_mmc_reorder_cmd_data,
 	.setting_dma		= ls2k1000_mmc_set_external_dma,
@@ -856,6 +881,7 @@ static struct loongson2_mmc_pdata ls2k1000_mmc_pdata = {
 };
 
 static struct loongson2_mmc_pdata ls2k2000_mmc_pdata = {
+	.flags			= 0,
 	.regmap_config		= &ls2k2000_mmc_regmap_config,
 	.reorder_cmd_data	= ls2k2000_mmc_reorder_cmd_data,
 	.fix_data_timeout	= ls2k2000_mmc_fix_data_timeout,
@@ -984,6 +1010,7 @@ static void loongson2_mmc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id loongson2_mmc_of_ids[] = {
+	{ .compatible = "loongson,ls2k0300-mmc", .data = &ls2k0300_mmc_pdata },
 	{ .compatible = "loongson,ls2k0500-mmc", .data = &ls2k0500_mmc_pdata },
 	{ .compatible = "loongson,ls2k1000-mmc", .data = &ls2k1000_mmc_pdata },
 	{ .compatible = "loongson,ls2k2000-mmc", .data = &ls2k2000_mmc_pdata },
-- 
2.52.0

