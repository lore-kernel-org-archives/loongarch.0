Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC7C3126D8
	for <loongarch@lists.linux.dev>; Tue,  6 Jan 2026 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767663251; cv=none; b=SN6ze+PMpBYsdL01lxKU8dhgjNiQP+BMYzcsEaMDMdMIRPpAWGO4AV6w91ThNxKab7XvBrgyQb1/3TkmNXXlhRz2k7aCo7HzPznuArIkg6CiNqWmv3JH5b67ifgu8E/yBMZtljUnxOD5fua0bb/GZF7bqz5q+oISq89k7Ur+pV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767663251; c=relaxed/simple;
	bh=QI85LElbAq1tL92g6/0uHLO0c8OPkd12NhBmQUKzMfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha2CkJ4jNE+BHWshzCIqlD/CjYPkjHjGkwuvI7erW4VWevpO/VxQ/8AHoQ+qFoDBGlslBhJG5G2NwMe5ODMpZyRcG0hEKWEnIg2xMMVvsv/ueFSXAD528IKGBV9b1Q4lVN70FNtWqtJp4FdN4qzA59q2s7cHZhCAEzzGrEhZsV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8Cx58GJZlxpEM4FAA--.6073S3;
	Tue, 06 Jan 2026 09:34:01 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJBxKMF8ZlxpN4IPAA--.20395S5;
	Tue, 06 Jan 2026 09:33:57 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 3/3] rtc: loongson: Add Loongson-2K0300 support
Date: Tue,  6 Jan 2026 09:33:33 +0800
Message-ID: <8ff00dfd68b24fb3261b98389af9ff66c6c25198.1767663073.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767663073.git.zhoubinbin@loongson.cn>
References: <cover.1767663073.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMF8ZlxpN4IPAA--.20395S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGlbUpoR9AAAsH
X-Coremail-Antispam: 1Uk129KBj93XoWxuFW3uw1fKry8GF1kXw17twc_yoW7Xw4Dpw
	43Aa45Kr4FqF15urs5JayUGF13CryfGa4IqF47K3s2g3sxA34DZr1kKFy3Z3y3AF98ZrW3
	XFWkGFWfua1UCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI
	0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU46RR
	DUUUU

The Loongson-2K0300's rtc hardware design is similar to that of the
Loongson-1B, but it does not support the alarm feature.

Introduce `LOONGSON_RTC_ALARM_WORKAROUND`, which indicates a chip that
does not support the alarm feature, and rewrite the related logic in
`loongson_rtc_alarm_setting()`.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/rtc/rtc-loongson.c | 71 +++++++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index 2ca7ffd5d7a9..066f0644d1c3 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -66,7 +66,8 @@
  * According to the LS1C manual, RTC_CTRL and alarm-related registers are not defined.
  * Accessing the relevant registers will cause the system to hang.
  */
