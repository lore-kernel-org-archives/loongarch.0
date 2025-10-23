Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3BC2F9C37
	for <loongarch@lists.linux.dev>; Thu, 23 Oct 2025 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210244; cv=none; b=frblicMdQIIff98wMn1O76gEeUhQuswYeLYDgK4JnDOmujw1Hd/90KPzpBbj+8pkDgDf+7wcpBHZxA1UWzYk+XE6rebOPpMDCuTz4iMM6Sze2577dSSm5+fxI5VETcK6AT3DSfoNe3eWNfBCIIvo+ybSYU1kuZ/TLWNDJSOJI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210244; c=relaxed/simple;
	bh=PFkHdeqKWBWNHtX7ClfEdNao8WapB20TpcHP9aN05os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYh3DvHLJDok52H4CIQv30XmL7+y5A1AGqtilrWifxCsJHUcGirOgqpTAWve9YzGiQa5I2eM18Elw2CnJep/mMYlSesnZYAQHq7XYcA/ZUZ0XntNkL3ASqOMKzOW4Uo2gWckbHo4Vl2ZYIayjhABeqq6d7cHHjIPardfMBfgKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8BxE9B97_lo864ZAA--.55001S3;
	Thu, 23 Oct 2025 17:03:57 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJCxocJ77_loER4DAQ--.41176S2;
	Thu, 23 Oct 2025 17:03:56 +0800 (CST)
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
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: [PATCH] gpio: loongson-64bit: Switch to dynamic allocate GPIO base in byte mode
Date: Thu, 23 Oct 2025 17:03:46 +0800
Message-ID: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocJ77_loER4DAQ--.41176S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEECGj5w5EEYQAAsp
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jr1rZw4UtFyUXF4rCF4rZwc_yoWkGwc_uF
	1IvF4rJryUAFnFva43Za4SkryIvr4ku3WFkFnIq393Xas0qwn8uryUur13Wry7Zr15Zryr
	u3y8uryxAr1fGosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

gpiolib want to get completely rid of static gpiobase allocation, so
switch to dynamic allocate GPIO base in byte mode, also can avoid
warning message:

[1.529974] gpio gpiochip0: Static allocation of GPIO base is deprecated,
use dynamic allocation.

Reported-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 02f181cb219e..d4e291b275f0 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -312,6 +312,7 @@ static int loongson_gpio_init(struct platform_device *pdev, struct loongson_gpio
 		lgpio->chip.gc.direction_output = loongson_gpio_direction_output;
 		lgpio->chip.gc.set = loongson_gpio_set;
 		lgpio->chip.gc.parent = &pdev->dev;
+		lgpio->chip.gc.base = -1;
 		spin_lock_init(&lgpio->lock);
 	}
 

base-commit: d5376026f9269601e239545e2ec4aea0cc62bf2a
-- 
2.47.3

