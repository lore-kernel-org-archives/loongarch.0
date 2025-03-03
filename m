Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0485F1E1A08
	for <loongarch@lists.linux.dev>; Mon,  3 Mar 2025 07:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987979; cv=none; b=ptNP21NM44khJK57mXGHIhT4PGeHo3hC/+UMKPKfRKygezG1J0dZ6vJW1mGNQSZMLWNVipsln6i7SmhrqchxzDzXks3mMi5jyilWDPznUuunYsrH2eSIGJ3hhTlOT1Ankqr+16+frQb4Sj1clFkep6QLdIOtw4/gCD2E8JgMAKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987979; c=relaxed/simple;
	bh=CTzO7nF7xfmQcpvoc6skrV90V4g3AmOOowAVoX4BtOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hesvsrse3qiely2DjgOBsokfx33jR2amZq3Ig4JzO/3OV5GahAiSvuC8mXoLrpKuaoqmQA4xOoNzDNSLQvLfi12QxWcNWC8UY+Dl7kWZ5Dpg3TimNjPBr4WSOQcdRH3qrsdLE5oGseBB0Bd2Lv0e493n8CdJ4FxfvQwlb+l4HoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8DxjXI_XsVnrfmIAA--.37495S3;
	Mon, 03 Mar 2025 15:46:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMAxzMQ7XsVn1GEzAA--.57437S3;
	Mon, 03 Mar 2025 15:46:07 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
Date: Mon,  3 Mar 2025 15:45:52 +0800
Message-ID: <20250303074552.3335186-2-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxzMQ7XsVn1GEzAA--.57437S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF45Xw1kAr1rCF45CFWkZrc_yoW5Gr47pF
	ZIvw1FgF4SqF4akF9xXFZrAF13A3yftrZFka12k3s3KrWqgw1DXFWIyFy5WwsFyryUAF43
	XrWfWFW7W3WDCrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jYmhrUUUUU=

The Loongson-7A2000 and Loongson-3A6000 share the same gpio chip model.
Just add them through driver_data.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 51 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index f000cc0356c7..a9a93036f08f 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -254,6 +254,33 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a_data = {
 	.out_offset = 0x900,
 };
 
+/* LS7A2000 chipset GPIO */
+static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0 = {
+	.label = "ls7a2000_gpio",
+	.mode = BYTE_CTRL_MODE,
+	.conf_offset = 0x800,
+	.in_offset = 0xa00,
+	.out_offset = 0x900,
+};
+
+/* LS7A2000 ACPI GPIO */
+static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data1 = {
+	.label = "ls7a2000_gpio",
+	.mode = BYTE_CTRL_MODE,
+	.conf_offset = 0x4,
+	.in_offset = 0x8,
+	.out_offset = 0x0,
+};
+
+/* Loongson-3A6000 node GPIO */
+static const struct loongson_gpio_chip_data loongson_gpio_ls3a6000_data = {
+	.label = "ls3a6000_gpio",
+	.mode = BIT_CTRL_MODE,
+	.conf_offset = 0x0,
+	.in_offset = 0xc,
+	.out_offset = 0x8,
+};
+
 static const struct of_device_id loongson_gpio_of_match[] = {
 	{
 		.compatible = "loongson,ls2k-gpio",
@@ -287,6 +314,18 @@ static const struct of_device_id loongson_gpio_of_match[] = {
 		.compatible = "loongson,ls7a-gpio",
 		.data = &loongson_gpio_ls7a_data,
 	},
+	{
+		.compatible = "loongson,ls7a2000-gpio1",
+		.data = &loongson_gpio_ls7a2000_data0,
+	},
+	{
+		.compatible = "loongson,ls7a2000-gpio2",
+		.data = &loongson_gpio_ls7a2000_data1,
+	},
+	{
+		.compatible = "loongson,ls3a6000-gpio",
+		.data = &loongson_gpio_ls3a6000_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, loongson_gpio_of_match);
@@ -312,6 +351,18 @@ static const struct acpi_device_id loongson_gpio_acpi_match[] = {
 		.id = "LOON000C",
 		.driver_data = (kernel_ulong_t)&loongson_gpio_ls2k2000_data2,
 	},
+	{
+		.id = "LOON000D",
+		.driver_data = (kernel_ulong_t)&loongson_gpio_ls7a2000_data0,
+	},
+	{
+		.id = "LOON000E",
+		.driver_data = (kernel_ulong_t)&loongson_gpio_ls7a2000_data1,
+	},
+	{
+		.id = "LOON000F",
+		.driver_data = (kernel_ulong_t)&loongson_gpio_ls3a6000_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
-- 
2.47.1