-#define LS1C_RTC_CTRL_WORKAROUND	BIT(0)
+#define LOONGSON_RTC_CTRL_WORKAROUND	BIT(0)
+#define LOONGSON_RTC_ALARM_WORKAROUND	BIT(1)
 
 struct loongson_rtc_config {
 	u32 pm_offset;	/* Offset of PM domain, for RTC alarm wakeup */
@@ -89,7 +90,7 @@ static const struct loongson_rtc_config ls1b_rtc_config = {
 
 static const struct loongson_rtc_config ls1c_rtc_config = {
 	.pm_offset = 0,
-	.flags = LS1C_RTC_CTRL_WORKAROUND,
+	.flags = LOONGSON_RTC_CTRL_WORKAROUND | LOONGSON_RTC_ALARM_WORKAROUND,
 };
 
 static const struct loongson_rtc_config generic_rtc_config = {
@@ -97,6 +98,11 @@ static const struct loongson_rtc_config generic_rtc_config = {
 	.flags = 0,
 };
 
+static const struct loongson_rtc_config ls2k0300_rtc_config = {
+	.pm_offset = 0x0,
+	.flags = LOONGSON_RTC_ALARM_WORKAROUND,
+};
+
 static const struct loongson_rtc_config ls2k1000_rtc_config = {
 	.pm_offset = 0x800,
 	.flags = 0,
@@ -153,7 +159,7 @@ static int loongson_rtc_set_enabled(struct device *dev)
 {
 	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
 
-	if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
+	if (priv->config->flags & LOONGSON_RTC_CTRL_WORKAROUND)
 		return 0;
 
 	/* Enable RTC TOY counters and crystal */
@@ -167,7 +173,7 @@ static bool loongson_rtc_get_enabled(struct device *dev)
 	u32 ctrl_data;
 	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
 
-	if (priv->config->flags & LS1C_RTC_CTRL_WORKAROUND)
+	if (priv->config->flags & LOONGSON_RTC_CTRL_WORKAROUND)
 		return true;
 
 	ret = regmap_read(priv->regmap, RTC_CTRL_REG, &ctrl_data);
@@ -299,9 +305,41 @@ static const struct rtc_class_ops loongson_rtc_ops = {
 	.alarm_irq_enable = loongson_rtc_alarm_irq_enable,
 };
 
+static int loongson_rtc_alarm_setting(struct platform_device *pdev, void __iomem *regs)
+{
+	int ret = 0, alarm_irq;
+	struct device *dev = &pdev->dev;
+	struct loongson_rtc_priv *priv = dev_get_drvdata(dev);
+
+	if (priv->config->flags & LOONGSON_RTC_ALARM_WORKAROUND) {
+		/* Loongson-1C/Loongson-2K0300 RTC does not support alarm */
+		clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
+		return 0;
+	}
+
+	/* Get RTC alarm irq */
+	alarm_irq = platform_get_irq(pdev, 0);
+	if (alarm_irq < 0)
+		return alarm_irq;
+
+	ret = devm_request_irq(dev, alarm_irq, loongson_rtc_isr, 0, "loongson-alarm",
+			       priv);
+	if (ret < 0)
+		return ret;
+
+	priv->pm_base = regs - priv->config->pm_offset;
+	device_init_wakeup(dev, true);
+
+	if (has_acpi_companion(dev))
+		acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
+						 loongson_rtc_handler, priv);
+
+	return ret;
+}
+
 static int loongson_rtc_probe(struct platform_device *pdev)
 {
-	int ret, alarm_irq;
+	int ret;
 	void __iomem *regs;
 	struct loongson_rtc_priv *priv;
 	struct device *dev = &pdev->dev;
@@ -330,25 +368,9 @@ static int loongson_rtc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
 				     "devm_rtc_allocate_device failed\n");
 
-	/* Get RTC alarm irq */
-	alarm_irq = platform_get_irq(pdev, 0);
-	if (alarm_irq > 0) {
-		ret = devm_request_irq(dev, alarm_irq, loongson_rtc_isr,
-				       0, "loongson-alarm", priv);
-		if (ret < 0)
-			return dev_err_probe(dev, ret, "Unable to request irq %d\n",
-					     alarm_irq);
-
-		priv->pm_base = regs - priv->config->pm_offset;
-		device_init_wakeup(dev, true);
-
-		if (has_acpi_companion(dev))
-			acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
-							 loongson_rtc_handler, priv);
-	} else {
-		/* Loongson-1C RTC does not support alarm */
-		clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
-	}
+	ret = loongson_rtc_alarm_setting(pdev, regs);
+	if (ret)
+		return ret;
 
 	/* Loongson RTC does not support UIE */
 	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);
@@ -379,6 +401,7 @@ static const struct of_device_id loongson_rtc_of_match[] = {
 	{ .compatible = "loongson,ls1b-rtc", .data = &ls1b_rtc_config },
 	{ .compatible = "loongson,ls1c-rtc", .data = &ls1c_rtc_config },
 	{ .compatible = "loongson,ls7a-rtc", .data = &generic_rtc_config },
+	{ .compatible = "loongson,ls2k0300-rtc", .data = &ls2k0300_rtc_config },
 	{ .compatible = "loongson,ls2k1000-rtc", .data = &ls2k1000_rtc_config },
 	{ /* sentinel */ }
 };
-- 
2.47.3

