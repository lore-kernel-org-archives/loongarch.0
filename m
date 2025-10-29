Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B102E8881
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 02:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703769; cv=none; b=Ozy9IuiWRHWbcfqOxVIXmR1ZWgVx5NJdkTRpLkMCcbwXUCz8KMoxMBPg7DzMk1jizIQI1+1feox81v29tSo1Yupmlph4G6XrlWqM/3WNEWLq6n2uz0M0it9v8+31H3KqKd85d8jPnVoInHIzpLIjHkDoMhM38x8SbPifkjgg2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703769; c=relaxed/simple;
	bh=uQtJVchOapLDORyCgCL5YZthdIBpdXxwo4d1euFkDGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjddYLBjnXQz9ai3mOcRd1ilV+XAXZjWny4YeSzIcrXalPbyIBVaaRTDSpfhS0VoZdoK6spKAkqqZfg4pyhEIvo8L38rXajjVgYLUK6HaBp5r78Nn/kH8C+VJJvoRAG+bbsBRR829s22jlrfzE+7P+39CpH2TBJ1bfEddsZeeJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8CxL9NVdwFphtobAA--.59670S3;
	Wed, 29 Oct 2025 10:09:25 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJAx+8BRdwFp1rAXAQ--.27054S4;
	Wed, 29 Oct 2025 10:09:25 +0800 (CST)
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
Subject: [PATCH 6/6] watchdog: loongson: Add Loongson-2k0300 watchdog support
Date: Wed, 29 Oct 2025 10:09:13 +0800
Message-ID: <20251029020913.1946321-3-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029020913.1946321-1-zhoubinbin@loongson.cn>
References: <20251029020913.1946321-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx+8BRdwFp1rAXAQ--.27054S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGkAWywU7wAAsn
X-Coremail-Antispam: 1Uk129KBj93XoW3AryrJr48uF4UJFy3Jr1DJwc_yoWxGr48pF
	WUA39YgrW3trs8Crsxt3yDCF43CrySq343Ja1xKw1rGa98tr1rXayrKF92q39IyFWxJr13
	ZFy8KFWSka1DKrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0y89JUUUUU==

According to the manual, the Loongson-2K0300 watchdog is similar to the
Loongson-1, except for some register offsets and inconsistent register
bit definitions. Separate definitions via driver_data suffice.

Co-developed-by: Xiaochuang Mao <maoxiaochuan@loongson.cn>
Signed-off-by: Xiaochuang Mao <maoxiaochuan@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/Kconfig        |  2 +-
 drivers/watchdog/loongson_wdt.c | 69 +++++++++++++++++++++++++++------
 2 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 74edeb13e95b..cae1339d581e 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1965,7 +1965,7 @@ config LANTIQ_WDT
 
 config LOONGSON_WDT
 	tristate "Loongson SoC hardware watchdog"
-	depends on MACH_LOONGSON32 || COMPILE_TEST
+	depends on MACH_LOONGSON32 || MACH_LOONGSON64 || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  Hardware driver for the Loongson SoC Watchdog Timer.
diff --git a/drivers/watchdog/loongson_wdt.c b/drivers/watchdog/loongson_wdt.c
index 703c65952c7c..6fdf48d45e09 100644
--- a/drivers/watchdog/loongson_wdt.c
+++ b/drivers/watchdog/loongson_wdt.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2016 Yang Ling <gnaygnil@gmail.com>
+ * Copyright (C) 2025 Binbin Zhou <zhoubinbin@loongson.cn>
  */
 
 #include <linux/clk.h>
@@ -12,8 +13,6 @@
 
 /* Loongson Watchdog Register Definitions */
 #define WDT_EN			0x0
-#define WDT_TIMER		0x4
-#define WDT_SET			0x8
 
 #define DEFAULT_HEARTBEAT	30
 
@@ -27,18 +26,37 @@ module_param(heartbeat, uint, 0);
 MODULE_PARM_DESC(heartbeat, "Watchdog heartbeat in seconds. (default="
 		 __MODULE_STRING(DEFAULT_HEARTBEAT) ")");
 
