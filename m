Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F05E14F98
	for <loongarch@lists.linux.dev>; Tue, 23 Apr 2024 01:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713837579; cv=none; b=n3roXp2vadeHDvRTTEQBFFYPjLUsgC1bCqKg38xeRwkwzx+3pUpqt324UFtoiFD/q7uzAq2xGyisvOuUGEa1Mfpip2X57HSLaazKEB2f/EqJLkeF9N0GuvoAvP3FtWWbF9oOnJlx9MxN3fn6qQHedqNVmoLtDoquM8eCPVxRWWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713837579; c=relaxed/simple;
	bh=EogI9SRSc4aQBTGpKyhruJtnt0sY5Aob5gObFXUCTrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ux2b17Yvh8eZbzES020gUWE6mF0IA5+wMPoZ0XzYimBcAjAs4yZrmyPTlGQI64ORtQG1p7l8L/DWQT2CP18W7udq6ZR+MUCupRG5xx4AyIitNdCEZGmb9A2udZ+Cd5niRoRE/JnnD/MQTspC2RbsJYEam12AAXae+oR9OHG22oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8CxJvAGFidmQB4BAA--.6632S3;
	Tue, 23 Apr 2024 09:59:34 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxjd4EFidmjOEBAA--.8212S2;
	Tue, 23 Apr 2024 09:59:33 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	WANG Xuerui <git@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v4 4/4] thermal: loongson2: Add Loongson-2K2000 support
Date: Tue, 23 Apr 2024 09:59:26 +0800
Message-ID: <fdbfdcc3231a36a4ee0bcf1377ddcbd6f8c944b5.1713837379.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1713837379.git.zhoubinbin@loongson.cn>
References: <cover.1713837379.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxjd4EFidmjOEBAA--.8212S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3GFWDZF4UtrW8Xry7Jr1DurX_yoW7AFykp3
	47C3y5KFWDXr4Du34DAw1kZr4Yyry3tasxZFs7Gw1fW395J343WFy5tFy0vrWfCF98JFy3
	ZrZYvFWUC3WDW3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jqRRiUUUUU=

The Loongson-2K2000 and Loongson-2K1000 have similar thermal sensors,
except that the temperature is read differently.

In particular, the temperature output registers of the Loongson-2K2000
are defined in the chip configuration domain and are read in a different
way.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Acked-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/thermal/loongson2_thermal.c | 64 +++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
index 5c9cf45a3719..2d6b75b0539f 100644
--- a/drivers/thermal/loongson2_thermal.c
+++ b/drivers/thermal/loongson2_thermal.c
@@ -30,12 +30,20 @@
 					 LOONGSON2_THSENS_INT_HIGH)
 #define LOONGSON2_THSENS_OUT_MASK	0xFF
 
+/*
+ * This flag is used to indicate the temperature reading
+ * method of the Loongson-2K2000
+ */
+#define LS2K2000_THSENS_OUT_FLAG	BIT(0)
+
 struct loongson2_thermal_chip_data {
 	unsigned int thermal_sensor_sel;
+	unsigned int flags;
 };
 
 struct loongson2_thermal_data {
-	void __iomem *regs;
+	void __iomem *ctrl_reg;
+	void __iomem *temp_reg;
 	const struct loongson2_thermal_chip_data *chip_data;
 };
 
@@ -48,7 +56,7 @@ static void loongson2_set_ctrl_regs(struct loongson2_thermal_data *data,
 
 	reg_ctrl = ctrl_data + HECTO;
 	reg_ctrl |= enable ? 0x100 : 0;
-	writew(reg_ctrl, data->regs + ctrl_reg + reg_off);
+	writew(reg_ctrl, data->ctrl_reg + ctrl_reg + reg_off);
 }
 
 static int loongson2_thermal_set(struct loongson2_thermal_data *data,
@@ -63,13 +71,24 @@ static int loongson2_thermal_set(struct loongson2_thermal_data *data,
 	return 0;
 }
 
-static int loongson2_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+static int loongson2_2k1000_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	int val;
+	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
+
+	val = readl(data->ctrl_reg + LOONGSON2_THSENS_OUT_REG);
+	*temp = ((val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * KILO;
+
+	return 0;
+}
+
+static int loongson2_2k2000_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	u32 reg_val;
+	int val;
 	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
 
-	reg_val = readl(data->regs + LOONGSON2_THSENS_OUT_REG);
-	*temp = ((reg_val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * KILO;
+	val = readl(data->temp_reg);
+	*temp = ((val & 0xffff) * 820 / 0x4000 - 311) * KILO;
 
 	return 0;
 }
@@ -79,7 +98,7 @@ static irqreturn_t loongson2_thermal_irq_thread(int irq, void *dev)
 	struct thermal_zone_device *tzd = dev;
 	struct loongson2_thermal_data *data = thermal_zone_device_priv(tzd);
 
-	writeb(LOONGSON2_THSENS_INT_EN, data->regs + LOONGSON2_THSENS_STATUS_REG);
+	writeb(LOONGSON2_THSENS_INT_EN, data->ctrl_reg + LOONGSON2_THSENS_STATUS_REG);
 
 	thermal_zone_device_update(tzd, THERMAL_EVENT_UNSPECIFIED);
 
@@ -93,8 +112,8 @@ static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low,
 	return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
 }
 
-static const struct thermal_zone_device_ops loongson2_of_thermal_ops = {
-	.get_temp = loongson2_thermal_get_temp,
+static struct thermal_zone_device_ops loongson2_of_thermal_ops = {
+	.get_temp = loongson2_2k1000_get_temp,
 	.set_trips = loongson2_thermal_set_trips,
 };
 
@@ -111,15 +130,24 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
 
 	data->chip_data = device_get_match_data(dev);
 
-	data->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->regs))
-		return PTR_ERR(data->regs);
+	data->ctrl_reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->ctrl_reg))
+		return PTR_ERR(data->ctrl_reg);
+
+	/* The temperature output register is separate for Loongson-2K2000 */
+	if (data->chip_data->flags & LS2K2000_THSENS_OUT_FLAG) {
+		data->temp_reg = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(data->temp_reg))
+			return PTR_ERR(data->temp_reg);
+
+		loongson2_of_thermal_ops.get_temp = loongson2_2k2000_get_temp;
+	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	writeb(LOONGSON2_THSENS_INT_EN, data->regs + LOONGSON2_THSENS_STATUS_REG);
+	writeb(LOONGSON2_THSENS_INT_EN, data->ctrl_reg + LOONGSON2_THSENS_STATUS_REG);
 
 	loongson2_thermal_set(data, 0, 0, false);
 
@@ -148,6 +176,12 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
 
 static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k1000_data = {
 	.thermal_sensor_sel = 0,
+	.flags = 0,
+};
+
+static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k2000_data = {
+	.thermal_sensor_sel = 0,
+	.flags = LS2K2000_THSENS_OUT_FLAG,
 };
 
 static const struct of_device_id of_loongson2_thermal_match[] = {
@@ -155,6 +189,10 @@ static const struct of_device_id of_loongson2_thermal_match[] = {
 		.compatible = "loongson,ls2k1000-thermal",
 		.data = &loongson2_thermal_ls2k1000_data,
 	},
+	{
+		.compatible = "loongson,ls2k2000-thermal",
+		.data = &loongson2_thermal_ls2k2000_data,
+	},
 	{ /* end */ }
 };
 MODULE_DEVICE_TABLE(of, of_loongson2_thermal_match);
-- 
2.43.0

