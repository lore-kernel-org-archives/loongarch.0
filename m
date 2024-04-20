Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41A77490
	for <loongarch@lists.linux.dev>; Sat, 20 Apr 2024 01:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713577585; cv=none; b=pN2zyJ94WFbc0KuWYOVtxGtNQP8g9slyfgsNEPXIDyQ44FuwJ6eKGDF3cXQ62oaPWrxOR32RA3nIr5TudrV1AAtkJ48S2giMuVAv5idIMdCVL3O12IJVgePV2OT6ZhiiQ6ZN0EdcHxY9F9Qags8d6yZ/mqmI0hPQ33xhvgUy9JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713577585; c=relaxed/simple;
	bh=h6jarikVF26j8aPkjTGqpeqb6H4GeWm6GlEqUopV/nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qefvTC41uVgxMcnXd+KLt4jYCToDB88aSbwktAkMtFjIayO3iNB6/asqCfzLNLhBofhXQJrMAsy7wpKaYAzByH44M0L9dA9RX+YnyAq/2PwxFkML83FLwhzsCciG2fzLXay71GImQLcWwgOYRWvgY1WWRDNhuwxOwwDHBGXQkz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8DxUPFtHiNm5DwAAA--.1330S3;
	Sat, 20 Apr 2024 09:46:21 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxUuBsHiNmJYIAAA--.2827S2;
	Sat, 20 Apr 2024 09:46:20 +0800 (CST)
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
Subject: [PATCH v3 4/4] thermal: loongson2: Add Loongson-2K2000 support
Date: Sat, 20 Apr 2024 09:46:08 +0800
Message-ID: <e3c9b6bdfe8624d90bcc16eefe92abd66bd3da12.1713509889.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1713509889.git.zhoubinbin@loongson.cn>
References: <cover.1713509889.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxUuBsHiNmJYIAAA--.2827S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAw48Kw47Kw43CFWftr43Jwc_yoWruFWkp3
	47C3y5KrWDXr4Du3s8Aw1kZF4Yyry3ta9xZFs7Gw1fW393t343Wry5KF10vrWSkFZ8JFy5
	ZrZ0vFWxC3WDW3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_
	ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU36RRDUUUU

The Loongson-2K2000 and Loongson-2K1000 have similar thermal sensors,
except that the temperature is read differently.

In particular, the temperature output registers of the Loongson-2K2000
are defined in the chip configuration domain and are read in a different
way.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Acked-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/thermal/loongson2_thermal.c | 50 +++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
index 7de01fbea801..8ecd8ed465ec 100644
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
@@ -65,11 +73,16 @@ static int loongson2_thermal_set(struct loongson2_thermal_data *data,
 
 static int loongson2_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	u32 reg_val;
+	int val;
 	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
 
-	reg_val = readl(data->regs + LOONGSON2_THSENS_OUT_REG);
-	*temp = ((reg_val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * KILO;
+	if (data->chip_data->flags) {
+		val = readl(data->temp_reg);
+		*temp = ((val & 0xffff) * 820 / 0x4000 - 311) * KILO;
+	} else {
+		val = readl(data->ctrl_reg + LOONGSON2_THSENS_OUT_REG);
+		*temp = ((val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * KILO;
+	}
 
 	return 0;
 }
@@ -79,7 +92,7 @@ static irqreturn_t loongson2_thermal_irq_thread(int irq, void *dev)
 	struct thermal_zone_device *tzd = dev;
 	struct loongson2_thermal_data *data = thermal_zone_device_priv(tzd);
 
-	writeb(LOONGSON2_THSENS_INT_EN, data->regs + LOONGSON2_THSENS_STATUS_REG);
+	writeb(LOONGSON2_THSENS_INT_EN, data->ctrl_reg + LOONGSON2_THSENS_STATUS_REG);
 
 	thermal_zone_device_update(tzd, THERMAL_EVENT_UNSPECIFIED);
 
@@ -111,15 +124,22 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
 
 	data->chip_data = device_get_match_data(dev);
 
-	data->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->regs))
-		return PTR_ERR(data->regs);
+	data->ctrl_reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->ctrl_reg))
+		return PTR_ERR(data->ctrl_reg);
+
+	/* The temperature output register is separate for Loongson-2K2000 */
+	if (data->chip_data->flags) {
+		data->temp_reg = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(data->temp_reg))
+			return PTR_ERR(data->temp_reg);
+	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	writeb(LOONGSON2_THSENS_INT_EN, data->regs + LOONGSON2_THSENS_STATUS_REG);
+	writeb(LOONGSON2_THSENS_INT_EN, data->ctrl_reg + LOONGSON2_THSENS_STATUS_REG);
 
 	loongson2_thermal_set(data, 0, 0, false);
 
@@ -146,6 +166,12 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
 
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
@@ -153,6 +179,10 @@ static const struct of_device_id of_loongson2_thermal_match[] = {
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

