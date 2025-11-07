Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102112BE7B1
	for <loongarch@lists.linux.dev>; Fri,  7 Nov 2025 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762495329; cv=none; b=REe1+GaIC5FAt37dQwQjpGgU6bmcXD0t0f+IZx6YYDETqwu82YnO9zMQyu/Fsqbiutcc69/6kKr5TfwbtAE/0RK+yPuaK4+YBv36svBnmOhpqQjZeC738CRUHIEE4RftrEgwDQnUNEz4j1azXWeLrkxoaG0oaxHXDrZQmI+O2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762495329; c=relaxed/simple;
	bh=FOovmlUvsHejk+MLq/vQpYkCEVZIWaQvbDCKaJzy6uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8Vf33/F8a8yYz2liQQDsYj2F9M8Kezu8ZqaRcbIuSnN/cRKrHTS2xEariSvWlFcOA5pvcC2253ZfBC3NHMkxbVJu4pwFu06uGEMDrVahlEg1oE0HHjdYKKNz4MV+T9y97cHAJ+PGnM5Hf/N4QGS0PSoymje3E+Kb6IABy5BoD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8Dxb_Bciw1p0SYgAA--.5154S3;
	Fri, 07 Nov 2025 14:02:04 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJCxXMFYiw1pZ5IqAQ--.8954S3;
	Fri, 07 Nov 2025 14:02:03 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>
Subject: [PATCH v2 5/5] watchdog: loongson1: Add Loongson-2k0300 watchdog support
Date: Fri,  7 Nov 2025 14:01:51 +0800
Message-ID: <d6153aa5457098cea388cff7ee2ceb43b207970b.1762482089.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762482089.git.zhoubinbin@loongson.cn>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxXMFYiw1pZ5IqAQ--.8954S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGkNihMADwAAsq
X-Coremail-Antispam: 1Uk129KBj93XoW3AryrJr48uF1ktw4DXrWxKrX_yoWxXr1kpF
	WUZ39YvrW5tr43ZrsIq34DCF43GrySq343Jw4xKw1fua98Kr95Xa95trn3t3909FWxJr13
	JF17KFWSka1DKrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==

According to the manual, the Loongson-2K0300 watchdog is similar to the
Loongson-1, except for some register offsets and inconsistent register
bit definitions. Separate definitions via driver_data suffice.

Co-developed-by: Xiaochuang Mao <maoxiaochuan@loongson.cn>
Signed-off-by: Xiaochuang Mao <maoxiaochuan@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/Kconfig         |  4 +-
 drivers/watchdog/loongson1_wdt.c | 73 ++++++++++++++++++++++++++------
 2 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0c25b2ed44eb..002eb785ca1f 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1965,10 +1965,10 @@ config LANTIQ_WDT
 
 config LOONGSON1_WDT
 	tristate "Loongson1 SoC hardware watchdog"
-	depends on MACH_LOONGSON32 || COMPILE_TEST
+	depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
-	  Hardware driver for the Loongson1 SoC Watchdog Timer.
+	  Hardware driver for the Loongson family Watchdog Timer.
 
 config RALINK_WDT
 	tristate "Ralink SoC watchdog"
diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
index 255198cbf5bf..2417519717cc 100644
--- a/drivers/watchdog/loongson1_wdt.c
+++ b/drivers/watchdog/loongson1_wdt.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2016 Yang Ling <gnaygnil@gmail.com>
+ * Copyright (C) 2025 Binbin Zhou <zhoubinbin@loongson.cn>
  */
 
 #include <linux/clk.h>
@@ -10,10 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
-/* Loongson 1 Watchdog Register Definitions */
+/* Loongson Watchdog Register Definitions */
 #define WDT_EN			0x0
-#define WDT_TIMER		0x4
-#define WDT_SET			0x8
 
 #define DEFAULT_HEARTBEAT	30
 
@@ -27,18 +26,37 @@ module_param(heartbeat, uint, 0);
 MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds. (default="
 		 __MODULE_STRING(DEFAULT_HEARTBEAT) ")");
 