+struct loongson_wdt_pdata {
+	u32 timer_offset;
+	u32 set_offset;
+	u32 wdt_en_bit;
+};
+
+static const struct loongson_wdt_pdata ls1x_wdt_pdata = {
+	.timer_offset = 0x4,
+	.set_offset = 0x8,
+	.wdt_en_bit = BIT(0),
+};
+
+static const struct loongson_wdt_pdata ls2k0300_wdt_pdata = {
+	.timer_offset = 0x8,
+	.set_offset = 0x4,
+	.wdt_en_bit = BIT(1),
+};
+
 struct loongson_wdt_drvdata {
 	void __iomem *base;
 	struct clk *clk;
 	unsigned long clk_rate;
 	struct watchdog_device wdt;
+	const struct loongson_wdt_pdata *pdata;
 };
 
 static int loongson_wdt_ping(struct watchdog_device *wdt_dev)
 {
 	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writel(0x1, drvdata->base + WDT_SET);
+	writel(0x1, drvdata->base + drvdata->pdata->set_offset);
 
 	return 0;
 }
@@ -52,7 +70,7 @@ static int loongson_wdt_set_timeout(struct watchdog_device *wdt_dev, unsigned in
 	wdt_dev->timeout = timeout;
 
 	counts = drvdata->clk_rate * min(timeout, max_hw_heartbeat);
-	writel(counts, drvdata->base + WDT_TIMER);
+	writel(counts, drvdata->base + drvdata->pdata->timer_offset);
 
 	return 0;
 }
@@ -61,7 +79,7 @@ static int loongson_wdt_start(struct watchdog_device *wdt_dev)
 {
 	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writel(0x1, drvdata->base + WDT_EN);
+	writel(drvdata->pdata->wdt_en_bit, drvdata->base + WDT_EN);
 
 	return 0;
 }
@@ -69,8 +87,10 @@ static int loongson_wdt_start(struct watchdog_device *wdt_dev)
 static int loongson_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
+	u32 val = readl(drvdata->base + WDT_EN);
 
-	writel(0x0, drvdata->base + WDT_EN);
+	val &= ~(drvdata->pdata->wdt_en_bit);
+	writel(val, drvdata->base + WDT_EN);
 
 	return 0;
 }
@@ -79,9 +99,9 @@ static int loongson_wdt_restart(struct watchdog_device *wdt_dev, unsigned long a
 {
 	struct loongson_wdt_drvdata *drvdata = watchdog_get_drvdata(wdt_dev);
 
-	writel(0x1, drvdata->base + WDT_EN);
-	writel(0x1, drvdata->base + WDT_TIMER);
-	writel(0x1, drvdata->base + WDT_SET);
+	writel(drvdata->pdata->wdt_en_bit, drvdata->base + WDT_EN);
+	writel(0x1, drvdata->base + drvdata->pdata->timer_offset);
+	writel(0x1, drvdata->base + drvdata->pdata->set_offset);
 
 	return 0;
 }
@@ -112,6 +132,8 @@ static int loongson_wdt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, drvdata);
 
+	drvdata->pdata = of_device_get_match_data(dev);
+
 	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -140,9 +162,32 @@ static int loongson_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
+static int loongson_wdt_resume(struct device *dev)
+{
+	struct loongson_wdt_drvdata *data = dev_get_drvdata(dev);
+
+	if (watchdog_active(&data->wdt))
+		loongson_wdt_start(&data->wdt);
+
+	return 0;
+}
+
+static int loongson_wdt_suspend(struct device *dev)
+{
+	struct loongson_wdt_drvdata *data = dev_get_drvdata(dev);
+
+	if (watchdog_active(&data->wdt))
+		loongson_wdt_stop(&data->wdt);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(loongson_wdt_pm_ops, loongson_wdt_suspend, loongson_wdt_resume);
+
 static const struct of_device_id loongson_wdt_dt_ids[] = {
-	{ .compatible = "loongson,ls1b-wdt", },
-	{ .compatible = "loongson,ls1c-wdt", },
+	{ .compatible = "loongson,ls1b-wdt", .data = &ls1x_wdt_pdata },
+	{ .compatible = "loongson,ls1c-wdt", .data = &ls1x_wdt_pdata },
+	{ .compatible = "loongson,ls2k0300-wdt", .data = &ls2k0300_wdt_pdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, loongson_wdt_dt_ids);
@@ -152,11 +197,13 @@ static struct platform_driver loongson_wdt_driver = {
 	.driver = {
 		.name = "loongson-wdt",
 		.of_match_table = loongson_wdt_dt_ids,
+		.pm = pm_ptr(&loongson_wdt_pm_ops),
 	},
 };
 
 module_platform_driver(loongson_wdt_driver);
 
 MODULE_AUTHOR("Yang Ling <gnaygnil@gmail.com>");
+MODULE_AUTHOR("Binbin Zhou <zhoubinbin@loongson.cn>");
 MODULE_DESCRIPTION("Loongson Watchdog Driver");
 MODULE_LICENSE("GPL");
-- 
2.47.3

