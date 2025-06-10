Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D62822B8C6
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556784; cv=none; b=ui/DysWxQjY8zZdOsOBOEf1Ir1a37SnSIz+7IrQniCSiK/ms90PLjr9oigaJWgsL4e098Uu1CJ0EhSissfp2kQwmWFxkm7QxqNhlDQKVTMGZKIYCTShO4wpVDa7e3SuGvCvH1YeClTUVNa6bVxD9kYP71rxepdSCvuwOFRSoxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556784; c=relaxed/simple;
	bh=MktQiHfELBx4PHWTInsfVDuNoRGhpjiHqP2Lv3lIPOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4FHrvLmxUHeboFaGJCChIlIE11q+muZLn1BSOBbgOJJQQDCxHhZmOcvzARRtUAcOHXixDV0gi4kYziKYS4HOuCVm25l68JfS+4O7QNdlOZPPrORWhQi066Z/yyVMp+dD3vGX3sUAcPdC2sD9dr4OJyub7+UBbUqR+GNzACvqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8AxDGsrHkhoWKcSAQ--.46070S3;
	Tue, 10 Jun 2025 19:59:39 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMCxPscoHkhoUFUUAQ--.64953S2;
	Tue, 10 Jun 2025 19:59:38 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO access mode
Date: Tue, 10 Jun 2025 19:59:26 +0800
Message-ID: <20250610115926.347845-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxPscoHkhoUFUUAQ--.64953S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruw48WFykCrWDXFW5CryUurX_yoWkXFc_uF
	1ftrW8JrW5ZFnFvw13u3WIkryIv3y7u3ZakFn2qayYq3s8twn8ur9rurySkF9rXry7urnx
	Wa4kCFySvw4xWosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_
	Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vApUUU
	UUU==

According to the description of the Loongson-7A2000 ACPI GPIO register in
the manual, its access mode should be BIT_CTRL_MODE, otherwise there maybe
some unpredictable behavior.

Cc: stable@vger.kernel.org
Fixes: 44fe79020b91 ("gpio: loongson-64bit: Add more gpio chip support")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 26227669f026..70a01c5b8ad1 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -268,7 +268,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0 = {
 /* LS7A2000 ACPI GPIO */
 static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data1 = {
 	.label = "ls7a2000_gpio",
-	.mode = BYTE_CTRL_MODE,
+	.mode = BIT_CTRL_MODE,
 	.conf_offset = 0x4,
 	.in_offset = 0x8,
 	.out_offset = 0x0,

base-commit: e0d4a0f1d066f14522049e827107a577444d9183
-- 
2.47.1

