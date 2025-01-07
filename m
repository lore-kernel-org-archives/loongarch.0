Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D061E9B38
	for <loongarch@lists.linux.dev>; Tue,  7 Jan 2025 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246360; cv=none; b=J37znaZtnVxOAuB77E56DFwXcFxdZzl2S7eIjPm4O4VywakCDSsszjWfv18QT8yBNV5sYu5A+tra9KG2HQKu5Jn6eTImorGhXgYll5qcdLlveUVC11BQXBgNPybdWhcNoWc3PHEYbDRz4mU/VPzcc60R0tx4GKBgzBqw+BoinVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246360; c=relaxed/simple;
	bh=LEocVp7Sn0lF5nlR2i78xyP4ZP0H/jxp/rTifcxwcHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9adyfwCmQA0b8ZGNhYtTeeyKGcbGiwQbfbZ+5xWfI+Mi67oFcKZrDrixeaxLE/2zb5NXZbbENh9PhUmE52ZTuQDU/QAhYz4vspa3fuwZCw7HBzu2G30T1yDtdjdXyB4XXRk9zUPNXNhkFIt9DVNWqcsFOJANjhYeb0X8DjlPm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8BxTKxNBH1nFzFfAA--.1704S3;
	Tue, 07 Jan 2025 18:39:09 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMDxfcdLBH1n0PIXAA--.37103S2;
	Tue, 07 Jan 2025 18:39:08 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-gpio@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	stable@vger.kernel.org,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: [PATCH] gpio: loongson: Fix Loongson-2K2000 ACPI GPIO register offset
Date: Tue,  7 Jan 2025 18:38:56 +0800
Message-ID: <20250107103856.1037222-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxfcdLBH1n0PIXAA--.37103S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFWUCw48GFW8Xw17GFWrtFc_yoW8Xw4fp3
	y3ua4rKr15JF17C39xZF9rAay8uas0yFZFgF42k3s3XF9Ivw1qqrW5AF909a17AryrAFy5
	XrWfKFW7ua1DCrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jYSoJUUUUU=

Since commit 3feb70a61740 ("gpio: loongson: add more gpio chip
support"), the Loongson-2K2000 GPIO is supported.

However, according to the firmware development specification, the
Loongson-2K2000 ACPI GPIO register offsets in the driver do not match
the register base addresses in the firmware, resulting in the registers
not being accessed properly.

Now, we fix it to ensure the GPIO function works properly.

Cc: stable@vger.kernel.org
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>
Fixes: 3feb70a61740 ("gpio: loongson: add more gpio chip support")
Co-developed-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 6749d4dd6d64..7f4d78fd800e 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -237,9 +237,9 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2 = {
 	.label = "ls2k2000_gpio",
 	.mode = BIT_CTRL_MODE,
-	.conf_offset = 0x84,
-	.in_offset = 0x88,
-	.out_offset = 0x80,
+	.conf_offset = 0x4,
+	.in_offset = 0x8,
+	.out_offset = 0x0,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls3a5000_data = {
-- 
2.43.5

