Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E2E1EEA55
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703765; cv=none; b=OSwYBphnJke6cqBPzKvEMVIZ9Oy96r97VvJwp0e8tnNI0iHFHW7VMcxMLgr5rOLYw4kmdn0veNXApVAxuz+mlGXMz6dTS+GAjXxIQNrS5ZOiJZYCpmUuoxrFMEe+EBdTg9SQKyCBFcazrlmZwrUa/vY+kdkJFNfGV9gCiP2QHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703765; c=relaxed/simple;
	bh=QL7Kpmsvg3N6pJriiqLI0HEO2QI3ovEP/gHHLRCzh4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LNNmQvTQENLTFc9p38NGB1lAiPzp/VW/N1RxueI8ji8/1Dlnvi0FTiRGiLzuee153TwIgIoyVcljCbuQm+PI+XVW7AAOwUyLbNct5WuAKgNWFJjgTWfCczYizk6WIIl3lpBJ18CzeaBaCUqInJVLzzhXwjr9IHZJYadBvCcMa1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8BxVNBSdwFpe9obAA--.60395S3;
	Wed, 29 Oct 2025 10:09:22 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJAx+8BRdwFp1rAXAQ--.27054S2;
	Wed, 29 Oct 2025 10:09:22 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 4/6] watchdog: loongson: Drop CONFIG_OF
Date: Wed, 29 Oct 2025 10:09:11 +0800
Message-ID: <20251029020913.1946321-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx+8BRdwFp1rAXAQ--.27054S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGkAWxIUrQAAsY
X-Coremail-Antispam: 1Uk129KBj9xXoWrKrW8Jr4xCr1rKry8Jw1rKrX_yoWkWrX_ua
	42qrZ3WFyrJrW3Xa4Yg3y5Ar92qas0qa45uF48KFs3Xa47tryYqrWkZF1DG3W7ZrWUJry3
	ur4kWrWSkry7XosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

The general recommendation is to not use of_match_ptr() or CONFIG_OF
ifdef.

Drop them.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/watchdog/loongson_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/loongson_wdt.c b/drivers/watchdog/loongson_wdt.c
index 3e0c3cac14f9..703c65952c7c 100644
--- a/drivers/watchdog/loongson_wdt.c
+++ b/drivers/watchdog/loongson_wdt.c
@@ -140,20 +140,18 @@ static int loongson_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &drvdata->wdt);
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id loongson_wdt_dt_ids[] = {
 	{ .compatible = "loongson,ls1b-wdt", },
 	{ .compatible = "loongson,ls1c-wdt", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, loongson_wdt_dt_ids);
-#endif
 
 static struct platform_driver loongson_wdt_driver = {
 	.probe = loongson_wdt_probe,
 	.driver = {
 		.name = "loongson-wdt",
-		.of_match_table = of_match_ptr(loongson_wdt_dt_ids),
+		.of_match_table = loongson_wdt_dt_ids,
 	},
 };
 
-- 
2.47.3