+struct ls1x_wdt_pdata {
+	u32 timer_offset;
+	u32 set_offset;
+	u32 wdt_en_bit;
+};
+
+static const struct ls1x_wdt_pdata ls1b_wdt_pdata = {
+	.timer_offset = 0x4,
+	.set_offset = 0x8,
+	.wdt_en_bit = BIT(0),
+};
+
+static const struct ls1x_wdt_pdata ls2k0300_wdt_pdata = {
+	.timer_offset = 0x8,
+	.set_offset = 0x4,
+	.wdt_en_bit = BIT(1),
+};
+
 struct ls1x_wdt_drvdata {
 	void __iomem *base;
 	struct clk *clk;
 	unsigned long clk_rate;
 	struct watchdog_device wdt;
+	const struct ls1x_wdt_pdata *pdata;
 };
 
 static int ls1x_wdt_ping(struct watchdog_device *wdt_dev)
 {
 	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writel(0x1, drvdata->base + WDT_SET);
+	writel(0x1, drvdata->base + drvdata->pdata->set_offset);
 
 	return 0;
 }
@@ -53,7 +71,7 @@ static int ls1x_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	wdt_dev->timeout = timeout;
 
 	counts = drvdata->clk_rate * min(timeout, max_hw_heartbeat);
-	writel(counts, drvdata->base + WDT_TIMER);
+	writel(counts, drvdata->base + drvdata->pdata->timer_offset);
 
 	return 0;
 }
@@ -62,7 +80,7 @@ static int ls1x_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writel(0x1, drvdata->base + WDT_EN);
+	writel(drvdata->pdata->wdt_en_bit, drvdata->base + WDT_EN);
 
 	return 0;
 }
@@ -70,8 +88,10 @@ static int ls1x_wdt_start(struct watchdog_device *wdt_dev)
 static int ls1x_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	u32 val = readl(drvdata->base + WDT_EN);
 
-	writel(0x0, drvdata->base + WDT_EN);
+	val &= ~(drvdata->pdata->wdt_en_bit);
+	writel(val, drvdata->base + WDT_EN);
 
 	return 0;
 }
@@ -81,9 +101,9 @@ static int ls1x_wdt_restart(struct watchdog_device *wdt_dev,
 {
 	struct ls1x_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writel(0x1, drvdata->base + WDT_EN);
-	writel(0x1, drvdata->base + WDT_TIMER);
-	writel(0x1, drvdata->base + WDT_SET);
+	writel(drvdata->pdata->wdt_en_bit, drvdata->base + WDT_EN);
+	writel(0x1, drvdata->base + drvdata->pdata->timer_offset);
+	writel(0x1, drvdata->base + drvdata->pdata->set_offset);
 
 	return 0;
 }
@@ -114,6 +134,8 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, drvdata);
 
+	drvdata->pdata = of_device_get_match_data(dev);
+
 	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -142,9 +164,32 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
+static int ls1x_wdt_resume(struct device *dev)
+{
+	struct ls1x_wdt_drvdata *data = dev_get_drvdata(dev);
+
+	if (watchdog_active(&data->wdt))
+		ls1x_wdt_start(&data->wdt);
+
+	return 0;
+}
+
+static int ls1x_wdt_suspend(struct device *dev)
+{
+	struct ls1x_wdt_drvdata *data = dev_get_drvdata(dev);
+
+	if (watchdog_active(&data->wdt))
+		ls1x_wdt_stop(&data->wdt);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ls1x_wdt_pm_ops, ls1x_wdt_suspend, ls1x_wdt_resume);
+
 static const struct of_device_id ls1x_wdt_dt_ids[] = {
-	{ .compatible = "loongson,ls1b-wdt", },
-	{ .compatible = "loongson,ls1c-wdt", },
+	{ .compatible = "loongson,ls1b-wdt", .data = &ls1b_wdt_pdata },
+	{ .compatible = "loongson,ls1c-wdt", .data = &ls1b_wdt_pdata },
+	{ .compatible = "loongson,ls2k0300-wdt", .data = &ls2k0300_wdt_pdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
@@ -154,11 +199,13 @@ static struct platform_driver ls1x_wdt_driver = {
 	.driver = {
 		.name = "ls1x-wdt",
 		.of_match_table = ls1x_wdt_dt_ids,
+		.pm = pm_ptr(&ls1x_wdt_pm_ops),
 	},
 };
 
 module_platform_driver(ls1x_wdt_driver);
 
 MODULE_AUTHOR("Yang Ling <gnaygnil@gmail.com>");
-MODULE_DESCRIPTION("Loongson1 Watchdog Driver");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
+MODULE_DESCRIPTION("Loongson Watchdog Driver");
 MODULE_LICENSE("GPL");
-- 
2.47.3

